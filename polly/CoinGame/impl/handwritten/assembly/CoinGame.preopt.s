; ModuleID = 'CoinGame.c'
source_filename = "CoinGame.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@V = global [6 x i32] [i32 6, i32 5, i32 2, i32 7, i32 3, i32 5], align 16
@M = common global [6 x [6 x i32]] zeroinitializer, align 16
@.str = private unnamed_addr constant [21 x i8] c"Alice take coin no. \00", align 1
@.str.1 = private unnamed_addr constant [19 x i8] c"Bob take coin no. \00", align 1
@.str.2 = private unnamed_addr constant [10 x i8] c"(%d, $%d)\00", align 1
@.str.3 = private unnamed_addr constant [3 x i8] c", \00", align 1
@.str.4 = private unnamed_addr constant [3 x i8] c".\0A\00", align 1
@.str.5 = private unnamed_addr constant [55 x i8] c"\0AThe total amount of money (maximum) Alice get is %d.\0A\00", align 1
@X = common global [6 x [6 x i32]] zeroinitializer, align 16
@Y = common global [6 x [6 x i32]] zeroinitializer, align 16
@Z = common global [6 x [6 x i32]] zeroinitializer, align 16
@.str.6 = private unnamed_addr constant [5 x i8] c" %d \00", align 1
@.str.7 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1

; Function Attrs: nounwind uwtable
define void @printMoves() #0 !dbg !4 {
entry:
  %m = alloca i32, align 4
  %n = alloca i32, align 4
  %alice = alloca i8, align 1
  %P1 = alloca i32, align 4
  %P2 = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %m, metadata !26, metadata !27), !dbg !28
  store i32 0, i32* %m, align 4, !dbg !28
  call void @llvm.dbg.declare(metadata i32* %n, metadata !29, metadata !27), !dbg !30
  store i32 5, i32* %n, align 4, !dbg !30
  call void @llvm.dbg.declare(metadata i8* %alice, metadata !31, metadata !27), !dbg !33
  store i8 1, i8* %alice, align 1, !dbg !33
  br label %while.cond, !dbg !34

while.cond:                                       ; preds = %if.end25, %entry
  %0 = load i32, i32* %m, align 4, !dbg !35
  %1 = load i32, i32* %n, align 4, !dbg !37
  %cmp = icmp sle i32 %0, %1, !dbg !38
  br i1 %cmp, label %while.body, label %while.end, !dbg !39

while.body:                                       ; preds = %while.cond
  call void @llvm.dbg.declare(metadata i32* %P1, metadata !40, metadata !27), !dbg !42
  %2 = load i32, i32* %n, align 4, !dbg !43
  %idxprom = sext i32 %2 to i64, !dbg !44
  %3 = load i32, i32* %m, align 4, !dbg !45
  %add = add nsw i32 %3, 1, !dbg !46
  %idxprom1 = sext i32 %add to i64, !dbg !44
  %arrayidx = getelementptr inbounds [6 x [6 x i32]], [6 x [6 x i32]]* @M, i64 0, i64 %idxprom1, !dbg !44
  %arrayidx2 = getelementptr inbounds [6 x i32], [6 x i32]* %arrayidx, i64 0, i64 %idxprom, !dbg !44
  %4 = load i32, i32* %arrayidx2, align 4, !dbg !44
  store i32 %4, i32* %P1, align 4, !dbg !42
  call void @llvm.dbg.declare(metadata i32* %P2, metadata !47, metadata !27), !dbg !48
  %5 = load i32, i32* %n, align 4, !dbg !49
  %sub = sub nsw i32 %5, 1, !dbg !50
  %idxprom3 = sext i32 %sub to i64, !dbg !51
  %6 = load i32, i32* %m, align 4, !dbg !52
  %idxprom4 = sext i32 %6 to i64, !dbg !51
  %arrayidx5 = getelementptr inbounds [6 x [6 x i32]], [6 x [6 x i32]]* @M, i64 0, i64 %idxprom4, !dbg !51
  %arrayidx6 = getelementptr inbounds [6 x i32], [6 x i32]* %arrayidx5, i64 0, i64 %idxprom3, !dbg !51
  %7 = load i32, i32* %arrayidx6, align 4, !dbg !51
  store i32 %7, i32* %P2, align 4, !dbg !48
  %8 = load i8, i8* %alice, align 1, !dbg !53
  %tobool = trunc i8 %8 to i1, !dbg !53
  br i1 %tobool, label %if.then, label %if.else, !dbg !55

if.then:                                          ; preds = %while.body
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str, i32 0, i32 0)), !dbg !56
  br label %if.end, !dbg !58

if.else:                                          ; preds = %while.body
  %call7 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([19 x i8], [19 x i8]* @.str.1, i32 0, i32 0)), !dbg !59
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %9 = load i32, i32* %P1, align 4, !dbg !61
  %10 = load i32, i32* %P2, align 4, !dbg !63
  %cmp8 = icmp sle i32 %9, %10, !dbg !64
  br i1 %cmp8, label %if.then9, label %if.else14, !dbg !65

if.then9:                                         ; preds = %if.end
  %11 = load i32, i32* %m, align 4, !dbg !66
  %add10 = add nsw i32 %11, 1, !dbg !68
  %12 = load i32, i32* %m, align 4, !dbg !69
  %idxprom11 = sext i32 %12 to i64, !dbg !70
  %arrayidx12 = getelementptr inbounds [6 x i32], [6 x i32]* @V, i64 0, i64 %idxprom11, !dbg !70
  %13 = load i32, i32* %arrayidx12, align 4, !dbg !70
  %call13 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.2, i32 0, i32 0), i32 %add10, i32 %13), !dbg !71
  %14 = load i32, i32* %m, align 4, !dbg !72
  %inc = add nsw i32 %14, 1, !dbg !72
  store i32 %inc, i32* %m, align 4, !dbg !72
  br label %if.end19, !dbg !73

if.else14:                                        ; preds = %if.end
  %15 = load i32, i32* %n, align 4, !dbg !74
  %add15 = add nsw i32 %15, 1, !dbg !76
  %16 = load i32, i32* %n, align 4, !dbg !77
  %idxprom16 = sext i32 %16 to i64, !dbg !78
  %arrayidx17 = getelementptr inbounds [6 x i32], [6 x i32]* @V, i64 0, i64 %idxprom16, !dbg !78
  %17 = load i32, i32* %arrayidx17, align 4, !dbg !78
  %call18 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.2, i32 0, i32 0), i32 %add15, i32 %17), !dbg !79
  %18 = load i32, i32* %n, align 4, !dbg !80
  %dec = add nsw i32 %18, -1, !dbg !80
  store i32 %dec, i32* %n, align 4, !dbg !80
  br label %if.end19

if.end19:                                         ; preds = %if.else14, %if.then9
  %19 = load i8, i8* %alice, align 1, !dbg !81
  %tobool20 = trunc i8 %19 to i1, !dbg !81
  br i1 %tobool20, label %if.then21, label %if.else23, !dbg !83

if.then21:                                        ; preds = %if.end19
  %call22 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.3, i32 0, i32 0)), !dbg !84
  br label %if.end25, !dbg !86

if.else23:                                        ; preds = %if.end19
  %call24 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.4, i32 0, i32 0)), !dbg !87
  br label %if.end25

if.end25:                                         ; preds = %if.else23, %if.then21
  %20 = load i8, i8* %alice, align 1, !dbg !89
  %tobool26 = trunc i8 %20 to i1, !dbg !89
  %lnot = xor i1 %tobool26, true, !dbg !90
  %frombool = zext i1 %lnot to i8, !dbg !91
  store i8 %frombool, i8* %alice, align 1, !dbg !91
  br label %while.cond, !dbg !92

while.end:                                        ; preds = %while.cond
  %21 = load i32, i32* getelementptr inbounds ([6 x [6 x i32]], [6 x [6 x i32]]* @M, i64 0, i64 0, i64 5), align 4, !dbg !94
  %call27 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([55 x i8], [55 x i8]* @.str.5, i32 0, i32 0), i32 %21), !dbg !95
  ret void, !dbg !96
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare i32 @printf(i8*, ...) #2

; Function Attrs: nounwind uwtable
define i32 @maxMoney() #0 !dbg !7 {
entry:
  %i = alloca i32, align 4
  %m = alloca i32, align 4
  %n = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %i, metadata !97, metadata !27), !dbg !98
  call void @llvm.dbg.declare(metadata i32* %m, metadata !99, metadata !27), !dbg !100
  call void @llvm.dbg.declare(metadata i32* %n, metadata !101, metadata !27), !dbg !102
  store i32 0, i32* %i, align 4, !dbg !103
  br label %for.cond, !dbg !105

for.cond:                                         ; preds = %for.inc180, %entry
  %0 = load i32, i32* %i, align 4, !dbg !106
  %cmp = icmp slt i32 %0, 6, !dbg !109
  br i1 %cmp, label %for.body, label %for.end182, !dbg !110

for.body:                                         ; preds = %for.cond
  %1 = load i32, i32* %i, align 4, !dbg !111
  store i32 %1, i32* %n, align 4, !dbg !114
  store i32 0, i32* %m, align 4, !dbg !115
  br label %for.cond1, !dbg !116

for.cond1:                                        ; preds = %for.inc, %for.body
  %2 = load i32, i32* %m, align 4, !dbg !117
  %cmp2 = icmp slt i32 %2, 6, !dbg !120
  br i1 %cmp2, label %land.rhs, label %land.end, !dbg !121

land.rhs:                                         ; preds = %for.cond1
  %3 = load i32, i32* %n, align 4, !dbg !122
  %cmp3 = icmp slt i32 %3, 6, !dbg !124
  br label %land.end

land.end:                                         ; preds = %land.rhs, %for.cond1
  %4 = phi i1 [ false, %for.cond1 ], [ %cmp3, %land.rhs ]
  br i1 %4, label %for.body4, label %for.end, !dbg !125

for.body4:                                        ; preds = %land.end
  %5 = load i32, i32* %n, align 4, !dbg !127
  %idxprom = sext i32 %5 to i64, !dbg !129
  %6 = load i32, i32* %m, align 4, !dbg !130
  %idxprom5 = sext i32 %6 to i64, !dbg !129
  %arrayidx = getelementptr inbounds [6 x [6 x i32]], [6 x [6 x i32]]* @X, i64 0, i64 %idxprom5, !dbg !129
  %arrayidx6 = getelementptr inbounds [6 x i32], [6 x i32]* %arrayidx, i64 0, i64 %idxprom, !dbg !129
  store i32 0, i32* %arrayidx6, align 4, !dbg !131
  %7 = load i32, i32* %m, align 4, !dbg !132
  %add = add nsw i32 %7, 2, !dbg !134
  %cmp7 = icmp slt i32 %add, 6, !dbg !135
  br i1 %cmp7, label %if.then, label %if.end, !dbg !136

if.then:                                          ; preds = %for.body4
  %8 = load i32, i32* %n, align 4, !dbg !137
  %idxprom8 = sext i32 %8 to i64, !dbg !139
  %9 = load i32, i32* %m, align 4, !dbg !140
  %idxprom9 = sext i32 %9 to i64, !dbg !139
  %arrayidx10 = getelementptr inbounds [6 x [6 x i32]], [6 x [6 x i32]]* @X, i64 0, i64 %idxprom9, !dbg !139
  %arrayidx11 = getelementptr inbounds [6 x i32], [6 x i32]* %arrayidx10, i64 0, i64 %idxprom8, !dbg !139
  %10 = load i32, i32* %arrayidx11, align 4, !dbg !139
  %11 = load i32, i32* %n, align 4, !dbg !141
  %idxprom12 = sext i32 %11 to i64, !dbg !142
  %12 = load i32, i32* %m, align 4, !dbg !143
  %add13 = add nsw i32 %12, 2, !dbg !144
  %idxprom14 = sext i32 %add13 to i64, !dbg !142
  %arrayidx15 = getelementptr inbounds [6 x [6 x i32]], [6 x [6 x i32]]* @M, i64 0, i64 %idxprom14, !dbg !142
  %arrayidx16 = getelementptr inbounds [6 x i32], [6 x i32]* %arrayidx15, i64 0, i64 %idxprom12, !dbg !142
  %13 = load i32, i32* %arrayidx16, align 4, !dbg !142
  %add17 = add nsw i32 %10, %13, !dbg !145
  %14 = load i32, i32* %n, align 4, !dbg !146
  %idxprom18 = sext i32 %14 to i64, !dbg !147
  %15 = load i32, i32* %m, align 4, !dbg !148
  %idxprom19 = sext i32 %15 to i64, !dbg !147
  %arrayidx20 = getelementptr inbounds [6 x [6 x i32]], [6 x [6 x i32]]* @X, i64 0, i64 %idxprom19, !dbg !147
  %arrayidx21 = getelementptr inbounds [6 x i32], [6 x i32]* %arrayidx20, i64 0, i64 %idxprom18, !dbg !147
  store i32 %add17, i32* %arrayidx21, align 4, !dbg !149
  br label %if.end, !dbg !150

if.end:                                           ; preds = %if.then, %for.body4
  %16 = load i32, i32* %n, align 4, !dbg !151
  %idxprom22 = sext i32 %16 to i64, !dbg !152
  %17 = load i32, i32* %m, align 4, !dbg !153
  %idxprom23 = sext i32 %17 to i64, !dbg !152
  %arrayidx24 = getelementptr inbounds [6 x [6 x i32]], [6 x [6 x i32]]* @Y, i64 0, i64 %idxprom23, !dbg !152
  %arrayidx25 = getelementptr inbounds [6 x i32], [6 x i32]* %arrayidx24, i64 0, i64 %idxprom22, !dbg !152
  store i32 0, i32* %arrayidx25, align 4, !dbg !154
  %18 = load i32, i32* %m, align 4, !dbg !155
  %add26 = add nsw i32 %18, 1, !dbg !157
  %cmp27 = icmp slt i32 %add26, 6, !dbg !158
  br i1 %cmp27, label %land.lhs.true, label %if.end45, !dbg !159

land.lhs.true:                                    ; preds = %if.end
  %19 = load i32, i32* %n, align 4, !dbg !160
  %sub = sub nsw i32 %19, 1, !dbg !162
  %cmp28 = icmp sge i32 %sub, 0, !dbg !163
  br i1 %cmp28, label %if.then29, label %if.end45, !dbg !164

if.then29:                                        ; preds = %land.lhs.true
  %20 = load i32, i32* %n, align 4, !dbg !165
  %idxprom30 = sext i32 %20 to i64, !dbg !167
  %21 = load i32, i32* %m, align 4, !dbg !168
  %idxprom31 = sext i32 %21 to i64, !dbg !167
  %arrayidx32 = getelementptr inbounds [6 x [6 x i32]], [6 x [6 x i32]]* @Y, i64 0, i64 %idxprom31, !dbg !167
  %arrayidx33 = getelementptr inbounds [6 x i32], [6 x i32]* %arrayidx32, i64 0, i64 %idxprom30, !dbg !167
  %22 = load i32, i32* %arrayidx33, align 4, !dbg !167
  %23 = load i32, i32* %n, align 4, !dbg !169
  %sub34 = sub nsw i32 %23, 1, !dbg !170
  %idxprom35 = sext i32 %sub34 to i64, !dbg !171
  %24 = load i32, i32* %m, align 4, !dbg !172
  %add36 = add nsw i32 %24, 1, !dbg !173
  %idxprom37 = sext i32 %add36 to i64, !dbg !171
  %arrayidx38 = getelementptr inbounds [6 x [6 x i32]], [6 x [6 x i32]]* @M, i64 0, i64 %idxprom37, !dbg !171
  %arrayidx39 = getelementptr inbounds [6 x i32], [6 x i32]* %arrayidx38, i64 0, i64 %idxprom35, !dbg !171
  %25 = load i32, i32* %arrayidx39, align 4, !dbg !171
  %add40 = add nsw i32 %22, %25, !dbg !174
  %26 = load i32, i32* %n, align 4, !dbg !175
  %idxprom41 = sext i32 %26 to i64, !dbg !176
  %27 = load i32, i32* %m, align 4, !dbg !177
  %idxprom42 = sext i32 %27 to i64, !dbg !176
  %arrayidx43 = getelementptr inbounds [6 x [6 x i32]], [6 x [6 x i32]]* @Y, i64 0, i64 %idxprom42, !dbg !176
  %arrayidx44 = getelementptr inbounds [6 x i32], [6 x i32]* %arrayidx43, i64 0, i64 %idxprom41, !dbg !176
  store i32 %add40, i32* %arrayidx44, align 4, !dbg !178
  br label %if.end45, !dbg !179

if.end45:                                         ; preds = %if.then29, %land.lhs.true, %if.end
  %28 = load i32, i32* %n, align 4, !dbg !180
  %idxprom46 = sext i32 %28 to i64, !dbg !181
  %29 = load i32, i32* %m, align 4, !dbg !182
  %idxprom47 = sext i32 %29 to i64, !dbg !181
  %arrayidx48 = getelementptr inbounds [6 x [6 x i32]], [6 x [6 x i32]]* @Z, i64 0, i64 %idxprom47, !dbg !181
  %arrayidx49 = getelementptr inbounds [6 x i32], [6 x i32]* %arrayidx48, i64 0, i64 %idxprom46, !dbg !181
  store i32 0, i32* %arrayidx49, align 4, !dbg !183
  %30 = load i32, i32* %n, align 4, !dbg !184
  %sub50 = sub nsw i32 %30, 1, !dbg !186
  %cmp51 = icmp sgt i32 %sub50, 0, !dbg !187
  br i1 %cmp51, label %if.then52, label %if.end67, !dbg !188

if.then52:                                        ; preds = %if.end45
  %31 = load i32, i32* %n, align 4, !dbg !189
  %idxprom53 = sext i32 %31 to i64, !dbg !191
  %32 = load i32, i32* %m, align 4, !dbg !192
  %idxprom54 = sext i32 %32 to i64, !dbg !191
  %arrayidx55 = getelementptr inbounds [6 x [6 x i32]], [6 x [6 x i32]]* @Z, i64 0, i64 %idxprom54, !dbg !191
  %arrayidx56 = getelementptr inbounds [6 x i32], [6 x i32]* %arrayidx55, i64 0, i64 %idxprom53, !dbg !191
  %33 = load i32, i32* %arrayidx56, align 4, !dbg !191
  %34 = load i32, i32* %n, align 4, !dbg !193
  %sub57 = sub nsw i32 %34, 2, !dbg !194
  %idxprom58 = sext i32 %sub57 to i64, !dbg !195
  %35 = load i32, i32* %m, align 4, !dbg !196
  %idxprom59 = sext i32 %35 to i64, !dbg !195
  %arrayidx60 = getelementptr inbounds [6 x [6 x i32]], [6 x [6 x i32]]* @M, i64 0, i64 %idxprom59, !dbg !195
  %arrayidx61 = getelementptr inbounds [6 x i32], [6 x i32]* %arrayidx60, i64 0, i64 %idxprom58, !dbg !195
  %36 = load i32, i32* %arrayidx61, align 4, !dbg !195
  %add62 = add nsw i32 %33, %36, !dbg !197
  %37 = load i32, i32* %n, align 4, !dbg !198
  %idxprom63 = sext i32 %37 to i64, !dbg !199
  %38 = load i32, i32* %m, align 4, !dbg !200
  %idxprom64 = sext i32 %38 to i64, !dbg !199
  %arrayidx65 = getelementptr inbounds [6 x [6 x i32]], [6 x [6 x i32]]* @Z, i64 0, i64 %idxprom64, !dbg !199
  %arrayidx66 = getelementptr inbounds [6 x i32], [6 x i32]* %arrayidx65, i64 0, i64 %idxprom63, !dbg !199
  store i32 %add62, i32* %arrayidx66, align 4, !dbg !201
  br label %if.end67, !dbg !202

if.end67:                                         ; preds = %if.then52, %if.end45
  br label %for.inc, !dbg !203

for.inc:                                          ; preds = %if.end67
  %39 = load i32, i32* %m, align 4, !dbg !204
  %inc = add nsw i32 %39, 1, !dbg !204
  store i32 %inc, i32* %m, align 4, !dbg !204
  %40 = load i32, i32* %n, align 4, !dbg !206
  %inc68 = add nsw i32 %40, 1, !dbg !206
  store i32 %inc68, i32* %n, align 4, !dbg !206
  br label %for.cond1, !dbg !207

for.end:                                          ; preds = %land.end
  %41 = load i32, i32* %i, align 4, !dbg !208
  store i32 %41, i32* %n, align 4, !dbg !210
  store i32 0, i32* %m, align 4, !dbg !211
  br label %for.cond69, !dbg !212

for.cond69:                                       ; preds = %for.inc176, %for.end
  %42 = load i32, i32* %m, align 4, !dbg !213
  %cmp70 = icmp slt i32 %42, 6, !dbg !216
  br i1 %cmp70, label %land.rhs71, label %land.end73, !dbg !217

land.rhs71:                                       ; preds = %for.cond69
  %43 = load i32, i32* %n, align 4, !dbg !218
  %cmp72 = icmp slt i32 %43, 6, !dbg !220
  br label %land.end73

land.end73:                                       ; preds = %land.rhs71, %for.cond69
  %44 = phi i1 [ false, %for.cond69 ], [ %cmp72, %land.rhs71 ]
  br i1 %44, label %for.body74, label %for.end179, !dbg !221

for.body74:                                       ; preds = %land.end73
  %45 = load i32, i32* %m, align 4, !dbg !223
  %idxprom75 = sext i32 %45 to i64, !dbg !223
  %arrayidx76 = getelementptr inbounds [6 x i32], [6 x i32]* @V, i64 0, i64 %idxprom75, !dbg !223
  %46 = load i32, i32* %arrayidx76, align 4, !dbg !223
  %47 = load i32, i32* %n, align 4, !dbg !223
  %idxprom77 = sext i32 %47 to i64, !dbg !223
  %48 = load i32, i32* %m, align 4, !dbg !223
  %idxprom78 = sext i32 %48 to i64, !dbg !223
  %arrayidx79 = getelementptr inbounds [6 x [6 x i32]], [6 x [6 x i32]]* @X, i64 0, i64 %idxprom78, !dbg !223
  %arrayidx80 = getelementptr inbounds [6 x i32], [6 x i32]* %arrayidx79, i64 0, i64 %idxprom77, !dbg !223
  %49 = load i32, i32* %arrayidx80, align 4, !dbg !223
  %50 = load i32, i32* %n, align 4, !dbg !223
  %idxprom81 = sext i32 %50 to i64, !dbg !223
  %51 = load i32, i32* %m, align 4, !dbg !223
  %idxprom82 = sext i32 %51 to i64, !dbg !223
  %arrayidx83 = getelementptr inbounds [6 x [6 x i32]], [6 x [6 x i32]]* @Y, i64 0, i64 %idxprom82, !dbg !223
  %arrayidx84 = getelementptr inbounds [6 x i32], [6 x i32]* %arrayidx83, i64 0, i64 %idxprom81, !dbg !223
  %52 = load i32, i32* %arrayidx84, align 4, !dbg !223
  %cmp85 = icmp slt i32 %49, %52, !dbg !223
  br i1 %cmp85, label %cond.true, label %cond.false, !dbg !223

cond.true:                                        ; preds = %for.body74
  %53 = load i32, i32* %n, align 4, !dbg !225
  %idxprom86 = sext i32 %53 to i64, !dbg !225
  %54 = load i32, i32* %m, align 4, !dbg !225
  %idxprom87 = sext i32 %54 to i64, !dbg !225
  %arrayidx88 = getelementptr inbounds [6 x [6 x i32]], [6 x [6 x i32]]* @X, i64 0, i64 %idxprom87, !dbg !225
  %arrayidx89 = getelementptr inbounds [6 x i32], [6 x i32]* %arrayidx88, i64 0, i64 %idxprom86, !dbg !225
  %55 = load i32, i32* %arrayidx89, align 4, !dbg !225
  br label %cond.end, !dbg !225

cond.false:                                       ; preds = %for.body74
  %56 = load i32, i32* %n, align 4, !dbg !227
  %idxprom90 = sext i32 %56 to i64, !dbg !227
  %57 = load i32, i32* %m, align 4, !dbg !227
  %idxprom91 = sext i32 %57 to i64, !dbg !227
  %arrayidx92 = getelementptr inbounds [6 x [6 x i32]], [6 x [6 x i32]]* @Y, i64 0, i64 %idxprom91, !dbg !227
  %arrayidx93 = getelementptr inbounds [6 x i32], [6 x i32]* %arrayidx92, i64 0, i64 %idxprom90, !dbg !227
  %58 = load i32, i32* %arrayidx93, align 4, !dbg !227
  br label %cond.end, !dbg !227

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %55, %cond.true ], [ %58, %cond.false ], !dbg !229
  %add94 = add nsw i32 %46, %cond, !dbg !229
  %59 = load i32, i32* %n, align 4, !dbg !229
  %idxprom95 = sext i32 %59 to i64, !dbg !229
  %arrayidx96 = getelementptr inbounds [6 x i32], [6 x i32]* @V, i64 0, i64 %idxprom95, !dbg !229
  %60 = load i32, i32* %arrayidx96, align 4, !dbg !229
  %61 = load i32, i32* %n, align 4, !dbg !229
  %idxprom97 = sext i32 %61 to i64, !dbg !229
  %62 = load i32, i32* %m, align 4, !dbg !229
  %idxprom98 = sext i32 %62 to i64, !dbg !229
  %arrayidx99 = getelementptr inbounds [6 x [6 x i32]], [6 x [6 x i32]]* @Y, i64 0, i64 %idxprom98, !dbg !229
  %arrayidx100 = getelementptr inbounds [6 x i32], [6 x i32]* %arrayidx99, i64 0, i64 %idxprom97, !dbg !229
  %63 = load i32, i32* %arrayidx100, align 4, !dbg !229
  %64 = load i32, i32* %n, align 4, !dbg !229
  %idxprom101 = sext i32 %64 to i64, !dbg !229
  %65 = load i32, i32* %m, align 4, !dbg !229
  %idxprom102 = sext i32 %65 to i64, !dbg !229
  %arrayidx103 = getelementptr inbounds [6 x [6 x i32]], [6 x [6 x i32]]* @Z, i64 0, i64 %idxprom102, !dbg !229
  %arrayidx104 = getelementptr inbounds [6 x i32], [6 x i32]* %arrayidx103, i64 0, i64 %idxprom101, !dbg !229
  %66 = load i32, i32* %arrayidx104, align 4, !dbg !229
  %cmp105 = icmp slt i32 %63, %66, !dbg !229
  br i1 %cmp105, label %cond.true106, label %cond.false111, !dbg !229

cond.true106:                                     ; preds = %cond.end
  %67 = load i32, i32* %n, align 4, !dbg !231
  %idxprom107 = sext i32 %67 to i64, !dbg !231
  %68 = load i32, i32* %m, align 4, !dbg !231
  %idxprom108 = sext i32 %68 to i64, !dbg !231
  %arrayidx109 = getelementptr inbounds [6 x [6 x i32]], [6 x [6 x i32]]* @Y, i64 0, i64 %idxprom108, !dbg !231
  %arrayidx110 = getelementptr inbounds [6 x i32], [6 x i32]* %arrayidx109, i64 0, i64 %idxprom107, !dbg !231
  %69 = load i32, i32* %arrayidx110, align 4, !dbg !231
  br label %cond.end116, !dbg !231

cond.false111:                                    ; preds = %cond.end
  %70 = load i32, i32* %n, align 4, !dbg !233
  %idxprom112 = sext i32 %70 to i64, !dbg !233
  %71 = load i32, i32* %m, align 4, !dbg !233
  %idxprom113 = sext i32 %71 to i64, !dbg !233
  %arrayidx114 = getelementptr inbounds [6 x [6 x i32]], [6 x [6 x i32]]* @Z, i64 0, i64 %idxprom113, !dbg !233
  %arrayidx115 = getelementptr inbounds [6 x i32], [6 x i32]* %arrayidx114, i64 0, i64 %idxprom112, !dbg !233
  %72 = load i32, i32* %arrayidx115, align 4, !dbg !233
  br label %cond.end116, !dbg !233

cond.end116:                                      ; preds = %cond.false111, %cond.true106
  %cond117 = phi i32 [ %69, %cond.true106 ], [ %72, %cond.false111 ], !dbg !235
  %add118 = add nsw i32 %60, %cond117, !dbg !235
  %cmp119 = icmp sgt i32 %add94, %add118, !dbg !235
  br i1 %cmp119, label %cond.true120, label %cond.false145, !dbg !235

cond.true120:                                     ; preds = %cond.end116
  %73 = load i32, i32* %m, align 4, !dbg !237
  %idxprom121 = sext i32 %73 to i64, !dbg !237
  %arrayidx122 = getelementptr inbounds [6 x i32], [6 x i32]* @V, i64 0, i64 %idxprom121, !dbg !237
  %74 = load i32, i32* %arrayidx122, align 4, !dbg !237
  %75 = load i32, i32* %n, align 4, !dbg !237
  %idxprom123 = sext i32 %75 to i64, !dbg !237
  %76 = load i32, i32* %m, align 4, !dbg !237
  %idxprom124 = sext i32 %76 to i64, !dbg !237
  %arrayidx125 = getelementptr inbounds [6 x [6 x i32]], [6 x [6 x i32]]* @X, i64 0, i64 %idxprom124, !dbg !237
  %arrayidx126 = getelementptr inbounds [6 x i32], [6 x i32]* %arrayidx125, i64 0, i64 %idxprom123, !dbg !237
  %77 = load i32, i32* %arrayidx126, align 4, !dbg !237
  %78 = load i32, i32* %n, align 4, !dbg !237
  %idxprom127 = sext i32 %78 to i64, !dbg !237
  %79 = load i32, i32* %m, align 4, !dbg !237
  %idxprom128 = sext i32 %79 to i64, !dbg !237
  %arrayidx129 = getelementptr inbounds [6 x [6 x i32]], [6 x [6 x i32]]* @Y, i64 0, i64 %idxprom128, !dbg !237
  %arrayidx130 = getelementptr inbounds [6 x i32], [6 x i32]* %arrayidx129, i64 0, i64 %idxprom127, !dbg !237
  %80 = load i32, i32* %arrayidx130, align 4, !dbg !237
  %cmp131 = icmp slt i32 %77, %80, !dbg !237
  br i1 %cmp131, label %cond.true132, label %cond.false137, !dbg !237

cond.true132:                                     ; preds = %cond.true120
  %81 = load i32, i32* %n, align 4, !dbg !239
  %idxprom133 = sext i32 %81 to i64, !dbg !239
  %82 = load i32, i32* %m, align 4, !dbg !239
  %idxprom134 = sext i32 %82 to i64, !dbg !239
  %arrayidx135 = getelementptr inbounds [6 x [6 x i32]], [6 x [6 x i32]]* @X, i64 0, i64 %idxprom134, !dbg !239
  %arrayidx136 = getelementptr inbounds [6 x i32], [6 x i32]* %arrayidx135, i64 0, i64 %idxprom133, !dbg !239
  %83 = load i32, i32* %arrayidx136, align 4, !dbg !239
  br label %cond.end142, !dbg !239

cond.false137:                                    ; preds = %cond.true120
  %84 = load i32, i32* %n, align 4, !dbg !241
  %idxprom138 = sext i32 %84 to i64, !dbg !241
  %85 = load i32, i32* %m, align 4, !dbg !241
  %idxprom139 = sext i32 %85 to i64, !dbg !241
  %arrayidx140 = getelementptr inbounds [6 x [6 x i32]], [6 x [6 x i32]]* @Y, i64 0, i64 %idxprom139, !dbg !241
  %arrayidx141 = getelementptr inbounds [6 x i32], [6 x i32]* %arrayidx140, i64 0, i64 %idxprom138, !dbg !241
  %86 = load i32, i32* %arrayidx141, align 4, !dbg !241
  br label %cond.end142, !dbg !241

cond.end142:                                      ; preds = %cond.false137, %cond.true132
  %cond143 = phi i32 [ %83, %cond.true132 ], [ %86, %cond.false137 ], !dbg !243
  %add144 = add nsw i32 %74, %cond143, !dbg !243
  br label %cond.end170, !dbg !243

cond.false145:                                    ; preds = %cond.end116
  %87 = load i32, i32* %n, align 4, !dbg !245
  %idxprom146 = sext i32 %87 to i64, !dbg !245
  %arrayidx147 = getelementptr inbounds [6 x i32], [6 x i32]* @V, i64 0, i64 %idxprom146, !dbg !245
  %88 = load i32, i32* %arrayidx147, align 4, !dbg !245
  %89 = load i32, i32* %n, align 4, !dbg !245
  %idxprom148 = sext i32 %89 to i64, !dbg !245
  %90 = load i32, i32* %m, align 4, !dbg !245
  %idxprom149 = sext i32 %90 to i64, !dbg !245
  %arrayidx150 = getelementptr inbounds [6 x [6 x i32]], [6 x [6 x i32]]* @Y, i64 0, i64 %idxprom149, !dbg !245
  %arrayidx151 = getelementptr inbounds [6 x i32], [6 x i32]* %arrayidx150, i64 0, i64 %idxprom148, !dbg !245
  %91 = load i32, i32* %arrayidx151, align 4, !dbg !245
  %92 = load i32, i32* %n, align 4, !dbg !245
  %idxprom152 = sext i32 %92 to i64, !dbg !245
  %93 = load i32, i32* %m, align 4, !dbg !245
  %idxprom153 = sext i32 %93 to i64, !dbg !245
  %arrayidx154 = getelementptr inbounds [6 x [6 x i32]], [6 x [6 x i32]]* @Z, i64 0, i64 %idxprom153, !dbg !245
  %arrayidx155 = getelementptr inbounds [6 x i32], [6 x i32]* %arrayidx154, i64 0, i64 %idxprom152, !dbg !245
  %94 = load i32, i32* %arrayidx155, align 4, !dbg !245
  %cmp156 = icmp slt i32 %91, %94, !dbg !245
  br i1 %cmp156, label %cond.true157, label %cond.false162, !dbg !245

cond.true157:                                     ; preds = %cond.false145
  %95 = load i32, i32* %n, align 4, !dbg !247
  %idxprom158 = sext i32 %95 to i64, !dbg !247
  %96 = load i32, i32* %m, align 4, !dbg !247
  %idxprom159 = sext i32 %96 to i64, !dbg !247
  %arrayidx160 = getelementptr inbounds [6 x [6 x i32]], [6 x [6 x i32]]* @Y, i64 0, i64 %idxprom159, !dbg !247
  %arrayidx161 = getelementptr inbounds [6 x i32], [6 x i32]* %arrayidx160, i64 0, i64 %idxprom158, !dbg !247
  %97 = load i32, i32* %arrayidx161, align 4, !dbg !247
  br label %cond.end167, !dbg !247

cond.false162:                                    ; preds = %cond.false145
  %98 = load i32, i32* %n, align 4, !dbg !249
  %idxprom163 = sext i32 %98 to i64, !dbg !249
  %99 = load i32, i32* %m, align 4, !dbg !249
  %idxprom164 = sext i32 %99 to i64, !dbg !249
  %arrayidx165 = getelementptr inbounds [6 x [6 x i32]], [6 x [6 x i32]]* @Z, i64 0, i64 %idxprom164, !dbg !249
  %arrayidx166 = getelementptr inbounds [6 x i32], [6 x i32]* %arrayidx165, i64 0, i64 %idxprom163, !dbg !249
  %100 = load i32, i32* %arrayidx166, align 4, !dbg !249
  br label %cond.end167, !dbg !249

cond.end167:                                      ; preds = %cond.false162, %cond.true157
  %cond168 = phi i32 [ %97, %cond.true157 ], [ %100, %cond.false162 ], !dbg !251
  %add169 = add nsw i32 %88, %cond168, !dbg !251
  br label %cond.end170, !dbg !251

cond.end170:                                      ; preds = %cond.end167, %cond.end142
  %cond171 = phi i32 [ %add144, %cond.end142 ], [ %add169, %cond.end167 ], !dbg !253
  %101 = load i32, i32* %n, align 4, !dbg !255
  %idxprom172 = sext i32 %101 to i64, !dbg !256
  %102 = load i32, i32* %m, align 4, !dbg !257
  %idxprom173 = sext i32 %102 to i64, !dbg !256
  %arrayidx174 = getelementptr inbounds [6 x [6 x i32]], [6 x [6 x i32]]* @M, i64 0, i64 %idxprom173, !dbg !256
  %arrayidx175 = getelementptr inbounds [6 x i32], [6 x i32]* %arrayidx174, i64 0, i64 %idxprom172, !dbg !256
  store i32 %cond171, i32* %arrayidx175, align 4, !dbg !258
  br label %for.inc176, !dbg !259

for.inc176:                                       ; preds = %cond.end170
  %103 = load i32, i32* %m, align 4, !dbg !260
  %inc177 = add nsw i32 %103, 1, !dbg !260
  store i32 %inc177, i32* %m, align 4, !dbg !260
  %104 = load i32, i32* %n, align 4, !dbg !262
  %inc178 = add nsw i32 %104, 1, !dbg !262
  store i32 %inc178, i32* %n, align 4, !dbg !262
  br label %for.cond69, !dbg !263

for.end179:                                       ; preds = %land.end73
  br label %for.inc180, !dbg !264

for.inc180:                                       ; preds = %for.end179
  %105 = load i32, i32* %i, align 4, !dbg !265
  %inc181 = add nsw i32 %105, 1, !dbg !265
  store i32 %inc181, i32* %i, align 4, !dbg !265
  br label %for.cond, !dbg !267

for.end182:                                       ; preds = %for.cond
  store i32 0, i32* %m, align 4, !dbg !268
  br label %for.cond183, !dbg !270

for.cond183:                                      ; preds = %for.inc197, %for.end182
  %106 = load i32, i32* %m, align 4, !dbg !271
  %cmp184 = icmp slt i32 %106, 6, !dbg !274
  br i1 %cmp184, label %for.body185, label %for.end199, !dbg !275

for.body185:                                      ; preds = %for.cond183
  store i32 0, i32* %n, align 4, !dbg !276
  br label %for.cond186, !dbg !279

for.cond186:                                      ; preds = %for.inc193, %for.body185
  %107 = load i32, i32* %n, align 4, !dbg !280
  %cmp187 = icmp slt i32 %107, 6, !dbg !283
  br i1 %cmp187, label %for.body188, label %for.end195, !dbg !284

for.body188:                                      ; preds = %for.cond186
  %108 = load i32, i32* %n, align 4, !dbg !285
  %idxprom189 = sext i32 %108 to i64, !dbg !287
  %109 = load i32, i32* %m, align 4, !dbg !288
  %idxprom190 = sext i32 %109 to i64, !dbg !287
  %arrayidx191 = getelementptr inbounds [6 x [6 x i32]], [6 x [6 x i32]]* @M, i64 0, i64 %idxprom190, !dbg !287
  %arrayidx192 = getelementptr inbounds [6 x i32], [6 x i32]* %arrayidx191, i64 0, i64 %idxprom189, !dbg !287
  %110 = load i32, i32* %arrayidx192, align 4, !dbg !287
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.6, i32 0, i32 0), i32 %110), !dbg !289
  br label %for.inc193, !dbg !290

for.inc193:                                       ; preds = %for.body188
  %111 = load i32, i32* %n, align 4, !dbg !291
  %inc194 = add nsw i32 %111, 1, !dbg !291
  store i32 %inc194, i32* %n, align 4, !dbg !291
  br label %for.cond186, !dbg !293

for.end195:                                       ; preds = %for.cond186
  %call196 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.7, i32 0, i32 0)), !dbg !294
  br label %for.inc197, !dbg !295

for.inc197:                                       ; preds = %for.end195
  %112 = load i32, i32* %m, align 4, !dbg !296
  %inc198 = add nsw i32 %112, 1, !dbg !296
  store i32 %inc198, i32* %m, align 4, !dbg !296
  br label %for.cond183, !dbg !298

for.end199:                                       ; preds = %for.cond183
  %113 = load i32, i32* getelementptr inbounds ([6 x [6 x i32]], [6 x [6 x i32]]* @M, i64 0, i64 0, i64 5), align 4, !dbg !299
  ret i32 %113, !dbg !300
}

; Function Attrs: nounwind uwtable
define i32 @main() #0 !dbg !11 {
entry:
  %call = call i32 @maxMoney(), !dbg !301
  call void @printMoves(), !dbg !302
  ret i32 0, !dbg !303
}

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone }
attributes #2 = { "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!23, !24}
!llvm.ident = !{!25}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 3.9.0 (http://llvm.org/git/clang.git cf7bc8edf8cccb1b5de656c403cb55ad44132e98) (http://llvm.org/git/llvm.git 22706dc4c03305692f494d0e42a6de1050d0ec62)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, subprograms: !3, globals: !12)
!1 = !DIFile(filename: "CoinGame.c", directory: "/home/sam/workspace/WhileyOpenCL/polly/CoinGame/impl/handwritten")
!2 = !{}
!3 = !{!4, !7, !11}
!4 = distinct !DISubprogram(name: "printMoves", scope: !1, file: !1, line: 26, type: !5, isLocal: false, isDefinition: true, scopeLine: 26, isOptimized: false, variables: !2)
!5 = !DISubroutineType(types: !6)
!6 = !{null}
!7 = distinct !DISubprogram(name: "maxMoney", scope: !1, file: !1, line: 55, type: !8, isLocal: false, isDefinition: true, scopeLine: 55, isOptimized: false, variables: !2)
!8 = !DISubroutineType(types: !9)
!9 = !{!10}
!10 = !DIBasicType(name: "int", size: 32, align: 32, encoding: DW_ATE_signed)
!11 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 96, type: !8, isLocal: false, isDefinition: true, scopeLine: 96, isOptimized: false, variables: !2)
!12 = !{!13, !17, !20, !21, !22}
!13 = !DIGlobalVariable(name: "V", scope: !0, file: !1, line: 20, type: !14, isLocal: false, isDefinition: true, variable: [6 x i32]* @V)
!14 = !DICompositeType(tag: DW_TAG_array_type, baseType: !10, size: 192, align: 32, elements: !15)
!15 = !{!16}
!16 = !DISubrange(count: 6)
!17 = !DIGlobalVariable(name: "M", scope: !0, file: !1, line: 21, type: !18, isLocal: false, isDefinition: true, variable: [6 x [6 x i32]]* @M)
!18 = !DICompositeType(tag: DW_TAG_array_type, baseType: !10, size: 1152, align: 32, elements: !19)
!19 = !{!16, !16}
!20 = !DIGlobalVariable(name: "X", scope: !0, file: !1, line: 22, type: !18, isLocal: false, isDefinition: true, variable: [6 x [6 x i32]]* @X)
!21 = !DIGlobalVariable(name: "Y", scope: !0, file: !1, line: 23, type: !18, isLocal: false, isDefinition: true, variable: [6 x [6 x i32]]* @Y)
!22 = !DIGlobalVariable(name: "Z", scope: !0, file: !1, line: 24, type: !18, isLocal: false, isDefinition: true, variable: [6 x [6 x i32]]* @Z)
!23 = !{i32 2, !"Dwarf Version", i32 4}
!24 = !{i32 2, !"Debug Info Version", i32 3}
!25 = !{!"clang version 3.9.0 (http://llvm.org/git/clang.git cf7bc8edf8cccb1b5de656c403cb55ad44132e98) (http://llvm.org/git/llvm.git 22706dc4c03305692f494d0e42a6de1050d0ec62)"}
!26 = !DILocalVariable(name: "m", scope: !4, file: !1, line: 27, type: !10)
!27 = !DIExpression()
!28 = !DILocation(line: 27, column: 6, scope: !4)
!29 = !DILocalVariable(name: "n", scope: !4, file: !1, line: 27, type: !10)
!30 = !DILocation(line: 27, column: 13, scope: !4)
!31 = !DILocalVariable(name: "alice", scope: !4, file: !1, line: 28, type: !32)
!32 = !DIBasicType(name: "_Bool", size: 8, align: 8, encoding: DW_ATE_boolean)
!33 = !DILocation(line: 28, column: 7, scope: !4)
!34 = !DILocation(line: 29, column: 2, scope: !4)
!35 = !DILocation(line: 29, column: 9, scope: !36)
!36 = !DILexicalBlockFile(scope: !4, file: !1, discriminator: 1)
!37 = !DILocation(line: 29, column: 14, scope: !36)
!38 = !DILocation(line: 29, column: 11, scope: !36)
!39 = !DILocation(line: 29, column: 2, scope: !36)
!40 = !DILocalVariable(name: "P1", scope: !41, file: !1, line: 30, type: !10)
!41 = distinct !DILexicalBlock(scope: !4, file: !1, line: 29, column: 17)
!42 = !DILocation(line: 30, column: 7, scope: !41)
!43 = !DILocation(line: 30, column: 21, scope: !41)
!44 = !DILocation(line: 30, column: 12, scope: !41)
!45 = !DILocation(line: 30, column: 14, scope: !41)
!46 = !DILocation(line: 30, column: 16, scope: !41)
!47 = !DILocalVariable(name: "P2", scope: !41, file: !1, line: 31, type: !10)
!48 = !DILocation(line: 31, column: 7, scope: !41)
!49 = !DILocation(line: 31, column: 17, scope: !41)
!50 = !DILocation(line: 31, column: 19, scope: !41)
!51 = !DILocation(line: 31, column: 12, scope: !41)
!52 = !DILocation(line: 31, column: 14, scope: !41)
!53 = !DILocation(line: 32, column: 7, scope: !54)
!54 = distinct !DILexicalBlock(scope: !41, file: !1, line: 32, column: 7)
!55 = !DILocation(line: 32, column: 7, scope: !41)
!56 = !DILocation(line: 33, column: 4, scope: !57)
!57 = distinct !DILexicalBlock(scope: !54, file: !1, line: 32, column: 14)
!58 = !DILocation(line: 34, column: 3, scope: !57)
!59 = !DILocation(line: 35, column: 4, scope: !60)
!60 = distinct !DILexicalBlock(scope: !54, file: !1, line: 34, column: 10)
!61 = !DILocation(line: 37, column: 7, scope: !62)
!62 = distinct !DILexicalBlock(scope: !41, file: !1, line: 37, column: 7)
!63 = !DILocation(line: 37, column: 13, scope: !62)
!64 = !DILocation(line: 37, column: 10, scope: !62)
!65 = !DILocation(line: 37, column: 7, scope: !41)
!66 = !DILocation(line: 38, column: 24, scope: !67)
!67 = distinct !DILexicalBlock(scope: !62, file: !1, line: 37, column: 17)
!68 = !DILocation(line: 38, column: 26, scope: !67)
!69 = !DILocation(line: 38, column: 33, scope: !67)
!70 = !DILocation(line: 38, column: 31, scope: !67)
!71 = !DILocation(line: 38, column: 4, scope: !67)
!72 = !DILocation(line: 39, column: 5, scope: !67)
!73 = !DILocation(line: 40, column: 3, scope: !67)
!74 = !DILocation(line: 41, column: 24, scope: !75)
!75 = distinct !DILexicalBlock(scope: !62, file: !1, line: 40, column: 10)
!76 = !DILocation(line: 41, column: 26, scope: !75)
!77 = !DILocation(line: 41, column: 33, scope: !75)
!78 = !DILocation(line: 41, column: 31, scope: !75)
!79 = !DILocation(line: 41, column: 4, scope: !75)
!80 = !DILocation(line: 42, column: 5, scope: !75)
!81 = !DILocation(line: 44, column: 7, scope: !82)
!82 = distinct !DILexicalBlock(scope: !41, file: !1, line: 44, column: 7)
!83 = !DILocation(line: 44, column: 7, scope: !41)
!84 = !DILocation(line: 45, column: 4, scope: !85)
!85 = distinct !DILexicalBlock(scope: !82, file: !1, line: 44, column: 14)
!86 = !DILocation(line: 46, column: 3, scope: !85)
!87 = !DILocation(line: 47, column: 4, scope: !88)
!88 = distinct !DILexicalBlock(scope: !82, file: !1, line: 46, column: 10)
!89 = !DILocation(line: 49, column: 12, scope: !41)
!90 = !DILocation(line: 49, column: 11, scope: !41)
!91 = !DILocation(line: 49, column: 9, scope: !41)
!92 = !DILocation(line: 29, column: 2, scope: !93)
!93 = !DILexicalBlockFile(scope: !4, file: !1, discriminator: 2)
!94 = !DILocation(line: 52, column: 4, scope: !4)
!95 = !DILocation(line: 51, column: 2, scope: !4)
!96 = !DILocation(line: 53, column: 1, scope: !4)
!97 = !DILocalVariable(name: "i", scope: !7, file: !1, line: 57, type: !10)
!98 = !DILocation(line: 57, column: 6, scope: !7)
!99 = !DILocalVariable(name: "m", scope: !7, file: !1, line: 57, type: !10)
!100 = !DILocation(line: 57, column: 9, scope: !7)
!101 = !DILocalVariable(name: "n", scope: !7, file: !1, line: 57, type: !10)
!102 = !DILocation(line: 57, column: 12, scope: !7)
!103 = !DILocation(line: 58, column: 9, scope: !104)
!104 = distinct !DILexicalBlock(scope: !7, file: !1, line: 58, column: 2)
!105 = !DILocation(line: 58, column: 7, scope: !104)
!106 = !DILocation(line: 58, column: 14, scope: !107)
!107 = !DILexicalBlockFile(scope: !108, file: !1, discriminator: 1)
!108 = distinct !DILexicalBlock(scope: !104, file: !1, line: 58, column: 2)
!109 = !DILocation(line: 58, column: 16, scope: !107)
!110 = !DILocation(line: 58, column: 2, scope: !107)
!111 = !DILocation(line: 59, column: 12, scope: !112)
!112 = distinct !DILexicalBlock(scope: !113, file: !1, line: 59, column: 3)
!113 = distinct !DILexicalBlock(scope: !108, file: !1, line: 58, column: 26)
!114 = !DILocation(line: 59, column: 10, scope: !112)
!115 = !DILocation(line: 59, column: 17, scope: !112)
!116 = !DILocation(line: 59, column: 8, scope: !112)
!117 = !DILocation(line: 59, column: 22, scope: !118)
!118 = !DILexicalBlockFile(scope: !119, file: !1, discriminator: 1)
!119 = distinct !DILexicalBlock(scope: !112, file: !1, line: 59, column: 3)
!120 = !DILocation(line: 59, column: 24, scope: !118)
!121 = !DILocation(line: 59, column: 28, scope: !118)
!122 = !DILocation(line: 59, column: 31, scope: !123)
!123 = !DILexicalBlockFile(scope: !119, file: !1, discriminator: 2)
!124 = !DILocation(line: 59, column: 33, scope: !123)
!125 = !DILocation(line: 59, column: 3, scope: !126)
!126 = !DILexicalBlockFile(scope: !112, file: !1, discriminator: 3)
!127 = !DILocation(line: 61, column: 9, scope: !128)
!128 = distinct !DILexicalBlock(scope: !119, file: !1, line: 59, column: 48)
!129 = !DILocation(line: 61, column: 4, scope: !128)
!130 = !DILocation(line: 61, column: 6, scope: !128)
!131 = !DILocation(line: 61, column: 12, scope: !128)
!132 = !DILocation(line: 62, column: 8, scope: !133)
!133 = distinct !DILexicalBlock(scope: !128, file: !1, line: 62, column: 8)
!134 = !DILocation(line: 62, column: 10, scope: !133)
!135 = !DILocation(line: 62, column: 14, scope: !133)
!136 = !DILocation(line: 62, column: 8, scope: !128)
!137 = !DILocation(line: 63, column: 20, scope: !138)
!138 = distinct !DILexicalBlock(scope: !133, file: !1, line: 62, column: 19)
!139 = !DILocation(line: 63, column: 15, scope: !138)
!140 = !DILocation(line: 63, column: 17, scope: !138)
!141 = !DILocation(line: 63, column: 34, scope: !138)
!142 = !DILocation(line: 63, column: 25, scope: !138)
!143 = !DILocation(line: 63, column: 27, scope: !138)
!144 = !DILocation(line: 63, column: 29, scope: !138)
!145 = !DILocation(line: 63, column: 23, scope: !138)
!146 = !DILocation(line: 63, column: 10, scope: !138)
!147 = !DILocation(line: 63, column: 5, scope: !138)
!148 = !DILocation(line: 63, column: 7, scope: !138)
!149 = !DILocation(line: 63, column: 13, scope: !138)
!150 = !DILocation(line: 64, column: 4, scope: !138)
!151 = !DILocation(line: 65, column: 9, scope: !128)
!152 = !DILocation(line: 65, column: 4, scope: !128)
!153 = !DILocation(line: 65, column: 6, scope: !128)
!154 = !DILocation(line: 65, column: 12, scope: !128)
!155 = !DILocation(line: 66, column: 8, scope: !156)
!156 = distinct !DILexicalBlock(scope: !128, file: !1, line: 66, column: 8)
!157 = !DILocation(line: 66, column: 10, scope: !156)
!158 = !DILocation(line: 66, column: 14, scope: !156)
!159 = !DILocation(line: 66, column: 18, scope: !156)
!160 = !DILocation(line: 66, column: 21, scope: !161)
!161 = !DILexicalBlockFile(scope: !156, file: !1, discriminator: 1)
!162 = !DILocation(line: 66, column: 23, scope: !161)
!163 = !DILocation(line: 66, column: 27, scope: !161)
!164 = !DILocation(line: 66, column: 8, scope: !161)
!165 = !DILocation(line: 67, column: 20, scope: !166)
!166 = distinct !DILexicalBlock(scope: !156, file: !1, line: 66, column: 33)
!167 = !DILocation(line: 67, column: 15, scope: !166)
!168 = !DILocation(line: 67, column: 17, scope: !166)
!169 = !DILocation(line: 67, column: 34, scope: !166)
!170 = !DILocation(line: 67, column: 36, scope: !166)
!171 = !DILocation(line: 67, column: 25, scope: !166)
!172 = !DILocation(line: 67, column: 27, scope: !166)
!173 = !DILocation(line: 67, column: 29, scope: !166)
!174 = !DILocation(line: 67, column: 23, scope: !166)
!175 = !DILocation(line: 67, column: 10, scope: !166)
!176 = !DILocation(line: 67, column: 5, scope: !166)
!177 = !DILocation(line: 67, column: 7, scope: !166)
!178 = !DILocation(line: 67, column: 13, scope: !166)
!179 = !DILocation(line: 68, column: 4, scope: !166)
!180 = !DILocation(line: 69, column: 9, scope: !128)
!181 = !DILocation(line: 69, column: 4, scope: !128)
!182 = !DILocation(line: 69, column: 6, scope: !128)
!183 = !DILocation(line: 69, column: 12, scope: !128)
!184 = !DILocation(line: 70, column: 8, scope: !185)
!185 = distinct !DILexicalBlock(scope: !128, file: !1, line: 70, column: 8)
!186 = !DILocation(line: 70, column: 10, scope: !185)
!187 = !DILocation(line: 70, column: 14, scope: !185)
!188 = !DILocation(line: 70, column: 8, scope: !128)
!189 = !DILocation(line: 71, column: 20, scope: !190)
!190 = distinct !DILexicalBlock(scope: !185, file: !1, line: 70, column: 19)
!191 = !DILocation(line: 71, column: 15, scope: !190)
!192 = !DILocation(line: 71, column: 17, scope: !190)
!193 = !DILocation(line: 71, column: 29, scope: !190)
!194 = !DILocation(line: 71, column: 31, scope: !190)
!195 = !DILocation(line: 71, column: 24, scope: !190)
!196 = !DILocation(line: 71, column: 26, scope: !190)
!197 = !DILocation(line: 71, column: 22, scope: !190)
!198 = !DILocation(line: 71, column: 10, scope: !190)
!199 = !DILocation(line: 71, column: 5, scope: !190)
!200 = !DILocation(line: 71, column: 7, scope: !190)
!201 = !DILocation(line: 71, column: 13, scope: !190)
!202 = !DILocation(line: 72, column: 4, scope: !190)
!203 = !DILocation(line: 73, column: 3, scope: !128)
!204 = !DILocation(line: 59, column: 39, scope: !205)
!205 = !DILexicalBlockFile(scope: !119, file: !1, discriminator: 4)
!206 = !DILocation(line: 59, column: 44, scope: !205)
!207 = !DILocation(line: 59, column: 3, scope: !205)
!208 = !DILocation(line: 74, column: 12, scope: !209)
!209 = distinct !DILexicalBlock(scope: !113, file: !1, line: 74, column: 3)
!210 = !DILocation(line: 74, column: 10, scope: !209)
!211 = !DILocation(line: 74, column: 17, scope: !209)
!212 = !DILocation(line: 74, column: 8, scope: !209)
!213 = !DILocation(line: 74, column: 22, scope: !214)
!214 = !DILexicalBlockFile(scope: !215, file: !1, discriminator: 1)
!215 = distinct !DILexicalBlock(scope: !209, file: !1, line: 74, column: 3)
!216 = !DILocation(line: 74, column: 24, scope: !214)
!217 = !DILocation(line: 74, column: 28, scope: !214)
!218 = !DILocation(line: 74, column: 31, scope: !219)
!219 = !DILexicalBlockFile(scope: !215, file: !1, discriminator: 2)
!220 = !DILocation(line: 74, column: 33, scope: !219)
!221 = !DILocation(line: 74, column: 3, scope: !222)
!222 = !DILexicalBlockFile(scope: !209, file: !1, discriminator: 3)
!223 = !DILocation(line: 76, column: 14, scope: !224)
!224 = distinct !DILexicalBlock(scope: !215, file: !1, line: 74, column: 48)
!225 = !DILocation(line: 76, column: 14, scope: !226)
!226 = !DILexicalBlockFile(scope: !224, file: !1, discriminator: 1)
!227 = !DILocation(line: 76, column: 14, scope: !228)
!228 = !DILexicalBlockFile(scope: !224, file: !1, discriminator: 2)
!229 = !DILocation(line: 76, column: 14, scope: !230)
!230 = !DILexicalBlockFile(scope: !224, file: !1, discriminator: 3)
!231 = !DILocation(line: 76, column: 14, scope: !232)
!232 = !DILexicalBlockFile(scope: !224, file: !1, discriminator: 4)
!233 = !DILocation(line: 76, column: 14, scope: !234)
!234 = !DILexicalBlockFile(scope: !224, file: !1, discriminator: 5)
!235 = !DILocation(line: 76, column: 14, scope: !236)
!236 = !DILexicalBlockFile(scope: !224, file: !1, discriminator: 6)
!237 = !DILocation(line: 76, column: 14, scope: !238)
!238 = !DILexicalBlockFile(scope: !224, file: !1, discriminator: 7)
!239 = !DILocation(line: 76, column: 14, scope: !240)
!240 = !DILexicalBlockFile(scope: !224, file: !1, discriminator: 8)
!241 = !DILocation(line: 76, column: 14, scope: !242)
!242 = !DILexicalBlockFile(scope: !224, file: !1, discriminator: 9)
!243 = !DILocation(line: 76, column: 14, scope: !244)
!244 = !DILexicalBlockFile(scope: !224, file: !1, discriminator: 10)
!245 = !DILocation(line: 76, column: 14, scope: !246)
!246 = !DILexicalBlockFile(scope: !224, file: !1, discriminator: 11)
!247 = !DILocation(line: 76, column: 14, scope: !248)
!248 = !DILexicalBlockFile(scope: !224, file: !1, discriminator: 12)
!249 = !DILocation(line: 76, column: 14, scope: !250)
!250 = !DILexicalBlockFile(scope: !224, file: !1, discriminator: 13)
!251 = !DILocation(line: 76, column: 14, scope: !252)
!252 = !DILexicalBlockFile(scope: !224, file: !1, discriminator: 14)
!253 = !DILocation(line: 76, column: 14, scope: !254)
!254 = !DILexicalBlockFile(scope: !224, file: !1, discriminator: 15)
!255 = !DILocation(line: 76, column: 9, scope: !254)
!256 = !DILocation(line: 76, column: 4, scope: !254)
!257 = !DILocation(line: 76, column: 6, scope: !254)
!258 = !DILocation(line: 76, column: 12, scope: !254)
!259 = !DILocation(line: 82, column: 3, scope: !224)
!260 = !DILocation(line: 74, column: 39, scope: !261)
!261 = !DILexicalBlockFile(scope: !215, file: !1, discriminator: 4)
!262 = !DILocation(line: 74, column: 44, scope: !261)
!263 = !DILocation(line: 74, column: 3, scope: !261)
!264 = !DILocation(line: 84, column: 2, scope: !113)
!265 = !DILocation(line: 58, column: 22, scope: !266)
!266 = !DILexicalBlockFile(scope: !108, file: !1, discriminator: 2)
!267 = !DILocation(line: 58, column: 2, scope: !266)
!268 = !DILocation(line: 87, column: 9, scope: !269)
!269 = distinct !DILexicalBlock(scope: !7, file: !1, line: 87, column: 2)
!270 = !DILocation(line: 87, column: 7, scope: !269)
!271 = !DILocation(line: 87, column: 14, scope: !272)
!272 = !DILexicalBlockFile(scope: !273, file: !1, discriminator: 1)
!273 = distinct !DILexicalBlock(scope: !269, file: !1, line: 87, column: 2)
!274 = !DILocation(line: 87, column: 16, scope: !272)
!275 = !DILocation(line: 87, column: 2, scope: !272)
!276 = !DILocation(line: 88, column: 10, scope: !277)
!277 = distinct !DILexicalBlock(scope: !278, file: !1, line: 88, column: 3)
!278 = distinct !DILexicalBlock(scope: !273, file: !1, line: 87, column: 26)
!279 = !DILocation(line: 88, column: 8, scope: !277)
!280 = !DILocation(line: 88, column: 15, scope: !281)
!281 = !DILexicalBlockFile(scope: !282, file: !1, discriminator: 1)
!282 = distinct !DILexicalBlock(scope: !277, file: !1, line: 88, column: 3)
!283 = !DILocation(line: 88, column: 17, scope: !281)
!284 = !DILocation(line: 88, column: 3, scope: !281)
!285 = !DILocation(line: 89, column: 24, scope: !286)
!286 = distinct !DILexicalBlock(scope: !282, file: !1, line: 88, column: 27)
!287 = !DILocation(line: 89, column: 19, scope: !286)
!288 = !DILocation(line: 89, column: 21, scope: !286)
!289 = !DILocation(line: 89, column: 4, scope: !286)
!290 = !DILocation(line: 90, column: 3, scope: !286)
!291 = !DILocation(line: 88, column: 23, scope: !292)
!292 = !DILexicalBlockFile(scope: !282, file: !1, discriminator: 2)
!293 = !DILocation(line: 88, column: 3, scope: !292)
!294 = !DILocation(line: 91, column: 3, scope: !278)
!295 = !DILocation(line: 92, column: 2, scope: !278)
!296 = !DILocation(line: 87, column: 22, scope: !297)
!297 = !DILexicalBlockFile(scope: !273, file: !1, discriminator: 2)
!298 = !DILocation(line: 87, column: 2, scope: !297)
!299 = !DILocation(line: 94, column: 9, scope: !7)
!300 = !DILocation(line: 94, column: 2, scope: !7)
!301 = !DILocation(line: 97, column: 2, scope: !11)
!302 = !DILocation(line: 98, column: 2, scope: !11)
!303 = !DILocation(line: 99, column: 1, scope: !11)
