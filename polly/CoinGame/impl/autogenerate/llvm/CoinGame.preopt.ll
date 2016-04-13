; ModuleID = 'CoinGame.preopt.s'
source_filename = "CoinGame.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external global %struct._IO_FILE*, align 8
@.str = private unnamed_addr constant [5 x i8] c"fail\00", align 1
@.str.1 = private unnamed_addr constant [6 x i8] c"%lld\0A\00", align 1

; Function Attrs: nounwind uwtable
define i64* @init(i64 %n) #0 !dbg !6 {
entry:
  br label %entry.split, !dbg !28

entry.split:                                      ; preds = %entry
  tail call void @llvm.dbg.value(metadata i64 %n, i64 0, metadata !29, metadata !30), !dbg !28
  tail call void @llvm.dbg.value(metadata i64* null, i64 0, metadata !31, metadata !30), !dbg !32
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !33, metadata !30), !dbg !32
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !34, metadata !30), !dbg !35
  tail call void @llvm.dbg.value(metadata i64* null, i64 0, metadata !36, metadata !30), !dbg !37
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !38, metadata !30), !dbg !37
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !39, metadata !30), !dbg !40
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !41, metadata !30), !dbg !42
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !43, metadata !30), !dbg !44
  tail call void @llvm.dbg.value(metadata i64* null, i64 0, metadata !45, metadata !30), !dbg !46
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !47, metadata !30), !dbg !46
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !48, metadata !30), !dbg !49
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !50, metadata !30), !dbg !51
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !52, metadata !30), !dbg !53
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !54, metadata !30), !dbg !55
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !56, metadata !30), !dbg !57
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !58, metadata !30), !dbg !59
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !43, metadata !30), !dbg !44
  tail call void @llvm.dbg.value(metadata i64 %n, i64 0, metadata !47, metadata !30), !dbg !46
  %conv1 = trunc i64 %n to i32, !dbg !60
  %call = tail call i64* @gen1DArray(i32 0, i32 %conv1) #5, !dbg !60
  tail call void @llvm.dbg.value(metadata i64* %call, i64 0, metadata !45, metadata !30), !dbg !46
  tail call void @llvm.dbg.value(metadata i8 1, i64 0, metadata !48, metadata !30), !dbg !49
  tail call void @llvm.dbg.value(metadata i64 %n, i64 0, metadata !38, metadata !30), !dbg !37
  tail call void @llvm.dbg.value(metadata i64* %call, i64 0, metadata !36, metadata !30), !dbg !37
  tail call void @llvm.dbg.value(metadata i8 1, i64 0, metadata !39, metadata !30), !dbg !40
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !48, metadata !30), !dbg !49
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !50, metadata !30), !dbg !51
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !41, metadata !30), !dbg !42
  %cmp1 = icmp sgt i64 %n, 0, !dbg !61
  br i1 %cmp1, label %if.end7.lr.ph, label %if.end15, !dbg !64

if.end7.lr.ph:                                    ; preds = %entry.split
  br label %if.end7, !dbg !64

if.end7:                                          ; preds = %if.end7.lr.ph, %if.end7
  %i.02 = phi i64 [ 0, %if.end7.lr.ph ], [ %add9, %if.end7 ]
  %arrayidx = getelementptr inbounds i64, i64* %call, i64 %i.02, !dbg !65
  %0 = load i64, i64* %arrayidx, align 8, !dbg !65
  tail call void @llvm.dbg.value(metadata i64 %0, i64 0, metadata !52, metadata !30), !dbg !53
  %add = add nsw i64 %0, %i.02, !dbg !66
  tail call void @llvm.dbg.value(metadata i64 %add, i64 0, metadata !54, metadata !30), !dbg !55
  %arrayidx8 = getelementptr inbounds i64, i64* %call, i64 %i.02, !dbg !67
  store i64 %add, i64* %arrayidx8, align 8, !dbg !68
  tail call void @llvm.dbg.value(metadata i64 1, i64 0, metadata !56, metadata !30), !dbg !57
  tail call void @llvm.dbg.value(metadata i64 %add9, i64 0, metadata !58, metadata !30), !dbg !59
  tail call void @llvm.dbg.value(metadata i64 %add9, i64 0, metadata !41, metadata !30), !dbg !42
  %add9 = add nuw nsw i64 %i.02, 1, !dbg !69
  %exitcond = icmp ne i64 %add9, %n, !dbg !64
  br i1 %exitcond, label %if.end7, label %while.body.if.end15_crit_edge, !dbg !64

while.body.if.end15_crit_edge:                    ; preds = %if.end7
  br label %if.end15, !dbg !64

if.end15:                                         ; preds = %while.body.if.end15_crit_edge, %entry.split
  ret i64* %call, !dbg !70
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare void @free(i8*) #2

declare i64* @gen1DArray(i32, i32) #3

; Function Attrs: nounwind uwtable
define i64 @getBobSum(i64 %sum_alice, i64* %coins, i64 %coins_size, i1 zeroext %coins_has_ownership, i64 %n) #0 !dbg !11 {
entry:
  br label %entry.split, !dbg !71

entry.split:                                      ; preds = %entry
  tail call void @llvm.dbg.value(metadata i64 %sum_alice, i64 0, metadata !72, metadata !30), !dbg !71
  tail call void @llvm.dbg.value(metadata i64* %coins, i64 0, metadata !73, metadata !30), !dbg !74
  tail call void @llvm.dbg.value(metadata i64 %coins_size, i64 0, metadata !75, metadata !30), !dbg !74
  tail call void @llvm.dbg.value(metadata i1 %coins_has_ownership, i64 0, metadata !76, metadata !77), !dbg !78
  tail call void @llvm.dbg.value(metadata i64 %n, i64 0, metadata !79, metadata !30), !dbg !80
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !81, metadata !30), !dbg !82
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !83, metadata !30), !dbg !84
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !85, metadata !30), !dbg !86
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !87, metadata !30), !dbg !88
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !89, metadata !30), !dbg !90
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !91, metadata !30), !dbg !92
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !93, metadata !30), !dbg !94
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !95, metadata !30), !dbg !96
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !97, metadata !30), !dbg !98
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !99, metadata !30), !dbg !100
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !87, metadata !30), !dbg !88
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !83, metadata !30), !dbg !84
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !89, metadata !30), !dbg !90
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !85, metadata !30), !dbg !86
  %cmp1 = icmp sgt i64 %n, 0, !dbg !101
  br i1 %cmp1, label %blklab3.lr.ph, label %blklab2, !dbg !104

blklab3.lr.ph:                                    ; preds = %entry.split
  br label %blklab3, !dbg !104

blklab3:                                          ; preds = %blklab3.lr.ph, %blklab3
  %i.03 = phi i64 [ 0, %blklab3.lr.ph ], [ %add1, %blklab3 ]
  %sum.02 = phi i64 [ 0, %blklab3.lr.ph ], [ %add, %blklab3 ]
  tail call void @llvm.dbg.value(metadata i64 %0, i64 0, metadata !91, metadata !30), !dbg !92
  tail call void @llvm.dbg.value(metadata i64 %add, i64 0, metadata !93, metadata !30), !dbg !94
  tail call void @llvm.dbg.value(metadata i64 %add, i64 0, metadata !85, metadata !30), !dbg !86
  tail call void @llvm.dbg.value(metadata i64 1, i64 0, metadata !95, metadata !30), !dbg !96
  tail call void @llvm.dbg.value(metadata i64 %add1, i64 0, metadata !97, metadata !30), !dbg !98
  tail call void @llvm.dbg.value(metadata i64 %add1, i64 0, metadata !83, metadata !30), !dbg !84
  %add1 = add nuw nsw i64 %i.03, 1, !dbg !105
  %arrayidx = getelementptr inbounds i64, i64* %coins, i64 %i.03, !dbg !106
  %0 = load i64, i64* %arrayidx, align 8, !dbg !106
  %add = add nsw i64 %0, %sum.02, !dbg !107
  %exitcond = icmp ne i64 %add1, %n, !dbg !104
  br i1 %exitcond, label %blklab3, label %while.body.blklab2_crit_edge, !dbg !104

while.body.blklab2_crit_edge:                     ; preds = %blklab3
  %add.lcssa = phi i64 [ %add, %blklab3 ]
  br label %blklab2, !dbg !104

blklab2:                                          ; preds = %while.body.blklab2_crit_edge, %entry.split
  %sum.0.lcssa = phi i64 [ %add.lcssa, %while.body.blklab2_crit_edge ], [ 0, %entry.split ]
  %sub = sub nsw i64 %sum.0.lcssa, %sum_alice, !dbg !108
  tail call void @llvm.dbg.value(metadata i64 %sub, i64 0, metadata !99, metadata !30), !dbg !100
  br i1 %coins_has_ownership, label %if.then2, label %if.end3, !dbg !109

if.then2:                                         ; preds = %blklab2
  %1 = bitcast i64* %coins to i8*, !dbg !110
  tail call void @free(i8* %1) #5, !dbg !110
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !76, metadata !30), !dbg !78
  br label %if.end3, !dbg !110

if.end3:                                          ; preds = %if.then2, %blklab2
  ret i64 %sub, !dbg !114
}

; Function Attrs: nounwind uwtable
define i64* @findMoves(i64* %coins, i64 %coins_size, i1 zeroext %coins_has_ownership, i64 %n) #0 !dbg !15 {
entry:
  br label %entry.split, !dbg !115

entry.split:                                      ; preds = %entry
  tail call void @llvm.dbg.value(metadata i64* %coins, i64 0, metadata !116, metadata !30), !dbg !115
  tail call void @llvm.dbg.value(metadata i64 %coins_size, i64 0, metadata !117, metadata !30), !dbg !115
  tail call void @llvm.dbg.value(metadata i1 %coins_has_ownership, i64 0, metadata !118, metadata !77), !dbg !119
  tail call void @llvm.dbg.value(metadata i64 %n, i64 0, metadata !120, metadata !30), !dbg !121
  tail call void @llvm.dbg.value(metadata i64* null, i64 0, metadata !122, metadata !30), !dbg !123
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !124, metadata !30), !dbg !123
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !125, metadata !30), !dbg !126
  tail call void @llvm.dbg.value(metadata i64* null, i64 0, metadata !127, metadata !30), !dbg !128
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !129, metadata !30), !dbg !128
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !130, metadata !30), !dbg !131
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !132, metadata !30), !dbg !133
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !134, metadata !30), !dbg !135
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !136, metadata !30), !dbg !137
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !138, metadata !30), !dbg !139
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !140, metadata !30), !dbg !141
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !142, metadata !30), !dbg !143
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !144, metadata !30), !dbg !145
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !146, metadata !30), !dbg !147
  tail call void @llvm.dbg.value(metadata i64* null, i64 0, metadata !148, metadata !30), !dbg !149
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !150, metadata !30), !dbg !149
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !151, metadata !30), !dbg !152
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !153, metadata !30), !dbg !154
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !155, metadata !30), !dbg !156
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !157, metadata !30), !dbg !158
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !159, metadata !30), !dbg !160
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !161, metadata !30), !dbg !162
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !163, metadata !30), !dbg !164
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !165, metadata !30), !dbg !166
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !167, metadata !30), !dbg !168
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !169, metadata !30), !dbg !170
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !171, metadata !30), !dbg !172
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !173, metadata !30), !dbg !174
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !175, metadata !30), !dbg !176
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !177, metadata !30), !dbg !178
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !179, metadata !30), !dbg !180
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !181, metadata !30), !dbg !182
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !183, metadata !30), !dbg !184
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !185, metadata !30), !dbg !186
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !187, metadata !30), !dbg !188
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !189, metadata !30), !dbg !190
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !191, metadata !30), !dbg !192
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !193, metadata !30), !dbg !194
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !195, metadata !30), !dbg !196
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !197, metadata !30), !dbg !198
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !199, metadata !30), !dbg !200
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !201, metadata !30), !dbg !202
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !203, metadata !30), !dbg !204
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !205, metadata !30), !dbg !206
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !207, metadata !30), !dbg !208
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !209, metadata !30), !dbg !210
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !211, metadata !30), !dbg !212
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !213, metadata !30), !dbg !214
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !215, metadata !30), !dbg !216
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !217, metadata !30), !dbg !218
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !219, metadata !30), !dbg !220
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !221, metadata !30), !dbg !222
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !223, metadata !30), !dbg !224
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !225, metadata !30), !dbg !226
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !227, metadata !30), !dbg !228
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !229, metadata !30), !dbg !230
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !231, metadata !30), !dbg !232
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !233, metadata !30), !dbg !234
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !235, metadata !30), !dbg !236
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !237, metadata !30), !dbg !238
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !239, metadata !30), !dbg !240
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !241, metadata !30), !dbg !242
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !243, metadata !30), !dbg !244
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !245, metadata !30), !dbg !246
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !247, metadata !30), !dbg !248
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !249, metadata !30), !dbg !250
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !251, metadata !30), !dbg !252
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !144, metadata !30), !dbg !145
  %mul = mul nsw i64 %n, %n, !dbg !253
  tail call void @llvm.dbg.value(metadata i64 %mul, i64 0, metadata !146, metadata !30), !dbg !147
  tail call void @llvm.dbg.value(metadata i64 %mul, i64 0, metadata !150, metadata !30), !dbg !149
  %conv1 = trunc i64 %mul to i32, !dbg !254
  %call = tail call i64* @gen1DArray(i32 0, i32 %conv1) #5, !dbg !254
  tail call void @llvm.dbg.value(metadata i64* %call, i64 0, metadata !148, metadata !30), !dbg !149
  tail call void @llvm.dbg.value(metadata i8 1, i64 0, metadata !151, metadata !30), !dbg !152
  tail call void @llvm.dbg.value(metadata i64 %mul, i64 0, metadata !129, metadata !30), !dbg !128
  tail call void @llvm.dbg.value(metadata i64* %call, i64 0, metadata !127, metadata !30), !dbg !128
  tail call void @llvm.dbg.value(metadata i8 1, i64 0, metadata !130, metadata !30), !dbg !131
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !151, metadata !30), !dbg !152
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !153, metadata !30), !dbg !154
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !132, metadata !30), !dbg !133
  %cmp4 = icmp sgt i64 %n, 0, !dbg !255
  br i1 %cmp4, label %while.body9.preheader.lr.ph, label %blklab4, !dbg !258

while.body9.preheader.lr.ph:                      ; preds = %entry.split
  br label %while.body9.preheader, !dbg !258

while.body9.preheader:                            ; preds = %while.body9.preheader.lr.ph, %blklab5
  %indvars.iv = phi i64 [ %n, %while.body9.preheader.lr.ph ], [ %indvars.iv.next, %blklab5 ]
  %s.05 = phi i64 [ 0, %while.body9.preheader.lr.ph ], [ %add72, %blklab5 ]
  br i1 true, label %if.end13.lr.ph, label %blklab5, !dbg !259

if.end13.lr.ph:                                   ; preds = %while.body9.preheader
  br label %if.end13, !dbg !259

if.end13:                                         ; preds = %if.end13.lr.ph, %blklab7
  %j.03 = phi i64 [ %s.05, %if.end13.lr.ph ], [ %add70, %blklab7 ]
  %i.02 = phi i64 [ 0, %if.end13.lr.ph ], [ %add71, %blklab7 ]
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !157, metadata !30), !dbg !158
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !138, metadata !30), !dbg !139
  tail call void @llvm.dbg.value(metadata i64 1, i64 0, metadata !159, metadata !30), !dbg !160
  %add = add nuw nsw i64 %i.02, 1, !dbg !261
  tail call void @llvm.dbg.value(metadata i64 %add, i64 0, metadata !161, metadata !30), !dbg !162
  %cmp14 = icmp sge i64 %add, %n, !dbg !262
  %cmp18 = icmp slt i64 %j.03, 1, !dbg !264
  %or.cond = or i1 %cmp14, %cmp18, !dbg !266
  tail call void @llvm.dbg.value(metadata i64 1, i64 0, metadata !163, metadata !30), !dbg !164
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !167, metadata !30), !dbg !168
  br i1 %or.cond, label %blklab8, label %if.end21, !dbg !266

if.end21:                                         ; preds = %if.end13
  tail call void @llvm.dbg.value(metadata i64 1, i64 0, metadata !169, metadata !30), !dbg !170
  %add22 = add nuw nsw i64 %i.02, 1, !dbg !267
  tail call void @llvm.dbg.value(metadata i64 %add22, i64 0, metadata !171, metadata !30), !dbg !172
  %mul23 = mul nsw i64 %add22, %n, !dbg !268
  tail call void @llvm.dbg.value(metadata i64 %mul23, i64 0, metadata !173, metadata !30), !dbg !174
  tail call void @llvm.dbg.value(metadata i64 %add24, i64 0, metadata !175, metadata !30), !dbg !176
  tail call void @llvm.dbg.value(metadata i64 1, i64 0, metadata !177, metadata !30), !dbg !178
  %add24 = add nsw i64 %j.03, -1, !dbg !269
  %sub25 = add i64 %add24, %mul23, !dbg !270
  tail call void @llvm.dbg.value(metadata i64 %sub25, i64 0, metadata !179, metadata !30), !dbg !180
  %arrayidx = getelementptr inbounds i64, i64* %call, i64 %sub25, !dbg !271
  %0 = load i64, i64* %arrayidx, align 8, !dbg !271
  tail call void @llvm.dbg.value(metadata i64 %0, i64 0, metadata !181, metadata !30), !dbg !182
  tail call void @llvm.dbg.value(metadata i64 %0, i64 0, metadata !138, metadata !30), !dbg !139
  br label %blklab8, !dbg !272

blklab8:                                          ; preds = %if.end13, %if.end21
  %y.0 = phi i64 [ %0, %if.end21 ], [ 0, %if.end13 ]
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !183, metadata !30), !dbg !184
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !140, metadata !30), !dbg !141
  tail call void @llvm.dbg.value(metadata i64 2, i64 0, metadata !185, metadata !30), !dbg !186
  %add26 = add nuw nsw i64 %i.02, 2, !dbg !273
  tail call void @llvm.dbg.value(metadata i64 %add26, i64 0, metadata !187, metadata !30), !dbg !188
  %cmp27 = icmp slt i64 %add26, %n, !dbg !274
  br i1 %cmp27, label %if.end30, label %blklab9, !dbg !276

if.end30:                                         ; preds = %blklab8
  tail call void @llvm.dbg.value(metadata i64 2, i64 0, metadata !189, metadata !30), !dbg !190
  %add31 = add nuw nsw i64 %i.02, 2, !dbg !277
  tail call void @llvm.dbg.value(metadata i64 %add31, i64 0, metadata !191, metadata !30), !dbg !192
  %mul32 = mul nsw i64 %add31, %n, !dbg !278
  tail call void @llvm.dbg.value(metadata i64 %mul32, i64 0, metadata !193, metadata !30), !dbg !194
  %add33 = add nsw i64 %mul32, %j.03, !dbg !279
  tail call void @llvm.dbg.value(metadata i64 %add33, i64 0, metadata !195, metadata !30), !dbg !196
  %arrayidx34 = getelementptr inbounds i64, i64* %call, i64 %add33, !dbg !280
  %1 = load i64, i64* %arrayidx34, align 8, !dbg !280
  tail call void @llvm.dbg.value(metadata i64 %1, i64 0, metadata !197, metadata !30), !dbg !198
  tail call void @llvm.dbg.value(metadata i64 %1, i64 0, metadata !140, metadata !30), !dbg !141
  br label %blklab9, !dbg !281

blklab9:                                          ; preds = %blklab8, %if.end30
  %x.0 = phi i64 [ %1, %if.end30 ], [ 0, %blklab8 ]
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !199, metadata !30), !dbg !200
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !142, metadata !30), !dbg !143
  tail call void @llvm.dbg.value(metadata i64 1, i64 0, metadata !201, metadata !30), !dbg !202
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !205, metadata !30), !dbg !206
  %cmp36 = icmp slt i64 %j.03, 2, !dbg !282
  br i1 %cmp36, label %blklab10, label %if.end39, !dbg !284

if.end39:                                         ; preds = %blklab9
  %mul40 = mul nsw i64 %i.02, %n, !dbg !285
  tail call void @llvm.dbg.value(metadata i64 %mul40, i64 0, metadata !207, metadata !30), !dbg !208
  tail call void @llvm.dbg.value(metadata i64 %add41, i64 0, metadata !209, metadata !30), !dbg !210
  tail call void @llvm.dbg.value(metadata i64 2, i64 0, metadata !211, metadata !30), !dbg !212
  %add41 = add nsw i64 %j.03, -2, !dbg !286
  %sub42 = add i64 %add41, %mul40, !dbg !287
  tail call void @llvm.dbg.value(metadata i64 %sub42, i64 0, metadata !213, metadata !30), !dbg !214
  %arrayidx43 = getelementptr inbounds i64, i64* %call, i64 %sub42, !dbg !288
  %2 = load i64, i64* %arrayidx43, align 8, !dbg !288
  tail call void @llvm.dbg.value(metadata i64 %2, i64 0, metadata !215, metadata !30), !dbg !216
  tail call void @llvm.dbg.value(metadata i64 %2, i64 0, metadata !142, metadata !30), !dbg !143
  br label %blklab10, !dbg !289

blklab10:                                         ; preds = %blklab9, %if.end39
  %z.0 = phi i64 [ %2, %if.end39 ], [ 0, %blklab9 ]
  %cmp44 = icmp sgt i64 %x.0, %y.0, !dbg !290
  %y.0.x.0 = select i1 %cmp44, i64 %y.0, i64 %x.0, !dbg !292
  %cmp48 = icmp sgt i64 %z.0, %y.0, !dbg !293
  tail call void @llvm.dbg.value(metadata i64 %y.0, i64 0, metadata !142, metadata !30), !dbg !143
  %z.1 = select i1 %cmp48, i64 %y.0, i64 %z.0, !dbg !295
  %arrayidx52 = getelementptr inbounds i64, i64* %coins, i64 %i.02, !dbg !296
  %3 = load i64, i64* %arrayidx52, align 8, !dbg !296
  tail call void @llvm.dbg.value(metadata i64 %3, i64 0, metadata !217, metadata !30), !dbg !218
  %add53 = add nsw i64 %3, %y.0.x.0, !dbg !297
  tail call void @llvm.dbg.value(metadata i64 %add53, i64 0, metadata !219, metadata !30), !dbg !220
  %arrayidx54 = getelementptr inbounds i64, i64* %coins, i64 %j.03, !dbg !298
  %4 = load i64, i64* %arrayidx54, align 8, !dbg !298
  tail call void @llvm.dbg.value(metadata i64 %4, i64 0, metadata !221, metadata !30), !dbg !222
  %add55 = add nsw i64 %4, %z.1, !dbg !299
  tail call void @llvm.dbg.value(metadata i64 %add55, i64 0, metadata !223, metadata !30), !dbg !224
  %cmp56 = icmp sgt i64 %add53, %add55, !dbg !300
  br i1 %cmp56, label %if.end59, label %blklab13, !dbg !302

if.end59:                                         ; preds = %blklab10
  %arrayidx60 = getelementptr inbounds i64, i64* %coins, i64 %i.02, !dbg !303
  %5 = load i64, i64* %arrayidx60, align 8, !dbg !303
  tail call void @llvm.dbg.value(metadata i64 %5, i64 0, metadata !225, metadata !30), !dbg !226
  %add61 = add nsw i64 %5, %y.0.x.0, !dbg !304
  tail call void @llvm.dbg.value(metadata i64 %add61, i64 0, metadata !227, metadata !30), !dbg !228
  %mul62 = mul nsw i64 %i.02, %n, !dbg !305
  tail call void @llvm.dbg.value(metadata i64 %mul62, i64 0, metadata !229, metadata !30), !dbg !230
  %add63 = add nsw i64 %mul62, %j.03, !dbg !306
  tail call void @llvm.dbg.value(metadata i64 %add63, i64 0, metadata !231, metadata !30), !dbg !232
  %arrayidx64 = getelementptr inbounds i64, i64* %call, i64 %add63, !dbg !307
  store i64 %add61, i64* %arrayidx64, align 8, !dbg !308
  br label %blklab7, !dbg !309

blklab13:                                         ; preds = %blklab10
  %arrayidx65 = getelementptr inbounds i64, i64* %coins, i64 %j.03, !dbg !310
  %6 = load i64, i64* %arrayidx65, align 8, !dbg !310
  tail call void @llvm.dbg.value(metadata i64 %6, i64 0, metadata !233, metadata !30), !dbg !234
  %add66 = add nsw i64 %6, %z.1, !dbg !311
  tail call void @llvm.dbg.value(metadata i64 %add66, i64 0, metadata !235, metadata !30), !dbg !236
  %mul67 = mul nsw i64 %i.02, %n, !dbg !312
  tail call void @llvm.dbg.value(metadata i64 %mul67, i64 0, metadata !237, metadata !30), !dbg !238
  %add68 = add nsw i64 %mul67, %j.03, !dbg !313
  tail call void @llvm.dbg.value(metadata i64 %add68, i64 0, metadata !239, metadata !30), !dbg !240
  %arrayidx69 = getelementptr inbounds i64, i64* %call, i64 %add68, !dbg !314
  store i64 %add66, i64* %arrayidx69, align 8, !dbg !315
  br label %blklab7, !dbg !314

blklab7:                                          ; preds = %if.end59, %blklab13
  tail call void @llvm.dbg.value(metadata i64 1, i64 0, metadata !241, metadata !30), !dbg !242
  tail call void @llvm.dbg.value(metadata i64 %add70, i64 0, metadata !243, metadata !30), !dbg !244
  tail call void @llvm.dbg.value(metadata i64 %add70, i64 0, metadata !134, metadata !30), !dbg !135
  tail call void @llvm.dbg.value(metadata i64 1, i64 0, metadata !245, metadata !30), !dbg !246
  tail call void @llvm.dbg.value(metadata i64 %add71, i64 0, metadata !247, metadata !30), !dbg !248
  tail call void @llvm.dbg.value(metadata i64 %add71, i64 0, metadata !136, metadata !30), !dbg !137
  %add71 = add nuw nsw i64 %i.02, 1, !dbg !316
  %add70 = add nuw nsw i64 %j.03, 1, !dbg !317
  %exitcond = icmp ne i64 %add71, %indvars.iv, !dbg !259
  br i1 %exitcond, label %if.end13, label %while.body9.blklab5_crit_edge, !dbg !259

while.body9.blklab5_crit_edge:                    ; preds = %blklab7
  br label %blklab5, !dbg !259

blklab5:                                          ; preds = %while.body9.blklab5_crit_edge, %while.body9.preheader
  tail call void @llvm.dbg.value(metadata i64 1, i64 0, metadata !249, metadata !30), !dbg !250
  tail call void @llvm.dbg.value(metadata i64 %add72, i64 0, metadata !251, metadata !30), !dbg !252
  tail call void @llvm.dbg.value(metadata i64 %add72, i64 0, metadata !132, metadata !30), !dbg !133
  %add72 = add nuw nsw i64 %s.05, 1, !dbg !318
  %indvars.iv.next = add i64 %indvars.iv, -1, !dbg !258
  %exitcond6 = icmp ne i64 %add72, %n, !dbg !258
  br i1 %exitcond6, label %while.body9.preheader, label %while.body.blklab4_crit_edge, !dbg !258

while.body.blklab4_crit_edge:                     ; preds = %blklab5
  br label %blklab4, !dbg !258

blklab4:                                          ; preds = %while.body.blklab4_crit_edge, %entry.split
  br i1 %coins_has_ownership, label %if.then74, label %if.end81, !dbg !319

if.then74:                                        ; preds = %blklab4
  %7 = bitcast i64* %coins to i8*, !dbg !320
  tail call void @free(i8* %7) #5, !dbg !320
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !118, metadata !30), !dbg !119
  br label %if.end81, !dbg !320

if.end81:                                         ; preds = %if.then74, %blklab4
  ret i64* %call, !dbg !324
}

; Function Attrs: nounwind uwtable
define i32 @main(i32 %argc, i8** %args) #0 !dbg !18 {
entry:
  br label %entry.split, !dbg !325

entry.split:                                      ; preds = %entry
  tail call void @llvm.dbg.value(metadata i32 %argc, i64 0, metadata !326, metadata !30), !dbg !325
  tail call void @llvm.dbg.value(metadata i8** %args, i64 0, metadata !327, metadata !30), !dbg !328
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !329, metadata !30), !dbg !330
  tail call void @llvm.dbg.value(metadata i64* null, i64 0, metadata !331, metadata !30), !dbg !332
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !333, metadata !30), !dbg !332
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !334, metadata !30), !dbg !335
  tail call void @llvm.dbg.value(metadata i64* null, i64 0, metadata !336, metadata !30), !dbg !337
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !338, metadata !30), !dbg !337
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !339, metadata !30), !dbg !340
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !341, metadata !30), !dbg !342
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !343, metadata !30), !dbg !344
  tail call void @llvm.dbg.value(metadata i64** null, i64 0, metadata !345, metadata !30), !dbg !347
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !348, metadata !30), !dbg !347
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !349, metadata !30), !dbg !347
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !350, metadata !30), !dbg !351
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !352, metadata !30), !dbg !353
  tail call void @llvm.dbg.value(metadata i64* null, i64 0, metadata !354, metadata !30), !dbg !355
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !356, metadata !30), !dbg !355
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !357, metadata !30), !dbg !358
  tail call void @llvm.dbg.value(metadata i64* null, i64 0, metadata !359, metadata !30), !dbg !360
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !361, metadata !30), !dbg !360
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !362, metadata !30), !dbg !363
  tail call void @llvm.dbg.value(metadata i64* null, i64 0, metadata !364, metadata !30), !dbg !365
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !366, metadata !30), !dbg !365
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !367, metadata !30), !dbg !368
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !369, metadata !30), !dbg !370
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !371, metadata !30), !dbg !372
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !373, metadata !30), !dbg !374
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !375, metadata !30), !dbg !376
  tail call void @llvm.dbg.value(metadata i64* null, i64 0, metadata !377, metadata !30), !dbg !378
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !379, metadata !30), !dbg !378
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !380, metadata !30), !dbg !381
  tail call void @llvm.dbg.value(metadata i64* null, i64 0, metadata !382, metadata !30), !dbg !383
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !384, metadata !30), !dbg !383
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !385, metadata !30), !dbg !386
  %call = tail call i64** @convertArgsToIntArray(i32 %argc, i8** %args) #5, !dbg !387
  tail call void @llvm.dbg.value(metadata i64** %call, i64 0, metadata !345, metadata !30), !dbg !347
  %sub = add nsw i32 %argc, -1, !dbg !387
  %conv = sext i32 %sub to i64, !dbg !387
  tail call void @llvm.dbg.value(metadata i64 %conv, i64 0, metadata !348, metadata !30), !dbg !347
  tail call void @llvm.dbg.value(metadata i8 1, i64 0, metadata !350, metadata !30), !dbg !351
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !352, metadata !30), !dbg !353
  %0 = load i64*, i64** %call, align 8, !dbg !388
  tail call void @llvm.dbg.value(metadata i64* %0, i64 0, metadata !354, metadata !30), !dbg !355
  %call1 = tail call i64* @parseStringToInt(i64* %0) #5, !dbg !389
  tail call void @llvm.dbg.value(metadata i64* %call1, i64 0, metadata !390, metadata !30), !dbg !391
  tail call void @llvm.dbg.value(metadata i64* %call1, i64 0, metadata !392, metadata !30), !dbg !393
  %cmp = icmp eq i64* %call1, null, !dbg !394
  br i1 %cmp, label %blklab15, label %if.end, !dbg !396

if.end:                                           ; preds = %entry.split
  %1 = load i64, i64* %call1, align 8, !dbg !397
  tail call void @llvm.dbg.value(metadata i64 %1, i64 0, metadata !329, metadata !30), !dbg !330
  %call5 = tail call i64* @init(i64 %1), !dbg !398
  tail call void @llvm.dbg.value(metadata i64* %call5, i64 0, metadata !359, metadata !30), !dbg !360
  tail call void @llvm.dbg.value(metadata i8 1, i64 0, metadata !362, metadata !30), !dbg !363
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !333, metadata !30), !dbg !332
  tail call void @llvm.dbg.value(metadata i64* %call5, i64 0, metadata !331, metadata !30), !dbg !332
  tail call void @llvm.dbg.value(metadata i8 1, i64 0, metadata !334, metadata !30), !dbg !335
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !362, metadata !30), !dbg !363
  tail call void @llvm.dbg.value(metadata i8 1, i64 0, metadata !334, metadata !30), !dbg !335
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !366, metadata !30), !dbg !365
  %call12 = tail call i64* @findMoves(i64* %call5, i64 0, i1 zeroext false, i64 %1), !dbg !399
  tail call void @llvm.dbg.value(metadata i64* %call12, i64 0, metadata !364, metadata !30), !dbg !365
  tail call void @llvm.dbg.value(metadata i8 1, i64 0, metadata !367, metadata !30), !dbg !368
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !338, metadata !30), !dbg !337
  tail call void @llvm.dbg.value(metadata i64* %call12, i64 0, metadata !336, metadata !30), !dbg !337
  tail call void @llvm.dbg.value(metadata i8 1, i64 0, metadata !339, metadata !30), !dbg !340
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !367, metadata !30), !dbg !368
  tail call void @llvm.dbg.value(metadata i64 1, i64 0, metadata !369, metadata !30), !dbg !370
  %sub16 = add nsw i64 %1, -1, !dbg !400
  tail call void @llvm.dbg.value(metadata i64 %sub16, i64 0, metadata !371, metadata !30), !dbg !372
  %arrayidx17 = getelementptr inbounds i64, i64* %call12, i64 %sub16, !dbg !401
  %2 = load i64, i64* %arrayidx17, align 8, !dbg !401
  tail call void @llvm.dbg.value(metadata i64 %2, i64 0, metadata !373, metadata !30), !dbg !374
  tail call void @llvm.dbg.value(metadata i64 %2, i64 0, metadata !341, metadata !30), !dbg !342
  tail call void @llvm.dbg.value(metadata i8 1, i64 0, metadata !334, metadata !30), !dbg !335
  %call18 = tail call i64 @getBobSum(i64 %2, i64* %call5, i64 0, i1 zeroext false, i64 %1), !dbg !402
  tail call void @llvm.dbg.value(metadata i64 %call18, i64 0, metadata !375, metadata !30), !dbg !376
  tail call void @llvm.dbg.value(metadata i64 %call18, i64 0, metadata !343, metadata !30), !dbg !344
  %cmp19 = icmp slt i64 %2, %call18, !dbg !403
  br i1 %cmp19, label %if.end22, label %if.end26, !dbg !406

if.end22:                                         ; preds = %if.end
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !dbg !407
  %4 = tail call i64 @fwrite(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str, i64 0, i64 0), i64 4, i64 1, %struct._IO_FILE* %3) #6, !dbg !408
  tail call void @exit(i32 -1) #7, !dbg !409
  unreachable, !dbg !409

if.end26:                                         ; preds = %if.end
  tail call void @llvm.dbg.value(metadata i64 50, i64 0, metadata !379, metadata !30), !dbg !378
  %call27 = tail call noalias i8* @malloc(i64 400) #5, !dbg !410
  %5 = bitcast i8* %call27 to i64*, !dbg !410
  tail call void @llvm.dbg.value(metadata i64* %5, i64 0, metadata !377, metadata !30), !dbg !378
  store i64 84, i64* %5, align 8, !dbg !411
  %arrayidx29 = getelementptr inbounds i8, i8* %call27, i64 8, !dbg !412
  %6 = bitcast i8* %arrayidx29 to i64*, !dbg !412
  store i64 104, i64* %6, align 8, !dbg !413
  %arrayidx30 = getelementptr inbounds i8, i8* %call27, i64 16, !dbg !414
  %7 = bitcast i8* %arrayidx30 to i64*, !dbg !414
  store i64 101, i64* %7, align 8, !dbg !415
  %arrayidx31 = getelementptr inbounds i8, i8* %call27, i64 24, !dbg !416
  %8 = bitcast i8* %arrayidx31 to i64*, !dbg !416
  store i64 32, i64* %8, align 8, !dbg !417
  %arrayidx32 = getelementptr inbounds i8, i8* %call27, i64 32, !dbg !418
  %9 = bitcast i8* %arrayidx32 to i64*, !dbg !418
  store i64 116, i64* %9, align 8, !dbg !419
  %arrayidx33 = getelementptr inbounds i8, i8* %call27, i64 40, !dbg !420
  %10 = bitcast i8* %arrayidx33 to i64*, !dbg !420
  store i64 111, i64* %10, align 8, !dbg !421
  %arrayidx34 = getelementptr inbounds i8, i8* %call27, i64 48, !dbg !422
  %11 = bitcast i8* %arrayidx34 to i64*, !dbg !422
  store i64 116, i64* %11, align 8, !dbg !423
  %arrayidx35 = getelementptr inbounds i8, i8* %call27, i64 56, !dbg !424
  %12 = bitcast i8* %arrayidx35 to i64*, !dbg !424
  store i64 97, i64* %12, align 8, !dbg !425
  %arrayidx36 = getelementptr inbounds i8, i8* %call27, i64 64, !dbg !426
  %13 = bitcast i8* %arrayidx36 to i64*, !dbg !426
  store i64 108, i64* %13, align 8, !dbg !427
  %arrayidx37 = getelementptr inbounds i8, i8* %call27, i64 72, !dbg !428
  %14 = bitcast i8* %arrayidx37 to i64*, !dbg !428
  store i64 32, i64* %14, align 8, !dbg !429
  %arrayidx38 = getelementptr inbounds i8, i8* %call27, i64 80, !dbg !430
  %15 = bitcast i8* %arrayidx38 to i64*, !dbg !430
  store i64 97, i64* %15, align 8, !dbg !431
  %arrayidx39 = getelementptr inbounds i8, i8* %call27, i64 88, !dbg !432
  %16 = bitcast i8* %arrayidx39 to i64*, !dbg !432
  store i64 109, i64* %16, align 8, !dbg !433
  %arrayidx40 = getelementptr inbounds i8, i8* %call27, i64 96, !dbg !434
  %17 = bitcast i8* %arrayidx40 to i64*, !dbg !434
  store i64 111, i64* %17, align 8, !dbg !435
  %arrayidx41 = getelementptr inbounds i8, i8* %call27, i64 104, !dbg !436
  %18 = bitcast i8* %arrayidx41 to i64*, !dbg !436
  store i64 117, i64* %18, align 8, !dbg !437
  %arrayidx42 = getelementptr inbounds i8, i8* %call27, i64 112, !dbg !438
  %19 = bitcast i8* %arrayidx42 to i64*, !dbg !438
  store i64 110, i64* %19, align 8, !dbg !439
  %arrayidx43 = getelementptr inbounds i8, i8* %call27, i64 120, !dbg !440
  %20 = bitcast i8* %arrayidx43 to i64*, !dbg !440
  store i64 116, i64* %20, align 8, !dbg !441
  %arrayidx44 = getelementptr inbounds i8, i8* %call27, i64 128, !dbg !442
  %21 = bitcast i8* %arrayidx44 to i64*, !dbg !442
  store i64 32, i64* %21, align 8, !dbg !443
  %arrayidx45 = getelementptr inbounds i8, i8* %call27, i64 136, !dbg !444
  %22 = bitcast i8* %arrayidx45 to i64*, !dbg !444
  store i64 111, i64* %22, align 8, !dbg !445
  %arrayidx46 = getelementptr inbounds i8, i8* %call27, i64 144, !dbg !446
  %23 = bitcast i8* %arrayidx46 to i64*, !dbg !446
  store i64 102, i64* %23, align 8, !dbg !447
  %arrayidx47 = getelementptr inbounds i8, i8* %call27, i64 152, !dbg !448
  %24 = bitcast i8* %arrayidx47 to i64*, !dbg !448
  store i64 32, i64* %24, align 8, !dbg !449
  %arrayidx48 = getelementptr inbounds i8, i8* %call27, i64 160, !dbg !450
  %25 = bitcast i8* %arrayidx48 to i64*, !dbg !450
  store i64 109, i64* %25, align 8, !dbg !451
  %arrayidx49 = getelementptr inbounds i8, i8* %call27, i64 168, !dbg !452
  %26 = bitcast i8* %arrayidx49 to i64*, !dbg !452
  store i64 111, i64* %26, align 8, !dbg !453
  %arrayidx50 = getelementptr inbounds i8, i8* %call27, i64 176, !dbg !454
  %27 = bitcast i8* %arrayidx50 to i64*, !dbg !454
  store i64 110, i64* %27, align 8, !dbg !455
  %arrayidx51 = getelementptr inbounds i8, i8* %call27, i64 184, !dbg !456
  %28 = bitcast i8* %arrayidx51 to i64*, !dbg !456
  store i64 101, i64* %28, align 8, !dbg !457
  %arrayidx52 = getelementptr inbounds i8, i8* %call27, i64 192, !dbg !458
  %29 = bitcast i8* %arrayidx52 to i64*, !dbg !458
  store i64 121, i64* %29, align 8, !dbg !459
  %arrayidx53 = getelementptr inbounds i8, i8* %call27, i64 200, !dbg !460
  %30 = bitcast i8* %arrayidx53 to i64*, !dbg !460
  store i64 32, i64* %30, align 8, !dbg !461
  %arrayidx54 = getelementptr inbounds i8, i8* %call27, i64 208, !dbg !462
  %31 = bitcast i8* %arrayidx54 to i64*, !dbg !462
  store i64 40, i64* %31, align 8, !dbg !463
  %arrayidx55 = getelementptr inbounds i8, i8* %call27, i64 216, !dbg !464
  %32 = bitcast i8* %arrayidx55 to i64*, !dbg !464
  store i64 109, i64* %32, align 8, !dbg !465
  %arrayidx56 = getelementptr inbounds i8, i8* %call27, i64 224, !dbg !466
  %33 = bitcast i8* %arrayidx56 to i64*, !dbg !466
  store i64 97, i64* %33, align 8, !dbg !467
  %arrayidx57 = getelementptr inbounds i8, i8* %call27, i64 232, !dbg !468
  %34 = bitcast i8* %arrayidx57 to i64*, !dbg !468
  store i64 120, i64* %34, align 8, !dbg !469
  %arrayidx58 = getelementptr inbounds i8, i8* %call27, i64 240, !dbg !470
  %35 = bitcast i8* %arrayidx58 to i64*, !dbg !470
  store i64 105, i64* %35, align 8, !dbg !471
  %arrayidx59 = getelementptr inbounds i8, i8* %call27, i64 248, !dbg !472
  %36 = bitcast i8* %arrayidx59 to i64*, !dbg !472
  store i64 109, i64* %36, align 8, !dbg !473
  %arrayidx60 = getelementptr inbounds i8, i8* %call27, i64 256, !dbg !474
  %37 = bitcast i8* %arrayidx60 to i64*, !dbg !474
  store i64 117, i64* %37, align 8, !dbg !475
  %arrayidx61 = getelementptr inbounds i8, i8* %call27, i64 264, !dbg !476
  %38 = bitcast i8* %arrayidx61 to i64*, !dbg !476
  store i64 109, i64* %38, align 8, !dbg !477
  %arrayidx62 = getelementptr inbounds i8, i8* %call27, i64 272, !dbg !478
  %39 = bitcast i8* %arrayidx62 to i64*, !dbg !478
  store i64 41, i64* %39, align 8, !dbg !479
  %arrayidx63 = getelementptr inbounds i8, i8* %call27, i64 280, !dbg !480
  %40 = bitcast i8* %arrayidx63 to i64*, !dbg !480
  store i64 32, i64* %40, align 8, !dbg !481
  %arrayidx64 = getelementptr inbounds i8, i8* %call27, i64 288, !dbg !482
  %41 = bitcast i8* %arrayidx64 to i64*, !dbg !482
  store i64 65, i64* %41, align 8, !dbg !483
  %arrayidx65 = getelementptr inbounds i8, i8* %call27, i64 296, !dbg !484
  %42 = bitcast i8* %arrayidx65 to i64*, !dbg !484
  store i64 108, i64* %42, align 8, !dbg !485
  %arrayidx66 = getelementptr inbounds i8, i8* %call27, i64 304, !dbg !486
  %43 = bitcast i8* %arrayidx66 to i64*, !dbg !486
  store i64 105, i64* %43, align 8, !dbg !487
  %arrayidx67 = getelementptr inbounds i8, i8* %call27, i64 312, !dbg !488
  %44 = bitcast i8* %arrayidx67 to i64*, !dbg !488
  store i64 99, i64* %44, align 8, !dbg !489
  %arrayidx68 = getelementptr inbounds i8, i8* %call27, i64 320, !dbg !490
  %45 = bitcast i8* %arrayidx68 to i64*, !dbg !490
  store i64 101, i64* %45, align 8, !dbg !491
  %arrayidx69 = getelementptr inbounds i8, i8* %call27, i64 328, !dbg !492
  %46 = bitcast i8* %arrayidx69 to i64*, !dbg !492
  store i64 32, i64* %46, align 8, !dbg !493
  %arrayidx70 = getelementptr inbounds i8, i8* %call27, i64 336, !dbg !494
  %47 = bitcast i8* %arrayidx70 to i64*, !dbg !494
  store i64 103, i64* %47, align 8, !dbg !495
  %arrayidx71 = getelementptr inbounds i8, i8* %call27, i64 344, !dbg !496
  %48 = bitcast i8* %arrayidx71 to i64*, !dbg !496
  store i64 101, i64* %48, align 8, !dbg !497
  %arrayidx72 = getelementptr inbounds i8, i8* %call27, i64 352, !dbg !498
  %49 = bitcast i8* %arrayidx72 to i64*, !dbg !498
  store i64 116, i64* %49, align 8, !dbg !499
  %arrayidx73 = getelementptr inbounds i8, i8* %call27, i64 360, !dbg !500
  %50 = bitcast i8* %arrayidx73 to i64*, !dbg !500
  store i64 115, i64* %50, align 8, !dbg !501
  %arrayidx74 = getelementptr inbounds i8, i8* %call27, i64 368, !dbg !502
  %51 = bitcast i8* %arrayidx74 to i64*, !dbg !502
  store i64 32, i64* %51, align 8, !dbg !503
  %arrayidx75 = getelementptr inbounds i8, i8* %call27, i64 376, !dbg !504
  %52 = bitcast i8* %arrayidx75 to i64*, !dbg !504
  store i64 105, i64* %52, align 8, !dbg !505
  %arrayidx76 = getelementptr inbounds i8, i8* %call27, i64 384, !dbg !506
  %53 = bitcast i8* %arrayidx76 to i64*, !dbg !506
  store i64 115, i64* %53, align 8, !dbg !507
  %arrayidx77 = getelementptr inbounds i8, i8* %call27, i64 392, !dbg !508
  %54 = bitcast i8* %arrayidx77 to i64*, !dbg !508
  store i64 32, i64* %54, align 8, !dbg !509
  tail call void @llvm.dbg.value(metadata i8 1, i64 0, metadata !380, metadata !30), !dbg !381
  tail call void @printf_s(i64* %5, i64 50) #5, !dbg !510
  %call78 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.1, i64 0, i64 0), i64 %2) #5, !dbg !511
  tail call void @llvm.dbg.value(metadata i64 48, i64 0, metadata !384, metadata !30), !dbg !383
  %call82 = tail call noalias i8* @malloc(i64 384) #5, !dbg !512
  %55 = bitcast i8* %call82 to i64*, !dbg !512
  tail call void @llvm.dbg.value(metadata i64* %55, i64 0, metadata !382, metadata !30), !dbg !383
  store i64 84, i64* %55, align 8, !dbg !513
  %arrayidx84 = getelementptr inbounds i8, i8* %call82, i64 8, !dbg !514
  %56 = bitcast i8* %arrayidx84 to i64*, !dbg !514
  store i64 104, i64* %56, align 8, !dbg !515
  %arrayidx85 = getelementptr inbounds i8, i8* %call82, i64 16, !dbg !516
  %57 = bitcast i8* %arrayidx85 to i64*, !dbg !516
  store i64 101, i64* %57, align 8, !dbg !517
  %arrayidx86 = getelementptr inbounds i8, i8* %call82, i64 24, !dbg !518
  %58 = bitcast i8* %arrayidx86 to i64*, !dbg !518
  store i64 32, i64* %58, align 8, !dbg !519
  %arrayidx87 = getelementptr inbounds i8, i8* %call82, i64 32, !dbg !520
  %59 = bitcast i8* %arrayidx87 to i64*, !dbg !520
  store i64 116, i64* %59, align 8, !dbg !521
  %arrayidx88 = getelementptr inbounds i8, i8* %call82, i64 40, !dbg !522
  %60 = bitcast i8* %arrayidx88 to i64*, !dbg !522
  store i64 111, i64* %60, align 8, !dbg !523
  %arrayidx89 = getelementptr inbounds i8, i8* %call82, i64 48, !dbg !524
  %61 = bitcast i8* %arrayidx89 to i64*, !dbg !524
  store i64 116, i64* %61, align 8, !dbg !525
  %arrayidx90 = getelementptr inbounds i8, i8* %call82, i64 56, !dbg !526
  %62 = bitcast i8* %arrayidx90 to i64*, !dbg !526
  store i64 97, i64* %62, align 8, !dbg !527
  %arrayidx91 = getelementptr inbounds i8, i8* %call82, i64 64, !dbg !528
  %63 = bitcast i8* %arrayidx91 to i64*, !dbg !528
  store i64 108, i64* %63, align 8, !dbg !529
  %arrayidx92 = getelementptr inbounds i8, i8* %call82, i64 72, !dbg !530
  %64 = bitcast i8* %arrayidx92 to i64*, !dbg !530
  store i64 32, i64* %64, align 8, !dbg !531
  %arrayidx93 = getelementptr inbounds i8, i8* %call82, i64 80, !dbg !532
  %65 = bitcast i8* %arrayidx93 to i64*, !dbg !532
  store i64 97, i64* %65, align 8, !dbg !533
  %arrayidx94 = getelementptr inbounds i8, i8* %call82, i64 88, !dbg !534
  %66 = bitcast i8* %arrayidx94 to i64*, !dbg !534
  store i64 109, i64* %66, align 8, !dbg !535
  %arrayidx95 = getelementptr inbounds i8, i8* %call82, i64 96, !dbg !536
  %67 = bitcast i8* %arrayidx95 to i64*, !dbg !536
  store i64 111, i64* %67, align 8, !dbg !537
  %arrayidx96 = getelementptr inbounds i8, i8* %call82, i64 104, !dbg !538
  %68 = bitcast i8* %arrayidx96 to i64*, !dbg !538
  store i64 117, i64* %68, align 8, !dbg !539
  %arrayidx97 = getelementptr inbounds i8, i8* %call82, i64 112, !dbg !540
  %69 = bitcast i8* %arrayidx97 to i64*, !dbg !540
  store i64 110, i64* %69, align 8, !dbg !541
  %arrayidx98 = getelementptr inbounds i8, i8* %call82, i64 120, !dbg !542
  %70 = bitcast i8* %arrayidx98 to i64*, !dbg !542
  store i64 116, i64* %70, align 8, !dbg !543
  %arrayidx99 = getelementptr inbounds i8, i8* %call82, i64 128, !dbg !544
  %71 = bitcast i8* %arrayidx99 to i64*, !dbg !544
  store i64 32, i64* %71, align 8, !dbg !545
  %arrayidx100 = getelementptr inbounds i8, i8* %call82, i64 136, !dbg !546
  %72 = bitcast i8* %arrayidx100 to i64*, !dbg !546
  store i64 111, i64* %72, align 8, !dbg !547
  %arrayidx101 = getelementptr inbounds i8, i8* %call82, i64 144, !dbg !548
  %73 = bitcast i8* %arrayidx101 to i64*, !dbg !548
  store i64 102, i64* %73, align 8, !dbg !549
  %arrayidx102 = getelementptr inbounds i8, i8* %call82, i64 152, !dbg !550
  %74 = bitcast i8* %arrayidx102 to i64*, !dbg !550
  store i64 32, i64* %74, align 8, !dbg !551
  %arrayidx103 = getelementptr inbounds i8, i8* %call82, i64 160, !dbg !552
  %75 = bitcast i8* %arrayidx103 to i64*, !dbg !552
  store i64 109, i64* %75, align 8, !dbg !553
  %arrayidx104 = getelementptr inbounds i8, i8* %call82, i64 168, !dbg !554
  %76 = bitcast i8* %arrayidx104 to i64*, !dbg !554
  store i64 111, i64* %76, align 8, !dbg !555
  %arrayidx105 = getelementptr inbounds i8, i8* %call82, i64 176, !dbg !556
  %77 = bitcast i8* %arrayidx105 to i64*, !dbg !556
  store i64 110, i64* %77, align 8, !dbg !557
  %arrayidx106 = getelementptr inbounds i8, i8* %call82, i64 184, !dbg !558
  %78 = bitcast i8* %arrayidx106 to i64*, !dbg !558
  store i64 101, i64* %78, align 8, !dbg !559
  %arrayidx107 = getelementptr inbounds i8, i8* %call82, i64 192, !dbg !560
  %79 = bitcast i8* %arrayidx107 to i64*, !dbg !560
  store i64 121, i64* %79, align 8, !dbg !561
  %arrayidx108 = getelementptr inbounds i8, i8* %call82, i64 200, !dbg !562
  %80 = bitcast i8* %arrayidx108 to i64*, !dbg !562
  store i64 32, i64* %80, align 8, !dbg !563
  %arrayidx109 = getelementptr inbounds i8, i8* %call82, i64 208, !dbg !564
  %81 = bitcast i8* %arrayidx109 to i64*, !dbg !564
  store i64 40, i64* %81, align 8, !dbg !565
  %arrayidx110 = getelementptr inbounds i8, i8* %call82, i64 216, !dbg !566
  %82 = bitcast i8* %arrayidx110 to i64*, !dbg !566
  store i64 109, i64* %82, align 8, !dbg !567
  %arrayidx111 = getelementptr inbounds i8, i8* %call82, i64 224, !dbg !568
  %83 = bitcast i8* %arrayidx111 to i64*, !dbg !568
  store i64 97, i64* %83, align 8, !dbg !569
  %arrayidx112 = getelementptr inbounds i8, i8* %call82, i64 232, !dbg !570
  %84 = bitcast i8* %arrayidx112 to i64*, !dbg !570
  store i64 120, i64* %84, align 8, !dbg !571
  %arrayidx113 = getelementptr inbounds i8, i8* %call82, i64 240, !dbg !572
  %85 = bitcast i8* %arrayidx113 to i64*, !dbg !572
  store i64 105, i64* %85, align 8, !dbg !573
  %arrayidx114 = getelementptr inbounds i8, i8* %call82, i64 248, !dbg !574
  %86 = bitcast i8* %arrayidx114 to i64*, !dbg !574
  store i64 109, i64* %86, align 8, !dbg !575
  %arrayidx115 = getelementptr inbounds i8, i8* %call82, i64 256, !dbg !576
  %87 = bitcast i8* %arrayidx115 to i64*, !dbg !576
  store i64 117, i64* %87, align 8, !dbg !577
  %arrayidx116 = getelementptr inbounds i8, i8* %call82, i64 264, !dbg !578
  %88 = bitcast i8* %arrayidx116 to i64*, !dbg !578
  store i64 109, i64* %88, align 8, !dbg !579
  %arrayidx117 = getelementptr inbounds i8, i8* %call82, i64 272, !dbg !580
  %89 = bitcast i8* %arrayidx117 to i64*, !dbg !580
  store i64 41, i64* %89, align 8, !dbg !581
  %arrayidx118 = getelementptr inbounds i8, i8* %call82, i64 280, !dbg !582
  %90 = bitcast i8* %arrayidx118 to i64*, !dbg !582
  store i64 32, i64* %90, align 8, !dbg !583
  %arrayidx119 = getelementptr inbounds i8, i8* %call82, i64 288, !dbg !584
  %91 = bitcast i8* %arrayidx119 to i64*, !dbg !584
  store i64 66, i64* %91, align 8, !dbg !585
  %arrayidx120 = getelementptr inbounds i8, i8* %call82, i64 296, !dbg !586
  %92 = bitcast i8* %arrayidx120 to i64*, !dbg !586
  store i64 111, i64* %92, align 8, !dbg !587
  %arrayidx121 = getelementptr inbounds i8, i8* %call82, i64 304, !dbg !588
  %93 = bitcast i8* %arrayidx121 to i64*, !dbg !588
  store i64 98, i64* %93, align 8, !dbg !589
  %arrayidx122 = getelementptr inbounds i8, i8* %call82, i64 312, !dbg !590
  %94 = bitcast i8* %arrayidx122 to i64*, !dbg !590
  store i64 32, i64* %94, align 8, !dbg !591
  %arrayidx123 = getelementptr inbounds i8, i8* %call82, i64 320, !dbg !592
  %95 = bitcast i8* %arrayidx123 to i64*, !dbg !592
  store i64 103, i64* %95, align 8, !dbg !593
  %arrayidx124 = getelementptr inbounds i8, i8* %call82, i64 328, !dbg !594
  %96 = bitcast i8* %arrayidx124 to i64*, !dbg !594
  store i64 101, i64* %96, align 8, !dbg !595
  %arrayidx125 = getelementptr inbounds i8, i8* %call82, i64 336, !dbg !596
  %97 = bitcast i8* %arrayidx125 to i64*, !dbg !596
  store i64 116, i64* %97, align 8, !dbg !597
  %arrayidx126 = getelementptr inbounds i8, i8* %call82, i64 344, !dbg !598
  %98 = bitcast i8* %arrayidx126 to i64*, !dbg !598
  store i64 115, i64* %98, align 8, !dbg !599
  %arrayidx127 = getelementptr inbounds i8, i8* %call82, i64 352, !dbg !600
  %99 = bitcast i8* %arrayidx127 to i64*, !dbg !600
  store i64 32, i64* %99, align 8, !dbg !601
  %arrayidx128 = getelementptr inbounds i8, i8* %call82, i64 360, !dbg !602
  %100 = bitcast i8* %arrayidx128 to i64*, !dbg !602
  store i64 105, i64* %100, align 8, !dbg !603
  %arrayidx129 = getelementptr inbounds i8, i8* %call82, i64 368, !dbg !604
  %101 = bitcast i8* %arrayidx129 to i64*, !dbg !604
  store i64 115, i64* %101, align 8, !dbg !605
  %arrayidx130 = getelementptr inbounds i8, i8* %call82, i64 376, !dbg !606
  %102 = bitcast i8* %arrayidx130 to i64*, !dbg !606
  store i64 32, i64* %102, align 8, !dbg !607
  tail call void @llvm.dbg.value(metadata i8 1, i64 0, metadata !385, metadata !30), !dbg !386
  tail call void @printf_s(i64* %55, i64 48) #5, !dbg !608
  %call131 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.1, i64 0, i64 0), i64 %call18) #5, !dbg !609
  %phitmp = bitcast i64* %call12 to i8*, !dbg !609
  %phitmp1 = bitcast i64* %call5 to i8*, !dbg !609
  br label %blklab15, !dbg !609

blklab15:                                         ; preds = %entry.split, %if.end26
  %103 = phi i8* [ %call27, %if.end26 ], [ null, %entry.split ]
  %moves_has_ownership.0 = phi i1 [ true, %if.end26 ], [ false, %entry.split ]
  %moves.0 = phi i8* [ %phitmp, %if.end26 ], [ null, %entry.split ]
  %coins.0 = phi i8* [ %phitmp1, %if.end26 ], [ null, %entry.split ]
  %104 = phi i8* [ %call82, %if.end26 ], [ null, %entry.split ]
  br i1 %moves_has_ownership.0, label %if.then133, label %if.end155.critedge, !dbg !610

if.then133:                                       ; preds = %blklab15
  tail call void @free(i8* %coins.0) #5, !dbg !611
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !334, metadata !30), !dbg !335
  tail call void @free(i8* %moves.0) #5, !dbg !615
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !339, metadata !30), !dbg !340
  tail call void @free2DArray(i64** %call, i64 %conv) #5, !dbg !619
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !350, metadata !30), !dbg !351
  tail call void @free(i8* %103) #5, !dbg !623
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !380, metadata !30), !dbg !381
  tail call void @free(i8* %104) #5, !dbg !627
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !385, metadata !30), !dbg !386
  br label %if.end155, !dbg !627

if.end155.critedge:                               ; preds = %blklab15
  tail call void @free2DArray(i64** %call, i64 %conv) #5, !dbg !619
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !350, metadata !30), !dbg !351
  br label %if.end155

if.end155:                                        ; preds = %if.end155.critedge, %if.then133
  tail call void @exit(i32 0) #7, !dbg !631
  unreachable, !dbg !631
}

declare i64** @convertArgsToIntArray(i32, i8**) #3

declare i64* @parseStringToInt(i64*) #3

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) #3

; Function Attrs: noreturn nounwind
declare void @exit(i32) #4

; Function Attrs: nounwind
declare noalias i8* @malloc(i64) #2

declare void @printf_s(i64*, i64) #3

declare i32 @printf(i8*, ...) #3

declare void @free2DArray(i64**, i64) #3

; Function Attrs: nounwind readnone
declare void @llvm.dbg.value(metadata, i64, metadata, metadata) #1

; Function Attrs: nounwind
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) #5

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone }
attributes #2 = { nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { noreturn nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { nounwind }
attributes #6 = { cold }
attributes #7 = { noreturn nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!25, !26}
!llvm.ident = !{!27}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 3.9.0 (http://llvm.org/git/clang.git cf7bc8edf8cccb1b5de656c403cb55ad44132e98) (http://llvm.org/git/llvm.git 22706dc4c03305692f494d0e42a6de1050d0ec62)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, subprograms: !5)
!1 = !DIFile(filename: "CoinGame.c", directory: "/home/sam/workspace/WhileyOpenCL/polly/CoinGame/impl/autogenerate")
!2 = !{}
!3 = !{!4}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64, align: 64)
!5 = !{!6, !11, !15, !18}
!6 = distinct !DISubprogram(name: "init", scope: !1, file: !1, line: 2, type: !7, isLocal: false, isDefinition: true, scopeLine: 2, flags: DIFlagPrototyped, isOptimized: false, variables: !2)
!7 = !DISubroutineType(types: !8)
!8 = !{!9, !10}
!9 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !10, size: 64, align: 64)
!10 = !DIBasicType(name: "long long int", size: 64, align: 64, encoding: DW_ATE_signed)
!11 = distinct !DISubprogram(name: "getBobSum", scope: !1, file: !1, line: 59, type: !12, isLocal: false, isDefinition: true, scopeLine: 59, flags: DIFlagPrototyped, isOptimized: false, variables: !2)
!12 = !DISubroutineType(types: !13)
!13 = !{!10, !10, !9, !10, !14, !10}
!14 = !DIBasicType(name: "_Bool", size: 8, align: 8, encoding: DW_ATE_boolean)
!15 = distinct !DISubprogram(name: "findMoves", scope: !1, file: !1, line: 107, type: !16, isLocal: false, isDefinition: true, scopeLine: 107, flags: DIFlagPrototyped, isOptimized: false, variables: !2)
!16 = !DISubroutineType(types: !17)
!17 = !{!9, !9, !10, !14, !10}
!18 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 373, type: !19, isLocal: false, isDefinition: true, scopeLine: 373, flags: DIFlagPrototyped, isOptimized: false, variables: !2)
!19 = !DISubroutineType(types: !20)
!20 = !{!21, !21, !22}
!21 = !DIBasicType(name: "int", size: 32, align: 32, encoding: DW_ATE_signed)
!22 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !23, size: 64, align: 64)
!23 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !24, size: 64, align: 64)
!24 = !DIBasicType(name: "char", size: 8, align: 8, encoding: DW_ATE_signed_char)
!25 = !{i32 2, !"Dwarf Version", i32 4}
!26 = !{i32 2, !"Debug Info Version", i32 3}
!27 = !{!"clang version 3.9.0 (http://llvm.org/git/clang.git cf7bc8edf8cccb1b5de656c403cb55ad44132e98) (http://llvm.org/git/llvm.git 22706dc4c03305692f494d0e42a6de1050d0ec62)"}
!28 = !DILocation(line: 2, column: 27, scope: !6)
!29 = !DILocalVariable(name: "n", arg: 1, scope: !6, file: !1, line: 2, type: !10)
!30 = !DIExpression()
!31 = !DILocalVariable(name: "_1", scope: !6, file: !1, line: 3, type: !9)
!32 = !DILocation(line: 3, column: 2, scope: !6)
!33 = !DILocalVariable(name: "_1_size", scope: !6, file: !1, line: 3, type: !10)
!34 = !DILocalVariable(name: "_1_has_ownership", scope: !6, file: !1, line: 4, type: !14)
!35 = !DILocation(line: 4, column: 2, scope: !6)
!36 = !DILocalVariable(name: "coins", scope: !6, file: !1, line: 5, type: !9)
!37 = !DILocation(line: 5, column: 2, scope: !6)
!38 = !DILocalVariable(name: "coins_size", scope: !6, file: !1, line: 5, type: !10)
!39 = !DILocalVariable(name: "coins_has_ownership", scope: !6, file: !1, line: 6, type: !14)
!40 = !DILocation(line: 6, column: 2, scope: !6)
!41 = !DILocalVariable(name: "i", scope: !6, file: !1, line: 7, type: !10)
!42 = !DILocation(line: 7, column: 12, scope: !6)
!43 = !DILocalVariable(name: "_4", scope: !6, file: !1, line: 8, type: !10)
!44 = !DILocation(line: 8, column: 12, scope: !6)
!45 = !DILocalVariable(name: "_5", scope: !6, file: !1, line: 9, type: !9)
!46 = !DILocation(line: 9, column: 2, scope: !6)
!47 = !DILocalVariable(name: "_5_size", scope: !6, file: !1, line: 9, type: !10)
!48 = !DILocalVariable(name: "_5_has_ownership", scope: !6, file: !1, line: 10, type: !14)
!49 = !DILocation(line: 10, column: 2, scope: !6)
!50 = !DILocalVariable(name: "_6", scope: !6, file: !1, line: 11, type: !10)
!51 = !DILocation(line: 11, column: 12, scope: !6)
!52 = !DILocalVariable(name: "_7", scope: !6, file: !1, line: 12, type: !10)
!53 = !DILocation(line: 12, column: 12, scope: !6)
!54 = !DILocalVariable(name: "_8", scope: !6, file: !1, line: 13, type: !10)
!55 = !DILocation(line: 13, column: 12, scope: !6)
!56 = !DILocalVariable(name: "_9", scope: !6, file: !1, line: 14, type: !10)
!57 = !DILocation(line: 14, column: 12, scope: !6)
!58 = !DILocalVariable(name: "_10", scope: !6, file: !1, line: 15, type: !10)
!59 = !DILocation(line: 15, column: 12, scope: !6)
!60 = !DILocation(line: 20, column: 2, scope: !6)
!61 = !DILocation(line: 34, column: 7, scope: !62)
!62 = distinct !DILexicalBlock(scope: !63, file: !1, line: 34, column: 6)
!63 = distinct !DILexicalBlock(scope: !6, file: !1, line: 32, column: 13)
!64 = !DILocation(line: 34, column: 6, scope: !63)
!65 = !DILocation(line: 36, column: 6, scope: !63)
!66 = !DILocation(line: 38, column: 8, scope: !63)
!67 = !DILocation(line: 40, column: 3, scope: !63)
!68 = !DILocation(line: 40, column: 12, scope: !63)
!69 = !DILocation(line: 44, column: 8, scope: !63)
!70 = !DILocation(line: 55, column: 2, scope: !6)
!71 = !DILocation(line: 59, column: 31, scope: !11)
!72 = !DILocalVariable(name: "sum_alice", arg: 1, scope: !11, file: !1, line: 59, type: !10)
!73 = !DILocalVariable(name: "coins", arg: 2, scope: !11, file: !1, line: 59, type: !9)
!74 = !DILocation(line: 59, column: 42, scope: !11)
!75 = !DILocalVariable(name: "coins_size", arg: 3, scope: !11, file: !1, line: 59, type: !10)
!76 = !DILocalVariable(name: "coins_has_ownership", arg: 4, scope: !11, file: !1, line: 59, type: !14)
!77 = !DIExpression(DW_OP_bit_piece, 0, 1)
!78 = !DILocation(line: 59, column: 70, scope: !11)
!79 = !DILocalVariable(name: "n", arg: 5, scope: !11, file: !1, line: 59, type: !10)
!80 = !DILocation(line: 59, column: 110, scope: !11)
!81 = !DILocalVariable(name: "_3", scope: !11, file: !1, line: 60, type: !10)
!82 = !DILocation(line: 60, column: 12, scope: !11)
!83 = !DILocalVariable(name: "i", scope: !11, file: !1, line: 61, type: !10)
!84 = !DILocation(line: 61, column: 12, scope: !11)
!85 = !DILocalVariable(name: "sum", scope: !11, file: !1, line: 62, type: !10)
!86 = !DILocation(line: 62, column: 12, scope: !11)
!87 = !DILocalVariable(name: "_6", scope: !11, file: !1, line: 63, type: !10)
!88 = !DILocation(line: 63, column: 12, scope: !11)
!89 = !DILocalVariable(name: "_7", scope: !11, file: !1, line: 64, type: !10)
!90 = !DILocation(line: 64, column: 12, scope: !11)
!91 = !DILocalVariable(name: "_8", scope: !11, file: !1, line: 65, type: !10)
!92 = !DILocation(line: 65, column: 12, scope: !11)
!93 = !DILocalVariable(name: "_9", scope: !11, file: !1, line: 66, type: !10)
!94 = !DILocation(line: 66, column: 12, scope: !11)
!95 = !DILocalVariable(name: "_10", scope: !11, file: !1, line: 67, type: !10)
!96 = !DILocation(line: 67, column: 12, scope: !11)
!97 = !DILocalVariable(name: "_11", scope: !11, file: !1, line: 68, type: !10)
!98 = !DILocation(line: 68, column: 12, scope: !11)
!99 = !DILocalVariable(name: "_12", scope: !11, file: !1, line: 69, type: !10)
!100 = !DILocation(line: 69, column: 12, scope: !11)
!101 = !DILocation(line: 81, column: 7, scope: !102)
!102 = distinct !DILexicalBlock(scope: !103, file: !1, line: 81, column: 6)
!103 = distinct !DILexicalBlock(scope: !11, file: !1, line: 79, column: 13)
!104 = !DILocation(line: 81, column: 6, scope: !103)
!105 = !DILocation(line: 91, column: 8, scope: !103)
!106 = !DILocation(line: 83, column: 6, scope: !103)
!107 = !DILocation(line: 85, column: 9, scope: !103)
!108 = !DILocation(line: 100, column: 9, scope: !11)
!109 = !DILocation(line: 102, column: 2, scope: !11)
!110 = !DILocation(line: 102, column: 2, scope: !111)
!111 = !DILexicalBlockFile(scope: !112, file: !1, discriminator: 1)
!112 = distinct !DILexicalBlock(scope: !113, file: !1, line: 102, column: 2)
!113 = distinct !DILexicalBlock(scope: !11, file: !1, line: 102, column: 2)
!114 = !DILocation(line: 103, column: 2, scope: !11)
!115 = !DILocation(line: 107, column: 22, scope: !15)
!116 = !DILocalVariable(name: "coins", arg: 1, scope: !15, file: !1, line: 107, type: !9)
!117 = !DILocalVariable(name: "coins_size", arg: 2, scope: !15, file: !1, line: 107, type: !10)
!118 = !DILocalVariable(name: "coins_has_ownership", arg: 3, scope: !15, file: !1, line: 107, type: !14)
!119 = !DILocation(line: 107, column: 50, scope: !15)
!120 = !DILocalVariable(name: "n", arg: 4, scope: !15, file: !1, line: 107, type: !10)
!121 = !DILocation(line: 107, column: 90, scope: !15)
!122 = !DILocalVariable(name: "_2", scope: !15, file: !1, line: 108, type: !9)
!123 = !DILocation(line: 108, column: 2, scope: !15)
!124 = !DILocalVariable(name: "_2_size", scope: !15, file: !1, line: 108, type: !10)
!125 = !DILocalVariable(name: "_2_has_ownership", scope: !15, file: !1, line: 109, type: !14)
!126 = !DILocation(line: 109, column: 2, scope: !15)
!127 = !DILocalVariable(name: "moves", scope: !15, file: !1, line: 110, type: !9)
!128 = !DILocation(line: 110, column: 2, scope: !15)
!129 = !DILocalVariable(name: "moves_size", scope: !15, file: !1, line: 110, type: !10)
!130 = !DILocalVariable(name: "moves_has_ownership", scope: !15, file: !1, line: 111, type: !14)
!131 = !DILocation(line: 111, column: 2, scope: !15)
!132 = !DILocalVariable(name: "s", scope: !15, file: !1, line: 112, type: !10)
!133 = !DILocation(line: 112, column: 12, scope: !15)
!134 = !DILocalVariable(name: "j", scope: !15, file: !1, line: 113, type: !10)
!135 = !DILocation(line: 113, column: 12, scope: !15)
!136 = !DILocalVariable(name: "i", scope: !15, file: !1, line: 114, type: !10)
!137 = !DILocation(line: 114, column: 12, scope: !15)
!138 = !DILocalVariable(name: "y", scope: !15, file: !1, line: 115, type: !10)
!139 = !DILocation(line: 115, column: 12, scope: !15)
!140 = !DILocalVariable(name: "x", scope: !15, file: !1, line: 116, type: !10)
!141 = !DILocation(line: 116, column: 12, scope: !15)
!142 = !DILocalVariable(name: "z", scope: !15, file: !1, line: 117, type: !10)
!143 = !DILocation(line: 117, column: 12, scope: !15)
!144 = !DILocalVariable(name: "_10", scope: !15, file: !1, line: 118, type: !10)
!145 = !DILocation(line: 118, column: 12, scope: !15)
!146 = !DILocalVariable(name: "_11", scope: !15, file: !1, line: 119, type: !10)
!147 = !DILocation(line: 119, column: 12, scope: !15)
!148 = !DILocalVariable(name: "_12", scope: !15, file: !1, line: 120, type: !9)
!149 = !DILocation(line: 120, column: 2, scope: !15)
!150 = !DILocalVariable(name: "_12_size", scope: !15, file: !1, line: 120, type: !10)
!151 = !DILocalVariable(name: "_12_has_ownership", scope: !15, file: !1, line: 121, type: !14)
!152 = !DILocation(line: 121, column: 2, scope: !15)
!153 = !DILocalVariable(name: "_13", scope: !15, file: !1, line: 122, type: !10)
!154 = !DILocation(line: 122, column: 12, scope: !15)
!155 = !DILocalVariable(name: "_14", scope: !15, file: !1, line: 123, type: !10)
!156 = !DILocation(line: 123, column: 12, scope: !15)
!157 = !DILocalVariable(name: "_15", scope: !15, file: !1, line: 124, type: !10)
!158 = !DILocation(line: 124, column: 12, scope: !15)
!159 = !DILocalVariable(name: "_16", scope: !15, file: !1, line: 125, type: !10)
!160 = !DILocation(line: 125, column: 12, scope: !15)
!161 = !DILocalVariable(name: "_17", scope: !15, file: !1, line: 126, type: !10)
!162 = !DILocation(line: 126, column: 12, scope: !15)
!163 = !DILocalVariable(name: "_18", scope: !15, file: !1, line: 127, type: !10)
!164 = !DILocation(line: 127, column: 12, scope: !15)
!165 = !DILocalVariable(name: "_19", scope: !15, file: !1, line: 128, type: !10)
!166 = !DILocation(line: 128, column: 12, scope: !15)
!167 = !DILocalVariable(name: "_20", scope: !15, file: !1, line: 129, type: !10)
!168 = !DILocation(line: 129, column: 12, scope: !15)
!169 = !DILocalVariable(name: "_21", scope: !15, file: !1, line: 130, type: !10)
!170 = !DILocation(line: 130, column: 12, scope: !15)
!171 = !DILocalVariable(name: "_22", scope: !15, file: !1, line: 131, type: !10)
!172 = !DILocation(line: 131, column: 12, scope: !15)
!173 = !DILocalVariable(name: "_23", scope: !15, file: !1, line: 132, type: !10)
!174 = !DILocation(line: 132, column: 12, scope: !15)
!175 = !DILocalVariable(name: "_24", scope: !15, file: !1, line: 133, type: !10)
!176 = !DILocation(line: 133, column: 12, scope: !15)
!177 = !DILocalVariable(name: "_25", scope: !15, file: !1, line: 134, type: !10)
!178 = !DILocation(line: 134, column: 12, scope: !15)
!179 = !DILocalVariable(name: "_26", scope: !15, file: !1, line: 135, type: !10)
!180 = !DILocation(line: 135, column: 12, scope: !15)
!181 = !DILocalVariable(name: "_27", scope: !15, file: !1, line: 136, type: !10)
!182 = !DILocation(line: 136, column: 12, scope: !15)
!183 = !DILocalVariable(name: "_28", scope: !15, file: !1, line: 137, type: !10)
!184 = !DILocation(line: 137, column: 12, scope: !15)
!185 = !DILocalVariable(name: "_29", scope: !15, file: !1, line: 138, type: !10)
!186 = !DILocation(line: 138, column: 12, scope: !15)
!187 = !DILocalVariable(name: "_30", scope: !15, file: !1, line: 139, type: !10)
!188 = !DILocation(line: 139, column: 12, scope: !15)
!189 = !DILocalVariable(name: "_31", scope: !15, file: !1, line: 140, type: !10)
!190 = !DILocation(line: 140, column: 12, scope: !15)
!191 = !DILocalVariable(name: "_32", scope: !15, file: !1, line: 141, type: !10)
!192 = !DILocation(line: 141, column: 12, scope: !15)
!193 = !DILocalVariable(name: "_33", scope: !15, file: !1, line: 142, type: !10)
!194 = !DILocation(line: 142, column: 12, scope: !15)
!195 = !DILocalVariable(name: "_34", scope: !15, file: !1, line: 143, type: !10)
!196 = !DILocation(line: 143, column: 12, scope: !15)
!197 = !DILocalVariable(name: "_35", scope: !15, file: !1, line: 144, type: !10)
!198 = !DILocation(line: 144, column: 12, scope: !15)
!199 = !DILocalVariable(name: "_36", scope: !15, file: !1, line: 145, type: !10)
!200 = !DILocation(line: 145, column: 12, scope: !15)
!201 = !DILocalVariable(name: "_37", scope: !15, file: !1, line: 146, type: !10)
!202 = !DILocation(line: 146, column: 12, scope: !15)
!203 = !DILocalVariable(name: "_38", scope: !15, file: !1, line: 147, type: !10)
!204 = !DILocation(line: 147, column: 12, scope: !15)
!205 = !DILocalVariable(name: "_39", scope: !15, file: !1, line: 148, type: !10)
!206 = !DILocation(line: 148, column: 12, scope: !15)
!207 = !DILocalVariable(name: "_40", scope: !15, file: !1, line: 149, type: !10)
!208 = !DILocation(line: 149, column: 12, scope: !15)
!209 = !DILocalVariable(name: "_41", scope: !15, file: !1, line: 150, type: !10)
!210 = !DILocation(line: 150, column: 12, scope: !15)
!211 = !DILocalVariable(name: "_42", scope: !15, file: !1, line: 151, type: !10)
!212 = !DILocation(line: 151, column: 12, scope: !15)
!213 = !DILocalVariable(name: "_43", scope: !15, file: !1, line: 152, type: !10)
!214 = !DILocation(line: 152, column: 12, scope: !15)
!215 = !DILocalVariable(name: "_44", scope: !15, file: !1, line: 153, type: !10)
!216 = !DILocation(line: 153, column: 12, scope: !15)
!217 = !DILocalVariable(name: "_45", scope: !15, file: !1, line: 154, type: !10)
!218 = !DILocation(line: 154, column: 12, scope: !15)
!219 = !DILocalVariable(name: "_46", scope: !15, file: !1, line: 155, type: !10)
!220 = !DILocation(line: 155, column: 12, scope: !15)
!221 = !DILocalVariable(name: "_47", scope: !15, file: !1, line: 156, type: !10)
!222 = !DILocation(line: 156, column: 12, scope: !15)
!223 = !DILocalVariable(name: "_48", scope: !15, file: !1, line: 157, type: !10)
!224 = !DILocation(line: 157, column: 12, scope: !15)
!225 = !DILocalVariable(name: "_49", scope: !15, file: !1, line: 158, type: !10)
!226 = !DILocation(line: 158, column: 12, scope: !15)
!227 = !DILocalVariable(name: "_50", scope: !15, file: !1, line: 159, type: !10)
!228 = !DILocation(line: 159, column: 12, scope: !15)
!229 = !DILocalVariable(name: "_51", scope: !15, file: !1, line: 160, type: !10)
!230 = !DILocation(line: 160, column: 12, scope: !15)
!231 = !DILocalVariable(name: "_52", scope: !15, file: !1, line: 161, type: !10)
!232 = !DILocation(line: 161, column: 12, scope: !15)
!233 = !DILocalVariable(name: "_53", scope: !15, file: !1, line: 162, type: !10)
!234 = !DILocation(line: 162, column: 12, scope: !15)
!235 = !DILocalVariable(name: "_54", scope: !15, file: !1, line: 163, type: !10)
!236 = !DILocation(line: 163, column: 12, scope: !15)
!237 = !DILocalVariable(name: "_55", scope: !15, file: !1, line: 164, type: !10)
!238 = !DILocation(line: 164, column: 12, scope: !15)
!239 = !DILocalVariable(name: "_56", scope: !15, file: !1, line: 165, type: !10)
!240 = !DILocation(line: 165, column: 12, scope: !15)
!241 = !DILocalVariable(name: "_57", scope: !15, file: !1, line: 166, type: !10)
!242 = !DILocation(line: 166, column: 12, scope: !15)
!243 = !DILocalVariable(name: "_58", scope: !15, file: !1, line: 167, type: !10)
!244 = !DILocation(line: 167, column: 12, scope: !15)
!245 = !DILocalVariable(name: "_59", scope: !15, file: !1, line: 168, type: !10)
!246 = !DILocation(line: 168, column: 12, scope: !15)
!247 = !DILocalVariable(name: "_60", scope: !15, file: !1, line: 169, type: !10)
!248 = !DILocation(line: 169, column: 12, scope: !15)
!249 = !DILocalVariable(name: "_61", scope: !15, file: !1, line: 170, type: !10)
!250 = !DILocation(line: 170, column: 12, scope: !15)
!251 = !DILocalVariable(name: "_62", scope: !15, file: !1, line: 171, type: !10)
!252 = !DILocation(line: 171, column: 12, scope: !15)
!253 = !DILocation(line: 175, column: 7, scope: !15)
!254 = !DILocation(line: 178, column: 2, scope: !15)
!255 = !DILocation(line: 192, column: 7, scope: !256)
!256 = distinct !DILexicalBlock(scope: !257, file: !1, line: 192, column: 6)
!257 = distinct !DILexicalBlock(scope: !15, file: !1, line: 190, column: 13)
!258 = !DILocation(line: 192, column: 6, scope: !257)
!259 = !DILocation(line: 202, column: 7, scope: !260)
!260 = distinct !DILexicalBlock(scope: !257, file: !1, line: 200, column: 14)
!261 = !DILocation(line: 210, column: 9, scope: !260)
!262 = !DILocation(line: 212, column: 10, scope: !263)
!263 = distinct !DILexicalBlock(scope: !260, file: !1, line: 212, column: 7)
!264 = !DILocation(line: 220, column: 10, scope: !265)
!265 = distinct !DILexicalBlock(scope: !260, file: !1, line: 220, column: 7)
!266 = !DILocation(line: 212, column: 7, scope: !260)
!267 = !DILocation(line: 224, column: 9, scope: !260)
!268 = !DILocation(line: 226, column: 11, scope: !260)
!269 = !DILocation(line: 228, column: 11, scope: !260)
!270 = !DILocation(line: 232, column: 11, scope: !260)
!271 = !DILocation(line: 234, column: 8, scope: !260)
!272 = !DILocation(line: 236, column: 4, scope: !260)
!273 = !DILocation(line: 246, column: 9, scope: !260)
!274 = !DILocation(line: 248, column: 10, scope: !275)
!275 = distinct !DILexicalBlock(scope: !260, file: !1, line: 248, column: 7)
!276 = !DILocation(line: 248, column: 7, scope: !260)
!277 = !DILocation(line: 252, column: 9, scope: !260)
!278 = !DILocation(line: 254, column: 11, scope: !260)
!279 = !DILocation(line: 256, column: 11, scope: !260)
!280 = !DILocation(line: 258, column: 8, scope: !260)
!281 = !DILocation(line: 260, column: 4, scope: !260)
!282 = !DILocation(line: 274, column: 10, scope: !283)
!283 = distinct !DILexicalBlock(scope: !260, file: !1, line: 274, column: 7)
!284 = !DILocation(line: 274, column: 7, scope: !260)
!285 = !DILocation(line: 276, column: 9, scope: !260)
!286 = !DILocation(line: 278, column: 11, scope: !260)
!287 = !DILocation(line: 282, column: 11, scope: !260)
!288 = !DILocation(line: 284, column: 8, scope: !260)
!289 = !DILocation(line: 286, column: 4, scope: !260)
!290 = !DILocation(line: 290, column: 8, scope: !291)
!291 = distinct !DILexicalBlock(scope: !260, file: !1, line: 290, column: 7)
!292 = !DILocation(line: 292, column: 4, scope: !260)
!293 = !DILocation(line: 296, column: 8, scope: !294)
!294 = distinct !DILexicalBlock(scope: !260, file: !1, line: 296, column: 7)
!295 = !DILocation(line: 296, column: 7, scope: !260)
!296 = !DILocation(line: 302, column: 8, scope: !260)
!297 = !DILocation(line: 304, column: 11, scope: !260)
!298 = !DILocation(line: 306, column: 8, scope: !260)
!299 = !DILocation(line: 308, column: 11, scope: !260)
!300 = !DILocation(line: 310, column: 10, scope: !301)
!301 = distinct !DILexicalBlock(scope: !260, file: !1, line: 310, column: 7)
!302 = !DILocation(line: 310, column: 7, scope: !260)
!303 = !DILocation(line: 312, column: 8, scope: !260)
!304 = !DILocation(line: 314, column: 11, scope: !260)
!305 = !DILocation(line: 316, column: 9, scope: !260)
!306 = !DILocation(line: 318, column: 11, scope: !260)
!307 = !DILocation(line: 320, column: 4, scope: !260)
!308 = !DILocation(line: 320, column: 15, scope: !260)
!309 = !DILocation(line: 322, column: 4, scope: !260)
!310 = !DILocation(line: 326, column: 8, scope: !260)
!311 = !DILocation(line: 328, column: 11, scope: !260)
!312 = !DILocation(line: 330, column: 9, scope: !260)
!313 = !DILocation(line: 332, column: 11, scope: !260)
!314 = !DILocation(line: 334, column: 4, scope: !260)
!315 = !DILocation(line: 334, column: 15, scope: !260)
!316 = !DILocation(line: 346, column: 9, scope: !260)
!317 = !DILocation(line: 340, column: 9, scope: !260)
!318 = !DILocation(line: 357, column: 8, scope: !257)
!319 = !DILocation(line: 366, column: 2, scope: !15)
!320 = !DILocation(line: 366, column: 2, scope: !321)
!321 = !DILexicalBlockFile(scope: !322, file: !1, discriminator: 1)
!322 = distinct !DILexicalBlock(scope: !323, file: !1, line: 366, column: 2)
!323 = distinct !DILexicalBlock(scope: !15, file: !1, line: 366, column: 2)
!324 = !DILocation(line: 369, column: 2, scope: !15)
!325 = !DILocation(line: 373, column: 14, scope: !18)
!326 = !DILocalVariable(name: "argc", arg: 1, scope: !18, file: !1, line: 373, type: !21)
!327 = !DILocalVariable(name: "args", arg: 2, scope: !18, file: !1, line: 373, type: !22)
!328 = !DILocation(line: 373, column: 27, scope: !18)
!329 = !DILocalVariable(name: "n", scope: !18, file: !1, line: 375, type: !10)
!330 = !DILocation(line: 375, column: 12, scope: !18)
!331 = !DILocalVariable(name: "coins", scope: !18, file: !1, line: 376, type: !9)
!332 = !DILocation(line: 376, column: 2, scope: !18)
!333 = !DILocalVariable(name: "coins_size", scope: !18, file: !1, line: 376, type: !10)
!334 = !DILocalVariable(name: "coins_has_ownership", scope: !18, file: !1, line: 377, type: !14)
!335 = !DILocation(line: 377, column: 2, scope: !18)
!336 = !DILocalVariable(name: "moves", scope: !18, file: !1, line: 378, type: !9)
!337 = !DILocation(line: 378, column: 2, scope: !18)
!338 = !DILocalVariable(name: "moves_size", scope: !18, file: !1, line: 378, type: !10)
!339 = !DILocalVariable(name: "moves_has_ownership", scope: !18, file: !1, line: 379, type: !14)
!340 = !DILocation(line: 379, column: 2, scope: !18)
!341 = !DILocalVariable(name: "sum_alice", scope: !18, file: !1, line: 380, type: !10)
!342 = !DILocation(line: 380, column: 12, scope: !18)
!343 = !DILocalVariable(name: "sum_bob", scope: !18, file: !1, line: 381, type: !10)
!344 = !DILocation(line: 381, column: 12, scope: !18)
!345 = !DILocalVariable(name: "_8", scope: !18, file: !1, line: 383, type: !346)
!346 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !9, size: 64, align: 64)
!347 = !DILocation(line: 383, column: 2, scope: !18)
!348 = !DILocalVariable(name: "_8_size", scope: !18, file: !1, line: 383, type: !10)
!349 = !DILocalVariable(name: "_8_size_size", scope: !18, file: !1, line: 383, type: !10)
!350 = !DILocalVariable(name: "_8_has_ownership", scope: !18, file: !1, line: 384, type: !14)
!351 = !DILocation(line: 384, column: 2, scope: !18)
!352 = !DILocalVariable(name: "_9", scope: !18, file: !1, line: 385, type: !10)
!353 = !DILocation(line: 385, column: 12, scope: !18)
!354 = !DILocalVariable(name: "_10", scope: !18, file: !1, line: 386, type: !9)
!355 = !DILocation(line: 386, column: 2, scope: !18)
!356 = !DILocalVariable(name: "_10_size", scope: !18, file: !1, line: 386, type: !10)
!357 = !DILocalVariable(name: "_10_has_ownership", scope: !18, file: !1, line: 387, type: !14)
!358 = !DILocation(line: 387, column: 2, scope: !18)
!359 = !DILocalVariable(name: "_11", scope: !18, file: !1, line: 388, type: !9)
!360 = !DILocation(line: 388, column: 2, scope: !18)
!361 = !DILocalVariable(name: "_11_size", scope: !18, file: !1, line: 388, type: !10)
!362 = !DILocalVariable(name: "_11_has_ownership", scope: !18, file: !1, line: 389, type: !14)
!363 = !DILocation(line: 389, column: 2, scope: !18)
!364 = !DILocalVariable(name: "_12", scope: !18, file: !1, line: 390, type: !9)
!365 = !DILocation(line: 390, column: 2, scope: !18)
!366 = !DILocalVariable(name: "_12_size", scope: !18, file: !1, line: 390, type: !10)
!367 = !DILocalVariable(name: "_12_has_ownership", scope: !18, file: !1, line: 391, type: !14)
!368 = !DILocation(line: 391, column: 2, scope: !18)
!369 = !DILocalVariable(name: "_13", scope: !18, file: !1, line: 392, type: !10)
!370 = !DILocation(line: 392, column: 12, scope: !18)
!371 = !DILocalVariable(name: "_14", scope: !18, file: !1, line: 393, type: !10)
!372 = !DILocation(line: 393, column: 12, scope: !18)
!373 = !DILocalVariable(name: "_15", scope: !18, file: !1, line: 394, type: !10)
!374 = !DILocation(line: 394, column: 12, scope: !18)
!375 = !DILocalVariable(name: "_16", scope: !18, file: !1, line: 395, type: !10)
!376 = !DILocation(line: 395, column: 12, scope: !18)
!377 = !DILocalVariable(name: "_19", scope: !18, file: !1, line: 397, type: !9)
!378 = !DILocation(line: 397, column: 2, scope: !18)
!379 = !DILocalVariable(name: "_19_size", scope: !18, file: !1, line: 397, type: !10)
!380 = !DILocalVariable(name: "_19_has_ownership", scope: !18, file: !1, line: 398, type: !14)
!381 = !DILocation(line: 398, column: 2, scope: !18)
!382 = !DILocalVariable(name: "_24", scope: !18, file: !1, line: 401, type: !9)
!383 = !DILocation(line: 401, column: 2, scope: !18)
!384 = !DILocalVariable(name: "_24_size", scope: !18, file: !1, line: 401, type: !10)
!385 = !DILocalVariable(name: "_24_has_ownership", scope: !18, file: !1, line: 402, type: !14)
!386 = !DILocation(line: 402, column: 2, scope: !18)
!387 = !DILocation(line: 405, column: 2, scope: !18)
!388 = !DILocation(line: 410, column: 6, scope: !18)
!389 = !DILocation(line: 412, column: 2, scope: !18)
!390 = !DILocalVariable(name: "_7", scope: !18, file: !1, line: 382, type: !9)
!391 = !DILocation(line: 382, column: 13, scope: !18)
!392 = !DILocalVariable(name: "max", scope: !18, file: !1, line: 374, type: !9)
!393 = !DILocation(line: 374, column: 13, scope: !18)
!394 = !DILocation(line: 416, column: 9, scope: !395)
!395 = distinct !DILexicalBlock(scope: !18, file: !1, line: 416, column: 5)
!396 = !DILocation(line: 416, column: 5, scope: !18)
!397 = !DILocation(line: 418, column: 6, scope: !18)
!398 = !DILocation(line: 421, column: 8, scope: !18)
!399 = !DILocation(line: 432, column: 8, scope: !18)
!400 = !DILocation(line: 442, column: 7, scope: !18)
!401 = !DILocation(line: 444, column: 6, scope: !18)
!402 = !DILocation(line: 449, column: 8, scope: !18)
!403 = !DILocation(line: 455, column: 15, scope: !404)
!404 = distinct !DILexicalBlock(scope: !405, file: !1, line: 455, column: 6)
!405 = distinct !DILexicalBlock(scope: !18, file: !1, line: 453, column: 2)
!406 = !DILocation(line: 455, column: 6, scope: !405)
!407 = !DILocation(line: 457, column: 11, scope: !405)
!408 = !DILocation(line: 457, column: 3, scope: !405)
!409 = !DILocation(line: 458, column: 3, scope: !405)
!410 = !DILocation(line: 467, column: 2, scope: !18)
!411 = !DILocation(line: 468, column: 9, scope: !18)
!412 = !DILocation(line: 468, column: 15, scope: !18)
!413 = !DILocation(line: 468, column: 22, scope: !18)
!414 = !DILocation(line: 468, column: 29, scope: !18)
!415 = !DILocation(line: 468, column: 36, scope: !18)
!416 = !DILocation(line: 468, column: 43, scope: !18)
!417 = !DILocation(line: 468, column: 50, scope: !18)
!418 = !DILocation(line: 468, column: 56, scope: !18)
!419 = !DILocation(line: 468, column: 63, scope: !18)
!420 = !DILocation(line: 468, column: 70, scope: !18)
!421 = !DILocation(line: 468, column: 77, scope: !18)
!422 = !DILocation(line: 468, column: 84, scope: !18)
!423 = !DILocation(line: 468, column: 91, scope: !18)
!424 = !DILocation(line: 468, column: 98, scope: !18)
!425 = !DILocation(line: 468, column: 105, scope: !18)
!426 = !DILocation(line: 468, column: 111, scope: !18)
!427 = !DILocation(line: 468, column: 118, scope: !18)
!428 = !DILocation(line: 468, column: 125, scope: !18)
!429 = !DILocation(line: 468, column: 132, scope: !18)
!430 = !DILocation(line: 468, column: 138, scope: !18)
!431 = !DILocation(line: 468, column: 146, scope: !18)
!432 = !DILocation(line: 468, column: 152, scope: !18)
!433 = !DILocation(line: 468, column: 160, scope: !18)
!434 = !DILocation(line: 468, column: 167, scope: !18)
!435 = !DILocation(line: 468, column: 175, scope: !18)
!436 = !DILocation(line: 468, column: 182, scope: !18)
!437 = !DILocation(line: 468, column: 190, scope: !18)
!438 = !DILocation(line: 468, column: 197, scope: !18)
!439 = !DILocation(line: 468, column: 205, scope: !18)
!440 = !DILocation(line: 468, column: 212, scope: !18)
!441 = !DILocation(line: 468, column: 220, scope: !18)
!442 = !DILocation(line: 468, column: 227, scope: !18)
!443 = !DILocation(line: 468, column: 235, scope: !18)
!444 = !DILocation(line: 468, column: 241, scope: !18)
!445 = !DILocation(line: 468, column: 249, scope: !18)
!446 = !DILocation(line: 468, column: 256, scope: !18)
!447 = !DILocation(line: 468, column: 264, scope: !18)
!448 = !DILocation(line: 468, column: 271, scope: !18)
!449 = !DILocation(line: 468, column: 279, scope: !18)
!450 = !DILocation(line: 468, column: 285, scope: !18)
!451 = !DILocation(line: 468, column: 293, scope: !18)
!452 = !DILocation(line: 468, column: 300, scope: !18)
!453 = !DILocation(line: 468, column: 308, scope: !18)
!454 = !DILocation(line: 468, column: 315, scope: !18)
!455 = !DILocation(line: 468, column: 323, scope: !18)
!456 = !DILocation(line: 468, column: 330, scope: !18)
!457 = !DILocation(line: 468, column: 338, scope: !18)
!458 = !DILocation(line: 468, column: 345, scope: !18)
!459 = !DILocation(line: 468, column: 353, scope: !18)
!460 = !DILocation(line: 468, column: 360, scope: !18)
!461 = !DILocation(line: 468, column: 368, scope: !18)
!462 = !DILocation(line: 468, column: 374, scope: !18)
!463 = !DILocation(line: 468, column: 382, scope: !18)
!464 = !DILocation(line: 468, column: 388, scope: !18)
!465 = !DILocation(line: 468, column: 396, scope: !18)
!466 = !DILocation(line: 468, column: 403, scope: !18)
!467 = !DILocation(line: 468, column: 411, scope: !18)
!468 = !DILocation(line: 468, column: 417, scope: !18)
!469 = !DILocation(line: 468, column: 425, scope: !18)
!470 = !DILocation(line: 468, column: 432, scope: !18)
!471 = !DILocation(line: 468, column: 440, scope: !18)
!472 = !DILocation(line: 468, column: 447, scope: !18)
!473 = !DILocation(line: 468, column: 455, scope: !18)
!474 = !DILocation(line: 468, column: 462, scope: !18)
!475 = !DILocation(line: 468, column: 470, scope: !18)
!476 = !DILocation(line: 468, column: 477, scope: !18)
!477 = !DILocation(line: 468, column: 485, scope: !18)
!478 = !DILocation(line: 468, column: 492, scope: !18)
!479 = !DILocation(line: 468, column: 500, scope: !18)
!480 = !DILocation(line: 468, column: 506, scope: !18)
!481 = !DILocation(line: 468, column: 514, scope: !18)
!482 = !DILocation(line: 468, column: 520, scope: !18)
!483 = !DILocation(line: 468, column: 528, scope: !18)
!484 = !DILocation(line: 468, column: 534, scope: !18)
!485 = !DILocation(line: 468, column: 542, scope: !18)
!486 = !DILocation(line: 468, column: 549, scope: !18)
!487 = !DILocation(line: 468, column: 557, scope: !18)
!488 = !DILocation(line: 468, column: 564, scope: !18)
!489 = !DILocation(line: 468, column: 572, scope: !18)
!490 = !DILocation(line: 468, column: 578, scope: !18)
!491 = !DILocation(line: 468, column: 586, scope: !18)
!492 = !DILocation(line: 468, column: 593, scope: !18)
!493 = !DILocation(line: 468, column: 601, scope: !18)
!494 = !DILocation(line: 468, column: 607, scope: !18)
!495 = !DILocation(line: 468, column: 615, scope: !18)
!496 = !DILocation(line: 468, column: 622, scope: !18)
!497 = !DILocation(line: 468, column: 630, scope: !18)
!498 = !DILocation(line: 468, column: 637, scope: !18)
!499 = !DILocation(line: 468, column: 645, scope: !18)
!500 = !DILocation(line: 468, column: 652, scope: !18)
!501 = !DILocation(line: 468, column: 660, scope: !18)
!502 = !DILocation(line: 468, column: 667, scope: !18)
!503 = !DILocation(line: 468, column: 675, scope: !18)
!504 = !DILocation(line: 468, column: 681, scope: !18)
!505 = !DILocation(line: 468, column: 689, scope: !18)
!506 = !DILocation(line: 468, column: 696, scope: !18)
!507 = !DILocation(line: 468, column: 704, scope: !18)
!508 = !DILocation(line: 468, column: 711, scope: !18)
!509 = !DILocation(line: 468, column: 719, scope: !18)
!510 = !DILocation(line: 471, column: 2, scope: !18)
!511 = !DILocation(line: 475, column: 2, scope: !18)
!512 = !DILocation(line: 480, column: 2, scope: !18)
!513 = !DILocation(line: 481, column: 9, scope: !18)
!514 = !DILocation(line: 481, column: 15, scope: !18)
!515 = !DILocation(line: 481, column: 22, scope: !18)
!516 = !DILocation(line: 481, column: 29, scope: !18)
!517 = !DILocation(line: 481, column: 36, scope: !18)
!518 = !DILocation(line: 481, column: 43, scope: !18)
!519 = !DILocation(line: 481, column: 50, scope: !18)
!520 = !DILocation(line: 481, column: 56, scope: !18)
!521 = !DILocation(line: 481, column: 63, scope: !18)
!522 = !DILocation(line: 481, column: 70, scope: !18)
!523 = !DILocation(line: 481, column: 77, scope: !18)
!524 = !DILocation(line: 481, column: 84, scope: !18)
!525 = !DILocation(line: 481, column: 91, scope: !18)
!526 = !DILocation(line: 481, column: 98, scope: !18)
!527 = !DILocation(line: 481, column: 105, scope: !18)
!528 = !DILocation(line: 481, column: 111, scope: !18)
!529 = !DILocation(line: 481, column: 118, scope: !18)
!530 = !DILocation(line: 481, column: 125, scope: !18)
!531 = !DILocation(line: 481, column: 132, scope: !18)
!532 = !DILocation(line: 481, column: 138, scope: !18)
!533 = !DILocation(line: 481, column: 146, scope: !18)
!534 = !DILocation(line: 481, column: 152, scope: !18)
!535 = !DILocation(line: 481, column: 160, scope: !18)
!536 = !DILocation(line: 481, column: 167, scope: !18)
!537 = !DILocation(line: 481, column: 175, scope: !18)
!538 = !DILocation(line: 481, column: 182, scope: !18)
!539 = !DILocation(line: 481, column: 190, scope: !18)
!540 = !DILocation(line: 481, column: 197, scope: !18)
!541 = !DILocation(line: 481, column: 205, scope: !18)
!542 = !DILocation(line: 481, column: 212, scope: !18)
!543 = !DILocation(line: 481, column: 220, scope: !18)
!544 = !DILocation(line: 481, column: 227, scope: !18)
!545 = !DILocation(line: 481, column: 235, scope: !18)
!546 = !DILocation(line: 481, column: 241, scope: !18)
!547 = !DILocation(line: 481, column: 249, scope: !18)
!548 = !DILocation(line: 481, column: 256, scope: !18)
!549 = !DILocation(line: 481, column: 264, scope: !18)
!550 = !DILocation(line: 481, column: 271, scope: !18)
!551 = !DILocation(line: 481, column: 279, scope: !18)
!552 = !DILocation(line: 481, column: 285, scope: !18)
!553 = !DILocation(line: 481, column: 293, scope: !18)
!554 = !DILocation(line: 481, column: 300, scope: !18)
!555 = !DILocation(line: 481, column: 308, scope: !18)
!556 = !DILocation(line: 481, column: 315, scope: !18)
!557 = !DILocation(line: 481, column: 323, scope: !18)
!558 = !DILocation(line: 481, column: 330, scope: !18)
!559 = !DILocation(line: 481, column: 338, scope: !18)
!560 = !DILocation(line: 481, column: 345, scope: !18)
!561 = !DILocation(line: 481, column: 353, scope: !18)
!562 = !DILocation(line: 481, column: 360, scope: !18)
!563 = !DILocation(line: 481, column: 368, scope: !18)
!564 = !DILocation(line: 481, column: 374, scope: !18)
!565 = !DILocation(line: 481, column: 382, scope: !18)
!566 = !DILocation(line: 481, column: 388, scope: !18)
!567 = !DILocation(line: 481, column: 396, scope: !18)
!568 = !DILocation(line: 481, column: 403, scope: !18)
!569 = !DILocation(line: 481, column: 411, scope: !18)
!570 = !DILocation(line: 481, column: 417, scope: !18)
!571 = !DILocation(line: 481, column: 425, scope: !18)
!572 = !DILocation(line: 481, column: 432, scope: !18)
!573 = !DILocation(line: 481, column: 440, scope: !18)
!574 = !DILocation(line: 481, column: 447, scope: !18)
!575 = !DILocation(line: 481, column: 455, scope: !18)
!576 = !DILocation(line: 481, column: 462, scope: !18)
!577 = !DILocation(line: 481, column: 470, scope: !18)
!578 = !DILocation(line: 481, column: 477, scope: !18)
!579 = !DILocation(line: 481, column: 485, scope: !18)
!580 = !DILocation(line: 481, column: 492, scope: !18)
!581 = !DILocation(line: 481, column: 500, scope: !18)
!582 = !DILocation(line: 481, column: 506, scope: !18)
!583 = !DILocation(line: 481, column: 514, scope: !18)
!584 = !DILocation(line: 481, column: 520, scope: !18)
!585 = !DILocation(line: 481, column: 528, scope: !18)
!586 = !DILocation(line: 481, column: 534, scope: !18)
!587 = !DILocation(line: 481, column: 542, scope: !18)
!588 = !DILocation(line: 481, column: 549, scope: !18)
!589 = !DILocation(line: 481, column: 557, scope: !18)
!590 = !DILocation(line: 481, column: 563, scope: !18)
!591 = !DILocation(line: 481, column: 571, scope: !18)
!592 = !DILocation(line: 481, column: 577, scope: !18)
!593 = !DILocation(line: 481, column: 585, scope: !18)
!594 = !DILocation(line: 481, column: 592, scope: !18)
!595 = !DILocation(line: 481, column: 600, scope: !18)
!596 = !DILocation(line: 481, column: 607, scope: !18)
!597 = !DILocation(line: 481, column: 615, scope: !18)
!598 = !DILocation(line: 481, column: 622, scope: !18)
!599 = !DILocation(line: 481, column: 630, scope: !18)
!600 = !DILocation(line: 481, column: 637, scope: !18)
!601 = !DILocation(line: 481, column: 645, scope: !18)
!602 = !DILocation(line: 481, column: 651, scope: !18)
!603 = !DILocation(line: 481, column: 659, scope: !18)
!604 = !DILocation(line: 481, column: 666, scope: !18)
!605 = !DILocation(line: 481, column: 674, scope: !18)
!606 = !DILocation(line: 481, column: 681, scope: !18)
!607 = !DILocation(line: 481, column: 689, scope: !18)
!608 = !DILocation(line: 484, column: 2, scope: !18)
!609 = !DILocation(line: 488, column: 2, scope: !18)
!610 = !DILocation(line: 492, column: 2, scope: !18)
!611 = !DILocation(line: 492, column: 2, scope: !612)
!612 = !DILexicalBlockFile(scope: !613, file: !1, discriminator: 1)
!613 = distinct !DILexicalBlock(scope: !614, file: !1, line: 492, column: 2)
!614 = distinct !DILexicalBlock(scope: !18, file: !1, line: 492, column: 2)
!615 = !DILocation(line: 493, column: 2, scope: !616)
!616 = !DILexicalBlockFile(scope: !617, file: !1, discriminator: 1)
!617 = distinct !DILexicalBlock(scope: !618, file: !1, line: 493, column: 2)
!618 = distinct !DILexicalBlock(scope: !18, file: !1, line: 493, column: 2)
!619 = !DILocation(line: 494, column: 2, scope: !620)
!620 = !DILexicalBlockFile(scope: !621, file: !1, discriminator: 1)
!621 = distinct !DILexicalBlock(scope: !622, file: !1, line: 494, column: 2)
!622 = distinct !DILexicalBlock(scope: !18, file: !1, line: 494, column: 2)
!623 = !DILocation(line: 498, column: 2, scope: !624)
!624 = !DILexicalBlockFile(scope: !625, file: !1, discriminator: 1)
!625 = distinct !DILexicalBlock(scope: !626, file: !1, line: 498, column: 2)
!626 = distinct !DILexicalBlock(scope: !18, file: !1, line: 498, column: 2)
!627 = !DILocation(line: 499, column: 2, scope: !628)
!628 = !DILexicalBlockFile(scope: !629, file: !1, discriminator: 1)
!629 = distinct !DILexicalBlock(scope: !630, file: !1, line: 499, column: 2)
!630 = distinct !DILexicalBlock(scope: !18, file: !1, line: 499, column: 2)
!631 = !DILocation(line: 500, column: 2, scope: !18)
