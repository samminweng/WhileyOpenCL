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
  %0 = load i32, i32* %width.addr, align 4, !dbg !41
  %conv = sext i32 %0 to i64, !dbg !41
  %mul = mul i64 8, %conv, !dbg !42
  %1 = load i32, i32* %height.addr, align 4, !dbg !43
  %conv1 = sext i32 %1 to i64, !dbg !43
  %mul2 = mul i64 %mul, %conv1, !dbg !44
  %call = call noalias i8* @malloc(i64 %mul2) #5, !dbg !45
  %2 = bitcast i8* %call to i64*, !dbg !46
  store i64* %2, i64** %data, align 8, !dbg !40
  store i32 0, i32* %i, align 4, !dbg !47
  br label %for.cond, !dbg !49

for.cond:                                         ; preds = %for.inc9, %entry
  %3 = load i32, i32* %i, align 4, !dbg !50
  %4 = load i32, i32* %height.addr, align 4, !dbg !53
  %cmp = icmp slt i32 %3, %4, !dbg !54
  br i1 %cmp, label %for.body, label %for.end11, !dbg !55

for.body:                                         ; preds = %for.cond
  store i32 0, i32* %j, align 4, !dbg !56
  br label %for.cond4, !dbg !59

for.cond4:                                        ; preds = %for.inc, %for.body
  %5 = load i32, i32* %j, align 4, !dbg !60
  %6 = load i32, i32* %width.addr, align 4, !dbg !63
  %cmp5 = icmp slt i32 %5, %6, !dbg !64
  br i1 %cmp5, label %for.body7, label %for.end, !dbg !65

for.body7:                                        ; preds = %for.cond4
  %7 = load i32, i32* %i, align 4, !dbg !66
  %8 = load i32, i32* %width.addr, align 4, !dbg !68
  %mul8 = mul nsw i32 %7, %8, !dbg !69
  %9 = load i32, i32* %j, align 4, !dbg !70
  %add = add nsw i32 %mul8, %9, !dbg !71
  %idxprom = sext i32 %add to i64, !dbg !72
  %10 = load i64*, i64** %data, align 8, !dbg !72
  %arrayidx = getelementptr inbounds i64, i64* %10, i64 %idxprom, !dbg !72
  store i64 0, i64* %arrayidx, align 8, !dbg !73
  br label %for.inc, !dbg !74

for.inc:                                          ; preds = %for.body7
  %11 = load i32, i32* %j, align 4, !dbg !75
  %inc = add nsw i32 %11, 1, !dbg !75
  store i32 %inc, i32* %j, align 4, !dbg !75
  br label %for.cond4, !dbg !77

for.end:                                          ; preds = %for.cond4
  br label %for.inc9, !dbg !78

for.inc9:                                         ; preds = %for.end
  %12 = load i32, i32* %i, align 4, !dbg !79
  %inc10 = add nsw i32 %12, 1, !dbg !79
  store i32 %inc10, i32* %i, align 4, !dbg !79
  br label %for.cond, !dbg !81

for.end11:                                        ; preds = %for.cond
  store i32 0, i32* %i, align 4, !dbg !82
  br label %for.cond12, !dbg !84

for.cond12:                                       ; preds = %for.inc33, %for.end11
  %13 = load i32, i32* %i, align 4, !dbg !85
  %14 = load i32, i32* %height.addr, align 4, !dbg !88
  %cmp13 = icmp slt i32 %13, %14, !dbg !89
  br i1 %cmp13, label %for.body15, label %for.end35, !dbg !90

for.body15:                                       ; preds = %for.cond12
  store i32 0, i32* %j, align 4, !dbg !91
  br label %for.cond16, !dbg !94

for.cond16:                                       ; preds = %for.inc30, %for.body15
  %15 = load i32, i32* %j, align 4, !dbg !95
  %16 = load i32, i32* %width.addr, align 4, !dbg !98
  %cmp17 = icmp slt i32 %15, %16, !dbg !99
  br i1 %cmp17, label %for.body19, label %for.end32, !dbg !100

for.body19:                                       ; preds = %for.cond16
  %17 = load i32, i32* %i, align 4, !dbg !101
  %18 = load i32, i32* %width.addr, align 4, !dbg !103
  %mul20 = mul nsw i32 %17, %18, !dbg !104
  %19 = load i32, i32* %j, align 4, !dbg !105
  %add21 = add nsw i32 %mul20, %19, !dbg !106
  %idxprom22 = sext i32 %add21 to i64, !dbg !107
  %20 = load i64*, i64** %data, align 8, !dbg !107
  %arrayidx23 = getelementptr inbounds i64, i64* %20, i64 %idxprom22, !dbg !107
  %21 = load i64, i64* %arrayidx23, align 8, !dbg !107
  %22 = load i32, i32* %i, align 4, !dbg !108
  %conv24 = sext i32 %22 to i64, !dbg !108
  %add25 = add nsw i64 %21, %conv24, !dbg !109
  %23 = load i32, i32* %i, align 4, !dbg !110
  %24 = load i32, i32* %width.addr, align 4, !dbg !111
  %mul26 = mul nsw i32 %23, %24, !dbg !112
  %25 = load i32, i32* %j, align 4, !dbg !113
  %add27 = add nsw i32 %mul26, %25, !dbg !114
  %idxprom28 = sext i32 %add27 to i64, !dbg !115
  %26 = load i64*, i64** %data, align 8, !dbg !115
  %arrayidx29 = getelementptr inbounds i64, i64* %26, i64 %idxprom28, !dbg !115
  store i64 %add25, i64* %arrayidx29, align 8, !dbg !116
  br label %for.inc30, !dbg !117

for.inc30:                                        ; preds = %for.body19
  %27 = load i32, i32* %j, align 4, !dbg !118
  %inc31 = add nsw i32 %27, 1, !dbg !118
  store i32 %inc31, i32* %j, align 4, !dbg !118
  br label %for.cond16, !dbg !120

for.end32:                                        ; preds = %for.cond16
  br label %for.inc33, !dbg !121

for.inc33:                                        ; preds = %for.end32
  %28 = load i32, i32* %i, align 4, !dbg !122
  %inc34 = add nsw i32 %28, 1, !dbg !122
  store i32 %inc34, i32* %i, align 4, !dbg !122
  br label %for.cond12, !dbg !124

for.end35:                                        ; preds = %for.cond12
  call void @llvm.dbg.declare(metadata %struct.Matrix** %m, metadata !125, metadata !31), !dbg !126
  %call36 = call noalias i8* @malloc(i64 16) #5, !dbg !127
  %29 = bitcast i8* %call36 to %struct.Matrix*, !dbg !127
  store %struct.Matrix* %29, %struct.Matrix** %m, align 8, !dbg !126
  %30 = load i64*, i64** %data, align 8, !dbg !128
  %31 = load %struct.Matrix*, %struct.Matrix** %m, align 8, !dbg !129
  %data37 = getelementptr inbounds %struct.Matrix, %struct.Matrix* %31, i32 0, i32 0, !dbg !130
  store i64* %30, i64** %data37, align 8, !dbg !131
  %32 = load i32, i32* %width.addr, align 4, !dbg !132
  %33 = load %struct.Matrix*, %struct.Matrix** %m, align 8, !dbg !133
  %width38 = getelementptr inbounds %struct.Matrix, %struct.Matrix* %33, i32 0, i32 1, !dbg !134
  store i32 %32, i32* %width38, align 8, !dbg !135
  %34 = load i32, i32* %height.addr, align 4, !dbg !136
  %35 = load %struct.Matrix*, %struct.Matrix** %m, align 8, !dbg !137
  %height39 = getelementptr inbounds %struct.Matrix, %struct.Matrix* %35, i32 0, i32 2, !dbg !138
  store i32 %34, i32* %height39, align 4, !dbg !139
  %36 = load %struct.Matrix*, %struct.Matrix** %m, align 8, !dbg !140
  ret %struct.Matrix* %36, !dbg !141
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare noalias i8* @malloc(i64) #2

; Function Attrs: noinline nounwind uwtable
define %struct.Matrix* @mat_mult(%struct.Matrix* %a, %struct.Matrix* %b) #0 !dbg !18 {
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
  %8 = load i32, i32* %width, align 4, !dbg !170
  %conv = sext i32 %8 to i64, !dbg !170
  %mul = mul i64 8, %conv, !dbg !171
  %9 = load i32, i32* %height, align 4, !dbg !172
  %conv5 = sext i32 %9 to i64, !dbg !172
  %mul6 = mul i64 %mul, %conv5, !dbg !173
  %call = call noalias i8* @malloc(i64 %mul6) #5, !dbg !174
  %10 = bitcast i8* %call to i64*, !dbg !175
  store i64* %10, i64** %data4, align 8, !dbg !169
  store i32 0, i32* %i, align 4, !dbg !176
  br label %for.cond, !dbg !178

for.cond:                                         ; preds = %for.inc38, %entry
  %11 = load i32, i32* %i, align 4, !dbg !179
  %12 = load i32, i32* %width, align 4, !dbg !182
  %cmp = icmp slt i32 %11, %12, !dbg !183
  br i1 %cmp, label %for.body, label %for.end40, !dbg !184

for.body:                                         ; preds = %for.cond
  store i32 0, i32* %j, align 4, !dbg !185
  br label %for.cond8, !dbg !188

for.cond8:                                        ; preds = %for.inc35, %for.body
  %13 = load i32, i32* %j, align 4, !dbg !189
  %14 = load i32, i32* %height, align 4, !dbg !192
  %cmp9 = icmp slt i32 %13, %14, !dbg !193
  br i1 %cmp9, label %for.body11, label %for.end37, !dbg !194

for.body11:                                       ; preds = %for.cond8
  %15 = load i32, i32* %i, align 4, !dbg !195
  %16 = load i32, i32* %width, align 4, !dbg !197
  %mul12 = mul nsw i32 %15, %16, !dbg !198
  %17 = load i32, i32* %j, align 4, !dbg !199
  %add = add nsw i32 %mul12, %17, !dbg !200
  %idxprom = sext i32 %add to i64, !dbg !201
  %18 = load i64*, i64** %data4, align 8, !dbg !201
  %arrayidx = getelementptr inbounds i64, i64* %18, i64 %idxprom, !dbg !201
  store i64 0, i64* %arrayidx, align 8, !dbg !202
  store i32 0, i32* %k, align 4, !dbg !203
  br label %for.cond13, !dbg !205

for.cond13:                                       ; preds = %for.inc, %for.body11
  %19 = load i32, i32* %k, align 4, !dbg !206
  %20 = load i32, i32* %width, align 4, !dbg !209
  %cmp14 = icmp slt i32 %19, %20, !dbg !210
  br i1 %cmp14, label %for.body16, label %for.end, !dbg !211

for.body16:                                       ; preds = %for.cond13
  %21 = load i32, i32* %i, align 4, !dbg !212
  %22 = load i32, i32* %width, align 4, !dbg !213
  %mul17 = mul nsw i32 %21, %22, !dbg !214
  %23 = load i32, i32* %j, align 4, !dbg !215
  %add18 = add nsw i32 %mul17, %23, !dbg !216
  %idxprom19 = sext i32 %add18 to i64, !dbg !217
  %24 = load i64*, i64** %data4, align 8, !dbg !217
  %arrayidx20 = getelementptr inbounds i64, i64* %24, i64 %idxprom19, !dbg !217
  %25 = load i64, i64* %arrayidx20, align 8, !dbg !217
  %26 = load i32, i32* %i, align 4, !dbg !218
  %27 = load i32, i32* %width, align 4, !dbg !219
  %mul21 = mul nsw i32 %26, %27, !dbg !220
  %28 = load i32, i32* %k, align 4, !dbg !221
  %add22 = add nsw i32 %mul21, %28, !dbg !222
  %idxprom23 = sext i32 %add22 to i64, !dbg !223
  %29 = load i64*, i64** %a_data, align 8, !dbg !223
  %arrayidx24 = getelementptr inbounds i64, i64* %29, i64 %idxprom23, !dbg !223
  %30 = load i64, i64* %arrayidx24, align 8, !dbg !223
  %31 = load i32, i32* %k, align 4, !dbg !224
  %32 = load i32, i32* %width, align 4, !dbg !225
  %mul25 = mul nsw i32 %31, %32, !dbg !226
  %33 = load i32, i32* %j, align 4, !dbg !227
  %add26 = add nsw i32 %mul25, %33, !dbg !228
  %idxprom27 = sext i32 %add26 to i64, !dbg !229
  %34 = load i64*, i64** %b_data, align 8, !dbg !229
  %arrayidx28 = getelementptr inbounds i64, i64* %34, i64 %idxprom27, !dbg !229
  %35 = load i64, i64* %arrayidx28, align 8, !dbg !229
  %mul29 = mul nsw i64 %30, %35, !dbg !230
  %add30 = add nsw i64 %25, %mul29, !dbg !231
  %36 = load i32, i32* %i, align 4, !dbg !232
  %37 = load i32, i32* %width, align 4, !dbg !233
  %mul31 = mul nsw i32 %36, %37, !dbg !234
  %38 = load i32, i32* %j, align 4, !dbg !235
  %add32 = add nsw i32 %mul31, %38, !dbg !236
  %idxprom33 = sext i32 %add32 to i64, !dbg !237
  %39 = load i64*, i64** %data4, align 8, !dbg !237
  %arrayidx34 = getelementptr inbounds i64, i64* %39, i64 %idxprom33, !dbg !237
  store i64 %add30, i64* %arrayidx34, align 8, !dbg !238
  br label %for.inc, !dbg !237

for.inc:                                          ; preds = %for.body16
  %40 = load i32, i32* %k, align 4, !dbg !239
  %inc = add nsw i32 %40, 1, !dbg !239
  store i32 %inc, i32* %k, align 4, !dbg !239
  br label %for.cond13, !dbg !241

for.end:                                          ; preds = %for.cond13
  br label %for.inc35, !dbg !242

for.inc35:                                        ; preds = %for.end
  %41 = load i32, i32* %j, align 4, !dbg !243
  %inc36 = add nsw i32 %41, 1, !dbg !243
  store i32 %inc36, i32* %j, align 4, !dbg !243
  br label %for.cond8, !dbg !245

for.end37:                                        ; preds = %for.cond8
  br label %for.inc38, !dbg !246

for.inc38:                                        ; preds = %for.end37
  %42 = load i32, i32* %i, align 4, !dbg !247
  %inc39 = add nsw i32 %42, 1, !dbg !247
  store i32 %inc39, i32* %i, align 4, !dbg !247
  br label %for.cond, !dbg !249

for.end40:                                        ; preds = %for.cond
  call void @llvm.dbg.declare(metadata %struct.Matrix** %m, metadata !250, metadata !31), !dbg !251
  %call41 = call noalias i8* @malloc(i64 16) #5, !dbg !252
  %43 = bitcast i8* %call41 to %struct.Matrix*, !dbg !252
  store %struct.Matrix* %43, %struct.Matrix** %m, align 8, !dbg !251
  %44 = load i32, i32* %width, align 4, !dbg !253
  %45 = load %struct.Matrix*, %struct.Matrix** %m, align 8, !dbg !254
  %width42 = getelementptr inbounds %struct.Matrix, %struct.Matrix* %45, i32 0, i32 1, !dbg !255
  store i32 %44, i32* %width42, align 8, !dbg !256
  %46 = load i32, i32* %height, align 4, !dbg !257
  %47 = load %struct.Matrix*, %struct.Matrix** %m, align 8, !dbg !258
  %height43 = getelementptr inbounds %struct.Matrix, %struct.Matrix* %47, i32 0, i32 2, !dbg !259
  store i32 %46, i32* %height43, align 4, !dbg !260
  %48 = load i64*, i64** %data4, align 8, !dbg !261
  %49 = load %struct.Matrix*, %struct.Matrix** %m, align 8, !dbg !262
  %data44 = getelementptr inbounds %struct.Matrix, %struct.Matrix* %49, i32 0, i32 0, !dbg !263
  store i64* %48, i64** %data44, align 8, !dbg !264
  %50 = load %struct.Matrix*, %struct.Matrix** %m, align 8, !dbg !265
  ret %struct.Matrix* %50, !dbg !266
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
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !267, metadata !31), !dbg !268
  store i8** %args, i8*** %args.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %args.addr, metadata !269, metadata !31), !dbg !270
  call void @llvm.dbg.declare(metadata i32* %max, metadata !271, metadata !31), !dbg !272
  %0 = load i8**, i8*** %args.addr, align 8, !dbg !273
  %arrayidx = getelementptr inbounds i8*, i8** %0, i64 1, !dbg !273
  %1 = load i8*, i8** %arrayidx, align 8, !dbg !273
  %call = call i32 (i8*, i8*, ...) @__isoc99_sscanf(i8* %1, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str, i32 0, i32 0), i32* %max) #5, !dbg !274
  %2 = load i32, i32* %max, align 4, !dbg !275
  %call1 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.1, i32 0, i32 0), i32 %2), !dbg !276
  call void @llvm.dbg.declare(metadata %struct.Matrix** %a, metadata !277, metadata !31), !dbg !278
  %3 = load i32, i32* %max, align 4, !dbg !279
  %4 = load i32, i32* %max, align 4, !dbg !280
  %call2 = call %struct.Matrix* @init(i32 %3, i32 %4), !dbg !281
  store %struct.Matrix* %call2, %struct.Matrix** %a, align 8, !dbg !278
  call void @llvm.dbg.declare(metadata %struct.Matrix** %b, metadata !282, metadata !31), !dbg !283
  %5 = load i32, i32* %max, align 4, !dbg !284
  %6 = load i32, i32* %max, align 4, !dbg !285
  %call3 = call %struct.Matrix* @init(i32 %5, i32 %6), !dbg !286
  store %struct.Matrix* %call3, %struct.Matrix** %b, align 8, !dbg !283
  call void @llvm.dbg.declare(metadata %struct.Matrix** %c, metadata !287, metadata !31), !dbg !288
  %7 = load %struct.Matrix*, %struct.Matrix** %a, align 8, !dbg !289
  %8 = load %struct.Matrix*, %struct.Matrix** %b, align 8, !dbg !290
  %call4 = call %struct.Matrix* @mat_mult(%struct.Matrix* %7, %struct.Matrix* %8), !dbg !291
  store %struct.Matrix* %call4, %struct.Matrix** %c, align 8, !dbg !288
  %9 = load i32, i32* %max, align 4, !dbg !292
  %10 = load i32, i32* %max, align 4, !dbg !293
  %call5 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str.2, i32 0, i32 0), i32 %9, i32 %10), !dbg !294
  %11 = load i32, i32* %max, align 4, !dbg !295
  %sub = sub nsw i32 %11, 1, !dbg !296
  %12 = load i32, i32* %max, align 4, !dbg !297
  %13 = load i32, i32* %max, align 4, !dbg !298
  %sub6 = sub nsw i32 %13, 1, !dbg !299
  %14 = load i32, i32* %max, align 4, !dbg !300
  %sub7 = sub nsw i32 %14, 1, !dbg !301
  %15 = load i32, i32* %max, align 4, !dbg !302
  %mul = mul nsw i32 %sub7, %15, !dbg !303
  %16 = load i32, i32* %max, align 4, !dbg !304
  %add = add nsw i32 %mul, %16, !dbg !305
  %sub8 = sub nsw i32 %add, 1, !dbg !306
  %idxprom = sext i32 %sub8 to i64, !dbg !307
  %17 = load %struct.Matrix*, %struct.Matrix** %a, align 8, !dbg !307
  %data = getelementptr inbounds %struct.Matrix, %struct.Matrix* %17, i32 0, i32 0, !dbg !308
  %18 = load i64*, i64** %data, align 8, !dbg !308
  %arrayidx9 = getelementptr inbounds i64, i64* %18, i64 %idxprom, !dbg !307
  %19 = load i64, i64* %arrayidx9, align 8, !dbg !307
  %20 = load i32, i32* %max, align 4, !dbg !309
  %sub10 = sub nsw i32 %20, 1, !dbg !310
  %21 = load i32, i32* %max, align 4, !dbg !311
  %22 = load i32, i32* %max, align 4, !dbg !312
  %sub11 = sub nsw i32 %22, 1, !dbg !313
  %23 = load i32, i32* %max, align 4, !dbg !314
  %sub12 = sub nsw i32 %23, 1, !dbg !315
  %24 = load i32, i32* %max, align 4, !dbg !316
  %mul13 = mul nsw i32 %sub12, %24, !dbg !317
  %25 = load i32, i32* %max, align 4, !dbg !318
  %add14 = add nsw i32 %mul13, %25, !dbg !319
  %sub15 = sub nsw i32 %add14, 1, !dbg !320
  %idxprom16 = sext i32 %sub15 to i64, !dbg !321
  %26 = load %struct.Matrix*, %struct.Matrix** %b, align 8, !dbg !321
  %data17 = getelementptr inbounds %struct.Matrix, %struct.Matrix* %26, i32 0, i32 0, !dbg !322
  %27 = load i64*, i64** %data17, align 8, !dbg !322
  %arrayidx18 = getelementptr inbounds i64, i64* %27, i64 %idxprom16, !dbg !321
  %28 = load i64, i64* %arrayidx18, align 8, !dbg !321
  %29 = load i32, i32* %max, align 4, !dbg !323
  %sub19 = sub nsw i32 %29, 1, !dbg !324
  %30 = load i32, i32* %max, align 4, !dbg !325
  %31 = load i32, i32* %max, align 4, !dbg !326
  %sub20 = sub nsw i32 %31, 1, !dbg !327
  %32 = load i32, i32* %max, align 4, !dbg !328
  %sub21 = sub nsw i32 %32, 1, !dbg !329
  %33 = load i32, i32* %max, align 4, !dbg !330
  %mul22 = mul nsw i32 %sub21, %33, !dbg !331
  %34 = load i32, i32* %max, align 4, !dbg !332
  %add23 = add nsw i32 %mul22, %34, !dbg !333
  %sub24 = sub nsw i32 %add23, 1, !dbg !334
  %idxprom25 = sext i32 %sub24 to i64, !dbg !335
  %35 = load %struct.Matrix*, %struct.Matrix** %c, align 8, !dbg !335
  %data26 = getelementptr inbounds %struct.Matrix, %struct.Matrix* %35, i32 0, i32 0, !dbg !336
  %36 = load i64*, i64** %data26, align 8, !dbg !336
  %arrayidx27 = getelementptr inbounds i64, i64* %36, i64 %idxprom25, !dbg !335
  %37 = load i64, i64* %arrayidx27, align 8, !dbg !335
  %call28 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([59 x i8], [59 x i8]* @.str.3, i32 0, i32 0), i32 %sub, i32 %12, i32 %sub6, i64 %19, i32 %sub10, i32 %21, i32 %sub11, i64 %28, i32 %sub19, i32 %30, i32 %sub20, i64 %37), !dbg !337
  ret i32 0, !dbg !338
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
!1 = !DIFile(filename: "MatrixMult.c", directory: "/home/sam/workspace/WhileyOpenCL/polly/MatrixMult/impl/handwritten1")
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
!18 = distinct !DISubprogram(name: "mat_mult", scope: !1, file: !1, line: 47, type: !19, isLocal: false, isDefinition: true, scopeLine: 47, flags: DIFlagPrototyped, isOptimized: false, variables: !2)
!19 = !DISubroutineType(types: !20)
!20 = !{!10, !10, !10}
!21 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 71, type: !22, isLocal: false, isDefinition: true, scopeLine: 72, flags: DIFlagPrototyped, isOptimized: false, variables: !2)
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
!39 = !DILocalVariable(name: "data", scope: !7, file: !1, line: 25, type: !4)
!40 = !DILocation(line: 25, column: 16, scope: !7)
!41 = !DILocation(line: 25, column: 60, scope: !7)
!42 = !DILocation(line: 25, column: 59, scope: !7)
!43 = !DILocation(line: 25, column: 66, scope: !7)
!44 = !DILocation(line: 25, column: 65, scope: !7)
!45 = !DILocation(line: 25, column: 35, scope: !7)
!46 = !DILocation(line: 25, column: 23, scope: !7)
!47 = !DILocation(line: 27, column: 11, scope: !48)
!48 = distinct !DILexicalBlock(scope: !7, file: !1, line: 27, column: 5)
!49 = !DILocation(line: 27, column: 10, scope: !48)
!50 = !DILocation(line: 27, column: 15, scope: !51)
!51 = !DILexicalBlockFile(scope: !52, file: !1, discriminator: 1)
!52 = distinct !DILexicalBlock(scope: !48, file: !1, line: 27, column: 5)
!53 = !DILocation(line: 27, column: 17, scope: !51)
!54 = !DILocation(line: 27, column: 16, scope: !51)
!55 = !DILocation(line: 27, column: 5, scope: !51)
!56 = !DILocation(line: 28, column: 15, scope: !57)
!57 = distinct !DILexicalBlock(scope: !58, file: !1, line: 28, column: 9)
!58 = distinct !DILexicalBlock(scope: !52, file: !1, line: 27, column: 30)
!59 = !DILocation(line: 28, column: 14, scope: !57)
!60 = !DILocation(line: 28, column: 19, scope: !61)
!61 = !DILexicalBlockFile(scope: !62, file: !1, discriminator: 1)
!62 = distinct !DILexicalBlock(scope: !57, file: !1, line: 28, column: 9)
!63 = !DILocation(line: 28, column: 21, scope: !61)
!64 = !DILocation(line: 28, column: 20, scope: !61)
!65 = !DILocation(line: 28, column: 9, scope: !61)
!66 = !DILocation(line: 29, column: 18, scope: !67)
!67 = distinct !DILexicalBlock(scope: !62, file: !1, line: 28, column: 33)
!68 = !DILocation(line: 29, column: 20, scope: !67)
!69 = !DILocation(line: 29, column: 19, scope: !67)
!70 = !DILocation(line: 29, column: 26, scope: !67)
!71 = !DILocation(line: 29, column: 25, scope: !67)
!72 = !DILocation(line: 29, column: 13, scope: !67)
!73 = !DILocation(line: 29, column: 29, scope: !67)
!74 = !DILocation(line: 30, column: 9, scope: !67)
!75 = !DILocation(line: 28, column: 29, scope: !76)
!76 = !DILexicalBlockFile(scope: !62, file: !1, discriminator: 2)
!77 = !DILocation(line: 28, column: 9, scope: !76)
!78 = !DILocation(line: 31, column: 5, scope: !58)
!79 = !DILocation(line: 27, column: 26, scope: !80)
!80 = !DILexicalBlockFile(scope: !52, file: !1, discriminator: 2)
!81 = !DILocation(line: 27, column: 5, scope: !80)
!82 = !DILocation(line: 33, column: 11, scope: !83)
!83 = distinct !DILexicalBlock(scope: !7, file: !1, line: 33, column: 5)
!84 = !DILocation(line: 33, column: 10, scope: !83)
!85 = !DILocation(line: 33, column: 15, scope: !86)
!86 = !DILexicalBlockFile(scope: !87, file: !1, discriminator: 1)
!87 = distinct !DILexicalBlock(scope: !83, file: !1, line: 33, column: 5)
!88 = !DILocation(line: 33, column: 17, scope: !86)
!89 = !DILocation(line: 33, column: 16, scope: !86)
!90 = !DILocation(line: 33, column: 5, scope: !86)
!91 = !DILocation(line: 34, column: 15, scope: !92)
!92 = distinct !DILexicalBlock(scope: !93, file: !1, line: 34, column: 9)
!93 = distinct !DILexicalBlock(scope: !87, file: !1, line: 33, column: 30)
!94 = !DILocation(line: 34, column: 14, scope: !92)
!95 = !DILocation(line: 34, column: 19, scope: !96)
!96 = !DILexicalBlockFile(scope: !97, file: !1, discriminator: 1)
!97 = distinct !DILexicalBlock(scope: !92, file: !1, line: 34, column: 9)
!98 = !DILocation(line: 34, column: 21, scope: !96)
!99 = !DILocation(line: 34, column: 20, scope: !96)
!100 = !DILocation(line: 34, column: 9, scope: !96)
!101 = !DILocation(line: 35, column: 36, scope: !102)
!102 = distinct !DILexicalBlock(scope: !97, file: !1, line: 34, column: 33)
!103 = !DILocation(line: 35, column: 38, scope: !102)
!104 = !DILocation(line: 35, column: 37, scope: !102)
!105 = !DILocation(line: 35, column: 44, scope: !102)
!106 = !DILocation(line: 35, column: 43, scope: !102)
!107 = !DILocation(line: 35, column: 31, scope: !102)
!108 = !DILocation(line: 35, column: 49, scope: !102)
!109 = !DILocation(line: 35, column: 47, scope: !102)
!110 = !DILocation(line: 35, column: 18, scope: !102)
!111 = !DILocation(line: 35, column: 20, scope: !102)
!112 = !DILocation(line: 35, column: 19, scope: !102)
!113 = !DILocation(line: 35, column: 26, scope: !102)
!114 = !DILocation(line: 35, column: 25, scope: !102)
!115 = !DILocation(line: 35, column: 13, scope: !102)
!116 = !DILocation(line: 35, column: 29, scope: !102)
!117 = !DILocation(line: 36, column: 9, scope: !102)
!118 = !DILocation(line: 34, column: 29, scope: !119)
!119 = !DILexicalBlockFile(scope: !97, file: !1, discriminator: 2)
!120 = !DILocation(line: 34, column: 9, scope: !119)
!121 = !DILocation(line: 37, column: 5, scope: !93)
!122 = !DILocation(line: 33, column: 26, scope: !123)
!123 = !DILexicalBlockFile(scope: !87, file: !1, discriminator: 2)
!124 = !DILocation(line: 33, column: 5, scope: !123)
!125 = !DILocalVariable(name: "m", scope: !7, file: !1, line: 39, type: !10)
!126 = !DILocation(line: 39, column: 13, scope: !7)
!127 = !DILocation(line: 39, column: 17, scope: !7)
!128 = !DILocation(line: 40, column: 15, scope: !7)
!129 = !DILocation(line: 40, column: 5, scope: !7)
!130 = !DILocation(line: 40, column: 8, scope: !7)
!131 = !DILocation(line: 40, column: 13, scope: !7)
!132 = !DILocation(line: 41, column: 16, scope: !7)
!133 = !DILocation(line: 41, column: 5, scope: !7)
!134 = !DILocation(line: 41, column: 8, scope: !7)
!135 = !DILocation(line: 41, column: 14, scope: !7)
!136 = !DILocation(line: 42, column: 17, scope: !7)
!137 = !DILocation(line: 42, column: 5, scope: !7)
!138 = !DILocation(line: 42, column: 8, scope: !7)
!139 = !DILocation(line: 42, column: 15, scope: !7)
!140 = !DILocation(line: 44, column: 12, scope: !7)
!141 = !DILocation(line: 44, column: 5, scope: !7)
!142 = !DILocalVariable(name: "a", arg: 1, scope: !18, file: !1, line: 47, type: !10)
!143 = !DILocation(line: 47, column: 26, scope: !18)
!144 = !DILocalVariable(name: "b", arg: 2, scope: !18, file: !1, line: 47, type: !10)
!145 = !DILocation(line: 47, column: 37, scope: !18)
!146 = !DILocalVariable(name: "i", scope: !18, file: !1, line: 48, type: !16)
!147 = !DILocation(line: 48, column: 9, scope: !18)
!148 = !DILocalVariable(name: "j", scope: !18, file: !1, line: 48, type: !16)
!149 = !DILocation(line: 48, column: 12, scope: !18)
!150 = !DILocalVariable(name: "k", scope: !18, file: !1, line: 48, type: !16)
!151 = !DILocation(line: 48, column: 15, scope: !18)
!152 = !DILocalVariable(name: "width", scope: !18, file: !1, line: 49, type: !16)
!153 = !DILocation(line: 49, column: 9, scope: !18)
!154 = !DILocation(line: 49, column: 17, scope: !18)
!155 = !DILocation(line: 49, column: 20, scope: !18)
!156 = !DILocalVariable(name: "height", scope: !18, file: !1, line: 50, type: !16)
!157 = !DILocation(line: 50, column: 9, scope: !18)
!158 = !DILocation(line: 50, column: 18, scope: !18)
!159 = !DILocation(line: 50, column: 21, scope: !18)
!160 = !DILocalVariable(name: "a_data", scope: !18, file: !1, line: 51, type: !4)
!161 = !DILocation(line: 51, column: 16, scope: !18)
!162 = !DILocation(line: 51, column: 25, scope: !18)
!163 = !DILocation(line: 51, column: 28, scope: !18)
!164 = !DILocalVariable(name: "b_data", scope: !18, file: !1, line: 52, type: !4)
!165 = !DILocation(line: 52, column: 16, scope: !18)
!166 = !DILocation(line: 52, column: 25, scope: !18)
!167 = !DILocation(line: 52, column: 28, scope: !18)
!168 = !DILocalVariable(name: "data", scope: !18, file: !1, line: 53, type: !4)
!169 = !DILocation(line: 53, column: 16, scope: !18)
!170 = !DILocation(line: 53, column: 60, scope: !18)
!171 = !DILocation(line: 53, column: 59, scope: !18)
!172 = !DILocation(line: 53, column: 66, scope: !18)
!173 = !DILocation(line: 53, column: 65, scope: !18)
!174 = !DILocation(line: 53, column: 35, scope: !18)
!175 = !DILocation(line: 53, column: 23, scope: !18)
!176 = !DILocation(line: 55, column: 10, scope: !177)
!177 = distinct !DILexicalBlock(scope: !18, file: !1, line: 55, column: 5)
!178 = !DILocation(line: 55, column: 9, scope: !177)
!179 = !DILocation(line: 55, column: 14, scope: !180)
!180 = !DILexicalBlockFile(scope: !181, file: !1, discriminator: 1)
!181 = distinct !DILexicalBlock(scope: !177, file: !1, line: 55, column: 5)
!182 = !DILocation(line: 55, column: 16, scope: !180)
!183 = !DILocation(line: 55, column: 15, scope: !180)
!184 = !DILocation(line: 55, column: 5, scope: !180)
!185 = !DILocation(line: 56, column: 14, scope: !186)
!186 = distinct !DILexicalBlock(scope: !187, file: !1, line: 56, column: 9)
!187 = distinct !DILexicalBlock(scope: !181, file: !1, line: 55, column: 29)
!188 = !DILocation(line: 56, column: 13, scope: !186)
!189 = !DILocation(line: 56, column: 18, scope: !190)
!190 = !DILexicalBlockFile(scope: !191, file: !1, discriminator: 1)
!191 = distinct !DILexicalBlock(scope: !186, file: !1, line: 56, column: 9)
!192 = !DILocation(line: 56, column: 20, scope: !190)
!193 = !DILocation(line: 56, column: 19, scope: !190)
!194 = !DILocation(line: 56, column: 9, scope: !190)
!195 = !DILocation(line: 57, column: 18, scope: !196)
!196 = distinct !DILexicalBlock(scope: !191, file: !1, line: 56, column: 34)
!197 = !DILocation(line: 57, column: 20, scope: !196)
!198 = !DILocation(line: 57, column: 19, scope: !196)
!199 = !DILocation(line: 57, column: 26, scope: !196)
!200 = !DILocation(line: 57, column: 25, scope: !196)
!201 = !DILocation(line: 57, column: 13, scope: !196)
!202 = !DILocation(line: 57, column: 29, scope: !196)
!203 = !DILocation(line: 58, column: 18, scope: !204)
!204 = distinct !DILexicalBlock(scope: !196, file: !1, line: 58, column: 13)
!205 = !DILocation(line: 58, column: 17, scope: !204)
!206 = !DILocation(line: 58, column: 22, scope: !207)
!207 = !DILexicalBlockFile(scope: !208, file: !1, discriminator: 1)
!208 = distinct !DILexicalBlock(scope: !204, file: !1, line: 58, column: 13)
!209 = !DILocation(line: 58, column: 24, scope: !207)
!210 = !DILocation(line: 58, column: 23, scope: !207)
!211 = !DILocation(line: 58, column: 13, scope: !207)
!212 = !DILocation(line: 59, column: 40, scope: !208)
!213 = !DILocation(line: 59, column: 42, scope: !208)
!214 = !DILocation(line: 59, column: 41, scope: !208)
!215 = !DILocation(line: 59, column: 48, scope: !208)
!216 = !DILocation(line: 59, column: 47, scope: !208)
!217 = !DILocation(line: 59, column: 35, scope: !208)
!218 = !DILocation(line: 59, column: 60, scope: !208)
!219 = !DILocation(line: 59, column: 62, scope: !208)
!220 = !DILocation(line: 59, column: 61, scope: !208)
!221 = !DILocation(line: 59, column: 68, scope: !208)
!222 = !DILocation(line: 59, column: 67, scope: !208)
!223 = !DILocation(line: 59, column: 53, scope: !208)
!224 = !DILocation(line: 59, column: 80, scope: !208)
!225 = !DILocation(line: 59, column: 82, scope: !208)
!226 = !DILocation(line: 59, column: 81, scope: !208)
!227 = !DILocation(line: 59, column: 88, scope: !208)
!228 = !DILocation(line: 59, column: 87, scope: !208)
!229 = !DILocation(line: 59, column: 73, scope: !208)
!230 = !DILocation(line: 59, column: 71, scope: !208)
!231 = !DILocation(line: 59, column: 51, scope: !208)
!232 = !DILocation(line: 59, column: 22, scope: !208)
!233 = !DILocation(line: 59, column: 24, scope: !208)
!234 = !DILocation(line: 59, column: 23, scope: !208)
!235 = !DILocation(line: 59, column: 30, scope: !208)
!236 = !DILocation(line: 59, column: 29, scope: !208)
!237 = !DILocation(line: 59, column: 17, scope: !208)
!238 = !DILocation(line: 59, column: 33, scope: !208)
!239 = !DILocation(line: 58, column: 32, scope: !240)
!240 = !DILexicalBlockFile(scope: !208, file: !1, discriminator: 2)
!241 = !DILocation(line: 58, column: 13, scope: !240)
!242 = !DILocation(line: 60, column: 9, scope: !196)
!243 = !DILocation(line: 56, column: 29, scope: !244)
!244 = !DILexicalBlockFile(scope: !191, file: !1, discriminator: 2)
!245 = !DILocation(line: 56, column: 9, scope: !244)
!246 = !DILocation(line: 61, column: 5, scope: !187)
!247 = !DILocation(line: 55, column: 24, scope: !248)
!248 = !DILexicalBlockFile(scope: !181, file: !1, discriminator: 2)
!249 = !DILocation(line: 55, column: 5, scope: !248)
!250 = !DILocalVariable(name: "m", scope: !18, file: !1, line: 63, type: !10)
!251 = !DILocation(line: 63, column: 13, scope: !18)
!252 = !DILocation(line: 63, column: 17, scope: !18)
!253 = !DILocation(line: 64, column: 16, scope: !18)
!254 = !DILocation(line: 64, column: 5, scope: !18)
!255 = !DILocation(line: 64, column: 8, scope: !18)
!256 = !DILocation(line: 64, column: 14, scope: !18)
!257 = !DILocation(line: 65, column: 17, scope: !18)
!258 = !DILocation(line: 65, column: 5, scope: !18)
!259 = !DILocation(line: 65, column: 8, scope: !18)
!260 = !DILocation(line: 65, column: 15, scope: !18)
!261 = !DILocation(line: 66, column: 15, scope: !18)
!262 = !DILocation(line: 66, column: 5, scope: !18)
!263 = !DILocation(line: 66, column: 8, scope: !18)
!264 = !DILocation(line: 66, column: 13, scope: !18)
!265 = !DILocation(line: 67, column: 12, scope: !18)
!266 = !DILocation(line: 67, column: 5, scope: !18)
!267 = !DILocalVariable(name: "argc", arg: 1, scope: !21, file: !1, line: 71, type: !16)
!268 = !DILocation(line: 71, column: 14, scope: !21)
!269 = !DILocalVariable(name: "args", arg: 2, scope: !21, file: !1, line: 71, type: !24)
!270 = !DILocation(line: 71, column: 27, scope: !21)
!271 = !DILocalVariable(name: "max", scope: !21, file: !1, line: 74, type: !16)
!272 = !DILocation(line: 74, column: 9, scope: !21)
!273 = !DILocation(line: 75, column: 12, scope: !21)
!274 = !DILocation(line: 75, column: 5, scope: !21)
!275 = !DILocation(line: 76, column: 24, scope: !21)
!276 = !DILocation(line: 76, column: 5, scope: !21)
!277 = !DILocalVariable(name: "a", scope: !21, file: !1, line: 78, type: !10)
!278 = !DILocation(line: 78, column: 13, scope: !21)
!279 = !DILocation(line: 78, column: 22, scope: !21)
!280 = !DILocation(line: 78, column: 27, scope: !21)
!281 = !DILocation(line: 78, column: 17, scope: !21)
!282 = !DILocalVariable(name: "b", scope: !21, file: !1, line: 79, type: !10)
!283 = !DILocation(line: 79, column: 13, scope: !21)
!284 = !DILocation(line: 79, column: 22, scope: !21)
!285 = !DILocation(line: 79, column: 27, scope: !21)
!286 = !DILocation(line: 79, column: 17, scope: !21)
!287 = !DILocalVariable(name: "c", scope: !21, file: !1, line: 81, type: !10)
!288 = !DILocation(line: 81, column: 13, scope: !21)
!289 = !DILocation(line: 81, column: 26, scope: !21)
!290 = !DILocation(line: 81, column: 29, scope: !21)
!291 = !DILocation(line: 81, column: 17, scope: !21)
!292 = !DILocation(line: 83, column: 48, scope: !21)
!293 = !DILocation(line: 83, column: 53, scope: !21)
!294 = !DILocation(line: 83, column: 5, scope: !21)
!295 = !DILocation(line: 85, column: 9, scope: !21)
!296 = !DILocation(line: 85, column: 12, scope: !21)
!297 = !DILocation(line: 85, column: 16, scope: !21)
!298 = !DILocation(line: 85, column: 21, scope: !21)
!299 = !DILocation(line: 85, column: 24, scope: !21)
!300 = !DILocation(line: 85, column: 37, scope: !21)
!301 = !DILocation(line: 85, column: 40, scope: !21)
!302 = !DILocation(line: 85, column: 44, scope: !21)
!303 = !DILocation(line: 85, column: 43, scope: !21)
!304 = !DILocation(line: 85, column: 48, scope: !21)
!305 = !DILocation(line: 85, column: 47, scope: !21)
!306 = !DILocation(line: 85, column: 51, scope: !21)
!307 = !DILocation(line: 85, column: 28, scope: !21)
!308 = !DILocation(line: 85, column: 31, scope: !21)
!309 = !DILocation(line: 86, column: 9, scope: !21)
!310 = !DILocation(line: 86, column: 12, scope: !21)
!311 = !DILocation(line: 86, column: 16, scope: !21)
!312 = !DILocation(line: 86, column: 21, scope: !21)
!313 = !DILocation(line: 86, column: 24, scope: !21)
!314 = !DILocation(line: 86, column: 37, scope: !21)
!315 = !DILocation(line: 86, column: 40, scope: !21)
!316 = !DILocation(line: 86, column: 44, scope: !21)
!317 = !DILocation(line: 86, column: 43, scope: !21)
!318 = !DILocation(line: 86, column: 48, scope: !21)
!319 = !DILocation(line: 86, column: 47, scope: !21)
!320 = !DILocation(line: 86, column: 51, scope: !21)
!321 = !DILocation(line: 86, column: 28, scope: !21)
!322 = !DILocation(line: 86, column: 31, scope: !21)
!323 = !DILocation(line: 87, column: 9, scope: !21)
!324 = !DILocation(line: 87, column: 12, scope: !21)
!325 = !DILocation(line: 87, column: 16, scope: !21)
!326 = !DILocation(line: 87, column: 21, scope: !21)
!327 = !DILocation(line: 87, column: 24, scope: !21)
!328 = !DILocation(line: 87, column: 37, scope: !21)
!329 = !DILocation(line: 87, column: 40, scope: !21)
!330 = !DILocation(line: 87, column: 44, scope: !21)
!331 = !DILocation(line: 87, column: 43, scope: !21)
!332 = !DILocation(line: 87, column: 48, scope: !21)
!333 = !DILocation(line: 87, column: 47, scope: !21)
!334 = !DILocation(line: 87, column: 51, scope: !21)
!335 = !DILocation(line: 87, column: 28, scope: !21)
!336 = !DILocation(line: 87, column: 31, scope: !21)
!337 = !DILocation(line: 84, column: 5, scope: !21)
!338 = !DILocation(line: 88, column: 5, scope: !21)
