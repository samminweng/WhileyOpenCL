; ModuleID = 'MatrixMult.preopt.s'
source_filename = "MatrixMult.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.Matrix = type { i64*, i32, i32 }

@.str = private unnamed_addr constant [3 x i8] c"%d\00", align 1
@.str.1 = private unnamed_addr constant [8 x i8] c"N = %d\0A\00", align 1
@.str.2 = private unnamed_addr constant [32 x i8] c"Pass %d X %d matrix test case \0A\00", align 1
@.str.3 = private unnamed_addr constant [59 x i8] c"A[%dX%d+%d] = %lld, B[%dX%d+%d] =%lld, C[%dX%d+%d] =%lld \0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define %struct.Matrix* @init(i32 %width, i32 %height) #0 !dbg !7 {
entry:
  br label %entry.split, !dbg !30

entry.split:                                      ; preds = %entry
  tail call void @llvm.dbg.value(metadata i32 %width, i64 0, metadata !31, metadata !32), !dbg !30
  tail call void @llvm.dbg.value(metadata i32 %height, i64 0, metadata !33, metadata !32), !dbg !34
  %conv = sext i32 %width to i64, !dbg !35
  %mul = shl nsw i64 %conv, 3, !dbg !36
  %conv1 = sext i32 %height to i64, !dbg !37
  %mul2 = mul i64 %mul, %conv1, !dbg !38
  %call = tail call noalias i8* @malloc(i64 %mul2) #5, !dbg !39
  %0 = bitcast i8* %call to i64*, !dbg !40
  tail call void @llvm.dbg.value(metadata i64* %0, i64 0, metadata !41, metadata !32), !dbg !42
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !43, metadata !32), !dbg !44
  %cmp8 = icmp sgt i32 %height, 0, !dbg !45
  br i1 %cmp8, label %for.cond4.preheader.lr.ph, label %for.cond12.preheader, !dbg !49

for.cond4.preheader.lr.ph:                        ; preds = %entry.split
  %1 = sext i32 %width to i64, !dbg !49
  br label %for.cond4.preheader, !dbg !49

for.cond4.preheader:                              ; preds = %for.cond4.preheader.lr.ph, %for.inc9
  %indvars.iv24 = phi i64 [ 0, %for.cond4.preheader.lr.ph ], [ %indvars.iv.next25, %for.inc9 ]
  %cmp56 = icmp sgt i32 %width, 0, !dbg !50
  br i1 %cmp56, label %for.body7.lr.ph, label %for.inc9, !dbg !55

for.body7.lr.ph:                                  ; preds = %for.cond4.preheader
  br label %for.body7, !dbg !55

for.cond.for.cond12.preheader_crit_edge:          ; preds = %for.inc9
  br label %for.cond12.preheader, !dbg !49

for.cond12.preheader:                             ; preds = %for.cond.for.cond12.preheader_crit_edge, %entry.split
  %cmp133 = icmp sgt i32 %height, 0, !dbg !56
  br i1 %cmp133, label %for.cond16.preheader.lr.ph, label %for.end35, !dbg !60

for.cond16.preheader.lr.ph:                       ; preds = %for.cond12.preheader
  %2 = sext i32 %width to i64, !dbg !60
  %3 = sext i32 %width to i64, !dbg !60
  br label %for.cond16.preheader, !dbg !60

for.body7:                                        ; preds = %for.body7.lr.ph, %for.body7
  %indvars.iv19 = phi i64 [ 0, %for.body7.lr.ph ], [ %indvars.iv.next20, %for.body7 ]
  %4 = mul nsw i64 %indvars.iv24, %1, !dbg !61
  %5 = add nsw i64 %indvars.iv19, %4, !dbg !63
  %arrayidx = getelementptr inbounds i64, i64* %0, i64 %5, !dbg !64
  store i64 0, i64* %arrayidx, align 8, !dbg !65
  %indvars.iv.next20 = add nuw nsw i64 %indvars.iv19, 1, !dbg !55
  tail call void @llvm.dbg.value(metadata !2, i64 0, metadata !66, metadata !32), !dbg !67
  %lftr.wideiv22 = trunc i64 %indvars.iv.next20 to i32, !dbg !55
  %exitcond23 = icmp ne i32 %lftr.wideiv22, %width, !dbg !55
  br i1 %exitcond23, label %for.body7, label %for.cond4.for.inc9_crit_edge, !dbg !55

for.cond4.for.inc9_crit_edge:                     ; preds = %for.body7
  br label %for.inc9, !dbg !55

for.inc9:                                         ; preds = %for.cond4.for.inc9_crit_edge, %for.cond4.preheader
  %indvars.iv.next25 = add nuw nsw i64 %indvars.iv24, 1, !dbg !49
  tail call void @llvm.dbg.value(metadata !2, i64 0, metadata !43, metadata !32), !dbg !44
  %lftr.wideiv27 = trunc i64 %indvars.iv.next25 to i32, !dbg !49
  %exitcond28 = icmp ne i32 %lftr.wideiv27, %height, !dbg !49
  br i1 %exitcond28, label %for.cond4.preheader, label %for.cond.for.cond12.preheader_crit_edge, !dbg !49

for.cond16.preheader:                             ; preds = %for.cond16.preheader.lr.ph, %for.inc33
  %indvars.iv13 = phi i64 [ 0, %for.cond16.preheader.lr.ph ], [ %indvars.iv.next14, %for.inc33 ]
  %cmp171 = icmp sgt i32 %width, 0, !dbg !68
  br i1 %cmp171, label %for.body19.lr.ph, label %for.inc33, !dbg !73

for.body19.lr.ph:                                 ; preds = %for.cond16.preheader
  br label %for.body19, !dbg !73

for.body19:                                       ; preds = %for.body19.lr.ph, %for.body19
  %indvars.iv = phi i64 [ 0, %for.body19.lr.ph ], [ %indvars.iv.next, %for.body19 ]
  %6 = mul nsw i64 %indvars.iv13, %3, !dbg !74
  %7 = add nsw i64 %indvars.iv, %6, !dbg !76
  %arrayidx23 = getelementptr inbounds i64, i64* %0, i64 %7, !dbg !77
  %8 = load i64, i64* %arrayidx23, align 8, !dbg !77
  %add25 = add nsw i64 %8, %indvars.iv13, !dbg !78
  %9 = mul nsw i64 %indvars.iv13, %2, !dbg !79
  %10 = add nsw i64 %indvars.iv, %9, !dbg !80
  %arrayidx29 = getelementptr inbounds i64, i64* %0, i64 %10, !dbg !81
  store i64 %add25, i64* %arrayidx29, align 8, !dbg !82
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1, !dbg !73
  tail call void @llvm.dbg.value(metadata !2, i64 0, metadata !66, metadata !32), !dbg !67
  %lftr.wideiv = trunc i64 %indvars.iv.next to i32, !dbg !73
  %exitcond = icmp ne i32 %lftr.wideiv, %width, !dbg !73
  br i1 %exitcond, label %for.body19, label %for.cond16.for.inc33_crit_edge, !dbg !73

for.cond16.for.inc33_crit_edge:                   ; preds = %for.body19
  br label %for.inc33, !dbg !73

for.inc33:                                        ; preds = %for.cond16.for.inc33_crit_edge, %for.cond16.preheader
  %indvars.iv.next14 = add nuw nsw i64 %indvars.iv13, 1, !dbg !60
  tail call void @llvm.dbg.value(metadata !2, i64 0, metadata !43, metadata !32), !dbg !44
  %lftr.wideiv17 = trunc i64 %indvars.iv.next14 to i32, !dbg !60
  %exitcond18 = icmp ne i32 %lftr.wideiv17, %height, !dbg !60
  br i1 %exitcond18, label %for.cond16.preheader, label %for.cond12.for.end35_crit_edge, !dbg !60

for.cond12.for.end35_crit_edge:                   ; preds = %for.inc33
  br label %for.end35, !dbg !60

for.end35:                                        ; preds = %for.cond12.for.end35_crit_edge, %for.cond12.preheader
  %call36 = tail call noalias i8* @malloc(i64 16) #5, !dbg !83
  %11 = bitcast i8* %call36 to %struct.Matrix*, !dbg !83
  tail call void @llvm.dbg.value(metadata %struct.Matrix* %11, i64 0, metadata !84, metadata !32), !dbg !85
  %12 = bitcast i8* %call36 to i8**, !dbg !86
  store i8* %call, i8** %12, align 8, !dbg !86
  %width38 = getelementptr inbounds i8, i8* %call36, i64 8, !dbg !87
  %13 = bitcast i8* %width38 to i32*, !dbg !87
  store i32 %width, i32* %13, align 8, !dbg !88
  %height39 = getelementptr inbounds i8, i8* %call36, i64 12, !dbg !89
  %14 = bitcast i8* %height39 to i32*, !dbg !89
  store i32 %height, i32* %14, align 4, !dbg !90
  ret %struct.Matrix* %11, !dbg !91
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare noalias i8* @malloc(i64) #2

; Function Attrs: noinline nounwind uwtable
define %struct.Matrix* @mat_mult(%struct.Matrix* %a, %struct.Matrix* %b) #0 !dbg !18 {
entry:
  br label %entry.split, !dbg !92

entry.split:                                      ; preds = %entry
  tail call void @llvm.dbg.value(metadata %struct.Matrix* %a, i64 0, metadata !93, metadata !32), !dbg !92
  tail call void @llvm.dbg.value(metadata %struct.Matrix* %b, i64 0, metadata !94, metadata !32), !dbg !95
  %width1 = getelementptr inbounds %struct.Matrix, %struct.Matrix* %b, i64 0, i32 1, !dbg !96
  %0 = load i32, i32* %width1, align 8, !dbg !96
  tail call void @llvm.dbg.value(metadata i32 %0, i64 0, metadata !97, metadata !32), !dbg !98
  %height2 = getelementptr inbounds %struct.Matrix, %struct.Matrix* %a, i64 0, i32 2, !dbg !99
  %1 = load i32, i32* %height2, align 4, !dbg !99
  tail call void @llvm.dbg.value(metadata i32 %1, i64 0, metadata !100, metadata !32), !dbg !101
  %data = getelementptr inbounds %struct.Matrix, %struct.Matrix* %a, i64 0, i32 0, !dbg !102
  %2 = load i64*, i64** %data, align 8, !dbg !102
  tail call void @llvm.dbg.value(metadata i64* %2, i64 0, metadata !103, metadata !32), !dbg !104
  %data3 = getelementptr inbounds %struct.Matrix, %struct.Matrix* %b, i64 0, i32 0, !dbg !105
  %3 = load i64*, i64** %data3, align 8, !dbg !105
  tail call void @llvm.dbg.value(metadata i64* %3, i64 0, metadata !106, metadata !32), !dbg !107
  %conv = sext i32 %0 to i64, !dbg !108
  %mul = shl nsw i64 %conv, 3, !dbg !109
  %conv5 = sext i32 %1 to i64, !dbg !110
  %mul6 = mul i64 %mul, %conv5, !dbg !111
  %call = tail call noalias i8* @malloc(i64 %mul6) #5, !dbg !112
  %4 = bitcast i8* %call to i64*, !dbg !113
  tail call void @llvm.dbg.value(metadata i64* %4, i64 0, metadata !114, metadata !32), !dbg !115
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !116, metadata !32), !dbg !117
  %cmp6 = icmp sgt i32 %0, 0, !dbg !118
  br i1 %cmp6, label %for.cond8.preheader.lr.ph, label %for.end40, !dbg !122

for.cond8.preheader.lr.ph:                        ; preds = %entry.split
  %5 = sext i32 %0 to i64, !dbg !122
  %6 = sext i32 %0 to i64, !dbg !122
  %7 = sext i32 %0 to i64, !dbg !122
  %8 = sext i32 %0 to i64, !dbg !122
  %9 = sext i32 %0 to i64, !dbg !122
  br label %for.cond8.preheader, !dbg !122

for.cond8.preheader:                              ; preds = %for.cond8.preheader.lr.ph, %for.inc38
  %indvars.iv19 = phi i64 [ 0, %for.cond8.preheader.lr.ph ], [ %indvars.iv.next20, %for.inc38 ]
  %cmp93 = icmp sgt i32 %1, 0, !dbg !123
  br i1 %cmp93, label %for.body11.lr.ph, label %for.inc38, !dbg !128

for.body11.lr.ph:                                 ; preds = %for.cond8.preheader
  br label %for.body11, !dbg !128

for.body11:                                       ; preds = %for.body11.lr.ph, %for.inc35
  %indvars.iv12 = phi i64 [ 0, %for.body11.lr.ph ], [ %indvars.iv.next13, %for.inc35 ]
  %10 = mul nsw i64 %indvars.iv19, %9, !dbg !129
  %11 = add nsw i64 %indvars.iv12, %10, !dbg !131
  %arrayidx = getelementptr inbounds i64, i64* %4, i64 %11, !dbg !132
  store i64 0, i64* %arrayidx, align 8, !dbg !133
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !134, metadata !32), !dbg !135
  %cmp141 = icmp sgt i32 %0, 0, !dbg !136
  br i1 %cmp141, label %for.body16.lr.ph, label %for.inc35, !dbg !140

for.body16.lr.ph:                                 ; preds = %for.body11
  br label %for.body16, !dbg !140

for.body16:                                       ; preds = %for.body16.lr.ph, %for.body16
  %indvars.iv = phi i64 [ 0, %for.body16.lr.ph ], [ %indvars.iv.next, %for.body16 ]
  %12 = mul nsw i64 %indvars.iv19, %8, !dbg !141
  %13 = add nsw i64 %indvars.iv12, %12, !dbg !142
  %arrayidx20 = getelementptr inbounds i64, i64* %4, i64 %13, !dbg !143
  %14 = load i64, i64* %arrayidx20, align 8, !dbg !143
  %15 = mul nsw i64 %indvars.iv19, %7, !dbg !144
  %16 = add nsw i64 %indvars.iv, %15, !dbg !145
  %arrayidx24 = getelementptr inbounds i64, i64* %2, i64 %16, !dbg !146
  %17 = load i64, i64* %arrayidx24, align 8, !dbg !146
  %18 = mul nsw i64 %indvars.iv, %5, !dbg !147
  %19 = add nsw i64 %18, %indvars.iv12, !dbg !148
  %arrayidx28 = getelementptr inbounds i64, i64* %3, i64 %19, !dbg !149
  %20 = load i64, i64* %arrayidx28, align 8, !dbg !149
  %mul29 = mul nsw i64 %20, %17, !dbg !150
  %add30 = add nsw i64 %mul29, %14, !dbg !151
  %21 = mul nsw i64 %indvars.iv19, %6, !dbg !152
  %22 = add nsw i64 %indvars.iv12, %21, !dbg !153
  %arrayidx34 = getelementptr inbounds i64, i64* %4, i64 %22, !dbg !154
  store i64 %add30, i64* %arrayidx34, align 8, !dbg !155
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1, !dbg !140
  tail call void @llvm.dbg.value(metadata !2, i64 0, metadata !134, metadata !32), !dbg !135
  %lftr.wideiv = trunc i64 %indvars.iv.next to i32, !dbg !140
  %exitcond = icmp ne i32 %lftr.wideiv, %0, !dbg !140
  br i1 %exitcond, label %for.body16, label %for.cond13.for.inc35_crit_edge, !dbg !140

for.cond13.for.inc35_crit_edge:                   ; preds = %for.body16
  br label %for.inc35, !dbg !140

for.inc35:                                        ; preds = %for.cond13.for.inc35_crit_edge, %for.body11
  %indvars.iv.next13 = add nuw nsw i64 %indvars.iv12, 1, !dbg !128
  tail call void @llvm.dbg.value(metadata !2, i64 0, metadata !156, metadata !32), !dbg !157
  %lftr.wideiv17 = trunc i64 %indvars.iv.next13 to i32, !dbg !128
  %exitcond18 = icmp ne i32 %lftr.wideiv17, %1, !dbg !128
  br i1 %exitcond18, label %for.body11, label %for.cond8.for.inc38_crit_edge, !dbg !128

for.cond8.for.inc38_crit_edge:                    ; preds = %for.inc35
  br label %for.inc38, !dbg !128

for.inc38:                                        ; preds = %for.cond8.for.inc38_crit_edge, %for.cond8.preheader
  %indvars.iv.next20 = add nuw nsw i64 %indvars.iv19, 1, !dbg !122
  tail call void @llvm.dbg.value(metadata !2, i64 0, metadata !116, metadata !32), !dbg !117
  %lftr.wideiv25 = trunc i64 %indvars.iv.next20 to i32, !dbg !122
  %exitcond26 = icmp ne i32 %lftr.wideiv25, %0, !dbg !122
  br i1 %exitcond26, label %for.cond8.preheader, label %for.cond.for.end40_crit_edge, !dbg !122

for.cond.for.end40_crit_edge:                     ; preds = %for.inc38
  br label %for.end40, !dbg !122

for.end40:                                        ; preds = %for.cond.for.end40_crit_edge, %entry.split
  %call41 = tail call noalias i8* @malloc(i64 16) #5, !dbg !158
  %23 = bitcast i8* %call41 to %struct.Matrix*, !dbg !158
  tail call void @llvm.dbg.value(metadata %struct.Matrix* %23, i64 0, metadata !159, metadata !32), !dbg !160
  %width42 = getelementptr inbounds i8, i8* %call41, i64 8, !dbg !161
  %24 = bitcast i8* %width42 to i32*, !dbg !161
  store i32 %0, i32* %24, align 8, !dbg !162
  %height43 = getelementptr inbounds i8, i8* %call41, i64 12, !dbg !163
  %25 = bitcast i8* %height43 to i32*, !dbg !163
  store i32 %1, i32* %25, align 4, !dbg !164
  %26 = bitcast i8* %call41 to i8**, !dbg !165
  store i8* %call, i8** %26, align 8, !dbg !165
  ret %struct.Matrix* %23, !dbg !166
}

; Function Attrs: nounwind uwtable
define i32 @main(i32 %argc, i8** %args) #3 !dbg !21 {
entry:
  %max = alloca i32, align 4
  br label %entry.split, !dbg !167

entry.split:                                      ; preds = %entry
  tail call void @llvm.dbg.value(metadata i32 %argc, i64 0, metadata !168, metadata !32), !dbg !167
  tail call void @llvm.dbg.value(metadata i8** %args, i64 0, metadata !169, metadata !32), !dbg !170
  %arrayidx = getelementptr inbounds i8*, i8** %args, i64 1, !dbg !171
  %0 = load i8*, i8** %arrayidx, align 8, !dbg !171
  tail call void @llvm.dbg.value(metadata i32* %max, i64 0, metadata !172, metadata !173), !dbg !174
  %call = call i32 (i8*, i8*, ...) @__isoc99_sscanf(i8* %0, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str, i64 0, i64 0), i32* nonnull %max) #5, !dbg !175
  %1 = load i32, i32* %max, align 4, !dbg !176
  call void @llvm.dbg.value(metadata i32 %1, i64 0, metadata !172, metadata !32), !dbg !174
  %call1 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.1, i64 0, i64 0), i32 %1) #5, !dbg !177
  %2 = load i32, i32* %max, align 4, !dbg !178
  call void @llvm.dbg.value(metadata i32 %2, i64 0, metadata !172, metadata !32), !dbg !174
  call void @llvm.dbg.value(metadata i32 %2, i64 0, metadata !172, metadata !32), !dbg !174
  %call2 = call %struct.Matrix* @init(i32 %2, i32 %2), !dbg !179
  call void @llvm.dbg.value(metadata %struct.Matrix* %call2, i64 0, metadata !180, metadata !32), !dbg !181
  %3 = load i32, i32* %max, align 4, !dbg !182
  call void @llvm.dbg.value(metadata i32 %3, i64 0, metadata !172, metadata !32), !dbg !174
  call void @llvm.dbg.value(metadata i32 %3, i64 0, metadata !172, metadata !32), !dbg !174
  %call3 = call %struct.Matrix* @init(i32 %3, i32 %3), !dbg !183
  call void @llvm.dbg.value(metadata %struct.Matrix* %call3, i64 0, metadata !184, metadata !32), !dbg !185
  %call4 = call %struct.Matrix* @mat_mult(%struct.Matrix* %call2, %struct.Matrix* %call3), !dbg !186
  call void @llvm.dbg.value(metadata %struct.Matrix* %call4, i64 0, metadata !187, metadata !32), !dbg !188
  %4 = load i32, i32* %max, align 4, !dbg !189
  call void @llvm.dbg.value(metadata i32 %4, i64 0, metadata !172, metadata !32), !dbg !174
  call void @llvm.dbg.value(metadata i32 %4, i64 0, metadata !172, metadata !32), !dbg !174
  %call5 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str.2, i64 0, i64 0), i32 %4, i32 %4) #5, !dbg !190
  %5 = load i32, i32* %max, align 4, !dbg !191
  call void @llvm.dbg.value(metadata i32 %5, i64 0, metadata !172, metadata !32), !dbg !174
  %sub = add nsw i32 %5, -1, !dbg !192
  call void @llvm.dbg.value(metadata i32 %5, i64 0, metadata !172, metadata !32), !dbg !174
  call void @llvm.dbg.value(metadata i32 %5, i64 0, metadata !172, metadata !32), !dbg !174
  %sub6 = add nsw i32 %5, -1, !dbg !193
  call void @llvm.dbg.value(metadata i32 %5, i64 0, metadata !172, metadata !32), !dbg !174
  call void @llvm.dbg.value(metadata i32 %5, i64 0, metadata !172, metadata !32), !dbg !174
  call void @llvm.dbg.value(metadata i32 %5, i64 0, metadata !172, metadata !32), !dbg !174
  %add = mul i32 %5, %5, !dbg !194
  %sub8 = add nsw i32 %add, -1, !dbg !195
  %idxprom = sext i32 %sub8 to i64, !dbg !196
  %data = getelementptr inbounds %struct.Matrix, %struct.Matrix* %call2, i64 0, i32 0, !dbg !197
  %6 = load i64*, i64** %data, align 8, !dbg !197
  %arrayidx9 = getelementptr inbounds i64, i64* %6, i64 %idxprom, !dbg !196
  %7 = load i64, i64* %arrayidx9, align 8, !dbg !196
  %8 = load i32, i32* %max, align 4, !dbg !198
  call void @llvm.dbg.value(metadata i32 %8, i64 0, metadata !172, metadata !32), !dbg !174
  %sub10 = add nsw i32 %8, -1, !dbg !199
  call void @llvm.dbg.value(metadata i32 %8, i64 0, metadata !172, metadata !32), !dbg !174
  call void @llvm.dbg.value(metadata i32 %8, i64 0, metadata !172, metadata !32), !dbg !174
  %sub11 = add nsw i32 %8, -1, !dbg !200
  call void @llvm.dbg.value(metadata i32 %8, i64 0, metadata !172, metadata !32), !dbg !174
  call void @llvm.dbg.value(metadata i32 %8, i64 0, metadata !172, metadata !32), !dbg !174
  call void @llvm.dbg.value(metadata i32 %8, i64 0, metadata !172, metadata !32), !dbg !174
  %add14 = mul i32 %8, %8, !dbg !201
  %sub15 = add nsw i32 %add14, -1, !dbg !202
  %idxprom16 = sext i32 %sub15 to i64, !dbg !203
  %data17 = getelementptr inbounds %struct.Matrix, %struct.Matrix* %call3, i64 0, i32 0, !dbg !204
  %9 = load i64*, i64** %data17, align 8, !dbg !204
  %arrayidx18 = getelementptr inbounds i64, i64* %9, i64 %idxprom16, !dbg !203
  %10 = load i64, i64* %arrayidx18, align 8, !dbg !203
  %11 = load i32, i32* %max, align 4, !dbg !205
  call void @llvm.dbg.value(metadata i32 %11, i64 0, metadata !172, metadata !32), !dbg !174
  %sub19 = add nsw i32 %11, -1, !dbg !206
  call void @llvm.dbg.value(metadata i32 %11, i64 0, metadata !172, metadata !32), !dbg !174
  call void @llvm.dbg.value(metadata i32 %11, i64 0, metadata !172, metadata !32), !dbg !174
  %sub20 = add nsw i32 %11, -1, !dbg !207
  call void @llvm.dbg.value(metadata i32 %11, i64 0, metadata !172, metadata !32), !dbg !174
  call void @llvm.dbg.value(metadata i32 %11, i64 0, metadata !172, metadata !32), !dbg !174
  call void @llvm.dbg.value(metadata i32 %11, i64 0, metadata !172, metadata !32), !dbg !174
  %add23 = mul i32 %11, %11, !dbg !208
  %sub24 = add nsw i32 %add23, -1, !dbg !209
  %idxprom25 = sext i32 %sub24 to i64, !dbg !210
  %data26 = getelementptr inbounds %struct.Matrix, %struct.Matrix* %call4, i64 0, i32 0, !dbg !211
  %12 = load i64*, i64** %data26, align 8, !dbg !211
  %arrayidx27 = getelementptr inbounds i64, i64* %12, i64 %idxprom25, !dbg !210
  %13 = load i64, i64* %arrayidx27, align 8, !dbg !210
  %call28 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([59 x i8], [59 x i8]* @.str.3, i64 0, i64 0), i32 %sub, i32 %5, i32 %sub6, i64 %7, i32 %sub10, i32 %8, i32 %sub11, i64 %10, i32 %sub19, i32 %11, i32 %sub20, i64 %13) #5, !dbg !212
  ret i32 0, !dbg !213
}

; Function Attrs: nounwind
declare i32 @__isoc99_sscanf(i8*, i8*, ...) #2

declare i32 @printf(i8*, ...) #4

; Function Attrs: nounwind readnone
declare void @llvm.dbg.value(metadata, i64, metadata, metadata) #1

attributes #0 = { noinline nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone }
attributes #2 = { nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!27, !28}
!llvm.ident = !{!29}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 3.9.0 (http://llvm.org/git/clang.git cf7bc8edf8cccb1b5de656c403cb55ad44132e98) (http://llvm.org/git/llvm.git 22706dc4c03305692f494d0e42a6de1050d0ec62)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, subprograms: !6)
!1 = !DIFile(filename: "MatrixMult.c", directory: "/home/sam/workspace/WhileyOpenCL/polly/MatrixMult/impl/handwritten1")
!2 = !{}
!3 = !{!4}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64, align: 64)
!5 = !DIBasicType(name: "long long int", size: 64, align: 64, encoding: DW_ATE_signed)
!6 = !{!7, !18, !21}
!7 = distinct !DISubprogram(name: "init", scope: !1, file: !1, line: 12, type: !8, isLocal: false, isDefinition: true, scopeLine: 12, flags: DIFlagPrototyped, isOptimized: false, variables: !2)
!8 = !DISubroutineType(types: !9)
!9 = !{!10, !16, !16}
!10 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !11, size: 64, align: 64)
!11 = !DIDerivedType(tag: DW_TAG_typedef, name: "Matrix", file: !1, line: 7, baseType: !12)
!12 = !DICompositeType(tag: DW_TAG_structure_type, file: !1, line: 3, size: 128, align: 64, elements: !13)
!13 = !{!14, !15, !17}
!14 = !DIDerivedType(tag: DW_TAG_member, name: "data", scope: !12, file: !1, line: 4, baseType: !4, size: 64, align: 64)
!15 = !DIDerivedType(tag: DW_TAG_member, name: "width", scope: !12, file: !1, line: 5, baseType: !16, size: 32, align: 32, offset: 64)
!16 = !DIBasicType(name: "int", size: 32, align: 32, encoding: DW_ATE_signed)
!17 = !DIDerivedType(tag: DW_TAG_member, name: "height", scope: !12, file: !1, line: 6, baseType: !16, size: 32, align: 32, offset: 96)
!18 = distinct !DISubprogram(name: "mat_mult", scope: !1, file: !1, line: 47, type: !19, isLocal: false, isDefinition: true, scopeLine: 47, flags: DIFlagPrototyped, isOptimized: false, variables: !2)
!19 = !DISubroutineType(types: !20)
!20 = !{!10, !10, !10}
!21 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 71, type: !22, isLocal: false, isDefinition: true, scopeLine: 72, flags: DIFlagPrototyped, isOptimized: false, variables: !2)
!22 = !DISubroutineType(types: !23)
!23 = !{!16, !16, !24}
!24 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !25, size: 64, align: 64)
!25 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !26, size: 64, align: 64)
!26 = !DIBasicType(name: "char", size: 8, align: 8, encoding: DW_ATE_signed_char)
!27 = !{i32 2, !"Dwarf Version", i32 4}
!28 = !{i32 2, !"Debug Info Version", i32 3}
!29 = !{!"clang version 3.9.0 (http://llvm.org/git/clang.git cf7bc8edf8cccb1b5de656c403cb55ad44132e98) (http://llvm.org/git/llvm.git 22706dc4c03305692f494d0e42a6de1050d0ec62)"}
!30 = !DILocation(line: 12, column: 18, scope: !7)
!31 = !DILocalVariable(name: "width", arg: 1, scope: !7, file: !1, line: 12, type: !16)
!32 = !DIExpression()
!33 = !DILocalVariable(name: "height", arg: 2, scope: !7, file: !1, line: 12, type: !16)
!34 = !DILocation(line: 12, column: 29, scope: !7)
!35 = !DILocation(line: 25, column: 60, scope: !7)
!36 = !DILocation(line: 25, column: 59, scope: !7)
!37 = !DILocation(line: 25, column: 66, scope: !7)
!38 = !DILocation(line: 25, column: 65, scope: !7)
!39 = !DILocation(line: 25, column: 35, scope: !7)
!40 = !DILocation(line: 25, column: 23, scope: !7)
!41 = !DILocalVariable(name: "data", scope: !7, file: !1, line: 25, type: !4)
!42 = !DILocation(line: 25, column: 16, scope: !7)
!43 = !DILocalVariable(name: "i", scope: !7, file: !1, line: 14, type: !16)
!44 = !DILocation(line: 14, column: 9, scope: !7)
!45 = !DILocation(line: 27, column: 16, scope: !46)
!46 = !DILexicalBlockFile(scope: !47, file: !1, discriminator: 1)
!47 = distinct !DILexicalBlock(scope: !48, file: !1, line: 27, column: 5)
!48 = distinct !DILexicalBlock(scope: !7, file: !1, line: 27, column: 5)
!49 = !DILocation(line: 27, column: 5, scope: !46)
!50 = !DILocation(line: 28, column: 20, scope: !51)
!51 = !DILexicalBlockFile(scope: !52, file: !1, discriminator: 1)
!52 = distinct !DILexicalBlock(scope: !53, file: !1, line: 28, column: 9)
!53 = distinct !DILexicalBlock(scope: !54, file: !1, line: 28, column: 9)
!54 = distinct !DILexicalBlock(scope: !47, file: !1, line: 27, column: 30)
!55 = !DILocation(line: 28, column: 9, scope: !51)
!56 = !DILocation(line: 33, column: 16, scope: !57)
!57 = !DILexicalBlockFile(scope: !58, file: !1, discriminator: 1)
!58 = distinct !DILexicalBlock(scope: !59, file: !1, line: 33, column: 5)
!59 = distinct !DILexicalBlock(scope: !7, file: !1, line: 33, column: 5)
!60 = !DILocation(line: 33, column: 5, scope: !57)
!61 = !DILocation(line: 29, column: 19, scope: !62)
!62 = distinct !DILexicalBlock(scope: !52, file: !1, line: 28, column: 33)
!63 = !DILocation(line: 29, column: 25, scope: !62)
!64 = !DILocation(line: 29, column: 13, scope: !62)
!65 = !DILocation(line: 29, column: 29, scope: !62)
!66 = !DILocalVariable(name: "j", scope: !7, file: !1, line: 14, type: !16)
!67 = !DILocation(line: 14, column: 12, scope: !7)
!68 = !DILocation(line: 34, column: 20, scope: !69)
!69 = !DILexicalBlockFile(scope: !70, file: !1, discriminator: 1)
!70 = distinct !DILexicalBlock(scope: !71, file: !1, line: 34, column: 9)
!71 = distinct !DILexicalBlock(scope: !72, file: !1, line: 34, column: 9)
!72 = distinct !DILexicalBlock(scope: !58, file: !1, line: 33, column: 30)
!73 = !DILocation(line: 34, column: 9, scope: !69)
!74 = !DILocation(line: 35, column: 37, scope: !75)
!75 = distinct !DILexicalBlock(scope: !70, file: !1, line: 34, column: 33)
!76 = !DILocation(line: 35, column: 43, scope: !75)
!77 = !DILocation(line: 35, column: 31, scope: !75)
!78 = !DILocation(line: 35, column: 47, scope: !75)
!79 = !DILocation(line: 35, column: 19, scope: !75)
!80 = !DILocation(line: 35, column: 25, scope: !75)
!81 = !DILocation(line: 35, column: 13, scope: !75)
!82 = !DILocation(line: 35, column: 29, scope: !75)
!83 = !DILocation(line: 39, column: 17, scope: !7)
!84 = !DILocalVariable(name: "m", scope: !7, file: !1, line: 39, type: !10)
!85 = !DILocation(line: 39, column: 13, scope: !7)
!86 = !DILocation(line: 40, column: 13, scope: !7)
!87 = !DILocation(line: 41, column: 8, scope: !7)
!88 = !DILocation(line: 41, column: 14, scope: !7)
!89 = !DILocation(line: 42, column: 8, scope: !7)
!90 = !DILocation(line: 42, column: 15, scope: !7)
!91 = !DILocation(line: 44, column: 5, scope: !7)
!92 = !DILocation(line: 47, column: 26, scope: !18)
!93 = !DILocalVariable(name: "a", arg: 1, scope: !18, file: !1, line: 47, type: !10)
!94 = !DILocalVariable(name: "b", arg: 2, scope: !18, file: !1, line: 47, type: !10)
!95 = !DILocation(line: 47, column: 37, scope: !18)
!96 = !DILocation(line: 49, column: 20, scope: !18)
!97 = !DILocalVariable(name: "width", scope: !18, file: !1, line: 49, type: !16)
!98 = !DILocation(line: 49, column: 9, scope: !18)
!99 = !DILocation(line: 50, column: 21, scope: !18)
!100 = !DILocalVariable(name: "height", scope: !18, file: !1, line: 50, type: !16)
!101 = !DILocation(line: 50, column: 9, scope: !18)
!102 = !DILocation(line: 51, column: 28, scope: !18)
!103 = !DILocalVariable(name: "a_data", scope: !18, file: !1, line: 51, type: !4)
!104 = !DILocation(line: 51, column: 16, scope: !18)
!105 = !DILocation(line: 52, column: 28, scope: !18)
!106 = !DILocalVariable(name: "b_data", scope: !18, file: !1, line: 52, type: !4)
!107 = !DILocation(line: 52, column: 16, scope: !18)
!108 = !DILocation(line: 53, column: 60, scope: !18)
!109 = !DILocation(line: 53, column: 59, scope: !18)
!110 = !DILocation(line: 53, column: 66, scope: !18)
!111 = !DILocation(line: 53, column: 65, scope: !18)
!112 = !DILocation(line: 53, column: 35, scope: !18)
!113 = !DILocation(line: 53, column: 23, scope: !18)
!114 = !DILocalVariable(name: "data", scope: !18, file: !1, line: 53, type: !4)
!115 = !DILocation(line: 53, column: 16, scope: !18)
!116 = !DILocalVariable(name: "i", scope: !18, file: !1, line: 48, type: !16)
!117 = !DILocation(line: 48, column: 9, scope: !18)
!118 = !DILocation(line: 55, column: 15, scope: !119)
!119 = !DILexicalBlockFile(scope: !120, file: !1, discriminator: 1)
!120 = distinct !DILexicalBlock(scope: !121, file: !1, line: 55, column: 5)
!121 = distinct !DILexicalBlock(scope: !18, file: !1, line: 55, column: 5)
!122 = !DILocation(line: 55, column: 5, scope: !119)
!123 = !DILocation(line: 56, column: 19, scope: !124)
!124 = !DILexicalBlockFile(scope: !125, file: !1, discriminator: 1)
!125 = distinct !DILexicalBlock(scope: !126, file: !1, line: 56, column: 9)
!126 = distinct !DILexicalBlock(scope: !127, file: !1, line: 56, column: 9)
!127 = distinct !DILexicalBlock(scope: !120, file: !1, line: 55, column: 29)
!128 = !DILocation(line: 56, column: 9, scope: !124)
!129 = !DILocation(line: 57, column: 19, scope: !130)
!130 = distinct !DILexicalBlock(scope: !125, file: !1, line: 56, column: 34)
!131 = !DILocation(line: 57, column: 25, scope: !130)
!132 = !DILocation(line: 57, column: 13, scope: !130)
!133 = !DILocation(line: 57, column: 29, scope: !130)
!134 = !DILocalVariable(name: "k", scope: !18, file: !1, line: 48, type: !16)
!135 = !DILocation(line: 48, column: 15, scope: !18)
!136 = !DILocation(line: 58, column: 23, scope: !137)
!137 = !DILexicalBlockFile(scope: !138, file: !1, discriminator: 1)
!138 = distinct !DILexicalBlock(scope: !139, file: !1, line: 58, column: 13)
!139 = distinct !DILexicalBlock(scope: !130, file: !1, line: 58, column: 13)
!140 = !DILocation(line: 58, column: 13, scope: !137)
!141 = !DILocation(line: 59, column: 41, scope: !138)
!142 = !DILocation(line: 59, column: 47, scope: !138)
!143 = !DILocation(line: 59, column: 35, scope: !138)
!144 = !DILocation(line: 59, column: 61, scope: !138)
!145 = !DILocation(line: 59, column: 67, scope: !138)
!146 = !DILocation(line: 59, column: 53, scope: !138)
!147 = !DILocation(line: 59, column: 81, scope: !138)
!148 = !DILocation(line: 59, column: 87, scope: !138)
!149 = !DILocation(line: 59, column: 73, scope: !138)
!150 = !DILocation(line: 59, column: 71, scope: !138)
!151 = !DILocation(line: 59, column: 51, scope: !138)
!152 = !DILocation(line: 59, column: 23, scope: !138)
!153 = !DILocation(line: 59, column: 29, scope: !138)
!154 = !DILocation(line: 59, column: 17, scope: !138)
!155 = !DILocation(line: 59, column: 33, scope: !138)
!156 = !DILocalVariable(name: "j", scope: !18, file: !1, line: 48, type: !16)
!157 = !DILocation(line: 48, column: 12, scope: !18)
!158 = !DILocation(line: 63, column: 17, scope: !18)
!159 = !DILocalVariable(name: "m", scope: !18, file: !1, line: 63, type: !10)
!160 = !DILocation(line: 63, column: 13, scope: !18)
!161 = !DILocation(line: 64, column: 8, scope: !18)
!162 = !DILocation(line: 64, column: 14, scope: !18)
!163 = !DILocation(line: 65, column: 8, scope: !18)
!164 = !DILocation(line: 65, column: 15, scope: !18)
!165 = !DILocation(line: 66, column: 13, scope: !18)
!166 = !DILocation(line: 67, column: 5, scope: !18)
!167 = !DILocation(line: 71, column: 14, scope: !21)
!168 = !DILocalVariable(name: "argc", arg: 1, scope: !21, file: !1, line: 71, type: !16)
!169 = !DILocalVariable(name: "args", arg: 2, scope: !21, file: !1, line: 71, type: !24)
!170 = !DILocation(line: 71, column: 27, scope: !21)
!171 = !DILocation(line: 75, column: 12, scope: !21)
!172 = !DILocalVariable(name: "max", scope: !21, file: !1, line: 74, type: !16)
!173 = !DIExpression(DW_OP_deref)
!174 = !DILocation(line: 74, column: 9, scope: !21)
!175 = !DILocation(line: 75, column: 5, scope: !21)
!176 = !DILocation(line: 76, column: 24, scope: !21)
!177 = !DILocation(line: 76, column: 5, scope: !21)
!178 = !DILocation(line: 78, column: 22, scope: !21)
!179 = !DILocation(line: 78, column: 17, scope: !21)
!180 = !DILocalVariable(name: "a", scope: !21, file: !1, line: 78, type: !10)
!181 = !DILocation(line: 78, column: 13, scope: !21)
!182 = !DILocation(line: 79, column: 22, scope: !21)
!183 = !DILocation(line: 79, column: 17, scope: !21)
!184 = !DILocalVariable(name: "b", scope: !21, file: !1, line: 79, type: !10)
!185 = !DILocation(line: 79, column: 13, scope: !21)
!186 = !DILocation(line: 81, column: 17, scope: !21)
!187 = !DILocalVariable(name: "c", scope: !21, file: !1, line: 81, type: !10)
!188 = !DILocation(line: 81, column: 13, scope: !21)
!189 = !DILocation(line: 83, column: 48, scope: !21)
!190 = !DILocation(line: 83, column: 5, scope: !21)
!191 = !DILocation(line: 85, column: 9, scope: !21)
!192 = !DILocation(line: 85, column: 12, scope: !21)
!193 = !DILocation(line: 85, column: 24, scope: !21)
!194 = !DILocation(line: 85, column: 47, scope: !21)
!195 = !DILocation(line: 85, column: 51, scope: !21)
!196 = !DILocation(line: 85, column: 28, scope: !21)
!197 = !DILocation(line: 85, column: 31, scope: !21)
!198 = !DILocation(line: 86, column: 9, scope: !21)
!199 = !DILocation(line: 86, column: 12, scope: !21)
!200 = !DILocation(line: 86, column: 24, scope: !21)
!201 = !DILocation(line: 86, column: 47, scope: !21)
!202 = !DILocation(line: 86, column: 51, scope: !21)
!203 = !DILocation(line: 86, column: 28, scope: !21)
!204 = !DILocation(line: 86, column: 31, scope: !21)
!205 = !DILocation(line: 87, column: 9, scope: !21)
!206 = !DILocation(line: 87, column: 12, scope: !21)
!207 = !DILocation(line: 87, column: 24, scope: !21)
!208 = !DILocation(line: 87, column: 47, scope: !21)
!209 = !DILocation(line: 87, column: 51, scope: !21)
!210 = !DILocation(line: 87, column: 28, scope: !21)
!211 = !DILocation(line: 87, column: 31, scope: !21)
!212 = !DILocation(line: 84, column: 5, scope: !21)
!213 = !DILocation(line: 88, column: 5, scope: !21)
