; ModuleID = 'CoinGame.preopt.s'
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
define void @play() #0 !dbg !7 {
entry:
  br label %entry.split, !dbg !42

entry.split:                                      ; preds = %entry
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !43, metadata !32), !dbg !42
  tail call void @llvm.dbg.value(metadata i32 5, i64 0, metadata !44, metadata !32), !dbg !45
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !46, metadata !32), !dbg !47
  br label %for.body, !dbg !48

for.cond17.preheader:                             ; preds = %for.inc
  br label %for.body19, !dbg !52

for.body:                                         ; preds = %entry.split, %for.inc
  %indvars.iv7 = phi i64 [ 0, %entry.split ], [ %indvars.iv.next8, %for.inc ]
  %i.06 = phi i32 [ 0, %entry.split ], [ %i.1, %for.inc ]
  %j.05 = phi i32 [ 5, %entry.split ], [ %j.1, %for.inc ]
  %idxprom = sext i32 %j.05 to i64, !dbg !56
  %add = add nsw i32 %i.06, 1, !dbg !59
  %idxprom1 = sext i32 %add to i64, !dbg !56
  %arrayidx2 = getelementptr inbounds [6 x [6 x i32]], [6 x [6 x i32]]* @M, i64 0, i64 %idxprom1, i64 %idxprom, !dbg !56
  %0 = load i32, i32* %arrayidx2, align 4, !dbg !56
  %sub = add nsw i32 %j.05, -1, !dbg !60
  %idxprom3 = sext i32 %sub to i64, !dbg !61
  %idxprom4 = sext i32 %i.06 to i64, !dbg !61
  %arrayidx6 = getelementptr inbounds [6 x [6 x i32]], [6 x [6 x i32]]* @M, i64 0, i64 %idxprom4, i64 %idxprom3, !dbg !61
  %1 = load i32, i32* %arrayidx6, align 4, !dbg !61
  %cmp7 = icmp sgt i32 %0, %1, !dbg !62
  br i1 %cmp7, label %if.else, label %if.then, !dbg !63

if.then:                                          ; preds = %for.body
  %idxprom8 = sext i32 %i.06 to i64, !dbg !64
  %arrayidx9 = getelementptr inbounds [6 x i32], [6 x i32]* @V, i64 0, i64 %idxprom8, !dbg !64
  %2 = load i32, i32* %arrayidx9, align 4, !dbg !64
  %arrayidx11 = getelementptr inbounds [6 x i32], [6 x i32]* @coins, i64 0, i64 %indvars.iv7, !dbg !66
  store i32 %2, i32* %arrayidx11, align 4, !dbg !67
  %inc = add nsw i32 %i.06, 1, !dbg !68
  tail call void @llvm.dbg.value(metadata i32 %inc, i64 0, metadata !43, metadata !32), !dbg !42
  br label %for.inc, !dbg !69

if.else:                                          ; preds = %for.body
  %idxprom12 = sext i32 %j.05 to i64, !dbg !70
  %arrayidx13 = getelementptr inbounds [6 x i32], [6 x i32]* @V, i64 0, i64 %idxprom12, !dbg !70
  %3 = load i32, i32* %arrayidx13, align 4, !dbg !70
  %arrayidx15 = getelementptr inbounds [6 x i32], [6 x i32]* @coins, i64 0, i64 %indvars.iv7, !dbg !72
  store i32 %3, i32* %arrayidx15, align 4, !dbg !73
  %dec = add nsw i32 %j.05, -1, !dbg !74
  tail call void @llvm.dbg.value(metadata i32 %dec, i64 0, metadata !44, metadata !32), !dbg !45
  br label %for.inc

for.inc:                                          ; preds = %if.then, %if.else
  %j.1 = phi i32 [ %j.05, %if.then ], [ %dec, %if.else ]
  %i.1 = phi i32 [ %inc, %if.then ], [ %i.06, %if.else ]
  %indvars.iv.next8 = add nuw nsw i64 %indvars.iv7, 1, !dbg !48
  tail call void @llvm.dbg.value(metadata !2, i64 0, metadata !46, metadata !32), !dbg !47
  %exitcond9 = icmp ne i64 %indvars.iv.next8, 6, !dbg !48
  br i1 %exitcond9, label %for.body, label %for.cond17.preheader, !dbg !48

for.body19:                                       ; preds = %for.cond17.preheader, %for.inc42
  %indvars.iv = phi i64 [ 0, %for.cond17.preheader ], [ %indvars.iv.next, %for.inc42 ]
  %4 = trunc i64 %indvars.iv to i32, !dbg !75
  %rem1 = and i32 %4, 1, !dbg !75
  %cmp20 = icmp eq i32 %rem1, 0, !dbg !75
  br i1 %cmp20, label %if.then21, label %if.else22, !dbg !78

if.then21:                                        ; preds = %for.body19
  %call = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.1, i64 0, i64 0)) #4, !dbg !79
  br label %if.end24, !dbg !81

if.else22:                                        ; preds = %for.body19
  %call23 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0)) #4, !dbg !82
  br label %if.end24

if.end24:                                         ; preds = %if.else22, %if.then21
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1, !dbg !52
  %arrayidx27 = getelementptr inbounds [6 x i32], [6 x i32]* @coins, i64 0, i64 %indvars.iv, !dbg !84
  %5 = load i32, i32* %arrayidx27, align 4, !dbg !84
  %6 = trunc i64 %indvars.iv.next to i32, !dbg !85
  %call28 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.3, i64 0, i64 0), i32 %6, i32 %5) #4, !dbg !85
  %7 = trunc i64 %indvars.iv to i32, !dbg !86
  %rem292 = and i32 %7, 1, !dbg !86
  %cmp30 = icmp eq i32 %rem292, 0, !dbg !86
  %arrayidx33 = getelementptr inbounds [6 x i32], [6 x i32]* @coins, i64 0, i64 %indvars.iv, !dbg !88
  %8 = load i32, i32* %arrayidx33, align 4, !dbg !88
  br i1 %cmp30, label %if.then31, label %if.else36, !dbg !90

if.then31:                                        ; preds = %if.end24
  %9 = load i32, i32* @sum_alice, align 4, !dbg !91
  %add34 = add nsw i32 %9, %8, !dbg !91
  store i32 %add34, i32* @sum_alice, align 4, !dbg !91
  %call35 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.4, i64 0, i64 0)) #4, !dbg !92
  br label %for.inc42, !dbg !93

if.else36:                                        ; preds = %if.end24
  %10 = load i32, i32* @sum_bob, align 4, !dbg !94
  %add39 = add nsw i32 %10, %8, !dbg !94
  store i32 %add39, i32* @sum_bob, align 4, !dbg !94
  %puts = tail call i32 @puts(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @str, i64 0, i64 0)), !dbg !96
  br label %for.inc42

for.inc42:                                        ; preds = %if.then31, %if.else36
  tail call void @llvm.dbg.value(metadata !2, i64 0, metadata !43, metadata !32), !dbg !42
  %exitcond = icmp ne i64 %indvars.iv.next, 6, !dbg !52
  br i1 %exitcond, label %for.body19, label %for.end44, !dbg !52

for.end44:                                        ; preds = %for.inc42
  ret void, !dbg !97
}

; Function Attrs: nounwind uwtable
define i32 @findMoves() #0 !dbg !8 {
entry:
  br label %entry.split, !dbg !98

entry.split:                                      ; preds = %entry
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !99, metadata !32), !dbg !98
  br label %for.cond1.preheader, !dbg !100

for.cond1.preheader:                              ; preds = %entry.split, %for.inc137
  %indvars.iv25 = phi i32 [ 6, %entry.split ], [ %indvars.iv.next26, %for.inc137 ]
  %indvars.iv21 = phi i64 [ 0, %entry.split ], [ %indvars.iv.next22, %for.inc137 ]
  br i1 true, label %for.body3.lr.ph, label %for.cond91.preheader, !dbg !104

for.body3.lr.ph:                                  ; preds = %for.cond1.preheader
  br label %for.body3, !dbg !104

for.cond1.for.cond91.preheader_crit_edge:         ; preds = %for.inc
  br label %for.cond91.preheader, !dbg !104

for.cond91.preheader:                             ; preds = %for.cond1.for.cond91.preheader_crit_edge, %for.cond1.preheader
  br i1 true, label %for.body93.lr.ph, label %for.inc137, !dbg !109

for.body93.lr.ph:                                 ; preds = %for.cond91.preheader
  br label %for.body93, !dbg !109

for.body3:                                        ; preds = %for.body3.lr.ph, %for.inc
  %indvars.iv13 = phi i64 [ %indvars.iv21, %for.body3.lr.ph ], [ %indvars.iv.next14, %for.inc ]
  %indvars.iv = phi i64 [ 0, %for.body3.lr.ph ], [ %indvars.iv.next, %for.inc ]
  %arrayidx5 = getelementptr inbounds [6 x [6 x i32]], [6 x [6 x i32]]* @Y, i64 0, i64 %indvars.iv, i64 %indvars.iv13, !dbg !113
  store i32 0, i32* %arrayidx5, align 4, !dbg !115
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1, !dbg !104
  %cmp6 = icmp slt i64 %indvars.iv.next, 6, !dbg !116
  %cmp7 = icmp sgt i64 %indvars.iv13, 0, !dbg !118
  %or.cond = and i1 %cmp7, %cmp6, !dbg !120
  br i1 %or.cond, label %if.then, label %if.end, !dbg !120

if.then:                                          ; preds = %for.body3
  %0 = add nsw i64 %indvars.iv13, -1, !dbg !121
  %1 = add nuw nsw i64 %indvars.iv, 1, !dbg !123
  %arrayidx13 = getelementptr inbounds [6 x [6 x i32]], [6 x [6 x i32]]* @M, i64 0, i64 %1, i64 %0, !dbg !124
  %2 = load i32, i32* %arrayidx13, align 4, !dbg !124
  %arrayidx17 = getelementptr inbounds [6 x [6 x i32]], [6 x [6 x i32]]* @Y, i64 0, i64 %indvars.iv, i64 %indvars.iv13, !dbg !125
  store i32 %2, i32* %arrayidx17, align 4, !dbg !126
  br label %if.end, !dbg !127

if.end:                                           ; preds = %if.then, %for.body3
  %arrayidx21 = getelementptr inbounds [6 x [6 x i32]], [6 x [6 x i32]]* @X, i64 0, i64 %indvars.iv, i64 %indvars.iv13, !dbg !128
  store i32 0, i32* %arrayidx21, align 4, !dbg !129
  %3 = add nuw nsw i64 %indvars.iv, 2, !dbg !130
  %cmp23 = icmp slt i64 %3, 6, !dbg !132
  br i1 %cmp23, label %if.then24, label %if.end53, !dbg !133

if.then24:                                        ; preds = %if.end
  %4 = add nuw nsw i64 %indvars.iv, 2, !dbg !134
  %arrayidx29 = getelementptr inbounds [6 x [6 x i32]], [6 x [6 x i32]]* @M, i64 0, i64 %4, i64 %indvars.iv13, !dbg !136
  %5 = load i32, i32* %arrayidx29, align 4, !dbg !136
  %arrayidx33 = getelementptr inbounds [6 x [6 x i32]], [6 x [6 x i32]]* @X, i64 0, i64 %indvars.iv, i64 %indvars.iv13, !dbg !137
  store i32 %5, i32* %arrayidx33, align 4, !dbg !138
  %arrayidx37 = getelementptr inbounds [6 x [6 x i32]], [6 x [6 x i32]]* @X, i64 0, i64 %indvars.iv, i64 %indvars.iv13, !dbg !139
  %6 = load i32, i32* %arrayidx37, align 4, !dbg !139
  %arrayidx41 = getelementptr inbounds [6 x [6 x i32]], [6 x [6 x i32]]* @Y, i64 0, i64 %indvars.iv, i64 %indvars.iv13, !dbg !141
  %7 = load i32, i32* %arrayidx41, align 4, !dbg !141
  %cmp42 = icmp sgt i32 %6, %7, !dbg !142
  br i1 %cmp42, label %if.then43, label %if.end53, !dbg !143

if.then43:                                        ; preds = %if.then24
  %arrayidx47 = getelementptr inbounds [6 x [6 x i32]], [6 x [6 x i32]]* @Y, i64 0, i64 %indvars.iv, i64 %indvars.iv13, !dbg !144
  %8 = load i32, i32* %arrayidx47, align 4, !dbg !144
  %arrayidx51 = getelementptr inbounds [6 x [6 x i32]], [6 x [6 x i32]]* @X, i64 0, i64 %indvars.iv, i64 %indvars.iv13, !dbg !146
  store i32 %8, i32* %arrayidx51, align 4, !dbg !147
  br label %if.end53, !dbg !148

if.end53:                                         ; preds = %if.then24, %if.then43, %if.end
  %arrayidx57 = getelementptr inbounds [6 x [6 x i32]], [6 x [6 x i32]]* @Z, i64 0, i64 %indvars.iv, i64 %indvars.iv13, !dbg !149
  store i32 0, i32* %arrayidx57, align 4, !dbg !150
  %cmp59 = icmp sgt i64 %indvars.iv13, 1, !dbg !151
  br i1 %cmp59, label %if.then60, label %for.inc, !dbg !153

if.then60:                                        ; preds = %if.end53
  %9 = add nsw i64 %indvars.iv13, -2, !dbg !154
  %arrayidx65 = getelementptr inbounds [6 x [6 x i32]], [6 x [6 x i32]]* @M, i64 0, i64 %indvars.iv, i64 %9, !dbg !156
  %10 = load i32, i32* %arrayidx65, align 4, !dbg !156
  %arrayidx69 = getelementptr inbounds [6 x [6 x i32]], [6 x [6 x i32]]* @Z, i64 0, i64 %indvars.iv, i64 %indvars.iv13, !dbg !157
  store i32 %10, i32* %arrayidx69, align 4, !dbg !158
  %arrayidx73 = getelementptr inbounds [6 x [6 x i32]], [6 x [6 x i32]]* @Z, i64 0, i64 %indvars.iv, i64 %indvars.iv13, !dbg !159
  %11 = load i32, i32* %arrayidx73, align 4, !dbg !159
  %arrayidx77 = getelementptr inbounds [6 x [6 x i32]], [6 x [6 x i32]]* @Y, i64 0, i64 %indvars.iv, i64 %indvars.iv13, !dbg !161
  %12 = load i32, i32* %arrayidx77, align 4, !dbg !161
  %cmp78 = icmp sgt i32 %11, %12, !dbg !162
  br i1 %cmp78, label %if.then79, label %for.inc, !dbg !163

if.then79:                                        ; preds = %if.then60
  %arrayidx83 = getelementptr inbounds [6 x [6 x i32]], [6 x [6 x i32]]* @Y, i64 0, i64 %indvars.iv, i64 %indvars.iv13, !dbg !164
  %13 = load i32, i32* %arrayidx83, align 4, !dbg !164
  %arrayidx87 = getelementptr inbounds [6 x [6 x i32]], [6 x [6 x i32]]* @Z, i64 0, i64 %indvars.iv, i64 %indvars.iv13, !dbg !166
  store i32 %13, i32* %arrayidx87, align 4, !dbg !167
  br label %for.inc, !dbg !168

for.inc:                                          ; preds = %if.end53, %if.then79, %if.then60
  tail call void @llvm.dbg.value(metadata !2, i64 0, metadata !169, metadata !32), !dbg !170
  %indvars.iv.next14 = add nuw nsw i64 %indvars.iv13, 1, !dbg !104
  tail call void @llvm.dbg.value(metadata !2, i64 0, metadata !171, metadata !32), !dbg !172
  %lftr.wideiv = trunc i64 %indvars.iv.next to i32, !dbg !104
  %exitcond = icmp ne i32 %lftr.wideiv, %indvars.iv25, !dbg !104
  br i1 %exitcond, label %for.body3, label %for.cond1.for.cond91.preheader_crit_edge, !dbg !104

for.body93:                                       ; preds = %for.body93.lr.ph, %for.inc133
  %indvars.iv23 = phi i64 [ %indvars.iv21, %for.body93.lr.ph ], [ %indvars.iv.next24, %for.inc133 ]
  %indvars.iv19 = phi i64 [ 0, %for.body93.lr.ph ], [ %indvars.iv.next20, %for.inc133 ]
  %arrayidx95 = getelementptr inbounds [6 x i32], [6 x i32]* @V, i64 0, i64 %indvars.iv19, !dbg !173
  %14 = load i32, i32* %arrayidx95, align 4, !dbg !173
  %arrayidx99 = getelementptr inbounds [6 x [6 x i32]], [6 x [6 x i32]]* @X, i64 0, i64 %indvars.iv19, i64 %indvars.iv23, !dbg !176
  %15 = load i32, i32* %arrayidx99, align 4, !dbg !176
  %add100 = add nsw i32 %15, %14, !dbg !177
  %arrayidx102 = getelementptr inbounds [6 x i32], [6 x i32]* @V, i64 0, i64 %indvars.iv23, !dbg !178
  %16 = load i32, i32* %arrayidx102, align 4, !dbg !178
  %arrayidx106 = getelementptr inbounds [6 x [6 x i32]], [6 x [6 x i32]]* @Z, i64 0, i64 %indvars.iv19, i64 %indvars.iv23, !dbg !179
  %17 = load i32, i32* %arrayidx106, align 4, !dbg !179
  %add107 = add nsw i32 %17, %16, !dbg !180
  %cmp108 = icmp sgt i32 %add100, %add107, !dbg !181
  br i1 %cmp108, label %if.then109, label %if.else, !dbg !182

if.then109:                                       ; preds = %for.body93
  %arrayidx111 = getelementptr inbounds [6 x i32], [6 x i32]* @V, i64 0, i64 %indvars.iv19, !dbg !183
  %18 = load i32, i32* %arrayidx111, align 4, !dbg !183
  %arrayidx115 = getelementptr inbounds [6 x [6 x i32]], [6 x [6 x i32]]* @X, i64 0, i64 %indvars.iv19, i64 %indvars.iv23, !dbg !185
  %19 = load i32, i32* %arrayidx115, align 4, !dbg !185
  %add116 = add nsw i32 %19, %18, !dbg !186
  %arrayidx120 = getelementptr inbounds [6 x [6 x i32]], [6 x [6 x i32]]* @M, i64 0, i64 %indvars.iv19, i64 %indvars.iv23, !dbg !187
  store i32 %add116, i32* %arrayidx120, align 4, !dbg !188
  br label %for.inc133, !dbg !189

if.else:                                          ; preds = %for.body93
  %arrayidx122 = getelementptr inbounds [6 x i32], [6 x i32]* @V, i64 0, i64 %indvars.iv23, !dbg !190
  %20 = load i32, i32* %arrayidx122, align 4, !dbg !190
  %arrayidx126 = getelementptr inbounds [6 x [6 x i32]], [6 x [6 x i32]]* @Z, i64 0, i64 %indvars.iv19, i64 %indvars.iv23, !dbg !192
  %21 = load i32, i32* %arrayidx126, align 4, !dbg !192
  %add127 = add nsw i32 %21, %20, !dbg !193
  %arrayidx131 = getelementptr inbounds [6 x [6 x i32]], [6 x [6 x i32]]* @M, i64 0, i64 %indvars.iv19, i64 %indvars.iv23, !dbg !194
  store i32 %add127, i32* %arrayidx131, align 4, !dbg !195
  br label %for.inc133

for.inc133:                                       ; preds = %if.then109, %if.else
  %indvars.iv.next20 = add nuw nsw i64 %indvars.iv19, 1, !dbg !109
  tail call void @llvm.dbg.value(metadata !2, i64 0, metadata !169, metadata !32), !dbg !170
  %indvars.iv.next24 = add nuw nsw i64 %indvars.iv23, 1, !dbg !109
  tail call void @llvm.dbg.value(metadata !2, i64 0, metadata !171, metadata !32), !dbg !172
  %lftr.wideiv27 = trunc i64 %indvars.iv.next20 to i32, !dbg !109
  %exitcond28 = icmp ne i32 %lftr.wideiv27, %indvars.iv25, !dbg !109
  br i1 %exitcond28, label %for.body93, label %for.cond91.for.inc137_crit_edge, !dbg !109

for.cond91.for.inc137_crit_edge:                  ; preds = %for.inc133
  br label %for.inc137, !dbg !109

for.inc137:                                       ; preds = %for.cond91.for.inc137_crit_edge, %for.cond91.preheader
  tail call void @llvm.dbg.value(metadata !2, i64 0, metadata !99, metadata !32), !dbg !98
  %indvars.iv.next22 = add nuw nsw i64 %indvars.iv21, 1, !dbg !100
  %indvars.iv.next26 = add nsw i32 %indvars.iv25, -1, !dbg !100
  %exitcond29 = icmp ne i64 %indvars.iv.next22, 6, !dbg !100
  br i1 %exitcond29, label %for.cond1.preheader, label %for.end139, !dbg !100

for.end139:                                       ; preds = %for.inc137
  %22 = load i32, i32* getelementptr inbounds ([6 x [6 x i32]], [6 x [6 x i32]]* @M, i64 0, i64 0, i64 5), align 4, !dbg !196
  ret i32 %22, !dbg !197
}

; Function Attrs: nounwind uwtable
define i32 @main() #0 !dbg !12 {
entry:
  br label %entry.split, !dbg !198

entry.split:                                      ; preds = %entry
  %call = tail call i32 @findMoves(), !dbg !198
  tail call void @play(), !dbg !199
  %0 = load i32, i32* @sum_alice, align 4, !dbg !200
  %1 = load i32, i32* getelementptr inbounds ([6 x [6 x i32]], [6 x [6 x i32]]* @M, i64 0, i64 0, i64 5), align 4, !dbg !202
  %cmp = icmp eq i32 %0, %1, !dbg !203
  br i1 %cmp, label %if.end, label %if.then, !dbg !204

if.then:                                          ; preds = %entry.split
  %call1 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([24 x i8], [24 x i8]* @.str.6, i64 0, i64 0)) #4, !dbg !205
  tail call void @exit(i32 -1) #5, !dbg !207
  unreachable, !dbg !207

if.end:                                           ; preds = %entry.split
  %2 = load i32, i32* @sum_alice, align 4, !dbg !208
  %3 = load i32, i32* @sum_bob, align 4, !dbg !210
  %cmp2 = icmp slt i32 %2, %3, !dbg !211
  br i1 %cmp2, label %if.then3, label %if.end5, !dbg !212

if.then3:                                         ; preds = %if.end
  %call4 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([28 x i8], [28 x i8]* @.str.7, i64 0, i64 0)) #4, !dbg !213
  tail call void @exit(i32 -1) #5, !dbg !215
  unreachable, !dbg !215

if.end5:                                          ; preds = %if.end
  %4 = load i32, i32* @sum_alice, align 4, !dbg !216
  %call6 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([54 x i8], [54 x i8]* @.str.8, i64 0, i64 0), i32 %4) #4, !dbg !217
  %5 = load i32, i32* @sum_bob, align 4, !dbg !218
  %call7 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([52 x i8], [52 x i8]* @.str.9, i64 0, i64 0), i32 %5) #4, !dbg !219
  ret i32 0, !dbg !220
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
!30 = !DILocation(line: 29, column: 2, scope: !4)
!31 = !DILocalVariable(name: "i", scope: !4, file: !1, line: 27, type: !11)
!32 = !DIExpression()
!33 = !DILocation(line: 27, column: 6, scope: !4)
!34 = !DILocation(line: 30, column: 2, scope: !35)
!35 = !DILexicalBlockFile(scope: !36, file: !1, discriminator: 1)
!36 = distinct !DILexicalBlock(scope: !37, file: !1, line: 30, column: 2)
!37 = distinct !DILexicalBlock(scope: !4, file: !1, line: 30, column: 2)
!38 = !DILocation(line: 31, column: 3, scope: !39)
!39 = distinct !DILexicalBlock(scope: !36, file: !1, line: 30, column: 26)
!40 = !DILocation(line: 31, column: 8, scope: !39)
!41 = !DILocation(line: 33, column: 1, scope: !4)
!42 = !DILocation(line: 36, column: 6, scope: !7)
!43 = !DILocalVariable(name: "i", scope: !7, file: !1, line: 36, type: !11)
!44 = !DILocalVariable(name: "j", scope: !7, file: !1, line: 36, type: !11)
!45 = !DILocation(line: 36, column: 13, scope: !7)
!46 = !DILocalVariable(name: "index", scope: !7, file: !1, line: 38, type: !11)
!47 = !DILocation(line: 38, column: 6, scope: !7)
!48 = !DILocation(line: 39, column: 2, scope: !49)
!49 = !DILexicalBlockFile(scope: !50, file: !1, discriminator: 1)
!50 = distinct !DILexicalBlock(scope: !51, file: !1, line: 39, column: 2)
!51 = distinct !DILexicalBlock(scope: !7, file: !1, line: 39, column: 2)
!52 = !DILocation(line: 51, column: 2, scope: !53)
!53 = !DILexicalBlockFile(scope: !54, file: !1, discriminator: 1)
!54 = distinct !DILexicalBlock(scope: !55, file: !1, line: 51, column: 2)
!55 = distinct !DILexicalBlock(scope: !7, file: !1, line: 51, column: 2)
!56 = !DILocation(line: 40, column: 7, scope: !57)
!57 = distinct !DILexicalBlock(scope: !58, file: !1, line: 40, column: 7)
!58 = distinct !DILexicalBlock(scope: !50, file: !1, line: 39, column: 36)
!59 = !DILocation(line: 40, column: 11, scope: !57)
!60 = !DILocation(line: 40, column: 29, scope: !57)
!61 = !DILocation(line: 40, column: 22, scope: !57)
!62 = !DILocation(line: 40, column: 19, scope: !57)
!63 = !DILocation(line: 40, column: 7, scope: !58)
!64 = !DILocation(line: 42, column: 19, scope: !65)
!65 = distinct !DILexicalBlock(scope: !57, file: !1, line: 40, column: 35)
!66 = !DILocation(line: 42, column: 4, scope: !65)
!67 = !DILocation(line: 42, column: 17, scope: !65)
!68 = !DILocation(line: 43, column: 5, scope: !65)
!69 = !DILocation(line: 44, column: 3, scope: !65)
!70 = !DILocation(line: 46, column: 19, scope: !71)
!71 = distinct !DILexicalBlock(scope: !57, file: !1, line: 44, column: 10)
!72 = !DILocation(line: 46, column: 4, scope: !71)
!73 = !DILocation(line: 46, column: 17, scope: !71)
!74 = !DILocation(line: 47, column: 5, scope: !71)
!75 = !DILocation(line: 52, column: 9, scope: !76)
!76 = distinct !DILexicalBlock(scope: !77, file: !1, line: 52, column: 6)
!77 = distinct !DILexicalBlock(scope: !54, file: !1, line: 51, column: 19)
!78 = !DILocation(line: 52, column: 6, scope: !77)
!79 = !DILocation(line: 53, column: 4, scope: !80)
!80 = distinct !DILexicalBlock(scope: !76, file: !1, line: 52, column: 13)
!81 = !DILocation(line: 54, column: 3, scope: !80)
!82 = !DILocation(line: 55, column: 4, scope: !83)
!83 = distinct !DILexicalBlock(scope: !76, file: !1, line: 54, column: 8)
!84 = !DILocation(line: 57, column: 29, scope: !77)
!85 = !DILocation(line: 57, column: 3, scope: !77)
!86 = !DILocation(line: 59, column: 9, scope: !87)
!87 = distinct !DILexicalBlock(scope: !77, file: !1, line: 59, column: 6)
!88 = !DILocation(line: 60, column: 17, scope: !89)
!89 = distinct !DILexicalBlock(scope: !87, file: !1, line: 59, column: 13)
!90 = !DILocation(line: 59, column: 6, scope: !77)
!91 = !DILocation(line: 60, column: 14, scope: !89)
!92 = !DILocation(line: 61, column: 4, scope: !89)
!93 = !DILocation(line: 62, column: 3, scope: !89)
!94 = !DILocation(line: 63, column: 12, scope: !95)
!95 = distinct !DILexicalBlock(scope: !87, file: !1, line: 62, column: 8)
!96 = !DILocation(line: 64, column: 4, scope: !95)
!97 = !DILocation(line: 68, column: 1, scope: !7)
!98 = !DILocation(line: 104, column: 6, scope: !8)
!99 = !DILocalVariable(name: "s", scope: !8, file: !1, line: 104, type: !11)
!100 = !DILocation(line: 105, column: 2, scope: !101)
!101 = !DILexicalBlockFile(scope: !102, file: !1, discriminator: 1)
!102 = distinct !DILexicalBlock(scope: !103, file: !1, line: 105, column: 2)
!103 = distinct !DILexicalBlock(scope: !8, file: !1, line: 105, column: 2)
!104 = !DILocation(line: 107, column: 3, scope: !105)
!105 = !DILexicalBlockFile(scope: !106, file: !1, discriminator: 1)
!106 = distinct !DILexicalBlock(scope: !107, file: !1, line: 107, column: 3)
!107 = distinct !DILexicalBlock(scope: !108, file: !1, line: 107, column: 3)
!108 = distinct !DILexicalBlock(scope: !102, file: !1, line: 105, column: 26)
!109 = !DILocation(line: 135, column: 3, scope: !110)
!110 = !DILexicalBlockFile(scope: !111, file: !1, discriminator: 1)
!111 = distinct !DILexicalBlock(scope: !112, file: !1, line: 135, column: 3)
!112 = distinct !DILexicalBlock(scope: !108, file: !1, line: 135, column: 3)
!113 = !DILocation(line: 111, column: 4, scope: !114)
!114 = distinct !DILexicalBlock(scope: !106, file: !1, line: 107, column: 39)
!115 = !DILocation(line: 111, column: 12, scope: !114)
!116 = !DILocation(line: 112, column: 14, scope: !117)
!117 = distinct !DILexicalBlock(scope: !114, file: !1, line: 112, column: 8)
!118 = !DILocation(line: 112, column: 27, scope: !119)
!119 = !DILexicalBlockFile(scope: !117, file: !1, discriminator: 1)
!120 = !DILocation(line: 112, column: 18, scope: !117)
!121 = !DILocation(line: 113, column: 26, scope: !122)
!122 = distinct !DILexicalBlock(scope: !117, file: !1, line: 112, column: 33)
!123 = !DILocation(line: 113, column: 19, scope: !122)
!124 = !DILocation(line: 113, column: 15, scope: !122)
!125 = !DILocation(line: 113, column: 5, scope: !122)
!126 = !DILocation(line: 113, column: 13, scope: !122)
!127 = !DILocation(line: 114, column: 4, scope: !122)
!128 = !DILocation(line: 116, column: 4, scope: !114)
!129 = !DILocation(line: 116, column: 12, scope: !114)
!130 = !DILocation(line: 117, column: 10, scope: !131)
!131 = distinct !DILexicalBlock(scope: !114, file: !1, line: 117, column: 8)
!132 = !DILocation(line: 117, column: 14, scope: !131)
!133 = !DILocation(line: 117, column: 8, scope: !114)
!134 = !DILocation(line: 118, column: 19, scope: !135)
!135 = distinct !DILexicalBlock(scope: !131, file: !1, line: 117, column: 19)
!136 = !DILocation(line: 118, column: 15, scope: !135)
!137 = !DILocation(line: 118, column: 5, scope: !135)
!138 = !DILocation(line: 118, column: 13, scope: !135)
!139 = !DILocation(line: 119, column: 9, scope: !140)
!140 = distinct !DILexicalBlock(scope: !135, file: !1, line: 119, column: 9)
!141 = !DILocation(line: 119, column: 19, scope: !140)
!142 = !DILocation(line: 119, column: 17, scope: !140)
!143 = !DILocation(line: 119, column: 9, scope: !135)
!144 = !DILocation(line: 120, column: 16, scope: !145)
!145 = distinct !DILexicalBlock(scope: !140, file: !1, line: 119, column: 28)
!146 = !DILocation(line: 120, column: 6, scope: !145)
!147 = !DILocation(line: 120, column: 14, scope: !145)
!148 = !DILocation(line: 121, column: 5, scope: !145)
!149 = !DILocation(line: 124, column: 4, scope: !114)
!150 = !DILocation(line: 124, column: 12, scope: !114)
!151 = !DILocation(line: 125, column: 14, scope: !152)
!152 = distinct !DILexicalBlock(scope: !114, file: !1, line: 125, column: 8)
!153 = !DILocation(line: 125, column: 8, scope: !114)
!154 = !DILocation(line: 126, column: 22, scope: !155)
!155 = distinct !DILexicalBlock(scope: !152, file: !1, line: 125, column: 19)
!156 = !DILocation(line: 126, column: 15, scope: !155)
!157 = !DILocation(line: 126, column: 5, scope: !155)
!158 = !DILocation(line: 126, column: 13, scope: !155)
!159 = !DILocation(line: 127, column: 9, scope: !160)
!160 = distinct !DILexicalBlock(scope: !155, file: !1, line: 127, column: 9)
!161 = !DILocation(line: 127, column: 19, scope: !160)
!162 = !DILocation(line: 127, column: 17, scope: !160)
!163 = !DILocation(line: 127, column: 9, scope: !155)
!164 = !DILocation(line: 128, column: 16, scope: !165)
!165 = distinct !DILexicalBlock(scope: !160, file: !1, line: 127, column: 28)
!166 = !DILocation(line: 128, column: 6, scope: !165)
!167 = !DILocation(line: 128, column: 14, scope: !165)
!168 = !DILocation(line: 129, column: 5, scope: !165)
!169 = !DILocalVariable(name: "i", scope: !8, file: !1, line: 104, type: !11)
!170 = !DILocation(line: 104, column: 9, scope: !8)
!171 = !DILocalVariable(name: "j", scope: !8, file: !1, line: 104, type: !11)
!172 = !DILocation(line: 104, column: 12, scope: !8)
!173 = !DILocation(line: 139, column: 8, scope: !174)
!174 = distinct !DILexicalBlock(scope: !175, file: !1, line: 139, column: 8)
!175 = distinct !DILexicalBlock(scope: !111, file: !1, line: 135, column: 39)
!176 = !DILocation(line: 139, column: 15, scope: !174)
!177 = !DILocation(line: 139, column: 13, scope: !174)
!178 = !DILocation(line: 139, column: 25, scope: !174)
!179 = !DILocation(line: 139, column: 32, scope: !174)
!180 = !DILocation(line: 139, column: 30, scope: !174)
!181 = !DILocation(line: 139, column: 23, scope: !174)
!182 = !DILocation(line: 139, column: 8, scope: !175)
!183 = !DILocation(line: 140, column: 15, scope: !184)
!184 = distinct !DILexicalBlock(scope: !174, file: !1, line: 139, column: 41)
!185 = !DILocation(line: 140, column: 22, scope: !184)
!186 = !DILocation(line: 140, column: 20, scope: !184)
!187 = !DILocation(line: 140, column: 5, scope: !184)
!188 = !DILocation(line: 140, column: 13, scope: !184)
!189 = !DILocation(line: 141, column: 4, scope: !184)
!190 = !DILocation(line: 142, column: 15, scope: !191)
!191 = distinct !DILexicalBlock(scope: !174, file: !1, line: 141, column: 11)
!192 = !DILocation(line: 142, column: 22, scope: !191)
!193 = !DILocation(line: 142, column: 20, scope: !191)
!194 = !DILocation(line: 142, column: 5, scope: !191)
!195 = !DILocation(line: 142, column: 13, scope: !191)
!196 = !DILocation(line: 152, column: 9, scope: !8)
!197 = !DILocation(line: 152, column: 2, scope: !8)
!198 = !DILocation(line: 156, column: 2, scope: !12)
!199 = !DILocation(line: 157, column: 2, scope: !12)
!200 = !DILocation(line: 160, column: 6, scope: !201)
!201 = distinct !DILexicalBlock(scope: !12, file: !1, line: 160, column: 6)
!202 = !DILocation(line: 160, column: 19, scope: !201)
!203 = !DILocation(line: 160, column: 16, scope: !201)
!204 = !DILocation(line: 160, column: 6, scope: !12)
!205 = !DILocation(line: 161, column: 3, scope: !206)
!206 = distinct !DILexicalBlock(scope: !201, file: !1, line: 160, column: 32)
!207 = !DILocation(line: 162, column: 3, scope: !206)
!208 = !DILocation(line: 165, column: 6, scope: !209)
!209 = distinct !DILexicalBlock(scope: !12, file: !1, line: 165, column: 6)
!210 = !DILocation(line: 165, column: 18, scope: !209)
!211 = !DILocation(line: 165, column: 16, scope: !209)
!212 = !DILocation(line: 165, column: 6, scope: !12)
!213 = !DILocation(line: 166, column: 3, scope: !214)
!214 = distinct !DILexicalBlock(scope: !209, file: !1, line: 165, column: 27)
!215 = !DILocation(line: 167, column: 3, scope: !214)
!216 = !DILocation(line: 170, column: 67, scope: !12)
!217 = !DILocation(line: 170, column: 2, scope: !12)
!218 = !DILocation(line: 171, column: 65, scope: !12)
!219 = !DILocation(line: 171, column: 2, scope: !12)
!220 = !DILocation(line: 172, column: 1, scope: !12)
