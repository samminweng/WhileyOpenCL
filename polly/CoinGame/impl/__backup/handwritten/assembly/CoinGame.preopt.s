; ModuleID = 'CoinGame.c'
source_filename = "CoinGame.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@V = global [6 x i32] [i32 6, i32 5, i32 2, i32 7, i32 3, i32 5], align 16
@sum_alice = global i32 0, align 4
@sum_bob = global i32 0, align 4
@.str = private unnamed_addr constant [22 x i8] c"Number of coins = %d\0A\00", align 1
@M = common global [6 x [6 x i32]] zeroinitializer, align 16
@coins = common global [6 x i32] zeroinitializer, align 16
@.str.1 = private unnamed_addr constant [17 x i8] c"Alice take coin \00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"Bob take coin \00", align 1
@.str.3 = private unnamed_addr constant [10 x i8] c"(%d, $%d)\00", align 1
@.str.4 = private unnamed_addr constant [3 x i8] c", \00", align 1
@.str.5 = private unnamed_addr constant [3 x i8] c".\0A\00", align 1
@Y = common global [6 x [6 x i32]] zeroinitializer, align 16
@X = common global [6 x [6 x i32]] zeroinitializer, align 16
@Z = common global [6 x [6 x i32]] zeroinitializer, align 16
@.str.6 = private unnamed_addr constant [24 x i8] c"Alice's sum is Wrong!!!\00", align 1
@.str.7 = private unnamed_addr constant [28 x i8] c"Alice's sum <= Bob's sum!!!\00", align 1
@.str.8 = private unnamed_addr constant [54 x i8] c"\0AThe total amount of money (maximum) Alice get is %d.\00", align 1
@.str.9 = private unnamed_addr constant [52 x i8] c"\0AThe total amount of money (maximum) Bob get is %d.\00", align 1

; Function Attrs: nounwind uwtable
define void @init() #0 !dbg !4 {
entry:
  %i = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %i, metadata !30, metadata !31), !dbg !32
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str, i32 0, i32 0), i32 6), !dbg !33
  store i32 0, i32* %i, align 4, !dbg !34
  br label %for.cond, !dbg !36

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, i32* %i, align 4, !dbg !37
  %cmp = icmp slt i32 %0, 6, !dbg !40
  br i1 %cmp, label %for.body, label %for.end, !dbg !41

for.body:                                         ; preds = %for.cond
  %1 = load i32, i32* %i, align 4, !dbg !42
  %2 = load i32, i32* %i, align 4, !dbg !44
  %idxprom = sext i32 %2 to i64, !dbg !45
  %arrayidx = getelementptr inbounds [6 x i32], [6 x i32]* @V, i64 0, i64 %idxprom, !dbg !45
  store i32 %1, i32* %arrayidx, align 4, !dbg !46
  br label %for.inc, !dbg !47

for.inc:                                          ; preds = %for.body
  %3 = load i32, i32* %i, align 4, !dbg !48
  %inc = add nsw i32 %3, 1, !dbg !48
  store i32 %inc, i32* %i, align 4, !dbg !48
  br label %for.cond, !dbg !50

for.end:                                          ; preds = %for.cond
  ret void, !dbg !51
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare i32 @printf(i8*, ...) #2

; Function Attrs: nounwind uwtable
define void @play() #0 !dbg !7 {
entry:
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %index = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %i, metadata !52, metadata !31), !dbg !53
  store i32 0, i32* %i, align 4, !dbg !53
  call void @llvm.dbg.declare(metadata i32* %j, metadata !54, metadata !31), !dbg !55
  store i32 5, i32* %j, align 4, !dbg !55
  call void @llvm.dbg.declare(metadata i32* %index, metadata !56, metadata !31), !dbg !57
  store i32 0, i32* %index, align 4, !dbg !58
  br label %for.cond, !dbg !60

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, i32* %index, align 4, !dbg !61
  %cmp = icmp slt i32 %0, 6, !dbg !64
  br i1 %cmp, label %for.body, label %for.end, !dbg !65

for.body:                                         ; preds = %for.cond
  %1 = load i32, i32* %j, align 4, !dbg !66
  %idxprom = sext i32 %1 to i64, !dbg !69
  %2 = load i32, i32* %i, align 4, !dbg !70
  %add = add nsw i32 %2, 1, !dbg !71
  %idxprom1 = sext i32 %add to i64, !dbg !69
  %arrayidx = getelementptr inbounds [6 x [6 x i32]], [6 x [6 x i32]]* @M, i64 0, i64 %idxprom1, !dbg !69
  %arrayidx2 = getelementptr inbounds [6 x i32], [6 x i32]* %arrayidx, i64 0, i64 %idxprom, !dbg !69
  %3 = load i32, i32* %arrayidx2, align 4, !dbg !69
  %4 = load i32, i32* %j, align 4, !dbg !72
  %sub = sub nsw i32 %4, 1, !dbg !73
  %idxprom3 = sext i32 %sub to i64, !dbg !74
  %5 = load i32, i32* %i, align 4, !dbg !75
  %idxprom4 = sext i32 %5 to i64, !dbg !74
  %arrayidx5 = getelementptr inbounds [6 x [6 x i32]], [6 x [6 x i32]]* @M, i64 0, i64 %idxprom4, !dbg !74
  %arrayidx6 = getelementptr inbounds [6 x i32], [6 x i32]* %arrayidx5, i64 0, i64 %idxprom3, !dbg !74
  %6 = load i32, i32* %arrayidx6, align 4, !dbg !74
  %cmp7 = icmp sle i32 %3, %6, !dbg !76
  br i1 %cmp7, label %if.then, label %if.else, !dbg !77

if.then:                                          ; preds = %for.body
  %7 = load i32, i32* %i, align 4, !dbg !78
  %idxprom8 = sext i32 %7 to i64, !dbg !80
  %arrayidx9 = getelementptr inbounds [6 x i32], [6 x i32]* @V, i64 0, i64 %idxprom8, !dbg !80
  %8 = load i32, i32* %arrayidx9, align 4, !dbg !80
  %9 = load i32, i32* %index, align 4, !dbg !81
  %idxprom10 = sext i32 %9 to i64, !dbg !82
  %arrayidx11 = getelementptr inbounds [6 x i32], [6 x i32]* @coins, i64 0, i64 %idxprom10, !dbg !82
  store i32 %8, i32* %arrayidx11, align 4, !dbg !83
  %10 = load i32, i32* %i, align 4, !dbg !84
  %inc = add nsw i32 %10, 1, !dbg !84
  store i32 %inc, i32* %i, align 4, !dbg !84
  br label %if.end, !dbg !85

if.else:                                          ; preds = %for.body
  %11 = load i32, i32* %j, align 4, !dbg !86
  %idxprom12 = sext i32 %11 to i64, !dbg !88
  %arrayidx13 = getelementptr inbounds [6 x i32], [6 x i32]* @V, i64 0, i64 %idxprom12, !dbg !88
  %12 = load i32, i32* %arrayidx13, align 4, !dbg !88
  %13 = load i32, i32* %index, align 4, !dbg !89
  %idxprom14 = sext i32 %13 to i64, !dbg !90
  %arrayidx15 = getelementptr inbounds [6 x i32], [6 x i32]* @coins, i64 0, i64 %idxprom14, !dbg !90
  store i32 %12, i32* %arrayidx15, align 4, !dbg !91
  %14 = load i32, i32* %j, align 4, !dbg !92
  %dec = add nsw i32 %14, -1, !dbg !92
  store i32 %dec, i32* %j, align 4, !dbg !92
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  br label %for.inc, !dbg !93

for.inc:                                          ; preds = %if.end
  %15 = load i32, i32* %index, align 4, !dbg !94
  %inc16 = add nsw i32 %15, 1, !dbg !94
  store i32 %inc16, i32* %index, align 4, !dbg !94
  br label %for.cond, !dbg !96

for.end:                                          ; preds = %for.cond
  store i32 0, i32* %i, align 4, !dbg !97
  br label %for.cond17, !dbg !99

for.cond17:                                       ; preds = %for.inc42, %for.end
  %16 = load i32, i32* %i, align 4, !dbg !100
  %cmp18 = icmp slt i32 %16, 6, !dbg !103
  br i1 %cmp18, label %for.body19, label %for.end44, !dbg !104

for.body19:                                       ; preds = %for.cond17
  %17 = load i32, i32* %i, align 4, !dbg !105
  %rem = srem i32 %17, 2, !dbg !108
  %cmp20 = icmp eq i32 %rem, 0, !dbg !109
  br i1 %cmp20, label %if.then21, label %if.else22, !dbg !110

if.then21:                                        ; preds = %for.body19
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.1, i32 0, i32 0)), !dbg !111
  br label %if.end24, !dbg !113

if.else22:                                        ; preds = %for.body19
  %call23 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i32 0, i32 0)), !dbg !114
  br label %if.end24

if.end24:                                         ; preds = %if.else22, %if.then21
  %18 = load i32, i32* %i, align 4, !dbg !116
  %add25 = add nsw i32 %18, 1, !dbg !117
  %19 = load i32, i32* %i, align 4, !dbg !118
  %idxprom26 = sext i32 %19 to i64, !dbg !119
  %arrayidx27 = getelementptr inbounds [6 x i32], [6 x i32]* @coins, i64 0, i64 %idxprom26, !dbg !119
  %20 = load i32, i32* %arrayidx27, align 4, !dbg !119
  %call28 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.3, i32 0, i32 0), i32 %add25, i32 %20), !dbg !120
  %21 = load i32, i32* %i, align 4, !dbg !121
  %rem29 = srem i32 %21, 2, !dbg !123
  %cmp30 = icmp eq i32 %rem29, 0, !dbg !124
  br i1 %cmp30, label %if.then31, label %if.else36, !dbg !125

if.then31:                                        ; preds = %if.end24
  %22 = load i32, i32* %i, align 4, !dbg !126
  %idxprom32 = sext i32 %22 to i64, !dbg !128
  %arrayidx33 = getelementptr inbounds [6 x i32], [6 x i32]* @coins, i64 0, i64 %idxprom32, !dbg !128
  %23 = load i32, i32* %arrayidx33, align 4, !dbg !128
  %24 = load i32, i32* @sum_alice, align 4, !dbg !129
  %add34 = add nsw i32 %24, %23, !dbg !129
  store i32 %add34, i32* @sum_alice, align 4, !dbg !129
  %call35 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.4, i32 0, i32 0)), !dbg !130
  br label %if.end41, !dbg !131

if.else36:                                        ; preds = %if.end24
  %25 = load i32, i32* %i, align 4, !dbg !132
  %idxprom37 = sext i32 %25 to i64, !dbg !134
  %arrayidx38 = getelementptr inbounds [6 x i32], [6 x i32]* @coins, i64 0, i64 %idxprom37, !dbg !134
  %26 = load i32, i32* %arrayidx38, align 4, !dbg !134
  %27 = load i32, i32* @sum_bob, align 4, !dbg !135
  %add39 = add nsw i32 %27, %26, !dbg !135
  store i32 %add39, i32* @sum_bob, align 4, !dbg !135
  %call40 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.5, i32 0, i32 0)), !dbg !136
  br label %if.end41

if.end41:                                         ; preds = %if.else36, %if.then31
  br label %for.inc42, !dbg !137

for.inc42:                                        ; preds = %if.end41
  %28 = load i32, i32* %i, align 4, !dbg !138
  %inc43 = add nsw i32 %28, 1, !dbg !138
  store i32 %inc43, i32* %i, align 4, !dbg !138
  br label %for.cond17, !dbg !140

for.end44:                                        ; preds = %for.cond17
  ret void, !dbg !141
}

; Function Attrs: nounwind uwtable
define i32 @findMoves() #0 !dbg !8 {
entry:
  %s = alloca i32, align 4
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %s, metadata !142, metadata !31), !dbg !143
  call void @llvm.dbg.declare(metadata i32* %i, metadata !144, metadata !31), !dbg !145
  call void @llvm.dbg.declare(metadata i32* %j, metadata !146, metadata !31), !dbg !147
  store i32 0, i32* %s, align 4, !dbg !148
  br label %for.cond, !dbg !150

for.cond:                                         ; preds = %for.inc137, %entry
  %0 = load i32, i32* %s, align 4, !dbg !151
  %cmp = icmp slt i32 %0, 6, !dbg !154
  br i1 %cmp, label %for.body, label %for.end139, !dbg !155

for.body:                                         ; preds = %for.cond
  store i32 0, i32* %i, align 4, !dbg !156
  %1 = load i32, i32* %s, align 4, !dbg !159
  store i32 %1, i32* %j, align 4, !dbg !160
  br label %for.cond1, !dbg !161

for.cond1:                                        ; preds = %for.inc, %for.body
  %2 = load i32, i32* %j, align 4, !dbg !162
  %cmp2 = icmp slt i32 %2, 6, !dbg !165
  br i1 %cmp2, label %for.body3, label %for.end, !dbg !166

for.body3:                                        ; preds = %for.cond1
  %3 = load i32, i32* %j, align 4, !dbg !167
  %idxprom = sext i32 %3 to i64, !dbg !169
  %4 = load i32, i32* %i, align 4, !dbg !170
  %idxprom4 = sext i32 %4 to i64, !dbg !169
  %arrayidx = getelementptr inbounds [6 x [6 x i32]], [6 x [6 x i32]]* @Y, i64 0, i64 %idxprom4, !dbg !169
  %arrayidx5 = getelementptr inbounds [6 x i32], [6 x i32]* %arrayidx, i64 0, i64 %idxprom, !dbg !169
  store i32 0, i32* %arrayidx5, align 4, !dbg !171
  %5 = load i32, i32* %i, align 4, !dbg !172
  %add = add nsw i32 %5, 1, !dbg !174
  %cmp6 = icmp slt i32 %add, 6, !dbg !175
  br i1 %cmp6, label %land.lhs.true, label %if.end, !dbg !176

land.lhs.true:                                    ; preds = %for.body3
  %6 = load i32, i32* %j, align 4, !dbg !177
  %sub = sub nsw i32 %6, 1, !dbg !179
  %cmp7 = icmp sge i32 %sub, 0, !dbg !180
  br i1 %cmp7, label %if.then, label %if.end, !dbg !181

if.then:                                          ; preds = %land.lhs.true
  %7 = load i32, i32* %j, align 4, !dbg !182
  %sub8 = sub nsw i32 %7, 1, !dbg !184
  %idxprom9 = sext i32 %sub8 to i64, !dbg !185
  %8 = load i32, i32* %i, align 4, !dbg !186
  %add10 = add nsw i32 %8, 1, !dbg !187
  %idxprom11 = sext i32 %add10 to i64, !dbg !185
  %arrayidx12 = getelementptr inbounds [6 x [6 x i32]], [6 x [6 x i32]]* @M, i64 0, i64 %idxprom11, !dbg !185
  %arrayidx13 = getelementptr inbounds [6 x i32], [6 x i32]* %arrayidx12, i64 0, i64 %idxprom9, !dbg !185
  %9 = load i32, i32* %arrayidx13, align 4, !dbg !185
  %10 = load i32, i32* %j, align 4, !dbg !188
  %idxprom14 = sext i32 %10 to i64, !dbg !189
  %11 = load i32, i32* %i, align 4, !dbg !190
  %idxprom15 = sext i32 %11 to i64, !dbg !189
  %arrayidx16 = getelementptr inbounds [6 x [6 x i32]], [6 x [6 x i32]]* @Y, i64 0, i64 %idxprom15, !dbg !189
  %arrayidx17 = getelementptr inbounds [6 x i32], [6 x i32]* %arrayidx16, i64 0, i64 %idxprom14, !dbg !189
  store i32 %9, i32* %arrayidx17, align 4, !dbg !191
  br label %if.end, !dbg !192

if.end:                                           ; preds = %if.then, %land.lhs.true, %for.body3
  %12 = load i32, i32* %j, align 4, !dbg !193
  %idxprom18 = sext i32 %12 to i64, !dbg !194
  %13 = load i32, i32* %i, align 4, !dbg !195
  %idxprom19 = sext i32 %13 to i64, !dbg !194
  %arrayidx20 = getelementptr inbounds [6 x [6 x i32]], [6 x [6 x i32]]* @X, i64 0, i64 %idxprom19, !dbg !194
  %arrayidx21 = getelementptr inbounds [6 x i32], [6 x i32]* %arrayidx20, i64 0, i64 %idxprom18, !dbg !194
  store i32 0, i32* %arrayidx21, align 4, !dbg !196
  %14 = load i32, i32* %i, align 4, !dbg !197
  %add22 = add nsw i32 %14, 2, !dbg !199
  %cmp23 = icmp slt i32 %add22, 6, !dbg !200
  br i1 %cmp23, label %if.then24, label %if.end53, !dbg !201

if.then24:                                        ; preds = %if.end
  %15 = load i32, i32* %j, align 4, !dbg !202
  %idxprom25 = sext i32 %15 to i64, !dbg !204
  %16 = load i32, i32* %i, align 4, !dbg !205
  %add26 = add nsw i32 %16, 2, !dbg !206
  %idxprom27 = sext i32 %add26 to i64, !dbg !204
  %arrayidx28 = getelementptr inbounds [6 x [6 x i32]], [6 x [6 x i32]]* @M, i64 0, i64 %idxprom27, !dbg !204
  %arrayidx29 = getelementptr inbounds [6 x i32], [6 x i32]* %arrayidx28, i64 0, i64 %idxprom25, !dbg !204
  %17 = load i32, i32* %arrayidx29, align 4, !dbg !204
  %18 = load i32, i32* %j, align 4, !dbg !207
  %idxprom30 = sext i32 %18 to i64, !dbg !208
  %19 = load i32, i32* %i, align 4, !dbg !209
  %idxprom31 = sext i32 %19 to i64, !dbg !208
  %arrayidx32 = getelementptr inbounds [6 x [6 x i32]], [6 x [6 x i32]]* @X, i64 0, i64 %idxprom31, !dbg !208
  %arrayidx33 = getelementptr inbounds [6 x i32], [6 x i32]* %arrayidx32, i64 0, i64 %idxprom30, !dbg !208
  store i32 %17, i32* %arrayidx33, align 4, !dbg !210
  %20 = load i32, i32* %j, align 4, !dbg !211
  %idxprom34 = sext i32 %20 to i64, !dbg !213
  %21 = load i32, i32* %i, align 4, !dbg !214
  %idxprom35 = sext i32 %21 to i64, !dbg !213
  %arrayidx36 = getelementptr inbounds [6 x [6 x i32]], [6 x [6 x i32]]* @X, i64 0, i64 %idxprom35, !dbg !213
  %arrayidx37 = getelementptr inbounds [6 x i32], [6 x i32]* %arrayidx36, i64 0, i64 %idxprom34, !dbg !213
  %22 = load i32, i32* %arrayidx37, align 4, !dbg !213
  %23 = load i32, i32* %j, align 4, !dbg !215
  %idxprom38 = sext i32 %23 to i64, !dbg !216
  %24 = load i32, i32* %i, align 4, !dbg !217
  %idxprom39 = sext i32 %24 to i64, !dbg !216
  %arrayidx40 = getelementptr inbounds [6 x [6 x i32]], [6 x [6 x i32]]* @Y, i64 0, i64 %idxprom39, !dbg !216
  %arrayidx41 = getelementptr inbounds [6 x i32], [6 x i32]* %arrayidx40, i64 0, i64 %idxprom38, !dbg !216
  %25 = load i32, i32* %arrayidx41, align 4, !dbg !216
  %cmp42 = icmp sgt i32 %22, %25, !dbg !218
  br i1 %cmp42, label %if.then43, label %if.end52, !dbg !219

if.then43:                                        ; preds = %if.then24
  %26 = load i32, i32* %j, align 4, !dbg !220
  %idxprom44 = sext i32 %26 to i64, !dbg !222
  %27 = load i32, i32* %i, align 4, !dbg !223
  %idxprom45 = sext i32 %27 to i64, !dbg !222
  %arrayidx46 = getelementptr inbounds [6 x [6 x i32]], [6 x [6 x i32]]* @Y, i64 0, i64 %idxprom45, !dbg !222
  %arrayidx47 = getelementptr inbounds [6 x i32], [6 x i32]* %arrayidx46, i64 0, i64 %idxprom44, !dbg !222
  %28 = load i32, i32* %arrayidx47, align 4, !dbg !222
  %29 = load i32, i32* %j, align 4, !dbg !224
  %idxprom48 = sext i32 %29 to i64, !dbg !225
  %30 = load i32, i32* %i, align 4, !dbg !226
  %idxprom49 = sext i32 %30 to i64, !dbg !225
  %arrayidx50 = getelementptr inbounds [6 x [6 x i32]], [6 x [6 x i32]]* @X, i64 0, i64 %idxprom49, !dbg !225
  %arrayidx51 = getelementptr inbounds [6 x i32], [6 x i32]* %arrayidx50, i64 0, i64 %idxprom48, !dbg !225
  store i32 %28, i32* %arrayidx51, align 4, !dbg !227
  br label %if.end52, !dbg !228

if.end52:                                         ; preds = %if.then43, %if.then24
  br label %if.end53, !dbg !229

if.end53:                                         ; preds = %if.end52, %if.end
  %31 = load i32, i32* %j, align 4, !dbg !230
  %idxprom54 = sext i32 %31 to i64, !dbg !231
  %32 = load i32, i32* %i, align 4, !dbg !232
  %idxprom55 = sext i32 %32 to i64, !dbg !231
  %arrayidx56 = getelementptr inbounds [6 x [6 x i32]], [6 x [6 x i32]]* @Z, i64 0, i64 %idxprom55, !dbg !231
  %arrayidx57 = getelementptr inbounds [6 x i32], [6 x i32]* %arrayidx56, i64 0, i64 %idxprom54, !dbg !231
  store i32 0, i32* %arrayidx57, align 4, !dbg !233
  %33 = load i32, i32* %j, align 4, !dbg !234
  %sub58 = sub nsw i32 %33, 1, !dbg !236
  %cmp59 = icmp sgt i32 %sub58, 0, !dbg !237
  br i1 %cmp59, label %if.then60, label %if.end89, !dbg !238

if.then60:                                        ; preds = %if.end53
  %34 = load i32, i32* %j, align 4, !dbg !239
  %sub61 = sub nsw i32 %34, 2, !dbg !241
  %idxprom62 = sext i32 %sub61 to i64, !dbg !242
  %35 = load i32, i32* %i, align 4, !dbg !243
  %idxprom63 = sext i32 %35 to i64, !dbg !242
  %arrayidx64 = getelementptr inbounds [6 x [6 x i32]], [6 x [6 x i32]]* @M, i64 0, i64 %idxprom63, !dbg !242
  %arrayidx65 = getelementptr inbounds [6 x i32], [6 x i32]* %arrayidx64, i64 0, i64 %idxprom62, !dbg !242
  %36 = load i32, i32* %arrayidx65, align 4, !dbg !242
  %37 = load i32, i32* %j, align 4, !dbg !244
  %idxprom66 = sext i32 %37 to i64, !dbg !245
  %38 = load i32, i32* %i, align 4, !dbg !246
  %idxprom67 = sext i32 %38 to i64, !dbg !245
  %arrayidx68 = getelementptr inbounds [6 x [6 x i32]], [6 x [6 x i32]]* @Z, i64 0, i64 %idxprom67, !dbg !245
  %arrayidx69 = getelementptr inbounds [6 x i32], [6 x i32]* %arrayidx68, i64 0, i64 %idxprom66, !dbg !245
  store i32 %36, i32* %arrayidx69, align 4, !dbg !247
  %39 = load i32, i32* %j, align 4, !dbg !248
  %idxprom70 = sext i32 %39 to i64, !dbg !250
  %40 = load i32, i32* %i, align 4, !dbg !251
  %idxprom71 = sext i32 %40 to i64, !dbg !250
  %arrayidx72 = getelementptr inbounds [6 x [6 x i32]], [6 x [6 x i32]]* @Z, i64 0, i64 %idxprom71, !dbg !250
  %arrayidx73 = getelementptr inbounds [6 x i32], [6 x i32]* %arrayidx72, i64 0, i64 %idxprom70, !dbg !250
  %41 = load i32, i32* %arrayidx73, align 4, !dbg !250
  %42 = load i32, i32* %j, align 4, !dbg !252
  %idxprom74 = sext i32 %42 to i64, !dbg !253
  %43 = load i32, i32* %i, align 4, !dbg !254
  %idxprom75 = sext i32 %43 to i64, !dbg !253
  %arrayidx76 = getelementptr inbounds [6 x [6 x i32]], [6 x [6 x i32]]* @Y, i64 0, i64 %idxprom75, !dbg !253
  %arrayidx77 = getelementptr inbounds [6 x i32], [6 x i32]* %arrayidx76, i64 0, i64 %idxprom74, !dbg !253
  %44 = load i32, i32* %arrayidx77, align 4, !dbg !253
  %cmp78 = icmp sgt i32 %41, %44, !dbg !255
  br i1 %cmp78, label %if.then79, label %if.end88, !dbg !256

if.then79:                                        ; preds = %if.then60
  %45 = load i32, i32* %j, align 4, !dbg !257
  %idxprom80 = sext i32 %45 to i64, !dbg !259
  %46 = load i32, i32* %i, align 4, !dbg !260
  %idxprom81 = sext i32 %46 to i64, !dbg !259
  %arrayidx82 = getelementptr inbounds [6 x [6 x i32]], [6 x [6 x i32]]* @Y, i64 0, i64 %idxprom81, !dbg !259
  %arrayidx83 = getelementptr inbounds [6 x i32], [6 x i32]* %arrayidx82, i64 0, i64 %idxprom80, !dbg !259
  %47 = load i32, i32* %arrayidx83, align 4, !dbg !259
  %48 = load i32, i32* %j, align 4, !dbg !261
  %idxprom84 = sext i32 %48 to i64, !dbg !262
  %49 = load i32, i32* %i, align 4, !dbg !263
  %idxprom85 = sext i32 %49 to i64, !dbg !262
  %arrayidx86 = getelementptr inbounds [6 x [6 x i32]], [6 x [6 x i32]]* @Z, i64 0, i64 %idxprom85, !dbg !262
  %arrayidx87 = getelementptr inbounds [6 x i32], [6 x i32]* %arrayidx86, i64 0, i64 %idxprom84, !dbg !262
  store i32 %47, i32* %arrayidx87, align 4, !dbg !264
  br label %if.end88, !dbg !265

if.end88:                                         ; preds = %if.then79, %if.then60
  br label %if.end89, !dbg !266

if.end89:                                         ; preds = %if.end88, %if.end53
  br label %for.inc, !dbg !267

for.inc:                                          ; preds = %if.end89
  %50 = load i32, i32* %i, align 4, !dbg !268
  %inc = add nsw i32 %50, 1, !dbg !268
  store i32 %inc, i32* %i, align 4, !dbg !268
  %51 = load i32, i32* %j, align 4, !dbg !270
  %inc90 = add nsw i32 %51, 1, !dbg !270
  store i32 %inc90, i32* %j, align 4, !dbg !270
  br label %for.cond1, !dbg !271

for.end:                                          ; preds = %for.cond1
  store i32 0, i32* %i, align 4, !dbg !272
  %52 = load i32, i32* %s, align 4, !dbg !274
  store i32 %52, i32* %j, align 4, !dbg !275
  br label %for.cond91, !dbg !276

for.cond91:                                       ; preds = %for.inc133, %for.end
  %53 = load i32, i32* %j, align 4, !dbg !277
  %cmp92 = icmp slt i32 %53, 6, !dbg !280
  br i1 %cmp92, label %for.body93, label %for.end136, !dbg !281

for.body93:                                       ; preds = %for.cond91
  %54 = load i32, i32* %i, align 4, !dbg !282
  %idxprom94 = sext i32 %54 to i64, !dbg !285
  %arrayidx95 = getelementptr inbounds [6 x i32], [6 x i32]* @V, i64 0, i64 %idxprom94, !dbg !285
  %55 = load i32, i32* %arrayidx95, align 4, !dbg !285
  %56 = load i32, i32* %j, align 4, !dbg !286
  %idxprom96 = sext i32 %56 to i64, !dbg !287
  %57 = load i32, i32* %i, align 4, !dbg !288
  %idxprom97 = sext i32 %57 to i64, !dbg !287
  %arrayidx98 = getelementptr inbounds [6 x [6 x i32]], [6 x [6 x i32]]* @X, i64 0, i64 %idxprom97, !dbg !287
  %arrayidx99 = getelementptr inbounds [6 x i32], [6 x i32]* %arrayidx98, i64 0, i64 %idxprom96, !dbg !287
  %58 = load i32, i32* %arrayidx99, align 4, !dbg !287
  %add100 = add nsw i32 %55, %58, !dbg !289
  %59 = load i32, i32* %j, align 4, !dbg !290
  %idxprom101 = sext i32 %59 to i64, !dbg !291
  %arrayidx102 = getelementptr inbounds [6 x i32], [6 x i32]* @V, i64 0, i64 %idxprom101, !dbg !291
  %60 = load i32, i32* %arrayidx102, align 4, !dbg !291
  %61 = load i32, i32* %j, align 4, !dbg !292
  %idxprom103 = sext i32 %61 to i64, !dbg !293
  %62 = load i32, i32* %i, align 4, !dbg !294
  %idxprom104 = sext i32 %62 to i64, !dbg !293
  %arrayidx105 = getelementptr inbounds [6 x [6 x i32]], [6 x [6 x i32]]* @Z, i64 0, i64 %idxprom104, !dbg !293
  %arrayidx106 = getelementptr inbounds [6 x i32], [6 x i32]* %arrayidx105, i64 0, i64 %idxprom103, !dbg !293
  %63 = load i32, i32* %arrayidx106, align 4, !dbg !293
  %add107 = add nsw i32 %60, %63, !dbg !295
  %cmp108 = icmp sgt i32 %add100, %add107, !dbg !296
  br i1 %cmp108, label %if.then109, label %if.else, !dbg !297

if.then109:                                       ; preds = %for.body93
  %64 = load i32, i32* %i, align 4, !dbg !298
  %idxprom110 = sext i32 %64 to i64, !dbg !300
  %arrayidx111 = getelementptr inbounds [6 x i32], [6 x i32]* @V, i64 0, i64 %idxprom110, !dbg !300
  %65 = load i32, i32* %arrayidx111, align 4, !dbg !300
  %66 = load i32, i32* %j, align 4, !dbg !301
  %idxprom112 = sext i32 %66 to i64, !dbg !302
  %67 = load i32, i32* %i, align 4, !dbg !303
  %idxprom113 = sext i32 %67 to i64, !dbg !302
  %arrayidx114 = getelementptr inbounds [6 x [6 x i32]], [6 x [6 x i32]]* @X, i64 0, i64 %idxprom113, !dbg !302
  %arrayidx115 = getelementptr inbounds [6 x i32], [6 x i32]* %arrayidx114, i64 0, i64 %idxprom112, !dbg !302
  %68 = load i32, i32* %arrayidx115, align 4, !dbg !302
  %add116 = add nsw i32 %65, %68, !dbg !304
  %69 = load i32, i32* %j, align 4, !dbg !305
  %idxprom117 = sext i32 %69 to i64, !dbg !306
  %70 = load i32, i32* %i, align 4, !dbg !307
  %idxprom118 = sext i32 %70 to i64, !dbg !306
  %arrayidx119 = getelementptr inbounds [6 x [6 x i32]], [6 x [6 x i32]]* @M, i64 0, i64 %idxprom118, !dbg !306
  %arrayidx120 = getelementptr inbounds [6 x i32], [6 x i32]* %arrayidx119, i64 0, i64 %idxprom117, !dbg !306
  store i32 %add116, i32* %arrayidx120, align 4, !dbg !308
  br label %if.end132, !dbg !309

if.else:                                          ; preds = %for.body93
  %71 = load i32, i32* %j, align 4, !dbg !310
  %idxprom121 = sext i32 %71 to i64, !dbg !312
  %arrayidx122 = getelementptr inbounds [6 x i32], [6 x i32]* @V, i64 0, i64 %idxprom121, !dbg !312
  %72 = load i32, i32* %arrayidx122, align 4, !dbg !312
  %73 = load i32, i32* %j, align 4, !dbg !313
  %idxprom123 = sext i32 %73 to i64, !dbg !314
  %74 = load i32, i32* %i, align 4, !dbg !315
  %idxprom124 = sext i32 %74 to i64, !dbg !314
  %arrayidx125 = getelementptr inbounds [6 x [6 x i32]], [6 x [6 x i32]]* @Z, i64 0, i64 %idxprom124, !dbg !314
  %arrayidx126 = getelementptr inbounds [6 x i32], [6 x i32]* %arrayidx125, i64 0, i64 %idxprom123, !dbg !314
  %75 = load i32, i32* %arrayidx126, align 4, !dbg !314
  %add127 = add nsw i32 %72, %75, !dbg !316
  %76 = load i32, i32* %j, align 4, !dbg !317
  %idxprom128 = sext i32 %76 to i64, !dbg !318
  %77 = load i32, i32* %i, align 4, !dbg !319
  %idxprom129 = sext i32 %77 to i64, !dbg !318
  %arrayidx130 = getelementptr inbounds [6 x [6 x i32]], [6 x [6 x i32]]* @M, i64 0, i64 %idxprom129, !dbg !318
  %arrayidx131 = getelementptr inbounds [6 x i32], [6 x i32]* %arrayidx130, i64 0, i64 %idxprom128, !dbg !318
  store i32 %add127, i32* %arrayidx131, align 4, !dbg !320
  br label %if.end132

if.end132:                                        ; preds = %if.else, %if.then109
  br label %for.inc133, !dbg !321

for.inc133:                                       ; preds = %if.end132
  %78 = load i32, i32* %i, align 4, !dbg !322
  %inc134 = add nsw i32 %78, 1, !dbg !322
  store i32 %inc134, i32* %i, align 4, !dbg !322
  %79 = load i32, i32* %j, align 4, !dbg !324
  %inc135 = add nsw i32 %79, 1, !dbg !324
  store i32 %inc135, i32* %j, align 4, !dbg !324
  br label %for.cond91, !dbg !325

for.end136:                                       ; preds = %for.cond91
  br label %for.inc137, !dbg !326

for.inc137:                                       ; preds = %for.end136
  %80 = load i32, i32* %s, align 4, !dbg !327
  %inc138 = add nsw i32 %80, 1, !dbg !327
  store i32 %inc138, i32* %s, align 4, !dbg !327
  br label %for.cond, !dbg !329

for.end139:                                       ; preds = %for.cond
  %81 = load i32, i32* getelementptr inbounds ([6 x [6 x i32]], [6 x [6 x i32]]* @M, i64 0, i64 0, i64 5), align 4, !dbg !330
  ret i32 %81, !dbg !331
}

; Function Attrs: nounwind uwtable
define i32 @main() #0 !dbg !12 {
entry:
  %call = call i32 @findMoves(), !dbg !332
  call void @play(), !dbg !333
  %0 = load i32, i32* @sum_alice, align 4, !dbg !334
  %1 = load i32, i32* getelementptr inbounds ([6 x [6 x i32]], [6 x [6 x i32]]* @M, i64 0, i64 0, i64 5), align 4, !dbg !336
  %cmp = icmp ne i32 %0, %1, !dbg !337
  br i1 %cmp, label %if.then, label %if.end, !dbg !338

if.then:                                          ; preds = %entry
  %call1 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([24 x i8], [24 x i8]* @.str.6, i32 0, i32 0)), !dbg !339
  call void @exit(i32 -1) #4, !dbg !341
  unreachable, !dbg !341

if.end:                                           ; preds = %entry
  %2 = load i32, i32* @sum_alice, align 4, !dbg !342
  %3 = load i32, i32* @sum_bob, align 4, !dbg !344
  %cmp2 = icmp slt i32 %2, %3, !dbg !345
  br i1 %cmp2, label %if.then3, label %if.end5, !dbg !346

if.then3:                                         ; preds = %if.end
  %call4 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([28 x i8], [28 x i8]* @.str.7, i32 0, i32 0)), !dbg !347
  call void @exit(i32 -1) #4, !dbg !349
  unreachable, !dbg !349

if.end5:                                          ; preds = %if.end
  %4 = load i32, i32* @sum_alice, align 4, !dbg !350
  %call6 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([54 x i8], [54 x i8]* @.str.8, i32 0, i32 0), i32 %4), !dbg !351
  %5 = load i32, i32* @sum_bob, align 4, !dbg !352
  %call7 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([52 x i8], [52 x i8]* @.str.9, i32 0, i32 0), i32 %5), !dbg !353
  ret i32 0, !dbg !354
}

; Function Attrs: noreturn nounwind
declare void @exit(i32) #3

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone }
attributes #2 = { "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { noreturn nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { noreturn nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!27, !28}
!llvm.ident = !{!29}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 3.9.0 (http://llvm.org/git/clang.git cf7bc8edf8cccb1b5de656c403cb55ad44132e98) (http://llvm.org/git/llvm.git 22706dc4c03305692f494d0e42a6de1050d0ec62)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, subprograms: !3, globals: !13)
!1 = !DIFile(filename: "CoinGame.c", directory: "/home/sam/workspace/WhileyOpenCL/polly/CoinGame/impl/handwritten")
!2 = !{}
!3 = !{!4, !7, !8, !12}
!4 = distinct !DISubprogram(name: "init", scope: !1, file: !1, line: 26, type: !5, isLocal: false, isDefinition: true, scopeLine: 26, isOptimized: false, variables: !2)
!5 = !DISubroutineType(types: !6)
!6 = !{null}
!7 = distinct !DISubprogram(name: "play", scope: !1, file: !1, line: 35, type: !5, isLocal: false, isDefinition: true, scopeLine: 35, isOptimized: false, variables: !2)
!8 = distinct !DISubprogram(name: "findMoves", scope: !1, file: !1, line: 103, type: !9, isLocal: false, isDefinition: true, scopeLine: 103, isOptimized: false, variables: !2)
!9 = !DISubroutineType(types: !10)
!10 = !{!11}
!11 = !DIBasicType(name: "int", size: 32, align: 32, encoding: DW_ATE_signed)
!12 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 154, type: !9, isLocal: false, isDefinition: true, scopeLine: 154, isOptimized: false, variables: !2)
!13 = !{!14, !18, !19, !20, !23, !24, !25, !26}
!14 = !DIGlobalVariable(name: "V", scope: !0, file: !1, line: 14, type: !15, isLocal: false, isDefinition: true, variable: [6 x i32]* @V)
!15 = !DICompositeType(tag: DW_TAG_array_type, baseType: !11, size: 192, align: 32, elements: !16)
!16 = !{!17}
!17 = !DISubrange(count: 6)
!18 = !DIGlobalVariable(name: "sum_alice", scope: !0, file: !1, line: 24, type: !11, isLocal: false, isDefinition: true, variable: i32* @sum_alice)
!19 = !DIGlobalVariable(name: "sum_bob", scope: !0, file: !1, line: 24, type: !11, isLocal: false, isDefinition: true, variable: i32* @sum_bob)
!20 = !DIGlobalVariable(name: "M", scope: !0, file: !1, line: 17, type: !21, isLocal: false, isDefinition: true, variable: [6 x [6 x i32]]* @M)
!21 = !DICompositeType(tag: DW_TAG_array_type, baseType: !11, size: 1152, align: 32, elements: !22)
!22 = !{!17, !17}
!23 = !DIGlobalVariable(name: "X", scope: !0, file: !1, line: 20, type: !21, isLocal: false, isDefinition: true, variable: [6 x [6 x i32]]* @X)
!24 = !DIGlobalVariable(name: "Y", scope: !0, file: !1, line: 21, type: !21, isLocal: false, isDefinition: true, variable: [6 x [6 x i32]]* @Y)
!25 = !DIGlobalVariable(name: "Z", scope: !0, file: !1, line: 22, type: !21, isLocal: false, isDefinition: true, variable: [6 x [6 x i32]]* @Z)
!26 = !DIGlobalVariable(name: "coins", scope: !0, file: !1, line: 23, type: !15, isLocal: false, isDefinition: true, variable: [6 x i32]* @coins)
!27 = !{i32 2, !"Dwarf Version", i32 4}
!28 = !{i32 2, !"Debug Info Version", i32 3}
!29 = !{!"clang version 3.9.0 (http://llvm.org/git/clang.git cf7bc8edf8cccb1b5de656c403cb55ad44132e98) (http://llvm.org/git/llvm.git 22706dc4c03305692f494d0e42a6de1050d0ec62)"}
!30 = !DILocalVariable(name: "i", scope: !4, file: !1, line: 27, type: !11)
!31 = !DIExpression()
!32 = !DILocation(line: 27, column: 6, scope: !4)
!33 = !DILocation(line: 29, column: 2, scope: !4)
!34 = !DILocation(line: 30, column: 9, scope: !35)
!35 = distinct !DILexicalBlock(scope: !4, file: !1, line: 30, column: 2)
!36 = !DILocation(line: 30, column: 7, scope: !35)
!37 = !DILocation(line: 30, column: 14, scope: !38)
!38 = !DILexicalBlockFile(scope: !39, file: !1, discriminator: 1)
!39 = distinct !DILexicalBlock(scope: !35, file: !1, line: 30, column: 2)
!40 = !DILocation(line: 30, column: 16, scope: !38)
!41 = !DILocation(line: 30, column: 2, scope: !38)
!42 = !DILocation(line: 31, column: 10, scope: !43)
!43 = distinct !DILexicalBlock(scope: !39, file: !1, line: 30, column: 26)
!44 = !DILocation(line: 31, column: 5, scope: !43)
!45 = !DILocation(line: 31, column: 3, scope: !43)
!46 = !DILocation(line: 31, column: 8, scope: !43)
!47 = !DILocation(line: 32, column: 2, scope: !43)
!48 = !DILocation(line: 30, column: 22, scope: !49)
!49 = !DILexicalBlockFile(scope: !39, file: !1, discriminator: 2)
!50 = !DILocation(line: 30, column: 2, scope: !49)
!51 = !DILocation(line: 33, column: 1, scope: !4)
!52 = !DILocalVariable(name: "i", scope: !7, file: !1, line: 36, type: !11)
!53 = !DILocation(line: 36, column: 6, scope: !7)
!54 = !DILocalVariable(name: "j", scope: !7, file: !1, line: 36, type: !11)
!55 = !DILocation(line: 36, column: 13, scope: !7)
!56 = !DILocalVariable(name: "index", scope: !7, file: !1, line: 38, type: !11)
!57 = !DILocation(line: 38, column: 6, scope: !7)
!58 = !DILocation(line: 39, column: 13, scope: !59)
!59 = distinct !DILexicalBlock(scope: !7, file: !1, line: 39, column: 2)
!60 = !DILocation(line: 39, column: 7, scope: !59)
!61 = !DILocation(line: 39, column: 18, scope: !62)
!62 = !DILexicalBlockFile(scope: !63, file: !1, discriminator: 1)
!63 = distinct !DILexicalBlock(scope: !59, file: !1, line: 39, column: 2)
!64 = !DILocation(line: 39, column: 23, scope: !62)
!65 = !DILocation(line: 39, column: 2, scope: !62)
!66 = !DILocation(line: 40, column: 16, scope: !67)
!67 = distinct !DILexicalBlock(scope: !68, file: !1, line: 40, column: 7)
!68 = distinct !DILexicalBlock(scope: !63, file: !1, line: 39, column: 36)
!69 = !DILocation(line: 40, column: 7, scope: !67)
!70 = !DILocation(line: 40, column: 9, scope: !67)
!71 = !DILocation(line: 40, column: 11, scope: !67)
!72 = !DILocation(line: 40, column: 27, scope: !67)
!73 = !DILocation(line: 40, column: 29, scope: !67)
!74 = !DILocation(line: 40, column: 22, scope: !67)
!75 = !DILocation(line: 40, column: 24, scope: !67)
!76 = !DILocation(line: 40, column: 19, scope: !67)
!77 = !DILocation(line: 40, column: 7, scope: !68)
!78 = !DILocation(line: 42, column: 21, scope: !79)
!79 = distinct !DILexicalBlock(scope: !67, file: !1, line: 40, column: 35)
!80 = !DILocation(line: 42, column: 19, scope: !79)
!81 = !DILocation(line: 42, column: 10, scope: !79)
!82 = !DILocation(line: 42, column: 4, scope: !79)
!83 = !DILocation(line: 42, column: 17, scope: !79)
!84 = !DILocation(line: 43, column: 5, scope: !79)
!85 = !DILocation(line: 44, column: 3, scope: !79)
!86 = !DILocation(line: 46, column: 21, scope: !87)
!87 = distinct !DILexicalBlock(scope: !67, file: !1, line: 44, column: 10)
!88 = !DILocation(line: 46, column: 19, scope: !87)
!89 = !DILocation(line: 46, column: 10, scope: !87)
!90 = !DILocation(line: 46, column: 4, scope: !87)
!91 = !DILocation(line: 46, column: 17, scope: !87)
!92 = !DILocation(line: 47, column: 5, scope: !87)
!93 = !DILocation(line: 49, column: 2, scope: !68)
!94 = !DILocation(line: 39, column: 32, scope: !95)
!95 = !DILexicalBlockFile(scope: !63, file: !1, discriminator: 2)
!96 = !DILocation(line: 39, column: 2, scope: !95)
!97 = !DILocation(line: 51, column: 7, scope: !98)
!98 = distinct !DILexicalBlock(scope: !7, file: !1, line: 51, column: 2)
!99 = !DILocation(line: 51, column: 6, scope: !98)
!100 = !DILocation(line: 51, column: 11, scope: !101)
!101 = !DILexicalBlockFile(scope: !102, file: !1, discriminator: 1)
!102 = distinct !DILexicalBlock(scope: !98, file: !1, line: 51, column: 2)
!103 = !DILocation(line: 51, column: 12, scope: !101)
!104 = !DILocation(line: 51, column: 2, scope: !101)
!105 = !DILocation(line: 52, column: 6, scope: !106)
!106 = distinct !DILexicalBlock(scope: !107, file: !1, line: 52, column: 6)
!107 = distinct !DILexicalBlock(scope: !102, file: !1, line: 51, column: 19)
!108 = !DILocation(line: 52, column: 7, scope: !106)
!109 = !DILocation(line: 52, column: 9, scope: !106)
!110 = !DILocation(line: 52, column: 6, scope: !107)
!111 = !DILocation(line: 53, column: 4, scope: !112)
!112 = distinct !DILexicalBlock(scope: !106, file: !1, line: 52, column: 13)
!113 = !DILocation(line: 54, column: 3, scope: !112)
!114 = !DILocation(line: 55, column: 4, scope: !115)
!115 = distinct !DILexicalBlock(scope: !106, file: !1, line: 54, column: 8)
!116 = !DILocation(line: 57, column: 23, scope: !107)
!117 = !DILocation(line: 57, column: 24, scope: !107)
!118 = !DILocation(line: 57, column: 35, scope: !107)
!119 = !DILocation(line: 57, column: 29, scope: !107)
!120 = !DILocation(line: 57, column: 3, scope: !107)
!121 = !DILocation(line: 59, column: 6, scope: !122)
!122 = distinct !DILexicalBlock(scope: !107, file: !1, line: 59, column: 6)
!123 = !DILocation(line: 59, column: 7, scope: !122)
!124 = !DILocation(line: 59, column: 9, scope: !122)
!125 = !DILocation(line: 59, column: 6, scope: !107)
!126 = !DILocation(line: 60, column: 23, scope: !127)
!127 = distinct !DILexicalBlock(scope: !122, file: !1, line: 59, column: 13)
!128 = !DILocation(line: 60, column: 17, scope: !127)
!129 = !DILocation(line: 60, column: 14, scope: !127)
!130 = !DILocation(line: 61, column: 4, scope: !127)
!131 = !DILocation(line: 62, column: 3, scope: !127)
!132 = !DILocation(line: 63, column: 21, scope: !133)
!133 = distinct !DILexicalBlock(scope: !122, file: !1, line: 62, column: 8)
!134 = !DILocation(line: 63, column: 15, scope: !133)
!135 = !DILocation(line: 63, column: 12, scope: !133)
!136 = !DILocation(line: 64, column: 4, scope: !133)
!137 = !DILocation(line: 66, column: 2, scope: !107)
!138 = !DILocation(line: 51, column: 16, scope: !139)
!139 = !DILexicalBlockFile(scope: !102, file: !1, discriminator: 2)
!140 = !DILocation(line: 51, column: 2, scope: !139)
!141 = !DILocation(line: 68, column: 1, scope: !7)
!142 = !DILocalVariable(name: "s", scope: !8, file: !1, line: 104, type: !11)
!143 = !DILocation(line: 104, column: 6, scope: !8)
!144 = !DILocalVariable(name: "i", scope: !8, file: !1, line: 104, type: !11)
!145 = !DILocation(line: 104, column: 9, scope: !8)
!146 = !DILocalVariable(name: "j", scope: !8, file: !1, line: 104, type: !11)
!147 = !DILocation(line: 104, column: 12, scope: !8)
!148 = !DILocation(line: 105, column: 9, scope: !149)
!149 = distinct !DILexicalBlock(scope: !8, file: !1, line: 105, column: 2)
!150 = !DILocation(line: 105, column: 7, scope: !149)
!151 = !DILocation(line: 105, column: 14, scope: !152)
!152 = !DILexicalBlockFile(scope: !153, file: !1, discriminator: 1)
!153 = distinct !DILexicalBlock(scope: !149, file: !1, line: 105, column: 2)
!154 = !DILocation(line: 105, column: 16, scope: !152)
!155 = !DILocation(line: 105, column: 2, scope: !152)
!156 = !DILocation(line: 107, column: 10, scope: !157)
!157 = distinct !DILexicalBlock(scope: !158, file: !1, line: 107, column: 3)
!158 = distinct !DILexicalBlock(scope: !153, file: !1, line: 105, column: 26)
!159 = !DILocation(line: 107, column: 19, scope: !157)
!160 = !DILocation(line: 107, column: 17, scope: !157)
!161 = !DILocation(line: 107, column: 8, scope: !157)
!162 = !DILocation(line: 107, column: 22, scope: !163)
!163 = !DILexicalBlockFile(scope: !164, file: !1, discriminator: 1)
!164 = distinct !DILexicalBlock(scope: !157, file: !1, line: 107, column: 3)
!165 = !DILocation(line: 107, column: 24, scope: !163)
!166 = !DILocation(line: 107, column: 3, scope: !163)
!167 = !DILocation(line: 111, column: 9, scope: !168)
!168 = distinct !DILexicalBlock(scope: !164, file: !1, line: 107, column: 39)
!169 = !DILocation(line: 111, column: 4, scope: !168)
!170 = !DILocation(line: 111, column: 6, scope: !168)
!171 = !DILocation(line: 111, column: 12, scope: !168)
!172 = !DILocation(line: 112, column: 8, scope: !173)
!173 = distinct !DILexicalBlock(scope: !168, file: !1, line: 112, column: 8)
!174 = !DILocation(line: 112, column: 10, scope: !173)
!175 = !DILocation(line: 112, column: 14, scope: !173)
!176 = !DILocation(line: 112, column: 18, scope: !173)
!177 = !DILocation(line: 112, column: 21, scope: !178)
!178 = !DILexicalBlockFile(scope: !173, file: !1, discriminator: 1)
!179 = !DILocation(line: 112, column: 23, scope: !178)
!180 = !DILocation(line: 112, column: 27, scope: !178)
!181 = !DILocation(line: 112, column: 8, scope: !178)
!182 = !DILocation(line: 113, column: 24, scope: !183)
!183 = distinct !DILexicalBlock(scope: !173, file: !1, line: 112, column: 33)
!184 = !DILocation(line: 113, column: 26, scope: !183)
!185 = !DILocation(line: 113, column: 15, scope: !183)
!186 = !DILocation(line: 113, column: 17, scope: !183)
!187 = !DILocation(line: 113, column: 19, scope: !183)
!188 = !DILocation(line: 113, column: 10, scope: !183)
!189 = !DILocation(line: 113, column: 5, scope: !183)
!190 = !DILocation(line: 113, column: 7, scope: !183)
!191 = !DILocation(line: 113, column: 13, scope: !183)
!192 = !DILocation(line: 114, column: 4, scope: !183)
!193 = !DILocation(line: 116, column: 9, scope: !168)
!194 = !DILocation(line: 116, column: 4, scope: !168)
!195 = !DILocation(line: 116, column: 6, scope: !168)
!196 = !DILocation(line: 116, column: 12, scope: !168)
!197 = !DILocation(line: 117, column: 8, scope: !198)
!198 = distinct !DILexicalBlock(scope: !168, file: !1, line: 117, column: 8)
!199 = !DILocation(line: 117, column: 10, scope: !198)
!200 = !DILocation(line: 117, column: 14, scope: !198)
!201 = !DILocation(line: 117, column: 8, scope: !168)
!202 = !DILocation(line: 118, column: 24, scope: !203)
!203 = distinct !DILexicalBlock(scope: !198, file: !1, line: 117, column: 19)
!204 = !DILocation(line: 118, column: 15, scope: !203)
!205 = !DILocation(line: 118, column: 17, scope: !203)
!206 = !DILocation(line: 118, column: 19, scope: !203)
!207 = !DILocation(line: 118, column: 10, scope: !203)
!208 = !DILocation(line: 118, column: 5, scope: !203)
!209 = !DILocation(line: 118, column: 7, scope: !203)
!210 = !DILocation(line: 118, column: 13, scope: !203)
!211 = !DILocation(line: 119, column: 14, scope: !212)
!212 = distinct !DILexicalBlock(scope: !203, file: !1, line: 119, column: 9)
!213 = !DILocation(line: 119, column: 9, scope: !212)
!214 = !DILocation(line: 119, column: 11, scope: !212)
!215 = !DILocation(line: 119, column: 24, scope: !212)
!216 = !DILocation(line: 119, column: 19, scope: !212)
!217 = !DILocation(line: 119, column: 21, scope: !212)
!218 = !DILocation(line: 119, column: 17, scope: !212)
!219 = !DILocation(line: 119, column: 9, scope: !203)
!220 = !DILocation(line: 120, column: 21, scope: !221)
!221 = distinct !DILexicalBlock(scope: !212, file: !1, line: 119, column: 28)
!222 = !DILocation(line: 120, column: 16, scope: !221)
!223 = !DILocation(line: 120, column: 18, scope: !221)
!224 = !DILocation(line: 120, column: 11, scope: !221)
!225 = !DILocation(line: 120, column: 6, scope: !221)
!226 = !DILocation(line: 120, column: 8, scope: !221)
!227 = !DILocation(line: 120, column: 14, scope: !221)
!228 = !DILocation(line: 121, column: 5, scope: !221)
!229 = !DILocation(line: 122, column: 4, scope: !203)
!230 = !DILocation(line: 124, column: 9, scope: !168)
!231 = !DILocation(line: 124, column: 4, scope: !168)
!232 = !DILocation(line: 124, column: 6, scope: !168)
!233 = !DILocation(line: 124, column: 12, scope: !168)
!234 = !DILocation(line: 125, column: 8, scope: !235)
!235 = distinct !DILexicalBlock(scope: !168, file: !1, line: 125, column: 8)
!236 = !DILocation(line: 125, column: 10, scope: !235)
!237 = !DILocation(line: 125, column: 14, scope: !235)
!238 = !DILocation(line: 125, column: 8, scope: !168)
!239 = !DILocation(line: 126, column: 20, scope: !240)
!240 = distinct !DILexicalBlock(scope: !235, file: !1, line: 125, column: 19)
!241 = !DILocation(line: 126, column: 22, scope: !240)
!242 = !DILocation(line: 126, column: 15, scope: !240)
!243 = !DILocation(line: 126, column: 17, scope: !240)
!244 = !DILocation(line: 126, column: 10, scope: !240)
!245 = !DILocation(line: 126, column: 5, scope: !240)
!246 = !DILocation(line: 126, column: 7, scope: !240)
!247 = !DILocation(line: 126, column: 13, scope: !240)
!248 = !DILocation(line: 127, column: 14, scope: !249)
!249 = distinct !DILexicalBlock(scope: !240, file: !1, line: 127, column: 9)
!250 = !DILocation(line: 127, column: 9, scope: !249)
!251 = !DILocation(line: 127, column: 11, scope: !249)
!252 = !DILocation(line: 127, column: 24, scope: !249)
!253 = !DILocation(line: 127, column: 19, scope: !249)
!254 = !DILocation(line: 127, column: 21, scope: !249)
!255 = !DILocation(line: 127, column: 17, scope: !249)
!256 = !DILocation(line: 127, column: 9, scope: !240)
!257 = !DILocation(line: 128, column: 21, scope: !258)
!258 = distinct !DILexicalBlock(scope: !249, file: !1, line: 127, column: 28)
!259 = !DILocation(line: 128, column: 16, scope: !258)
!260 = !DILocation(line: 128, column: 18, scope: !258)
!261 = !DILocation(line: 128, column: 11, scope: !258)
!262 = !DILocation(line: 128, column: 6, scope: !258)
!263 = !DILocation(line: 128, column: 8, scope: !258)
!264 = !DILocation(line: 128, column: 14, scope: !258)
!265 = !DILocation(line: 129, column: 5, scope: !258)
!266 = !DILocation(line: 130, column: 4, scope: !240)
!267 = !DILocation(line: 132, column: 3, scope: !168)
!268 = !DILocation(line: 107, column: 30, scope: !269)
!269 = !DILexicalBlockFile(scope: !164, file: !1, discriminator: 2)
!270 = !DILocation(line: 107, column: 35, scope: !269)
!271 = !DILocation(line: 107, column: 3, scope: !269)
!272 = !DILocation(line: 135, column: 10, scope: !273)
!273 = distinct !DILexicalBlock(scope: !158, file: !1, line: 135, column: 3)
!274 = !DILocation(line: 135, column: 19, scope: !273)
!275 = !DILocation(line: 135, column: 17, scope: !273)
!276 = !DILocation(line: 135, column: 8, scope: !273)
!277 = !DILocation(line: 135, column: 22, scope: !278)
!278 = !DILexicalBlockFile(scope: !279, file: !1, discriminator: 1)
!279 = distinct !DILexicalBlock(scope: !273, file: !1, line: 135, column: 3)
!280 = !DILocation(line: 135, column: 24, scope: !278)
!281 = !DILocation(line: 135, column: 3, scope: !278)
!282 = !DILocation(line: 139, column: 10, scope: !283)
!283 = distinct !DILexicalBlock(scope: !284, file: !1, line: 139, column: 8)
!284 = distinct !DILexicalBlock(scope: !279, file: !1, line: 135, column: 39)
!285 = !DILocation(line: 139, column: 8, scope: !283)
!286 = !DILocation(line: 139, column: 20, scope: !283)
!287 = !DILocation(line: 139, column: 15, scope: !283)
!288 = !DILocation(line: 139, column: 17, scope: !283)
!289 = !DILocation(line: 139, column: 13, scope: !283)
!290 = !DILocation(line: 139, column: 27, scope: !283)
!291 = !DILocation(line: 139, column: 25, scope: !283)
!292 = !DILocation(line: 139, column: 37, scope: !283)
!293 = !DILocation(line: 139, column: 32, scope: !283)
!294 = !DILocation(line: 139, column: 34, scope: !283)
!295 = !DILocation(line: 139, column: 30, scope: !283)
!296 = !DILocation(line: 139, column: 23, scope: !283)
!297 = !DILocation(line: 139, column: 8, scope: !284)
!298 = !DILocation(line: 140, column: 17, scope: !299)
!299 = distinct !DILexicalBlock(scope: !283, file: !1, line: 139, column: 41)
!300 = !DILocation(line: 140, column: 15, scope: !299)
!301 = !DILocation(line: 140, column: 27, scope: !299)
!302 = !DILocation(line: 140, column: 22, scope: !299)
!303 = !DILocation(line: 140, column: 24, scope: !299)
!304 = !DILocation(line: 140, column: 20, scope: !299)
!305 = !DILocation(line: 140, column: 10, scope: !299)
!306 = !DILocation(line: 140, column: 5, scope: !299)
!307 = !DILocation(line: 140, column: 7, scope: !299)
!308 = !DILocation(line: 140, column: 13, scope: !299)
!309 = !DILocation(line: 141, column: 4, scope: !299)
!310 = !DILocation(line: 142, column: 17, scope: !311)
!311 = distinct !DILexicalBlock(scope: !283, file: !1, line: 141, column: 11)
!312 = !DILocation(line: 142, column: 15, scope: !311)
!313 = !DILocation(line: 142, column: 27, scope: !311)
!314 = !DILocation(line: 142, column: 22, scope: !311)
!315 = !DILocation(line: 142, column: 24, scope: !311)
!316 = !DILocation(line: 142, column: 20, scope: !311)
!317 = !DILocation(line: 142, column: 10, scope: !311)
!318 = !DILocation(line: 142, column: 5, scope: !311)
!319 = !DILocation(line: 142, column: 7, scope: !311)
!320 = !DILocation(line: 142, column: 13, scope: !311)
!321 = !DILocation(line: 148, column: 3, scope: !284)
!322 = !DILocation(line: 135, column: 30, scope: !323)
!323 = !DILexicalBlockFile(scope: !279, file: !1, discriminator: 2)
!324 = !DILocation(line: 135, column: 35, scope: !323)
!325 = !DILocation(line: 135, column: 3, scope: !323)
!326 = !DILocation(line: 150, column: 2, scope: !158)
!327 = !DILocation(line: 105, column: 22, scope: !328)
!328 = !DILexicalBlockFile(scope: !153, file: !1, discriminator: 2)
!329 = !DILocation(line: 105, column: 2, scope: !328)
!330 = !DILocation(line: 152, column: 9, scope: !8)
!331 = !DILocation(line: 152, column: 2, scope: !8)
!332 = !DILocation(line: 156, column: 2, scope: !12)
!333 = !DILocation(line: 157, column: 2, scope: !12)
!334 = !DILocation(line: 160, column: 6, scope: !335)
!335 = distinct !DILexicalBlock(scope: !12, file: !1, line: 160, column: 6)
!336 = !DILocation(line: 160, column: 19, scope: !335)
!337 = !DILocation(line: 160, column: 16, scope: !335)
!338 = !DILocation(line: 160, column: 6, scope: !12)
!339 = !DILocation(line: 161, column: 3, scope: !340)
!340 = distinct !DILexicalBlock(scope: !335, file: !1, line: 160, column: 32)
!341 = !DILocation(line: 162, column: 3, scope: !340)
!342 = !DILocation(line: 165, column: 6, scope: !343)
!343 = distinct !DILexicalBlock(scope: !12, file: !1, line: 165, column: 6)
!344 = !DILocation(line: 165, column: 18, scope: !343)
!345 = !DILocation(line: 165, column: 16, scope: !343)
!346 = !DILocation(line: 165, column: 6, scope: !12)
!347 = !DILocation(line: 166, column: 3, scope: !348)
!348 = distinct !DILexicalBlock(scope: !343, file: !1, line: 165, column: 27)
!349 = !DILocation(line: 167, column: 3, scope: !348)
!350 = !DILocation(line: 170, column: 67, scope: !12)
!351 = !DILocation(line: 170, column: 2, scope: !12)
!352 = !DILocation(line: 171, column: 65, scope: !12)
!353 = !DILocation(line: 171, column: 2, scope: !12)
!354 = !DILocation(line: 172, column: 1, scope: !12)
