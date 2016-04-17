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
  br label %entry.split, !dbg !20

entry.split:                                      ; preds = %entry
  tail call void @llvm.dbg.value(metadata i64 %a, i64 0, metadata !21, metadata !22), !dbg !20
  tail call void @llvm.dbg.value(metadata i64 %b, i64 0, metadata !23, metadata !22), !dbg !24
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !25, metadata !22), !dbg !26
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !27, metadata !22), !dbg !28
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !29, metadata !22), !dbg !30
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !31, metadata !22), !dbg !32
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !33, metadata !22), !dbg !34
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !35, metadata !22), !dbg !36
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !27, metadata !22), !dbg !28
  %cmp = icmp eq i64 %a, 0, !dbg !37
  br i1 %cmp, label %return, label %while.body.preheader, !dbg !39

while.body.preheader:                             ; preds = %entry.split
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !29, metadata !22), !dbg !30
  %cmp12 = icmp sgt i64 %a, -1, !dbg !40
  br i1 %cmp12, label %blklab4.lr.ph, label %if.end3, !dbg !44

blklab4.lr.ph:                                    ; preds = %while.body.preheader
  br label %blklab4, !dbg !44

while.body.if.end3_crit_edge:                     ; preds = %if.end6
  br label %if.end3, !dbg !44

if.end3:                                          ; preds = %while.body.if.end3_crit_edge, %while.body.preheader
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !dbg !45
  %1 = tail call i64 @fwrite(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str, i64 0, i64 0), i64 4, i64 1, %struct._IO_FILE* %0) #6, !dbg !46
  tail call void @exit(i32 -1) #7, !dbg !47
  unreachable, !dbg !47

blklab4:                                          ; preds = %blklab4.lr.ph, %if.end6
  %a.addr.04 = phi i64 [ %a, %blklab4.lr.ph ], [ %a.addr.1, %if.end6 ]
  %b.addr.03 = phi i64 [ %b, %blklab4.lr.ph ], [ %b.addr.1, %if.end6 ]
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !31, metadata !22), !dbg !32
  %cmp4 = icmp eq i64 %b.addr.03, 0, !dbg !48
  br i1 %cmp4, label %return.loopexit, label %if.end6, !dbg !50

if.end6:                                          ; preds = %blklab4
  %cmp7 = icmp sgt i64 %a.addr.04, %b.addr.03, !dbg !51
  %sub10 = select i1 %cmp7, i64 0, i64 %a.addr.04, !dbg !53
  %b.addr.1 = sub nsw i64 %b.addr.03, %sub10, !dbg !53
  %sub = select i1 %cmp7, i64 %b.addr.03, i64 0, !dbg !53
  %a.addr.1 = sub nsw i64 %a.addr.04, %sub, !dbg !53
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !29, metadata !22), !dbg !30
  %cmp1 = icmp sgt i64 %a.addr.1, -1, !dbg !40
  br i1 %cmp1, label %blklab4, label %while.body.if.end3_crit_edge, !dbg !44

return.loopexit:                                  ; preds = %blklab4
  %a.addr.04.lcssa = phi i64 [ %a.addr.04, %blklab4 ]
  br label %return, !dbg !54

return:                                           ; preds = %return.loopexit, %entry.split
  %retval.0 = phi i64 [ %b, %entry.split ], [ %a.addr.04.lcssa, %return.loopexit ]
  ret i64 %retval.0, !dbg !54
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) #2

; Function Attrs: noreturn nounwind
declare void @exit(i32) #3

; Function Attrs: nounwind uwtable
define i32 @main(i32 %argc, i8** %args) #0 !dbg !10 {
entry:
  br label %entry.split, !dbg !55

entry.split:                                      ; preds = %entry
  tail call void @llvm.dbg.value(metadata i32 %argc, i64 0, metadata !56, metadata !22), !dbg !55
  tail call void @llvm.dbg.value(metadata i8** %args, i64 0, metadata !57, metadata !22), !dbg !58
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !59, metadata !22), !dbg !60
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !61, metadata !22), !dbg !62
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !63, metadata !22), !dbg !64
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !65, metadata !22), !dbg !66
  tail call void @llvm.dbg.value(metadata i64** null, i64 0, metadata !67, metadata !22), !dbg !70
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !71, metadata !22), !dbg !70
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !72, metadata !22), !dbg !70
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !73, metadata !22), !dbg !75
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !76, metadata !22), !dbg !77
  tail call void @llvm.dbg.value(metadata i64* null, i64 0, metadata !78, metadata !22), !dbg !79
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !80, metadata !22), !dbg !79
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !81, metadata !22), !dbg !82
  tail call void @llvm.dbg.value(metadata i64* null, i64 0, metadata !83, metadata !22), !dbg !84
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !85, metadata !22), !dbg !84
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !86, metadata !22), !dbg !87
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !88, metadata !22), !dbg !89
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !90, metadata !22), !dbg !91
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !92, metadata !22), !dbg !93
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !94, metadata !22), !dbg !95
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !96, metadata !22), !dbg !97
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !98, metadata !22), !dbg !99
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !100, metadata !22), !dbg !101
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !102, metadata !22), !dbg !103
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !104, metadata !22), !dbg !105
  tail call void @llvm.dbg.value(metadata i64* null, i64 0, metadata !106, metadata !22), !dbg !107
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !108, metadata !22), !dbg !107
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !109, metadata !22), !dbg !110
  tail call void @llvm.dbg.value(metadata i64* null, i64 0, metadata !111, metadata !22), !dbg !112
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !113, metadata !22), !dbg !112
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !114, metadata !22), !dbg !115
  %call = tail call i64** @convertArgsToIntArray(i32 %argc, i8** %args) #5, !dbg !116
  tail call void @llvm.dbg.value(metadata i64** %call, i64 0, metadata !67, metadata !22), !dbg !70
  %sub = add nsw i32 %argc, -1, !dbg !116
  %conv = sext i32 %sub to i64, !dbg !116
  tail call void @llvm.dbg.value(metadata i64 %conv, i64 0, metadata !71, metadata !22), !dbg !70
  tail call void @llvm.dbg.value(metadata i8 1, i64 0, metadata !73, metadata !22), !dbg !75
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !76, metadata !22), !dbg !77
  %0 = load i64*, i64** %call, align 8, !dbg !117
  tail call void @llvm.dbg.value(metadata i64* %0, i64 0, metadata !78, metadata !22), !dbg !79
  %call1 = tail call i64* @parseStringToInt(i64* %0) #5, !dbg !118
  tail call void @llvm.dbg.value(metadata i64* %call1, i64 0, metadata !119, metadata !22), !dbg !120
  tail call void @llvm.dbg.value(metadata i64* %call1, i64 0, metadata !121, metadata !22), !dbg !122
  %cmp = icmp eq i64* %call1, null, !dbg !123
  br i1 %cmp, label %if.then64, label %if.end, !dbg !125

if.end:                                           ; preds = %entry.split
  %1 = load i64, i64* %call1, align 8, !dbg !126
  tail call void @llvm.dbg.value(metadata i64 %1, i64 0, metadata !59, metadata !22), !dbg !60
  tail call void @llvm.dbg.value(metadata i64 4, i64 0, metadata !85, metadata !22), !dbg !84
  %call5 = tail call noalias i8* @malloc(i64 32) #5, !dbg !127
  %2 = bitcast i8* %call5 to i64*, !dbg !127
  tail call void @llvm.dbg.value(metadata i64* %2, i64 0, metadata !83, metadata !22), !dbg !84
  store i64 78, i64* %2, align 8, !dbg !128
  %arrayidx7 = getelementptr inbounds i8, i8* %call5, i64 8, !dbg !129
  %3 = bitcast i8* %arrayidx7 to i64*, !dbg !129
  store i64 32, i64* %3, align 8, !dbg !130
  %arrayidx8 = getelementptr inbounds i8, i8* %call5, i64 16, !dbg !131
  %4 = bitcast i8* %arrayidx8 to i64*, !dbg !131
  store i64 61, i64* %4, align 8, !dbg !132
  %arrayidx9 = getelementptr inbounds i8, i8* %call5, i64 24, !dbg !133
  %5 = bitcast i8* %arrayidx9 to i64*, !dbg !133
  store i64 32, i64* %5, align 8, !dbg !134
  tail call void @llvm.dbg.value(metadata i8 1, i64 0, metadata !86, metadata !22), !dbg !87
  tail call void @printf_s(i64* %2, i64 4) #5, !dbg !135
  %call10 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.1, i64 0, i64 0), i64 %1) #5, !dbg !136
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !88, metadata !22), !dbg !89
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !61, metadata !22), !dbg !62
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !90, metadata !22), !dbg !91
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !63, metadata !22), !dbg !64
  %cmp115 = icmp sgt i64 %1, 0, !dbg !137
  br i1 %cmp115, label %while.body16.preheader.lr.ph, label %if.end26, !dbg !140

while.body16.preheader.lr.ph:                     ; preds = %if.end
  br label %while.body16.preheader, !dbg !140

while.body16.preheader:                           ; preds = %while.body16.preheader.lr.ph, %blklab9
  %sum.08 = phi i64 [ 0, %while.body16.preheader.lr.ph ], [ %sum.1.lcssa, %blklab9 ]
  %i.06 = phi i64 [ 0, %while.body16.preheader.lr.ph ], [ %add23, %blklab9 ]
  %cmp172 = icmp sgt i64 %1, 0, !dbg !141
  br i1 %cmp172, label %if.end20.lr.ph, label %blklab9, !dbg !144

if.end20.lr.ph:                                   ; preds = %while.body16.preheader
  br label %if.end20, !dbg !144

if.end20:                                         ; preds = %if.end20.lr.ph, %if.end20
  %sum.14 = phi i64 [ %sum.08, %if.end20.lr.ph ], [ %add, %if.end20 ]
  %j.03 = phi i64 [ 0, %if.end20.lr.ph ], [ %add22, %if.end20 ]
  %call21 = tail call i64 @gcd(i64 %i.06, i64 %j.03), !dbg !145
  tail call void @llvm.dbg.value(metadata i64 %call21, i64 0, metadata !94, metadata !22), !dbg !95
  tail call void @llvm.dbg.value(metadata i64 %add, i64 0, metadata !96, metadata !22), !dbg !97
  tail call void @llvm.dbg.value(metadata i64 %add, i64 0, metadata !61, metadata !22), !dbg !62
  tail call void @llvm.dbg.value(metadata i64 1, i64 0, metadata !98, metadata !22), !dbg !99
  tail call void @llvm.dbg.value(metadata i64 %add22, i64 0, metadata !100, metadata !22), !dbg !101
  tail call void @llvm.dbg.value(metadata i64 %add22, i64 0, metadata !65, metadata !22), !dbg !66
  %add22 = add nuw nsw i64 %j.03, 1, !dbg !146
  %add = add nsw i64 %call21, %sum.14, !dbg !147
  %exitcond = icmp ne i64 %add22, %1, !dbg !144
  br i1 %exitcond, label %if.end20, label %while.body16.blklab9_crit_edge, !dbg !144

while.body16.blklab9_crit_edge:                   ; preds = %if.end20
  %add.lcssa = phi i64 [ %add, %if.end20 ]
  br label %blklab9, !dbg !144

blklab9:                                          ; preds = %while.body16.blklab9_crit_edge, %while.body16.preheader
  %sum.1.lcssa = phi i64 [ %add.lcssa, %while.body16.blklab9_crit_edge ], [ %sum.08, %while.body16.preheader ]
  tail call void @llvm.dbg.value(metadata i64 1, i64 0, metadata !102, metadata !22), !dbg !103
  tail call void @llvm.dbg.value(metadata i64 %add23, i64 0, metadata !104, metadata !22), !dbg !105
  tail call void @llvm.dbg.value(metadata i64 %add23, i64 0, metadata !63, metadata !22), !dbg !64
  %add23 = add nuw nsw i64 %i.06, 1, !dbg !148
  %exitcond10 = icmp ne i64 %add23, %1, !dbg !140
  br i1 %exitcond10, label %while.body16.preheader, label %while.body.if.end26_crit_edge, !dbg !140

while.body.if.end26_crit_edge:                    ; preds = %blklab9
  %sum.1.lcssa.lcssa = phi i64 [ %sum.1.lcssa, %blklab9 ]
  br label %if.end26, !dbg !140

if.end26:                                         ; preds = %while.body.if.end26_crit_edge, %if.end
  %sum.0.lcssa = phi i64 [ %sum.1.lcssa.lcssa, %while.body.if.end26_crit_edge ], [ 0, %if.end ]
  tail call void @llvm.dbg.value(metadata i64 5, i64 0, metadata !108, metadata !22), !dbg !107
  %call27 = tail call noalias i8* @malloc(i64 40) #5, !dbg !149
  %6 = bitcast i8* %call27 to i64*, !dbg !149
  tail call void @llvm.dbg.value(metadata i64* %6, i64 0, metadata !106, metadata !22), !dbg !107
  store i64 83, i64* %6, align 8, !dbg !150
  %arrayidx29 = getelementptr inbounds i8, i8* %call27, i64 8, !dbg !151
  %7 = bitcast i8* %arrayidx29 to i64*, !dbg !151
  store i64 117, i64* %7, align 8, !dbg !152
  %arrayidx30 = getelementptr inbounds i8, i8* %call27, i64 16, !dbg !153
  %8 = bitcast i8* %arrayidx30 to i64*, !dbg !153
  store i64 109, i64* %8, align 8, !dbg !154
  %arrayidx31 = getelementptr inbounds i8, i8* %call27, i64 24, !dbg !155
  %9 = bitcast i8* %arrayidx31 to i64*, !dbg !155
  store i64 58, i64* %9, align 8, !dbg !156
  %arrayidx32 = getelementptr inbounds i8, i8* %call27, i64 32, !dbg !157
  %10 = bitcast i8* %arrayidx32 to i64*, !dbg !157
  store i64 32, i64* %10, align 8, !dbg !158
  tail call void @llvm.dbg.value(metadata i8 1, i64 0, metadata !109, metadata !22), !dbg !110
  tail call void @printf_s(i64* %6, i64 5) #5, !dbg !159
  %call33 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.1, i64 0, i64 0), i64 %sum.0.lcssa) #5, !dbg !160
  tail call void @llvm.dbg.value(metadata i64 25, i64 0, metadata !113, metadata !22), !dbg !112
  %call37 = tail call noalias i8* @malloc(i64 200) #5, !dbg !161
  %11 = bitcast i8* %call37 to i64*, !dbg !161
  tail call void @llvm.dbg.value(metadata i64* %11, i64 0, metadata !111, metadata !22), !dbg !112
  store i64 80, i64* %11, align 8, !dbg !162
  %arrayidx39 = getelementptr inbounds i8, i8* %call37, i64 8, !dbg !163
  %12 = bitcast i8* %arrayidx39 to i64*, !dbg !163
  store i64 97, i64* %12, align 8, !dbg !164
  %arrayidx40 = getelementptr inbounds i8, i8* %call37, i64 16, !dbg !165
  %13 = bitcast i8* %arrayidx40 to i64*, !dbg !165
  store i64 115, i64* %13, align 8, !dbg !166
  %arrayidx41 = getelementptr inbounds i8, i8* %call37, i64 24, !dbg !167
  %14 = bitcast i8* %arrayidx41 to i64*, !dbg !167
  store i64 115, i64* %14, align 8, !dbg !168
  %arrayidx42 = getelementptr inbounds i8, i8* %call37, i64 32, !dbg !169
  %15 = bitcast i8* %arrayidx42 to i64*, !dbg !169
  store i64 32, i64* %15, align 8, !dbg !170
  %arrayidx43 = getelementptr inbounds i8, i8* %call37, i64 40, !dbg !171
  %16 = bitcast i8* %arrayidx43 to i64*, !dbg !171
  store i64 69, i64* %16, align 8, !dbg !172
  %arrayidx44 = getelementptr inbounds i8, i8* %call37, i64 48, !dbg !173
  %17 = bitcast i8* %arrayidx44 to i64*, !dbg !173
  store i64 117, i64* %17, align 8, !dbg !174
  %arrayidx45 = getelementptr inbounds i8, i8* %call37, i64 56, !dbg !175
  %18 = bitcast i8* %arrayidx45 to i64*, !dbg !175
  store i64 99, i64* %18, align 8, !dbg !176
  %arrayidx46 = getelementptr inbounds i8, i8* %call37, i64 64, !dbg !177
  %19 = bitcast i8* %arrayidx46 to i64*, !dbg !177
  store i64 108, i64* %19, align 8, !dbg !178
  %arrayidx47 = getelementptr inbounds i8, i8* %call37, i64 72, !dbg !179
  %20 = bitcast i8* %arrayidx47 to i64*, !dbg !179
  store i64 105, i64* %20, align 8, !dbg !180
  %arrayidx48 = getelementptr inbounds i8, i8* %call37, i64 80, !dbg !181
  %21 = bitcast i8* %arrayidx48 to i64*, !dbg !181
  store i64 100, i64* %21, align 8, !dbg !182
  %arrayidx49 = getelementptr inbounds i8, i8* %call37, i64 88, !dbg !183
  %22 = bitcast i8* %arrayidx49 to i64*, !dbg !183
  store i64 32, i64* %22, align 8, !dbg !184
  %arrayidx50 = getelementptr inbounds i8, i8* %call37, i64 96, !dbg !185
  %23 = bitcast i8* %arrayidx50 to i64*, !dbg !185
  store i64 71, i64* %23, align 8, !dbg !186
  %arrayidx51 = getelementptr inbounds i8, i8* %call37, i64 104, !dbg !187
  %24 = bitcast i8* %arrayidx51 to i64*, !dbg !187
  store i64 67, i64* %24, align 8, !dbg !188
  %arrayidx52 = getelementptr inbounds i8, i8* %call37, i64 112, !dbg !189
  %25 = bitcast i8* %arrayidx52 to i64*, !dbg !189
  store i64 68, i64* %25, align 8, !dbg !190
  %arrayidx53 = getelementptr inbounds i8, i8* %call37, i64 120, !dbg !191
  %26 = bitcast i8* %arrayidx53 to i64*, !dbg !191
  store i64 32, i64* %26, align 8, !dbg !192
  %arrayidx54 = getelementptr inbounds i8, i8* %call37, i64 128, !dbg !193
  %27 = bitcast i8* %arrayidx54 to i64*, !dbg !193
  store i64 116, i64* %27, align 8, !dbg !194
  %arrayidx55 = getelementptr inbounds i8, i8* %call37, i64 136, !dbg !195
  %28 = bitcast i8* %arrayidx55 to i64*, !dbg !195
  store i64 101, i64* %28, align 8, !dbg !196
  %arrayidx56 = getelementptr inbounds i8, i8* %call37, i64 144, !dbg !197
  %29 = bitcast i8* %arrayidx56 to i64*, !dbg !197
  store i64 115, i64* %29, align 8, !dbg !198
  %arrayidx57 = getelementptr inbounds i8, i8* %call37, i64 152, !dbg !199
  %30 = bitcast i8* %arrayidx57 to i64*, !dbg !199
  store i64 116, i64* %30, align 8, !dbg !200
  %arrayidx58 = getelementptr inbounds i8, i8* %call37, i64 160, !dbg !201
  %31 = bitcast i8* %arrayidx58 to i64*, !dbg !201
  store i64 32, i64* %31, align 8, !dbg !202
  %arrayidx59 = getelementptr inbounds i8, i8* %call37, i64 168, !dbg !203
  %32 = bitcast i8* %arrayidx59 to i64*, !dbg !203
  store i64 99, i64* %32, align 8, !dbg !204
  %arrayidx60 = getelementptr inbounds i8, i8* %call37, i64 176, !dbg !205
  %33 = bitcast i8* %arrayidx60 to i64*, !dbg !205
  store i64 97, i64* %33, align 8, !dbg !206
  %arrayidx61 = getelementptr inbounds i8, i8* %call37, i64 184, !dbg !207
  %34 = bitcast i8* %arrayidx61 to i64*, !dbg !207
  store i64 115, i64* %34, align 8, !dbg !208
  %arrayidx62 = getelementptr inbounds i8, i8* %call37, i64 192, !dbg !209
  %35 = bitcast i8* %arrayidx62 to i64*, !dbg !209
  store i64 101, i64* %35, align 8, !dbg !210
  tail call void @llvm.dbg.value(metadata i8 1, i64 0, metadata !114, metadata !22), !dbg !115
  tail call void @println_s(i64* %11, i64 25) #5, !dbg !211
  br label %if.then64, !dbg !211

if.then64:                                        ; preds = %if.end26, %entry.split
  %_12_has_ownership.0 = phi i1 [ true, %if.end26 ], [ false, %entry.split ]
  %36 = phi i8* [ %call5, %if.end26 ], [ null, %entry.split ]
  %37 = phi i8* [ %call27, %if.end26 ], [ null, %entry.split ]
  %38 = phi i8* [ %call37, %if.end26 ], [ null, %entry.split ]
  tail call void @free2DArray(i64** %call, i64 %conv) #5, !dbg !212
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !73, metadata !22), !dbg !75
  br i1 %_12_has_ownership.0, label %if.then70, label %if.end77, !dbg !216

if.then70:                                        ; preds = %if.then64
  tail call void @free(i8* %36) #5, !dbg !217
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !86, metadata !22), !dbg !87
  tail call void @free(i8* %37) #5, !dbg !221
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !109, metadata !22), !dbg !110
  tail call void @free(i8* %38) #5, !dbg !225
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !114, metadata !22), !dbg !115
  br label %if.end77, !dbg !225

if.end77:                                         ; preds = %if.then64, %if.then70
  tail call void @exit(i32 0) #7, !dbg !229
  unreachable, !dbg !229
}

declare i64** @convertArgsToIntArray(i32, i8**) #2

declare i64* @parseStringToInt(i64*) #2

; Function Attrs: nounwind
declare void @free(i8*) #4

; Function Attrs: nounwind
declare noalias i8* @malloc(i64) #4

declare void @printf_s(i64*, i64) #2

declare i32 @printf(i8*, ...) #2

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
!llvm.module.flags = !{!17, !18}
!llvm.ident = !{!19}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 3.9.0 (http://llvm.org/git/clang.git cf7bc8edf8cccb1b5de656c403cb55ad44132e98) (http://llvm.org/git/llvm.git 22706dc4c03305692f494d0e42a6de1050d0ec62)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, subprograms: !5)
!1 = !DIFile(filename: "GCD.c", directory: "/home/sam/workspace/WhileyOpenCL/polly/GCD/impl/autogenerate")
!2 = !{}
!3 = !{!4}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64, align: 64)
!5 = !{!6, !10}
!6 = distinct !DISubprogram(name: "gcd", scope: !1, file: !1, line: 2, type: !7, isLocal: false, isDefinition: true, scopeLine: 2, flags: DIFlagPrototyped, isOptimized: false, variables: !2)
!7 = !DISubroutineType(types: !8)
!8 = !{!9, !9, !9}
!9 = !DIBasicType(name: "long long int", size: 64, align: 64, encoding: DW_ATE_signed)
!10 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 62, type: !11, isLocal: false, isDefinition: true, scopeLine: 62, flags: DIFlagPrototyped, isOptimized: false, variables: !2)
!11 = !DISubroutineType(types: !12)
!12 = !{!13, !13, !14}
!13 = !DIBasicType(name: "int", size: 32, align: 32, encoding: DW_ATE_signed)
!14 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !15, size: 64, align: 64)
!15 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !16, size: 64, align: 64)
!16 = !DIBasicType(name: "char", size: 8, align: 8, encoding: DW_ATE_signed_char)
!17 = !{i32 2, !"Dwarf Version", i32 4}
!18 = !{i32 2, !"Debug Info Version", i32 3}
!19 = !{!"clang version 3.9.0 (http://llvm.org/git/clang.git cf7bc8edf8cccb1b5de656c403cb55ad44132e98) (http://llvm.org/git/llvm.git 22706dc4c03305692f494d0e42a6de1050d0ec62)"}
!20 = !DILocation(line: 2, column: 25, scope: !6)
!21 = !DILocalVariable(name: "a", arg: 1, scope: !6, file: !1, line: 2, type: !9)
!22 = !DIExpression()
!23 = !DILocalVariable(name: "b", arg: 2, scope: !6, file: !1, line: 2, type: !9)
!24 = !DILocation(line: 2, column: 38, scope: !6)
!25 = !DILocalVariable(name: "_2", scope: !6, file: !1, line: 3, type: !9)
!26 = !DILocation(line: 3, column: 12, scope: !6)
!27 = !DILocalVariable(name: "_3", scope: !6, file: !1, line: 4, type: !9)
!28 = !DILocation(line: 4, column: 12, scope: !6)
!29 = !DILocalVariable(name: "_4", scope: !6, file: !1, line: 5, type: !9)
!30 = !DILocation(line: 5, column: 12, scope: !6)
!31 = !DILocalVariable(name: "_5", scope: !6, file: !1, line: 6, type: !9)
!32 = !DILocation(line: 6, column: 12, scope: !6)
!33 = !DILocalVariable(name: "_6", scope: !6, file: !1, line: 7, type: !9)
!34 = !DILocation(line: 7, column: 12, scope: !6)
!35 = !DILocalVariable(name: "_7", scope: !6, file: !1, line: 8, type: !9)
!36 = !DILocation(line: 8, column: 12, scope: !6)
!37 = !DILocation(line: 12, column: 6, scope: !38)
!38 = distinct !DILexicalBlock(scope: !6, file: !1, line: 12, column: 5)
!39 = !DILocation(line: 12, column: 5, scope: !6)
!40 = !DILocation(line: 24, column: 8, scope: !41)
!41 = distinct !DILexicalBlock(scope: !42, file: !1, line: 24, column: 7)
!42 = distinct !DILexicalBlock(scope: !43, file: !1, line: 20, column: 3)
!43 = distinct !DILexicalBlock(scope: !6, file: !1, line: 18, column: 13)
!44 = !DILocation(line: 24, column: 7, scope: !42)
!45 = !DILocation(line: 26, column: 12, scope: !42)
!46 = !DILocation(line: 26, column: 4, scope: !42)
!47 = !DILocation(line: 27, column: 4, scope: !42)
!48 = !DILocation(line: 35, column: 7, scope: !49)
!49 = distinct !DILexicalBlock(scope: !43, file: !1, line: 35, column: 6)
!50 = !DILocation(line: 35, column: 6, scope: !43)
!51 = !DILocation(line: 37, column: 7, scope: !52)
!52 = distinct !DILexicalBlock(scope: !43, file: !1, line: 37, column: 6)
!53 = !DILocation(line: 37, column: 6, scope: !43)
!54 = !DILocation(line: 60, column: 1, scope: !6)
!55 = !DILocation(line: 62, column: 14, scope: !10)
!56 = !DILocalVariable(name: "argc", arg: 1, scope: !10, file: !1, line: 62, type: !13)
!57 = !DILocalVariable(name: "args", arg: 2, scope: !10, file: !1, line: 62, type: !14)
!58 = !DILocation(line: 62, column: 27, scope: !10)
!59 = !DILocalVariable(name: "n", scope: !10, file: !1, line: 64, type: !9)
!60 = !DILocation(line: 64, column: 12, scope: !10)
!61 = !DILocalVariable(name: "sum", scope: !10, file: !1, line: 65, type: !9)
!62 = !DILocation(line: 65, column: 12, scope: !10)
!63 = !DILocalVariable(name: "i", scope: !10, file: !1, line: 66, type: !9)
!64 = !DILocation(line: 66, column: 12, scope: !10)
!65 = !DILocalVariable(name: "j", scope: !10, file: !1, line: 67, type: !9)
!66 = !DILocation(line: 67, column: 12, scope: !10)
!67 = !DILocalVariable(name: "_7", scope: !10, file: !1, line: 69, type: !68)
!68 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !69, size: 64, align: 64)
!69 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !9, size: 64, align: 64)
!70 = !DILocation(line: 69, column: 2, scope: !10)
!71 = !DILocalVariable(name: "_7_size", scope: !10, file: !1, line: 69, type: !9)
!72 = !DILocalVariable(name: "_7_size_size", scope: !10, file: !1, line: 69, type: !9)
!73 = !DILocalVariable(name: "_7_has_ownership", scope: !10, file: !1, line: 70, type: !74)
!74 = !DIBasicType(name: "_Bool", size: 8, align: 8, encoding: DW_ATE_boolean)
!75 = !DILocation(line: 70, column: 2, scope: !10)
!76 = !DILocalVariable(name: "_8", scope: !10, file: !1, line: 71, type: !9)
!77 = !DILocation(line: 71, column: 12, scope: !10)
!78 = !DILocalVariable(name: "_9", scope: !10, file: !1, line: 72, type: !69)
!79 = !DILocation(line: 72, column: 2, scope: !10)
!80 = !DILocalVariable(name: "_9_size", scope: !10, file: !1, line: 72, type: !9)
!81 = !DILocalVariable(name: "_9_has_ownership", scope: !10, file: !1, line: 73, type: !74)
!82 = !DILocation(line: 73, column: 2, scope: !10)
!83 = !DILocalVariable(name: "_12", scope: !10, file: !1, line: 75, type: !69)
!84 = !DILocation(line: 75, column: 2, scope: !10)
!85 = !DILocalVariable(name: "_12_size", scope: !10, file: !1, line: 75, type: !9)
!86 = !DILocalVariable(name: "_12_has_ownership", scope: !10, file: !1, line: 76, type: !74)
!87 = !DILocation(line: 76, column: 2, scope: !10)
!88 = !DILocalVariable(name: "_15", scope: !10, file: !1, line: 78, type: !9)
!89 = !DILocation(line: 78, column: 12, scope: !10)
!90 = !DILocalVariable(name: "_16", scope: !10, file: !1, line: 79, type: !9)
!91 = !DILocation(line: 79, column: 12, scope: !10)
!92 = !DILocalVariable(name: "_17", scope: !10, file: !1, line: 80, type: !9)
!93 = !DILocation(line: 80, column: 12, scope: !10)
!94 = !DILocalVariable(name: "_18", scope: !10, file: !1, line: 81, type: !9)
!95 = !DILocation(line: 81, column: 12, scope: !10)
!96 = !DILocalVariable(name: "_19", scope: !10, file: !1, line: 82, type: !9)
!97 = !DILocation(line: 82, column: 12, scope: !10)
!98 = !DILocalVariable(name: "_20", scope: !10, file: !1, line: 83, type: !9)
!99 = !DILocation(line: 83, column: 12, scope: !10)
!100 = !DILocalVariable(name: "_21", scope: !10, file: !1, line: 84, type: !9)
!101 = !DILocation(line: 84, column: 12, scope: !10)
!102 = !DILocalVariable(name: "_22", scope: !10, file: !1, line: 85, type: !9)
!103 = !DILocation(line: 85, column: 12, scope: !10)
!104 = !DILocalVariable(name: "_23", scope: !10, file: !1, line: 86, type: !9)
!105 = !DILocation(line: 86, column: 12, scope: !10)
!106 = !DILocalVariable(name: "_26", scope: !10, file: !1, line: 88, type: !69)
!107 = !DILocation(line: 88, column: 2, scope: !10)
!108 = !DILocalVariable(name: "_26_size", scope: !10, file: !1, line: 88, type: !9)
!109 = !DILocalVariable(name: "_26_has_ownership", scope: !10, file: !1, line: 89, type: !74)
!110 = !DILocation(line: 89, column: 2, scope: !10)
!111 = !DILocalVariable(name: "_31", scope: !10, file: !1, line: 92, type: !69)
!112 = !DILocation(line: 92, column: 2, scope: !10)
!113 = !DILocalVariable(name: "_31_size", scope: !10, file: !1, line: 92, type: !9)
!114 = !DILocalVariable(name: "_31_has_ownership", scope: !10, file: !1, line: 93, type: !74)
!115 = !DILocation(line: 93, column: 2, scope: !10)
!116 = !DILocation(line: 95, column: 2, scope: !10)
!117 = !DILocation(line: 100, column: 5, scope: !10)
!118 = !DILocation(line: 102, column: 2, scope: !10)
!119 = !DILocalVariable(name: "_6", scope: !10, file: !1, line: 68, type: !69)
!120 = !DILocation(line: 68, column: 13, scope: !10)
!121 = !DILocalVariable(name: "max", scope: !10, file: !1, line: 63, type: !69)
!122 = !DILocation(line: 63, column: 13, scope: !10)
!123 = !DILocation(line: 106, column: 9, scope: !124)
!124 = distinct !DILexicalBlock(scope: !10, file: !1, line: 106, column: 5)
!125 = !DILocation(line: 106, column: 5, scope: !10)
!126 = !DILocation(line: 108, column: 6, scope: !10)
!127 = !DILocation(line: 113, column: 2, scope: !10)
!128 = !DILocation(line: 114, column: 9, scope: !10)
!129 = !DILocation(line: 114, column: 15, scope: !10)
!130 = !DILocation(line: 114, column: 22, scope: !10)
!131 = !DILocation(line: 114, column: 28, scope: !10)
!132 = !DILocation(line: 114, column: 35, scope: !10)
!133 = !DILocation(line: 114, column: 41, scope: !10)
!134 = !DILocation(line: 114, column: 48, scope: !10)
!135 = !DILocation(line: 117, column: 2, scope: !10)
!136 = !DILocation(line: 121, column: 2, scope: !10)
!137 = !DILocation(line: 133, column: 7, scope: !138)
!138 = distinct !DILexicalBlock(scope: !139, file: !1, line: 133, column: 6)
!139 = distinct !DILexicalBlock(scope: !10, file: !1, line: 131, column: 13)
!140 = !DILocation(line: 133, column: 6, scope: !139)
!141 = !DILocation(line: 141, column: 8, scope: !142)
!142 = distinct !DILexicalBlock(scope: !143, file: !1, line: 141, column: 7)
!143 = distinct !DILexicalBlock(scope: !139, file: !1, line: 139, column: 14)
!144 = !DILocation(line: 141, column: 7, scope: !143)
!145 = !DILocation(line: 143, column: 10, scope: !143)
!146 = !DILocation(line: 151, column: 9, scope: !143)
!147 = !DILocation(line: 145, column: 11, scope: !143)
!148 = !DILocation(line: 162, column: 8, scope: !139)
!149 = !DILocation(line: 174, column: 2, scope: !10)
!150 = !DILocation(line: 175, column: 9, scope: !10)
!151 = !DILocation(line: 175, column: 15, scope: !10)
!152 = !DILocation(line: 175, column: 22, scope: !10)
!153 = !DILocation(line: 175, column: 29, scope: !10)
!154 = !DILocation(line: 175, column: 36, scope: !10)
!155 = !DILocation(line: 175, column: 43, scope: !10)
!156 = !DILocation(line: 175, column: 50, scope: !10)
!157 = !DILocation(line: 175, column: 56, scope: !10)
!158 = !DILocation(line: 175, column: 63, scope: !10)
!159 = !DILocation(line: 178, column: 2, scope: !10)
!160 = !DILocation(line: 182, column: 2, scope: !10)
!161 = !DILocation(line: 187, column: 2, scope: !10)
!162 = !DILocation(line: 188, column: 9, scope: !10)
!163 = !DILocation(line: 188, column: 15, scope: !10)
!164 = !DILocation(line: 188, column: 22, scope: !10)
!165 = !DILocation(line: 188, column: 28, scope: !10)
!166 = !DILocation(line: 188, column: 35, scope: !10)
!167 = !DILocation(line: 188, column: 42, scope: !10)
!168 = !DILocation(line: 188, column: 49, scope: !10)
!169 = !DILocation(line: 188, column: 56, scope: !10)
!170 = !DILocation(line: 188, column: 63, scope: !10)
!171 = !DILocation(line: 188, column: 69, scope: !10)
!172 = !DILocation(line: 188, column: 76, scope: !10)
!173 = !DILocation(line: 188, column: 82, scope: !10)
!174 = !DILocation(line: 188, column: 89, scope: !10)
!175 = !DILocation(line: 188, column: 96, scope: !10)
!176 = !DILocation(line: 188, column: 103, scope: !10)
!177 = !DILocation(line: 188, column: 109, scope: !10)
!178 = !DILocation(line: 188, column: 116, scope: !10)
!179 = !DILocation(line: 188, column: 123, scope: !10)
!180 = !DILocation(line: 188, column: 130, scope: !10)
!181 = !DILocation(line: 188, column: 137, scope: !10)
!182 = !DILocation(line: 188, column: 145, scope: !10)
!183 = !DILocation(line: 188, column: 152, scope: !10)
!184 = !DILocation(line: 188, column: 160, scope: !10)
!185 = !DILocation(line: 188, column: 166, scope: !10)
!186 = !DILocation(line: 188, column: 174, scope: !10)
!187 = !DILocation(line: 188, column: 180, scope: !10)
!188 = !DILocation(line: 188, column: 188, scope: !10)
!189 = !DILocation(line: 188, column: 194, scope: !10)
!190 = !DILocation(line: 188, column: 202, scope: !10)
!191 = !DILocation(line: 188, column: 208, scope: !10)
!192 = !DILocation(line: 188, column: 216, scope: !10)
!193 = !DILocation(line: 188, column: 222, scope: !10)
!194 = !DILocation(line: 188, column: 230, scope: !10)
!195 = !DILocation(line: 188, column: 237, scope: !10)
!196 = !DILocation(line: 188, column: 245, scope: !10)
!197 = !DILocation(line: 188, column: 252, scope: !10)
!198 = !DILocation(line: 188, column: 260, scope: !10)
!199 = !DILocation(line: 188, column: 267, scope: !10)
!200 = !DILocation(line: 188, column: 275, scope: !10)
!201 = !DILocation(line: 188, column: 282, scope: !10)
!202 = !DILocation(line: 188, column: 290, scope: !10)
!203 = !DILocation(line: 188, column: 296, scope: !10)
!204 = !DILocation(line: 188, column: 304, scope: !10)
!205 = !DILocation(line: 188, column: 310, scope: !10)
!206 = !DILocation(line: 188, column: 318, scope: !10)
!207 = !DILocation(line: 188, column: 324, scope: !10)
!208 = !DILocation(line: 188, column: 332, scope: !10)
!209 = !DILocation(line: 188, column: 339, scope: !10)
!210 = !DILocation(line: 188, column: 347, scope: !10)
!211 = !DILocation(line: 191, column: 2, scope: !10)
!212 = !DILocation(line: 195, column: 2, scope: !213)
!213 = !DILexicalBlockFile(scope: !214, file: !1, discriminator: 1)
!214 = distinct !DILexicalBlock(scope: !215, file: !1, line: 195, column: 2)
!215 = distinct !DILexicalBlock(scope: !10, file: !1, line: 195, column: 2)
!216 = !DILocation(line: 197, column: 2, scope: !10)
!217 = !DILocation(line: 197, column: 2, scope: !218)
!218 = !DILexicalBlockFile(scope: !219, file: !1, discriminator: 1)
!219 = distinct !DILexicalBlock(scope: !220, file: !1, line: 197, column: 2)
!220 = distinct !DILexicalBlock(scope: !10, file: !1, line: 197, column: 2)
!221 = !DILocation(line: 198, column: 2, scope: !222)
!222 = !DILexicalBlockFile(scope: !223, file: !1, discriminator: 1)
!223 = distinct !DILexicalBlock(scope: !224, file: !1, line: 198, column: 2)
!224 = distinct !DILexicalBlock(scope: !10, file: !1, line: 198, column: 2)
!225 = !DILocation(line: 199, column: 2, scope: !226)
!226 = !DILexicalBlockFile(scope: !227, file: !1, discriminator: 1)
!227 = distinct !DILexicalBlock(scope: !228, file: !1, line: 199, column: 2)
!228 = distinct !DILexicalBlock(scope: !10, file: !1, line: 199, column: 2)
!229 = !DILocation(line: 200, column: 2, scope: !10)
