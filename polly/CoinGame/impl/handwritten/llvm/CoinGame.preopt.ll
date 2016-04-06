; ModuleID = 'CoinGame.preopt.s'
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
@str = private unnamed_addr constant [2 x i8] c".\00"

; Function Attrs: nounwind uwtable
define void @init() #0 !dbg !4 {
entry:
  br label %entry.split, !dbg !30

entry.split:                                      ; preds = %entry
  %call = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str, i64 0, i64 0), i32 6) #4, !dbg !30
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !31, metadata !32), !dbg !33
  br label %for.body, !dbg !34

for.body:                                         ; preds = %entry.split, %for.body
  %indvars.iv = phi i64 [ 0, %entry.split ], [ %indvars.iv.next, %for.body ]
  %arrayidx = getelementptr inbounds [6 x i32], [6 x i32]* @V, i64 0, i64 %indvars.iv, !dbg !38
  %0 = trunc i64 %indvars.iv to i32, !dbg !40
  store i32 %0, i32* %arrayidx, align 4, !dbg !40
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1, !dbg !34
  tail call void @llvm.dbg.value(metadata !2, i64 0, metadata !31, metadata !32), !dbg !33
  %exitcond = icmp ne i64 %indvars.iv.next, 6, !dbg !34
  br i1 %exitcond, label %for.body, label %for.end, !dbg !34

for.end:                                          ; preds = %for.body
  ret void, !dbg !41
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare i32 @printf(i8*, ...) #2

; Function Attrs: nounwind uwtable
define void @sumMoves() #0 !dbg !7 {
entry:
  br label %entry.split, !dbg !42

entry.split:                                      ; preds = %entry
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !43, metadata !32), !dbg !42
  tail call void @llvm.dbg.value(metadata i32 5, i64 0, metadata !44, metadata !32), !dbg !45
  tail call void @llvm.dbg.value(metadata i32 1, i64 0, metadata !46, metadata !32), !dbg !47
  br label %while.body, !dbg !48

while.body:                                       ; preds = %entry.split, %while.cond.backedge
  %i.03 = phi i32 [ 0, %entry.split ], [ %i.1, %while.cond.backedge ]
  %j.02 = phi i32 [ 5, %entry.split ], [ %j.1, %while.cond.backedge ]
  %alice.01 = phi i32 [ 1, %entry.split ], [ %alice.0.be, %while.cond.backedge ]
  %idxprom = sext i32 %j.02 to i64, !dbg !50
  %add = add nsw i32 %i.03, 1, !dbg !52
  %idxprom1 = sext i32 %add to i64, !dbg !50
  %arrayidx2 = getelementptr inbounds [6 x [6 x i32]], [6 x [6 x i32]]* @M, i64 0, i64 %idxprom1, i64 %idxprom, !dbg !50
  %0 = load i32, i32* %arrayidx2, align 4, !dbg !50
  tail call void @llvm.dbg.value(metadata i32 %0, i64 0, metadata !53, metadata !32), !dbg !54
  %sub = add nsw i32 %j.02, -1, !dbg !55
  %idxprom3 = sext i32 %sub to i64, !dbg !56
  %idxprom4 = sext i32 %i.03 to i64, !dbg !56
  %arrayidx6 = getelementptr inbounds [6 x [6 x i32]], [6 x [6 x i32]]* @M, i64 0, i64 %idxprom4, i64 %idxprom3, !dbg !56
  %1 = load i32, i32* %arrayidx6, align 4, !dbg !56
  tail call void @llvm.dbg.value(metadata i32 %1, i64 0, metadata !57, metadata !32), !dbg !58
  %cmp7 = icmp sgt i32 %0, %1, !dbg !59
  %idxprom8.pn.in = select i1 %cmp7, i32 %j.02, i32 %i.03, !dbg !61
  %dec = sext i1 %cmp7 to i32, !dbg !61
  %j.1 = add nsw i32 %j.02, %dec, !dbg !61
  %2 = zext i1 %cmp7 to i32, !dbg !61
  %inc = xor i32 %2, 1, !dbg !61
  %i.1 = add nsw i32 %i.03, %inc, !dbg !61
  %idxprom8.pn = sext i32 %idxprom8.pn.in to i64, !dbg !62
  %coin.0.in = getelementptr inbounds [6 x i32], [6 x i32]* @V, i64 0, i64 %idxprom8.pn, !dbg !62
  %coin.0 = load i32, i32* %coin.0.in, align 4, !dbg !62
  %tobool = icmp eq i32 %alice.01, 0, !dbg !64
  br i1 %tobool, label %if.else14, label %if.then12, !dbg !66

if.then12:                                        ; preds = %while.body
  %3 = load i32, i32* @sum_alice, align 4, !dbg !67
  %add13 = add nsw i32 %3, %coin.0, !dbg !67
  store i32 %add13, i32* @sum_alice, align 4, !dbg !67
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !46, metadata !32), !dbg !47
  br label %while.cond.backedge, !dbg !69

if.else14:                                        ; preds = %while.body
  %4 = load i32, i32* @sum_bob, align 4, !dbg !70
  %add15 = add nsw i32 %4, %coin.0, !dbg !70
  store i32 %add15, i32* @sum_bob, align 4, !dbg !70
  tail call void @llvm.dbg.value(metadata i32 1, i64 0, metadata !46, metadata !32), !dbg !47
  br label %while.cond.backedge

while.cond.backedge:                              ; preds = %if.else14, %if.then12
  %alice.0.be = phi i32 [ 0, %if.then12 ], [ 1, %if.else14 ]
  %cmp = icmp sgt i32 %i.1, %j.1, !dbg !72
  br i1 %cmp, label %while.end, label %while.body, !dbg !48

while.end:                                        ; preds = %while.cond.backedge
  ret void, !dbg !73
}

; Function Attrs: nounwind uwtable
define void @printMoves() #0 !dbg !8 {
entry:
  br label %entry.split, !dbg !74

entry.split:                                      ; preds = %entry
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !75, metadata !32), !dbg !74
  tail call void @llvm.dbg.value(metadata i32 5, i64 0, metadata !76, metadata !32), !dbg !77
  tail call void @llvm.dbg.value(metadata i8 1, i64 0, metadata !78, metadata !32), !dbg !80
  br label %while.body, !dbg !81

while.body:                                       ; preds = %entry.split, %if.end25
  %i.03 = phi i32 [ 0, %entry.split ], [ %i.1, %if.end25 ]
  %j.02 = phi i32 [ 5, %entry.split ], [ %j.1, %if.end25 ]
  %alice.01 = phi i8 [ 1, %entry.split ], [ %4, %if.end25 ]
  %idxprom = sext i32 %j.02 to i64, !dbg !83
  %add = add nsw i32 %i.03, 1, !dbg !85
  %idxprom1 = sext i32 %add to i64, !dbg !83
  %arrayidx2 = getelementptr inbounds [6 x [6 x i32]], [6 x [6 x i32]]* @M, i64 0, i64 %idxprom1, i64 %idxprom, !dbg !83
  %0 = load i32, i32* %arrayidx2, align 4, !dbg !83
  tail call void @llvm.dbg.value(metadata i32 %0, i64 0, metadata !86, metadata !32), !dbg !87
  %sub = add nsw i32 %j.02, -1, !dbg !88
  %idxprom3 = sext i32 %sub to i64, !dbg !89
  %idxprom4 = sext i32 %i.03 to i64, !dbg !89
  %arrayidx6 = getelementptr inbounds [6 x [6 x i32]], [6 x [6 x i32]]* @M, i64 0, i64 %idxprom4, i64 %idxprom3, !dbg !89
  %1 = load i32, i32* %arrayidx6, align 4, !dbg !89
  tail call void @llvm.dbg.value(metadata i32 %1, i64 0, metadata !90, metadata !32), !dbg !91
  %tobool = icmp eq i8 %alice.01, 0, !dbg !92
  br i1 %tobool, label %if.else, label %if.then, !dbg !94

if.then:                                          ; preds = %while.body
  %call = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.1, i64 0, i64 0)) #4, !dbg !95
  br label %if.end, !dbg !97

if.else:                                          ; preds = %while.body
  %call7 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0)) #4, !dbg !98
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %cmp8 = icmp sgt i32 %0, %1, !dbg !100
  br i1 %cmp8, label %if.else14, label %if.then9, !dbg !102

if.then9:                                         ; preds = %if.end
  %add10 = add nsw i32 %i.03, 1, !dbg !103
  %idxprom11 = sext i32 %i.03 to i64, !dbg !105
  %arrayidx12 = getelementptr inbounds [6 x i32], [6 x i32]* @V, i64 0, i64 %idxprom11, !dbg !105
  %2 = load i32, i32* %arrayidx12, align 4, !dbg !105
  %call13 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.3, i64 0, i64 0), i32 %add10, i32 %2) #4, !dbg !106
  %inc = add nsw i32 %i.03, 1, !dbg !107
  tail call void @llvm.dbg.value(metadata i32 %inc, i64 0, metadata !75, metadata !32), !dbg !74
  br label %if.end19, !dbg !108

if.else14:                                        ; preds = %if.end
  %add15 = add nsw i32 %j.02, 1, !dbg !109
  %idxprom16 = sext i32 %j.02 to i64, !dbg !111
  %arrayidx17 = getelementptr inbounds [6 x i32], [6 x i32]* @V, i64 0, i64 %idxprom16, !dbg !111
  %3 = load i32, i32* %arrayidx17, align 4, !dbg !111
  %call18 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.3, i64 0, i64 0), i32 %add15, i32 %3) #4, !dbg !112
  %dec = add nsw i32 %j.02, -1, !dbg !113
  tail call void @llvm.dbg.value(metadata i32 %dec, i64 0, metadata !76, metadata !32), !dbg !77
  br label %if.end19

if.end19:                                         ; preds = %if.else14, %if.then9
  %j.1 = phi i32 [ %j.02, %if.then9 ], [ %dec, %if.else14 ]
  %i.1 = phi i32 [ %inc, %if.then9 ], [ %i.03, %if.else14 ]
  %tobool20 = icmp eq i8 %alice.01, 0, !dbg !114
  br i1 %tobool20, label %if.else23, label %if.then21, !dbg !116

if.then21:                                        ; preds = %if.end19
  %call22 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.4, i64 0, i64 0)) #4, !dbg !117
  br label %if.end25, !dbg !119

if.else23:                                        ; preds = %if.end19
  %puts = tail call i32 @puts(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @str, i64 0, i64 0)), !dbg !120
  br label %if.end25

if.end25:                                         ; preds = %if.else23, %if.then21
  %4 = xor i8 %alice.01, 1, !dbg !122
  tail call void @llvm.dbg.value(metadata i8 %4, i64 0, metadata !78, metadata !32), !dbg !80
  %cmp = icmp sgt i32 %i.1, %j.1, !dbg !123
  br i1 %cmp, label %while.end, label %while.body, !dbg !81

while.end:                                        ; preds = %if.end25
  ret void, !dbg !124
}

; Function Attrs: nounwind uwtable
define i32 @maxMoney() #0 !dbg !9 {
entry:
  br label %entry.split, !dbg !125

entry.split:                                      ; preds = %entry
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !126, metadata !32), !dbg !125
  br label %for.cond1.preheader, !dbg !127

for.cond1.preheader:                              ; preds = %entry.split, %for.inc183
  %indvars.iv14 = phi i64 [ 0, %entry.split ], [ %indvars.iv.next15, %for.inc183 ]
  br i1 true, label %for.body3.lr.ph, label %for.cond71.preheader, !dbg !131

for.body3.lr.ph:                                  ; preds = %for.cond1.preheader
  br label %for.body3, !dbg !131

for.cond1.for.cond71.preheader_crit_edge:         ; preds = %for.inc
  br label %for.cond71.preheader, !dbg !131

for.cond71.preheader:                             ; preds = %for.cond1.for.cond71.preheader_crit_edge, %for.cond1.preheader
  br i1 true, label %for.body74.lr.ph, label %for.inc183, !dbg !136

for.body74.lr.ph:                                 ; preds = %for.cond71.preheader
  br label %for.body74, !dbg !136

for.body3:                                        ; preds = %for.body3.lr.ph, %for.inc
  %indvars.iv10 = phi i64 [ %indvars.iv14, %for.body3.lr.ph ], [ %indvars.iv.next11, %for.inc ]
  %i.04 = phi i32 [ 0, %for.body3.lr.ph ], [ %i.1, %for.inc ]
  %cmp4 = icmp slt i32 %i.04, 6, !dbg !139
  br i1 %cmp4, label %if.then, label %for.inc, !dbg !142

if.then:                                          ; preds = %for.body3
  %idxprom5 = sext i32 %i.04 to i64, !dbg !143
  %arrayidx6 = getelementptr inbounds [6 x [6 x i32]], [6 x [6 x i32]]* @X, i64 0, i64 %idxprom5, i64 %indvars.iv10, !dbg !143
  store i32 0, i32* %arrayidx6, align 4, !dbg !145
  %add = add nsw i32 %i.04, 2, !dbg !146
  %cmp7 = icmp slt i32 %add, 6, !dbg !148
  br i1 %cmp7, label %if.then8, label %if.end, !dbg !149

if.then8:                                         ; preds = %if.then
  %idxprom10 = sext i32 %i.04 to i64, !dbg !150
  %arrayidx12 = getelementptr inbounds [6 x [6 x i32]], [6 x [6 x i32]]* @X, i64 0, i64 %idxprom10, i64 %indvars.iv10, !dbg !150
  %0 = load i32, i32* %arrayidx12, align 4, !dbg !150
  %add14 = add nsw i32 %i.04, 2, !dbg !152
  %idxprom15 = sext i32 %add14 to i64, !dbg !153
  %arrayidx17 = getelementptr inbounds [6 x [6 x i32]], [6 x [6 x i32]]* @M, i64 0, i64 %idxprom15, i64 %indvars.iv10, !dbg !153
  %1 = load i32, i32* %arrayidx17, align 4, !dbg !153
  %add18 = add nsw i32 %1, %0, !dbg !154
  %idxprom20 = sext i32 %i.04 to i64, !dbg !155
  %arrayidx22 = getelementptr inbounds [6 x [6 x i32]], [6 x [6 x i32]]* @X, i64 0, i64 %idxprom20, i64 %indvars.iv10, !dbg !155
  store i32 %add18, i32* %arrayidx22, align 4, !dbg !156
  br label %if.end, !dbg !157

if.end:                                           ; preds = %if.then8, %if.then
  %idxprom24 = sext i32 %i.04 to i64, !dbg !158
  %arrayidx26 = getelementptr inbounds [6 x [6 x i32]], [6 x [6 x i32]]* @Y, i64 0, i64 %idxprom24, i64 %indvars.iv10, !dbg !158
  store i32 0, i32* %arrayidx26, align 4, !dbg !159
  %add27 = add nsw i32 %i.04, 1, !dbg !160
  %cmp28 = icmp slt i32 %add27, 6, !dbg !162
  %cmp29 = icmp sgt i64 %indvars.iv10, 0, !dbg !163
  %or.cond = and i1 %cmp29, %cmp28, !dbg !165
  br i1 %or.cond, label %if.then30, label %if.end46, !dbg !165

if.then30:                                        ; preds = %if.end
  %idxprom32 = sext i32 %i.04 to i64, !dbg !166
  %arrayidx34 = getelementptr inbounds [6 x [6 x i32]], [6 x [6 x i32]]* @Y, i64 0, i64 %idxprom32, i64 %indvars.iv10, !dbg !166
  %2 = load i32, i32* %arrayidx34, align 4, !dbg !166
  %3 = add nsw i64 %indvars.iv10, -1, !dbg !168
  %add37 = add nsw i32 %i.04, 1, !dbg !169
  %idxprom38 = sext i32 %add37 to i64, !dbg !170
  %arrayidx40 = getelementptr inbounds [6 x [6 x i32]], [6 x [6 x i32]]* @M, i64 0, i64 %idxprom38, i64 %3, !dbg !170
  %4 = load i32, i32* %arrayidx40, align 4, !dbg !170
  %add41 = add nsw i32 %4, %2, !dbg !171
  %idxprom43 = sext i32 %i.04 to i64, !dbg !172
  %arrayidx45 = getelementptr inbounds [6 x [6 x i32]], [6 x [6 x i32]]* @Y, i64 0, i64 %idxprom43, i64 %indvars.iv10, !dbg !172
  store i32 %add41, i32* %arrayidx45, align 4, !dbg !173
  br label %if.end46, !dbg !174

if.end46:                                         ; preds = %if.then30, %if.end
  %idxprom48 = sext i32 %i.04 to i64, !dbg !175
  %arrayidx50 = getelementptr inbounds [6 x [6 x i32]], [6 x [6 x i32]]* @Z, i64 0, i64 %idxprom48, i64 %indvars.iv10, !dbg !175
  store i32 0, i32* %arrayidx50, align 4, !dbg !176
  %cmp52 = icmp sgt i64 %indvars.iv10, 1, !dbg !177
  br i1 %cmp52, label %if.then53, label %if.end68, !dbg !179

if.then53:                                        ; preds = %if.end46
  %idxprom55 = sext i32 %i.04 to i64, !dbg !180
  %arrayidx57 = getelementptr inbounds [6 x [6 x i32]], [6 x [6 x i32]]* @Z, i64 0, i64 %idxprom55, i64 %indvars.iv10, !dbg !180
  %5 = load i32, i32* %arrayidx57, align 4, !dbg !180
  %6 = add nsw i64 %indvars.iv10, -2, !dbg !182
  %idxprom60 = sext i32 %i.04 to i64, !dbg !183
  %arrayidx62 = getelementptr inbounds [6 x [6 x i32]], [6 x [6 x i32]]* @M, i64 0, i64 %idxprom60, i64 %6, !dbg !183
  %7 = load i32, i32* %arrayidx62, align 4, !dbg !183
  %add63 = add nsw i32 %7, %5, !dbg !184
  %idxprom65 = sext i32 %i.04 to i64, !dbg !185
  %arrayidx67 = getelementptr inbounds [6 x [6 x i32]], [6 x [6 x i32]]* @Z, i64 0, i64 %idxprom65, i64 %indvars.iv10, !dbg !185
  store i32 %add63, i32* %arrayidx67, align 4, !dbg !186
  br label %if.end68, !dbg !187

if.end68:                                         ; preds = %if.then53, %if.end46
  %inc = add nsw i32 %i.04, 1, !dbg !188
  tail call void @llvm.dbg.value(metadata i32 %inc, i64 0, metadata !189, metadata !32), !dbg !190
  br label %for.inc, !dbg !191

for.inc:                                          ; preds = %for.body3, %if.end68
  %i.1 = phi i32 [ %inc, %if.end68 ], [ %i.04, %for.body3 ]
  %indvars.iv.next11 = add nuw nsw i64 %indvars.iv10, 1, !dbg !131
  tail call void @llvm.dbg.value(metadata !2, i64 0, metadata !192, metadata !32), !dbg !193
  %lftr.wideiv = trunc i64 %indvars.iv.next11 to i32, !dbg !131
  %exitcond = icmp ne i32 %lftr.wideiv, 6, !dbg !131
  br i1 %exitcond, label %for.body3, label %for.cond1.for.cond71.preheader_crit_edge, !dbg !131

for.body74:                                       ; preds = %for.body74.lr.ph, %for.inc180
  %indvars.iv16 = phi i64 [ %indvars.iv14, %for.body74.lr.ph ], [ %indvars.iv.next17, %for.inc180 ]
  %i.28 = phi i32 [ 0, %for.body74.lr.ph ], [ %i.3, %for.inc180 ]
  %cmp75 = icmp slt i32 %i.28, 6, !dbg !194
  br i1 %cmp75, label %if.then76, label %for.inc180, !dbg !198

if.then76:                                        ; preds = %for.body74
  %idxprom77 = sext i32 %i.28 to i64, !dbg !199
  %arrayidx78 = getelementptr inbounds [6 x i32], [6 x i32]* @V, i64 0, i64 %idxprom77, !dbg !199
  %8 = load i32, i32* %arrayidx78, align 4, !dbg !199
  %idxprom80 = sext i32 %i.28 to i64, !dbg !199
  %arrayidx82 = getelementptr inbounds [6 x [6 x i32]], [6 x [6 x i32]]* @X, i64 0, i64 %idxprom80, i64 %indvars.iv16, !dbg !199
  %9 = load i32, i32* %arrayidx82, align 4, !dbg !199
  %idxprom84 = sext i32 %i.28 to i64, !dbg !199
  %arrayidx86 = getelementptr inbounds [6 x [6 x i32]], [6 x [6 x i32]]* @Y, i64 0, i64 %idxprom84, i64 %indvars.iv16, !dbg !199
  %10 = load i32, i32* %arrayidx86, align 4, !dbg !199
  %cmp87 = icmp slt i32 %9, %10, !dbg !199
  %idxprom89 = sext i32 %i.28 to i64, !dbg !201
  %arrayidx91 = getelementptr inbounds [6 x [6 x i32]], [6 x [6 x i32]]* @X, i64 0, i64 %idxprom89, i64 %indvars.iv16, !dbg !201
  %arrayidx95 = getelementptr inbounds [6 x [6 x i32]], [6 x [6 x i32]]* @Y, i64 0, i64 %idxprom89, i64 %indvars.iv16, !dbg !203
  %cond.in = select i1 %cmp87, i32* %arrayidx91, i32* %arrayidx95, !dbg !199
  %cond = load i32, i32* %cond.in, align 4, !dbg !205
  %add96 = add nsw i32 %cond, %8, !dbg !205
  %arrayidx98 = getelementptr inbounds [6 x i32], [6 x i32]* @V, i64 0, i64 %indvars.iv16, !dbg !205
  %11 = load i32, i32* %arrayidx98, align 4, !dbg !205
  %idxprom100 = sext i32 %i.28 to i64, !dbg !205
  %arrayidx102 = getelementptr inbounds [6 x [6 x i32]], [6 x [6 x i32]]* @Y, i64 0, i64 %idxprom100, i64 %indvars.iv16, !dbg !205
  %12 = load i32, i32* %arrayidx102, align 4, !dbg !205
  %idxprom104 = sext i32 %i.28 to i64, !dbg !205
  %arrayidx106 = getelementptr inbounds [6 x [6 x i32]], [6 x [6 x i32]]* @Z, i64 0, i64 %idxprom104, i64 %indvars.iv16, !dbg !205
  %13 = load i32, i32* %arrayidx106, align 4, !dbg !205
  %cmp107 = icmp slt i32 %12, %13, !dbg !205
  %idxprom110 = sext i32 %i.28 to i64, !dbg !207
  %arrayidx112 = getelementptr inbounds [6 x [6 x i32]], [6 x [6 x i32]]* @Y, i64 0, i64 %idxprom110, i64 %indvars.iv16, !dbg !207
  %arrayidx117 = getelementptr inbounds [6 x [6 x i32]], [6 x [6 x i32]]* @Z, i64 0, i64 %idxprom110, i64 %indvars.iv16, !dbg !209
  %cond119.in = select i1 %cmp107, i32* %arrayidx112, i32* %arrayidx117, !dbg !205
  %cond119 = load i32, i32* %cond119.in, align 4, !dbg !211
  %add120 = add nsw i32 %cond119, %11, !dbg !211
  %cmp121 = icmp sgt i32 %add96, %add120, !dbg !211
  br i1 %cmp121, label %cond.true122, label %cond.false147, !dbg !211

cond.true122:                                     ; preds = %if.then76
  %idxprom123 = sext i32 %i.28 to i64, !dbg !213
  %arrayidx124 = getelementptr inbounds [6 x i32], [6 x i32]* @V, i64 0, i64 %idxprom123, !dbg !213
  %14 = load i32, i32* %arrayidx124, align 4, !dbg !213
  %idxprom126 = sext i32 %i.28 to i64, !dbg !213
  %arrayidx128 = getelementptr inbounds [6 x [6 x i32]], [6 x [6 x i32]]* @X, i64 0, i64 %idxprom126, i64 %indvars.iv16, !dbg !213
  %15 = load i32, i32* %arrayidx128, align 4, !dbg !213
  %idxprom130 = sext i32 %i.28 to i64, !dbg !213
  %arrayidx132 = getelementptr inbounds [6 x [6 x i32]], [6 x [6 x i32]]* @Y, i64 0, i64 %idxprom130, i64 %indvars.iv16, !dbg !213
  %16 = load i32, i32* %arrayidx132, align 4, !dbg !213
  %cmp133 = icmp slt i32 %15, %16, !dbg !213
  %idxprom136 = sext i32 %i.28 to i64, !dbg !215
  %arrayidx138 = getelementptr inbounds [6 x [6 x i32]], [6 x [6 x i32]]* @X, i64 0, i64 %idxprom136, i64 %indvars.iv16, !dbg !215
  %arrayidx143 = getelementptr inbounds [6 x [6 x i32]], [6 x [6 x i32]]* @Y, i64 0, i64 %idxprom136, i64 %indvars.iv16, !dbg !217
  %cond145.in = select i1 %cmp133, i32* %arrayidx138, i32* %arrayidx143, !dbg !213
  %cond145 = load i32, i32* %cond145.in, align 4, !dbg !219
  %add146 = add nsw i32 %cond145, %14, !dbg !219
  br label %cond.end172, !dbg !219

cond.false147:                                    ; preds = %if.then76
  %arrayidx149 = getelementptr inbounds [6 x i32], [6 x i32]* @V, i64 0, i64 %indvars.iv16, !dbg !221
  %17 = load i32, i32* %arrayidx149, align 4, !dbg !221
  %idxprom151 = sext i32 %i.28 to i64, !dbg !221
  %arrayidx153 = getelementptr inbounds [6 x [6 x i32]], [6 x [6 x i32]]* @Y, i64 0, i64 %idxprom151, i64 %indvars.iv16, !dbg !221
  %18 = load i32, i32* %arrayidx153, align 4, !dbg !221
  %idxprom155 = sext i32 %i.28 to i64, !dbg !221
  %arrayidx157 = getelementptr inbounds [6 x [6 x i32]], [6 x [6 x i32]]* @Z, i64 0, i64 %idxprom155, i64 %indvars.iv16, !dbg !221
  %19 = load i32, i32* %arrayidx157, align 4, !dbg !221
  %cmp158 = icmp slt i32 %18, %19, !dbg !221
  %idxprom161 = sext i32 %i.28 to i64, !dbg !223
  %arrayidx163 = getelementptr inbounds [6 x [6 x i32]], [6 x [6 x i32]]* @Y, i64 0, i64 %idxprom161, i64 %indvars.iv16, !dbg !223
  %arrayidx168 = getelementptr inbounds [6 x [6 x i32]], [6 x [6 x i32]]* @Z, i64 0, i64 %idxprom161, i64 %indvars.iv16, !dbg !225
  %cond170.in = select i1 %cmp158, i32* %arrayidx163, i32* %arrayidx168, !dbg !221
  %cond170 = load i32, i32* %cond170.in, align 4, !dbg !227
  %add171 = add nsw i32 %cond170, %17, !dbg !227
  br label %cond.end172, !dbg !227

cond.end172:                                      ; preds = %cond.false147, %cond.true122
  %cond173 = phi i32 [ %add146, %cond.true122 ], [ %add171, %cond.false147 ], !dbg !229
  %idxprom175 = sext i32 %i.28 to i64, !dbg !231
  %arrayidx177 = getelementptr inbounds [6 x [6 x i32]], [6 x [6 x i32]]* @M, i64 0, i64 %idxprom175, i64 %indvars.iv16, !dbg !231
  store i32 %cond173, i32* %arrayidx177, align 4, !dbg !232
  %inc178 = add nsw i32 %i.28, 1, !dbg !233
  tail call void @llvm.dbg.value(metadata i32 %inc178, i64 0, metadata !189, metadata !32), !dbg !190
  br label %for.inc180, !dbg !234

for.inc180:                                       ; preds = %for.body74, %cond.end172
  %i.3 = phi i32 [ %inc178, %cond.end172 ], [ %i.28, %for.body74 ]
  %indvars.iv.next17 = add nuw nsw i64 %indvars.iv16, 1, !dbg !136
  tail call void @llvm.dbg.value(metadata !2, i64 0, metadata !192, metadata !32), !dbg !193
  %cmp72 = icmp slt i32 %i.3, 6, !dbg !235
  %cmp73 = icmp slt i64 %indvars.iv.next17, 6, !dbg !237
  %cmp73. = and i1 %cmp72, %cmp73, !dbg !239
  br i1 %cmp73., label %for.body74, label %for.cond71.for.inc183_crit_edge, !dbg !136

for.cond71.for.inc183_crit_edge:                  ; preds = %for.inc180
  br label %for.inc183, !dbg !136

for.inc183:                                       ; preds = %for.cond71.for.inc183_crit_edge, %for.cond71.preheader
  tail call void @llvm.dbg.value(metadata !2, i64 0, metadata !126, metadata !32), !dbg !125
  %indvars.iv.next15 = add nuw nsw i64 %indvars.iv14, 1, !dbg !127
  %exitcond18 = icmp ne i64 %indvars.iv.next15, 6, !dbg !127
  br i1 %exitcond18, label %for.cond1.preheader, label %for.end185, !dbg !127

for.end185:                                       ; preds = %for.inc183
  %20 = load i32, i32* getelementptr inbounds ([6 x [6 x i32]], [6 x [6 x i32]]* @M, i64 0, i64 0, i64 5), align 4, !dbg !240
  ret i32 %20, !dbg !241
}

; Function Attrs: nounwind uwtable
define i32 @main() #0 !dbg !13 {
entry:
  br label %entry.split, !dbg !242

entry.split:                                      ; preds = %entry
  %call = tail call i32 @maxMoney(), !dbg !242
  tail call void @sumMoves(), !dbg !243
  tail call void @printMoves(), !dbg !244
  %0 = load i32, i32* @sum_alice, align 4, !dbg !245
  %1 = load i32, i32* getelementptr inbounds ([6 x [6 x i32]], [6 x [6 x i32]]* @M, i64 0, i64 0, i64 5), align 4, !dbg !247
  %cmp = icmp eq i32 %0, %1, !dbg !248
  br i1 %cmp, label %if.end, label %if.then, !dbg !249

if.then:                                          ; preds = %entry.split
  %call1 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([24 x i8], [24 x i8]* @.str.6, i64 0, i64 0)) #4, !dbg !250
  tail call void @exit(i32 -1) #5, !dbg !252
  unreachable, !dbg !252

if.end:                                           ; preds = %entry.split
  %2 = load i32, i32* @sum_alice, align 4, !dbg !253
  %3 = load i32, i32* @sum_bob, align 4, !dbg !255
  %cmp2 = icmp slt i32 %2, %3, !dbg !256
  br i1 %cmp2, label %if.then3, label %if.end5, !dbg !257

if.then3:                                         ; preds = %if.end
  %call4 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([28 x i8], [28 x i8]* @.str.7, i64 0, i64 0)) #4, !dbg !258
  tail call void @exit(i32 -1) #5, !dbg !260
  unreachable, !dbg !260

if.end5:                                          ; preds = %if.end
  %4 = load i32, i32* @sum_alice, align 4, !dbg !261
  %call6 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([54 x i8], [54 x i8]* @.str.8, i64 0, i64 0), i32 %4) #4, !dbg !262
  %5 = load i32, i32* @sum_bob, align 4, !dbg !263
  %call7 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([52 x i8], [52 x i8]* @.str.9, i64 0, i64 0), i32 %5) #4, !dbg !264
  ret i32 0, !dbg !265
}

; Function Attrs: noreturn nounwind
declare void @exit(i32) #3

; Function Attrs: nounwind readnone
declare void @llvm.dbg.value(metadata, i64, metadata, metadata) #1

; Function Attrs: nounwind
declare i32 @puts(i8* nocapture) #4

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone }
attributes #2 = { "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { noreturn nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }
attributes #5 = { noreturn nounwind }

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
!30 = !DILocation(line: 34, column: 2, scope: !4)
!31 = !DILocalVariable(name: "i", scope: !4, file: !1, line: 32, type: !12)
!32 = !DIExpression()
!33 = !DILocation(line: 32, column: 6, scope: !4)
!34 = !DILocation(line: 35, column: 2, scope: !35)
!35 = !DILexicalBlockFile(scope: !36, file: !1, discriminator: 1)
!36 = distinct !DILexicalBlock(scope: !37, file: !1, line: 35, column: 2)
!37 = distinct !DILexicalBlock(scope: !4, file: !1, line: 35, column: 2)
!38 = !DILocation(line: 36, column: 3, scope: !39)
!39 = distinct !DILexicalBlock(scope: !36, file: !1, line: 35, column: 18)
!40 = !DILocation(line: 36, column: 8, scope: !39)
!41 = !DILocation(line: 38, column: 1, scope: !4)
!42 = !DILocation(line: 41, column: 6, scope: !7)
!43 = !DILocalVariable(name: "i", scope: !7, file: !1, line: 41, type: !12)
!44 = !DILocalVariable(name: "j", scope: !7, file: !1, line: 41, type: !12)
!45 = !DILocation(line: 41, column: 13, scope: !7)
!46 = !DILocalVariable(name: "alice", scope: !7, file: !1, line: 42, type: !12)
!47 = !DILocation(line: 42, column: 6, scope: !7)
!48 = !DILocation(line: 43, column: 2, scope: !49)
!49 = !DILexicalBlockFile(scope: !7, file: !1, discriminator: 1)
!50 = !DILocation(line: 44, column: 12, scope: !51)
!51 = distinct !DILexicalBlock(scope: !7, file: !1, line: 43, column: 17)
!52 = !DILocation(line: 44, column: 16, scope: !51)
!53 = !DILocalVariable(name: "P1", scope: !51, file: !1, line: 44, type: !12)
!54 = !DILocation(line: 44, column: 7, scope: !51)
!55 = !DILocation(line: 45, column: 19, scope: !51)
!56 = !DILocation(line: 45, column: 12, scope: !51)
!57 = !DILocalVariable(name: "P2", scope: !51, file: !1, line: 45, type: !12)
!58 = !DILocation(line: 45, column: 7, scope: !51)
!59 = !DILocation(line: 47, column: 10, scope: !60)
!60 = distinct !DILexicalBlock(scope: !51, file: !1, line: 47, column: 7)
!61 = !DILocation(line: 47, column: 7, scope: !51)
!62 = !DILocation(line: 49, column: 11, scope: !63)
!63 = distinct !DILexicalBlock(scope: !60, file: !1, line: 47, column: 17)
!64 = !DILocation(line: 56, column: 7, scope: !65)
!65 = distinct !DILexicalBlock(scope: !51, file: !1, line: 56, column: 7)
!66 = !DILocation(line: 56, column: 7, scope: !51)
!67 = !DILocation(line: 57, column: 14, scope: !68)
!68 = distinct !DILexicalBlock(scope: !65, file: !1, line: 56, column: 14)
!69 = !DILocation(line: 59, column: 3, scope: !68)
!70 = !DILocation(line: 60, column: 12, scope: !71)
!71 = distinct !DILexicalBlock(scope: !65, file: !1, line: 59, column: 10)
!72 = !DILocation(line: 43, column: 11, scope: !49)
!73 = !DILocation(line: 65, column: 1, scope: !7)
!74 = !DILocation(line: 70, column: 6, scope: !8)
!75 = !DILocalVariable(name: "i", scope: !8, file: !1, line: 70, type: !12)
!76 = !DILocalVariable(name: "j", scope: !8, file: !1, line: 70, type: !12)
!77 = !DILocation(line: 70, column: 13, scope: !8)
!78 = !DILocalVariable(name: "alice", scope: !8, file: !1, line: 71, type: !79)
!79 = !DIBasicType(name: "_Bool", size: 8, align: 8, encoding: DW_ATE_boolean)
!80 = !DILocation(line: 71, column: 7, scope: !8)
!81 = !DILocation(line: 72, column: 2, scope: !82)
!82 = !DILexicalBlockFile(scope: !8, file: !1, discriminator: 1)
!83 = !DILocation(line: 73, column: 12, scope: !84)
!84 = distinct !DILexicalBlock(scope: !8, file: !1, line: 72, column: 17)
!85 = !DILocation(line: 73, column: 16, scope: !84)
!86 = !DILocalVariable(name: "P1", scope: !84, file: !1, line: 73, type: !12)
!87 = !DILocation(line: 73, column: 7, scope: !84)
!88 = !DILocation(line: 74, column: 19, scope: !84)
!89 = !DILocation(line: 74, column: 12, scope: !84)
!90 = !DILocalVariable(name: "P2", scope: !84, file: !1, line: 74, type: !12)
!91 = !DILocation(line: 74, column: 7, scope: !84)
!92 = !DILocation(line: 75, column: 7, scope: !93)
!93 = distinct !DILexicalBlock(scope: !84, file: !1, line: 75, column: 7)
!94 = !DILocation(line: 75, column: 7, scope: !84)
!95 = !DILocation(line: 76, column: 4, scope: !96)
!96 = distinct !DILexicalBlock(scope: !93, file: !1, line: 75, column: 14)
!97 = !DILocation(line: 77, column: 3, scope: !96)
!98 = !DILocation(line: 78, column: 4, scope: !99)
!99 = distinct !DILexicalBlock(scope: !93, file: !1, line: 77, column: 10)
!100 = !DILocation(line: 81, column: 10, scope: !101)
!101 = distinct !DILexicalBlock(scope: !84, file: !1, line: 81, column: 7)
!102 = !DILocation(line: 81, column: 7, scope: !84)
!103 = !DILocation(line: 82, column: 26, scope: !104)
!104 = distinct !DILexicalBlock(scope: !101, file: !1, line: 81, column: 17)
!105 = !DILocation(line: 82, column: 31, scope: !104)
!106 = !DILocation(line: 82, column: 4, scope: !104)
!107 = !DILocation(line: 83, column: 5, scope: !104)
!108 = !DILocation(line: 84, column: 3, scope: !104)
!109 = !DILocation(line: 85, column: 26, scope: !110)
!110 = distinct !DILexicalBlock(scope: !101, file: !1, line: 84, column: 10)
!111 = !DILocation(line: 85, column: 31, scope: !110)
!112 = !DILocation(line: 85, column: 4, scope: !110)
!113 = !DILocation(line: 86, column: 5, scope: !110)
!114 = !DILocation(line: 88, column: 7, scope: !115)
!115 = distinct !DILexicalBlock(scope: !84, file: !1, line: 88, column: 7)
!116 = !DILocation(line: 88, column: 7, scope: !84)
!117 = !DILocation(line: 89, column: 4, scope: !118)
!118 = distinct !DILexicalBlock(scope: !115, file: !1, line: 88, column: 14)
!119 = !DILocation(line: 90, column: 3, scope: !118)
!120 = !DILocation(line: 91, column: 4, scope: !121)
!121 = distinct !DILexicalBlock(scope: !115, file: !1, line: 90, column: 10)
!122 = !DILocation(line: 93, column: 9, scope: !84)
!123 = !DILocation(line: 72, column: 11, scope: !82)
!124 = !DILocation(line: 96, column: 1, scope: !8)
!125 = !DILocation(line: 99, column: 6, scope: !9)
!126 = !DILocalVariable(name: "s", scope: !9, file: !1, line: 99, type: !12)
!127 = !DILocation(line: 100, column: 2, scope: !128)
!128 = !DILexicalBlockFile(scope: !129, file: !1, discriminator: 1)
!129 = distinct !DILexicalBlock(scope: !130, file: !1, line: 100, column: 2)
!130 = distinct !DILexicalBlock(scope: !9, file: !1, line: 100, column: 2)
!131 = !DILocation(line: 103, column: 3, scope: !132)
!132 = !DILexicalBlockFile(scope: !133, file: !1, discriminator: 1)
!133 = distinct !DILexicalBlock(scope: !134, file: !1, line: 103, column: 3)
!134 = distinct !DILexicalBlock(scope: !135, file: !1, line: 103, column: 3)
!135 = distinct !DILexicalBlock(scope: !129, file: !1, line: 100, column: 26)
!136 = !DILocation(line: 122, column: 3, scope: !137)
!137 = !DILexicalBlockFile(scope: !138, file: !1, discriminator: 3)
!138 = distinct !DILexicalBlock(scope: !135, file: !1, line: 122, column: 3)
!139 = !DILocation(line: 104, column: 8, scope: !140)
!140 = distinct !DILexicalBlock(scope: !141, file: !1, line: 104, column: 7)
!141 = distinct !DILexicalBlock(scope: !133, file: !1, line: 103, column: 26)
!142 = !DILocation(line: 104, column: 7, scope: !141)
!143 = !DILocation(line: 105, column: 5, scope: !144)
!144 = distinct !DILexicalBlock(scope: !140, file: !1, line: 104, column: 11)
!145 = !DILocation(line: 105, column: 13, scope: !144)
!146 = !DILocation(line: 106, column: 11, scope: !147)
!147 = distinct !DILexicalBlock(scope: !144, file: !1, line: 106, column: 9)
!148 = !DILocation(line: 106, column: 15, scope: !147)
!149 = !DILocation(line: 106, column: 9, scope: !144)
!150 = !DILocation(line: 107, column: 16, scope: !151)
!151 = distinct !DILexicalBlock(scope: !147, file: !1, line: 106, column: 20)
!152 = !DILocation(line: 107, column: 30, scope: !151)
!153 = !DILocation(line: 107, column: 26, scope: !151)
!154 = !DILocation(line: 107, column: 24, scope: !151)
!155 = !DILocation(line: 107, column: 6, scope: !151)
!156 = !DILocation(line: 107, column: 14, scope: !151)
!157 = !DILocation(line: 108, column: 5, scope: !151)
!158 = !DILocation(line: 109, column: 5, scope: !144)
!159 = !DILocation(line: 109, column: 13, scope: !144)
!160 = !DILocation(line: 110, column: 11, scope: !161)
!161 = distinct !DILexicalBlock(scope: !144, file: !1, line: 110, column: 9)
!162 = !DILocation(line: 110, column: 15, scope: !161)
!163 = !DILocation(line: 110, column: 28, scope: !164)
!164 = !DILexicalBlockFile(scope: !161, file: !1, discriminator: 1)
!165 = !DILocation(line: 110, column: 19, scope: !161)
!166 = !DILocation(line: 111, column: 16, scope: !167)
!167 = distinct !DILexicalBlock(scope: !161, file: !1, line: 110, column: 34)
!168 = !DILocation(line: 111, column: 37, scope: !167)
!169 = !DILocation(line: 111, column: 30, scope: !167)
!170 = !DILocation(line: 111, column: 26, scope: !167)
!171 = !DILocation(line: 111, column: 24, scope: !167)
!172 = !DILocation(line: 111, column: 6, scope: !167)
!173 = !DILocation(line: 111, column: 14, scope: !167)
!174 = !DILocation(line: 112, column: 5, scope: !167)
!175 = !DILocation(line: 113, column: 5, scope: !144)
!176 = !DILocation(line: 113, column: 13, scope: !144)
!177 = !DILocation(line: 114, column: 15, scope: !178)
!178 = distinct !DILexicalBlock(scope: !144, file: !1, line: 114, column: 9)
!179 = !DILocation(line: 114, column: 9, scope: !144)
!180 = !DILocation(line: 115, column: 16, scope: !181)
!181 = distinct !DILexicalBlock(scope: !178, file: !1, line: 114, column: 20)
!182 = !DILocation(line: 115, column: 32, scope: !181)
!183 = !DILocation(line: 115, column: 25, scope: !181)
!184 = !DILocation(line: 115, column: 23, scope: !181)
!185 = !DILocation(line: 115, column: 6, scope: !181)
!186 = !DILocation(line: 115, column: 14, scope: !181)
!187 = !DILocation(line: 116, column: 5, scope: !181)
!188 = !DILocation(line: 117, column: 6, scope: !144)
!189 = !DILocalVariable(name: "i", scope: !9, file: !1, line: 99, type: !12)
!190 = !DILocation(line: 99, column: 9, scope: !9)
!191 = !DILocation(line: 118, column: 4, scope: !144)
!192 = !DILocalVariable(name: "j", scope: !9, file: !1, line: 99, type: !12)
!193 = !DILocation(line: 99, column: 12, scope: !9)
!194 = !DILocation(line: 123, column: 8, scope: !195)
!195 = distinct !DILexicalBlock(scope: !196, file: !1, line: 123, column: 7)
!196 = distinct !DILexicalBlock(scope: !197, file: !1, line: 122, column: 35)
!197 = distinct !DILexicalBlock(scope: !138, file: !1, line: 122, column: 3)
!198 = !DILocation(line: 123, column: 7, scope: !196)
!199 = !DILocation(line: 125, column: 15, scope: !200)
!200 = distinct !DILexicalBlock(scope: !195, file: !1, line: 123, column: 11)
!201 = !DILocation(line: 125, column: 15, scope: !202)
!202 = !DILexicalBlockFile(scope: !200, file: !1, discriminator: 1)
!203 = !DILocation(line: 125, column: 15, scope: !204)
!204 = !DILexicalBlockFile(scope: !200, file: !1, discriminator: 2)
!205 = !DILocation(line: 125, column: 15, scope: !206)
!206 = !DILexicalBlockFile(scope: !200, file: !1, discriminator: 3)
!207 = !DILocation(line: 125, column: 15, scope: !208)
!208 = !DILexicalBlockFile(scope: !200, file: !1, discriminator: 4)
!209 = !DILocation(line: 125, column: 15, scope: !210)
!210 = !DILexicalBlockFile(scope: !200, file: !1, discriminator: 5)
!211 = !DILocation(line: 125, column: 15, scope: !212)
!212 = !DILexicalBlockFile(scope: !200, file: !1, discriminator: 6)
!213 = !DILocation(line: 125, column: 15, scope: !214)
!214 = !DILexicalBlockFile(scope: !200, file: !1, discriminator: 7)
!215 = !DILocation(line: 125, column: 15, scope: !216)
!216 = !DILexicalBlockFile(scope: !200, file: !1, discriminator: 8)
!217 = !DILocation(line: 125, column: 15, scope: !218)
!218 = !DILexicalBlockFile(scope: !200, file: !1, discriminator: 9)
!219 = !DILocation(line: 125, column: 15, scope: !220)
!220 = !DILexicalBlockFile(scope: !200, file: !1, discriminator: 10)
!221 = !DILocation(line: 125, column: 15, scope: !222)
!222 = !DILexicalBlockFile(scope: !200, file: !1, discriminator: 11)
!223 = !DILocation(line: 125, column: 15, scope: !224)
!224 = !DILexicalBlockFile(scope: !200, file: !1, discriminator: 12)
!225 = !DILocation(line: 125, column: 15, scope: !226)
!226 = !DILexicalBlockFile(scope: !200, file: !1, discriminator: 13)
!227 = !DILocation(line: 125, column: 15, scope: !228)
!228 = !DILexicalBlockFile(scope: !200, file: !1, discriminator: 14)
!229 = !DILocation(line: 125, column: 15, scope: !230)
!230 = !DILexicalBlockFile(scope: !200, file: !1, discriminator: 15)
!231 = !DILocation(line: 125, column: 5, scope: !230)
!232 = !DILocation(line: 125, column: 13, scope: !230)
!233 = !DILocation(line: 127, column: 7, scope: !200)
!234 = !DILocation(line: 128, column: 4, scope: !200)
!235 = !DILocation(line: 122, column: 17, scope: !236)
!236 = !DILexicalBlockFile(scope: !197, file: !1, discriminator: 1)
!237 = !DILocation(line: 122, column: 26, scope: !238)
!238 = !DILexicalBlockFile(scope: !197, file: !1, discriminator: 2)
!239 = !DILocation(line: 122, column: 21, scope: !236)
!240 = !DILocation(line: 136, column: 9, scope: !9)
!241 = !DILocation(line: 136, column: 2, scope: !9)
!242 = !DILocation(line: 140, column: 2, scope: !13)
!243 = !DILocation(line: 141, column: 2, scope: !13)
!244 = !DILocation(line: 142, column: 2, scope: !13)
!245 = !DILocation(line: 144, column: 6, scope: !246)
!246 = distinct !DILexicalBlock(scope: !13, file: !1, line: 144, column: 6)
!247 = !DILocation(line: 144, column: 19, scope: !246)
!248 = !DILocation(line: 144, column: 16, scope: !246)
!249 = !DILocation(line: 144, column: 6, scope: !13)
!250 = !DILocation(line: 145, column: 3, scope: !251)
!251 = distinct !DILexicalBlock(scope: !246, file: !1, line: 144, column: 31)
!252 = !DILocation(line: 146, column: 3, scope: !251)
!253 = !DILocation(line: 149, column: 5, scope: !254)
!254 = distinct !DILexicalBlock(scope: !13, file: !1, line: 149, column: 5)
!255 = !DILocation(line: 149, column: 15, scope: !254)
!256 = !DILocation(line: 149, column: 14, scope: !254)
!257 = !DILocation(line: 149, column: 5, scope: !13)
!258 = !DILocation(line: 150, column: 3, scope: !259)
!259 = distinct !DILexicalBlock(scope: !254, file: !1, line: 149, column: 23)
!260 = !DILocation(line: 151, column: 3, scope: !259)
!261 = !DILocation(line: 154, column: 66, scope: !13)
!262 = !DILocation(line: 154, column: 2, scope: !13)
!263 = !DILocation(line: 155, column: 64, scope: !13)
!264 = !DILocation(line: 155, column: 2, scope: !13)
!265 = !DILocation(line: 156, column: 1, scope: !13)
