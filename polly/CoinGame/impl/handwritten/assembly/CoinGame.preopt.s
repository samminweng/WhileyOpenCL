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
@X = common global [6 x [6 x i32]] zeroinitializer, align 16
@Y = common global [6 x [6 x i32]] zeroinitializer, align 16
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

for.cond:                                         ; preds = %for.inc183, %entry
  %0 = load i32, i32* %s, align 4, !dbg !187
  %cmp = icmp slt i32 %0, 6, !dbg !190
  br i1 %cmp, label %for.body, label %for.end185, !dbg !191

for.body:                                         ; preds = %for.cond
  store i32 0, i32* %i, align 4, !dbg !192
  %1 = load i32, i32* %s, align 4, !dbg !194
  store i32 %1, i32* %j, align 4, !dbg !196
  br label %for.cond1, !dbg !197

for.cond1:                                        ; preds = %for.inc, %for.body
  %2 = load i32, i32* %j, align 4, !dbg !198
  %cmp2 = icmp slt i32 %2, 6, !dbg !201
  br i1 %cmp2, label %for.body3, label %for.end, !dbg !202

for.body3:                                        ; preds = %for.cond1
  %3 = load i32, i32* %i, align 4, !dbg !203
  %cmp4 = icmp slt i32 %3, 6, !dbg !206
  br i1 %cmp4, label %if.then, label %if.end69, !dbg !207

if.then:                                          ; preds = %for.body3
  %4 = load i32, i32* %j, align 4, !dbg !208
  %idxprom = sext i32 %4 to i64, !dbg !210
  %5 = load i32, i32* %i, align 4, !dbg !211
  %idxprom5 = sext i32 %5 to i64, !dbg !210
  %arrayidx = getelementptr inbounds [6 x [6 x i32]], [6 x [6 x i32]]* @X, i64 0, i64 %idxprom5, !dbg !210
  %arrayidx6 = getelementptr inbounds [6 x i32], [6 x i32]* %arrayidx, i64 0, i64 %idxprom, !dbg !210
  store i32 0, i32* %arrayidx6, align 4, !dbg !212
  %6 = load i32, i32* %i, align 4, !dbg !213
  %add = add nsw i32 %6, 2, !dbg !215
  %cmp7 = icmp slt i32 %add, 6, !dbg !216
  br i1 %cmp7, label %if.then8, label %if.end, !dbg !217

if.then8:                                         ; preds = %if.then
  %7 = load i32, i32* %j, align 4, !dbg !218
  %idxprom9 = sext i32 %7 to i64, !dbg !220
  %8 = load i32, i32* %i, align 4, !dbg !221
  %idxprom10 = sext i32 %8 to i64, !dbg !220
  %arrayidx11 = getelementptr inbounds [6 x [6 x i32]], [6 x [6 x i32]]* @X, i64 0, i64 %idxprom10, !dbg !220
  %arrayidx12 = getelementptr inbounds [6 x i32], [6 x i32]* %arrayidx11, i64 0, i64 %idxprom9, !dbg !220
  %9 = load i32, i32* %arrayidx12, align 4, !dbg !220
  %10 = load i32, i32* %j, align 4, !dbg !222
  %idxprom13 = sext i32 %10 to i64, !dbg !223
  %11 = load i32, i32* %i, align 4, !dbg !224
  %add14 = add nsw i32 %11, 2, !dbg !225
  %idxprom15 = sext i32 %add14 to i64, !dbg !223
  %arrayidx16 = getelementptr inbounds [6 x [6 x i32]], [6 x [6 x i32]]* @M, i64 0, i64 %idxprom15, !dbg !223
  %arrayidx17 = getelementptr inbounds [6 x i32], [6 x i32]* %arrayidx16, i64 0, i64 %idxprom13, !dbg !223
  %12 = load i32, i32* %arrayidx17, align 4, !dbg !223
  %add18 = add nsw i32 %9, %12, !dbg !226
  %13 = load i32, i32* %j, align 4, !dbg !227
  %idxprom19 = sext i32 %13 to i64, !dbg !228
  %14 = load i32, i32* %i, align 4, !dbg !229
  %idxprom20 = sext i32 %14 to i64, !dbg !228
  %arrayidx21 = getelementptr inbounds [6 x [6 x i32]], [6 x [6 x i32]]* @X, i64 0, i64 %idxprom20, !dbg !228
  %arrayidx22 = getelementptr inbounds [6 x i32], [6 x i32]* %arrayidx21, i64 0, i64 %idxprom19, !dbg !228
  store i32 %add18, i32* %arrayidx22, align 4, !dbg !230
  br label %if.end, !dbg !231

if.end:                                           ; preds = %if.then8, %if.then
  %15 = load i32, i32* %j, align 4, !dbg !232
  %idxprom23 = sext i32 %15 to i64, !dbg !233
  %16 = load i32, i32* %i, align 4, !dbg !234
  %idxprom24 = sext i32 %16 to i64, !dbg !233
  %arrayidx25 = getelementptr inbounds [6 x [6 x i32]], [6 x [6 x i32]]* @Y, i64 0, i64 %idxprom24, !dbg !233
  %arrayidx26 = getelementptr inbounds [6 x i32], [6 x i32]* %arrayidx25, i64 0, i64 %idxprom23, !dbg !233
  store i32 0, i32* %arrayidx26, align 4, !dbg !235
  %17 = load i32, i32* %i, align 4, !dbg !236
  %add27 = add nsw i32 %17, 1, !dbg !238
  %cmp28 = icmp slt i32 %add27, 6, !dbg !239
  br i1 %cmp28, label %land.lhs.true, label %if.end46, !dbg !240

land.lhs.true:                                    ; preds = %if.end
  %18 = load i32, i32* %j, align 4, !dbg !241
  %sub = sub nsw i32 %18, 1, !dbg !243
  %cmp29 = icmp sge i32 %sub, 0, !dbg !244
  br i1 %cmp29, label %if.then30, label %if.end46, !dbg !245

if.then30:                                        ; preds = %land.lhs.true
  %19 = load i32, i32* %j, align 4, !dbg !246
  %idxprom31 = sext i32 %19 to i64, !dbg !248
  %20 = load i32, i32* %i, align 4, !dbg !249
  %idxprom32 = sext i32 %20 to i64, !dbg !248
  %arrayidx33 = getelementptr inbounds [6 x [6 x i32]], [6 x [6 x i32]]* @Y, i64 0, i64 %idxprom32, !dbg !248
  %arrayidx34 = getelementptr inbounds [6 x i32], [6 x i32]* %arrayidx33, i64 0, i64 %idxprom31, !dbg !248
  %21 = load i32, i32* %arrayidx34, align 4, !dbg !248
  %22 = load i32, i32* %j, align 4, !dbg !250
  %sub35 = sub nsw i32 %22, 1, !dbg !251
  %idxprom36 = sext i32 %sub35 to i64, !dbg !252
  %23 = load i32, i32* %i, align 4, !dbg !253
  %add37 = add nsw i32 %23, 1, !dbg !254
  %idxprom38 = sext i32 %add37 to i64, !dbg !252
  %arrayidx39 = getelementptr inbounds [6 x [6 x i32]], [6 x [6 x i32]]* @M, i64 0, i64 %idxprom38, !dbg !252
  %arrayidx40 = getelementptr inbounds [6 x i32], [6 x i32]* %arrayidx39, i64 0, i64 %idxprom36, !dbg !252
  %24 = load i32, i32* %arrayidx40, align 4, !dbg !252
  %add41 = add nsw i32 %21, %24, !dbg !255
  %25 = load i32, i32* %j, align 4, !dbg !256
  %idxprom42 = sext i32 %25 to i64, !dbg !257
  %26 = load i32, i32* %i, align 4, !dbg !258
  %idxprom43 = sext i32 %26 to i64, !dbg !257
  %arrayidx44 = getelementptr inbounds [6 x [6 x i32]], [6 x [6 x i32]]* @Y, i64 0, i64 %idxprom43, !dbg !257
  %arrayidx45 = getelementptr inbounds [6 x i32], [6 x i32]* %arrayidx44, i64 0, i64 %idxprom42, !dbg !257
  store i32 %add41, i32* %arrayidx45, align 4, !dbg !259
  br label %if.end46, !dbg !260

if.end46:                                         ; preds = %if.then30, %land.lhs.true, %if.end
  %27 = load i32, i32* %j, align 4, !dbg !261
  %idxprom47 = sext i32 %27 to i64, !dbg !262
  %28 = load i32, i32* %i, align 4, !dbg !263
  %idxprom48 = sext i32 %28 to i64, !dbg !262
  %arrayidx49 = getelementptr inbounds [6 x [6 x i32]], [6 x [6 x i32]]* @Z, i64 0, i64 %idxprom48, !dbg !262
  %arrayidx50 = getelementptr inbounds [6 x i32], [6 x i32]* %arrayidx49, i64 0, i64 %idxprom47, !dbg !262
  store i32 0, i32* %arrayidx50, align 4, !dbg !264
  %29 = load i32, i32* %j, align 4, !dbg !265
  %sub51 = sub nsw i32 %29, 1, !dbg !267
  %cmp52 = icmp sgt i32 %sub51, 0, !dbg !268
  br i1 %cmp52, label %if.then53, label %if.end68, !dbg !269

if.then53:                                        ; preds = %if.end46
  %30 = load i32, i32* %j, align 4, !dbg !270
  %idxprom54 = sext i32 %30 to i64, !dbg !272
  %31 = load i32, i32* %i, align 4, !dbg !273
  %idxprom55 = sext i32 %31 to i64, !dbg !272
  %arrayidx56 = getelementptr inbounds [6 x [6 x i32]], [6 x [6 x i32]]* @Z, i64 0, i64 %idxprom55, !dbg !272
  %arrayidx57 = getelementptr inbounds [6 x i32], [6 x i32]* %arrayidx56, i64 0, i64 %idxprom54, !dbg !272
  %32 = load i32, i32* %arrayidx57, align 4, !dbg !272
  %33 = load i32, i32* %j, align 4, !dbg !274
  %sub58 = sub nsw i32 %33, 2, !dbg !275
  %idxprom59 = sext i32 %sub58 to i64, !dbg !276
  %34 = load i32, i32* %i, align 4, !dbg !277
  %idxprom60 = sext i32 %34 to i64, !dbg !276
  %arrayidx61 = getelementptr inbounds [6 x [6 x i32]], [6 x [6 x i32]]* @M, i64 0, i64 %idxprom60, !dbg !276
  %arrayidx62 = getelementptr inbounds [6 x i32], [6 x i32]* %arrayidx61, i64 0, i64 %idxprom59, !dbg !276
  %35 = load i32, i32* %arrayidx62, align 4, !dbg !276
  %add63 = add nsw i32 %32, %35, !dbg !278
  %36 = load i32, i32* %j, align 4, !dbg !279
  %idxprom64 = sext i32 %36 to i64, !dbg !280
  %37 = load i32, i32* %i, align 4, !dbg !281
  %idxprom65 = sext i32 %37 to i64, !dbg !280
  %arrayidx66 = getelementptr inbounds [6 x [6 x i32]], [6 x [6 x i32]]* @Z, i64 0, i64 %idxprom65, !dbg !280
  %arrayidx67 = getelementptr inbounds [6 x i32], [6 x i32]* %arrayidx66, i64 0, i64 %idxprom64, !dbg !280
  store i32 %add63, i32* %arrayidx67, align 4, !dbg !282
  br label %if.end68, !dbg !283

if.end68:                                         ; preds = %if.then53, %if.end46
  %38 = load i32, i32* %i, align 4, !dbg !284
  %inc = add nsw i32 %38, 1, !dbg !284
  store i32 %inc, i32* %i, align 4, !dbg !284
  br label %if.end69, !dbg !285

if.end69:                                         ; preds = %if.end68, %for.body3
  br label %for.inc, !dbg !286

for.inc:                                          ; preds = %if.end69
  %39 = load i32, i32* %j, align 4, !dbg !287
  %inc70 = add nsw i32 %39, 1, !dbg !287
  store i32 %inc70, i32* %j, align 4, !dbg !287
  br label %for.cond1, !dbg !289

for.end:                                          ; preds = %for.cond1
  store i32 0, i32* %i, align 4, !dbg !290
  %40 = load i32, i32* %s, align 4, !dbg !291
  store i32 %40, i32* %j, align 4, !dbg !293
  br label %for.cond71, !dbg !294

for.cond71:                                       ; preds = %for.inc180, %for.end
  %41 = load i32, i32* %i, align 4, !dbg !295
  %cmp72 = icmp slt i32 %41, 6, !dbg !298
  br i1 %cmp72, label %land.rhs, label %land.end, !dbg !299

land.rhs:                                         ; preds = %for.cond71
  %42 = load i32, i32* %j, align 4, !dbg !300
  %cmp73 = icmp slt i32 %42, 6, !dbg !302
  br label %land.end

land.end:                                         ; preds = %land.rhs, %for.cond71
  %43 = phi i1 [ false, %for.cond71 ], [ %cmp73, %land.rhs ]
  br i1 %43, label %for.body74, label %for.end182, !dbg !303

for.body74:                                       ; preds = %land.end
  %44 = load i32, i32* %i, align 4, !dbg !305
  %cmp75 = icmp slt i32 %44, 6, !dbg !308
  br i1 %cmp75, label %if.then76, label %if.end179, !dbg !309

if.then76:                                        ; preds = %for.body74
  %45 = load i32, i32* %i, align 4, !dbg !310
  %idxprom77 = sext i32 %45 to i64, !dbg !310
  %arrayidx78 = getelementptr inbounds [6 x i32], [6 x i32]* @V, i64 0, i64 %idxprom77, !dbg !310
  %46 = load i32, i32* %arrayidx78, align 4, !dbg !310
  %47 = load i32, i32* %j, align 4, !dbg !310
  %idxprom79 = sext i32 %47 to i64, !dbg !310
  %48 = load i32, i32* %i, align 4, !dbg !310
  %idxprom80 = sext i32 %48 to i64, !dbg !310
  %arrayidx81 = getelementptr inbounds [6 x [6 x i32]], [6 x [6 x i32]]* @X, i64 0, i64 %idxprom80, !dbg !310
  %arrayidx82 = getelementptr inbounds [6 x i32], [6 x i32]* %arrayidx81, i64 0, i64 %idxprom79, !dbg !310
  %49 = load i32, i32* %arrayidx82, align 4, !dbg !310
  %50 = load i32, i32* %j, align 4, !dbg !310
  %idxprom83 = sext i32 %50 to i64, !dbg !310
  %51 = load i32, i32* %i, align 4, !dbg !310
  %idxprom84 = sext i32 %51 to i64, !dbg !310
  %arrayidx85 = getelementptr inbounds [6 x [6 x i32]], [6 x [6 x i32]]* @Y, i64 0, i64 %idxprom84, !dbg !310
  %arrayidx86 = getelementptr inbounds [6 x i32], [6 x i32]* %arrayidx85, i64 0, i64 %idxprom83, !dbg !310
  %52 = load i32, i32* %arrayidx86, align 4, !dbg !310
  %cmp87 = icmp slt i32 %49, %52, !dbg !310
  br i1 %cmp87, label %cond.true, label %cond.false, !dbg !310

cond.true:                                        ; preds = %if.then76
  %53 = load i32, i32* %j, align 4, !dbg !312
  %idxprom88 = sext i32 %53 to i64, !dbg !312
  %54 = load i32, i32* %i, align 4, !dbg !312
  %idxprom89 = sext i32 %54 to i64, !dbg !312
  %arrayidx90 = getelementptr inbounds [6 x [6 x i32]], [6 x [6 x i32]]* @X, i64 0, i64 %idxprom89, !dbg !312
  %arrayidx91 = getelementptr inbounds [6 x i32], [6 x i32]* %arrayidx90, i64 0, i64 %idxprom88, !dbg !312
  %55 = load i32, i32* %arrayidx91, align 4, !dbg !312
  br label %cond.end, !dbg !312

cond.false:                                       ; preds = %if.then76
  %56 = load i32, i32* %j, align 4, !dbg !314
  %idxprom92 = sext i32 %56 to i64, !dbg !314
  %57 = load i32, i32* %i, align 4, !dbg !314
  %idxprom93 = sext i32 %57 to i64, !dbg !314
  %arrayidx94 = getelementptr inbounds [6 x [6 x i32]], [6 x [6 x i32]]* @Y, i64 0, i64 %idxprom93, !dbg !314
  %arrayidx95 = getelementptr inbounds [6 x i32], [6 x i32]* %arrayidx94, i64 0, i64 %idxprom92, !dbg !314
  %58 = load i32, i32* %arrayidx95, align 4, !dbg !314
  br label %cond.end, !dbg !314

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %55, %cond.true ], [ %58, %cond.false ], !dbg !316
  %add96 = add nsw i32 %46, %cond, !dbg !316
  %59 = load i32, i32* %j, align 4, !dbg !316
  %idxprom97 = sext i32 %59 to i64, !dbg !316
  %arrayidx98 = getelementptr inbounds [6 x i32], [6 x i32]* @V, i64 0, i64 %idxprom97, !dbg !316
  %60 = load i32, i32* %arrayidx98, align 4, !dbg !316
  %61 = load i32, i32* %j, align 4, !dbg !316
  %idxprom99 = sext i32 %61 to i64, !dbg !316
  %62 = load i32, i32* %i, align 4, !dbg !316
  %idxprom100 = sext i32 %62 to i64, !dbg !316
  %arrayidx101 = getelementptr inbounds [6 x [6 x i32]], [6 x [6 x i32]]* @Y, i64 0, i64 %idxprom100, !dbg !316
  %arrayidx102 = getelementptr inbounds [6 x i32], [6 x i32]* %arrayidx101, i64 0, i64 %idxprom99, !dbg !316
  %63 = load i32, i32* %arrayidx102, align 4, !dbg !316
  %64 = load i32, i32* %j, align 4, !dbg !316
  %idxprom103 = sext i32 %64 to i64, !dbg !316
  %65 = load i32, i32* %i, align 4, !dbg !316
  %idxprom104 = sext i32 %65 to i64, !dbg !316
  %arrayidx105 = getelementptr inbounds [6 x [6 x i32]], [6 x [6 x i32]]* @Z, i64 0, i64 %idxprom104, !dbg !316
  %arrayidx106 = getelementptr inbounds [6 x i32], [6 x i32]* %arrayidx105, i64 0, i64 %idxprom103, !dbg !316
  %66 = load i32, i32* %arrayidx106, align 4, !dbg !316
  %cmp107 = icmp slt i32 %63, %66, !dbg !316
  br i1 %cmp107, label %cond.true108, label %cond.false113, !dbg !316

cond.true108:                                     ; preds = %cond.end
  %67 = load i32, i32* %j, align 4, !dbg !318
  %idxprom109 = sext i32 %67 to i64, !dbg !318
  %68 = load i32, i32* %i, align 4, !dbg !318
  %idxprom110 = sext i32 %68 to i64, !dbg !318
  %arrayidx111 = getelementptr inbounds [6 x [6 x i32]], [6 x [6 x i32]]* @Y, i64 0, i64 %idxprom110, !dbg !318
  %arrayidx112 = getelementptr inbounds [6 x i32], [6 x i32]* %arrayidx111, i64 0, i64 %idxprom109, !dbg !318
  %69 = load i32, i32* %arrayidx112, align 4, !dbg !318
  br label %cond.end118, !dbg !318

cond.false113:                                    ; preds = %cond.end
  %70 = load i32, i32* %j, align 4, !dbg !320
  %idxprom114 = sext i32 %70 to i64, !dbg !320
  %71 = load i32, i32* %i, align 4, !dbg !320
  %idxprom115 = sext i32 %71 to i64, !dbg !320
  %arrayidx116 = getelementptr inbounds [6 x [6 x i32]], [6 x [6 x i32]]* @Z, i64 0, i64 %idxprom115, !dbg !320
  %arrayidx117 = getelementptr inbounds [6 x i32], [6 x i32]* %arrayidx116, i64 0, i64 %idxprom114, !dbg !320
  %72 = load i32, i32* %arrayidx117, align 4, !dbg !320
  br label %cond.end118, !dbg !320

cond.end118:                                      ; preds = %cond.false113, %cond.true108
  %cond119 = phi i32 [ %69, %cond.true108 ], [ %72, %cond.false113 ], !dbg !322
  %add120 = add nsw i32 %60, %cond119, !dbg !322
  %cmp121 = icmp sgt i32 %add96, %add120, !dbg !322
  br i1 %cmp121, label %cond.true122, label %cond.false147, !dbg !322

cond.true122:                                     ; preds = %cond.end118
  %73 = load i32, i32* %i, align 4, !dbg !324
  %idxprom123 = sext i32 %73 to i64, !dbg !324
  %arrayidx124 = getelementptr inbounds [6 x i32], [6 x i32]* @V, i64 0, i64 %idxprom123, !dbg !324
  %74 = load i32, i32* %arrayidx124, align 4, !dbg !324
  %75 = load i32, i32* %j, align 4, !dbg !324
  %idxprom125 = sext i32 %75 to i64, !dbg !324
  %76 = load i32, i32* %i, align 4, !dbg !324
  %idxprom126 = sext i32 %76 to i64, !dbg !324
  %arrayidx127 = getelementptr inbounds [6 x [6 x i32]], [6 x [6 x i32]]* @X, i64 0, i64 %idxprom126, !dbg !324
  %arrayidx128 = getelementptr inbounds [6 x i32], [6 x i32]* %arrayidx127, i64 0, i64 %idxprom125, !dbg !324
  %77 = load i32, i32* %arrayidx128, align 4, !dbg !324
  %78 = load i32, i32* %j, align 4, !dbg !324
  %idxprom129 = sext i32 %78 to i64, !dbg !324
  %79 = load i32, i32* %i, align 4, !dbg !324
  %idxprom130 = sext i32 %79 to i64, !dbg !324
  %arrayidx131 = getelementptr inbounds [6 x [6 x i32]], [6 x [6 x i32]]* @Y, i64 0, i64 %idxprom130, !dbg !324
  %arrayidx132 = getelementptr inbounds [6 x i32], [6 x i32]* %arrayidx131, i64 0, i64 %idxprom129, !dbg !324
  %80 = load i32, i32* %arrayidx132, align 4, !dbg !324
  %cmp133 = icmp slt i32 %77, %80, !dbg !324
  br i1 %cmp133, label %cond.true134, label %cond.false139, !dbg !324

cond.true134:                                     ; preds = %cond.true122
  %81 = load i32, i32* %j, align 4, !dbg !326
  %idxprom135 = sext i32 %81 to i64, !dbg !326
  %82 = load i32, i32* %i, align 4, !dbg !326
  %idxprom136 = sext i32 %82 to i64, !dbg !326
  %arrayidx137 = getelementptr inbounds [6 x [6 x i32]], [6 x [6 x i32]]* @X, i64 0, i64 %idxprom136, !dbg !326
  %arrayidx138 = getelementptr inbounds [6 x i32], [6 x i32]* %arrayidx137, i64 0, i64 %idxprom135, !dbg !326
  %83 = load i32, i32* %arrayidx138, align 4, !dbg !326
  br label %cond.end144, !dbg !326

cond.false139:                                    ; preds = %cond.true122
  %84 = load i32, i32* %j, align 4, !dbg !328
  %idxprom140 = sext i32 %84 to i64, !dbg !328
  %85 = load i32, i32* %i, align 4, !dbg !328
  %idxprom141 = sext i32 %85 to i64, !dbg !328
  %arrayidx142 = getelementptr inbounds [6 x [6 x i32]], [6 x [6 x i32]]* @Y, i64 0, i64 %idxprom141, !dbg !328
  %arrayidx143 = getelementptr inbounds [6 x i32], [6 x i32]* %arrayidx142, i64 0, i64 %idxprom140, !dbg !328
  %86 = load i32, i32* %arrayidx143, align 4, !dbg !328
  br label %cond.end144, !dbg !328

cond.end144:                                      ; preds = %cond.false139, %cond.true134
  %cond145 = phi i32 [ %83, %cond.true134 ], [ %86, %cond.false139 ], !dbg !330
  %add146 = add nsw i32 %74, %cond145, !dbg !330
  br label %cond.end172, !dbg !330

cond.false147:                                    ; preds = %cond.end118
  %87 = load i32, i32* %j, align 4, !dbg !332
  %idxprom148 = sext i32 %87 to i64, !dbg !332
  %arrayidx149 = getelementptr inbounds [6 x i32], [6 x i32]* @V, i64 0, i64 %idxprom148, !dbg !332
  %88 = load i32, i32* %arrayidx149, align 4, !dbg !332
  %89 = load i32, i32* %j, align 4, !dbg !332
  %idxprom150 = sext i32 %89 to i64, !dbg !332
  %90 = load i32, i32* %i, align 4, !dbg !332
  %idxprom151 = sext i32 %90 to i64, !dbg !332
  %arrayidx152 = getelementptr inbounds [6 x [6 x i32]], [6 x [6 x i32]]* @Y, i64 0, i64 %idxprom151, !dbg !332
  %arrayidx153 = getelementptr inbounds [6 x i32], [6 x i32]* %arrayidx152, i64 0, i64 %idxprom150, !dbg !332
  %91 = load i32, i32* %arrayidx153, align 4, !dbg !332
  %92 = load i32, i32* %j, align 4, !dbg !332
  %idxprom154 = sext i32 %92 to i64, !dbg !332
  %93 = load i32, i32* %i, align 4, !dbg !332
  %idxprom155 = sext i32 %93 to i64, !dbg !332
  %arrayidx156 = getelementptr inbounds [6 x [6 x i32]], [6 x [6 x i32]]* @Z, i64 0, i64 %idxprom155, !dbg !332
  %arrayidx157 = getelementptr inbounds [6 x i32], [6 x i32]* %arrayidx156, i64 0, i64 %idxprom154, !dbg !332
  %94 = load i32, i32* %arrayidx157, align 4, !dbg !332
  %cmp158 = icmp slt i32 %91, %94, !dbg !332
  br i1 %cmp158, label %cond.true159, label %cond.false164, !dbg !332

cond.true159:                                     ; preds = %cond.false147
  %95 = load i32, i32* %j, align 4, !dbg !334
  %idxprom160 = sext i32 %95 to i64, !dbg !334
  %96 = load i32, i32* %i, align 4, !dbg !334
  %idxprom161 = sext i32 %96 to i64, !dbg !334
  %arrayidx162 = getelementptr inbounds [6 x [6 x i32]], [6 x [6 x i32]]* @Y, i64 0, i64 %idxprom161, !dbg !334
  %arrayidx163 = getelementptr inbounds [6 x i32], [6 x i32]* %arrayidx162, i64 0, i64 %idxprom160, !dbg !334
  %97 = load i32, i32* %arrayidx163, align 4, !dbg !334
  br label %cond.end169, !dbg !334

cond.false164:                                    ; preds = %cond.false147
  %98 = load i32, i32* %j, align 4, !dbg !336
  %idxprom165 = sext i32 %98 to i64, !dbg !336
  %99 = load i32, i32* %i, align 4, !dbg !336
  %idxprom166 = sext i32 %99 to i64, !dbg !336
  %arrayidx167 = getelementptr inbounds [6 x [6 x i32]], [6 x [6 x i32]]* @Z, i64 0, i64 %idxprom166, !dbg !336
  %arrayidx168 = getelementptr inbounds [6 x i32], [6 x i32]* %arrayidx167, i64 0, i64 %idxprom165, !dbg !336
  %100 = load i32, i32* %arrayidx168, align 4, !dbg !336
  br label %cond.end169, !dbg !336

cond.end169:                                      ; preds = %cond.false164, %cond.true159
  %cond170 = phi i32 [ %97, %cond.true159 ], [ %100, %cond.false164 ], !dbg !338
  %add171 = add nsw i32 %88, %cond170, !dbg !338
  br label %cond.end172, !dbg !338

cond.end172:                                      ; preds = %cond.end169, %cond.end144
  %cond173 = phi i32 [ %add146, %cond.end144 ], [ %add171, %cond.end169 ], !dbg !340
  %101 = load i32, i32* %j, align 4, !dbg !342
  %idxprom174 = sext i32 %101 to i64, !dbg !343
  %102 = load i32, i32* %i, align 4, !dbg !344
  %idxprom175 = sext i32 %102 to i64, !dbg !343
  %arrayidx176 = getelementptr inbounds [6 x [6 x i32]], [6 x [6 x i32]]* @M, i64 0, i64 %idxprom175, !dbg !343
  %arrayidx177 = getelementptr inbounds [6 x i32], [6 x i32]* %arrayidx176, i64 0, i64 %idxprom174, !dbg !343
  store i32 %cond173, i32* %arrayidx177, align 4, !dbg !345
  %103 = load i32, i32* %i, align 4, !dbg !346
  %inc178 = add nsw i32 %103, 1, !dbg !346
  store i32 %inc178, i32* %i, align 4, !dbg !346
  br label %if.end179, !dbg !347

if.end179:                                        ; preds = %cond.end172, %for.body74
  br label %for.inc180, !dbg !348

for.inc180:                                       ; preds = %if.end179
  %104 = load i32, i32* %j, align 4, !dbg !349
  %inc181 = add nsw i32 %104, 1, !dbg !349
  store i32 %inc181, i32* %j, align 4, !dbg !349
  br label %for.cond71, !dbg !351

for.end182:                                       ; preds = %land.end
  br label %for.inc183, !dbg !352

for.inc183:                                       ; preds = %for.end182
  %105 = load i32, i32* %s, align 4, !dbg !353
  %inc184 = add nsw i32 %105, 1, !dbg !353
  store i32 %inc184, i32* %s, align 4, !dbg !353
  br label %for.cond, !dbg !355

for.end185:                                       ; preds = %for.cond
  %106 = load i32, i32* getelementptr inbounds ([6 x [6 x i32]], [6 x [6 x i32]]* @M, i64 0, i64 0, i64 5), align 4, !dbg !356
  ret i32 %106, !dbg !357
}

; Function Attrs: nounwind uwtable
define i32 @main() #0 !dbg !13 {
entry:
  %call = call i32 @maxMoney(), !dbg !358
  call void @sumMoves(), !dbg !359
  call void @printMoves(), !dbg !360
  %0 = load i32, i32* @sum_alice, align 4, !dbg !361
  %1 = load i32, i32* getelementptr inbounds ([6 x [6 x i32]], [6 x [6 x i32]]* @M, i64 0, i64 0, i64 5), align 4, !dbg !363
  %cmp = icmp ne i32 %0, %1, !dbg !364
  br i1 %cmp, label %if.then, label %if.end, !dbg !365

if.then:                                          ; preds = %entry
  %call1 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([24 x i8], [24 x i8]* @.str.6, i32 0, i32 0)), !dbg !366
  call void @exit(i32 -1) #4, !dbg !368
  unreachable, !dbg !368

if.end:                                           ; preds = %entry
  %2 = load i32, i32* @sum_alice, align 4, !dbg !369
  %3 = load i32, i32* @sum_bob, align 4, !dbg !371
  %cmp2 = icmp slt i32 %2, %3, !dbg !372
  br i1 %cmp2, label %if.then3, label %if.end5, !dbg !373

if.then3:                                         ; preds = %if.end
  %call4 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([28 x i8], [28 x i8]* @.str.7, i32 0, i32 0)), !dbg !374
  call void @exit(i32 -1) #4, !dbg !376
  unreachable, !dbg !376

if.end5:                                          ; preds = %if.end
  %4 = load i32, i32* @sum_alice, align 4, !dbg !377
  %call6 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([54 x i8], [54 x i8]* @.str.8, i32 0, i32 0), i32 %4), !dbg !378
  %5 = load i32, i32* @sum_bob, align 4, !dbg !379
  %call7 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([52 x i8], [52 x i8]* @.str.9, i32 0, i32 0), i32 %5), !dbg !380
  ret i32 0, !dbg !381
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
!4 = distinct !DISubprogram(name: "init", scope: !1, file: !1, line: 31, type: !5, isLocal: false, isDefinition: true, scopeLine: 31, isOptimized: false, variables: !2)
!5 = !DISubroutineType(types: !6)
!6 = !{null}
!7 = distinct !DISubprogram(name: "sumMoves", scope: !1, file: !1, line: 40, type: !5, isLocal: false, isDefinition: true, scopeLine: 40, isOptimized: false, variables: !2)
!8 = distinct !DISubprogram(name: "printMoves", scope: !1, file: !1, line: 69, type: !5, isLocal: false, isDefinition: true, scopeLine: 69, isOptimized: false, variables: !2)
!9 = distinct !DISubprogram(name: "maxMoney", scope: !1, file: !1, line: 98, type: !10, isLocal: false, isDefinition: true, scopeLine: 98, isOptimized: false, variables: !2)
!10 = !DISubroutineType(types: !11)
!11 = !{!12}
!12 = !DIBasicType(name: "int", size: 32, align: 32, encoding: DW_ATE_signed)
!13 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 138, type: !10, isLocal: false, isDefinition: true, scopeLine: 138, isOptimized: false, variables: !2)
!14 = !{!15, !19, !20, !21, !24, !25, !26}
!15 = !DIGlobalVariable(name: "V", scope: !0, file: !1, line: 20, type: !16, isLocal: false, isDefinition: true, variable: [6 x i32]* @V)
!16 = !DICompositeType(tag: DW_TAG_array_type, baseType: !12, size: 192, align: 32, elements: !17)
!17 = !{!18}
!18 = !DISubrange(count: 6)
!19 = !DIGlobalVariable(name: "sum_alice", scope: !0, file: !1, line: 29, type: !12, isLocal: false, isDefinition: true, variable: i32* @sum_alice)
!20 = !DIGlobalVariable(name: "sum_bob", scope: !0, file: !1, line: 29, type: !12, isLocal: false, isDefinition: true, variable: i32* @sum_bob)
!21 = !DIGlobalVariable(name: "M", scope: !0, file: !1, line: 23, type: !22, isLocal: false, isDefinition: true, variable: [6 x [6 x i32]]* @M)
!22 = !DICompositeType(tag: DW_TAG_array_type, baseType: !12, size: 1152, align: 32, elements: !23)
!23 = !{!18, !18}
!24 = !DIGlobalVariable(name: "X", scope: !0, file: !1, line: 26, type: !22, isLocal: false, isDefinition: true, variable: [6 x [6 x i32]]* @X)
!25 = !DIGlobalVariable(name: "Y", scope: !0, file: !1, line: 27, type: !22, isLocal: false, isDefinition: true, variable: [6 x [6 x i32]]* @Y)
!26 = !DIGlobalVariable(name: "Z", scope: !0, file: !1, line: 28, type: !22, isLocal: false, isDefinition: true, variable: [6 x [6 x i32]]* @Z)
!27 = !{i32 2, !"Dwarf Version", i32 4}
!28 = !{i32 2, !"Debug Info Version", i32 3}
!29 = !{!"clang version 3.9.0 (http://llvm.org/git/clang.git cf7bc8edf8cccb1b5de656c403cb55ad44132e98) (http://llvm.org/git/llvm.git 22706dc4c03305692f494d0e42a6de1050d0ec62)"}
!30 = !DILocalVariable(name: "i", scope: !4, file: !1, line: 32, type: !12)
!31 = !DIExpression()
!32 = !DILocation(line: 32, column: 6, scope: !4)
!33 = !DILocation(line: 34, column: 2, scope: !4)
!34 = !DILocation(line: 35, column: 7, scope: !35)
!35 = distinct !DILexicalBlock(scope: !4, file: !1, line: 35, column: 2)
!36 = !DILocation(line: 35, column: 6, scope: !35)
!37 = !DILocation(line: 35, column: 10, scope: !38)
!38 = !DILexicalBlockFile(scope: !39, file: !1, discriminator: 1)
!39 = distinct !DILexicalBlock(scope: !35, file: !1, line: 35, column: 2)
!40 = !DILocation(line: 35, column: 11, scope: !38)
!41 = !DILocation(line: 35, column: 2, scope: !38)
!42 = !DILocation(line: 36, column: 10, scope: !43)
!43 = distinct !DILexicalBlock(scope: !39, file: !1, line: 35, column: 18)
!44 = !DILocation(line: 36, column: 5, scope: !43)
!45 = !DILocation(line: 36, column: 3, scope: !43)
!46 = !DILocation(line: 36, column: 8, scope: !43)
!47 = !DILocation(line: 37, column: 2, scope: !43)
!48 = !DILocation(line: 35, column: 15, scope: !49)
!49 = !DILexicalBlockFile(scope: !39, file: !1, discriminator: 2)
!50 = !DILocation(line: 35, column: 2, scope: !49)
!51 = !DILocation(line: 38, column: 1, scope: !4)
!52 = !DILocalVariable(name: "i", scope: !7, file: !1, line: 41, type: !12)
!53 = !DILocation(line: 41, column: 6, scope: !7)
!54 = !DILocalVariable(name: "j", scope: !7, file: !1, line: 41, type: !12)
!55 = !DILocation(line: 41, column: 13, scope: !7)
!56 = !DILocalVariable(name: "alice", scope: !7, file: !1, line: 42, type: !12)
!57 = !DILocation(line: 42, column: 6, scope: !7)
!58 = !DILocation(line: 43, column: 2, scope: !7)
!59 = !DILocation(line: 43, column: 9, scope: !60)
!60 = !DILexicalBlockFile(scope: !7, file: !1, discriminator: 1)
!61 = !DILocation(line: 43, column: 14, scope: !60)
!62 = !DILocation(line: 43, column: 11, scope: !60)
!63 = !DILocation(line: 43, column: 2, scope: !60)
!64 = !DILocalVariable(name: "P1", scope: !65, file: !1, line: 44, type: !12)
!65 = distinct !DILexicalBlock(scope: !7, file: !1, line: 43, column: 17)
!66 = !DILocation(line: 44, column: 7, scope: !65)
!67 = !DILocation(line: 44, column: 21, scope: !65)
!68 = !DILocation(line: 44, column: 12, scope: !65)
!69 = !DILocation(line: 44, column: 14, scope: !65)
!70 = !DILocation(line: 44, column: 16, scope: !65)
!71 = !DILocalVariable(name: "P2", scope: !65, file: !1, line: 45, type: !12)
!72 = !DILocation(line: 45, column: 7, scope: !65)
!73 = !DILocation(line: 45, column: 17, scope: !65)
!74 = !DILocation(line: 45, column: 19, scope: !65)
!75 = !DILocation(line: 45, column: 12, scope: !65)
!76 = !DILocation(line: 45, column: 14, scope: !65)
!77 = !DILocalVariable(name: "coin", scope: !65, file: !1, line: 46, type: !12)
!78 = !DILocation(line: 46, column: 7, scope: !65)
!79 = !DILocation(line: 47, column: 7, scope: !80)
!80 = distinct !DILexicalBlock(scope: !65, file: !1, line: 47, column: 7)
!81 = !DILocation(line: 47, column: 13, scope: !80)
!82 = !DILocation(line: 47, column: 10, scope: !80)
!83 = !DILocation(line: 47, column: 7, scope: !65)
!84 = !DILocation(line: 49, column: 13, scope: !85)
!85 = distinct !DILexicalBlock(scope: !80, file: !1, line: 47, column: 17)
!86 = !DILocation(line: 49, column: 11, scope: !85)
!87 = !DILocation(line: 49, column: 9, scope: !85)
!88 = !DILocation(line: 50, column: 5, scope: !85)
!89 = !DILocation(line: 51, column: 3, scope: !85)
!90 = !DILocation(line: 53, column: 13, scope: !91)
!91 = distinct !DILexicalBlock(scope: !80, file: !1, line: 51, column: 10)
!92 = !DILocation(line: 53, column: 11, scope: !91)
!93 = !DILocation(line: 53, column: 9, scope: !91)
!94 = !DILocation(line: 54, column: 5, scope: !91)
!95 = !DILocation(line: 56, column: 7, scope: !96)
!96 = distinct !DILexicalBlock(scope: !65, file: !1, line: 56, column: 7)
!97 = !DILocation(line: 56, column: 7, scope: !65)
!98 = !DILocation(line: 57, column: 17, scope: !99)
!99 = distinct !DILexicalBlock(scope: !96, file: !1, line: 56, column: 14)
!100 = !DILocation(line: 57, column: 14, scope: !99)
!101 = !DILocation(line: 58, column: 10, scope: !99)
!102 = !DILocation(line: 59, column: 3, scope: !99)
!103 = !DILocation(line: 60, column: 15, scope: !104)
!104 = distinct !DILexicalBlock(scope: !96, file: !1, line: 59, column: 10)
!105 = !DILocation(line: 60, column: 12, scope: !104)
!106 = !DILocation(line: 61, column: 9, scope: !104)
!107 = !DILocation(line: 43, column: 2, scope: !108)
!108 = !DILexicalBlockFile(scope: !7, file: !1, discriminator: 2)
!109 = !DILocation(line: 65, column: 1, scope: !7)
!110 = !DILocalVariable(name: "i", scope: !8, file: !1, line: 70, type: !12)
!111 = !DILocation(line: 70, column: 6, scope: !8)
!112 = !DILocalVariable(name: "j", scope: !8, file: !1, line: 70, type: !12)
!113 = !DILocation(line: 70, column: 13, scope: !8)
!114 = !DILocalVariable(name: "alice", scope: !8, file: !1, line: 71, type: !115)
!115 = !DIBasicType(name: "_Bool", size: 8, align: 8, encoding: DW_ATE_boolean)
!116 = !DILocation(line: 71, column: 7, scope: !8)
!117 = !DILocation(line: 72, column: 2, scope: !8)
!118 = !DILocation(line: 72, column: 9, scope: !119)
!119 = !DILexicalBlockFile(scope: !8, file: !1, discriminator: 1)
!120 = !DILocation(line: 72, column: 14, scope: !119)
!121 = !DILocation(line: 72, column: 11, scope: !119)
!122 = !DILocation(line: 72, column: 2, scope: !119)
!123 = !DILocalVariable(name: "P1", scope: !124, file: !1, line: 73, type: !12)
!124 = distinct !DILexicalBlock(scope: !8, file: !1, line: 72, column: 17)
!125 = !DILocation(line: 73, column: 7, scope: !124)
!126 = !DILocation(line: 73, column: 21, scope: !124)
!127 = !DILocation(line: 73, column: 12, scope: !124)
!128 = !DILocation(line: 73, column: 14, scope: !124)
!129 = !DILocation(line: 73, column: 16, scope: !124)
!130 = !DILocalVariable(name: "P2", scope: !124, file: !1, line: 74, type: !12)
!131 = !DILocation(line: 74, column: 7, scope: !124)
!132 = !DILocation(line: 74, column: 17, scope: !124)
!133 = !DILocation(line: 74, column: 19, scope: !124)
!134 = !DILocation(line: 74, column: 12, scope: !124)
!135 = !DILocation(line: 74, column: 14, scope: !124)
!136 = !DILocation(line: 75, column: 7, scope: !137)
!137 = distinct !DILexicalBlock(scope: !124, file: !1, line: 75, column: 7)
!138 = !DILocation(line: 75, column: 7, scope: !124)
!139 = !DILocation(line: 76, column: 4, scope: !140)
!140 = distinct !DILexicalBlock(scope: !137, file: !1, line: 75, column: 14)
!141 = !DILocation(line: 77, column: 3, scope: !140)
!142 = !DILocation(line: 78, column: 4, scope: !143)
!143 = distinct !DILexicalBlock(scope: !137, file: !1, line: 77, column: 10)
!144 = !DILocation(line: 81, column: 7, scope: !145)
!145 = distinct !DILexicalBlock(scope: !124, file: !1, line: 81, column: 7)
!146 = !DILocation(line: 81, column: 13, scope: !145)
!147 = !DILocation(line: 81, column: 10, scope: !145)
!148 = !DILocation(line: 81, column: 7, scope: !124)
!149 = !DILocation(line: 82, column: 24, scope: !150)
!150 = distinct !DILexicalBlock(scope: !145, file: !1, line: 81, column: 17)
!151 = !DILocation(line: 82, column: 26, scope: !150)
!152 = !DILocation(line: 82, column: 33, scope: !150)
!153 = !DILocation(line: 82, column: 31, scope: !150)
!154 = !DILocation(line: 82, column: 4, scope: !150)
!155 = !DILocation(line: 83, column: 5, scope: !150)
!156 = !DILocation(line: 84, column: 3, scope: !150)
!157 = !DILocation(line: 85, column: 24, scope: !158)
!158 = distinct !DILexicalBlock(scope: !145, file: !1, line: 84, column: 10)
!159 = !DILocation(line: 85, column: 26, scope: !158)
!160 = !DILocation(line: 85, column: 33, scope: !158)
!161 = !DILocation(line: 85, column: 31, scope: !158)
!162 = !DILocation(line: 85, column: 4, scope: !158)
!163 = !DILocation(line: 86, column: 5, scope: !158)
!164 = !DILocation(line: 88, column: 7, scope: !165)
!165 = distinct !DILexicalBlock(scope: !124, file: !1, line: 88, column: 7)
!166 = !DILocation(line: 88, column: 7, scope: !124)
!167 = !DILocation(line: 89, column: 4, scope: !168)
!168 = distinct !DILexicalBlock(scope: !165, file: !1, line: 88, column: 14)
!169 = !DILocation(line: 90, column: 3, scope: !168)
!170 = !DILocation(line: 91, column: 4, scope: !171)
!171 = distinct !DILexicalBlock(scope: !165, file: !1, line: 90, column: 10)
!172 = !DILocation(line: 93, column: 12, scope: !124)
!173 = !DILocation(line: 93, column: 11, scope: !124)
!174 = !DILocation(line: 93, column: 9, scope: !124)
!175 = !DILocation(line: 72, column: 2, scope: !176)
!176 = !DILexicalBlockFile(scope: !8, file: !1, discriminator: 2)
!177 = !DILocation(line: 96, column: 1, scope: !8)
!178 = !DILocalVariable(name: "s", scope: !9, file: !1, line: 99, type: !12)
!179 = !DILocation(line: 99, column: 6, scope: !9)
!180 = !DILocalVariable(name: "i", scope: !9, file: !1, line: 99, type: !12)
!181 = !DILocation(line: 99, column: 9, scope: !9)
!182 = !DILocalVariable(name: "j", scope: !9, file: !1, line: 99, type: !12)
!183 = !DILocation(line: 99, column: 12, scope: !9)
!184 = !DILocation(line: 100, column: 9, scope: !185)
!185 = distinct !DILexicalBlock(scope: !9, file: !1, line: 100, column: 2)
!186 = !DILocation(line: 100, column: 7, scope: !185)
!187 = !DILocation(line: 100, column: 14, scope: !188)
!188 = !DILexicalBlockFile(scope: !189, file: !1, discriminator: 1)
!189 = distinct !DILexicalBlock(scope: !185, file: !1, line: 100, column: 2)
!190 = !DILocation(line: 100, column: 16, scope: !188)
!191 = !DILocation(line: 100, column: 2, scope: !188)
!192 = !DILocation(line: 102, column: 5, scope: !193)
!193 = distinct !DILexicalBlock(scope: !189, file: !1, line: 100, column: 26)
!194 = !DILocation(line: 103, column: 12, scope: !195)
!195 = distinct !DILexicalBlock(scope: !193, file: !1, line: 103, column: 3)
!196 = !DILocation(line: 103, column: 10, scope: !195)
!197 = !DILocation(line: 103, column: 8, scope: !195)
!198 = !DILocation(line: 103, column: 15, scope: !199)
!199 = !DILexicalBlockFile(scope: !200, file: !1, discriminator: 1)
!200 = distinct !DILexicalBlock(scope: !195, file: !1, line: 103, column: 3)
!201 = !DILocation(line: 103, column: 17, scope: !199)
!202 = !DILocation(line: 103, column: 3, scope: !199)
!203 = !DILocation(line: 104, column: 7, scope: !204)
!204 = distinct !DILexicalBlock(scope: !205, file: !1, line: 104, column: 7)
!205 = distinct !DILexicalBlock(scope: !200, file: !1, line: 103, column: 26)
!206 = !DILocation(line: 104, column: 8, scope: !204)
!207 = !DILocation(line: 104, column: 7, scope: !205)
!208 = !DILocation(line: 105, column: 10, scope: !209)
!209 = distinct !DILexicalBlock(scope: !204, file: !1, line: 104, column: 11)
!210 = !DILocation(line: 105, column: 5, scope: !209)
!211 = !DILocation(line: 105, column: 7, scope: !209)
!212 = !DILocation(line: 105, column: 13, scope: !209)
!213 = !DILocation(line: 106, column: 9, scope: !214)
!214 = distinct !DILexicalBlock(scope: !209, file: !1, line: 106, column: 9)
!215 = !DILocation(line: 106, column: 11, scope: !214)
!216 = !DILocation(line: 106, column: 15, scope: !214)
!217 = !DILocation(line: 106, column: 9, scope: !209)
!218 = !DILocation(line: 107, column: 21, scope: !219)
!219 = distinct !DILexicalBlock(scope: !214, file: !1, line: 106, column: 20)
!220 = !DILocation(line: 107, column: 16, scope: !219)
!221 = !DILocation(line: 107, column: 18, scope: !219)
!222 = !DILocation(line: 107, column: 35, scope: !219)
!223 = !DILocation(line: 107, column: 26, scope: !219)
!224 = !DILocation(line: 107, column: 28, scope: !219)
!225 = !DILocation(line: 107, column: 30, scope: !219)
!226 = !DILocation(line: 107, column: 24, scope: !219)
!227 = !DILocation(line: 107, column: 11, scope: !219)
!228 = !DILocation(line: 107, column: 6, scope: !219)
!229 = !DILocation(line: 107, column: 8, scope: !219)
!230 = !DILocation(line: 107, column: 14, scope: !219)
!231 = !DILocation(line: 108, column: 5, scope: !219)
!232 = !DILocation(line: 109, column: 10, scope: !209)
!233 = !DILocation(line: 109, column: 5, scope: !209)
!234 = !DILocation(line: 109, column: 7, scope: !209)
!235 = !DILocation(line: 109, column: 13, scope: !209)
!236 = !DILocation(line: 110, column: 9, scope: !237)
!237 = distinct !DILexicalBlock(scope: !209, file: !1, line: 110, column: 9)
!238 = !DILocation(line: 110, column: 11, scope: !237)
!239 = !DILocation(line: 110, column: 15, scope: !237)
!240 = !DILocation(line: 110, column: 19, scope: !237)
!241 = !DILocation(line: 110, column: 22, scope: !242)
!242 = !DILexicalBlockFile(scope: !237, file: !1, discriminator: 1)
!243 = !DILocation(line: 110, column: 24, scope: !242)
!244 = !DILocation(line: 110, column: 28, scope: !242)
!245 = !DILocation(line: 110, column: 9, scope: !242)
!246 = !DILocation(line: 111, column: 21, scope: !247)
!247 = distinct !DILexicalBlock(scope: !237, file: !1, line: 110, column: 34)
!248 = !DILocation(line: 111, column: 16, scope: !247)
!249 = !DILocation(line: 111, column: 18, scope: !247)
!250 = !DILocation(line: 111, column: 35, scope: !247)
!251 = !DILocation(line: 111, column: 37, scope: !247)
!252 = !DILocation(line: 111, column: 26, scope: !247)
!253 = !DILocation(line: 111, column: 28, scope: !247)
!254 = !DILocation(line: 111, column: 30, scope: !247)
!255 = !DILocation(line: 111, column: 24, scope: !247)
!256 = !DILocation(line: 111, column: 11, scope: !247)
!257 = !DILocation(line: 111, column: 6, scope: !247)
!258 = !DILocation(line: 111, column: 8, scope: !247)
!259 = !DILocation(line: 111, column: 14, scope: !247)
!260 = !DILocation(line: 112, column: 5, scope: !247)
!261 = !DILocation(line: 113, column: 10, scope: !209)
!262 = !DILocation(line: 113, column: 5, scope: !209)
!263 = !DILocation(line: 113, column: 7, scope: !209)
!264 = !DILocation(line: 113, column: 13, scope: !209)
!265 = !DILocation(line: 114, column: 9, scope: !266)
!266 = distinct !DILexicalBlock(scope: !209, file: !1, line: 114, column: 9)
!267 = !DILocation(line: 114, column: 11, scope: !266)
!268 = !DILocation(line: 114, column: 15, scope: !266)
!269 = !DILocation(line: 114, column: 9, scope: !209)
!270 = !DILocation(line: 115, column: 21, scope: !271)
!271 = distinct !DILexicalBlock(scope: !266, file: !1, line: 114, column: 20)
!272 = !DILocation(line: 115, column: 16, scope: !271)
!273 = !DILocation(line: 115, column: 18, scope: !271)
!274 = !DILocation(line: 115, column: 30, scope: !271)
!275 = !DILocation(line: 115, column: 32, scope: !271)
!276 = !DILocation(line: 115, column: 25, scope: !271)
!277 = !DILocation(line: 115, column: 27, scope: !271)
!278 = !DILocation(line: 115, column: 23, scope: !271)
!279 = !DILocation(line: 115, column: 11, scope: !271)
!280 = !DILocation(line: 115, column: 6, scope: !271)
!281 = !DILocation(line: 115, column: 8, scope: !271)
!282 = !DILocation(line: 115, column: 14, scope: !271)
!283 = !DILocation(line: 116, column: 5, scope: !271)
!284 = !DILocation(line: 117, column: 6, scope: !209)
!285 = !DILocation(line: 118, column: 4, scope: !209)
!286 = !DILocation(line: 119, column: 3, scope: !205)
!287 = !DILocation(line: 103, column: 22, scope: !288)
!288 = !DILexicalBlockFile(scope: !200, file: !1, discriminator: 2)
!289 = !DILocation(line: 103, column: 3, scope: !288)
!290 = !DILocation(line: 121, column: 5, scope: !193)
!291 = !DILocation(line: 122, column: 12, scope: !292)
!292 = distinct !DILexicalBlock(scope: !193, file: !1, line: 122, column: 3)
!293 = !DILocation(line: 122, column: 10, scope: !292)
!294 = !DILocation(line: 122, column: 8, scope: !292)
!295 = !DILocation(line: 122, column: 15, scope: !296)
!296 = !DILexicalBlockFile(scope: !297, file: !1, discriminator: 1)
!297 = distinct !DILexicalBlock(scope: !292, file: !1, line: 122, column: 3)
!298 = !DILocation(line: 122, column: 17, scope: !296)
!299 = !DILocation(line: 122, column: 21, scope: !296)
!300 = !DILocation(line: 122, column: 24, scope: !301)
!301 = !DILexicalBlockFile(scope: !297, file: !1, discriminator: 2)
!302 = !DILocation(line: 122, column: 26, scope: !301)
!303 = !DILocation(line: 122, column: 3, scope: !304)
!304 = !DILexicalBlockFile(scope: !292, file: !1, discriminator: 3)
!305 = !DILocation(line: 123, column: 7, scope: !306)
!306 = distinct !DILexicalBlock(scope: !307, file: !1, line: 123, column: 7)
!307 = distinct !DILexicalBlock(scope: !297, file: !1, line: 122, column: 35)
!308 = !DILocation(line: 123, column: 8, scope: !306)
!309 = !DILocation(line: 123, column: 7, scope: !307)
!310 = !DILocation(line: 125, column: 15, scope: !311)
!311 = distinct !DILexicalBlock(scope: !306, file: !1, line: 123, column: 11)
!312 = !DILocation(line: 125, column: 15, scope: !313)
!313 = !DILexicalBlockFile(scope: !311, file: !1, discriminator: 1)
!314 = !DILocation(line: 125, column: 15, scope: !315)
!315 = !DILexicalBlockFile(scope: !311, file: !1, discriminator: 2)
!316 = !DILocation(line: 125, column: 15, scope: !317)
!317 = !DILexicalBlockFile(scope: !311, file: !1, discriminator: 3)
!318 = !DILocation(line: 125, column: 15, scope: !319)
!319 = !DILexicalBlockFile(scope: !311, file: !1, discriminator: 4)
!320 = !DILocation(line: 125, column: 15, scope: !321)
!321 = !DILexicalBlockFile(scope: !311, file: !1, discriminator: 5)
!322 = !DILocation(line: 125, column: 15, scope: !323)
!323 = !DILexicalBlockFile(scope: !311, file: !1, discriminator: 6)
!324 = !DILocation(line: 125, column: 15, scope: !325)
!325 = !DILexicalBlockFile(scope: !311, file: !1, discriminator: 7)
!326 = !DILocation(line: 125, column: 15, scope: !327)
!327 = !DILexicalBlockFile(scope: !311, file: !1, discriminator: 8)
!328 = !DILocation(line: 125, column: 15, scope: !329)
!329 = !DILexicalBlockFile(scope: !311, file: !1, discriminator: 9)
!330 = !DILocation(line: 125, column: 15, scope: !331)
!331 = !DILexicalBlockFile(scope: !311, file: !1, discriminator: 10)
!332 = !DILocation(line: 125, column: 15, scope: !333)
!333 = !DILexicalBlockFile(scope: !311, file: !1, discriminator: 11)
!334 = !DILocation(line: 125, column: 15, scope: !335)
!335 = !DILexicalBlockFile(scope: !311, file: !1, discriminator: 12)
!336 = !DILocation(line: 125, column: 15, scope: !337)
!337 = !DILexicalBlockFile(scope: !311, file: !1, discriminator: 13)
!338 = !DILocation(line: 125, column: 15, scope: !339)
!339 = !DILexicalBlockFile(scope: !311, file: !1, discriminator: 14)
!340 = !DILocation(line: 125, column: 15, scope: !341)
!341 = !DILexicalBlockFile(scope: !311, file: !1, discriminator: 15)
!342 = !DILocation(line: 125, column: 10, scope: !341)
!343 = !DILocation(line: 125, column: 5, scope: !341)
!344 = !DILocation(line: 125, column: 7, scope: !341)
!345 = !DILocation(line: 125, column: 13, scope: !341)
!346 = !DILocation(line: 127, column: 7, scope: !311)
!347 = !DILocation(line: 128, column: 4, scope: !311)
!348 = !DILocation(line: 132, column: 3, scope: !307)
!349 = !DILocation(line: 122, column: 31, scope: !350)
!350 = !DILexicalBlockFile(scope: !297, file: !1, discriminator: 4)
!351 = !DILocation(line: 122, column: 3, scope: !350)
!352 = !DILocation(line: 134, column: 2, scope: !193)
!353 = !DILocation(line: 100, column: 22, scope: !354)
!354 = !DILexicalBlockFile(scope: !189, file: !1, discriminator: 2)
!355 = !DILocation(line: 100, column: 2, scope: !354)
!356 = !DILocation(line: 136, column: 9, scope: !9)
!357 = !DILocation(line: 136, column: 2, scope: !9)
!358 = !DILocation(line: 140, column: 2, scope: !13)
!359 = !DILocation(line: 141, column: 2, scope: !13)
!360 = !DILocation(line: 142, column: 2, scope: !13)
!361 = !DILocation(line: 144, column: 6, scope: !362)
!362 = distinct !DILexicalBlock(scope: !13, file: !1, line: 144, column: 6)
!363 = !DILocation(line: 144, column: 19, scope: !362)
!364 = !DILocation(line: 144, column: 16, scope: !362)
!365 = !DILocation(line: 144, column: 6, scope: !13)
!366 = !DILocation(line: 145, column: 3, scope: !367)
!367 = distinct !DILexicalBlock(scope: !362, file: !1, line: 144, column: 31)
!368 = !DILocation(line: 146, column: 3, scope: !367)
!369 = !DILocation(line: 149, column: 5, scope: !370)
!370 = distinct !DILexicalBlock(scope: !13, file: !1, line: 149, column: 5)
!371 = !DILocation(line: 149, column: 15, scope: !370)
!372 = !DILocation(line: 149, column: 14, scope: !370)
!373 = !DILocation(line: 149, column: 5, scope: !13)
!374 = !DILocation(line: 150, column: 3, scope: !375)
!375 = distinct !DILexicalBlock(scope: !370, file: !1, line: 149, column: 23)
!376 = !DILocation(line: 151, column: 3, scope: !375)
!377 = !DILocation(line: 154, column: 66, scope: !13)
!378 = !DILocation(line: 154, column: 2, scope: !13)
!379 = !DILocation(line: 155, column: 64, scope: !13)
!380 = !DILocation(line: 155, column: 2, scope: !13)
!381 = !DILocation(line: 156, column: 1, scope: !13)
