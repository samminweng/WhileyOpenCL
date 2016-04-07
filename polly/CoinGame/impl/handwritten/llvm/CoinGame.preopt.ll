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
@Y = common global [6 x [6 x i32]] zeroinitializer, align 16
@X = common global [6 x [6 x i32]] zeroinitializer, align 16
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

for.cond1.preheader:                              ; preds = %entry.split, %for.inc137
  %indvars.iv25 = phi i32 [ 6, %entry.split ], [ %indvars.iv.next26, %for.inc137 ]
  %indvars.iv21 = phi i64 [ 0, %entry.split ], [ %indvars.iv.next22, %for.inc137 ]
  br i1 true, label %for.body3.lr.ph, label %for.cond91.preheader, !dbg !131

for.body3.lr.ph:                                  ; preds = %for.cond1.preheader
  br label %for.body3, !dbg !131

for.cond1.for.cond91.preheader_crit_edge:         ; preds = %for.inc
  br label %for.cond91.preheader, !dbg !131

for.cond91.preheader:                             ; preds = %for.cond1.for.cond91.preheader_crit_edge, %for.cond1.preheader
  br i1 true, label %for.body93.lr.ph, label %for.inc137, !dbg !136

for.body93.lr.ph:                                 ; preds = %for.cond91.preheader
  br label %for.body93, !dbg !136

for.body3:                                        ; preds = %for.body3.lr.ph, %for.inc
  %indvars.iv13 = phi i64 [ %indvars.iv21, %for.body3.lr.ph ], [ %indvars.iv.next14, %for.inc ]
  %indvars.iv = phi i64 [ 0, %for.body3.lr.ph ], [ %indvars.iv.next, %for.inc ]
  %arrayidx5 = getelementptr inbounds [6 x [6 x i32]], [6 x [6 x i32]]* @Y, i64 0, i64 %indvars.iv, i64 %indvars.iv13, !dbg !140
  store i32 0, i32* %arrayidx5, align 4, !dbg !142
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1, !dbg !131
  %cmp6 = icmp slt i64 %indvars.iv.next, 6, !dbg !143
  %cmp7 = icmp sgt i64 %indvars.iv13, 0, !dbg !145
  %or.cond = and i1 %cmp7, %cmp6, !dbg !147
  br i1 %or.cond, label %if.then, label %if.end, !dbg !147

if.then:                                          ; preds = %for.body3
  %0 = add nsw i64 %indvars.iv13, -1, !dbg !148
  %1 = add nuw nsw i64 %indvars.iv, 1, !dbg !150
  %arrayidx13 = getelementptr inbounds [6 x [6 x i32]], [6 x [6 x i32]]* @M, i64 0, i64 %1, i64 %0, !dbg !151
  %2 = load i32, i32* %arrayidx13, align 4, !dbg !151
  %arrayidx17 = getelementptr inbounds [6 x [6 x i32]], [6 x [6 x i32]]* @Y, i64 0, i64 %indvars.iv, i64 %indvars.iv13, !dbg !152
  store i32 %2, i32* %arrayidx17, align 4, !dbg !153
  br label %if.end, !dbg !154

if.end:                                           ; preds = %if.then, %for.body3
  %arrayidx21 = getelementptr inbounds [6 x [6 x i32]], [6 x [6 x i32]]* @X, i64 0, i64 %indvars.iv, i64 %indvars.iv13, !dbg !155
  store i32 0, i32* %arrayidx21, align 4, !dbg !156
  %3 = add nuw nsw i64 %indvars.iv, 2, !dbg !157
  %cmp23 = icmp slt i64 %3, 6, !dbg !159
  br i1 %cmp23, label %if.then24, label %if.end53, !dbg !160

if.then24:                                        ; preds = %if.end
  %4 = add nuw nsw i64 %indvars.iv, 2, !dbg !161
  %arrayidx29 = getelementptr inbounds [6 x [6 x i32]], [6 x [6 x i32]]* @M, i64 0, i64 %4, i64 %indvars.iv13, !dbg !163
  %5 = load i32, i32* %arrayidx29, align 4, !dbg !163
  %arrayidx33 = getelementptr inbounds [6 x [6 x i32]], [6 x [6 x i32]]* @X, i64 0, i64 %indvars.iv, i64 %indvars.iv13, !dbg !164
  store i32 %5, i32* %arrayidx33, align 4, !dbg !165
  %arrayidx37 = getelementptr inbounds [6 x [6 x i32]], [6 x [6 x i32]]* @X, i64 0, i64 %indvars.iv, i64 %indvars.iv13, !dbg !166
  %6 = load i32, i32* %arrayidx37, align 4, !dbg !166
  %arrayidx41 = getelementptr inbounds [6 x [6 x i32]], [6 x [6 x i32]]* @Y, i64 0, i64 %indvars.iv, i64 %indvars.iv13, !dbg !168
  %7 = load i32, i32* %arrayidx41, align 4, !dbg !168
  %cmp42 = icmp sgt i32 %6, %7, !dbg !169
  br i1 %cmp42, label %if.then43, label %if.end53, !dbg !170

if.then43:                                        ; preds = %if.then24
  %arrayidx47 = getelementptr inbounds [6 x [6 x i32]], [6 x [6 x i32]]* @Y, i64 0, i64 %indvars.iv, i64 %indvars.iv13, !dbg !171
  %8 = load i32, i32* %arrayidx47, align 4, !dbg !171
  %arrayidx51 = getelementptr inbounds [6 x [6 x i32]], [6 x [6 x i32]]* @X, i64 0, i64 %indvars.iv, i64 %indvars.iv13, !dbg !173
  store i32 %8, i32* %arrayidx51, align 4, !dbg !174
  br label %if.end53, !dbg !175

if.end53:                                         ; preds = %if.then24, %if.then43, %if.end
  %arrayidx57 = getelementptr inbounds [6 x [6 x i32]], [6 x [6 x i32]]* @Z, i64 0, i64 %indvars.iv, i64 %indvars.iv13, !dbg !176
  store i32 0, i32* %arrayidx57, align 4, !dbg !177
  %cmp59 = icmp sgt i64 %indvars.iv13, 1, !dbg !178
  br i1 %cmp59, label %if.then60, label %for.inc, !dbg !180

if.then60:                                        ; preds = %if.end53
  %9 = add nsw i64 %indvars.iv13, -2, !dbg !181
  %arrayidx65 = getelementptr inbounds [6 x [6 x i32]], [6 x [6 x i32]]* @M, i64 0, i64 %indvars.iv, i64 %9, !dbg !183
  %10 = load i32, i32* %arrayidx65, align 4, !dbg !183
  %arrayidx69 = getelementptr inbounds [6 x [6 x i32]], [6 x [6 x i32]]* @Z, i64 0, i64 %indvars.iv, i64 %indvars.iv13, !dbg !184
  store i32 %10, i32* %arrayidx69, align 4, !dbg !185
  %arrayidx73 = getelementptr inbounds [6 x [6 x i32]], [6 x [6 x i32]]* @Z, i64 0, i64 %indvars.iv, i64 %indvars.iv13, !dbg !186
  %11 = load i32, i32* %arrayidx73, align 4, !dbg !186
  %arrayidx77 = getelementptr inbounds [6 x [6 x i32]], [6 x [6 x i32]]* @Y, i64 0, i64 %indvars.iv, i64 %indvars.iv13, !dbg !188
  %12 = load i32, i32* %arrayidx77, align 4, !dbg !188
  %cmp78 = icmp sgt i32 %11, %12, !dbg !189
  br i1 %cmp78, label %if.then79, label %for.inc, !dbg !190

if.then79:                                        ; preds = %if.then60
  %arrayidx83 = getelementptr inbounds [6 x [6 x i32]], [6 x [6 x i32]]* @Y, i64 0, i64 %indvars.iv, i64 %indvars.iv13, !dbg !191
  %13 = load i32, i32* %arrayidx83, align 4, !dbg !191
  %arrayidx87 = getelementptr inbounds [6 x [6 x i32]], [6 x [6 x i32]]* @Z, i64 0, i64 %indvars.iv, i64 %indvars.iv13, !dbg !193
  store i32 %13, i32* %arrayidx87, align 4, !dbg !194
  br label %for.inc, !dbg !195

for.inc:                                          ; preds = %if.end53, %if.then79, %if.then60
  tail call void @llvm.dbg.value(metadata !2, i64 0, metadata !196, metadata !32), !dbg !197
  %indvars.iv.next14 = add nuw nsw i64 %indvars.iv13, 1, !dbg !131
  tail call void @llvm.dbg.value(metadata !2, i64 0, metadata !198, metadata !32), !dbg !199
  %lftr.wideiv = trunc i64 %indvars.iv.next to i32, !dbg !131
  %exitcond = icmp ne i32 %lftr.wideiv, %indvars.iv25, !dbg !131
  br i1 %exitcond, label %for.body3, label %for.cond1.for.cond91.preheader_crit_edge, !dbg !131

for.body93:                                       ; preds = %for.body93.lr.ph, %for.inc133
  %indvars.iv23 = phi i64 [ %indvars.iv21, %for.body93.lr.ph ], [ %indvars.iv.next24, %for.inc133 ]
  %indvars.iv19 = phi i64 [ 0, %for.body93.lr.ph ], [ %indvars.iv.next20, %for.inc133 ]
  %arrayidx95 = getelementptr inbounds [6 x i32], [6 x i32]* @V, i64 0, i64 %indvars.iv19, !dbg !200
  %14 = load i32, i32* %arrayidx95, align 4, !dbg !200
  %arrayidx99 = getelementptr inbounds [6 x [6 x i32]], [6 x [6 x i32]]* @X, i64 0, i64 %indvars.iv19, i64 %indvars.iv23, !dbg !203
  %15 = load i32, i32* %arrayidx99, align 4, !dbg !203
  %add100 = add nsw i32 %15, %14, !dbg !204
  %arrayidx102 = getelementptr inbounds [6 x i32], [6 x i32]* @V, i64 0, i64 %indvars.iv23, !dbg !205
  %16 = load i32, i32* %arrayidx102, align 4, !dbg !205
  %arrayidx106 = getelementptr inbounds [6 x [6 x i32]], [6 x [6 x i32]]* @Z, i64 0, i64 %indvars.iv19, i64 %indvars.iv23, !dbg !206
  %17 = load i32, i32* %arrayidx106, align 4, !dbg !206
  %add107 = add nsw i32 %17, %16, !dbg !207
  %cmp108 = icmp sgt i32 %add100, %add107, !dbg !208
  br i1 %cmp108, label %if.then109, label %if.else, !dbg !209

if.then109:                                       ; preds = %for.body93
  %arrayidx111 = getelementptr inbounds [6 x i32], [6 x i32]* @V, i64 0, i64 %indvars.iv19, !dbg !210
  %18 = load i32, i32* %arrayidx111, align 4, !dbg !210
  %arrayidx115 = getelementptr inbounds [6 x [6 x i32]], [6 x [6 x i32]]* @X, i64 0, i64 %indvars.iv19, i64 %indvars.iv23, !dbg !212
  %19 = load i32, i32* %arrayidx115, align 4, !dbg !212
  %add116 = add nsw i32 %19, %18, !dbg !213
  %arrayidx120 = getelementptr inbounds [6 x [6 x i32]], [6 x [6 x i32]]* @M, i64 0, i64 %indvars.iv19, i64 %indvars.iv23, !dbg !214
  store i32 %add116, i32* %arrayidx120, align 4, !dbg !215
  br label %for.inc133, !dbg !216

if.else:                                          ; preds = %for.body93
  %arrayidx122 = getelementptr inbounds [6 x i32], [6 x i32]* @V, i64 0, i64 %indvars.iv23, !dbg !217
  %20 = load i32, i32* %arrayidx122, align 4, !dbg !217
  %arrayidx126 = getelementptr inbounds [6 x [6 x i32]], [6 x [6 x i32]]* @Z, i64 0, i64 %indvars.iv19, i64 %indvars.iv23, !dbg !219
  %21 = load i32, i32* %arrayidx126, align 4, !dbg !219
  %add127 = add nsw i32 %21, %20, !dbg !220
  %arrayidx131 = getelementptr inbounds [6 x [6 x i32]], [6 x [6 x i32]]* @M, i64 0, i64 %indvars.iv19, i64 %indvars.iv23, !dbg !221
  store i32 %add127, i32* %arrayidx131, align 4, !dbg !222
  br label %for.inc133

for.inc133:                                       ; preds = %if.then109, %if.else
  %indvars.iv.next20 = add nuw nsw i64 %indvars.iv19, 1, !dbg !136
  tail call void @llvm.dbg.value(metadata !2, i64 0, metadata !196, metadata !32), !dbg !197
  %indvars.iv.next24 = add nuw nsw i64 %indvars.iv23, 1, !dbg !136
  tail call void @llvm.dbg.value(metadata !2, i64 0, metadata !198, metadata !32), !dbg !199
  %lftr.wideiv27 = trunc i64 %indvars.iv.next20 to i32, !dbg !136
  %exitcond28 = icmp ne i32 %lftr.wideiv27, %indvars.iv25, !dbg !136
  br i1 %exitcond28, label %for.body93, label %for.cond91.for.inc137_crit_edge, !dbg !136

for.cond91.for.inc137_crit_edge:                  ; preds = %for.inc133
  br label %for.inc137, !dbg !136

for.inc137:                                       ; preds = %for.cond91.for.inc137_crit_edge, %for.cond91.preheader
  tail call void @llvm.dbg.value(metadata !2, i64 0, metadata !126, metadata !32), !dbg !125
  %indvars.iv.next22 = add nuw nsw i64 %indvars.iv21, 1, !dbg !127
  %indvars.iv.next26 = add nsw i32 %indvars.iv25, -1, !dbg !127
  %exitcond29 = icmp ne i64 %indvars.iv.next22, 6, !dbg !127
  br i1 %exitcond29, label %for.cond1.preheader, label %for.end139, !dbg !127

for.end139:                                       ; preds = %for.inc137
  %22 = load i32, i32* getelementptr inbounds ([6 x [6 x i32]], [6 x [6 x i32]]* @M, i64 0, i64 0, i64 5), align 4, !dbg !223
  ret i32 %22, !dbg !224
}

; Function Attrs: nounwind uwtable
define i32 @main() #0 !dbg !13 {
entry:
  br label %entry.split, !dbg !225

entry.split:                                      ; preds = %entry
  %call = tail call i32 @maxMoney(), !dbg !225
  tail call void @sumMoves(), !dbg !226
  %0 = load i32, i32* @sum_alice, align 4, !dbg !227
  %1 = load i32, i32* getelementptr inbounds ([6 x [6 x i32]], [6 x [6 x i32]]* @M, i64 0, i64 0, i64 5), align 4, !dbg !229
  %cmp = icmp eq i32 %0, %1, !dbg !230
  br i1 %cmp, label %if.end, label %if.then, !dbg !231

if.then:                                          ; preds = %entry.split
  %call1 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([24 x i8], [24 x i8]* @.str.6, i64 0, i64 0)) #4, !dbg !232
  tail call void @exit(i32 -1) #5, !dbg !234
  unreachable, !dbg !234

if.end:                                           ; preds = %entry.split
  %2 = load i32, i32* @sum_alice, align 4, !dbg !235
  %3 = load i32, i32* @sum_bob, align 4, !dbg !237
  %cmp2 = icmp slt i32 %2, %3, !dbg !238
  br i1 %cmp2, label %if.then3, label %if.end5, !dbg !239

if.then3:                                         ; preds = %if.end
  %call4 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([28 x i8], [28 x i8]* @.str.7, i64 0, i64 0)) #4, !dbg !240
  tail call void @exit(i32 -1) #5, !dbg !242
  unreachable, !dbg !242

if.end5:                                          ; preds = %if.end
  %4 = load i32, i32* @sum_alice, align 4, !dbg !243
  %call6 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([54 x i8], [54 x i8]* @.str.8, i64 0, i64 0), i32 %4) #4, !dbg !244
  %5 = load i32, i32* @sum_bob, align 4, !dbg !245
  %call7 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([52 x i8], [52 x i8]* @.str.9, i64 0, i64 0), i32 %5) #4, !dbg !246
  ret i32 0, !dbg !247
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
!30 = !DILocation(line: 28, column: 2, scope: !4)
!31 = !DILocalVariable(name: "i", scope: !4, file: !1, line: 26, type: !12)
!32 = !DIExpression()
!33 = !DILocation(line: 26, column: 6, scope: !4)
!34 = !DILocation(line: 29, column: 2, scope: !35)
!35 = !DILexicalBlockFile(scope: !36, file: !1, discriminator: 1)
!36 = distinct !DILexicalBlock(scope: !37, file: !1, line: 29, column: 2)
!37 = distinct !DILexicalBlock(scope: !4, file: !1, line: 29, column: 2)
!38 = !DILocation(line: 30, column: 3, scope: !39)
!39 = distinct !DILexicalBlock(scope: !36, file: !1, line: 29, column: 26)
!40 = !DILocation(line: 30, column: 8, scope: !39)
!41 = !DILocation(line: 32, column: 1, scope: !4)
!42 = !DILocation(line: 35, column: 6, scope: !7)
!43 = !DILocalVariable(name: "i", scope: !7, file: !1, line: 35, type: !12)
!44 = !DILocalVariable(name: "j", scope: !7, file: !1, line: 35, type: !12)
!45 = !DILocation(line: 35, column: 13, scope: !7)
!46 = !DILocalVariable(name: "alice", scope: !7, file: !1, line: 36, type: !12)
!47 = !DILocation(line: 36, column: 6, scope: !7)
!48 = !DILocation(line: 37, column: 2, scope: !49)
!49 = !DILexicalBlockFile(scope: !7, file: !1, discriminator: 1)
!50 = !DILocation(line: 38, column: 12, scope: !51)
!51 = distinct !DILexicalBlock(scope: !7, file: !1, line: 37, column: 17)
!52 = !DILocation(line: 38, column: 16, scope: !51)
!53 = !DILocalVariable(name: "P1", scope: !51, file: !1, line: 38, type: !12)
!54 = !DILocation(line: 38, column: 7, scope: !51)
!55 = !DILocation(line: 39, column: 19, scope: !51)
!56 = !DILocation(line: 39, column: 12, scope: !51)
!57 = !DILocalVariable(name: "P2", scope: !51, file: !1, line: 39, type: !12)
!58 = !DILocation(line: 39, column: 7, scope: !51)
!59 = !DILocation(line: 41, column: 10, scope: !60)
!60 = distinct !DILexicalBlock(scope: !51, file: !1, line: 41, column: 7)
!61 = !DILocation(line: 41, column: 7, scope: !51)
!62 = !DILocation(line: 43, column: 11, scope: !63)
!63 = distinct !DILexicalBlock(scope: !60, file: !1, line: 41, column: 17)
!64 = !DILocation(line: 50, column: 7, scope: !65)
!65 = distinct !DILexicalBlock(scope: !51, file: !1, line: 50, column: 7)
!66 = !DILocation(line: 50, column: 7, scope: !51)
!67 = !DILocation(line: 51, column: 14, scope: !68)
!68 = distinct !DILexicalBlock(scope: !65, file: !1, line: 50, column: 14)
!69 = !DILocation(line: 53, column: 3, scope: !68)
!70 = !DILocation(line: 54, column: 12, scope: !71)
!71 = distinct !DILexicalBlock(scope: !65, file: !1, line: 53, column: 10)
!72 = !DILocation(line: 37, column: 11, scope: !49)
!73 = !DILocation(line: 59, column: 1, scope: !7)
!74 = !DILocation(line: 63, column: 6, scope: !8)
!75 = !DILocalVariable(name: "i", scope: !8, file: !1, line: 63, type: !12)
!76 = !DILocalVariable(name: "j", scope: !8, file: !1, line: 63, type: !12)
!77 = !DILocation(line: 63, column: 13, scope: !8)
!78 = !DILocalVariable(name: "alice", scope: !8, file: !1, line: 64, type: !79)
!79 = !DIBasicType(name: "_Bool", size: 8, align: 8, encoding: DW_ATE_boolean)
!80 = !DILocation(line: 64, column: 7, scope: !8)
!81 = !DILocation(line: 65, column: 2, scope: !82)
!82 = !DILexicalBlockFile(scope: !8, file: !1, discriminator: 1)
!83 = !DILocation(line: 66, column: 12, scope: !84)
!84 = distinct !DILexicalBlock(scope: !8, file: !1, line: 65, column: 17)
!85 = !DILocation(line: 66, column: 16, scope: !84)
!86 = !DILocalVariable(name: "P1", scope: !84, file: !1, line: 66, type: !12)
!87 = !DILocation(line: 66, column: 7, scope: !84)
!88 = !DILocation(line: 67, column: 19, scope: !84)
!89 = !DILocation(line: 67, column: 12, scope: !84)
!90 = !DILocalVariable(name: "P2", scope: !84, file: !1, line: 67, type: !12)
!91 = !DILocation(line: 67, column: 7, scope: !84)
!92 = !DILocation(line: 68, column: 7, scope: !93)
!93 = distinct !DILexicalBlock(scope: !84, file: !1, line: 68, column: 7)
!94 = !DILocation(line: 68, column: 7, scope: !84)
!95 = !DILocation(line: 69, column: 4, scope: !96)
!96 = distinct !DILexicalBlock(scope: !93, file: !1, line: 68, column: 14)
!97 = !DILocation(line: 70, column: 3, scope: !96)
!98 = !DILocation(line: 71, column: 4, scope: !99)
!99 = distinct !DILexicalBlock(scope: !93, file: !1, line: 70, column: 10)
!100 = !DILocation(line: 74, column: 10, scope: !101)
!101 = distinct !DILexicalBlock(scope: !84, file: !1, line: 74, column: 7)
!102 = !DILocation(line: 74, column: 7, scope: !84)
!103 = !DILocation(line: 75, column: 26, scope: !104)
!104 = distinct !DILexicalBlock(scope: !101, file: !1, line: 74, column: 17)
!105 = !DILocation(line: 75, column: 31, scope: !104)
!106 = !DILocation(line: 75, column: 4, scope: !104)
!107 = !DILocation(line: 76, column: 5, scope: !104)
!108 = !DILocation(line: 77, column: 3, scope: !104)
!109 = !DILocation(line: 78, column: 26, scope: !110)
!110 = distinct !DILexicalBlock(scope: !101, file: !1, line: 77, column: 10)
!111 = !DILocation(line: 78, column: 31, scope: !110)
!112 = !DILocation(line: 78, column: 4, scope: !110)
!113 = !DILocation(line: 79, column: 5, scope: !110)
!114 = !DILocation(line: 81, column: 7, scope: !115)
!115 = distinct !DILexicalBlock(scope: !84, file: !1, line: 81, column: 7)
!116 = !DILocation(line: 81, column: 7, scope: !84)
!117 = !DILocation(line: 82, column: 4, scope: !118)
!118 = distinct !DILexicalBlock(scope: !115, file: !1, line: 81, column: 14)
!119 = !DILocation(line: 83, column: 3, scope: !118)
!120 = !DILocation(line: 84, column: 4, scope: !121)
!121 = distinct !DILexicalBlock(scope: !115, file: !1, line: 83, column: 10)
!122 = !DILocation(line: 86, column: 9, scope: !84)
!123 = !DILocation(line: 65, column: 11, scope: !82)
!124 = !DILocation(line: 89, column: 1, scope: !8)
!125 = !DILocation(line: 92, column: 6, scope: !9)
!126 = !DILocalVariable(name: "s", scope: !9, file: !1, line: 92, type: !12)
!127 = !DILocation(line: 93, column: 2, scope: !128)
!128 = !DILexicalBlockFile(scope: !129, file: !1, discriminator: 1)
!129 = distinct !DILexicalBlock(scope: !130, file: !1, line: 93, column: 2)
!130 = distinct !DILexicalBlock(scope: !9, file: !1, line: 93, column: 2)
!131 = !DILocation(line: 95, column: 3, scope: !132)
!132 = !DILexicalBlockFile(scope: !133, file: !1, discriminator: 1)
!133 = distinct !DILexicalBlock(scope: !134, file: !1, line: 95, column: 3)
!134 = distinct !DILexicalBlock(scope: !135, file: !1, line: 95, column: 3)
!135 = distinct !DILexicalBlock(scope: !129, file: !1, line: 93, column: 26)
!136 = !DILocation(line: 123, column: 3, scope: !137)
!137 = !DILexicalBlockFile(scope: !138, file: !1, discriminator: 1)
!138 = distinct !DILexicalBlock(scope: !139, file: !1, line: 123, column: 3)
!139 = distinct !DILexicalBlock(scope: !135, file: !1, line: 123, column: 3)
!140 = !DILocation(line: 99, column: 4, scope: !141)
!141 = distinct !DILexicalBlock(scope: !133, file: !1, line: 95, column: 39)
!142 = !DILocation(line: 99, column: 12, scope: !141)
!143 = !DILocation(line: 100, column: 14, scope: !144)
!144 = distinct !DILexicalBlock(scope: !141, file: !1, line: 100, column: 8)
!145 = !DILocation(line: 100, column: 27, scope: !146)
!146 = !DILexicalBlockFile(scope: !144, file: !1, discriminator: 1)
!147 = !DILocation(line: 100, column: 18, scope: !144)
!148 = !DILocation(line: 101, column: 26, scope: !149)
!149 = distinct !DILexicalBlock(scope: !144, file: !1, line: 100, column: 33)
!150 = !DILocation(line: 101, column: 19, scope: !149)
!151 = !DILocation(line: 101, column: 15, scope: !149)
!152 = !DILocation(line: 101, column: 5, scope: !149)
!153 = !DILocation(line: 101, column: 13, scope: !149)
!154 = !DILocation(line: 102, column: 4, scope: !149)
!155 = !DILocation(line: 104, column: 4, scope: !141)
!156 = !DILocation(line: 104, column: 12, scope: !141)
!157 = !DILocation(line: 105, column: 10, scope: !158)
!158 = distinct !DILexicalBlock(scope: !141, file: !1, line: 105, column: 8)
!159 = !DILocation(line: 105, column: 14, scope: !158)
!160 = !DILocation(line: 105, column: 8, scope: !141)
!161 = !DILocation(line: 106, column: 19, scope: !162)
!162 = distinct !DILexicalBlock(scope: !158, file: !1, line: 105, column: 19)
!163 = !DILocation(line: 106, column: 15, scope: !162)
!164 = !DILocation(line: 106, column: 5, scope: !162)
!165 = !DILocation(line: 106, column: 13, scope: !162)
!166 = !DILocation(line: 107, column: 9, scope: !167)
!167 = distinct !DILexicalBlock(scope: !162, file: !1, line: 107, column: 9)
!168 = !DILocation(line: 107, column: 19, scope: !167)
!169 = !DILocation(line: 107, column: 17, scope: !167)
!170 = !DILocation(line: 107, column: 9, scope: !162)
!171 = !DILocation(line: 108, column: 16, scope: !172)
!172 = distinct !DILexicalBlock(scope: !167, file: !1, line: 107, column: 28)
!173 = !DILocation(line: 108, column: 6, scope: !172)
!174 = !DILocation(line: 108, column: 14, scope: !172)
!175 = !DILocation(line: 109, column: 5, scope: !172)
!176 = !DILocation(line: 112, column: 4, scope: !141)
!177 = !DILocation(line: 112, column: 12, scope: !141)
!178 = !DILocation(line: 113, column: 14, scope: !179)
!179 = distinct !DILexicalBlock(scope: !141, file: !1, line: 113, column: 8)
!180 = !DILocation(line: 113, column: 8, scope: !141)
!181 = !DILocation(line: 114, column: 22, scope: !182)
!182 = distinct !DILexicalBlock(scope: !179, file: !1, line: 113, column: 19)
!183 = !DILocation(line: 114, column: 15, scope: !182)
!184 = !DILocation(line: 114, column: 5, scope: !182)
!185 = !DILocation(line: 114, column: 13, scope: !182)
!186 = !DILocation(line: 115, column: 9, scope: !187)
!187 = distinct !DILexicalBlock(scope: !182, file: !1, line: 115, column: 9)
!188 = !DILocation(line: 115, column: 19, scope: !187)
!189 = !DILocation(line: 115, column: 17, scope: !187)
!190 = !DILocation(line: 115, column: 9, scope: !182)
!191 = !DILocation(line: 116, column: 16, scope: !192)
!192 = distinct !DILexicalBlock(scope: !187, file: !1, line: 115, column: 28)
!193 = !DILocation(line: 116, column: 6, scope: !192)
!194 = !DILocation(line: 116, column: 14, scope: !192)
!195 = !DILocation(line: 117, column: 5, scope: !192)
!196 = !DILocalVariable(name: "i", scope: !9, file: !1, line: 92, type: !12)
!197 = !DILocation(line: 92, column: 9, scope: !9)
!198 = !DILocalVariable(name: "j", scope: !9, file: !1, line: 92, type: !12)
!199 = !DILocation(line: 92, column: 12, scope: !9)
!200 = !DILocation(line: 127, column: 8, scope: !201)
!201 = distinct !DILexicalBlock(scope: !202, file: !1, line: 127, column: 8)
!202 = distinct !DILexicalBlock(scope: !138, file: !1, line: 123, column: 39)
!203 = !DILocation(line: 127, column: 15, scope: !201)
!204 = !DILocation(line: 127, column: 13, scope: !201)
!205 = !DILocation(line: 127, column: 25, scope: !201)
!206 = !DILocation(line: 127, column: 32, scope: !201)
!207 = !DILocation(line: 127, column: 30, scope: !201)
!208 = !DILocation(line: 127, column: 23, scope: !201)
!209 = !DILocation(line: 127, column: 8, scope: !202)
!210 = !DILocation(line: 128, column: 15, scope: !211)
!211 = distinct !DILexicalBlock(scope: !201, file: !1, line: 127, column: 41)
!212 = !DILocation(line: 128, column: 22, scope: !211)
!213 = !DILocation(line: 128, column: 20, scope: !211)
!214 = !DILocation(line: 128, column: 5, scope: !211)
!215 = !DILocation(line: 128, column: 13, scope: !211)
!216 = !DILocation(line: 129, column: 4, scope: !211)
!217 = !DILocation(line: 130, column: 15, scope: !218)
!218 = distinct !DILexicalBlock(scope: !201, file: !1, line: 129, column: 11)
!219 = !DILocation(line: 130, column: 22, scope: !218)
!220 = !DILocation(line: 130, column: 20, scope: !218)
!221 = !DILocation(line: 130, column: 5, scope: !218)
!222 = !DILocation(line: 130, column: 13, scope: !218)
!223 = !DILocation(line: 140, column: 9, scope: !9)
!224 = !DILocation(line: 140, column: 2, scope: !9)
!225 = !DILocation(line: 144, column: 2, scope: !13)
!226 = !DILocation(line: 145, column: 2, scope: !13)
!227 = !DILocation(line: 148, column: 6, scope: !228)
!228 = distinct !DILexicalBlock(scope: !13, file: !1, line: 148, column: 6)
!229 = !DILocation(line: 148, column: 19, scope: !228)
!230 = !DILocation(line: 148, column: 16, scope: !228)
!231 = !DILocation(line: 148, column: 6, scope: !13)
!232 = !DILocation(line: 149, column: 3, scope: !233)
!233 = distinct !DILexicalBlock(scope: !228, file: !1, line: 148, column: 32)
!234 = !DILocation(line: 150, column: 3, scope: !233)
!235 = !DILocation(line: 153, column: 6, scope: !236)
!236 = distinct !DILexicalBlock(scope: !13, file: !1, line: 153, column: 6)
!237 = !DILocation(line: 153, column: 18, scope: !236)
!238 = !DILocation(line: 153, column: 16, scope: !236)
!239 = !DILocation(line: 153, column: 6, scope: !13)
!240 = !DILocation(line: 154, column: 3, scope: !241)
!241 = distinct !DILexicalBlock(scope: !236, file: !1, line: 153, column: 27)
!242 = !DILocation(line: 155, column: 3, scope: !241)
!243 = !DILocation(line: 158, column: 67, scope: !13)
!244 = !DILocation(line: 158, column: 2, scope: !13)
!245 = !DILocation(line: 159, column: 65, scope: !13)
!246 = !DILocation(line: 159, column: 2, scope: !13)
!247 = !DILocation(line: 160, column: 1, scope: !13)
