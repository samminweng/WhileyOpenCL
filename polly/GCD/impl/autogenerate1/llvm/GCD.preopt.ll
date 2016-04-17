; ModuleID = 'GCD.preopt.s'
source_filename = "GCD.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external global %struct._IO_FILE*, align 8
@.str = private unnamed_addr constant [5 x i8] c"fail\00", align 1
@.str.1 = private unnamed_addr constant [6 x i8] c"%lld\0A\00", align 1

; Function Attrs: nounwind uwtable
define i64 @gcd(i64 %a, i64 %b) #0 !dbg !6 {
entry:
  br label %entry.split, !dbg !25

entry.split:                                      ; preds = %entry
  tail call void @llvm.dbg.value(metadata i64 %a, i64 0, metadata !26, metadata !27), !dbg !25
  tail call void @llvm.dbg.value(metadata i64 %b, i64 0, metadata !28, metadata !27), !dbg !29
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !30, metadata !27), !dbg !31
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !32, metadata !27), !dbg !33
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !34, metadata !27), !dbg !35
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !36, metadata !27), !dbg !37
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !38, metadata !27), !dbg !39
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !40, metadata !27), !dbg !41
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !32, metadata !27), !dbg !33
  %cmp = icmp eq i64 %a, 0, !dbg !42
  br i1 %cmp, label %return, label %while.body.preheader, !dbg !44

while.body.preheader:                             ; preds = %entry.split
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !34, metadata !27), !dbg !35
  %cmp12 = icmp sgt i64 %a, -1, !dbg !45
  br i1 %cmp12, label %blklab4.lr.ph, label %if.end3, !dbg !49

blklab4.lr.ph:                                    ; preds = %while.body.preheader
  br label %blklab4, !dbg !49

while.body.if.end3_crit_edge:                     ; preds = %if.end6
  br label %if.end3, !dbg !49

if.end3:                                          ; preds = %while.body.if.end3_crit_edge, %while.body.preheader
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !dbg !50
  %1 = tail call i64 @fwrite(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str, i64 0, i64 0), i64 4, i64 1, %struct._IO_FILE* %0) #6, !dbg !51
  tail call void @exit(i32 -1) #7, !dbg !52
  unreachable, !dbg !52

blklab4:                                          ; preds = %blklab4.lr.ph, %if.end6
  %a.addr.04 = phi i64 [ %a, %blklab4.lr.ph ], [ %a.addr.1, %if.end6 ]
  %b.addr.03 = phi i64 [ %b, %blklab4.lr.ph ], [ %b.addr.1, %if.end6 ]
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !36, metadata !27), !dbg !37
  %cmp4 = icmp eq i64 %b.addr.03, 0, !dbg !53
  br i1 %cmp4, label %return.loopexit, label %if.end6, !dbg !55

if.end6:                                          ; preds = %blklab4
  %cmp7 = icmp sgt i64 %a.addr.04, %b.addr.03, !dbg !56
  %sub10 = select i1 %cmp7, i64 0, i64 %a.addr.04, !dbg !58
  %b.addr.1 = sub nsw i64 %b.addr.03, %sub10, !dbg !58
  %sub = select i1 %cmp7, i64 %b.addr.03, i64 0, !dbg !58
  %a.addr.1 = sub nsw i64 %a.addr.04, %sub, !dbg !58
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !34, metadata !27), !dbg !35
  %cmp1 = icmp sgt i64 %a.addr.1, -1, !dbg !45
  br i1 %cmp1, label %blklab4, label %while.body.if.end3_crit_edge, !dbg !49

return.loopexit:                                  ; preds = %blklab4
  %a.addr.04.lcssa = phi i64 [ %a.addr.04, %blklab4 ]
  br label %return, !dbg !59

return:                                           ; preds = %return.loopexit, %entry.split
  %retval.0 = phi i64 [ %b, %entry.split ], [ %a.addr.04.lcssa, %return.loopexit ]
  ret i64 %retval.0, !dbg !59
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) #2

; Function Attrs: noreturn nounwind
declare void @exit(i32) #3

; Function Attrs: nounwind uwtable
define i64 @gcd_cached(i64 %a, i64 %b, i64 %n, i64* %gcds, i64 %gcds_size, i1 zeroext %gcds_has_ownership) #0 !dbg !10 {
entry:
  br label %entry.split, !dbg !60

entry.split:                                      ; preds = %entry
  tail call void @llvm.dbg.value(metadata i64 %a, i64 0, metadata !61, metadata !27), !dbg !60
  tail call void @llvm.dbg.value(metadata i64 %b, i64 0, metadata !62, metadata !27), !dbg !63
  tail call void @llvm.dbg.value(metadata i64 %n, i64 0, metadata !64, metadata !27), !dbg !65
  tail call void @llvm.dbg.value(metadata i64* %gcds, i64 0, metadata !66, metadata !27), !dbg !67
  tail call void @llvm.dbg.value(metadata i64 %gcds_size, i64 0, metadata !68, metadata !27), !dbg !67
  tail call void @llvm.dbg.value(metadata i1 %gcds_has_ownership, i64 0, metadata !69, metadata !70), !dbg !71
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !72, metadata !27), !dbg !73
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !74, metadata !27), !dbg !75
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !76, metadata !27), !dbg !77
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !78, metadata !27), !dbg !79
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !80, metadata !27), !dbg !81
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !82, metadata !27), !dbg !83
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !84, metadata !27), !dbg !85
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !86, metadata !27), !dbg !87
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !74, metadata !27), !dbg !75
  %cmp = icmp eq i64 %a, 0, !dbg !88
  br i1 %cmp, label %if.end, label %blklab7, !dbg !90

if.end:                                           ; preds = %entry.split
  br i1 %gcds_has_ownership, label %if.then1, label %blklab8, !dbg !91

if.then1:                                         ; preds = %if.end
  %0 = bitcast i64* %gcds to i8*, !dbg !92
  tail call void @free(i8* %0) #5, !dbg !92
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !69, metadata !27), !dbg !71
  br label %blklab8, !dbg !92

blklab7:                                          ; preds = %entry.split
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !76, metadata !27), !dbg !77
  %cmp3 = icmp eq i64 %b, 0, !dbg !96
  br i1 %cmp3, label %if.end5, label %blklab9, !dbg !98

if.end5:                                          ; preds = %blklab7
  br i1 %gcds_has_ownership, label %if.then7, label %blklab8, !dbg !99

if.then7:                                         ; preds = %if.end5
  %1 = bitcast i64* %gcds to i8*, !dbg !100
  tail call void @free(i8* %1) #5, !dbg !100
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !69, metadata !27), !dbg !71
  br label %blklab8, !dbg !100

blklab9:                                          ; preds = %blklab7
  %cmp9 = icmp sgt i64 %a, %b, !dbg !104
  %sub12 = select i1 %cmp9, i64 0, i64 %a, !dbg !106
  %b.addr.0 = sub nsw i64 %b, %sub12, !dbg !106
  %sub = select i1 %cmp9, i64 %b, i64 0, !dbg !106
  %a.addr.0 = sub nsw i64 %a, %sub, !dbg !106
  %mul = mul nsw i64 %a.addr.0, %n, !dbg !107
  tail call void @llvm.dbg.value(metadata i64 %mul, i64 0, metadata !82, metadata !27), !dbg !83
  %add = add nsw i64 %mul, %b.addr.0, !dbg !108
  tail call void @llvm.dbg.value(metadata i64 %add, i64 0, metadata !84, metadata !27), !dbg !85
  %arrayidx = getelementptr inbounds i64, i64* %gcds, i64 %add, !dbg !109
  %2 = load i64, i64* %arrayidx, align 8, !dbg !109
  tail call void @llvm.dbg.value(metadata i64 %2, i64 0, metadata !86, metadata !27), !dbg !87
  br i1 %gcds_has_ownership, label %if.then14, label %blklab8, !dbg !110

if.then14:                                        ; preds = %blklab9
  %3 = bitcast i64* %gcds to i8*, !dbg !111
  tail call void @free(i8* %3) #5, !dbg !111
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !69, metadata !27), !dbg !71
  br label %blklab8, !dbg !111

blklab8:                                          ; preds = %blklab9, %if.then14, %if.end5, %if.then7, %if.end, %if.then1
  %retval.0 = phi i64 [ %b, %if.then1 ], [ %b, %if.end ], [ %a, %if.then7 ], [ %a, %if.end5 ], [ %2, %if.then14 ], [ %2, %blklab9 ]
  ret i64 %retval.0, !dbg !115
}

; Function Attrs: nounwind
declare void @free(i8*) #4

; Function Attrs: nounwind uwtable
define i32 @main(i32 %argc, i8** %args) #0 !dbg !15 {
entry:
  br label %entry.split, !dbg !116

entry.split:                                      ; preds = %entry
  tail call void @llvm.dbg.value(metadata i32 %argc, i64 0, metadata !117, metadata !27), !dbg !116
  tail call void @llvm.dbg.value(metadata i8** %args, i64 0, metadata !118, metadata !27), !dbg !119
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !120, metadata !27), !dbg !121
  tail call void @llvm.dbg.value(metadata i64* null, i64 0, metadata !122, metadata !27), !dbg !123
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !124, metadata !27), !dbg !123
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !125, metadata !27), !dbg !126
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !127, metadata !27), !dbg !128
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !129, metadata !27), !dbg !130
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !131, metadata !27), !dbg !132
  tail call void @llvm.dbg.value(metadata i64** null, i64 0, metadata !133, metadata !27), !dbg !135
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !136, metadata !27), !dbg !135
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !137, metadata !27), !dbg !135
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !138, metadata !27), !dbg !139
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !140, metadata !27), !dbg !141
  tail call void @llvm.dbg.value(metadata i64* null, i64 0, metadata !142, metadata !27), !dbg !143
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !144, metadata !27), !dbg !143
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !145, metadata !27), !dbg !146
  tail call void @llvm.dbg.value(metadata i64* null, i64 0, metadata !147, metadata !27), !dbg !148
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !149, metadata !27), !dbg !148
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !150, metadata !27), !dbg !151
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !152, metadata !27), !dbg !153
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !154, metadata !27), !dbg !155
  tail call void @llvm.dbg.value(metadata i64* null, i64 0, metadata !156, metadata !27), !dbg !157
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !158, metadata !27), !dbg !157
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !159, metadata !27), !dbg !160
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !161, metadata !27), !dbg !162
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !163, metadata !27), !dbg !164
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !165, metadata !27), !dbg !166
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !167, metadata !27), !dbg !168
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !169, metadata !27), !dbg !170
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !171, metadata !27), !dbg !172
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !173, metadata !27), !dbg !174
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !175, metadata !27), !dbg !176
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !177, metadata !27), !dbg !178
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !179, metadata !27), !dbg !180
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !181, metadata !27), !dbg !182
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !183, metadata !27), !dbg !184
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !185, metadata !27), !dbg !186
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !187, metadata !27), !dbg !188
  tail call void @llvm.dbg.value(metadata i64* null, i64 0, metadata !189, metadata !27), !dbg !190
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !191, metadata !27), !dbg !190
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !192, metadata !27), !dbg !193
  tail call void @llvm.dbg.value(metadata i64* null, i64 0, metadata !194, metadata !27), !dbg !195
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !196, metadata !27), !dbg !195
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !197, metadata !27), !dbg !198
  %call = tail call i64** @convertArgsToIntArray(i32 %argc, i8** %args) #5, !dbg !199
  tail call void @llvm.dbg.value(metadata i64** %call, i64 0, metadata !133, metadata !27), !dbg !135
  %sub = add nsw i32 %argc, -1, !dbg !199
  %conv = sext i32 %sub to i64, !dbg !199
  tail call void @llvm.dbg.value(metadata i64 %conv, i64 0, metadata !136, metadata !27), !dbg !135
  tail call void @llvm.dbg.value(metadata i8 1, i64 0, metadata !138, metadata !27), !dbg !139
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !140, metadata !27), !dbg !141
  %0 = load i64*, i64** %call, align 8, !dbg !200
  tail call void @llvm.dbg.value(metadata i64* %0, i64 0, metadata !142, metadata !27), !dbg !143
  %call1 = tail call i64* @parseStringToInt(i64* %0) #5, !dbg !201
  tail call void @llvm.dbg.value(metadata i64* %call1, i64 0, metadata !202, metadata !27), !dbg !203
  tail call void @llvm.dbg.value(metadata i64* %call1, i64 0, metadata !204, metadata !27), !dbg !205
  %cmp = icmp eq i64* %call1, null, !dbg !206
  br i1 %cmp, label %blklab13, label %if.end, !dbg !208

if.end:                                           ; preds = %entry.split
  %1 = load i64, i64* %call1, align 8, !dbg !209
  tail call void @llvm.dbg.value(metadata i64 %1, i64 0, metadata !120, metadata !27), !dbg !121
  tail call void @llvm.dbg.value(metadata i64 4, i64 0, metadata !149, metadata !27), !dbg !148
  %call5 = tail call noalias i8* @malloc(i64 32) #5, !dbg !210
  %2 = bitcast i8* %call5 to i64*, !dbg !210
  tail call void @llvm.dbg.value(metadata i64* %2, i64 0, metadata !147, metadata !27), !dbg !148
  store i64 78, i64* %2, align 8, !dbg !211
  %arrayidx7 = getelementptr inbounds i8, i8* %call5, i64 8, !dbg !212
  %3 = bitcast i8* %arrayidx7 to i64*, !dbg !212
  store i64 32, i64* %3, align 8, !dbg !213
  %arrayidx8 = getelementptr inbounds i8, i8* %call5, i64 16, !dbg !214
  %4 = bitcast i8* %arrayidx8 to i64*, !dbg !214
  store i64 61, i64* %4, align 8, !dbg !215
  %arrayidx9 = getelementptr inbounds i8, i8* %call5, i64 24, !dbg !216
  %5 = bitcast i8* %arrayidx9 to i64*, !dbg !216
  store i64 32, i64* %5, align 8, !dbg !217
  tail call void @llvm.dbg.value(metadata i8 1, i64 0, metadata !150, metadata !27), !dbg !151
  tail call void @printf_s(i64* %2, i64 4) #5, !dbg !218
  %call10 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.1, i64 0, i64 0), i64 %1) #5, !dbg !219
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !152, metadata !27), !dbg !153
  %mul = mul nsw i64 %1, %1, !dbg !220
  tail call void @llvm.dbg.value(metadata i64 %mul, i64 0, metadata !154, metadata !27), !dbg !155
  tail call void @llvm.dbg.value(metadata i64 %mul, i64 0, metadata !158, metadata !27), !dbg !157
  %conv15 = trunc i64 %mul to i32, !dbg !221
  %call16 = tail call i64* @gen1DArray(i32 0, i32 %conv15) #5, !dbg !221
  tail call void @llvm.dbg.value(metadata i64* %call16, i64 0, metadata !156, metadata !27), !dbg !157
  tail call void @llvm.dbg.value(metadata i8 1, i64 0, metadata !159, metadata !27), !dbg !160
  tail call void @llvm.dbg.value(metadata i64 %mul, i64 0, metadata !124, metadata !27), !dbg !123
  tail call void @llvm.dbg.value(metadata i64* %call16, i64 0, metadata !122, metadata !27), !dbg !123
  tail call void @llvm.dbg.value(metadata i8 1, i64 0, metadata !125, metadata !27), !dbg !126
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !159, metadata !27), !dbg !160
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !161, metadata !27), !dbg !162
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !127, metadata !27), !dbg !128
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !163, metadata !27), !dbg !164
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !129, metadata !27), !dbg !130
  %cmp205 = icmp sgt i64 %1, 0, !dbg !222
  br i1 %cmp205, label %while.body25.preheader.lr.ph, label %if.end41, !dbg !225

while.body25.preheader.lr.ph:                     ; preds = %if.end
  br label %while.body25.preheader, !dbg !225

while.body25.preheader:                           ; preds = %while.body25.preheader.lr.ph, %blklab15
  %sum.08 = phi i64 [ 0, %while.body25.preheader.lr.ph ], [ %sum.1.lcssa, %blklab15 ]
  %i.06 = phi i64 [ 0, %while.body25.preheader.lr.ph ], [ %add38, %blklab15 ]
  %cmp262 = icmp sgt i64 %1, 0, !dbg !226
  br i1 %cmp262, label %if.end29.lr.ph, label %blklab15, !dbg !229

if.end29.lr.ph:                                   ; preds = %while.body25.preheader
  br label %if.end29, !dbg !229

if.end29:                                         ; preds = %if.end29.lr.ph, %if.end29
  %sum.14 = phi i64 [ %sum.08, %if.end29.lr.ph ], [ %add36, %if.end29 ]
  %j.03 = phi i64 [ 0, %if.end29.lr.ph ], [ %add37, %if.end29 ]
  tail call void @llvm.dbg.value(metadata i8 1, i64 0, metadata !125, metadata !27), !dbg !126
  %call30 = tail call i64 @gcd_cached(i64 %i.06, i64 %j.03, i64 %1, i64* %call16, i64 %mul, i1 zeroext false), !dbg !230
  tail call void @llvm.dbg.value(metadata i64 %call30, i64 0, metadata !167, metadata !27), !dbg !168
  %mul31 = mul nsw i64 %i.06, %1, !dbg !231
  tail call void @llvm.dbg.value(metadata i64 %mul31, i64 0, metadata !169, metadata !27), !dbg !170
  %add = add nsw i64 %j.03, %mul31, !dbg !232
  tail call void @llvm.dbg.value(metadata i64 %add, i64 0, metadata !171, metadata !27), !dbg !172
  %arrayidx32 = getelementptr inbounds i64, i64* %call16, i64 %add, !dbg !233
  store i64 %call30, i64* %arrayidx32, align 8, !dbg !234
  tail call void @llvm.dbg.value(metadata i64 %mul33, i64 0, metadata !173, metadata !27), !dbg !174
  tail call void @llvm.dbg.value(metadata i64 %add34, i64 0, metadata !175, metadata !27), !dbg !176
  tail call void @llvm.dbg.value(metadata i64 %6, i64 0, metadata !177, metadata !27), !dbg !178
  tail call void @llvm.dbg.value(metadata i64 %add36, i64 0, metadata !179, metadata !27), !dbg !180
  tail call void @llvm.dbg.value(metadata i64 %add36, i64 0, metadata !127, metadata !27), !dbg !128
  tail call void @llvm.dbg.value(metadata i64 1, i64 0, metadata !181, metadata !27), !dbg !182
  tail call void @llvm.dbg.value(metadata i64 %add37, i64 0, metadata !183, metadata !27), !dbg !184
  tail call void @llvm.dbg.value(metadata i64 %add37, i64 0, metadata !131, metadata !27), !dbg !132
  %add37 = add nuw nsw i64 %j.03, 1, !dbg !235
  %mul33 = mul nsw i64 %i.06, %1, !dbg !236
  %add34 = add nsw i64 %j.03, %mul33, !dbg !237
  %arrayidx35 = getelementptr inbounds i64, i64* %call16, i64 %add34, !dbg !238
  %6 = load i64, i64* %arrayidx35, align 8, !dbg !238
  %add36 = add nsw i64 %6, %sum.14, !dbg !239
  %exitcond = icmp ne i64 %add37, %1, !dbg !229
  br i1 %exitcond, label %if.end29, label %while.body25.blklab15_crit_edge, !dbg !229

while.body25.blklab15_crit_edge:                  ; preds = %if.end29
  %add36.lcssa = phi i64 [ %add36, %if.end29 ]
  br label %blklab15, !dbg !229

blklab15:                                         ; preds = %while.body25.blklab15_crit_edge, %while.body25.preheader
  %sum.1.lcssa = phi i64 [ %add36.lcssa, %while.body25.blklab15_crit_edge ], [ %sum.08, %while.body25.preheader ]
  tail call void @llvm.dbg.value(metadata i64 1, i64 0, metadata !185, metadata !27), !dbg !186
  tail call void @llvm.dbg.value(metadata i64 %add38, i64 0, metadata !187, metadata !27), !dbg !188
  tail call void @llvm.dbg.value(metadata i64 %add38, i64 0, metadata !129, metadata !27), !dbg !130
  %add38 = add nuw nsw i64 %i.06, 1, !dbg !240
  %exitcond10 = icmp ne i64 %add38, %1, !dbg !225
  br i1 %exitcond10, label %while.body25.preheader, label %while.body.if.end41_crit_edge, !dbg !225

while.body.if.end41_crit_edge:                    ; preds = %blklab15
  %sum.1.lcssa.lcssa = phi i64 [ %sum.1.lcssa, %blklab15 ]
  br label %if.end41, !dbg !225

if.end41:                                         ; preds = %while.body.if.end41_crit_edge, %if.end
  %sum.0.lcssa = phi i64 [ %sum.1.lcssa.lcssa, %while.body.if.end41_crit_edge ], [ 0, %if.end ]
  tail call void @llvm.dbg.value(metadata i64 5, i64 0, metadata !191, metadata !27), !dbg !190
  %call42 = tail call noalias i8* @malloc(i64 40) #5, !dbg !241
  %7 = bitcast i8* %call42 to i64*, !dbg !241
  tail call void @llvm.dbg.value(metadata i64* %7, i64 0, metadata !189, metadata !27), !dbg !190
  store i64 83, i64* %7, align 8, !dbg !242
  %arrayidx44 = getelementptr inbounds i8, i8* %call42, i64 8, !dbg !243
  %8 = bitcast i8* %arrayidx44 to i64*, !dbg !243
  store i64 117, i64* %8, align 8, !dbg !244
  %arrayidx45 = getelementptr inbounds i8, i8* %call42, i64 16, !dbg !245
  %9 = bitcast i8* %arrayidx45 to i64*, !dbg !245
  store i64 109, i64* %9, align 8, !dbg !246
  %arrayidx46 = getelementptr inbounds i8, i8* %call42, i64 24, !dbg !247
  %10 = bitcast i8* %arrayidx46 to i64*, !dbg !247
  store i64 58, i64* %10, align 8, !dbg !248
  %arrayidx47 = getelementptr inbounds i8, i8* %call42, i64 32, !dbg !249
  %11 = bitcast i8* %arrayidx47 to i64*, !dbg !249
  store i64 32, i64* %11, align 8, !dbg !250
  tail call void @llvm.dbg.value(metadata i8 1, i64 0, metadata !192, metadata !27), !dbg !193
  tail call void @printf_s(i64* %7, i64 5) #5, !dbg !251
  %call48 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.1, i64 0, i64 0), i64 %sum.0.lcssa) #5, !dbg !252
  tail call void @llvm.dbg.value(metadata i64 32, i64 0, metadata !196, metadata !27), !dbg !195
  %call52 = tail call noalias i8* @malloc(i64 256) #5, !dbg !253
  %12 = bitcast i8* %call52 to i64*, !dbg !253
  tail call void @llvm.dbg.value(metadata i64* %12, i64 0, metadata !194, metadata !27), !dbg !195
  store i64 80, i64* %12, align 8, !dbg !254
  %arrayidx54 = getelementptr inbounds i8, i8* %call52, i64 8, !dbg !255
  %13 = bitcast i8* %arrayidx54 to i64*, !dbg !255
  store i64 97, i64* %13, align 8, !dbg !256
  %arrayidx55 = getelementptr inbounds i8, i8* %call52, i64 16, !dbg !257
  %14 = bitcast i8* %arrayidx55 to i64*, !dbg !257
  store i64 115, i64* %14, align 8, !dbg !258
  %arrayidx56 = getelementptr inbounds i8, i8* %call52, i64 24, !dbg !259
  %15 = bitcast i8* %arrayidx56 to i64*, !dbg !259
  store i64 115, i64* %15, align 8, !dbg !260
  %arrayidx57 = getelementptr inbounds i8, i8* %call52, i64 32, !dbg !261
  %16 = bitcast i8* %arrayidx57 to i64*, !dbg !261
  store i64 32, i64* %16, align 8, !dbg !262
  %arrayidx58 = getelementptr inbounds i8, i8* %call52, i64 40, !dbg !263
  %17 = bitcast i8* %arrayidx58 to i64*, !dbg !263
  store i64 99, i64* %17, align 8, !dbg !264
  %arrayidx59 = getelementptr inbounds i8, i8* %call52, i64 48, !dbg !265
  %18 = bitcast i8* %arrayidx59 to i64*, !dbg !265
  store i64 97, i64* %18, align 8, !dbg !266
  %arrayidx60 = getelementptr inbounds i8, i8* %call52, i64 56, !dbg !267
  %19 = bitcast i8* %arrayidx60 to i64*, !dbg !267
  store i64 99, i64* %19, align 8, !dbg !268
  %arrayidx61 = getelementptr inbounds i8, i8* %call52, i64 64, !dbg !269
  %20 = bitcast i8* %arrayidx61 to i64*, !dbg !269
  store i64 104, i64* %20, align 8, !dbg !270
  %arrayidx62 = getelementptr inbounds i8, i8* %call52, i64 72, !dbg !271
  %21 = bitcast i8* %arrayidx62 to i64*, !dbg !271
  store i64 101, i64* %21, align 8, !dbg !272
  %arrayidx63 = getelementptr inbounds i8, i8* %call52, i64 80, !dbg !273
  %22 = bitcast i8* %arrayidx63 to i64*, !dbg !273
  store i64 100, i64* %22, align 8, !dbg !274
  %arrayidx64 = getelementptr inbounds i8, i8* %call52, i64 88, !dbg !275
  %23 = bitcast i8* %arrayidx64 to i64*, !dbg !275
  store i64 32, i64* %23, align 8, !dbg !276
  %arrayidx65 = getelementptr inbounds i8, i8* %call52, i64 96, !dbg !277
  %24 = bitcast i8* %arrayidx65 to i64*, !dbg !277
  store i64 69, i64* %24, align 8, !dbg !278
  %arrayidx66 = getelementptr inbounds i8, i8* %call52, i64 104, !dbg !279
  %25 = bitcast i8* %arrayidx66 to i64*, !dbg !279
  store i64 117, i64* %25, align 8, !dbg !280
  %arrayidx67 = getelementptr inbounds i8, i8* %call52, i64 112, !dbg !281
  %26 = bitcast i8* %arrayidx67 to i64*, !dbg !281
  store i64 99, i64* %26, align 8, !dbg !282
  %arrayidx68 = getelementptr inbounds i8, i8* %call52, i64 120, !dbg !283
  %27 = bitcast i8* %arrayidx68 to i64*, !dbg !283
  store i64 108, i64* %27, align 8, !dbg !284
  %arrayidx69 = getelementptr inbounds i8, i8* %call52, i64 128, !dbg !285
  %28 = bitcast i8* %arrayidx69 to i64*, !dbg !285
  store i64 105, i64* %28, align 8, !dbg !286
  %arrayidx70 = getelementptr inbounds i8, i8* %call52, i64 136, !dbg !287
  %29 = bitcast i8* %arrayidx70 to i64*, !dbg !287
  store i64 100, i64* %29, align 8, !dbg !288
  %arrayidx71 = getelementptr inbounds i8, i8* %call52, i64 144, !dbg !289
  %30 = bitcast i8* %arrayidx71 to i64*, !dbg !289
  store i64 32, i64* %30, align 8, !dbg !290
  %arrayidx72 = getelementptr inbounds i8, i8* %call52, i64 152, !dbg !291
  %31 = bitcast i8* %arrayidx72 to i64*, !dbg !291
  store i64 71, i64* %31, align 8, !dbg !292
  %arrayidx73 = getelementptr inbounds i8, i8* %call52, i64 160, !dbg !293
  %32 = bitcast i8* %arrayidx73 to i64*, !dbg !293
  store i64 67, i64* %32, align 8, !dbg !294
  %arrayidx74 = getelementptr inbounds i8, i8* %call52, i64 168, !dbg !295
  %33 = bitcast i8* %arrayidx74 to i64*, !dbg !295
  store i64 68, i64* %33, align 8, !dbg !296
  %arrayidx75 = getelementptr inbounds i8, i8* %call52, i64 176, !dbg !297
  %34 = bitcast i8* %arrayidx75 to i64*, !dbg !297
  store i64 32, i64* %34, align 8, !dbg !298
  %arrayidx76 = getelementptr inbounds i8, i8* %call52, i64 184, !dbg !299
  %35 = bitcast i8* %arrayidx76 to i64*, !dbg !299
  store i64 116, i64* %35, align 8, !dbg !300
  %arrayidx77 = getelementptr inbounds i8, i8* %call52, i64 192, !dbg !301
  %36 = bitcast i8* %arrayidx77 to i64*, !dbg !301
  store i64 101, i64* %36, align 8, !dbg !302
  %arrayidx78 = getelementptr inbounds i8, i8* %call52, i64 200, !dbg !303
  %37 = bitcast i8* %arrayidx78 to i64*, !dbg !303
  store i64 115, i64* %37, align 8, !dbg !304
  %arrayidx79 = getelementptr inbounds i8, i8* %call52, i64 208, !dbg !305
  %38 = bitcast i8* %arrayidx79 to i64*, !dbg !305
  store i64 116, i64* %38, align 8, !dbg !306
  %arrayidx80 = getelementptr inbounds i8, i8* %call52, i64 216, !dbg !307
  %39 = bitcast i8* %arrayidx80 to i64*, !dbg !307
  store i64 32, i64* %39, align 8, !dbg !308
  %arrayidx81 = getelementptr inbounds i8, i8* %call52, i64 224, !dbg !309
  %40 = bitcast i8* %arrayidx81 to i64*, !dbg !309
  store i64 99, i64* %40, align 8, !dbg !310
  %arrayidx82 = getelementptr inbounds i8, i8* %call52, i64 232, !dbg !311
  %41 = bitcast i8* %arrayidx82 to i64*, !dbg !311
  store i64 97, i64* %41, align 8, !dbg !312
  %arrayidx83 = getelementptr inbounds i8, i8* %call52, i64 240, !dbg !313
  %42 = bitcast i8* %arrayidx83 to i64*, !dbg !313
  store i64 115, i64* %42, align 8, !dbg !314
  %arrayidx84 = getelementptr inbounds i8, i8* %call52, i64 248, !dbg !315
  %43 = bitcast i8* %arrayidx84 to i64*, !dbg !315
  store i64 101, i64* %43, align 8, !dbg !316
  tail call void @llvm.dbg.value(metadata i8 1, i64 0, metadata !197, metadata !27), !dbg !198
  tail call void @println_s(i64* %12, i64 32) #5, !dbg !317
  %phitmp = bitcast i64* %call16 to i8*, !dbg !317
  br label %blklab13, !dbg !317

blklab13:                                         ; preds = %entry.split, %if.end41
  %_13_has_ownership.0 = phi i1 [ true, %if.end41 ], [ false, %entry.split ]
  %44 = phi i8* [ %call5, %if.end41 ], [ null, %entry.split ]
  %45 = phi i8* [ %call42, %if.end41 ], [ null, %entry.split ]
  %gcds.0 = phi i8* [ %phitmp, %if.end41 ], [ null, %entry.split ]
  %46 = phi i8* [ %call52, %if.end41 ], [ null, %entry.split ]
  br i1 %_13_has_ownership.0, label %if.then86, label %if.end105.critedge, !dbg !318

if.then86:                                        ; preds = %blklab13
  tail call void @free(i8* %gcds.0) #5, !dbg !319
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !125, metadata !27), !dbg !126
  tail call void @free2DArray(i64** %call, i64 %conv) #5, !dbg !323
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !138, metadata !27), !dbg !139
  tail call void @free(i8* %44) #5, !dbg !327
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !150, metadata !27), !dbg !151
  tail call void @free(i8* %45) #5, !dbg !331
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !192, metadata !27), !dbg !193
  tail call void @free(i8* %46) #5, !dbg !335
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !197, metadata !27), !dbg !198
  br label %if.end105, !dbg !335

if.end105.critedge:                               ; preds = %blklab13
  tail call void @free2DArray(i64** %call, i64 %conv) #5, !dbg !323
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !138, metadata !27), !dbg !139
  br label %if.end105

if.end105:                                        ; preds = %if.end105.critedge, %if.then86
  tail call void @exit(i32 0) #7, !dbg !339
  unreachable, !dbg !339
}

declare i64** @convertArgsToIntArray(i32, i8**) #2

declare i64* @parseStringToInt(i64*) #2

; Function Attrs: nounwind
declare noalias i8* @malloc(i64) #4

declare void @printf_s(i64*, i64) #2

declare i32 @printf(i8*, ...) #2

declare i64* @gen1DArray(i32, i32) #2

declare void @println_s(i64*, i64) #2

declare void @free2DArray(i64**, i64) #2

; Function Attrs: nounwind readnone
declare void @llvm.dbg.value(metadata, i64, metadata, metadata) #1

; Function Attrs: nounwind
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) #5

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone }
attributes #2 = { "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { noreturn nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { nounwind }
attributes #6 = { cold }
attributes #7 = { noreturn nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!22, !23}
!llvm.ident = !{!24}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 3.9.0 (http://llvm.org/git/clang.git cf7bc8edf8cccb1b5de656c403cb55ad44132e98) (http://llvm.org/git/llvm.git 22706dc4c03305692f494d0e42a6de1050d0ec62)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, subprograms: !5)
!1 = !DIFile(filename: "GCD.c", directory: "/home/sam/workspace/WhileyOpenCL/polly/GCD/impl/autogenerate1")
!2 = !{}
!3 = !{!4}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64, align: 64)
!5 = !{!6, !10, !15}
!6 = distinct !DISubprogram(name: "gcd", scope: !1, file: !1, line: 2, type: !7, isLocal: false, isDefinition: true, scopeLine: 2, flags: DIFlagPrototyped, isOptimized: false, variables: !2)
!7 = !DISubroutineType(types: !8)
!8 = !{!9, !9, !9}
!9 = !DIBasicType(name: "long long int", size: 64, align: 64, encoding: DW_ATE_signed)
!10 = distinct !DISubprogram(name: "gcd_cached", scope: !1, file: !1, line: 62, type: !11, isLocal: false, isDefinition: true, scopeLine: 62, flags: DIFlagPrototyped, isOptimized: false, variables: !2)
!11 = !DISubroutineType(types: !12)
!12 = !{!9, !9, !9, !9, !13, !9, !14}
!13 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !9, size: 64, align: 64)
!14 = !DIBasicType(name: "_Bool", size: 8, align: 8, encoding: DW_ATE_boolean)
!15 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 125, type: !16, isLocal: false, isDefinition: true, scopeLine: 125, flags: DIFlagPrototyped, isOptimized: false, variables: !2)
!16 = !DISubroutineType(types: !17)
!17 = !{!18, !18, !19}
!18 = !DIBasicType(name: "int", size: 32, align: 32, encoding: DW_ATE_signed)
!19 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !20, size: 64, align: 64)
!20 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !21, size: 64, align: 64)
!21 = !DIBasicType(name: "char", size: 8, align: 8, encoding: DW_ATE_signed_char)
!22 = !{i32 2, !"Dwarf Version", i32 4}
!23 = !{i32 2, !"Debug Info Version", i32 3}
!24 = !{!"clang version 3.9.0 (http://llvm.org/git/clang.git cf7bc8edf8cccb1b5de656c403cb55ad44132e98) (http://llvm.org/git/llvm.git 22706dc4c03305692f494d0e42a6de1050d0ec62)"}
!25 = !DILocation(line: 2, column: 25, scope: !6)
!26 = !DILocalVariable(name: "a", arg: 1, scope: !6, file: !1, line: 2, type: !9)
!27 = !DIExpression()
!28 = !DILocalVariable(name: "b", arg: 2, scope: !6, file: !1, line: 2, type: !9)
!29 = !DILocation(line: 2, column: 38, scope: !6)
!30 = !DILocalVariable(name: "_2", scope: !6, file: !1, line: 3, type: !9)
!31 = !DILocation(line: 3, column: 12, scope: !6)
!32 = !DILocalVariable(name: "_3", scope: !6, file: !1, line: 4, type: !9)
!33 = !DILocation(line: 4, column: 12, scope: !6)
!34 = !DILocalVariable(name: "_4", scope: !6, file: !1, line: 5, type: !9)
!35 = !DILocation(line: 5, column: 12, scope: !6)
!36 = !DILocalVariable(name: "_5", scope: !6, file: !1, line: 6, type: !9)
!37 = !DILocation(line: 6, column: 12, scope: !6)
!38 = !DILocalVariable(name: "_6", scope: !6, file: !1, line: 7, type: !9)
!39 = !DILocation(line: 7, column: 12, scope: !6)
!40 = !DILocalVariable(name: "_7", scope: !6, file: !1, line: 8, type: !9)
!41 = !DILocation(line: 8, column: 12, scope: !6)
!42 = !DILocation(line: 12, column: 6, scope: !43)
!43 = distinct !DILexicalBlock(scope: !6, file: !1, line: 12, column: 5)
!44 = !DILocation(line: 12, column: 5, scope: !6)
!45 = !DILocation(line: 24, column: 8, scope: !46)
!46 = distinct !DILexicalBlock(scope: !47, file: !1, line: 24, column: 7)
!47 = distinct !DILexicalBlock(scope: !48, file: !1, line: 20, column: 3)
!48 = distinct !DILexicalBlock(scope: !6, file: !1, line: 18, column: 13)
!49 = !DILocation(line: 24, column: 7, scope: !47)
!50 = !DILocation(line: 26, column: 12, scope: !47)
!51 = !DILocation(line: 26, column: 4, scope: !47)
!52 = !DILocation(line: 27, column: 4, scope: !47)
!53 = !DILocation(line: 35, column: 7, scope: !54)
!54 = distinct !DILexicalBlock(scope: !48, file: !1, line: 35, column: 6)
!55 = !DILocation(line: 35, column: 6, scope: !48)
!56 = !DILocation(line: 37, column: 7, scope: !57)
!57 = distinct !DILexicalBlock(scope: !48, file: !1, line: 37, column: 6)
!58 = !DILocation(line: 37, column: 6, scope: !48)
!59 = !DILocation(line: 60, column: 1, scope: !6)
!60 = !DILocation(line: 62, column: 32, scope: !10)
!61 = !DILocalVariable(name: "a", arg: 1, scope: !10, file: !1, line: 62, type: !9)
!62 = !DILocalVariable(name: "b", arg: 2, scope: !10, file: !1, line: 62, type: !9)
!63 = !DILocation(line: 62, column: 45, scope: !10)
!64 = !DILocalVariable(name: "n", arg: 3, scope: !10, file: !1, line: 62, type: !9)
!65 = !DILocation(line: 62, column: 58, scope: !10)
!66 = !DILocalVariable(name: "gcds", arg: 4, scope: !10, file: !1, line: 62, type: !13)
!67 = !DILocation(line: 62, column: 61, scope: !10)
!68 = !DILocalVariable(name: "gcds_size", arg: 5, scope: !10, file: !1, line: 62, type: !9)
!69 = !DILocalVariable(name: "gcds_has_ownership", arg: 6, scope: !10, file: !1, line: 62, type: !14)
!70 = !DIExpression(DW_OP_bit_piece, 0, 1)
!71 = !DILocation(line: 62, column: 88, scope: !10)
!72 = !DILocalVariable(name: "_4", scope: !10, file: !1, line: 63, type: !9)
!73 = !DILocation(line: 63, column: 12, scope: !10)
!74 = !DILocalVariable(name: "_5", scope: !10, file: !1, line: 64, type: !9)
!75 = !DILocation(line: 64, column: 12, scope: !10)
!76 = !DILocalVariable(name: "_6", scope: !10, file: !1, line: 65, type: !9)
!77 = !DILocation(line: 65, column: 12, scope: !10)
!78 = !DILocalVariable(name: "_7", scope: !10, file: !1, line: 66, type: !9)
!79 = !DILocation(line: 66, column: 12, scope: !10)
!80 = !DILocalVariable(name: "_8", scope: !10, file: !1, line: 67, type: !9)
!81 = !DILocation(line: 67, column: 12, scope: !10)
!82 = !DILocalVariable(name: "_9", scope: !10, file: !1, line: 68, type: !9)
!83 = !DILocation(line: 68, column: 12, scope: !10)
!84 = !DILocalVariable(name: "_10", scope: !10, file: !1, line: 69, type: !9)
!85 = !DILocation(line: 69, column: 12, scope: !10)
!86 = !DILocalVariable(name: "_11", scope: !10, file: !1, line: 70, type: !9)
!87 = !DILocation(line: 70, column: 12, scope: !10)
!88 = !DILocation(line: 74, column: 6, scope: !89)
!89 = distinct !DILexicalBlock(scope: !10, file: !1, line: 74, column: 5)
!90 = !DILocation(line: 74, column: 5, scope: !10)
!91 = !DILocation(line: 76, column: 2, scope: !10)
!92 = !DILocation(line: 76, column: 2, scope: !93)
!93 = !DILexicalBlockFile(scope: !94, file: !1, discriminator: 1)
!94 = distinct !DILexicalBlock(scope: !95, file: !1, line: 76, column: 2)
!95 = distinct !DILexicalBlock(scope: !10, file: !1, line: 76, column: 2)
!96 = !DILocation(line: 85, column: 6, scope: !97)
!97 = distinct !DILexicalBlock(scope: !10, file: !1, line: 85, column: 5)
!98 = !DILocation(line: 85, column: 5, scope: !10)
!99 = !DILocation(line: 87, column: 2, scope: !10)
!100 = !DILocation(line: 87, column: 2, scope: !101)
!101 = !DILexicalBlockFile(scope: !102, file: !1, discriminator: 1)
!102 = distinct !DILexicalBlock(scope: !103, file: !1, line: 87, column: 2)
!103 = distinct !DILexicalBlock(scope: !10, file: !1, line: 87, column: 2)
!104 = !DILocation(line: 94, column: 6, scope: !105)
!105 = distinct !DILexicalBlock(scope: !10, file: !1, line: 94, column: 5)
!106 = !DILocation(line: 94, column: 5, scope: !10)
!107 = !DILocation(line: 110, column: 6, scope: !10)
!108 = !DILocation(line: 112, column: 8, scope: !10)
!109 = !DILocation(line: 114, column: 6, scope: !10)
!110 = !DILocation(line: 116, column: 2, scope: !10)
!111 = !DILocation(line: 116, column: 2, scope: !112)
!112 = !DILexicalBlockFile(scope: !113, file: !1, discriminator: 1)
!113 = distinct !DILexicalBlock(scope: !114, file: !1, line: 116, column: 2)
!114 = distinct !DILexicalBlock(scope: !10, file: !1, line: 116, column: 2)
!115 = !DILocation(line: 123, column: 1, scope: !10)
!116 = !DILocation(line: 125, column: 14, scope: !15)
!117 = !DILocalVariable(name: "argc", arg: 1, scope: !15, file: !1, line: 125, type: !18)
!118 = !DILocalVariable(name: "args", arg: 2, scope: !15, file: !1, line: 125, type: !19)
!119 = !DILocation(line: 125, column: 27, scope: !15)
!120 = !DILocalVariable(name: "n", scope: !15, file: !1, line: 127, type: !9)
!121 = !DILocation(line: 127, column: 12, scope: !15)
!122 = !DILocalVariable(name: "gcds", scope: !15, file: !1, line: 128, type: !13)
!123 = !DILocation(line: 128, column: 2, scope: !15)
!124 = !DILocalVariable(name: "gcds_size", scope: !15, file: !1, line: 128, type: !9)
!125 = !DILocalVariable(name: "gcds_has_ownership", scope: !15, file: !1, line: 129, type: !14)
!126 = !DILocation(line: 129, column: 2, scope: !15)
!127 = !DILocalVariable(name: "sum", scope: !15, file: !1, line: 130, type: !9)
!128 = !DILocation(line: 130, column: 12, scope: !15)
!129 = !DILocalVariable(name: "i", scope: !15, file: !1, line: 131, type: !9)
!130 = !DILocation(line: 131, column: 12, scope: !15)
!131 = !DILocalVariable(name: "j", scope: !15, file: !1, line: 132, type: !9)
!132 = !DILocation(line: 132, column: 12, scope: !15)
!133 = !DILocalVariable(name: "_8", scope: !15, file: !1, line: 134, type: !134)
!134 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !13, size: 64, align: 64)
!135 = !DILocation(line: 134, column: 2, scope: !15)
!136 = !DILocalVariable(name: "_8_size", scope: !15, file: !1, line: 134, type: !9)
!137 = !DILocalVariable(name: "_8_size_size", scope: !15, file: !1, line: 134, type: !9)
!138 = !DILocalVariable(name: "_8_has_ownership", scope: !15, file: !1, line: 135, type: !14)
!139 = !DILocation(line: 135, column: 2, scope: !15)
!140 = !DILocalVariable(name: "_9", scope: !15, file: !1, line: 136, type: !9)
!141 = !DILocation(line: 136, column: 12, scope: !15)
!142 = !DILocalVariable(name: "_10", scope: !15, file: !1, line: 137, type: !13)
!143 = !DILocation(line: 137, column: 2, scope: !15)
!144 = !DILocalVariable(name: "_10_size", scope: !15, file: !1, line: 137, type: !9)
!145 = !DILocalVariable(name: "_10_has_ownership", scope: !15, file: !1, line: 138, type: !14)
!146 = !DILocation(line: 138, column: 2, scope: !15)
!147 = !DILocalVariable(name: "_13", scope: !15, file: !1, line: 140, type: !13)
!148 = !DILocation(line: 140, column: 2, scope: !15)
!149 = !DILocalVariable(name: "_13_size", scope: !15, file: !1, line: 140, type: !9)
!150 = !DILocalVariable(name: "_13_has_ownership", scope: !15, file: !1, line: 141, type: !14)
!151 = !DILocation(line: 141, column: 2, scope: !15)
!152 = !DILocalVariable(name: "_16", scope: !15, file: !1, line: 143, type: !9)
!153 = !DILocation(line: 143, column: 12, scope: !15)
!154 = !DILocalVariable(name: "_17", scope: !15, file: !1, line: 144, type: !9)
!155 = !DILocation(line: 144, column: 12, scope: !15)
!156 = !DILocalVariable(name: "_18", scope: !15, file: !1, line: 145, type: !13)
!157 = !DILocation(line: 145, column: 2, scope: !15)
!158 = !DILocalVariable(name: "_18_size", scope: !15, file: !1, line: 145, type: !9)
!159 = !DILocalVariable(name: "_18_has_ownership", scope: !15, file: !1, line: 146, type: !14)
!160 = !DILocation(line: 146, column: 2, scope: !15)
!161 = !DILocalVariable(name: "_19", scope: !15, file: !1, line: 147, type: !9)
!162 = !DILocation(line: 147, column: 12, scope: !15)
!163 = !DILocalVariable(name: "_20", scope: !15, file: !1, line: 148, type: !9)
!164 = !DILocation(line: 148, column: 12, scope: !15)
!165 = !DILocalVariable(name: "_21", scope: !15, file: !1, line: 149, type: !9)
!166 = !DILocation(line: 149, column: 12, scope: !15)
!167 = !DILocalVariable(name: "_22", scope: !15, file: !1, line: 150, type: !9)
!168 = !DILocation(line: 150, column: 12, scope: !15)
!169 = !DILocalVariable(name: "_23", scope: !15, file: !1, line: 151, type: !9)
!170 = !DILocation(line: 151, column: 12, scope: !15)
!171 = !DILocalVariable(name: "_24", scope: !15, file: !1, line: 152, type: !9)
!172 = !DILocation(line: 152, column: 12, scope: !15)
!173 = !DILocalVariable(name: "_25", scope: !15, file: !1, line: 153, type: !9)
!174 = !DILocation(line: 153, column: 12, scope: !15)
!175 = !DILocalVariable(name: "_26", scope: !15, file: !1, line: 154, type: !9)
!176 = !DILocation(line: 154, column: 12, scope: !15)
!177 = !DILocalVariable(name: "_27", scope: !15, file: !1, line: 155, type: !9)
!178 = !DILocation(line: 155, column: 12, scope: !15)
!179 = !DILocalVariable(name: "_28", scope: !15, file: !1, line: 156, type: !9)
!180 = !DILocation(line: 156, column: 12, scope: !15)
!181 = !DILocalVariable(name: "_29", scope: !15, file: !1, line: 157, type: !9)
!182 = !DILocation(line: 157, column: 12, scope: !15)
!183 = !DILocalVariable(name: "_30", scope: !15, file: !1, line: 158, type: !9)
!184 = !DILocation(line: 158, column: 12, scope: !15)
!185 = !DILocalVariable(name: "_31", scope: !15, file: !1, line: 159, type: !9)
!186 = !DILocation(line: 159, column: 12, scope: !15)
!187 = !DILocalVariable(name: "_32", scope: !15, file: !1, line: 160, type: !9)
!188 = !DILocation(line: 160, column: 12, scope: !15)
!189 = !DILocalVariable(name: "_35", scope: !15, file: !1, line: 162, type: !13)
!190 = !DILocation(line: 162, column: 2, scope: !15)
!191 = !DILocalVariable(name: "_35_size", scope: !15, file: !1, line: 162, type: !9)
!192 = !DILocalVariable(name: "_35_has_ownership", scope: !15, file: !1, line: 163, type: !14)
!193 = !DILocation(line: 163, column: 2, scope: !15)
!194 = !DILocalVariable(name: "_40", scope: !15, file: !1, line: 166, type: !13)
!195 = !DILocation(line: 166, column: 2, scope: !15)
!196 = !DILocalVariable(name: "_40_size", scope: !15, file: !1, line: 166, type: !9)
!197 = !DILocalVariable(name: "_40_has_ownership", scope: !15, file: !1, line: 167, type: !14)
!198 = !DILocation(line: 167, column: 2, scope: !15)
!199 = !DILocation(line: 169, column: 2, scope: !15)
!200 = !DILocation(line: 174, column: 6, scope: !15)
!201 = !DILocation(line: 176, column: 2, scope: !15)
!202 = !DILocalVariable(name: "_7", scope: !15, file: !1, line: 133, type: !13)
!203 = !DILocation(line: 133, column: 13, scope: !15)
!204 = !DILocalVariable(name: "max", scope: !15, file: !1, line: 126, type: !13)
!205 = !DILocation(line: 126, column: 13, scope: !15)
!206 = !DILocation(line: 180, column: 9, scope: !207)
!207 = distinct !DILexicalBlock(scope: !15, file: !1, line: 180, column: 5)
!208 = !DILocation(line: 180, column: 5, scope: !15)
!209 = !DILocation(line: 182, column: 6, scope: !15)
!210 = !DILocation(line: 187, column: 2, scope: !15)
!211 = !DILocation(line: 188, column: 9, scope: !15)
!212 = !DILocation(line: 188, column: 15, scope: !15)
!213 = !DILocation(line: 188, column: 22, scope: !15)
!214 = !DILocation(line: 188, column: 28, scope: !15)
!215 = !DILocation(line: 188, column: 35, scope: !15)
!216 = !DILocation(line: 188, column: 41, scope: !15)
!217 = !DILocation(line: 188, column: 48, scope: !15)
!218 = !DILocation(line: 191, column: 2, scope: !15)
!219 = !DILocation(line: 195, column: 2, scope: !15)
!220 = !DILocation(line: 199, column: 7, scope: !15)
!221 = !DILocation(line: 202, column: 2, scope: !15)
!222 = !DILocation(line: 220, column: 7, scope: !223)
!223 = distinct !DILexicalBlock(scope: !224, file: !1, line: 220, column: 6)
!224 = distinct !DILexicalBlock(scope: !15, file: !1, line: 218, column: 13)
!225 = !DILocation(line: 220, column: 6, scope: !224)
!226 = !DILocation(line: 228, column: 8, scope: !227)
!227 = distinct !DILexicalBlock(scope: !228, file: !1, line: 228, column: 7)
!228 = distinct !DILexicalBlock(scope: !224, file: !1, line: 226, column: 14)
!229 = !DILocation(line: 228, column: 7, scope: !228)
!230 = !DILocation(line: 231, column: 10, scope: !228)
!231 = !DILocation(line: 233, column: 9, scope: !228)
!232 = !DILocation(line: 235, column: 11, scope: !228)
!233 = !DILocation(line: 237, column: 4, scope: !228)
!234 = !DILocation(line: 237, column: 14, scope: !228)
!235 = !DILocation(line: 251, column: 9, scope: !228)
!236 = !DILocation(line: 239, column: 9, scope: !228)
!237 = !DILocation(line: 241, column: 11, scope: !228)
!238 = !DILocation(line: 243, column: 8, scope: !228)
!239 = !DILocation(line: 245, column: 11, scope: !228)
!240 = !DILocation(line: 262, column: 8, scope: !224)
!241 = !DILocation(line: 274, column: 2, scope: !15)
!242 = !DILocation(line: 275, column: 9, scope: !15)
!243 = !DILocation(line: 275, column: 15, scope: !15)
!244 = !DILocation(line: 275, column: 22, scope: !15)
!245 = !DILocation(line: 275, column: 29, scope: !15)
!246 = !DILocation(line: 275, column: 36, scope: !15)
!247 = !DILocation(line: 275, column: 43, scope: !15)
!248 = !DILocation(line: 275, column: 50, scope: !15)
!249 = !DILocation(line: 275, column: 56, scope: !15)
!250 = !DILocation(line: 275, column: 63, scope: !15)
!251 = !DILocation(line: 278, column: 2, scope: !15)
!252 = !DILocation(line: 282, column: 2, scope: !15)
!253 = !DILocation(line: 287, column: 2, scope: !15)
!254 = !DILocation(line: 288, column: 9, scope: !15)
!255 = !DILocation(line: 288, column: 15, scope: !15)
!256 = !DILocation(line: 288, column: 22, scope: !15)
!257 = !DILocation(line: 288, column: 28, scope: !15)
!258 = !DILocation(line: 288, column: 35, scope: !15)
!259 = !DILocation(line: 288, column: 42, scope: !15)
!260 = !DILocation(line: 288, column: 49, scope: !15)
!261 = !DILocation(line: 288, column: 56, scope: !15)
!262 = !DILocation(line: 288, column: 63, scope: !15)
!263 = !DILocation(line: 288, column: 69, scope: !15)
!264 = !DILocation(line: 288, column: 76, scope: !15)
!265 = !DILocation(line: 288, column: 82, scope: !15)
!266 = !DILocation(line: 288, column: 89, scope: !15)
!267 = !DILocation(line: 288, column: 95, scope: !15)
!268 = !DILocation(line: 288, column: 102, scope: !15)
!269 = !DILocation(line: 288, column: 108, scope: !15)
!270 = !DILocation(line: 288, column: 115, scope: !15)
!271 = !DILocation(line: 288, column: 122, scope: !15)
!272 = !DILocation(line: 288, column: 129, scope: !15)
!273 = !DILocation(line: 288, column: 136, scope: !15)
!274 = !DILocation(line: 288, column: 144, scope: !15)
!275 = !DILocation(line: 288, column: 151, scope: !15)
!276 = !DILocation(line: 288, column: 159, scope: !15)
!277 = !DILocation(line: 288, column: 165, scope: !15)
!278 = !DILocation(line: 288, column: 173, scope: !15)
!279 = !DILocation(line: 288, column: 179, scope: !15)
!280 = !DILocation(line: 288, column: 187, scope: !15)
!281 = !DILocation(line: 288, column: 194, scope: !15)
!282 = !DILocation(line: 288, column: 202, scope: !15)
!283 = !DILocation(line: 288, column: 208, scope: !15)
!284 = !DILocation(line: 288, column: 216, scope: !15)
!285 = !DILocation(line: 288, column: 223, scope: !15)
!286 = !DILocation(line: 288, column: 231, scope: !15)
!287 = !DILocation(line: 288, column: 238, scope: !15)
!288 = !DILocation(line: 288, column: 246, scope: !15)
!289 = !DILocation(line: 288, column: 253, scope: !15)
!290 = !DILocation(line: 288, column: 261, scope: !15)
!291 = !DILocation(line: 288, column: 267, scope: !15)
!292 = !DILocation(line: 288, column: 275, scope: !15)
!293 = !DILocation(line: 288, column: 281, scope: !15)
!294 = !DILocation(line: 288, column: 289, scope: !15)
!295 = !DILocation(line: 288, column: 295, scope: !15)
!296 = !DILocation(line: 288, column: 303, scope: !15)
!297 = !DILocation(line: 288, column: 309, scope: !15)
!298 = !DILocation(line: 288, column: 317, scope: !15)
!299 = !DILocation(line: 288, column: 323, scope: !15)
!300 = !DILocation(line: 288, column: 331, scope: !15)
!301 = !DILocation(line: 288, column: 338, scope: !15)
!302 = !DILocation(line: 288, column: 346, scope: !15)
!303 = !DILocation(line: 288, column: 353, scope: !15)
!304 = !DILocation(line: 288, column: 361, scope: !15)
!305 = !DILocation(line: 288, column: 368, scope: !15)
!306 = !DILocation(line: 288, column: 376, scope: !15)
!307 = !DILocation(line: 288, column: 383, scope: !15)
!308 = !DILocation(line: 288, column: 391, scope: !15)
!309 = !DILocation(line: 288, column: 397, scope: !15)
!310 = !DILocation(line: 288, column: 405, scope: !15)
!311 = !DILocation(line: 288, column: 411, scope: !15)
!312 = !DILocation(line: 288, column: 419, scope: !15)
!313 = !DILocation(line: 288, column: 425, scope: !15)
!314 = !DILocation(line: 288, column: 433, scope: !15)
!315 = !DILocation(line: 288, column: 440, scope: !15)
!316 = !DILocation(line: 288, column: 448, scope: !15)
!317 = !DILocation(line: 291, column: 2, scope: !15)
!318 = !DILocation(line: 295, column: 2, scope: !15)
!319 = !DILocation(line: 295, column: 2, scope: !320)
!320 = !DILexicalBlockFile(scope: !321, file: !1, discriminator: 1)
!321 = distinct !DILexicalBlock(scope: !322, file: !1, line: 295, column: 2)
!322 = distinct !DILexicalBlock(scope: !15, file: !1, line: 295, column: 2)
!323 = !DILocation(line: 296, column: 2, scope: !324)
!324 = !DILexicalBlockFile(scope: !325, file: !1, discriminator: 1)
!325 = distinct !DILexicalBlock(scope: !326, file: !1, line: 296, column: 2)
!326 = distinct !DILexicalBlock(scope: !15, file: !1, line: 296, column: 2)
!327 = !DILocation(line: 298, column: 2, scope: !328)
!328 = !DILexicalBlockFile(scope: !329, file: !1, discriminator: 1)
!329 = distinct !DILexicalBlock(scope: !330, file: !1, line: 298, column: 2)
!330 = distinct !DILexicalBlock(scope: !15, file: !1, line: 298, column: 2)
!331 = !DILocation(line: 300, column: 2, scope: !332)
!332 = !DILexicalBlockFile(scope: !333, file: !1, discriminator: 1)
!333 = distinct !DILexicalBlock(scope: !334, file: !1, line: 300, column: 2)
!334 = distinct !DILexicalBlock(scope: !15, file: !1, line: 300, column: 2)
!335 = !DILocation(line: 301, column: 2, scope: !336)
!336 = !DILexicalBlockFile(scope: !337, file: !1, discriminator: 1)
!337 = distinct !DILexicalBlock(scope: !338, file: !1, line: 301, column: 2)
!338 = distinct !DILexicalBlock(scope: !15, file: !1, line: 301, column: 2)
!339 = !DILocation(line: 302, column: 2, scope: !15)
