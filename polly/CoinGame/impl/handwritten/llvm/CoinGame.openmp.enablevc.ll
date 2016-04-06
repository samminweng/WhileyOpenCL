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
@X = common global [6 x [6 x i32]] zeroinitializer, align 16
@Y = common global [6 x [6 x i32]] zeroinitializer, align 16
@Z = common global [6 x [6 x i32]] zeroinitializer, align 16
@.str.6 = private unnamed_addr constant [24 x i8] c"Alice's sum is Wrong!!!\00", align 1
@.str.7 = private unnamed_addr constant [28 x i8] c"Alice's sum <= Bob's sum!!!\00", align 1
@.str.8 = private unnamed_addr constant [54 x i8] c"\0AThe total amount of money (maximum) Alice get is %d.\00", align 1
@.str.9 = private unnamed_addr constant [52 x i8] c"\0AThe total amount of money (maximum) Bob get is %d.\00", align 1
@str = private unnamed_addr constant [2 x i8] c".\00"

; Function Attrs: nounwind uwtable
define void @init() #0 !dbg !4 {
entry:
  %call = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str, i64 0, i64 0), i32 6), !dbg !52
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !8, metadata !53), !dbg !54
  store <4 x i32> <i32 0, i32 1, i32 2, i32 3>, <4 x i32>* bitcast ([6 x i32]* @V to <4 x i32>*), align 16, !dbg !55, !tbaa !59
  store i32 4, i32* getelementptr inbounds ([6 x i32], [6 x i32]* @V, i64 0, i64 4), align 16, !dbg !55, !tbaa !59
  store i32 5, i32* getelementptr inbounds ([6 x i32], [6 x i32]* @V, i64 0, i64 5), align 4, !dbg !55, !tbaa !59
  ret void, !dbg !63
}

; Function Attrs: nounwind
declare i32 @printf(i8* nocapture readonly, ...) #1

; Function Attrs: nounwind uwtable
define void @sumMoves() #0 !dbg !10 {
entry:
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !12, metadata !53), !dbg !64
  tail call void @llvm.dbg.value(metadata i32 5, i64 0, metadata !13, metadata !53), !dbg !65
  tail call void @llvm.dbg.value(metadata i32 1, i64 0, metadata !14, metadata !53), !dbg !66
  br label %while.body, !dbg !67

while.body:                                       ; preds = %entry, %while.cond.backedge
  %i.033 = phi i32 [ 0, %entry ], [ %i.1, %while.cond.backedge ]
  %j.032 = phi i32 [ 5, %entry ], [ %j.1, %while.cond.backedge ]
  %alice.031 = phi i32 [ 1, %entry ], [ %alice.0.be, %while.cond.backedge ]
  %idxprom = sext i32 %j.032 to i64, !dbg !69
  %add = add nsw i32 %i.033, 1, !dbg !70
  %idxprom1 = sext i32 %add to i64, !dbg !69
  %arrayidx2 = getelementptr inbounds [6 x [6 x i32]], [6 x [6 x i32]]* @M, i64 0, i64 %idxprom1, i64 %idxprom, !dbg !69
  %0 = load i32, i32* %arrayidx2, align 4, !dbg !69, !tbaa !59
  tail call void @llvm.dbg.value(metadata i32 %0, i64 0, metadata !15, metadata !53), !dbg !71
  %sub = add nsw i32 %j.032, -1, !dbg !72
  %idxprom3 = sext i32 %sub to i64, !dbg !73
  %idxprom4 = sext i32 %i.033 to i64, !dbg !73
  %arrayidx6 = getelementptr inbounds [6 x [6 x i32]], [6 x [6 x i32]]* @M, i64 0, i64 %idxprom4, i64 %idxprom3, !dbg !73
  %1 = load i32, i32* %arrayidx6, align 4, !dbg !73, !tbaa !59
  tail call void @llvm.dbg.value(metadata i32 %1, i64 0, metadata !17, metadata !53), !dbg !74
  %cmp7 = icmp sgt i32 %0, %1, !dbg !75
  tail call void @llvm.dbg.value(metadata i32 %sub, i64 0, metadata !13, metadata !53), !dbg !65
  %j.1 = select i1 %cmp7, i32 %sub, i32 %j.032, !dbg !77
  %i.1 = select i1 %cmp7, i32 %i.033, i32 %add, !dbg !77
  %idxprom4.pn = select i1 %cmp7, i64 %idxprom, i64 %idxprom4, !dbg !77
  %coin.0.in = getelementptr inbounds [6 x i32], [6 x i32]* @V, i64 0, i64 %idxprom4.pn, !dbg !78
  %coin.0 = load i32, i32* %coin.0.in, align 4, !dbg !78, !tbaa !59
  %tobool = icmp eq i32 %alice.031, 0, !dbg !80
  br i1 %tobool, label %if.else14, label %if.then12, !dbg !82

if.then12:                                        ; preds = %while.body
  %2 = load i32, i32* @sum_alice, align 4, !dbg !83, !tbaa !59
  %add13 = add nsw i32 %2, %coin.0, !dbg !83
  store i32 %add13, i32* @sum_alice, align 4, !dbg !83, !tbaa !59
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !14, metadata !53), !dbg !66
  br label %while.cond.backedge, !dbg !85

if.else14:                                        ; preds = %while.body
  %3 = load i32, i32* @sum_bob, align 4, !dbg !86, !tbaa !59
  %add15 = add nsw i32 %3, %coin.0, !dbg !86
  store i32 %add15, i32* @sum_bob, align 4, !dbg !86, !tbaa !59
  tail call void @llvm.dbg.value(metadata i32 1, i64 0, metadata !14, metadata !53), !dbg !66
  br label %while.cond.backedge

while.cond.backedge:                              ; preds = %if.else14, %if.then12
  %alice.0.be = phi i32 [ 0, %if.then12 ], [ 1, %if.else14 ]
  %cmp = icmp sgt i32 %i.1, %j.1, !dbg !88
  br i1 %cmp, label %while.end, label %while.body, !dbg !67

while.end:                                        ; preds = %while.cond.backedge
  ret void, !dbg !89
}

; Function Attrs: nounwind uwtable
define void @printMoves() #0 !dbg !19 {
entry:
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !21, metadata !53), !dbg !90
  tail call void @llvm.dbg.value(metadata i32 5, i64 0, metadata !22, metadata !53), !dbg !91
  tail call void @llvm.dbg.value(metadata i8 1, i64 0, metadata !23, metadata !53), !dbg !92
  br label %while.body, !dbg !93

while.body:                                       ; preds = %entry, %if.end25
  %i.045 = phi i32 [ 0, %entry ], [ %i.1, %if.end25 ]
  %j.044 = phi i32 [ 5, %entry ], [ %j.1, %if.end25 ]
  %alice.043 = phi i8 [ 1, %entry ], [ %frombool, %if.end25 ]
  %idxprom = sext i32 %j.044 to i64, !dbg !95
  %add = add nsw i32 %i.045, 1, !dbg !96
  %idxprom1 = sext i32 %add to i64, !dbg !95
  %arrayidx2 = getelementptr inbounds [6 x [6 x i32]], [6 x [6 x i32]]* @M, i64 0, i64 %idxprom1, i64 %idxprom, !dbg !95
  %0 = load i32, i32* %arrayidx2, align 4, !dbg !95, !tbaa !59
  tail call void @llvm.dbg.value(metadata i32 %0, i64 0, metadata !25, metadata !53), !dbg !97
  %sub = add nsw i32 %j.044, -1, !dbg !98
  %idxprom3 = sext i32 %sub to i64, !dbg !99
  %idxprom4 = sext i32 %i.045 to i64, !dbg !99
  %arrayidx6 = getelementptr inbounds [6 x [6 x i32]], [6 x [6 x i32]]* @M, i64 0, i64 %idxprom4, i64 %idxprom3, !dbg !99
  %1 = load i32, i32* %arrayidx6, align 4, !dbg !99, !tbaa !59
  tail call void @llvm.dbg.value(metadata i32 %1, i64 0, metadata !27, metadata !53), !dbg !100
  %tobool = icmp ne i8 %alice.043, 0, !dbg !101
  br i1 %tobool, label %if.then, label %if.else, !dbg !103

if.then:                                          ; preds = %while.body
  %call = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.1, i64 0, i64 0)), !dbg !104
  br label %if.end, !dbg !106

if.else:                                          ; preds = %while.body
  %call7 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0)), !dbg !107
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %cmp8 = icmp sgt i32 %0, %1, !dbg !109
  br i1 %cmp8, label %if.else14, label %if.then9, !dbg !111

if.then9:                                         ; preds = %if.end
  %arrayidx12 = getelementptr inbounds [6 x i32], [6 x i32]* @V, i64 0, i64 %idxprom4, !dbg !112
  %2 = load i32, i32* %arrayidx12, align 4, !dbg !112, !tbaa !59
  %call13 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.3, i64 0, i64 0), i32 %add, i32 %2), !dbg !114
  tail call void @llvm.dbg.value(metadata i32 %add, i64 0, metadata !21, metadata !53), !dbg !90
  br label %if.end19, !dbg !115

if.else14:                                        ; preds = %if.end
  %add15 = add nsw i32 %j.044, 1, !dbg !116
  %arrayidx17 = getelementptr inbounds [6 x i32], [6 x i32]* @V, i64 0, i64 %idxprom, !dbg !118
  %3 = load i32, i32* %arrayidx17, align 4, !dbg !118, !tbaa !59
  %call18 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.3, i64 0, i64 0), i32 %add15, i32 %3), !dbg !119
  tail call void @llvm.dbg.value(metadata i32 %sub, i64 0, metadata !22, metadata !53), !dbg !91
  br label %if.end19

if.end19:                                         ; preds = %if.else14, %if.then9
  %j.1 = phi i32 [ %j.044, %if.then9 ], [ %sub, %if.else14 ]
  %i.1 = phi i32 [ %add, %if.then9 ], [ %i.045, %if.else14 ]
  br i1 %tobool, label %if.then21, label %if.else23, !dbg !120

if.then21:                                        ; preds = %if.end19
  %call22 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.4, i64 0, i64 0)), !dbg !121
  br label %if.end25, !dbg !124

if.else23:                                        ; preds = %if.end19
  %puts = tail call i32 @puts(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @str, i64 0, i64 0)), !dbg !125
  br label %if.end25

if.end25:                                         ; preds = %if.else23, %if.then21
  %4 = zext i1 %tobool to i8, !dbg !127
  %frombool = xor i8 %4, 1, !dbg !127
  tail call void @llvm.dbg.value(metadata i8 %frombool, i64 0, metadata !23, metadata !53), !dbg !92
  %cmp = icmp sgt i32 %i.1, %j.1, !dbg !128
  br i1 %cmp, label %while.end, label %while.body, !dbg !93

while.end:                                        ; preds = %if.end25
  ret void, !dbg !129
}

; Function Attrs: nounwind uwtable
define i32 @maxMoney() #0 !dbg !28 {
entry:
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !32, metadata !53), !dbg !130
  br label %for.cond1.preheader, !dbg !131

for.cond1.preheader:                              ; preds = %for.inc183, %entry
  %indvars.iv272 = phi i64 [ 0, %entry ], [ %indvars.iv.next273, %for.inc183 ]
  br label %for.body3, !dbg !135

for.body3:                                        ; preds = %for.inc, %for.cond1.preheader
  %indvars.iv268 = phi i64 [ %indvars.iv272, %for.cond1.preheader ], [ %indvars.iv.next269, %for.inc ]
  %i.0260 = phi i32 [ 0, %for.cond1.preheader ], [ %i.1, %for.inc ]
  %cmp4 = icmp slt i32 %i.0260, 6, !dbg !140
  br i1 %cmp4, label %if.then, label %for.inc, !dbg !143

if.then:                                          ; preds = %for.body3
  %idxprom5 = sext i32 %i.0260 to i64, !dbg !144
  %arrayidx6 = getelementptr inbounds [6 x [6 x i32]], [6 x [6 x i32]]* @X, i64 0, i64 %idxprom5, i64 %indvars.iv268, !dbg !144
  store i32 0, i32* %arrayidx6, align 4, !dbg !146, !tbaa !59
  %add = add nsw i32 %i.0260, 2, !dbg !147
  %cmp7 = icmp slt i32 %add, 6, !dbg !149
  br i1 %cmp7, label %if.then8, label %if.end, !dbg !150

if.then8:                                         ; preds = %if.then
  %idxprom15 = sext i32 %add to i64, !dbg !151
  %arrayidx17 = getelementptr inbounds [6 x [6 x i32]], [6 x [6 x i32]]* @M, i64 0, i64 %idxprom15, i64 %indvars.iv268, !dbg !151
  %0 = load i32, i32* %arrayidx17, align 4, !dbg !151, !tbaa !59
  store i32 %0, i32* %arrayidx6, align 4, !dbg !153, !tbaa !59
  br label %if.end, !dbg !154

if.end:                                           ; preds = %if.then8, %if.then
  %arrayidx26 = getelementptr inbounds [6 x [6 x i32]], [6 x [6 x i32]]* @Y, i64 0, i64 %idxprom5, i64 %indvars.iv268, !dbg !155
  store i32 0, i32* %arrayidx26, align 4, !dbg !156, !tbaa !59
  %add27 = add nsw i32 %i.0260, 1, !dbg !157
  %cmp28 = icmp slt i32 %add27, 6, !dbg !159
  %cmp29 = icmp sgt i64 %indvars.iv268, 0, !dbg !160
  %or.cond = and i1 %cmp29, %cmp28, !dbg !162
  br i1 %or.cond, label %if.then30, label %if.end46, !dbg !162

if.then30:                                        ; preds = %if.end
  %1 = add nsw i64 %indvars.iv268, -1, !dbg !163
  %idxprom38 = sext i32 %add27 to i64, !dbg !164
  %arrayidx40 = getelementptr inbounds [6 x [6 x i32]], [6 x [6 x i32]]* @M, i64 0, i64 %idxprom38, i64 %1, !dbg !164
  %2 = load i32, i32* %arrayidx40, align 4, !dbg !164, !tbaa !59
  store i32 %2, i32* %arrayidx26, align 4, !dbg !166, !tbaa !59
  br label %if.end46, !dbg !167

if.end46:                                         ; preds = %if.then30, %if.end
  %arrayidx50 = getelementptr inbounds [6 x [6 x i32]], [6 x [6 x i32]]* @Z, i64 0, i64 %idxprom5, i64 %indvars.iv268, !dbg !168
  store i32 0, i32* %arrayidx50, align 4, !dbg !169, !tbaa !59
  %cmp52 = icmp sgt i64 %indvars.iv268, 1, !dbg !170
  br i1 %cmp52, label %if.then53, label %for.inc, !dbg !172

if.then53:                                        ; preds = %if.end46
  %3 = add nsw i64 %indvars.iv268, -2, !dbg !173
  %arrayidx62 = getelementptr inbounds [6 x [6 x i32]], [6 x [6 x i32]]* @M, i64 0, i64 %idxprom5, i64 %3, !dbg !175
  %4 = load i32, i32* %arrayidx62, align 4, !dbg !175, !tbaa !59
  store i32 %4, i32* %arrayidx50, align 4, !dbg !176, !tbaa !59
  br label %for.inc, !dbg !177

for.inc:                                          ; preds = %if.end46, %if.then53, %for.body3
  %i.1 = phi i32 [ %i.0260, %for.body3 ], [ %add27, %if.then53 ], [ %add27, %if.end46 ]
  %indvars.iv.next269 = add nuw nsw i64 %indvars.iv268, 1, !dbg !135
  %lftr.wideiv277 = trunc i64 %indvars.iv.next269 to i32, !dbg !135
  %exitcond278 = icmp eq i32 %lftr.wideiv277, 6, !dbg !135
  br i1 %exitcond278, label %for.inc180.preheader, label %for.body3, !dbg !135

for.inc180.preheader:                             ; preds = %for.inc
  br label %for.inc180, !dbg !178

for.inc180:                                       ; preds = %for.inc180.preheader, %for.inc180
  %indvars.iv274 = phi i64 [ %indvars.iv.next275, %for.inc180 ], [ %indvars.iv272, %for.inc180.preheader ]
  %i.2264 = phi i32 [ %inc178, %for.inc180 ], [ 0, %for.inc180.preheader ]
  %idxprom77 = sext i32 %i.2264 to i64, !dbg !178
  %arrayidx78 = getelementptr inbounds [6 x i32], [6 x i32]* @V, i64 0, i64 %idxprom77, !dbg !178
  %5 = load i32, i32* %arrayidx78, align 4, !dbg !178, !tbaa !59
  %arrayidx82 = getelementptr inbounds [6 x [6 x i32]], [6 x [6 x i32]]* @X, i64 0, i64 %idxprom77, i64 %indvars.iv274, !dbg !178
  %6 = load i32, i32* %arrayidx82, align 4, !dbg !178, !tbaa !59
  %arrayidx86 = getelementptr inbounds [6 x [6 x i32]], [6 x [6 x i32]]* @Y, i64 0, i64 %idxprom77, i64 %indvars.iv274, !dbg !178
  %7 = load i32, i32* %arrayidx86, align 4, !dbg !178, !tbaa !59
  %cmp87 = icmp slt i32 %6, %7, !dbg !178
  %. = select i1 %cmp87, i32 %6, i32 %7, !dbg !184
  %add96 = add nsw i32 %., %5, !dbg !186
  %arrayidx98 = getelementptr inbounds [6 x i32], [6 x i32]* @V, i64 0, i64 %indvars.iv274, !dbg !186
  %8 = load i32, i32* %arrayidx98, align 4, !dbg !186, !tbaa !59
  %arrayidx106 = getelementptr inbounds [6 x [6 x i32]], [6 x [6 x i32]]* @Z, i64 0, i64 %idxprom77, i64 %indvars.iv274, !dbg !186
  %9 = load i32, i32* %arrayidx106, align 4, !dbg !186, !tbaa !59
  %cmp107 = icmp slt i32 %7, %9, !dbg !186
  %cond119 = select i1 %cmp107, i32 %7, i32 %9, !dbg !186
  %add120 = add nsw i32 %cond119, %8, !dbg !188
  %cmp121 = icmp sgt i32 %add96, %add120, !dbg !188
  %add96.add120 = select i1 %cmp121, i32 %add96, i32 %add120, !dbg !188
  %arrayidx177 = getelementptr inbounds [6 x [6 x i32]], [6 x [6 x i32]]* @M, i64 0, i64 %idxprom77, i64 %indvars.iv274, !dbg !190
  store i32 %add96.add120, i32* %arrayidx177, align 4, !dbg !192, !tbaa !59
  %inc178 = add nsw i32 %i.2264, 1, !dbg !193
  tail call void @llvm.dbg.value(metadata i32 %inc178, i64 0, metadata !33, metadata !53), !dbg !194
  %indvars.iv.next275 = add nuw nsw i64 %indvars.iv274, 1, !dbg !195
  %cmp72 = icmp slt i32 %inc178, 6, !dbg !197
  %cmp73 = icmp slt i64 %indvars.iv.next275, 6, !dbg !199
  %10 = and i1 %cmp73, %cmp72, !dbg !201
  br i1 %10, label %for.inc180, label %for.inc183, !dbg !195

for.inc183:                                       ; preds = %for.inc180
  %indvars.iv.next273 = add nuw nsw i64 %indvars.iv272, 1, !dbg !131
  %exitcond276 = icmp eq i64 %indvars.iv.next273, 6, !dbg !131
  br i1 %exitcond276, label %for.end185, label %for.cond1.preheader, !dbg !131

for.end185:                                       ; preds = %for.inc183
  %11 = load i32, i32* getelementptr inbounds ([6 x [6 x i32]], [6 x [6 x i32]]* @M, i64 0, i64 0, i64 5), align 4, !dbg !202, !tbaa !59
  ret i32 %11, !dbg !203
}

; Function Attrs: nounwind uwtable
define i32 @main() #0 !dbg !35 {
entry:
  %call = tail call i32 @maxMoney(), !dbg !204
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !12, metadata !53), !dbg !205
  tail call void @llvm.dbg.value(metadata i32 5, i64 0, metadata !13, metadata !53), !dbg !207
  tail call void @llvm.dbg.value(metadata i32 1, i64 0, metadata !14, metadata !53), !dbg !208
  br label %while.body.i, !dbg !209

while.body.i:                                     ; preds = %while.cond.backedge.i, %entry
  %i.033.i = phi i32 [ 0, %entry ], [ %i.1.i, %while.cond.backedge.i ], !dbg !210
  %j.032.i = phi i32 [ 5, %entry ], [ %j.1.i, %while.cond.backedge.i ], !dbg !210
  %alice.031.i = phi i32 [ 1, %entry ], [ %alice.0.be.i, %while.cond.backedge.i ], !dbg !210
  %idxprom.i = sext i32 %j.032.i to i64, !dbg !211
  %add.i = add nsw i32 %i.033.i, 1, !dbg !212
  %idxprom1.i = sext i32 %add.i to i64, !dbg !211
  %arrayidx2.i = getelementptr inbounds [6 x [6 x i32]], [6 x [6 x i32]]* @M, i64 0, i64 %idxprom1.i, i64 %idxprom.i, !dbg !211
  %0 = load i32, i32* %arrayidx2.i, align 4, !dbg !211, !tbaa !59
  tail call void @llvm.dbg.value(metadata i32 %0, i64 0, metadata !15, metadata !53), !dbg !213
  %sub.i = add nsw i32 %j.032.i, -1, !dbg !214
  %idxprom3.i = sext i32 %sub.i to i64, !dbg !215
  %idxprom4.i = sext i32 %i.033.i to i64, !dbg !215
  %arrayidx6.i = getelementptr inbounds [6 x [6 x i32]], [6 x [6 x i32]]* @M, i64 0, i64 %idxprom4.i, i64 %idxprom3.i, !dbg !215
  %1 = load i32, i32* %arrayidx6.i, align 4, !dbg !215, !tbaa !59
  tail call void @llvm.dbg.value(metadata i32 %1, i64 0, metadata !17, metadata !53), !dbg !216
  %cmp7.i = icmp sgt i32 %0, %1, !dbg !217
  tail call void @llvm.dbg.value(metadata i32 %sub.i, i64 0, metadata !13, metadata !53), !dbg !207
  %j.1.i = select i1 %cmp7.i, i32 %sub.i, i32 %j.032.i, !dbg !218
  %i.1.i = select i1 %cmp7.i, i32 %i.033.i, i32 %add.i, !dbg !218
  %idxprom4.pn.i = select i1 %cmp7.i, i64 %idxprom.i, i64 %idxprom4.i, !dbg !218
  %coin.0.in.i = getelementptr inbounds [6 x i32], [6 x i32]* @V, i64 0, i64 %idxprom4.pn.i, !dbg !219
  %coin.0.i = load i32, i32* %coin.0.in.i, align 4, !dbg !219, !tbaa !59
  %tobool.i = icmp eq i32 %alice.031.i, 0, !dbg !220
  br i1 %tobool.i, label %if.else14.i, label %if.then12.i, !dbg !221

if.then12.i:                                      ; preds = %while.body.i
  %2 = load i32, i32* @sum_alice, align 4, !dbg !222, !tbaa !59
  %add13.i = add nsw i32 %2, %coin.0.i, !dbg !222
  store i32 %add13.i, i32* @sum_alice, align 4, !dbg !222, !tbaa !59
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !14, metadata !53), !dbg !208
  br label %while.cond.backedge.i, !dbg !223

if.else14.i:                                      ; preds = %while.body.i
  %3 = load i32, i32* @sum_bob, align 4, !dbg !224, !tbaa !59
  %add15.i = add nsw i32 %3, %coin.0.i, !dbg !224
  store i32 %add15.i, i32* @sum_bob, align 4, !dbg !224, !tbaa !59
  tail call void @llvm.dbg.value(metadata i32 1, i64 0, metadata !14, metadata !53), !dbg !208
  br label %while.cond.backedge.i, !dbg !210

while.cond.backedge.i:                            ; preds = %if.else14.i, %if.then12.i
  %alice.0.be.i = phi i32 [ 0, %if.then12.i ], [ 1, %if.else14.i ], !dbg !210
  %cmp.i = icmp sgt i32 %i.1.i, %j.1.i, !dbg !225
  br i1 %cmp.i, label %sumMoves.exit, label %while.body.i, !dbg !209

sumMoves.exit:                                    ; preds = %while.cond.backedge.i
  tail call void @printMoves(), !dbg !226
  %4 = load i32, i32* @sum_alice, align 4, !dbg !227, !tbaa !59
  %5 = load i32, i32* getelementptr inbounds ([6 x [6 x i32]], [6 x [6 x i32]]* @M, i64 0, i64 0, i64 5), align 4, !dbg !229, !tbaa !59
  %cmp = icmp eq i32 %4, %5, !dbg !230
  br i1 %cmp, label %if.end, label %if.then, !dbg !231

if.then:                                          ; preds = %sumMoves.exit
  %call1 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([24 x i8], [24 x i8]* @.str.6, i64 0, i64 0)), !dbg !232
  tail call void @exit(i32 -1) #5, !dbg !234
  unreachable, !dbg !234

if.end:                                           ; preds = %sumMoves.exit
  %6 = load i32, i32* @sum_bob, align 4, !dbg !235, !tbaa !59
  %cmp2 = icmp slt i32 %4, %6, !dbg !237
  br i1 %cmp2, label %if.then3, label %if.end5, !dbg !238

if.then3:                                         ; preds = %if.end
  %call4 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([28 x i8], [28 x i8]* @.str.7, i64 0, i64 0)), !dbg !239
  tail call void @exit(i32 -1) #5, !dbg !241
  unreachable, !dbg !241

if.end5:                                          ; preds = %if.end
  %call6 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([54 x i8], [54 x i8]* @.str.8, i64 0, i64 0), i32 %4), !dbg !242
  %7 = load i32, i32* @sum_bob, align 4, !dbg !243, !tbaa !59
  %call7 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([52 x i8], [52 x i8]* @.str.9, i64 0, i64 0), i32 %7), !dbg !244
  ret i32 0, !dbg !245
}

; Function Attrs: noreturn nounwind
declare void @exit(i32) #2

; Function Attrs: nounwind readnone
declare void @llvm.dbg.value(metadata, i64, metadata, metadata) #3

; Function Attrs: nounwind
declare i32 @puts(i8* nocapture) #4

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noreturn nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind readnone }
attributes #4 = { nounwind }
attributes #5 = { noreturn nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!49, !50}
!llvm.ident = !{!51}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 3.9.0 (http://llvm.org/git/clang.git cf7bc8edf8cccb1b5de656c403cb55ad44132e98) (http://llvm.org/git/llvm.git 22706dc4c03305692f494d0e42a6de1050d0ec62)", isOptimized: true, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, subprograms: !3, globals: !36)
!1 = !DIFile(filename: "CoinGame.c", directory: "/home/sam/workspace/WhileyOpenCL/polly/CoinGame/impl/handwritten")
!2 = !{}
!3 = !{!4, !10, !19, !28, !35}
!4 = distinct !DISubprogram(name: "init", scope: !1, file: !1, line: 31, type: !5, isLocal: false, isDefinition: true, scopeLine: 31, isOptimized: true, variables: !7)
!5 = !DISubroutineType(types: !6)
!6 = !{null}
!7 = !{!8}
!8 = !DILocalVariable(name: "i", scope: !4, file: !1, line: 32, type: !9)
!9 = !DIBasicType(name: "int", size: 32, align: 32, encoding: DW_ATE_signed)
!10 = distinct !DISubprogram(name: "sumMoves", scope: !1, file: !1, line: 40, type: !5, isLocal: false, isDefinition: true, scopeLine: 40, isOptimized: true, variables: !11)
!11 = !{!12, !13, !14, !15, !17, !18}
!12 = !DILocalVariable(name: "i", scope: !10, file: !1, line: 41, type: !9)
!13 = !DILocalVariable(name: "j", scope: !10, file: !1, line: 41, type: !9)
!14 = !DILocalVariable(name: "alice", scope: !10, file: !1, line: 42, type: !9)
!15 = !DILocalVariable(name: "P1", scope: !16, file: !1, line: 44, type: !9)
!16 = distinct !DILexicalBlock(scope: !10, file: !1, line: 43, column: 17)
!17 = !DILocalVariable(name: "P2", scope: !16, file: !1, line: 45, type: !9)
!18 = !DILocalVariable(name: "coin", scope: !16, file: !1, line: 46, type: !9)
!19 = distinct !DISubprogram(name: "printMoves", scope: !1, file: !1, line: 69, type: !5, isLocal: false, isDefinition: true, scopeLine: 69, isOptimized: true, variables: !20)
!20 = !{!21, !22, !23, !25, !27}
!21 = !DILocalVariable(name: "i", scope: !19, file: !1, line: 70, type: !9)
!22 = !DILocalVariable(name: "j", scope: !19, file: !1, line: 70, type: !9)
!23 = !DILocalVariable(name: "alice", scope: !19, file: !1, line: 71, type: !24)
!24 = !DIBasicType(name: "_Bool", size: 8, align: 8, encoding: DW_ATE_boolean)
!25 = !DILocalVariable(name: "P1", scope: !26, file: !1, line: 73, type: !9)
!26 = distinct !DILexicalBlock(scope: !19, file: !1, line: 72, column: 17)
!27 = !DILocalVariable(name: "P2", scope: !26, file: !1, line: 74, type: !9)
!28 = distinct !DISubprogram(name: "maxMoney", scope: !1, file: !1, line: 98, type: !29, isLocal: false, isDefinition: true, scopeLine: 98, isOptimized: true, variables: !31)
!29 = !DISubroutineType(types: !30)
!30 = !{!9}
!31 = !{!32, !33, !34}
!32 = !DILocalVariable(name: "s", scope: !28, file: !1, line: 99, type: !9)
!33 = !DILocalVariable(name: "i", scope: !28, file: !1, line: 99, type: !9)
!34 = !DILocalVariable(name: "j", scope: !28, file: !1, line: 99, type: !9)
!35 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 138, type: !29, isLocal: false, isDefinition: true, scopeLine: 138, isOptimized: true, variables: !2)
!36 = !{!37, !41, !42, !43, !46, !47, !48}
!37 = !DIGlobalVariable(name: "V", scope: !0, file: !1, line: 20, type: !38, isLocal: false, isDefinition: true, variable: [6 x i32]* @V)
!38 = !DICompositeType(tag: DW_TAG_array_type, baseType: !9, size: 192, align: 32, elements: !39)
!39 = !{!40}
!40 = !DISubrange(count: 6)
!41 = !DIGlobalVariable(name: "sum_alice", scope: !0, file: !1, line: 29, type: !9, isLocal: false, isDefinition: true, variable: i32* @sum_alice)
!42 = !DIGlobalVariable(name: "sum_bob", scope: !0, file: !1, line: 29, type: !9, isLocal: false, isDefinition: true, variable: i32* @sum_bob)
!43 = !DIGlobalVariable(name: "M", scope: !0, file: !1, line: 23, type: !44, isLocal: false, isDefinition: true, variable: [6 x [6 x i32]]* @M)
!44 = !DICompositeType(tag: DW_TAG_array_type, baseType: !9, size: 1152, align: 32, elements: !45)
!45 = !{!40, !40}
!46 = !DIGlobalVariable(name: "X", scope: !0, file: !1, line: 26, type: !44, isLocal: false, isDefinition: true, variable: [6 x [6 x i32]]* @X)
!47 = !DIGlobalVariable(name: "Y", scope: !0, file: !1, line: 27, type: !44, isLocal: false, isDefinition: true, variable: [6 x [6 x i32]]* @Y)
!48 = !DIGlobalVariable(name: "Z", scope: !0, file: !1, line: 28, type: !44, isLocal: false, isDefinition: true, variable: [6 x [6 x i32]]* @Z)
!49 = !{i32 2, !"Dwarf Version", i32 4}
!50 = !{i32 2, !"Debug Info Version", i32 3}
!51 = !{!"clang version 3.9.0 (http://llvm.org/git/clang.git cf7bc8edf8cccb1b5de656c403cb55ad44132e98) (http://llvm.org/git/llvm.git 22706dc4c03305692f494d0e42a6de1050d0ec62)"}
!52 = !DILocation(line: 34, column: 2, scope: !4)
!53 = !DIExpression()
!54 = !DILocation(line: 32, column: 6, scope: !4)
!55 = !DILocation(line: 36, column: 8, scope: !56)
!56 = distinct !DILexicalBlock(scope: !57, file: !1, line: 35, column: 18)
!57 = distinct !DILexicalBlock(scope: !58, file: !1, line: 35, column: 2)
!58 = distinct !DILexicalBlock(scope: !4, file: !1, line: 35, column: 2)
!59 = !{!60, !60, i64 0}
!60 = !{!"int", !61, i64 0}
!61 = !{!"omnipotent char", !62, i64 0}
!62 = !{!"Simple C/C++ TBAA"}
!63 = !DILocation(line: 38, column: 1, scope: !4)
!64 = !DILocation(line: 41, column: 6, scope: !10)
!65 = !DILocation(line: 41, column: 13, scope: !10)
!66 = !DILocation(line: 42, column: 6, scope: !10)
!67 = !DILocation(line: 43, column: 2, scope: !68)
!68 = !DILexicalBlockFile(scope: !10, file: !1, discriminator: 1)
!69 = !DILocation(line: 44, column: 12, scope: !16)
!70 = !DILocation(line: 44, column: 16, scope: !16)
!71 = !DILocation(line: 44, column: 7, scope: !16)
!72 = !DILocation(line: 45, column: 19, scope: !16)
!73 = !DILocation(line: 45, column: 12, scope: !16)
!74 = !DILocation(line: 45, column: 7, scope: !16)
!75 = !DILocation(line: 47, column: 10, scope: !76)
!76 = distinct !DILexicalBlock(scope: !16, file: !1, line: 47, column: 7)
!77 = !DILocation(line: 47, column: 7, scope: !16)
!78 = !DILocation(line: 49, column: 11, scope: !79)
!79 = distinct !DILexicalBlock(scope: !76, file: !1, line: 47, column: 17)
!80 = !DILocation(line: 56, column: 7, scope: !81)
!81 = distinct !DILexicalBlock(scope: !16, file: !1, line: 56, column: 7)
!82 = !DILocation(line: 56, column: 7, scope: !16)
!83 = !DILocation(line: 57, column: 14, scope: !84)
!84 = distinct !DILexicalBlock(scope: !81, file: !1, line: 56, column: 14)
!85 = !DILocation(line: 59, column: 3, scope: !84)
!86 = !DILocation(line: 60, column: 12, scope: !87)
!87 = distinct !DILexicalBlock(scope: !81, file: !1, line: 59, column: 10)
!88 = !DILocation(line: 43, column: 11, scope: !68)
!89 = !DILocation(line: 65, column: 1, scope: !10)
!90 = !DILocation(line: 70, column: 6, scope: !19)
!91 = !DILocation(line: 70, column: 13, scope: !19)
!92 = !DILocation(line: 71, column: 7, scope: !19)
!93 = !DILocation(line: 72, column: 2, scope: !94)
!94 = !DILexicalBlockFile(scope: !19, file: !1, discriminator: 1)
!95 = !DILocation(line: 73, column: 12, scope: !26)
!96 = !DILocation(line: 73, column: 16, scope: !26)
!97 = !DILocation(line: 73, column: 7, scope: !26)
!98 = !DILocation(line: 74, column: 19, scope: !26)
!99 = !DILocation(line: 74, column: 12, scope: !26)
!100 = !DILocation(line: 74, column: 7, scope: !26)
!101 = !DILocation(line: 75, column: 7, scope: !102)
!102 = distinct !DILexicalBlock(scope: !26, file: !1, line: 75, column: 7)
!103 = !DILocation(line: 75, column: 7, scope: !26)
!104 = !DILocation(line: 76, column: 4, scope: !105)
!105 = distinct !DILexicalBlock(scope: !102, file: !1, line: 75, column: 14)
!106 = !DILocation(line: 77, column: 3, scope: !105)
!107 = !DILocation(line: 78, column: 4, scope: !108)
!108 = distinct !DILexicalBlock(scope: !102, file: !1, line: 77, column: 10)
!109 = !DILocation(line: 81, column: 10, scope: !110)
!110 = distinct !DILexicalBlock(scope: !26, file: !1, line: 81, column: 7)
!111 = !DILocation(line: 81, column: 7, scope: !26)
!112 = !DILocation(line: 82, column: 31, scope: !113)
!113 = distinct !DILexicalBlock(scope: !110, file: !1, line: 81, column: 17)
!114 = !DILocation(line: 82, column: 4, scope: !113)
!115 = !DILocation(line: 84, column: 3, scope: !113)
!116 = !DILocation(line: 85, column: 26, scope: !117)
!117 = distinct !DILexicalBlock(scope: !110, file: !1, line: 84, column: 10)
!118 = !DILocation(line: 85, column: 31, scope: !117)
!119 = !DILocation(line: 85, column: 4, scope: !117)
!120 = !DILocation(line: 88, column: 7, scope: !26)
!121 = !DILocation(line: 89, column: 4, scope: !122)
!122 = distinct !DILexicalBlock(scope: !123, file: !1, line: 88, column: 14)
!123 = distinct !DILexicalBlock(scope: !26, file: !1, line: 88, column: 7)
!124 = !DILocation(line: 90, column: 3, scope: !122)
!125 = !DILocation(line: 91, column: 4, scope: !126)
!126 = distinct !DILexicalBlock(scope: !123, file: !1, line: 90, column: 10)
!127 = !DILocation(line: 93, column: 9, scope: !26)
!128 = !DILocation(line: 72, column: 11, scope: !94)
!129 = !DILocation(line: 96, column: 1, scope: !19)
!130 = !DILocation(line: 99, column: 6, scope: !28)
!131 = !DILocation(line: 100, column: 2, scope: !132)
!132 = !DILexicalBlockFile(scope: !133, file: !1, discriminator: 1)
!133 = distinct !DILexicalBlock(scope: !134, file: !1, line: 100, column: 2)
!134 = distinct !DILexicalBlock(scope: !28, file: !1, line: 100, column: 2)
!135 = !DILocation(line: 103, column: 3, scope: !136)
!136 = !DILexicalBlockFile(scope: !137, file: !1, discriminator: 1)
!137 = distinct !DILexicalBlock(scope: !138, file: !1, line: 103, column: 3)
!138 = distinct !DILexicalBlock(scope: !139, file: !1, line: 103, column: 3)
!139 = distinct !DILexicalBlock(scope: !133, file: !1, line: 100, column: 26)
!140 = !DILocation(line: 104, column: 8, scope: !141)
!141 = distinct !DILexicalBlock(scope: !142, file: !1, line: 104, column: 7)
!142 = distinct !DILexicalBlock(scope: !137, file: !1, line: 103, column: 26)
!143 = !DILocation(line: 104, column: 7, scope: !142)
!144 = !DILocation(line: 105, column: 5, scope: !145)
!145 = distinct !DILexicalBlock(scope: !141, file: !1, line: 104, column: 11)
!146 = !DILocation(line: 105, column: 13, scope: !145)
!147 = !DILocation(line: 106, column: 11, scope: !148)
!148 = distinct !DILexicalBlock(scope: !145, file: !1, line: 106, column: 9)
!149 = !DILocation(line: 106, column: 15, scope: !148)
!150 = !DILocation(line: 106, column: 9, scope: !145)
!151 = !DILocation(line: 107, column: 26, scope: !152)
!152 = distinct !DILexicalBlock(scope: !148, file: !1, line: 106, column: 20)
!153 = !DILocation(line: 107, column: 14, scope: !152)
!154 = !DILocation(line: 108, column: 5, scope: !152)
!155 = !DILocation(line: 109, column: 5, scope: !145)
!156 = !DILocation(line: 109, column: 13, scope: !145)
!157 = !DILocation(line: 110, column: 11, scope: !158)
!158 = distinct !DILexicalBlock(scope: !145, file: !1, line: 110, column: 9)
!159 = !DILocation(line: 110, column: 15, scope: !158)
!160 = !DILocation(line: 110, column: 28, scope: !161)
!161 = !DILexicalBlockFile(scope: !158, file: !1, discriminator: 1)
!162 = !DILocation(line: 110, column: 19, scope: !158)
!163 = !DILocation(line: 110, column: 24, scope: !161)
!164 = !DILocation(line: 111, column: 26, scope: !165)
!165 = distinct !DILexicalBlock(scope: !158, file: !1, line: 110, column: 34)
!166 = !DILocation(line: 111, column: 14, scope: !165)
!167 = !DILocation(line: 112, column: 5, scope: !165)
!168 = !DILocation(line: 113, column: 5, scope: !145)
!169 = !DILocation(line: 113, column: 13, scope: !145)
!170 = !DILocation(line: 114, column: 15, scope: !171)
!171 = distinct !DILexicalBlock(scope: !145, file: !1, line: 114, column: 9)
!172 = !DILocation(line: 114, column: 9, scope: !145)
!173 = !DILocation(line: 115, column: 32, scope: !174)
!174 = distinct !DILexicalBlock(scope: !171, file: !1, line: 114, column: 20)
!175 = !DILocation(line: 115, column: 25, scope: !174)
!176 = !DILocation(line: 115, column: 14, scope: !174)
!177 = !DILocation(line: 116, column: 5, scope: !174)
!178 = !DILocation(line: 125, column: 15, scope: !179)
!179 = distinct !DILexicalBlock(scope: !180, file: !1, line: 123, column: 11)
!180 = distinct !DILexicalBlock(scope: !181, file: !1, line: 123, column: 7)
!181 = distinct !DILexicalBlock(scope: !182, file: !1, line: 122, column: 35)
!182 = distinct !DILexicalBlock(scope: !183, file: !1, line: 122, column: 3)
!183 = distinct !DILexicalBlock(scope: !139, file: !1, line: 122, column: 3)
!184 = !DILocation(line: 125, column: 15, scope: !185)
!185 = !DILexicalBlockFile(scope: !179, file: !1, discriminator: 1)
!186 = !DILocation(line: 125, column: 15, scope: !187)
!187 = !DILexicalBlockFile(scope: !179, file: !1, discriminator: 3)
!188 = !DILocation(line: 125, column: 15, scope: !189)
!189 = !DILexicalBlockFile(scope: !179, file: !1, discriminator: 6)
!190 = !DILocation(line: 125, column: 5, scope: !191)
!191 = !DILexicalBlockFile(scope: !179, file: !1, discriminator: 15)
!192 = !DILocation(line: 125, column: 13, scope: !191)
!193 = !DILocation(line: 127, column: 7, scope: !179)
!194 = !DILocation(line: 99, column: 9, scope: !28)
!195 = !DILocation(line: 122, column: 3, scope: !196)
!196 = !DILexicalBlockFile(scope: !183, file: !1, discriminator: 3)
!197 = !DILocation(line: 122, column: 17, scope: !198)
!198 = !DILexicalBlockFile(scope: !182, file: !1, discriminator: 1)
!199 = !DILocation(line: 122, column: 26, scope: !200)
!200 = !DILexicalBlockFile(scope: !182, file: !1, discriminator: 2)
!201 = !DILocation(line: 122, column: 21, scope: !198)
!202 = !DILocation(line: 136, column: 9, scope: !28)
!203 = !DILocation(line: 136, column: 2, scope: !28)
!204 = !DILocation(line: 140, column: 2, scope: !35)
!205 = !DILocation(line: 41, column: 6, scope: !10, inlinedAt: !206)
!206 = distinct !DILocation(line: 141, column: 2, scope: !35)
!207 = !DILocation(line: 41, column: 13, scope: !10, inlinedAt: !206)
!208 = !DILocation(line: 42, column: 6, scope: !10, inlinedAt: !206)
!209 = !DILocation(line: 43, column: 2, scope: !68, inlinedAt: !206)
!210 = !DILocation(line: 141, column: 2, scope: !35)
!211 = !DILocation(line: 44, column: 12, scope: !16, inlinedAt: !206)
!212 = !DILocation(line: 44, column: 16, scope: !16, inlinedAt: !206)
!213 = !DILocation(line: 44, column: 7, scope: !16, inlinedAt: !206)
!214 = !DILocation(line: 45, column: 19, scope: !16, inlinedAt: !206)
!215 = !DILocation(line: 45, column: 12, scope: !16, inlinedAt: !206)
!216 = !DILocation(line: 45, column: 7, scope: !16, inlinedAt: !206)
!217 = !DILocation(line: 47, column: 10, scope: !76, inlinedAt: !206)
!218 = !DILocation(line: 47, column: 7, scope: !16, inlinedAt: !206)
!219 = !DILocation(line: 49, column: 11, scope: !79, inlinedAt: !206)
!220 = !DILocation(line: 56, column: 7, scope: !81, inlinedAt: !206)
!221 = !DILocation(line: 56, column: 7, scope: !16, inlinedAt: !206)
!222 = !DILocation(line: 57, column: 14, scope: !84, inlinedAt: !206)
!223 = !DILocation(line: 59, column: 3, scope: !84, inlinedAt: !206)
!224 = !DILocation(line: 60, column: 12, scope: !87, inlinedAt: !206)
!225 = !DILocation(line: 43, column: 11, scope: !68, inlinedAt: !206)
!226 = !DILocation(line: 142, column: 2, scope: !35)
!227 = !DILocation(line: 144, column: 6, scope: !228)
!228 = distinct !DILexicalBlock(scope: !35, file: !1, line: 144, column: 6)
!229 = !DILocation(line: 144, column: 19, scope: !228)
!230 = !DILocation(line: 144, column: 16, scope: !228)
!231 = !DILocation(line: 144, column: 6, scope: !35)
!232 = !DILocation(line: 145, column: 3, scope: !233)
!233 = distinct !DILexicalBlock(scope: !228, file: !1, line: 144, column: 31)
!234 = !DILocation(line: 146, column: 3, scope: !233)
!235 = !DILocation(line: 149, column: 15, scope: !236)
!236 = distinct !DILexicalBlock(scope: !35, file: !1, line: 149, column: 5)
!237 = !DILocation(line: 149, column: 14, scope: !236)
!238 = !DILocation(line: 149, column: 5, scope: !35)
!239 = !DILocation(line: 150, column: 3, scope: !240)
!240 = distinct !DILexicalBlock(scope: !236, file: !1, line: 149, column: 23)
!241 = !DILocation(line: 151, column: 3, scope: !240)
!242 = !DILocation(line: 154, column: 2, scope: !35)
!243 = !DILocation(line: 155, column: 64, scope: !35)
!244 = !DILocation(line: 155, column: 2, scope: !35)
!245 = !DILocation(line: 156, column: 1, scope: !35)
