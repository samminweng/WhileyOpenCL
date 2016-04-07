; ModuleID = 'CoinGame.c'
source_filename = "CoinGame.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@V = global [6 x i32] [i32 6, i32 5, i32 2, i32 7, i32 3, i32 5], align 16
@sum_alice = global i32 0, align 4
@sum_bob = global i32 0, align 4
@.str = private unnamed_addr constant [22 x i8] c"Number of coins = %d\0A\00", align 1
@M = common global [6 x [6 x i32]] zeroinitializer, align 16
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
define void @sumMoves() #0 !dbg !7 {
entry:
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %alice = alloca i32, align 4
  %P1 = alloca i32, align 4
  %P2 = alloca i32, align 4
  %coin = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %i, metadata !52, metadata !31), !dbg !53
  store i32 0, i32* %i, align 4, !dbg !53
  call void @llvm.dbg.declare(metadata i32* %j, metadata !54, metadata !31), !dbg !55
  store i32 5, i32* %j, align 4, !dbg !55
  call void @llvm.dbg.declare(metadata i32* %alice, metadata !56, metadata !31), !dbg !57
  store i32 1, i32* %alice, align 4, !dbg !57
  br label %while.cond, !dbg !58

while.cond:                                       ; preds = %if.end16, %entry
  %0 = load i32, i32* %i, align 4, !dbg !59
  %1 = load i32, i32* %j, align 4, !dbg !61
  %cmp = icmp sle i32 %0, %1, !dbg !62
  br i1 %cmp, label %while.body, label %while.end, !dbg !63

while.body:                                       ; preds = %while.cond
  call void @llvm.dbg.declare(metadata i32* %P1, metadata !64, metadata !31), !dbg !66
  %2 = load i32, i32* %j, align 4, !dbg !67
  %idxprom = sext i32 %2 to i64, !dbg !68
  %3 = load i32, i32* %i, align 4, !dbg !69
  %add = add nsw i32 %3, 1, !dbg !70
  %idxprom1 = sext i32 %add to i64, !dbg !68
  %arrayidx = getelementptr inbounds [6 x [6 x i32]], [6 x [6 x i32]]* @M, i64 0, i64 %idxprom1, !dbg !68
  %arrayidx2 = getelementptr inbounds [6 x i32], [6 x i32]* %arrayidx, i64 0, i64 %idxprom, !dbg !68
  %4 = load i32, i32* %arrayidx2, align 4, !dbg !68
  store i32 %4, i32* %P1, align 4, !dbg !66
  call void @llvm.dbg.declare(metadata i32* %P2, metadata !71, metadata !31), !dbg !72
  %5 = load i32, i32* %j, align 4, !dbg !73
  %sub = sub nsw i32 %5, 1, !dbg !74
  %idxprom3 = sext i32 %sub to i64, !dbg !75
  %6 = load i32, i32* %i, align 4, !dbg !76
  %idxprom4 = sext i32 %6 to i64, !dbg !75
  %arrayidx5 = getelementptr inbounds [6 x [6 x i32]], [6 x [6 x i32]]* @M, i64 0, i64 %idxprom4, !dbg !75
  %arrayidx6 = getelementptr inbounds [6 x i32], [6 x i32]* %arrayidx5, i64 0, i64 %idxprom3, !dbg !75
  %7 = load i32, i32* %arrayidx6, align 4, !dbg !75
  store i32 %7, i32* %P2, align 4, !dbg !72
  call void @llvm.dbg.declare(metadata i32* %coin, metadata !77, metadata !31), !dbg !78
  %8 = load i32, i32* %P1, align 4, !dbg !79
  %9 = load i32, i32* %P2, align 4, !dbg !81
  %cmp7 = icmp sle i32 %8, %9, !dbg !82
  br i1 %cmp7, label %if.then, label %if.else, !dbg !83

if.then:                                          ; preds = %while.body
  %10 = load i32, i32* %i, align 4, !dbg !84
  %idxprom8 = sext i32 %10 to i64, !dbg !86
  %arrayidx9 = getelementptr inbounds [6 x i32], [6 x i32]* @V, i64 0, i64 %idxprom8, !dbg !86
  %11 = load i32, i32* %arrayidx9, align 4, !dbg !86
  store i32 %11, i32* %coin, align 4, !dbg !87
  %12 = load i32, i32* %i, align 4, !dbg !88
  %inc = add nsw i32 %12, 1, !dbg !88
  store i32 %inc, i32* %i, align 4, !dbg !88
  br label %if.end, !dbg !89

if.else:                                          ; preds = %while.body
  %13 = load i32, i32* %j, align 4, !dbg !90
  %idxprom10 = sext i32 %13 to i64, !dbg !92
  %arrayidx11 = getelementptr inbounds [6 x i32], [6 x i32]* @V, i64 0, i64 %idxprom10, !dbg !92
  %14 = load i32, i32* %arrayidx11, align 4, !dbg !92
  store i32 %14, i32* %coin, align 4, !dbg !93
  %15 = load i32, i32* %j, align 4, !dbg !94
  %dec = add nsw i32 %15, -1, !dbg !94
  store i32 %dec, i32* %j, align 4, !dbg !94
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %16 = load i32, i32* %alice, align 4, !dbg !95
  %tobool = icmp ne i32 %16, 0, !dbg !95
  br i1 %tobool, label %if.then12, label %if.else14, !dbg !97

if.then12:                                        ; preds = %if.end
  %17 = load i32, i32* %coin, align 4, !dbg !98
  %18 = load i32, i32* @sum_alice, align 4, !dbg !100
  %add13 = add nsw i32 %18, %17, !dbg !100
  store i32 %add13, i32* @sum_alice, align 4, !dbg !100
  store i32 0, i32* %alice, align 4, !dbg !101
  br label %if.end16, !dbg !102

if.else14:                                        ; preds = %if.end
  %19 = load i32, i32* %coin, align 4, !dbg !103
  %20 = load i32, i32* @sum_bob, align 4, !dbg !105
  %add15 = add nsw i32 %20, %19, !dbg !105
  store i32 %add15, i32* @sum_bob, align 4, !dbg !105
  store i32 1, i32* %alice, align 4, !dbg !106
  br label %if.end16

if.end16:                                         ; preds = %if.else14, %if.then12
  br label %while.cond, !dbg !107

while.end:                                        ; preds = %while.cond
  ret void, !dbg !109
}

; Function Attrs: nounwind uwtable
define void @printMoves() #0 !dbg !8 {
entry:
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %alice = alloca i8, align 1
  %P1 = alloca i32, align 4
  %P2 = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %i, metadata !110, metadata !31), !dbg !111
  store i32 0, i32* %i, align 4, !dbg !111
  call void @llvm.dbg.declare(metadata i32* %j, metadata !112, metadata !31), !dbg !113
  store i32 5, i32* %j, align 4, !dbg !113
  call void @llvm.dbg.declare(metadata i8* %alice, metadata !114, metadata !31), !dbg !116
  store i8 1, i8* %alice, align 1, !dbg !116
  br label %while.cond, !dbg !117

while.cond:                                       ; preds = %if.end25, %entry
  %0 = load i32, i32* %i, align 4, !dbg !118
  %1 = load i32, i32* %j, align 4, !dbg !120
  %cmp = icmp sle i32 %0, %1, !dbg !121
  br i1 %cmp, label %while.body, label %while.end, !dbg !122

while.body:                                       ; preds = %while.cond
  call void @llvm.dbg.declare(metadata i32* %P1, metadata !123, metadata !31), !dbg !125
  %2 = load i32, i32* %j, align 4, !dbg !126
  %idxprom = sext i32 %2 to i64, !dbg !127
  %3 = load i32, i32* %i, align 4, !dbg !128
  %add = add nsw i32 %3, 1, !dbg !129
  %idxprom1 = sext i32 %add to i64, !dbg !127
  %arrayidx = getelementptr inbounds [6 x [6 x i32]], [6 x [6 x i32]]* @M, i64 0, i64 %idxprom1, !dbg !127
  %arrayidx2 = getelementptr inbounds [6 x i32], [6 x i32]* %arrayidx, i64 0, i64 %idxprom, !dbg !127
  %4 = load i32, i32* %arrayidx2, align 4, !dbg !127
  store i32 %4, i32* %P1, align 4, !dbg !125
  call void @llvm.dbg.declare(metadata i32* %P2, metadata !130, metadata !31), !dbg !131
  %5 = load i32, i32* %j, align 4, !dbg !132
  %sub = sub nsw i32 %5, 1, !dbg !133
  %idxprom3 = sext i32 %sub to i64, !dbg !134
  %6 = load i32, i32* %i, align 4, !dbg !135
  %idxprom4 = sext i32 %6 to i64, !dbg !134
  %arrayidx5 = getelementptr inbounds [6 x [6 x i32]], [6 x [6 x i32]]* @M, i64 0, i64 %idxprom4, !dbg !134
  %arrayidx6 = getelementptr inbounds [6 x i32], [6 x i32]* %arrayidx5, i64 0, i64 %idxprom3, !dbg !134
  %7 = load i32, i32* %arrayidx6, align 4, !dbg !134
  store i32 %7, i32* %P2, align 4, !dbg !131
  %8 = load i8, i8* %alice, align 1, !dbg !136
  %tobool = trunc i8 %8 to i1, !dbg !136
  br i1 %tobool, label %if.then, label %if.else, !dbg !138

if.then:                                          ; preds = %while.body
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.1, i32 0, i32 0)), !dbg !139
  br label %if.end, !dbg !141

if.else:                                          ; preds = %while.body
  %call7 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i32 0, i32 0)), !dbg !142
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %9 = load i32, i32* %P1, align 4, !dbg !144
  %10 = load i32, i32* %P2, align 4, !dbg !146
  %cmp8 = icmp sle i32 %9, %10, !dbg !147
  br i1 %cmp8, label %if.then9, label %if.else14, !dbg !148

if.then9:                                         ; preds = %if.end
  %11 = load i32, i32* %i, align 4, !dbg !149
  %add10 = add nsw i32 %11, 1, !dbg !151
  %12 = load i32, i32* %i, align 4, !dbg !152
  %idxprom11 = sext i32 %12 to i64, !dbg !153
  %arrayidx12 = getelementptr inbounds [6 x i32], [6 x i32]* @V, i64 0, i64 %idxprom11, !dbg !153
  %13 = load i32, i32* %arrayidx12, align 4, !dbg !153
  %call13 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.3, i32 0, i32 0), i32 %add10, i32 %13), !dbg !154
  %14 = load i32, i32* %i, align 4, !dbg !155
  %inc = add nsw i32 %14, 1, !dbg !155
  store i32 %inc, i32* %i, align 4, !dbg !155
  br label %if.end19, !dbg !156

if.else14:                                        ; preds = %if.end
  %15 = load i32, i32* %j, align 4, !dbg !157
  %add15 = add nsw i32 %15, 1, !dbg !159
  %16 = load i32, i32* %j, align 4, !dbg !160
  %idxprom16 = sext i32 %16 to i64, !dbg !161
  %arrayidx17 = getelementptr inbounds [6 x i32], [6 x i32]* @V, i64 0, i64 %idxprom16, !dbg !161
  %17 = load i32, i32* %arrayidx17, align 4, !dbg !161
  %call18 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.3, i32 0, i32 0), i32 %add15, i32 %17), !dbg !162
  %18 = load i32, i32* %j, align 4, !dbg !163
  %dec = add nsw i32 %18, -1, !dbg !163
  store i32 %dec, i32* %j, align 4, !dbg !163
  br label %if.end19

if.end19:                                         ; preds = %if.else14, %if.then9
  %19 = load i8, i8* %alice, align 1, !dbg !164
  %tobool20 = trunc i8 %19 to i1, !dbg !164
  br i1 %tobool20, label %if.then21, label %if.else23, !dbg !166

if.then21:                                        ; preds = %if.end19
  %call22 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.4, i32 0, i32 0)), !dbg !167
  br label %if.end25, !dbg !169

if.else23:                                        ; preds = %if.end19
  %call24 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.5, i32 0, i32 0)), !dbg !170
  br label %if.end25

if.end25:                                         ; preds = %if.else23, %if.then21
  %20 = load i8, i8* %alice, align 1, !dbg !172
  %tobool26 = trunc i8 %20 to i1, !dbg !172
  %lnot = xor i1 %tobool26, true, !dbg !173
  %frombool = zext i1 %lnot to i8, !dbg !174
  store i8 %frombool, i8* %alice, align 1, !dbg !174
  br label %while.cond, !dbg !175

while.end:                                        ; preds = %while.cond
  ret void, !dbg !177
}

; Function Attrs: nounwind uwtable
define i32 @maxMoney() #0 !dbg !9 {
entry:
  %s = alloca i32, align 4
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %s, metadata !178, metadata !31), !dbg !179
  call void @llvm.dbg.declare(metadata i32* %i, metadata !180, metadata !31), !dbg !181
  call void @llvm.dbg.declare(metadata i32* %j, metadata !182, metadata !31), !dbg !183
  store i32 0, i32* %s, align 4, !dbg !184
  br label %for.cond, !dbg !186

for.cond:                                         ; preds = %for.inc137, %entry
  %0 = load i32, i32* %s, align 4, !dbg !187
  %cmp = icmp slt i32 %0, 6, !dbg !190
  br i1 %cmp, label %for.body, label %for.end139, !dbg !191

for.body:                                         ; preds = %for.cond
  store i32 0, i32* %i, align 4, !dbg !192
  %1 = load i32, i32* %s, align 4, !dbg !195
  store i32 %1, i32* %j, align 4, !dbg !196
  br label %for.cond1, !dbg !197

for.cond1:                                        ; preds = %for.inc, %for.body
  %2 = load i32, i32* %j, align 4, !dbg !198
  %cmp2 = icmp slt i32 %2, 6, !dbg !201
  br i1 %cmp2, label %for.body3, label %for.end, !dbg !202

for.body3:                                        ; preds = %for.cond1
  %3 = load i32, i32* %j, align 4, !dbg !203
  %idxprom = sext i32 %3 to i64, !dbg !205
  %4 = load i32, i32* %i, align 4, !dbg !206
  %idxprom4 = sext i32 %4 to i64, !dbg !205
  %arrayidx = getelementptr inbounds [6 x [6 x i32]], [6 x [6 x i32]]* @Y, i64 0, i64 %idxprom4, !dbg !205
  %arrayidx5 = getelementptr inbounds [6 x i32], [6 x i32]* %arrayidx, i64 0, i64 %idxprom, !dbg !205
  store i32 0, i32* %arrayidx5, align 4, !dbg !207
  %5 = load i32, i32* %i, align 4, !dbg !208
  %add = add nsw i32 %5, 1, !dbg !210
  %cmp6 = icmp slt i32 %add, 6, !dbg !211
  br i1 %cmp6, label %land.lhs.true, label %if.end, !dbg !212

land.lhs.true:                                    ; preds = %for.body3
  %6 = load i32, i32* %j, align 4, !dbg !213
  %sub = sub nsw i32 %6, 1, !dbg !215
  %cmp7 = icmp sge i32 %sub, 0, !dbg !216
  br i1 %cmp7, label %if.then, label %if.end, !dbg !217

if.then:                                          ; preds = %land.lhs.true
  %7 = load i32, i32* %j, align 4, !dbg !218
  %sub8 = sub nsw i32 %7, 1, !dbg !220
  %idxprom9 = sext i32 %sub8 to i64, !dbg !221
  %8 = load i32, i32* %i, align 4, !dbg !222
  %add10 = add nsw i32 %8, 1, !dbg !223
  %idxprom11 = sext i32 %add10 to i64, !dbg !221
  %arrayidx12 = getelementptr inbounds [6 x [6 x i32]], [6 x [6 x i32]]* @M, i64 0, i64 %idxprom11, !dbg !221
  %arrayidx13 = getelementptr inbounds [6 x i32], [6 x i32]* %arrayidx12, i64 0, i64 %idxprom9, !dbg !221
  %9 = load i32, i32* %arrayidx13, align 4, !dbg !221
  %10 = load i32, i32* %j, align 4, !dbg !224
  %idxprom14 = sext i32 %10 to i64, !dbg !225
  %11 = load i32, i32* %i, align 4, !dbg !226
  %idxprom15 = sext i32 %11 to i64, !dbg !225
  %arrayidx16 = getelementptr inbounds [6 x [6 x i32]], [6 x [6 x i32]]* @Y, i64 0, i64 %idxprom15, !dbg !225
  %arrayidx17 = getelementptr inbounds [6 x i32], [6 x i32]* %arrayidx16, i64 0, i64 %idxprom14, !dbg !225
  store i32 %9, i32* %arrayidx17, align 4, !dbg !227
  br label %if.end, !dbg !228

if.end:                                           ; preds = %if.then, %land.lhs.true, %for.body3
  %12 = load i32, i32* %j, align 4, !dbg !229
  %idxprom18 = sext i32 %12 to i64, !dbg !230
  %13 = load i32, i32* %i, align 4, !dbg !231
  %idxprom19 = sext i32 %13 to i64, !dbg !230
  %arrayidx20 = getelementptr inbounds [6 x [6 x i32]], [6 x [6 x i32]]* @X, i64 0, i64 %idxprom19, !dbg !230
  %arrayidx21 = getelementptr inbounds [6 x i32], [6 x i32]* %arrayidx20, i64 0, i64 %idxprom18, !dbg !230
  store i32 0, i32* %arrayidx21, align 4, !dbg !232
  %14 = load i32, i32* %i, align 4, !dbg !233
  %add22 = add nsw i32 %14, 2, !dbg !235
  %cmp23 = icmp slt i32 %add22, 6, !dbg !236
  br i1 %cmp23, label %if.then24, label %if.end53, !dbg !237

if.then24:                                        ; preds = %if.end
  %15 = load i32, i32* %j, align 4, !dbg !238
  %idxprom25 = sext i32 %15 to i64, !dbg !240
  %16 = load i32, i32* %i, align 4, !dbg !241
  %add26 = add nsw i32 %16, 2, !dbg !242
  %idxprom27 = sext i32 %add26 to i64, !dbg !240
  %arrayidx28 = getelementptr inbounds [6 x [6 x i32]], [6 x [6 x i32]]* @M, i64 0, i64 %idxprom27, !dbg !240
  %arrayidx29 = getelementptr inbounds [6 x i32], [6 x i32]* %arrayidx28, i64 0, i64 %idxprom25, !dbg !240
  %17 = load i32, i32* %arrayidx29, align 4, !dbg !240
  %18 = load i32, i32* %j, align 4, !dbg !243
  %idxprom30 = sext i32 %18 to i64, !dbg !244
  %19 = load i32, i32* %i, align 4, !dbg !245
  %idxprom31 = sext i32 %19 to i64, !dbg !244
  %arrayidx32 = getelementptr inbounds [6 x [6 x i32]], [6 x [6 x i32]]* @X, i64 0, i64 %idxprom31, !dbg !244
  %arrayidx33 = getelementptr inbounds [6 x i32], [6 x i32]* %arrayidx32, i64 0, i64 %idxprom30, !dbg !244
  store i32 %17, i32* %arrayidx33, align 4, !dbg !246
  %20 = load i32, i32* %j, align 4, !dbg !247
  %idxprom34 = sext i32 %20 to i64, !dbg !249
  %21 = load i32, i32* %i, align 4, !dbg !250
  %idxprom35 = sext i32 %21 to i64, !dbg !249
  %arrayidx36 = getelementptr inbounds [6 x [6 x i32]], [6 x [6 x i32]]* @X, i64 0, i64 %idxprom35, !dbg !249
  %arrayidx37 = getelementptr inbounds [6 x i32], [6 x i32]* %arrayidx36, i64 0, i64 %idxprom34, !dbg !249
  %22 = load i32, i32* %arrayidx37, align 4, !dbg !249
  %23 = load i32, i32* %j, align 4, !dbg !251
  %idxprom38 = sext i32 %23 to i64, !dbg !252
  %24 = load i32, i32* %i, align 4, !dbg !253
  %idxprom39 = sext i32 %24 to i64, !dbg !252
  %arrayidx40 = getelementptr inbounds [6 x [6 x i32]], [6 x [6 x i32]]* @Y, i64 0, i64 %idxprom39, !dbg !252
  %arrayidx41 = getelementptr inbounds [6 x i32], [6 x i32]* %arrayidx40, i64 0, i64 %idxprom38, !dbg !252
  %25 = load i32, i32* %arrayidx41, align 4, !dbg !252
  %cmp42 = icmp sgt i32 %22, %25, !dbg !254
  br i1 %cmp42, label %if.then43, label %if.end52, !dbg !255

if.then43:                                        ; preds = %if.then24
  %26 = load i32, i32* %j, align 4, !dbg !256
  %idxprom44 = sext i32 %26 to i64, !dbg !258
  %27 = load i32, i32* %i, align 4, !dbg !259
  %idxprom45 = sext i32 %27 to i64, !dbg !258
  %arrayidx46 = getelementptr inbounds [6 x [6 x i32]], [6 x [6 x i32]]* @Y, i64 0, i64 %idxprom45, !dbg !258
  %arrayidx47 = getelementptr inbounds [6 x i32], [6 x i32]* %arrayidx46, i64 0, i64 %idxprom44, !dbg !258
  %28 = load i32, i32* %arrayidx47, align 4, !dbg !258
  %29 = load i32, i32* %j, align 4, !dbg !260
  %idxprom48 = sext i32 %29 to i64, !dbg !261
  %30 = load i32, i32* %i, align 4, !dbg !262
  %idxprom49 = sext i32 %30 to i64, !dbg !261
  %arrayidx50 = getelementptr inbounds [6 x [6 x i32]], [6 x [6 x i32]]* @X, i64 0, i64 %idxprom49, !dbg !261
  %arrayidx51 = getelementptr inbounds [6 x i32], [6 x i32]* %arrayidx50, i64 0, i64 %idxprom48, !dbg !261
  store i32 %28, i32* %arrayidx51, align 4, !dbg !263
  br label %if.end52, !dbg !264

if.end52:                                         ; preds = %if.then43, %if.then24
  br label %if.end53, !dbg !265

if.end53:                                         ; preds = %if.end52, %if.end
  %31 = load i32, i32* %j, align 4, !dbg !266
  %idxprom54 = sext i32 %31 to i64, !dbg !267
  %32 = load i32, i32* %i, align 4, !dbg !268
  %idxprom55 = sext i32 %32 to i64, !dbg !267
  %arrayidx56 = getelementptr inbounds [6 x [6 x i32]], [6 x [6 x i32]]* @Z, i64 0, i64 %idxprom55, !dbg !267
  %arrayidx57 = getelementptr inbounds [6 x i32], [6 x i32]* %arrayidx56, i64 0, i64 %idxprom54, !dbg !267
  store i32 0, i32* %arrayidx57, align 4, !dbg !269
  %33 = load i32, i32* %j, align 4, !dbg !270
  %sub58 = sub nsw i32 %33, 1, !dbg !272
  %cmp59 = icmp sgt i32 %sub58, 0, !dbg !273
  br i1 %cmp59, label %if.then60, label %if.end89, !dbg !274

if.then60:                                        ; preds = %if.end53
  %34 = load i32, i32* %j, align 4, !dbg !275
  %sub61 = sub nsw i32 %34, 2, !dbg !277
  %idxprom62 = sext i32 %sub61 to i64, !dbg !278
  %35 = load i32, i32* %i, align 4, !dbg !279
  %idxprom63 = sext i32 %35 to i64, !dbg !278
  %arrayidx64 = getelementptr inbounds [6 x [6 x i32]], [6 x [6 x i32]]* @M, i64 0, i64 %idxprom63, !dbg !278
  %arrayidx65 = getelementptr inbounds [6 x i32], [6 x i32]* %arrayidx64, i64 0, i64 %idxprom62, !dbg !278
  %36 = load i32, i32* %arrayidx65, align 4, !dbg !278
  %37 = load i32, i32* %j, align 4, !dbg !280
  %idxprom66 = sext i32 %37 to i64, !dbg !281
  %38 = load i32, i32* %i, align 4, !dbg !282
  %idxprom67 = sext i32 %38 to i64, !dbg !281
  %arrayidx68 = getelementptr inbounds [6 x [6 x i32]], [6 x [6 x i32]]* @Z, i64 0, i64 %idxprom67, !dbg !281
  %arrayidx69 = getelementptr inbounds [6 x i32], [6 x i32]* %arrayidx68, i64 0, i64 %idxprom66, !dbg !281
  store i32 %36, i32* %arrayidx69, align 4, !dbg !283
  %39 = load i32, i32* %j, align 4, !dbg !284
  %idxprom70 = sext i32 %39 to i64, !dbg !286
  %40 = load i32, i32* %i, align 4, !dbg !287
  %idxprom71 = sext i32 %40 to i64, !dbg !286
  %arrayidx72 = getelementptr inbounds [6 x [6 x i32]], [6 x [6 x i32]]* @Z, i64 0, i64 %idxprom71, !dbg !286
  %arrayidx73 = getelementptr inbounds [6 x i32], [6 x i32]* %arrayidx72, i64 0, i64 %idxprom70, !dbg !286
  %41 = load i32, i32* %arrayidx73, align 4, !dbg !286
  %42 = load i32, i32* %j, align 4, !dbg !288
  %idxprom74 = sext i32 %42 to i64, !dbg !289
  %43 = load i32, i32* %i, align 4, !dbg !290
  %idxprom75 = sext i32 %43 to i64, !dbg !289
  %arrayidx76 = getelementptr inbounds [6 x [6 x i32]], [6 x [6 x i32]]* @Y, i64 0, i64 %idxprom75, !dbg !289
  %arrayidx77 = getelementptr inbounds [6 x i32], [6 x i32]* %arrayidx76, i64 0, i64 %idxprom74, !dbg !289
  %44 = load i32, i32* %arrayidx77, align 4, !dbg !289
  %cmp78 = icmp sgt i32 %41, %44, !dbg !291
  br i1 %cmp78, label %if.then79, label %if.end88, !dbg !292

if.then79:                                        ; preds = %if.then60
  %45 = load i32, i32* %j, align 4, !dbg !293
  %idxprom80 = sext i32 %45 to i64, !dbg !295
  %46 = load i32, i32* %i, align 4, !dbg !296
  %idxprom81 = sext i32 %46 to i64, !dbg !295
  %arrayidx82 = getelementptr inbounds [6 x [6 x i32]], [6 x [6 x i32]]* @Y, i64 0, i64 %idxprom81, !dbg !295
  %arrayidx83 = getelementptr inbounds [6 x i32], [6 x i32]* %arrayidx82, i64 0, i64 %idxprom80, !dbg !295
  %47 = load i32, i32* %arrayidx83, align 4, !dbg !295
  %48 = load i32, i32* %j, align 4, !dbg !297
  %idxprom84 = sext i32 %48 to i64, !dbg !298
  %49 = load i32, i32* %i, align 4, !dbg !299
  %idxprom85 = sext i32 %49 to i64, !dbg !298
  %arrayidx86 = getelementptr inbounds [6 x [6 x i32]], [6 x [6 x i32]]* @Z, i64 0, i64 %idxprom85, !dbg !298
  %arrayidx87 = getelementptr inbounds [6 x i32], [6 x i32]* %arrayidx86, i64 0, i64 %idxprom84, !dbg !298
  store i32 %47, i32* %arrayidx87, align 4, !dbg !300
  br label %if.end88, !dbg !301

if.end88:                                         ; preds = %if.then79, %if.then60
  br label %if.end89, !dbg !302

if.end89:                                         ; preds = %if.end88, %if.end53
  br label %for.inc, !dbg !303

for.inc:                                          ; preds = %if.end89
  %50 = load i32, i32* %i, align 4, !dbg !304
  %inc = add nsw i32 %50, 1, !dbg !304
  store i32 %inc, i32* %i, align 4, !dbg !304
  %51 = load i32, i32* %j, align 4, !dbg !306
  %inc90 = add nsw i32 %51, 1, !dbg !306
  store i32 %inc90, i32* %j, align 4, !dbg !306
  br label %for.cond1, !dbg !307

for.end:                                          ; preds = %for.cond1
  store i32 0, i32* %i, align 4, !dbg !308
  %52 = load i32, i32* %s, align 4, !dbg !310
  store i32 %52, i32* %j, align 4, !dbg !311
  br label %for.cond91, !dbg !312

for.cond91:                                       ; preds = %for.inc133, %for.end
  %53 = load i32, i32* %j, align 4, !dbg !313
  %cmp92 = icmp slt i32 %53, 6, !dbg !316
  br i1 %cmp92, label %for.body93, label %for.end136, !dbg !317

for.body93:                                       ; preds = %for.cond91
  %54 = load i32, i32* %i, align 4, !dbg !318
  %idxprom94 = sext i32 %54 to i64, !dbg !321
  %arrayidx95 = getelementptr inbounds [6 x i32], [6 x i32]* @V, i64 0, i64 %idxprom94, !dbg !321
  %55 = load i32, i32* %arrayidx95, align 4, !dbg !321
  %56 = load i32, i32* %j, align 4, !dbg !322
  %idxprom96 = sext i32 %56 to i64, !dbg !323
  %57 = load i32, i32* %i, align 4, !dbg !324
  %idxprom97 = sext i32 %57 to i64, !dbg !323
  %arrayidx98 = getelementptr inbounds [6 x [6 x i32]], [6 x [6 x i32]]* @X, i64 0, i64 %idxprom97, !dbg !323
  %arrayidx99 = getelementptr inbounds [6 x i32], [6 x i32]* %arrayidx98, i64 0, i64 %idxprom96, !dbg !323
  %58 = load i32, i32* %arrayidx99, align 4, !dbg !323
  %add100 = add nsw i32 %55, %58, !dbg !325
  %59 = load i32, i32* %j, align 4, !dbg !326
  %idxprom101 = sext i32 %59 to i64, !dbg !327
  %arrayidx102 = getelementptr inbounds [6 x i32], [6 x i32]* @V, i64 0, i64 %idxprom101, !dbg !327
  %60 = load i32, i32* %arrayidx102, align 4, !dbg !327
  %61 = load i32, i32* %j, align 4, !dbg !328
  %idxprom103 = sext i32 %61 to i64, !dbg !329
  %62 = load i32, i32* %i, align 4, !dbg !330
  %idxprom104 = sext i32 %62 to i64, !dbg !329
  %arrayidx105 = getelementptr inbounds [6 x [6 x i32]], [6 x [6 x i32]]* @Z, i64 0, i64 %idxprom104, !dbg !329
  %arrayidx106 = getelementptr inbounds [6 x i32], [6 x i32]* %arrayidx105, i64 0, i64 %idxprom103, !dbg !329
  %63 = load i32, i32* %arrayidx106, align 4, !dbg !329
  %add107 = add nsw i32 %60, %63, !dbg !331
  %cmp108 = icmp sgt i32 %add100, %add107, !dbg !332
  br i1 %cmp108, label %if.then109, label %if.else, !dbg !333

if.then109:                                       ; preds = %for.body93
  %64 = load i32, i32* %i, align 4, !dbg !334
  %idxprom110 = sext i32 %64 to i64, !dbg !336
  %arrayidx111 = getelementptr inbounds [6 x i32], [6 x i32]* @V, i64 0, i64 %idxprom110, !dbg !336
  %65 = load i32, i32* %arrayidx111, align 4, !dbg !336
  %66 = load i32, i32* %j, align 4, !dbg !337
  %idxprom112 = sext i32 %66 to i64, !dbg !338
  %67 = load i32, i32* %i, align 4, !dbg !339
  %idxprom113 = sext i32 %67 to i64, !dbg !338
  %arrayidx114 = getelementptr inbounds [6 x [6 x i32]], [6 x [6 x i32]]* @X, i64 0, i64 %idxprom113, !dbg !338
  %arrayidx115 = getelementptr inbounds [6 x i32], [6 x i32]* %arrayidx114, i64 0, i64 %idxprom112, !dbg !338
  %68 = load i32, i32* %arrayidx115, align 4, !dbg !338
  %add116 = add nsw i32 %65, %68, !dbg !340
  %69 = load i32, i32* %j, align 4, !dbg !341
  %idxprom117 = sext i32 %69 to i64, !dbg !342
  %70 = load i32, i32* %i, align 4, !dbg !343
  %idxprom118 = sext i32 %70 to i64, !dbg !342
  %arrayidx119 = getelementptr inbounds [6 x [6 x i32]], [6 x [6 x i32]]* @M, i64 0, i64 %idxprom118, !dbg !342
  %arrayidx120 = getelementptr inbounds [6 x i32], [6 x i32]* %arrayidx119, i64 0, i64 %idxprom117, !dbg !342
  store i32 %add116, i32* %arrayidx120, align 4, !dbg !344
  br label %if.end132, !dbg !345

if.else:                                          ; preds = %for.body93
  %71 = load i32, i32* %j, align 4, !dbg !346
  %idxprom121 = sext i32 %71 to i64, !dbg !348
  %arrayidx122 = getelementptr inbounds [6 x i32], [6 x i32]* @V, i64 0, i64 %idxprom121, !dbg !348
  %72 = load i32, i32* %arrayidx122, align 4, !dbg !348
  %73 = load i32, i32* %j, align 4, !dbg !349
  %idxprom123 = sext i32 %73 to i64, !dbg !350
  %74 = load i32, i32* %i, align 4, !dbg !351
  %idxprom124 = sext i32 %74 to i64, !dbg !350
  %arrayidx125 = getelementptr inbounds [6 x [6 x i32]], [6 x [6 x i32]]* @Z, i64 0, i64 %idxprom124, !dbg !350
  %arrayidx126 = getelementptr inbounds [6 x i32], [6 x i32]* %arrayidx125, i64 0, i64 %idxprom123, !dbg !350
  %75 = load i32, i32* %arrayidx126, align 4, !dbg !350
  %add127 = add nsw i32 %72, %75, !dbg !352
  %76 = load i32, i32* %j, align 4, !dbg !353
  %idxprom128 = sext i32 %76 to i64, !dbg !354
  %77 = load i32, i32* %i, align 4, !dbg !355
  %idxprom129 = sext i32 %77 to i64, !dbg !354
  %arrayidx130 = getelementptr inbounds [6 x [6 x i32]], [6 x [6 x i32]]* @M, i64 0, i64 %idxprom129, !dbg !354
  %arrayidx131 = getelementptr inbounds [6 x i32], [6 x i32]* %arrayidx130, i64 0, i64 %idxprom128, !dbg !354
  store i32 %add127, i32* %arrayidx131, align 4, !dbg !356
  br label %if.end132

if.end132:                                        ; preds = %if.else, %if.then109
  br label %for.inc133, !dbg !357

for.inc133:                                       ; preds = %if.end132
  %78 = load i32, i32* %i, align 4, !dbg !358
  %inc134 = add nsw i32 %78, 1, !dbg !358
  store i32 %inc134, i32* %i, align 4, !dbg !358
  %79 = load i32, i32* %j, align 4, !dbg !360
  %inc135 = add nsw i32 %79, 1, !dbg !360
  store i32 %inc135, i32* %j, align 4, !dbg !360
  br label %for.cond91, !dbg !361

for.end136:                                       ; preds = %for.cond91
  br label %for.inc137, !dbg !362

for.inc137:                                       ; preds = %for.end136
  %80 = load i32, i32* %s, align 4, !dbg !363
  %inc138 = add nsw i32 %80, 1, !dbg !363
  store i32 %inc138, i32* %s, align 4, !dbg !363
  br label %for.cond, !dbg !365

for.end139:                                       ; preds = %for.cond
  %81 = load i32, i32* getelementptr inbounds ([6 x [6 x i32]], [6 x [6 x i32]]* @M, i64 0, i64 0, i64 5), align 4, !dbg !366
  ret i32 %81, !dbg !367
}

; Function Attrs: nounwind uwtable
define i32 @main() #0 !dbg !13 {
entry:
  %call = call i32 @maxMoney(), !dbg !368
  call void @sumMoves(), !dbg !369
  %0 = load i32, i32* @sum_alice, align 4, !dbg !370
  %1 = load i32, i32* getelementptr inbounds ([6 x [6 x i32]], [6 x [6 x i32]]* @M, i64 0, i64 0, i64 5), align 4, !dbg !372
  %cmp = icmp ne i32 %0, %1, !dbg !373
  br i1 %cmp, label %if.then, label %if.end, !dbg !374

if.then:                                          ; preds = %entry
  %call1 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([24 x i8], [24 x i8]* @.str.6, i32 0, i32 0)), !dbg !375
  call void @exit(i32 -1) #4, !dbg !377
  unreachable, !dbg !377

if.end:                                           ; preds = %entry
  %2 = load i32, i32* @sum_alice, align 4, !dbg !378
  %3 = load i32, i32* @sum_bob, align 4, !dbg !380
  %cmp2 = icmp slt i32 %2, %3, !dbg !381
  br i1 %cmp2, label %if.then3, label %if.end5, !dbg !382

if.then3:                                         ; preds = %if.end
  %call4 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([28 x i8], [28 x i8]* @.str.7, i32 0, i32 0)), !dbg !383
  call void @exit(i32 -1) #4, !dbg !385
  unreachable, !dbg !385

if.end5:                                          ; preds = %if.end
  %4 = load i32, i32* @sum_alice, align 4, !dbg !386
  %call6 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([54 x i8], [54 x i8]* @.str.8, i32 0, i32 0), i32 %4), !dbg !387
  %5 = load i32, i32* @sum_bob, align 4, !dbg !388
  %call7 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([52 x i8], [52 x i8]* @.str.9, i32 0, i32 0), i32 %5), !dbg !389
  ret i32 0, !dbg !390
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

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 3.9.0 (http://llvm.org/git/clang.git cf7bc8edf8cccb1b5de656c403cb55ad44132e98) (http://llvm.org/git/llvm.git 22706dc4c03305692f494d0e42a6de1050d0ec62)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, subprograms: !3, globals: !14)
!1 = !DIFile(filename: "CoinGame.c", directory: "/home/sam/workspace/WhileyOpenCL/polly/CoinGame/impl/handwritten")
!2 = !{}
!3 = !{!4, !7, !8, !9, !13}
!4 = distinct !DISubprogram(name: "init", scope: !1, file: !1, line: 25, type: !5, isLocal: false, isDefinition: true, scopeLine: 25, isOptimized: false, variables: !2)
!5 = !DISubroutineType(types: !6)
!6 = !{null}
!7 = distinct !DISubprogram(name: "sumMoves", scope: !1, file: !1, line: 34, type: !5, isLocal: false, isDefinition: true, scopeLine: 34, isOptimized: false, variables: !2)
!8 = distinct !DISubprogram(name: "printMoves", scope: !1, file: !1, line: 62, type: !5, isLocal: false, isDefinition: true, scopeLine: 62, isOptimized: false, variables: !2)
!9 = distinct !DISubprogram(name: "maxMoney", scope: !1, file: !1, line: 91, type: !10, isLocal: false, isDefinition: true, scopeLine: 91, isOptimized: false, variables: !2)
!10 = !DISubroutineType(types: !11)
!11 = !{!12}
!12 = !DIBasicType(name: "int", size: 32, align: 32, encoding: DW_ATE_signed)
!13 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 142, type: !10, isLocal: false, isDefinition: true, scopeLine: 142, isOptimized: false, variables: !2)
!14 = !{!15, !19, !20, !21, !24, !25, !26}
!15 = !DIGlobalVariable(name: "V", scope: !0, file: !1, line: 14, type: !16, isLocal: false, isDefinition: true, variable: [6 x i32]* @V)
!16 = !DICompositeType(tag: DW_TAG_array_type, baseType: !12, size: 192, align: 32, elements: !17)
!17 = !{!18}
!18 = !DISubrange(count: 6)
!19 = !DIGlobalVariable(name: "sum_alice", scope: !0, file: !1, line: 23, type: !12, isLocal: false, isDefinition: true, variable: i32* @sum_alice)
!20 = !DIGlobalVariable(name: "sum_bob", scope: !0, file: !1, line: 23, type: !12, isLocal: false, isDefinition: true, variable: i32* @sum_bob)
!21 = !DIGlobalVariable(name: "M", scope: !0, file: !1, line: 17, type: !22, isLocal: false, isDefinition: true, variable: [6 x [6 x i32]]* @M)
!22 = !DICompositeType(tag: DW_TAG_array_type, baseType: !12, size: 1152, align: 32, elements: !23)
!23 = !{!18, !18}
!24 = !DIGlobalVariable(name: "X", scope: !0, file: !1, line: 20, type: !22, isLocal: false, isDefinition: true, variable: [6 x [6 x i32]]* @X)
!25 = !DIGlobalVariable(name: "Y", scope: !0, file: !1, line: 21, type: !22, isLocal: false, isDefinition: true, variable: [6 x [6 x i32]]* @Y)
!26 = !DIGlobalVariable(name: "Z", scope: !0, file: !1, line: 22, type: !22, isLocal: false, isDefinition: true, variable: [6 x [6 x i32]]* @Z)
!27 = !{i32 2, !"Dwarf Version", i32 4}
!28 = !{i32 2, !"Debug Info Version", i32 3}
!29 = !{!"clang version 3.9.0 (http://llvm.org/git/clang.git cf7bc8edf8cccb1b5de656c403cb55ad44132e98) (http://llvm.org/git/llvm.git 22706dc4c03305692f494d0e42a6de1050d0ec62)"}
!30 = !DILocalVariable(name: "i", scope: !4, file: !1, line: 26, type: !12)
!31 = !DIExpression()
!32 = !DILocation(line: 26, column: 6, scope: !4)
!33 = !DILocation(line: 28, column: 2, scope: !4)
!34 = !DILocation(line: 29, column: 9, scope: !35)
!35 = distinct !DILexicalBlock(scope: !4, file: !1, line: 29, column: 2)
!36 = !DILocation(line: 29, column: 7, scope: !35)
!37 = !DILocation(line: 29, column: 14, scope: !38)
!38 = !DILexicalBlockFile(scope: !39, file: !1, discriminator: 1)
!39 = distinct !DILexicalBlock(scope: !35, file: !1, line: 29, column: 2)
!40 = !DILocation(line: 29, column: 16, scope: !38)
!41 = !DILocation(line: 29, column: 2, scope: !38)
!42 = !DILocation(line: 30, column: 10, scope: !43)
!43 = distinct !DILexicalBlock(scope: !39, file: !1, line: 29, column: 26)
!44 = !DILocation(line: 30, column: 5, scope: !43)
!45 = !DILocation(line: 30, column: 3, scope: !43)
!46 = !DILocation(line: 30, column: 8, scope: !43)
!47 = !DILocation(line: 31, column: 2, scope: !43)
!48 = !DILocation(line: 29, column: 22, scope: !49)
!49 = !DILexicalBlockFile(scope: !39, file: !1, discriminator: 2)
!50 = !DILocation(line: 29, column: 2, scope: !49)
!51 = !DILocation(line: 32, column: 1, scope: !4)
!52 = !DILocalVariable(name: "i", scope: !7, file: !1, line: 35, type: !12)
!53 = !DILocation(line: 35, column: 6, scope: !7)
!54 = !DILocalVariable(name: "j", scope: !7, file: !1, line: 35, type: !12)
!55 = !DILocation(line: 35, column: 13, scope: !7)
!56 = !DILocalVariable(name: "alice", scope: !7, file: !1, line: 36, type: !12)
!57 = !DILocation(line: 36, column: 6, scope: !7)
!58 = !DILocation(line: 37, column: 2, scope: !7)
!59 = !DILocation(line: 37, column: 9, scope: !60)
!60 = !DILexicalBlockFile(scope: !7, file: !1, discriminator: 1)
!61 = !DILocation(line: 37, column: 14, scope: !60)
!62 = !DILocation(line: 37, column: 11, scope: !60)
!63 = !DILocation(line: 37, column: 2, scope: !60)
!64 = !DILocalVariable(name: "P1", scope: !65, file: !1, line: 38, type: !12)
!65 = distinct !DILexicalBlock(scope: !7, file: !1, line: 37, column: 17)
!66 = !DILocation(line: 38, column: 7, scope: !65)
!67 = !DILocation(line: 38, column: 21, scope: !65)
!68 = !DILocation(line: 38, column: 12, scope: !65)
!69 = !DILocation(line: 38, column: 14, scope: !65)
!70 = !DILocation(line: 38, column: 16, scope: !65)
!71 = !DILocalVariable(name: "P2", scope: !65, file: !1, line: 39, type: !12)
!72 = !DILocation(line: 39, column: 7, scope: !65)
!73 = !DILocation(line: 39, column: 17, scope: !65)
!74 = !DILocation(line: 39, column: 19, scope: !65)
!75 = !DILocation(line: 39, column: 12, scope: !65)
!76 = !DILocation(line: 39, column: 14, scope: !65)
!77 = !DILocalVariable(name: "coin", scope: !65, file: !1, line: 40, type: !12)
!78 = !DILocation(line: 40, column: 7, scope: !65)
!79 = !DILocation(line: 41, column: 7, scope: !80)
!80 = distinct !DILexicalBlock(scope: !65, file: !1, line: 41, column: 7)
!81 = !DILocation(line: 41, column: 13, scope: !80)
!82 = !DILocation(line: 41, column: 10, scope: !80)
!83 = !DILocation(line: 41, column: 7, scope: !65)
!84 = !DILocation(line: 43, column: 13, scope: !85)
!85 = distinct !DILexicalBlock(scope: !80, file: !1, line: 41, column: 17)
!86 = !DILocation(line: 43, column: 11, scope: !85)
!87 = !DILocation(line: 43, column: 9, scope: !85)
!88 = !DILocation(line: 44, column: 5, scope: !85)
!89 = !DILocation(line: 45, column: 3, scope: !85)
!90 = !DILocation(line: 47, column: 13, scope: !91)
!91 = distinct !DILexicalBlock(scope: !80, file: !1, line: 45, column: 10)
!92 = !DILocation(line: 47, column: 11, scope: !91)
!93 = !DILocation(line: 47, column: 9, scope: !91)
!94 = !DILocation(line: 48, column: 5, scope: !91)
!95 = !DILocation(line: 50, column: 7, scope: !96)
!96 = distinct !DILexicalBlock(scope: !65, file: !1, line: 50, column: 7)
!97 = !DILocation(line: 50, column: 7, scope: !65)
!98 = !DILocation(line: 51, column: 17, scope: !99)
!99 = distinct !DILexicalBlock(scope: !96, file: !1, line: 50, column: 14)
!100 = !DILocation(line: 51, column: 14, scope: !99)
!101 = !DILocation(line: 52, column: 10, scope: !99)
!102 = !DILocation(line: 53, column: 3, scope: !99)
!103 = !DILocation(line: 54, column: 15, scope: !104)
!104 = distinct !DILexicalBlock(scope: !96, file: !1, line: 53, column: 10)
!105 = !DILocation(line: 54, column: 12, scope: !104)
!106 = !DILocation(line: 55, column: 10, scope: !104)
!107 = !DILocation(line: 37, column: 2, scope: !108)
!108 = !DILexicalBlockFile(scope: !7, file: !1, discriminator: 2)
!109 = !DILocation(line: 59, column: 1, scope: !7)
!110 = !DILocalVariable(name: "i", scope: !8, file: !1, line: 63, type: !12)
!111 = !DILocation(line: 63, column: 6, scope: !8)
!112 = !DILocalVariable(name: "j", scope: !8, file: !1, line: 63, type: !12)
!113 = !DILocation(line: 63, column: 13, scope: !8)
!114 = !DILocalVariable(name: "alice", scope: !8, file: !1, line: 64, type: !115)
!115 = !DIBasicType(name: "_Bool", size: 8, align: 8, encoding: DW_ATE_boolean)
!116 = !DILocation(line: 64, column: 7, scope: !8)
!117 = !DILocation(line: 65, column: 2, scope: !8)
!118 = !DILocation(line: 65, column: 9, scope: !119)
!119 = !DILexicalBlockFile(scope: !8, file: !1, discriminator: 1)
!120 = !DILocation(line: 65, column: 14, scope: !119)
!121 = !DILocation(line: 65, column: 11, scope: !119)
!122 = !DILocation(line: 65, column: 2, scope: !119)
!123 = !DILocalVariable(name: "P1", scope: !124, file: !1, line: 66, type: !12)
!124 = distinct !DILexicalBlock(scope: !8, file: !1, line: 65, column: 17)
!125 = !DILocation(line: 66, column: 7, scope: !124)
!126 = !DILocation(line: 66, column: 21, scope: !124)
!127 = !DILocation(line: 66, column: 12, scope: !124)
!128 = !DILocation(line: 66, column: 14, scope: !124)
!129 = !DILocation(line: 66, column: 16, scope: !124)
!130 = !DILocalVariable(name: "P2", scope: !124, file: !1, line: 67, type: !12)
!131 = !DILocation(line: 67, column: 7, scope: !124)
!132 = !DILocation(line: 67, column: 17, scope: !124)
!133 = !DILocation(line: 67, column: 19, scope: !124)
!134 = !DILocation(line: 67, column: 12, scope: !124)
!135 = !DILocation(line: 67, column: 14, scope: !124)
!136 = !DILocation(line: 68, column: 7, scope: !137)
!137 = distinct !DILexicalBlock(scope: !124, file: !1, line: 68, column: 7)
!138 = !DILocation(line: 68, column: 7, scope: !124)
!139 = !DILocation(line: 69, column: 4, scope: !140)
!140 = distinct !DILexicalBlock(scope: !137, file: !1, line: 68, column: 14)
!141 = !DILocation(line: 70, column: 3, scope: !140)
!142 = !DILocation(line: 71, column: 4, scope: !143)
!143 = distinct !DILexicalBlock(scope: !137, file: !1, line: 70, column: 10)
!144 = !DILocation(line: 74, column: 7, scope: !145)
!145 = distinct !DILexicalBlock(scope: !124, file: !1, line: 74, column: 7)
!146 = !DILocation(line: 74, column: 13, scope: !145)
!147 = !DILocation(line: 74, column: 10, scope: !145)
!148 = !DILocation(line: 74, column: 7, scope: !124)
!149 = !DILocation(line: 75, column: 24, scope: !150)
!150 = distinct !DILexicalBlock(scope: !145, file: !1, line: 74, column: 17)
!151 = !DILocation(line: 75, column: 26, scope: !150)
!152 = !DILocation(line: 75, column: 33, scope: !150)
!153 = !DILocation(line: 75, column: 31, scope: !150)
!154 = !DILocation(line: 75, column: 4, scope: !150)
!155 = !DILocation(line: 76, column: 5, scope: !150)
!156 = !DILocation(line: 77, column: 3, scope: !150)
!157 = !DILocation(line: 78, column: 24, scope: !158)
!158 = distinct !DILexicalBlock(scope: !145, file: !1, line: 77, column: 10)
!159 = !DILocation(line: 78, column: 26, scope: !158)
!160 = !DILocation(line: 78, column: 33, scope: !158)
!161 = !DILocation(line: 78, column: 31, scope: !158)
!162 = !DILocation(line: 78, column: 4, scope: !158)
!163 = !DILocation(line: 79, column: 5, scope: !158)
!164 = !DILocation(line: 81, column: 7, scope: !165)
!165 = distinct !DILexicalBlock(scope: !124, file: !1, line: 81, column: 7)
!166 = !DILocation(line: 81, column: 7, scope: !124)
!167 = !DILocation(line: 82, column: 4, scope: !168)
!168 = distinct !DILexicalBlock(scope: !165, file: !1, line: 81, column: 14)
!169 = !DILocation(line: 83, column: 3, scope: !168)
!170 = !DILocation(line: 84, column: 4, scope: !171)
!171 = distinct !DILexicalBlock(scope: !165, file: !1, line: 83, column: 10)
!172 = !DILocation(line: 86, column: 12, scope: !124)
!173 = !DILocation(line: 86, column: 11, scope: !124)
!174 = !DILocation(line: 86, column: 9, scope: !124)
!175 = !DILocation(line: 65, column: 2, scope: !176)
!176 = !DILexicalBlockFile(scope: !8, file: !1, discriminator: 2)
!177 = !DILocation(line: 89, column: 1, scope: !8)
!178 = !DILocalVariable(name: "s", scope: !9, file: !1, line: 92, type: !12)
!179 = !DILocation(line: 92, column: 6, scope: !9)
!180 = !DILocalVariable(name: "i", scope: !9, file: !1, line: 92, type: !12)
!181 = !DILocation(line: 92, column: 9, scope: !9)
!182 = !DILocalVariable(name: "j", scope: !9, file: !1, line: 92, type: !12)
!183 = !DILocation(line: 92, column: 12, scope: !9)
!184 = !DILocation(line: 93, column: 9, scope: !185)
!185 = distinct !DILexicalBlock(scope: !9, file: !1, line: 93, column: 2)
!186 = !DILocation(line: 93, column: 7, scope: !185)
!187 = !DILocation(line: 93, column: 14, scope: !188)
!188 = !DILexicalBlockFile(scope: !189, file: !1, discriminator: 1)
!189 = distinct !DILexicalBlock(scope: !185, file: !1, line: 93, column: 2)
!190 = !DILocation(line: 93, column: 16, scope: !188)
!191 = !DILocation(line: 93, column: 2, scope: !188)
!192 = !DILocation(line: 95, column: 10, scope: !193)
!193 = distinct !DILexicalBlock(scope: !194, file: !1, line: 95, column: 3)
!194 = distinct !DILexicalBlock(scope: !189, file: !1, line: 93, column: 26)
!195 = !DILocation(line: 95, column: 19, scope: !193)
!196 = !DILocation(line: 95, column: 17, scope: !193)
!197 = !DILocation(line: 95, column: 8, scope: !193)
!198 = !DILocation(line: 95, column: 22, scope: !199)
!199 = !DILexicalBlockFile(scope: !200, file: !1, discriminator: 1)
!200 = distinct !DILexicalBlock(scope: !193, file: !1, line: 95, column: 3)
!201 = !DILocation(line: 95, column: 24, scope: !199)
!202 = !DILocation(line: 95, column: 3, scope: !199)
!203 = !DILocation(line: 99, column: 9, scope: !204)
!204 = distinct !DILexicalBlock(scope: !200, file: !1, line: 95, column: 39)
!205 = !DILocation(line: 99, column: 4, scope: !204)
!206 = !DILocation(line: 99, column: 6, scope: !204)
!207 = !DILocation(line: 99, column: 12, scope: !204)
!208 = !DILocation(line: 100, column: 8, scope: !209)
!209 = distinct !DILexicalBlock(scope: !204, file: !1, line: 100, column: 8)
!210 = !DILocation(line: 100, column: 10, scope: !209)
!211 = !DILocation(line: 100, column: 14, scope: !209)
!212 = !DILocation(line: 100, column: 18, scope: !209)
!213 = !DILocation(line: 100, column: 21, scope: !214)
!214 = !DILexicalBlockFile(scope: !209, file: !1, discriminator: 1)
!215 = !DILocation(line: 100, column: 23, scope: !214)
!216 = !DILocation(line: 100, column: 27, scope: !214)
!217 = !DILocation(line: 100, column: 8, scope: !214)
!218 = !DILocation(line: 101, column: 24, scope: !219)
!219 = distinct !DILexicalBlock(scope: !209, file: !1, line: 100, column: 33)
!220 = !DILocation(line: 101, column: 26, scope: !219)
!221 = !DILocation(line: 101, column: 15, scope: !219)
!222 = !DILocation(line: 101, column: 17, scope: !219)
!223 = !DILocation(line: 101, column: 19, scope: !219)
!224 = !DILocation(line: 101, column: 10, scope: !219)
!225 = !DILocation(line: 101, column: 5, scope: !219)
!226 = !DILocation(line: 101, column: 7, scope: !219)
!227 = !DILocation(line: 101, column: 13, scope: !219)
!228 = !DILocation(line: 102, column: 4, scope: !219)
!229 = !DILocation(line: 104, column: 9, scope: !204)
!230 = !DILocation(line: 104, column: 4, scope: !204)
!231 = !DILocation(line: 104, column: 6, scope: !204)
!232 = !DILocation(line: 104, column: 12, scope: !204)
!233 = !DILocation(line: 105, column: 8, scope: !234)
!234 = distinct !DILexicalBlock(scope: !204, file: !1, line: 105, column: 8)
!235 = !DILocation(line: 105, column: 10, scope: !234)
!236 = !DILocation(line: 105, column: 14, scope: !234)
!237 = !DILocation(line: 105, column: 8, scope: !204)
!238 = !DILocation(line: 106, column: 24, scope: !239)
!239 = distinct !DILexicalBlock(scope: !234, file: !1, line: 105, column: 19)
!240 = !DILocation(line: 106, column: 15, scope: !239)
!241 = !DILocation(line: 106, column: 17, scope: !239)
!242 = !DILocation(line: 106, column: 19, scope: !239)
!243 = !DILocation(line: 106, column: 10, scope: !239)
!244 = !DILocation(line: 106, column: 5, scope: !239)
!245 = !DILocation(line: 106, column: 7, scope: !239)
!246 = !DILocation(line: 106, column: 13, scope: !239)
!247 = !DILocation(line: 107, column: 14, scope: !248)
!248 = distinct !DILexicalBlock(scope: !239, file: !1, line: 107, column: 9)
!249 = !DILocation(line: 107, column: 9, scope: !248)
!250 = !DILocation(line: 107, column: 11, scope: !248)
!251 = !DILocation(line: 107, column: 24, scope: !248)
!252 = !DILocation(line: 107, column: 19, scope: !248)
!253 = !DILocation(line: 107, column: 21, scope: !248)
!254 = !DILocation(line: 107, column: 17, scope: !248)
!255 = !DILocation(line: 107, column: 9, scope: !239)
!256 = !DILocation(line: 108, column: 21, scope: !257)
!257 = distinct !DILexicalBlock(scope: !248, file: !1, line: 107, column: 28)
!258 = !DILocation(line: 108, column: 16, scope: !257)
!259 = !DILocation(line: 108, column: 18, scope: !257)
!260 = !DILocation(line: 108, column: 11, scope: !257)
!261 = !DILocation(line: 108, column: 6, scope: !257)
!262 = !DILocation(line: 108, column: 8, scope: !257)
!263 = !DILocation(line: 108, column: 14, scope: !257)
!264 = !DILocation(line: 109, column: 5, scope: !257)
!265 = !DILocation(line: 110, column: 4, scope: !239)
!266 = !DILocation(line: 112, column: 9, scope: !204)
!267 = !DILocation(line: 112, column: 4, scope: !204)
!268 = !DILocation(line: 112, column: 6, scope: !204)
!269 = !DILocation(line: 112, column: 12, scope: !204)
!270 = !DILocation(line: 113, column: 8, scope: !271)
!271 = distinct !DILexicalBlock(scope: !204, file: !1, line: 113, column: 8)
!272 = !DILocation(line: 113, column: 10, scope: !271)
!273 = !DILocation(line: 113, column: 14, scope: !271)
!274 = !DILocation(line: 113, column: 8, scope: !204)
!275 = !DILocation(line: 114, column: 20, scope: !276)
!276 = distinct !DILexicalBlock(scope: !271, file: !1, line: 113, column: 19)
!277 = !DILocation(line: 114, column: 22, scope: !276)
!278 = !DILocation(line: 114, column: 15, scope: !276)
!279 = !DILocation(line: 114, column: 17, scope: !276)
!280 = !DILocation(line: 114, column: 10, scope: !276)
!281 = !DILocation(line: 114, column: 5, scope: !276)
!282 = !DILocation(line: 114, column: 7, scope: !276)
!283 = !DILocation(line: 114, column: 13, scope: !276)
!284 = !DILocation(line: 115, column: 14, scope: !285)
!285 = distinct !DILexicalBlock(scope: !276, file: !1, line: 115, column: 9)
!286 = !DILocation(line: 115, column: 9, scope: !285)
!287 = !DILocation(line: 115, column: 11, scope: !285)
!288 = !DILocation(line: 115, column: 24, scope: !285)
!289 = !DILocation(line: 115, column: 19, scope: !285)
!290 = !DILocation(line: 115, column: 21, scope: !285)
!291 = !DILocation(line: 115, column: 17, scope: !285)
!292 = !DILocation(line: 115, column: 9, scope: !276)
!293 = !DILocation(line: 116, column: 21, scope: !294)
!294 = distinct !DILexicalBlock(scope: !285, file: !1, line: 115, column: 28)
!295 = !DILocation(line: 116, column: 16, scope: !294)
!296 = !DILocation(line: 116, column: 18, scope: !294)
!297 = !DILocation(line: 116, column: 11, scope: !294)
!298 = !DILocation(line: 116, column: 6, scope: !294)
!299 = !DILocation(line: 116, column: 8, scope: !294)
!300 = !DILocation(line: 116, column: 14, scope: !294)
!301 = !DILocation(line: 117, column: 5, scope: !294)
!302 = !DILocation(line: 118, column: 4, scope: !276)
!303 = !DILocation(line: 120, column: 3, scope: !204)
!304 = !DILocation(line: 95, column: 30, scope: !305)
!305 = !DILexicalBlockFile(scope: !200, file: !1, discriminator: 2)
!306 = !DILocation(line: 95, column: 35, scope: !305)
!307 = !DILocation(line: 95, column: 3, scope: !305)
!308 = !DILocation(line: 123, column: 10, scope: !309)
!309 = distinct !DILexicalBlock(scope: !194, file: !1, line: 123, column: 3)
!310 = !DILocation(line: 123, column: 19, scope: !309)
!311 = !DILocation(line: 123, column: 17, scope: !309)
!312 = !DILocation(line: 123, column: 8, scope: !309)
!313 = !DILocation(line: 123, column: 22, scope: !314)
!314 = !DILexicalBlockFile(scope: !315, file: !1, discriminator: 1)
!315 = distinct !DILexicalBlock(scope: !309, file: !1, line: 123, column: 3)
!316 = !DILocation(line: 123, column: 24, scope: !314)
!317 = !DILocation(line: 123, column: 3, scope: !314)
!318 = !DILocation(line: 127, column: 10, scope: !319)
!319 = distinct !DILexicalBlock(scope: !320, file: !1, line: 127, column: 8)
!320 = distinct !DILexicalBlock(scope: !315, file: !1, line: 123, column: 39)
!321 = !DILocation(line: 127, column: 8, scope: !319)
!322 = !DILocation(line: 127, column: 20, scope: !319)
!323 = !DILocation(line: 127, column: 15, scope: !319)
!324 = !DILocation(line: 127, column: 17, scope: !319)
!325 = !DILocation(line: 127, column: 13, scope: !319)
!326 = !DILocation(line: 127, column: 27, scope: !319)
!327 = !DILocation(line: 127, column: 25, scope: !319)
!328 = !DILocation(line: 127, column: 37, scope: !319)
!329 = !DILocation(line: 127, column: 32, scope: !319)
!330 = !DILocation(line: 127, column: 34, scope: !319)
!331 = !DILocation(line: 127, column: 30, scope: !319)
!332 = !DILocation(line: 127, column: 23, scope: !319)
!333 = !DILocation(line: 127, column: 8, scope: !320)
!334 = !DILocation(line: 128, column: 17, scope: !335)
!335 = distinct !DILexicalBlock(scope: !319, file: !1, line: 127, column: 41)
!336 = !DILocation(line: 128, column: 15, scope: !335)
!337 = !DILocation(line: 128, column: 27, scope: !335)
!338 = !DILocation(line: 128, column: 22, scope: !335)
!339 = !DILocation(line: 128, column: 24, scope: !335)
!340 = !DILocation(line: 128, column: 20, scope: !335)
!341 = !DILocation(line: 128, column: 10, scope: !335)
!342 = !DILocation(line: 128, column: 5, scope: !335)
!343 = !DILocation(line: 128, column: 7, scope: !335)
!344 = !DILocation(line: 128, column: 13, scope: !335)
!345 = !DILocation(line: 129, column: 4, scope: !335)
!346 = !DILocation(line: 130, column: 17, scope: !347)
!347 = distinct !DILexicalBlock(scope: !319, file: !1, line: 129, column: 11)
!348 = !DILocation(line: 130, column: 15, scope: !347)
!349 = !DILocation(line: 130, column: 27, scope: !347)
!350 = !DILocation(line: 130, column: 22, scope: !347)
!351 = !DILocation(line: 130, column: 24, scope: !347)
!352 = !DILocation(line: 130, column: 20, scope: !347)
!353 = !DILocation(line: 130, column: 10, scope: !347)
!354 = !DILocation(line: 130, column: 5, scope: !347)
!355 = !DILocation(line: 130, column: 7, scope: !347)
!356 = !DILocation(line: 130, column: 13, scope: !347)
!357 = !DILocation(line: 136, column: 3, scope: !320)
!358 = !DILocation(line: 123, column: 30, scope: !359)
!359 = !DILexicalBlockFile(scope: !315, file: !1, discriminator: 2)
!360 = !DILocation(line: 123, column: 35, scope: !359)
!361 = !DILocation(line: 123, column: 3, scope: !359)
!362 = !DILocation(line: 138, column: 2, scope: !194)
!363 = !DILocation(line: 93, column: 22, scope: !364)
!364 = !DILexicalBlockFile(scope: !189, file: !1, discriminator: 2)
!365 = !DILocation(line: 93, column: 2, scope: !364)
!366 = !DILocation(line: 140, column: 9, scope: !9)
!367 = !DILocation(line: 140, column: 2, scope: !9)
!368 = !DILocation(line: 144, column: 2, scope: !13)
!369 = !DILocation(line: 145, column: 2, scope: !13)
!370 = !DILocation(line: 148, column: 6, scope: !371)
!371 = distinct !DILexicalBlock(scope: !13, file: !1, line: 148, column: 6)
!372 = !DILocation(line: 148, column: 19, scope: !371)
!373 = !DILocation(line: 148, column: 16, scope: !371)
!374 = !DILocation(line: 148, column: 6, scope: !13)
!375 = !DILocation(line: 149, column: 3, scope: !376)
!376 = distinct !DILexicalBlock(scope: !371, file: !1, line: 148, column: 32)
!377 = !DILocation(line: 150, column: 3, scope: !376)
!378 = !DILocation(line: 153, column: 6, scope: !379)
!379 = distinct !DILexicalBlock(scope: !13, file: !1, line: 153, column: 6)
!380 = !DILocation(line: 153, column: 18, scope: !379)
!381 = !DILocation(line: 153, column: 16, scope: !379)
!382 = !DILocation(line: 153, column: 6, scope: !13)
!383 = !DILocation(line: 154, column: 3, scope: !384)
!384 = distinct !DILexicalBlock(scope: !379, file: !1, line: 153, column: 27)
!385 = !DILocation(line: 155, column: 3, scope: !384)
!386 = !DILocation(line: 158, column: 67, scope: !13)
!387 = !DILocation(line: 158, column: 2, scope: !13)
!388 = !DILocation(line: 159, column: 65, scope: !13)
!389 = !DILocation(line: 159, column: 2, scope: !13)
!390 = !DILocation(line: 160, column: 1, scope: !13)
