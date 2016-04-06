; ModuleID = 'CoinGame.preopt.s'
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
@str = private unnamed_addr constant [2 x i8] c".\00"

; Function Attrs: nounwind uwtable
define void @printMoves() #0 !dbg !4 {
entry:
  br label %entry.split, !dbg !26

entry.split:                                      ; preds = %entry
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !27, metadata !28), !dbg !26
  tail call void @llvm.dbg.value(metadata i32 5, i64 0, metadata !29, metadata !28), !dbg !30
  tail call void @llvm.dbg.value(metadata i8 1, i64 0, metadata !31, metadata !28), !dbg !33
  br label %while.body, !dbg !34

while.body:                                       ; preds = %entry.split, %if.end25
  %m.03 = phi i32 [ 0, %entry.split ], [ %m.1, %if.end25 ]
  %n.02 = phi i32 [ 5, %entry.split ], [ %n.1, %if.end25 ]
  %alice.01 = phi i8 [ 1, %entry.split ], [ %4, %if.end25 ]
  %idxprom = sext i32 %n.02 to i64, !dbg !36
  %add = add nsw i32 %m.03, 1, !dbg !38
  %idxprom1 = sext i32 %add to i64, !dbg !36
  %arrayidx2 = getelementptr inbounds [6 x [6 x i32]], [6 x [6 x i32]]* @M, i64 0, i64 %idxprom1, i64 %idxprom, !dbg !36
  %0 = load i32, i32* %arrayidx2, align 4, !dbg !36
  tail call void @llvm.dbg.value(metadata i32 %0, i64 0, metadata !39, metadata !28), !dbg !40
  %sub = add nsw i32 %n.02, -1, !dbg !41
  %idxprom3 = sext i32 %sub to i64, !dbg !42
  %idxprom4 = sext i32 %m.03 to i64, !dbg !42
  %arrayidx6 = getelementptr inbounds [6 x [6 x i32]], [6 x [6 x i32]]* @M, i64 0, i64 %idxprom4, i64 %idxprom3, !dbg !42
  %1 = load i32, i32* %arrayidx6, align 4, !dbg !42
  tail call void @llvm.dbg.value(metadata i32 %1, i64 0, metadata !43, metadata !28), !dbg !44
  %tobool = icmp eq i8 %alice.01, 0, !dbg !45
  br i1 %tobool, label %if.else, label %if.then, !dbg !47

if.then:                                          ; preds = %while.body
  %call = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str, i64 0, i64 0)) #3, !dbg !48
  br label %if.end, !dbg !50

if.else:                                          ; preds = %while.body
  %call7 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([19 x i8], [19 x i8]* @.str.1, i64 0, i64 0)) #3, !dbg !51
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %cmp8 = icmp sgt i32 %0, %1, !dbg !53
  br i1 %cmp8, label %if.else14, label %if.then9, !dbg !55

if.then9:                                         ; preds = %if.end
  %add10 = add nsw i32 %m.03, 1, !dbg !56
  %idxprom11 = sext i32 %m.03 to i64, !dbg !58
  %arrayidx12 = getelementptr inbounds [6 x i32], [6 x i32]* @V, i64 0, i64 %idxprom11, !dbg !58
  %2 = load i32, i32* %arrayidx12, align 4, !dbg !58
  %call13 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.2, i64 0, i64 0), i32 %add10, i32 %2) #3, !dbg !59
  %inc = add nsw i32 %m.03, 1, !dbg !60
  tail call void @llvm.dbg.value(metadata i32 %inc, i64 0, metadata !27, metadata !28), !dbg !26
  br label %if.end19, !dbg !61

if.else14:                                        ; preds = %if.end
  %add15 = add nsw i32 %n.02, 1, !dbg !62
  %idxprom16 = sext i32 %n.02 to i64, !dbg !64
  %arrayidx17 = getelementptr inbounds [6 x i32], [6 x i32]* @V, i64 0, i64 %idxprom16, !dbg !64
  %3 = load i32, i32* %arrayidx17, align 4, !dbg !64
  %call18 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.2, i64 0, i64 0), i32 %add15, i32 %3) #3, !dbg !65
  %dec = add nsw i32 %n.02, -1, !dbg !66
  tail call void @llvm.dbg.value(metadata i32 %dec, i64 0, metadata !29, metadata !28), !dbg !30
  br label %if.end19

if.end19:                                         ; preds = %if.else14, %if.then9
  %n.1 = phi i32 [ %n.02, %if.then9 ], [ %dec, %if.else14 ]
  %m.1 = phi i32 [ %inc, %if.then9 ], [ %m.03, %if.else14 ]
  %tobool20 = icmp eq i8 %alice.01, 0, !dbg !67
  br i1 %tobool20, label %if.else23, label %if.then21, !dbg !69

if.then21:                                        ; preds = %if.end19
  %call22 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.3, i64 0, i64 0)) #3, !dbg !70
  br label %if.end25, !dbg !72

if.else23:                                        ; preds = %if.end19
  %puts = tail call i32 @puts(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @str, i64 0, i64 0)), !dbg !73
  br label %if.end25

if.end25:                                         ; preds = %if.else23, %if.then21
  %4 = xor i8 %alice.01, 1, !dbg !75
  tail call void @llvm.dbg.value(metadata i8 %4, i64 0, metadata !31, metadata !28), !dbg !33
  %cmp = icmp sgt i32 %m.1, %n.1, !dbg !76
  br i1 %cmp, label %while.end, label %while.body, !dbg !34

while.end:                                        ; preds = %if.end25
  %5 = load i32, i32* getelementptr inbounds ([6 x [6 x i32]], [6 x [6 x i32]]* @M, i64 0, i64 0, i64 5), align 4, !dbg !77
  %call27 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([55 x i8], [55 x i8]* @.str.5, i64 0, i64 0), i32 %5) #3, !dbg !78
  ret void, !dbg !79
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare i32 @printf(i8*, ...) #2

; Function Attrs: nounwind uwtable
define i32 @maxMoney() #0 !dbg !7 {
entry:
  br label %entry.split, !dbg !80

entry.split:                                      ; preds = %entry
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !81, metadata !28), !dbg !80
  br label %for.cond1.preheader, !dbg !82

for.cond1.preheader:                              ; preds = %entry.split, %for.inc180
  %indvars.iv35 = phi i32 [ 6, %entry.split ], [ %indvars.iv.next36, %for.inc180 ]
  %indvars.iv31 = phi i64 [ 0, %entry.split ], [ %indvars.iv.next32, %for.inc180 ]
  br i1 true, label %for.body4.lr.ph, label %for.cond69.preheader, !dbg !86

for.body4.lr.ph:                                  ; preds = %for.cond1.preheader
  br label %for.body4, !dbg !86

for.cond183.preheader:                            ; preds = %for.inc180
  br label %for.cond186.preheader, !dbg !90

for.cond1.for.cond69.preheader_crit_edge:         ; preds = %for.inc
  br label %for.cond69.preheader, !dbg !86

for.cond69.preheader:                             ; preds = %for.cond1.for.cond69.preheader_crit_edge, %for.cond1.preheader
  br i1 true, label %for.body74.lr.ph, label %for.inc180, !dbg !94

for.body74.lr.ph:                                 ; preds = %for.cond69.preheader
  br label %for.body74, !dbg !94

for.body4:                                        ; preds = %for.body4.lr.ph, %for.inc
  %indvars.iv22 = phi i64 [ %indvars.iv31, %for.body4.lr.ph ], [ %indvars.iv.next23, %for.inc ]
  %indvars.iv15 = phi i64 [ 0, %for.body4.lr.ph ], [ %indvars.iv.next16, %for.inc ]
  %arrayidx6 = getelementptr inbounds [6 x [6 x i32]], [6 x [6 x i32]]* @X, i64 0, i64 %indvars.iv15, i64 %indvars.iv22, !dbg !97
  store i32 0, i32* %arrayidx6, align 4, !dbg !100
  %0 = add nuw nsw i64 %indvars.iv15, 2, !dbg !101
  %cmp7 = icmp slt i64 %0, 6, !dbg !103
  br i1 %cmp7, label %if.then, label %if.end, !dbg !104

if.then:                                          ; preds = %for.body4
  %arrayidx11 = getelementptr inbounds [6 x [6 x i32]], [6 x [6 x i32]]* @X, i64 0, i64 %indvars.iv15, i64 %indvars.iv22, !dbg !105
  %1 = load i32, i32* %arrayidx11, align 4, !dbg !105
  %2 = add nuw nsw i64 %indvars.iv15, 2, !dbg !107
  %arrayidx16 = getelementptr inbounds [6 x [6 x i32]], [6 x [6 x i32]]* @M, i64 0, i64 %2, i64 %indvars.iv22, !dbg !108
  %3 = load i32, i32* %arrayidx16, align 4, !dbg !108
  %add17 = add nsw i32 %3, %1, !dbg !109
  %arrayidx21 = getelementptr inbounds [6 x [6 x i32]], [6 x [6 x i32]]* @X, i64 0, i64 %indvars.iv15, i64 %indvars.iv22, !dbg !110
  store i32 %add17, i32* %arrayidx21, align 4, !dbg !111
  br label %if.end, !dbg !112

if.end:                                           ; preds = %if.then, %for.body4
  %arrayidx25 = getelementptr inbounds [6 x [6 x i32]], [6 x [6 x i32]]* @Y, i64 0, i64 %indvars.iv15, i64 %indvars.iv22, !dbg !113
  store i32 0, i32* %arrayidx25, align 4, !dbg !114
  %indvars.iv.next16 = add nuw nsw i64 %indvars.iv15, 1, !dbg !86
  %cmp27 = icmp slt i64 %indvars.iv.next16, 6, !dbg !115
  %cmp28 = icmp sgt i64 %indvars.iv22, 0, !dbg !117
  %or.cond = and i1 %cmp28, %cmp27, !dbg !119
  br i1 %or.cond, label %if.then29, label %if.end45, !dbg !119

if.then29:                                        ; preds = %if.end
  %arrayidx33 = getelementptr inbounds [6 x [6 x i32]], [6 x [6 x i32]]* @Y, i64 0, i64 %indvars.iv15, i64 %indvars.iv22, !dbg !120
  %4 = load i32, i32* %arrayidx33, align 4, !dbg !120
  %5 = add nsw i64 %indvars.iv22, -1, !dbg !122
  %6 = add nuw nsw i64 %indvars.iv15, 1, !dbg !123
  %arrayidx39 = getelementptr inbounds [6 x [6 x i32]], [6 x [6 x i32]]* @M, i64 0, i64 %6, i64 %5, !dbg !124
  %7 = load i32, i32* %arrayidx39, align 4, !dbg !124
  %add40 = add nsw i32 %7, %4, !dbg !125
  %arrayidx44 = getelementptr inbounds [6 x [6 x i32]], [6 x [6 x i32]]* @Y, i64 0, i64 %indvars.iv15, i64 %indvars.iv22, !dbg !126
  store i32 %add40, i32* %arrayidx44, align 4, !dbg !127
  br label %if.end45, !dbg !128

if.end45:                                         ; preds = %if.then29, %if.end
  %arrayidx49 = getelementptr inbounds [6 x [6 x i32]], [6 x [6 x i32]]* @Z, i64 0, i64 %indvars.iv15, i64 %indvars.iv22, !dbg !129
  store i32 0, i32* %arrayidx49, align 4, !dbg !130
  %cmp51 = icmp sgt i64 %indvars.iv22, 1, !dbg !131
  br i1 %cmp51, label %if.then52, label %for.inc, !dbg !133

if.then52:                                        ; preds = %if.end45
  %arrayidx56 = getelementptr inbounds [6 x [6 x i32]], [6 x [6 x i32]]* @Z, i64 0, i64 %indvars.iv15, i64 %indvars.iv22, !dbg !134
  %8 = load i32, i32* %arrayidx56, align 4, !dbg !134
  %9 = add nsw i64 %indvars.iv22, -2, !dbg !136
  %arrayidx61 = getelementptr inbounds [6 x [6 x i32]], [6 x [6 x i32]]* @M, i64 0, i64 %indvars.iv15, i64 %9, !dbg !137
  %10 = load i32, i32* %arrayidx61, align 4, !dbg !137
  %add62 = add nsw i32 %10, %8, !dbg !138
  %arrayidx66 = getelementptr inbounds [6 x [6 x i32]], [6 x [6 x i32]]* @Z, i64 0, i64 %indvars.iv15, i64 %indvars.iv22, !dbg !139
  store i32 %add62, i32* %arrayidx66, align 4, !dbg !140
  br label %for.inc, !dbg !141

for.inc:                                          ; preds = %if.end45, %if.then52
  tail call void @llvm.dbg.value(metadata !2, i64 0, metadata !142, metadata !28), !dbg !143
  %indvars.iv.next23 = add nuw nsw i64 %indvars.iv22, 1, !dbg !86
  tail call void @llvm.dbg.value(metadata !2, i64 0, metadata !144, metadata !28), !dbg !145
  %lftr.wideiv = trunc i64 %indvars.iv.next16 to i32, !dbg !86
  %exitcond28 = icmp ne i32 %lftr.wideiv, %indvars.iv35, !dbg !86
  br i1 %exitcond28, label %for.body4, label %for.cond1.for.cond69.preheader_crit_edge, !dbg !86

for.body74:                                       ; preds = %for.body74.lr.ph, %cond.end170
  %indvars.iv33 = phi i64 [ %indvars.iv31, %for.body74.lr.ph ], [ %indvars.iv.next34, %cond.end170 ]
  %indvars.iv29 = phi i64 [ 0, %for.body74.lr.ph ], [ %indvars.iv.next30, %cond.end170 ]
  %arrayidx76 = getelementptr inbounds [6 x i32], [6 x i32]* @V, i64 0, i64 %indvars.iv29, !dbg !146
  %11 = load i32, i32* %arrayidx76, align 4, !dbg !146
  %arrayidx80 = getelementptr inbounds [6 x [6 x i32]], [6 x [6 x i32]]* @X, i64 0, i64 %indvars.iv29, i64 %indvars.iv33, !dbg !146
  %12 = load i32, i32* %arrayidx80, align 4, !dbg !146
  %arrayidx84 = getelementptr inbounds [6 x [6 x i32]], [6 x [6 x i32]]* @Y, i64 0, i64 %indvars.iv29, i64 %indvars.iv33, !dbg !146
  %13 = load i32, i32* %arrayidx84, align 4, !dbg !146
  %cmp85 = icmp slt i32 %12, %13, !dbg !146
  %arrayidx89 = getelementptr inbounds [6 x [6 x i32]], [6 x [6 x i32]]* @X, i64 0, i64 %indvars.iv29, i64 %indvars.iv33, !dbg !149
  %arrayidx93 = getelementptr inbounds [6 x [6 x i32]], [6 x [6 x i32]]* @Y, i64 0, i64 %indvars.iv29, i64 %indvars.iv33, !dbg !151
  %cond.in = select i1 %cmp85, i32* %arrayidx89, i32* %arrayidx93, !dbg !146
  %cond = load i32, i32* %cond.in, align 4, !dbg !153
  %add94 = add nsw i32 %cond, %11, !dbg !153
  %arrayidx96 = getelementptr inbounds [6 x i32], [6 x i32]* @V, i64 0, i64 %indvars.iv33, !dbg !153
  %14 = load i32, i32* %arrayidx96, align 4, !dbg !153
  %arrayidx100 = getelementptr inbounds [6 x [6 x i32]], [6 x [6 x i32]]* @Y, i64 0, i64 %indvars.iv29, i64 %indvars.iv33, !dbg !153
  %15 = load i32, i32* %arrayidx100, align 4, !dbg !153
  %arrayidx104 = getelementptr inbounds [6 x [6 x i32]], [6 x [6 x i32]]* @Z, i64 0, i64 %indvars.iv29, i64 %indvars.iv33, !dbg !153
  %16 = load i32, i32* %arrayidx104, align 4, !dbg !153
  %cmp105 = icmp slt i32 %15, %16, !dbg !153
  %arrayidx110 = getelementptr inbounds [6 x [6 x i32]], [6 x [6 x i32]]* @Y, i64 0, i64 %indvars.iv29, i64 %indvars.iv33, !dbg !155
  %arrayidx115 = getelementptr inbounds [6 x [6 x i32]], [6 x [6 x i32]]* @Z, i64 0, i64 %indvars.iv29, i64 %indvars.iv33, !dbg !157
  %cond117.in = select i1 %cmp105, i32* %arrayidx110, i32* %arrayidx115, !dbg !153
  %cond117 = load i32, i32* %cond117.in, align 4, !dbg !159
  %add118 = add nsw i32 %cond117, %14, !dbg !159
  %cmp119 = icmp sgt i32 %add94, %add118, !dbg !159
  br i1 %cmp119, label %cond.true120, label %cond.false145, !dbg !159

cond.true120:                                     ; preds = %for.body74
  %arrayidx122 = getelementptr inbounds [6 x i32], [6 x i32]* @V, i64 0, i64 %indvars.iv29, !dbg !161
  %17 = load i32, i32* %arrayidx122, align 4, !dbg !161
  %arrayidx126 = getelementptr inbounds [6 x [6 x i32]], [6 x [6 x i32]]* @X, i64 0, i64 %indvars.iv29, i64 %indvars.iv33, !dbg !161
  %18 = load i32, i32* %arrayidx126, align 4, !dbg !161
  %arrayidx130 = getelementptr inbounds [6 x [6 x i32]], [6 x [6 x i32]]* @Y, i64 0, i64 %indvars.iv29, i64 %indvars.iv33, !dbg !161
  %19 = load i32, i32* %arrayidx130, align 4, !dbg !161
  %cmp131 = icmp slt i32 %18, %19, !dbg !161
  %arrayidx136 = getelementptr inbounds [6 x [6 x i32]], [6 x [6 x i32]]* @X, i64 0, i64 %indvars.iv29, i64 %indvars.iv33, !dbg !163
  %arrayidx141 = getelementptr inbounds [6 x [6 x i32]], [6 x [6 x i32]]* @Y, i64 0, i64 %indvars.iv29, i64 %indvars.iv33, !dbg !165
  %cond143.in = select i1 %cmp131, i32* %arrayidx136, i32* %arrayidx141, !dbg !161
  %cond143 = load i32, i32* %cond143.in, align 4, !dbg !167
  %add144 = add nsw i32 %cond143, %17, !dbg !167
  br label %cond.end170, !dbg !167

cond.false145:                                    ; preds = %for.body74
  %arrayidx147 = getelementptr inbounds [6 x i32], [6 x i32]* @V, i64 0, i64 %indvars.iv33, !dbg !169
  %20 = load i32, i32* %arrayidx147, align 4, !dbg !169
  %arrayidx151 = getelementptr inbounds [6 x [6 x i32]], [6 x [6 x i32]]* @Y, i64 0, i64 %indvars.iv29, i64 %indvars.iv33, !dbg !169
  %21 = load i32, i32* %arrayidx151, align 4, !dbg !169
  %arrayidx155 = getelementptr inbounds [6 x [6 x i32]], [6 x [6 x i32]]* @Z, i64 0, i64 %indvars.iv29, i64 %indvars.iv33, !dbg !169
  %22 = load i32, i32* %arrayidx155, align 4, !dbg !169
  %cmp156 = icmp slt i32 %21, %22, !dbg !169
  %arrayidx161 = getelementptr inbounds [6 x [6 x i32]], [6 x [6 x i32]]* @Y, i64 0, i64 %indvars.iv29, i64 %indvars.iv33, !dbg !171
  %arrayidx166 = getelementptr inbounds [6 x [6 x i32]], [6 x [6 x i32]]* @Z, i64 0, i64 %indvars.iv29, i64 %indvars.iv33, !dbg !173
  %cond168.in = select i1 %cmp156, i32* %arrayidx161, i32* %arrayidx166, !dbg !169
  %cond168 = load i32, i32* %cond168.in, align 4, !dbg !175
  %add169 = add nsw i32 %cond168, %20, !dbg !175
  br label %cond.end170, !dbg !175

cond.end170:                                      ; preds = %cond.false145, %cond.true120
  %cond171 = phi i32 [ %add144, %cond.true120 ], [ %add169, %cond.false145 ], !dbg !177
  %arrayidx175 = getelementptr inbounds [6 x [6 x i32]], [6 x [6 x i32]]* @M, i64 0, i64 %indvars.iv29, i64 %indvars.iv33, !dbg !179
  store i32 %cond171, i32* %arrayidx175, align 4, !dbg !180
  %indvars.iv.next30 = add nuw nsw i64 %indvars.iv29, 1, !dbg !94
  tail call void @llvm.dbg.value(metadata !2, i64 0, metadata !142, metadata !28), !dbg !143
  %indvars.iv.next34 = add nuw nsw i64 %indvars.iv33, 1, !dbg !94
  tail call void @llvm.dbg.value(metadata !2, i64 0, metadata !144, metadata !28), !dbg !145
  %lftr.wideiv37 = trunc i64 %indvars.iv.next30 to i32, !dbg !94
  %exitcond38 = icmp ne i32 %lftr.wideiv37, %indvars.iv35, !dbg !94
  br i1 %exitcond38, label %for.body74, label %for.cond69.for.inc180_crit_edge, !dbg !94

for.cond69.for.inc180_crit_edge:                  ; preds = %cond.end170
  br label %for.inc180, !dbg !94

for.inc180:                                       ; preds = %for.cond69.for.inc180_crit_edge, %for.cond69.preheader
  tail call void @llvm.dbg.value(metadata !2, i64 0, metadata !81, metadata !28), !dbg !80
  %indvars.iv.next32 = add nuw nsw i64 %indvars.iv31, 1, !dbg !82
  %indvars.iv.next36 = add nsw i32 %indvars.iv35, -1, !dbg !82
  %exitcond39 = icmp ne i64 %indvars.iv.next32, 6, !dbg !82
  br i1 %exitcond39, label %for.cond1.preheader, label %for.cond183.preheader, !dbg !82

for.cond186.preheader:                            ; preds = %for.cond183.preheader, %for.end195
  %indvars.iv12 = phi i64 [ 0, %for.cond183.preheader ], [ %indvars.iv.next13, %for.end195 ]
  br label %for.body188, !dbg !181

for.body188:                                      ; preds = %for.cond186.preheader, %for.body188
  %indvars.iv = phi i64 [ 0, %for.cond186.preheader ], [ %indvars.iv.next, %for.body188 ]
  %arrayidx192 = getelementptr inbounds [6 x [6 x i32]], [6 x [6 x i32]]* @M, i64 0, i64 %indvars.iv12, i64 %indvars.iv, !dbg !186
  %23 = load i32, i32* %arrayidx192, align 4, !dbg !186
  %call = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.6, i64 0, i64 0), i32 %23) #3, !dbg !188
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1, !dbg !181
  tail call void @llvm.dbg.value(metadata !2, i64 0, metadata !144, metadata !28), !dbg !145
  %exitcond = icmp ne i64 %indvars.iv.next, 6, !dbg !181
  br i1 %exitcond, label %for.body188, label %for.end195, !dbg !181

for.end195:                                       ; preds = %for.body188
  %putchar = tail call i32 @putchar(i32 10) #3, !dbg !189
  %indvars.iv.next13 = add nuw nsw i64 %indvars.iv12, 1, !dbg !90
  tail call void @llvm.dbg.value(metadata !2, i64 0, metadata !142, metadata !28), !dbg !143
  %exitcond14 = icmp ne i64 %indvars.iv.next13, 6, !dbg !90
  br i1 %exitcond14, label %for.cond186.preheader, label %for.end199, !dbg !90

for.end199:                                       ; preds = %for.end195
  %24 = load i32, i32* getelementptr inbounds ([6 x [6 x i32]], [6 x [6 x i32]]* @M, i64 0, i64 0, i64 5), align 4, !dbg !190
  ret i32 %24, !dbg !191
}

; Function Attrs: nounwind uwtable
define i32 @main() #0 !dbg !11 {
entry:
  br label %entry.split, !dbg !192

entry.split:                                      ; preds = %entry
  %call = tail call i32 @maxMoney(), !dbg !192
  tail call void @printMoves(), !dbg !193
  ret i32 0, !dbg !194
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.value(metadata, i64, metadata, metadata) #1

; Function Attrs: nounwind
declare i32 @puts(i8* nocapture) #3

declare i32 @putchar(i32)

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone }
attributes #2 = { "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind }

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
!26 = !DILocation(line: 27, column: 6, scope: !4)
!27 = !DILocalVariable(name: "m", scope: !4, file: !1, line: 27, type: !10)
!28 = !DIExpression()
!29 = !DILocalVariable(name: "n", scope: !4, file: !1, line: 27, type: !10)
!30 = !DILocation(line: 27, column: 13, scope: !4)
!31 = !DILocalVariable(name: "alice", scope: !4, file: !1, line: 28, type: !32)
!32 = !DIBasicType(name: "_Bool", size: 8, align: 8, encoding: DW_ATE_boolean)
!33 = !DILocation(line: 28, column: 7, scope: !4)
!34 = !DILocation(line: 29, column: 2, scope: !35)
!35 = !DILexicalBlockFile(scope: !4, file: !1, discriminator: 1)
!36 = !DILocation(line: 30, column: 12, scope: !37)
!37 = distinct !DILexicalBlock(scope: !4, file: !1, line: 29, column: 17)
!38 = !DILocation(line: 30, column: 16, scope: !37)
!39 = !DILocalVariable(name: "P1", scope: !37, file: !1, line: 30, type: !10)
!40 = !DILocation(line: 30, column: 7, scope: !37)
!41 = !DILocation(line: 31, column: 19, scope: !37)
!42 = !DILocation(line: 31, column: 12, scope: !37)
!43 = !DILocalVariable(name: "P2", scope: !37, file: !1, line: 31, type: !10)
!44 = !DILocation(line: 31, column: 7, scope: !37)
!45 = !DILocation(line: 32, column: 7, scope: !46)
!46 = distinct !DILexicalBlock(scope: !37, file: !1, line: 32, column: 7)
!47 = !DILocation(line: 32, column: 7, scope: !37)
!48 = !DILocation(line: 33, column: 4, scope: !49)
!49 = distinct !DILexicalBlock(scope: !46, file: !1, line: 32, column: 14)
!50 = !DILocation(line: 34, column: 3, scope: !49)
!51 = !DILocation(line: 35, column: 4, scope: !52)
!52 = distinct !DILexicalBlock(scope: !46, file: !1, line: 34, column: 10)
!53 = !DILocation(line: 37, column: 10, scope: !54)
!54 = distinct !DILexicalBlock(scope: !37, file: !1, line: 37, column: 7)
!55 = !DILocation(line: 37, column: 7, scope: !37)
!56 = !DILocation(line: 38, column: 26, scope: !57)
!57 = distinct !DILexicalBlock(scope: !54, file: !1, line: 37, column: 17)
!58 = !DILocation(line: 38, column: 31, scope: !57)
!59 = !DILocation(line: 38, column: 4, scope: !57)
!60 = !DILocation(line: 39, column: 5, scope: !57)
!61 = !DILocation(line: 40, column: 3, scope: !57)
!62 = !DILocation(line: 41, column: 26, scope: !63)
!63 = distinct !DILexicalBlock(scope: !54, file: !1, line: 40, column: 10)
!64 = !DILocation(line: 41, column: 31, scope: !63)
!65 = !DILocation(line: 41, column: 4, scope: !63)
!66 = !DILocation(line: 42, column: 5, scope: !63)
!67 = !DILocation(line: 44, column: 7, scope: !68)
!68 = distinct !DILexicalBlock(scope: !37, file: !1, line: 44, column: 7)
!69 = !DILocation(line: 44, column: 7, scope: !37)
!70 = !DILocation(line: 45, column: 4, scope: !71)
!71 = distinct !DILexicalBlock(scope: !68, file: !1, line: 44, column: 14)
!72 = !DILocation(line: 46, column: 3, scope: !71)
!73 = !DILocation(line: 47, column: 4, scope: !74)
!74 = distinct !DILexicalBlock(scope: !68, file: !1, line: 46, column: 10)
!75 = !DILocation(line: 49, column: 9, scope: !37)
!76 = !DILocation(line: 29, column: 11, scope: !35)
!77 = !DILocation(line: 52, column: 4, scope: !4)
!78 = !DILocation(line: 51, column: 2, scope: !4)
!79 = !DILocation(line: 53, column: 1, scope: !4)
!80 = !DILocation(line: 57, column: 6, scope: !7)
!81 = !DILocalVariable(name: "i", scope: !7, file: !1, line: 57, type: !10)
!82 = !DILocation(line: 58, column: 2, scope: !83)
!83 = !DILexicalBlockFile(scope: !84, file: !1, discriminator: 1)
!84 = distinct !DILexicalBlock(scope: !85, file: !1, line: 58, column: 2)
!85 = distinct !DILexicalBlock(scope: !7, file: !1, line: 58, column: 2)
!86 = !DILocation(line: 59, column: 3, scope: !87)
!87 = !DILexicalBlockFile(scope: !88, file: !1, discriminator: 3)
!88 = distinct !DILexicalBlock(scope: !89, file: !1, line: 59, column: 3)
!89 = distinct !DILexicalBlock(scope: !84, file: !1, line: 58, column: 26)
!90 = !DILocation(line: 87, column: 2, scope: !91)
!91 = !DILexicalBlockFile(scope: !92, file: !1, discriminator: 1)
!92 = distinct !DILexicalBlock(scope: !93, file: !1, line: 87, column: 2)
!93 = distinct !DILexicalBlock(scope: !7, file: !1, line: 87, column: 2)
!94 = !DILocation(line: 74, column: 3, scope: !95)
!95 = !DILexicalBlockFile(scope: !96, file: !1, discriminator: 3)
!96 = distinct !DILexicalBlock(scope: !89, file: !1, line: 74, column: 3)
!97 = !DILocation(line: 61, column: 4, scope: !98)
!98 = distinct !DILexicalBlock(scope: !99, file: !1, line: 59, column: 48)
!99 = distinct !DILexicalBlock(scope: !88, file: !1, line: 59, column: 3)
!100 = !DILocation(line: 61, column: 12, scope: !98)
!101 = !DILocation(line: 62, column: 10, scope: !102)
!102 = distinct !DILexicalBlock(scope: !98, file: !1, line: 62, column: 8)
!103 = !DILocation(line: 62, column: 14, scope: !102)
!104 = !DILocation(line: 62, column: 8, scope: !98)
!105 = !DILocation(line: 63, column: 15, scope: !106)
!106 = distinct !DILexicalBlock(scope: !102, file: !1, line: 62, column: 19)
!107 = !DILocation(line: 63, column: 29, scope: !106)
!108 = !DILocation(line: 63, column: 25, scope: !106)
!109 = !DILocation(line: 63, column: 23, scope: !106)
!110 = !DILocation(line: 63, column: 5, scope: !106)
!111 = !DILocation(line: 63, column: 13, scope: !106)
!112 = !DILocation(line: 64, column: 4, scope: !106)
!113 = !DILocation(line: 65, column: 4, scope: !98)
!114 = !DILocation(line: 65, column: 12, scope: !98)
!115 = !DILocation(line: 66, column: 14, scope: !116)
!116 = distinct !DILexicalBlock(scope: !98, file: !1, line: 66, column: 8)
!117 = !DILocation(line: 66, column: 27, scope: !118)
!118 = !DILexicalBlockFile(scope: !116, file: !1, discriminator: 1)
!119 = !DILocation(line: 66, column: 18, scope: !116)
!120 = !DILocation(line: 67, column: 15, scope: !121)
!121 = distinct !DILexicalBlock(scope: !116, file: !1, line: 66, column: 33)
!122 = !DILocation(line: 67, column: 36, scope: !121)
!123 = !DILocation(line: 67, column: 29, scope: !121)
!124 = !DILocation(line: 67, column: 25, scope: !121)
!125 = !DILocation(line: 67, column: 23, scope: !121)
!126 = !DILocation(line: 67, column: 5, scope: !121)
!127 = !DILocation(line: 67, column: 13, scope: !121)
!128 = !DILocation(line: 68, column: 4, scope: !121)
!129 = !DILocation(line: 69, column: 4, scope: !98)
!130 = !DILocation(line: 69, column: 12, scope: !98)
!131 = !DILocation(line: 70, column: 14, scope: !132)
!132 = distinct !DILexicalBlock(scope: !98, file: !1, line: 70, column: 8)
!133 = !DILocation(line: 70, column: 8, scope: !98)
!134 = !DILocation(line: 71, column: 15, scope: !135)
!135 = distinct !DILexicalBlock(scope: !132, file: !1, line: 70, column: 19)
!136 = !DILocation(line: 71, column: 31, scope: !135)
!137 = !DILocation(line: 71, column: 24, scope: !135)
!138 = !DILocation(line: 71, column: 22, scope: !135)
!139 = !DILocation(line: 71, column: 5, scope: !135)
!140 = !DILocation(line: 71, column: 13, scope: !135)
!141 = !DILocation(line: 72, column: 4, scope: !135)
!142 = !DILocalVariable(name: "m", scope: !7, file: !1, line: 57, type: !10)
!143 = !DILocation(line: 57, column: 9, scope: !7)
!144 = !DILocalVariable(name: "n", scope: !7, file: !1, line: 57, type: !10)
!145 = !DILocation(line: 57, column: 12, scope: !7)
!146 = !DILocation(line: 76, column: 14, scope: !147)
!147 = distinct !DILexicalBlock(scope: !148, file: !1, line: 74, column: 48)
!148 = distinct !DILexicalBlock(scope: !96, file: !1, line: 74, column: 3)
!149 = !DILocation(line: 76, column: 14, scope: !150)
!150 = !DILexicalBlockFile(scope: !147, file: !1, discriminator: 1)
!151 = !DILocation(line: 76, column: 14, scope: !152)
!152 = !DILexicalBlockFile(scope: !147, file: !1, discriminator: 2)
!153 = !DILocation(line: 76, column: 14, scope: !154)
!154 = !DILexicalBlockFile(scope: !147, file: !1, discriminator: 3)
!155 = !DILocation(line: 76, column: 14, scope: !156)
!156 = !DILexicalBlockFile(scope: !147, file: !1, discriminator: 4)
!157 = !DILocation(line: 76, column: 14, scope: !158)
!158 = !DILexicalBlockFile(scope: !147, file: !1, discriminator: 5)
!159 = !DILocation(line: 76, column: 14, scope: !160)
!160 = !DILexicalBlockFile(scope: !147, file: !1, discriminator: 6)
!161 = !DILocation(line: 76, column: 14, scope: !162)
!162 = !DILexicalBlockFile(scope: !147, file: !1, discriminator: 7)
!163 = !DILocation(line: 76, column: 14, scope: !164)
!164 = !DILexicalBlockFile(scope: !147, file: !1, discriminator: 8)
!165 = !DILocation(line: 76, column: 14, scope: !166)
!166 = !DILexicalBlockFile(scope: !147, file: !1, discriminator: 9)
!167 = !DILocation(line: 76, column: 14, scope: !168)
!168 = !DILexicalBlockFile(scope: !147, file: !1, discriminator: 10)
!169 = !DILocation(line: 76, column: 14, scope: !170)
!170 = !DILexicalBlockFile(scope: !147, file: !1, discriminator: 11)
!171 = !DILocation(line: 76, column: 14, scope: !172)
!172 = !DILexicalBlockFile(scope: !147, file: !1, discriminator: 12)
!173 = !DILocation(line: 76, column: 14, scope: !174)
!174 = !DILexicalBlockFile(scope: !147, file: !1, discriminator: 13)
!175 = !DILocation(line: 76, column: 14, scope: !176)
!176 = !DILexicalBlockFile(scope: !147, file: !1, discriminator: 14)
!177 = !DILocation(line: 76, column: 14, scope: !178)
!178 = !DILexicalBlockFile(scope: !147, file: !1, discriminator: 15)
!179 = !DILocation(line: 76, column: 4, scope: !178)
!180 = !DILocation(line: 76, column: 12, scope: !178)
!181 = !DILocation(line: 88, column: 3, scope: !182)
!182 = !DILexicalBlockFile(scope: !183, file: !1, discriminator: 1)
!183 = distinct !DILexicalBlock(scope: !184, file: !1, line: 88, column: 3)
!184 = distinct !DILexicalBlock(scope: !185, file: !1, line: 88, column: 3)
!185 = distinct !DILexicalBlock(scope: !92, file: !1, line: 87, column: 26)
!186 = !DILocation(line: 89, column: 19, scope: !187)
!187 = distinct !DILexicalBlock(scope: !183, file: !1, line: 88, column: 27)
!188 = !DILocation(line: 89, column: 4, scope: !187)
!189 = !DILocation(line: 91, column: 3, scope: !185)
!190 = !DILocation(line: 94, column: 9, scope: !7)
!191 = !DILocation(line: 94, column: 2, scope: !7)
!192 = !DILocation(line: 97, column: 2, scope: !11)
!193 = !DILocation(line: 98, column: 2, scope: !11)
!194 = !DILocation(line: 99, column: 1, scope: !11)
