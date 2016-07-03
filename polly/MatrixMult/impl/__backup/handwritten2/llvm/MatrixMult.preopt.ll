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
  %mul = mul nsw i32 %height, %width, !dbg !35
  %conv = sext i32 %mul to i64, !dbg !36
  %mul1 = shl nsw i64 %conv, 3, !dbg !37
  %call = tail call noalias i8* @malloc(i64 %mul1) #5, !dbg !38
  %0 = bitcast i8* %call to i64*, !dbg !39
  tail call void @llvm.dbg.value(metadata i64* %0, i64 0, metadata !40, metadata !32), !dbg !41
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !42, metadata !32), !dbg !43
  %cmp8 = icmp sgt i32 %height, 0, !dbg !44
  br i1 %cmp8, label %for.cond3.preheader.lr.ph, label %for.cond11.preheader, !dbg !48

for.cond3.preheader.lr.ph:                        ; preds = %entry.split
  %1 = sext i32 %width to i64, !dbg !48
  br label %for.cond3.preheader, !dbg !48

for.cond3.preheader:                              ; preds = %for.cond3.preheader.lr.ph, %for.inc8
  %indvars.iv24 = phi i64 [ 0, %for.cond3.preheader.lr.ph ], [ %indvars.iv.next25, %for.inc8 ]
  %cmp46 = icmp sgt i32 %width, 0, !dbg !49
  br i1 %cmp46, label %for.body6.lr.ph, label %for.inc8, !dbg !54

for.body6.lr.ph:                                  ; preds = %for.cond3.preheader
  br label %for.body6, !dbg !54

for.cond.for.cond11.preheader_crit_edge:          ; preds = %for.inc8
  br label %for.cond11.preheader, !dbg !48

for.cond11.preheader:                             ; preds = %for.cond.for.cond11.preheader_crit_edge, %entry.split
  %cmp123 = icmp sgt i32 %height, 0, !dbg !55
  br i1 %cmp123, label %for.cond15.preheader.lr.ph, label %for.end34, !dbg !59

for.cond15.preheader.lr.ph:                       ; preds = %for.cond11.preheader
  %2 = sext i32 %width to i64, !dbg !59
  %3 = sext i32 %width to i64, !dbg !59
  br label %for.cond15.preheader, !dbg !59

for.body6:                                        ; preds = %for.body6.lr.ph, %for.body6
  %indvars.iv19 = phi i64 [ 0, %for.body6.lr.ph ], [ %indvars.iv.next20, %for.body6 ]
  %4 = mul nsw i64 %indvars.iv24, %1, !dbg !60
  %5 = add nsw i64 %indvars.iv19, %4, !dbg !62
  %arrayidx = getelementptr inbounds i64, i64* %0, i64 %5, !dbg !63
  store i64 0, i64* %arrayidx, align 8, !dbg !64
  %indvars.iv.next20 = add nuw nsw i64 %indvars.iv19, 1, !dbg !54
  tail call void @llvm.dbg.value(metadata !2, i64 0, metadata !65, metadata !32), !dbg !66
  %lftr.wideiv22 = trunc i64 %indvars.iv.next20 to i32, !dbg !54
  %exitcond23 = icmp ne i32 %lftr.wideiv22, %width, !dbg !54
  br i1 %exitcond23, label %for.body6, label %for.cond3.for.inc8_crit_edge, !dbg !54

for.cond3.for.inc8_crit_edge:                     ; preds = %for.body6
  br label %for.inc8, !dbg !54

for.inc8:                                         ; preds = %for.cond3.for.inc8_crit_edge, %for.cond3.preheader
  %indvars.iv.next25 = add nuw nsw i64 %indvars.iv24, 1, !dbg !48
  tail call void @llvm.dbg.value(metadata !2, i64 0, metadata !42, metadata !32), !dbg !43
  %lftr.wideiv27 = trunc i64 %indvars.iv.next25 to i32, !dbg !48
  %exitcond28 = icmp ne i32 %lftr.wideiv27, %height, !dbg !48
  br i1 %exitcond28, label %for.cond3.preheader, label %for.cond.for.cond11.preheader_crit_edge, !dbg !48

for.cond15.preheader:                             ; preds = %for.cond15.preheader.lr.ph, %for.inc32
  %indvars.iv13 = phi i64 [ 0, %for.cond15.preheader.lr.ph ], [ %indvars.iv.next14, %for.inc32 ]
  %cmp161 = icmp sgt i32 %width, 0, !dbg !67
  br i1 %cmp161, label %for.body18.lr.ph, label %for.inc32, !dbg !72

for.body18.lr.ph:                                 ; preds = %for.cond15.preheader
  br label %for.body18, !dbg !72

for.body18:                                       ; preds = %for.body18.lr.ph, %for.body18
  %indvars.iv = phi i64 [ 0, %for.body18.lr.ph ], [ %indvars.iv.next, %for.body18 ]
  %6 = mul nsw i64 %indvars.iv13, %3, !dbg !73
  %7 = add nsw i64 %indvars.iv, %6, !dbg !75
  %arrayidx22 = getelementptr inbounds i64, i64* %0, i64 %7, !dbg !76
  %8 = load i64, i64* %arrayidx22, align 8, !dbg !76
  %add24 = add nsw i64 %8, %indvars.iv13, !dbg !77
  %9 = mul nsw i64 %indvars.iv13, %2, !dbg !78
  %10 = add nsw i64 %indvars.iv, %9, !dbg !79
  %arrayidx28 = getelementptr inbounds i64, i64* %0, i64 %10, !dbg !80
  store i64 %add24, i64* %arrayidx28, align 8, !dbg !81
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1, !dbg !72
  tail call void @llvm.dbg.value(metadata !2, i64 0, metadata !65, metadata !32), !dbg !66
  %lftr.wideiv = trunc i64 %indvars.iv.next to i32, !dbg !72
  %exitcond = icmp ne i32 %lftr.wideiv, %width, !dbg !72
  br i1 %exitcond, label %for.body18, label %for.cond15.for.inc32_crit_edge, !dbg !72

for.cond15.for.inc32_crit_edge:                   ; preds = %for.body18
  br label %for.inc32, !dbg !72

for.inc32:                                        ; preds = %for.cond15.for.inc32_crit_edge, %for.cond15.preheader
  %indvars.iv.next14 = add nuw nsw i64 %indvars.iv13, 1, !dbg !59
  tail call void @llvm.dbg.value(metadata !2, i64 0, metadata !42, metadata !32), !dbg !43
  %lftr.wideiv17 = trunc i64 %indvars.iv.next14 to i32, !dbg !59
  %exitcond18 = icmp ne i32 %lftr.wideiv17, %height, !dbg !59
  br i1 %exitcond18, label %for.cond15.preheader, label %for.cond11.for.end34_crit_edge, !dbg !59

for.cond11.for.end34_crit_edge:                   ; preds = %for.inc32
  br label %for.end34, !dbg !59

for.end34:                                        ; preds = %for.cond11.for.end34_crit_edge, %for.cond11.preheader
  %call35 = tail call noalias i8* @malloc(i64 16) #5, !dbg !82
  %11 = bitcast i8* %call35 to %struct.Matrix*, !dbg !82
  tail call void @llvm.dbg.value(metadata %struct.Matrix* %11, i64 0, metadata !83, metadata !32), !dbg !84
  %12 = bitcast i8* %call35 to i8**, !dbg !85
  store i8* %call, i8** %12, align 8, !dbg !85
  %width37 = getelementptr inbounds i8, i8* %call35, i64 8, !dbg !86
  %13 = bitcast i8* %width37 to i32*, !dbg !86
  store i32 %width, i32* %13, align 8, !dbg !87
  %height38 = getelementptr inbounds i8, i8* %call35, i64 12, !dbg !88
  %14 = bitcast i8* %height38 to i32*, !dbg !88
  store i32 %height, i32* %14, align 4, !dbg !89
  ret %struct.Matrix* %11, !dbg !90
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare noalias i8* @malloc(i64) #2

; Function Attrs: noinline nounwind uwtable
define %struct.Matrix* @matmult(%struct.Matrix* %a, %struct.Matrix* %b) #0 !dbg !18 {
entry:
  br label %entry.split, !dbg !91

entry.split:                                      ; preds = %entry
  tail call void @llvm.dbg.value(metadata %struct.Matrix* %a, i64 0, metadata !92, metadata !32), !dbg !91
  tail call void @llvm.dbg.value(metadata %struct.Matrix* %b, i64 0, metadata !93, metadata !32), !dbg !94
  %width1 = getelementptr inbounds %struct.Matrix, %struct.Matrix* %b, i64 0, i32 1, !dbg !95
  %0 = load i32, i32* %width1, align 8, !dbg !95
  tail call void @llvm.dbg.value(metadata i32 %0, i64 0, metadata !96, metadata !32), !dbg !97
  %height2 = getelementptr inbounds %struct.Matrix, %struct.Matrix* %a, i64 0, i32 2, !dbg !98
  %1 = load i32, i32* %height2, align 4, !dbg !98
  tail call void @llvm.dbg.value(metadata i32 %1, i64 0, metadata !99, metadata !32), !dbg !100
  %data = getelementptr inbounds %struct.Matrix, %struct.Matrix* %a, i64 0, i32 0, !dbg !101
  %2 = load i64*, i64** %data, align 8, !dbg !101
  tail call void @llvm.dbg.value(metadata i64* %2, i64 0, metadata !102, metadata !32), !dbg !103
  %data3 = getelementptr inbounds %struct.Matrix, %struct.Matrix* %b, i64 0, i32 0, !dbg !104
  %3 = load i64*, i64** %data3, align 8, !dbg !104
  tail call void @llvm.dbg.value(metadata i64* %3, i64 0, metadata !105, metadata !32), !dbg !106
  %mul = mul nsw i32 %1, %0, !dbg !107
  %conv = sext i32 %mul to i64, !dbg !108
  %mul5 = shl nsw i64 %conv, 3, !dbg !109
  %call = tail call noalias i8* @malloc(i64 %mul5) #5, !dbg !110
  %4 = bitcast i8* %call to i64*, !dbg !111
  tail call void @llvm.dbg.value(metadata i64* %4, i64 0, metadata !112, metadata !32), !dbg !113
  %mul6 = mul nsw i32 %1, %0, !dbg !114
  %conv7 = sext i32 %mul6 to i64, !dbg !115
  %mul8 = shl nsw i64 %conv7, 3, !dbg !116
  %call9 = tail call noalias i8* @malloc(i64 %mul8) #5, !dbg !117
  %5 = bitcast i8* %call9 to i64*, !dbg !117
  tail call void @llvm.dbg.value(metadata i64* %5, i64 0, metadata !118, metadata !32), !dbg !119
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !120, metadata !32), !dbg !121
  %cmp11 = icmp sgt i32 %1, 0, !dbg !122
  br i1 %cmp11, label %for.cond11.preheader.lr.ph, label %for.cond23.preheader, !dbg !126

for.cond11.preheader.lr.ph:                       ; preds = %entry.split
  %6 = sext i32 %0 to i64, !dbg !126
  %7 = sext i32 %0 to i64, !dbg !126
  br label %for.cond11.preheader, !dbg !126

for.cond11.preheader:                             ; preds = %for.cond11.preheader.lr.ph, %for.inc20
  %indvars.iv39 = phi i64 [ 0, %for.cond11.preheader.lr.ph ], [ %indvars.iv.next40, %for.inc20 ]
  %cmp129 = icmp sgt i32 %0, 0, !dbg !127
  br i1 %cmp129, label %for.body14.lr.ph, label %for.inc20, !dbg !132

for.body14.lr.ph:                                 ; preds = %for.cond11.preheader
  br label %for.body14, !dbg !132

for.cond.for.cond23.preheader_crit_edge:          ; preds = %for.inc20
  br label %for.cond23.preheader, !dbg !126

for.cond23.preheader:                             ; preds = %for.cond.for.cond23.preheader_crit_edge, %entry.split
  %cmp246 = icmp sgt i32 %1, 0, !dbg !133
  br i1 %cmp246, label %for.cond27.preheader.lr.ph, label %for.end65, !dbg !137

for.cond27.preheader.lr.ph:                       ; preds = %for.cond23.preheader
  %8 = sext i32 %0 to i64, !dbg !137
  %9 = sext i32 %0 to i64, !dbg !137
  %10 = sext i32 %0 to i64, !dbg !137
  %11 = sext i32 %0 to i64, !dbg !137
  %12 = sext i32 %0 to i64, !dbg !137
  br label %for.cond27.preheader, !dbg !137

for.body14:                                       ; preds = %for.body14.lr.ph, %for.body14
  %indvars.iv32 = phi i64 [ 0, %for.body14.lr.ph ], [ %indvars.iv.next33, %for.body14 ]
  %13 = mul nsw i64 %indvars.iv32, %6, !dbg !138
  %14 = add nsw i64 %13, %indvars.iv39, !dbg !140
  %arrayidx = getelementptr inbounds i64, i64* %3, i64 %14, !dbg !141
  %15 = load i64, i64* %arrayidx, align 8, !dbg !141
  %16 = mul nsw i64 %indvars.iv39, %7, !dbg !142
  %17 = add nsw i64 %indvars.iv32, %16, !dbg !143
  %arrayidx19 = getelementptr inbounds i64, i64* %5, i64 %17, !dbg !144
  store i64 %15, i64* %arrayidx19, align 8, !dbg !145
  %indvars.iv.next33 = add nuw nsw i64 %indvars.iv32, 1, !dbg !132
  tail call void @llvm.dbg.value(metadata !2, i64 0, metadata !146, metadata !32), !dbg !147
  %lftr.wideiv37 = trunc i64 %indvars.iv.next33 to i32, !dbg !132
  %exitcond38 = icmp ne i32 %lftr.wideiv37, %0, !dbg !132
  br i1 %exitcond38, label %for.body14, label %for.cond11.for.inc20_crit_edge, !dbg !132

for.cond11.for.inc20_crit_edge:                   ; preds = %for.body14
  br label %for.inc20, !dbg !132

for.inc20:                                        ; preds = %for.cond11.for.inc20_crit_edge, %for.cond11.preheader
  %indvars.iv.next40 = add nuw nsw i64 %indvars.iv39, 1, !dbg !126
  tail call void @llvm.dbg.value(metadata !2, i64 0, metadata !120, metadata !32), !dbg !121
  %lftr.wideiv42 = trunc i64 %indvars.iv.next40 to i32, !dbg !126
  %exitcond43 = icmp ne i32 %lftr.wideiv42, %1, !dbg !126
  br i1 %exitcond43, label %for.cond11.preheader, label %for.cond.for.cond23.preheader_crit_edge, !dbg !126

for.cond27.preheader:                             ; preds = %for.cond27.preheader.lr.ph, %for.inc63
  %indvars.iv28 = phi i64 [ 0, %for.cond27.preheader.lr.ph ], [ %indvars.iv.next29, %for.inc63 ]
  %cmp283 = icmp sgt i32 %0, 0, !dbg !148
  br i1 %cmp283, label %for.body30.lr.ph, label %for.inc63, !dbg !153

for.body30.lr.ph:                                 ; preds = %for.cond27.preheader
  br label %for.body30, !dbg !153

for.body30:                                       ; preds = %for.body30.lr.ph, %for.inc60
  %indvars.iv16 = phi i64 [ 0, %for.body30.lr.ph ], [ %indvars.iv.next17, %for.inc60 ]
  %18 = mul nsw i64 %indvars.iv16, %12, !dbg !154
  %19 = add nsw i64 %18, %indvars.iv28, !dbg !156
  %arrayidx34 = getelementptr inbounds i64, i64* %4, i64 %19, !dbg !157
  store i64 0, i64* %arrayidx34, align 8, !dbg !158
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !159, metadata !32), !dbg !160
  %cmp361 = icmp sgt i32 %0, 0, !dbg !161
  br i1 %cmp361, label %for.body38.lr.ph, label %for.inc60, !dbg !165

for.body38.lr.ph:                                 ; preds = %for.body30
  br label %for.body38, !dbg !165

for.body38:                                       ; preds = %for.body38.lr.ph, %for.body38
  %indvars.iv = phi i64 [ 0, %for.body38.lr.ph ], [ %indvars.iv.next, %for.body38 ]
  %20 = mul nsw i64 %indvars.iv16, %11, !dbg !166
  %21 = add nsw i64 %20, %indvars.iv28, !dbg !168
  %arrayidx42 = getelementptr inbounds i64, i64* %4, i64 %21, !dbg !169
  %22 = load i64, i64* %arrayidx42, align 8, !dbg !169
  %23 = mul nsw i64 %indvars.iv16, %10, !dbg !170
  %24 = add nsw i64 %indvars.iv, %23, !dbg !171
  %arrayidx46 = getelementptr inbounds i64, i64* %2, i64 %24, !dbg !172
  %25 = load i64, i64* %arrayidx46, align 8, !dbg !172
  %26 = mul nsw i64 %indvars.iv16, %9, !dbg !173
  %27 = add nsw i64 %indvars.iv, %26, !dbg !174
  %arrayidx50 = getelementptr inbounds i64, i64* %5, i64 %27, !dbg !175
  %28 = load i64, i64* %arrayidx50, align 8, !dbg !175
  %mul51 = mul nsw i64 %28, %25, !dbg !176
  %add52 = add nsw i64 %mul51, %22, !dbg !177
  %29 = mul nsw i64 %indvars.iv16, %8, !dbg !178
  %30 = add nsw i64 %29, %indvars.iv28, !dbg !179
  %arrayidx56 = getelementptr inbounds i64, i64* %4, i64 %30, !dbg !180
  store i64 %add52, i64* %arrayidx56, align 8, !dbg !181
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1, !dbg !165
  tail call void @llvm.dbg.value(metadata !2, i64 0, metadata !159, metadata !32), !dbg !160
  %lftr.wideiv = trunc i64 %indvars.iv.next to i32, !dbg !165
  %exitcond = icmp ne i32 %lftr.wideiv, %0, !dbg !165
  br i1 %exitcond, label %for.body38, label %for.cond35.for.inc60_crit_edge, !dbg !165

for.cond35.for.inc60_crit_edge:                   ; preds = %for.body38
  br label %for.inc60, !dbg !165

for.inc60:                                        ; preds = %for.cond35.for.inc60_crit_edge, %for.body30
  %indvars.iv.next17 = add nuw nsw i64 %indvars.iv16, 1, !dbg !153
  tail call void @llvm.dbg.value(metadata !2, i64 0, metadata !146, metadata !32), !dbg !147
  %lftr.wideiv26 = trunc i64 %indvars.iv.next17 to i32, !dbg !153
  %exitcond27 = icmp ne i32 %lftr.wideiv26, %0, !dbg !153
  br i1 %exitcond27, label %for.body30, label %for.cond27.for.inc63_crit_edge, !dbg !153

for.cond27.for.inc63_crit_edge:                   ; preds = %for.inc60
  br label %for.inc63, !dbg !153

for.inc63:                                        ; preds = %for.cond27.for.inc63_crit_edge, %for.cond27.preheader
  %indvars.iv.next29 = add nuw nsw i64 %indvars.iv28, 1, !dbg !137
  tail call void @llvm.dbg.value(metadata !2, i64 0, metadata !120, metadata !32), !dbg !121
  %lftr.wideiv30 = trunc i64 %indvars.iv.next29 to i32, !dbg !137
  %exitcond31 = icmp ne i32 %lftr.wideiv30, %1, !dbg !137
  br i1 %exitcond31, label %for.cond27.preheader, label %for.cond23.for.end65_crit_edge, !dbg !137

for.cond23.for.end65_crit_edge:                   ; preds = %for.inc63
  br label %for.end65, !dbg !137

for.end65:                                        ; preds = %for.cond23.for.end65_crit_edge, %for.cond23.preheader
  %call66 = tail call noalias i8* @malloc(i64 16) #5, !dbg !182
  %31 = bitcast i8* %call66 to %struct.Matrix*, !dbg !182
  tail call void @llvm.dbg.value(metadata %struct.Matrix* %31, i64 0, metadata !183, metadata !32), !dbg !184
  %width67 = getelementptr inbounds i8, i8* %call66, i64 8, !dbg !185
  %32 = bitcast i8* %width67 to i32*, !dbg !185
  store i32 %0, i32* %32, align 8, !dbg !186
  %height68 = getelementptr inbounds i8, i8* %call66, i64 12, !dbg !187
  %33 = bitcast i8* %height68 to i32*, !dbg !187
  store i32 %1, i32* %33, align 4, !dbg !188
  %34 = bitcast i8* %call66 to i8**, !dbg !189
  store i8* %call, i8** %34, align 8, !dbg !189
  ret %struct.Matrix* %31, !dbg !190
}

; Function Attrs: nounwind uwtable
define i32 @main(i32 %argc, i8** %args) #3 !dbg !21 {
entry:
  %max = alloca i32, align 4
  br label %entry.split, !dbg !191

entry.split:                                      ; preds = %entry
  tail call void @llvm.dbg.value(metadata i32 %argc, i64 0, metadata !192, metadata !32), !dbg !191
  tail call void @llvm.dbg.value(metadata i8** %args, i64 0, metadata !193, metadata !32), !dbg !194
  %arrayidx = getelementptr inbounds i8*, i8** %args, i64 1, !dbg !195
  %0 = load i8*, i8** %arrayidx, align 8, !dbg !195
  tail call void @llvm.dbg.value(metadata i32* %max, i64 0, metadata !196, metadata !197), !dbg !198
  %call = call i32 (i8*, i8*, ...) @__isoc99_sscanf(i8* %0, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str, i64 0, i64 0), i32* nonnull %max) #5, !dbg !199
  %1 = load i32, i32* %max, align 4, !dbg !200
  call void @llvm.dbg.value(metadata i32 %1, i64 0, metadata !196, metadata !32), !dbg !198
  %call1 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.1, i64 0, i64 0), i32 %1) #5, !dbg !201
  %2 = load i32, i32* %max, align 4, !dbg !202
  call void @llvm.dbg.value(metadata i32 %2, i64 0, metadata !196, metadata !32), !dbg !198
  call void @llvm.dbg.value(metadata i32 %2, i64 0, metadata !196, metadata !32), !dbg !198
  %call2 = call %struct.Matrix* @init(i32 %2, i32 %2), !dbg !203
  call void @llvm.dbg.value(metadata %struct.Matrix* %call2, i64 0, metadata !204, metadata !32), !dbg !205
  %3 = load i32, i32* %max, align 4, !dbg !206
  call void @llvm.dbg.value(metadata i32 %3, i64 0, metadata !196, metadata !32), !dbg !198
  call void @llvm.dbg.value(metadata i32 %3, i64 0, metadata !196, metadata !32), !dbg !198
  %call3 = call %struct.Matrix* @init(i32 %3, i32 %3), !dbg !207
  call void @llvm.dbg.value(metadata %struct.Matrix* %call3, i64 0, metadata !208, metadata !32), !dbg !209
  %call4 = call %struct.Matrix* @matmult(%struct.Matrix* %call2, %struct.Matrix* %call3), !dbg !210
  call void @llvm.dbg.value(metadata %struct.Matrix* %call4, i64 0, metadata !211, metadata !32), !dbg !212
  %4 = load i32, i32* %max, align 4, !dbg !213
  call void @llvm.dbg.value(metadata i32 %4, i64 0, metadata !196, metadata !32), !dbg !198
  call void @llvm.dbg.value(metadata i32 %4, i64 0, metadata !196, metadata !32), !dbg !198
  %call5 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str.2, i64 0, i64 0), i32 %4, i32 %4) #5, !dbg !214
  %5 = load i32, i32* %max, align 4, !dbg !215
  call void @llvm.dbg.value(metadata i32 %5, i64 0, metadata !196, metadata !32), !dbg !198
  %sub = add nsw i32 %5, -1, !dbg !216
  call void @llvm.dbg.value(metadata i32 %5, i64 0, metadata !196, metadata !32), !dbg !198
  call void @llvm.dbg.value(metadata i32 %5, i64 0, metadata !196, metadata !32), !dbg !198
  %sub6 = add nsw i32 %5, -1, !dbg !217
  call void @llvm.dbg.value(metadata i32 %5, i64 0, metadata !196, metadata !32), !dbg !198
  call void @llvm.dbg.value(metadata i32 %5, i64 0, metadata !196, metadata !32), !dbg !198
  call void @llvm.dbg.value(metadata i32 %5, i64 0, metadata !196, metadata !32), !dbg !198
  %add = mul i32 %5, %5, !dbg !218
  %sub8 = add nsw i32 %add, -1, !dbg !219
  %idxprom = sext i32 %sub8 to i64, !dbg !220
  %data = getelementptr inbounds %struct.Matrix, %struct.Matrix* %call2, i64 0, i32 0, !dbg !221
  %6 = load i64*, i64** %data, align 8, !dbg !221
  %arrayidx9 = getelementptr inbounds i64, i64* %6, i64 %idxprom, !dbg !220
  %7 = load i64, i64* %arrayidx9, align 8, !dbg !220
  %8 = load i32, i32* %max, align 4, !dbg !222
  call void @llvm.dbg.value(metadata i32 %8, i64 0, metadata !196, metadata !32), !dbg !198
  %sub10 = add nsw i32 %8, -1, !dbg !223
  call void @llvm.dbg.value(metadata i32 %8, i64 0, metadata !196, metadata !32), !dbg !198
  call void @llvm.dbg.value(metadata i32 %8, i64 0, metadata !196, metadata !32), !dbg !198
  %sub11 = add nsw i32 %8, -1, !dbg !224
  call void @llvm.dbg.value(metadata i32 %8, i64 0, metadata !196, metadata !32), !dbg !198
  call void @llvm.dbg.value(metadata i32 %8, i64 0, metadata !196, metadata !32), !dbg !198
  call void @llvm.dbg.value(metadata i32 %8, i64 0, metadata !196, metadata !32), !dbg !198
  %add14 = mul i32 %8, %8, !dbg !225
  %sub15 = add nsw i32 %add14, -1, !dbg !226
  %idxprom16 = sext i32 %sub15 to i64, !dbg !227
  %data17 = getelementptr inbounds %struct.Matrix, %struct.Matrix* %call3, i64 0, i32 0, !dbg !228
  %9 = load i64*, i64** %data17, align 8, !dbg !228
  %arrayidx18 = getelementptr inbounds i64, i64* %9, i64 %idxprom16, !dbg !227
  %10 = load i64, i64* %arrayidx18, align 8, !dbg !227
  %11 = load i32, i32* %max, align 4, !dbg !229
  call void @llvm.dbg.value(metadata i32 %11, i64 0, metadata !196, metadata !32), !dbg !198
  %sub19 = add nsw i32 %11, -1, !dbg !230
  call void @llvm.dbg.value(metadata i32 %11, i64 0, metadata !196, metadata !32), !dbg !198
  call void @llvm.dbg.value(metadata i32 %11, i64 0, metadata !196, metadata !32), !dbg !198
  %sub20 = add nsw i32 %11, -1, !dbg !231
  call void @llvm.dbg.value(metadata i32 %11, i64 0, metadata !196, metadata !32), !dbg !198
  call void @llvm.dbg.value(metadata i32 %11, i64 0, metadata !196, metadata !32), !dbg !198
  call void @llvm.dbg.value(metadata i32 %11, i64 0, metadata !196, metadata !32), !dbg !198
  %add23 = mul i32 %11, %11, !dbg !232
  %sub24 = add nsw i32 %add23, -1, !dbg !233
  %idxprom25 = sext i32 %sub24 to i64, !dbg !234
  %data26 = getelementptr inbounds %struct.Matrix, %struct.Matrix* %call4, i64 0, i32 0, !dbg !235
  %12 = load i64*, i64** %data26, align 8, !dbg !235
  %arrayidx27 = getelementptr inbounds i64, i64* %12, i64 %idxprom25, !dbg !234
  %13 = load i64, i64* %arrayidx27, align 8, !dbg !234
  %call28 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([59 x i8], [59 x i8]* @.str.3, i64 0, i64 0), i32 %sub, i32 %5, i32 %sub6, i64 %7, i32 %sub10, i32 %8, i32 %sub11, i64 %10, i32 %sub19, i32 %11, i32 %sub20, i64 %13) #5, !dbg !236
  ret i32 0, !dbg !237
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
!1 = !DIFile(filename: "MatrixMult.c", directory: "/home/sam/workspace/WhileyOpenCL/polly/MatrixMult/impl/handwritten2")
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
!18 = distinct !DISubprogram(name: "matmult", scope: !1, file: !1, line: 38, type: !19, isLocal: false, isDefinition: true, scopeLine: 38, flags: DIFlagPrototyped, isOptimized: false, variables: !2)
!19 = !DISubroutineType(types: !20)
!20 = !{!10, !10, !10}
!21 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 73, type: !22, isLocal: false, isDefinition: true, scopeLine: 73, flags: DIFlagPrototyped, isOptimized: false, variables: !2)
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
!35 = !DILocation(line: 16, column: 48, scope: !7)
!36 = !DILocation(line: 16, column: 42, scope: !7)
!37 = !DILocation(line: 16, column: 54, scope: !7)
!38 = !DILocation(line: 16, column: 35, scope: !7)
!39 = !DILocation(line: 16, column: 23, scope: !7)
!40 = !DILocalVariable(name: "data", scope: !7, file: !1, line: 16, type: !4)
!41 = !DILocation(line: 16, column: 16, scope: !7)
!42 = !DILocalVariable(name: "i", scope: !7, file: !1, line: 14, type: !16)
!43 = !DILocation(line: 14, column: 9, scope: !7)
!44 = !DILocation(line: 18, column: 16, scope: !45)
!45 = !DILexicalBlockFile(scope: !46, file: !1, discriminator: 1)
!46 = distinct !DILexicalBlock(scope: !47, file: !1, line: 18, column: 5)
!47 = distinct !DILexicalBlock(scope: !7, file: !1, line: 18, column: 5)
!48 = !DILocation(line: 18, column: 5, scope: !45)
!49 = !DILocation(line: 19, column: 20, scope: !50)
!50 = !DILexicalBlockFile(scope: !51, file: !1, discriminator: 1)
!51 = distinct !DILexicalBlock(scope: !52, file: !1, line: 19, column: 9)
!52 = distinct !DILexicalBlock(scope: !53, file: !1, line: 19, column: 9)
!53 = distinct !DILexicalBlock(scope: !46, file: !1, line: 18, column: 30)
!54 = !DILocation(line: 19, column: 9, scope: !50)
!55 = !DILocation(line: 24, column: 16, scope: !56)
!56 = !DILexicalBlockFile(scope: !57, file: !1, discriminator: 1)
!57 = distinct !DILexicalBlock(scope: !58, file: !1, line: 24, column: 5)
!58 = distinct !DILexicalBlock(scope: !7, file: !1, line: 24, column: 5)
!59 = !DILocation(line: 24, column: 5, scope: !56)
!60 = !DILocation(line: 20, column: 19, scope: !61)
!61 = distinct !DILexicalBlock(scope: !51, file: !1, line: 19, column: 33)
!62 = !DILocation(line: 20, column: 25, scope: !61)
!63 = !DILocation(line: 20, column: 13, scope: !61)
!64 = !DILocation(line: 20, column: 29, scope: !61)
!65 = !DILocalVariable(name: "j", scope: !7, file: !1, line: 14, type: !16)
!66 = !DILocation(line: 14, column: 12, scope: !7)
!67 = !DILocation(line: 25, column: 20, scope: !68)
!68 = !DILexicalBlockFile(scope: !69, file: !1, discriminator: 1)
!69 = distinct !DILexicalBlock(scope: !70, file: !1, line: 25, column: 9)
!70 = distinct !DILexicalBlock(scope: !71, file: !1, line: 25, column: 9)
!71 = distinct !DILexicalBlock(scope: !57, file: !1, line: 24, column: 30)
!72 = !DILocation(line: 25, column: 9, scope: !68)
!73 = !DILocation(line: 26, column: 37, scope: !74)
!74 = distinct !DILexicalBlock(scope: !69, file: !1, line: 25, column: 33)
!75 = !DILocation(line: 26, column: 43, scope: !74)
!76 = !DILocation(line: 26, column: 31, scope: !74)
!77 = !DILocation(line: 26, column: 47, scope: !74)
!78 = !DILocation(line: 26, column: 19, scope: !74)
!79 = !DILocation(line: 26, column: 25, scope: !74)
!80 = !DILocation(line: 26, column: 13, scope: !74)
!81 = !DILocation(line: 26, column: 29, scope: !74)
!82 = !DILocation(line: 30, column: 17, scope: !7)
!83 = !DILocalVariable(name: "m", scope: !7, file: !1, line: 30, type: !10)
!84 = !DILocation(line: 30, column: 13, scope: !7)
!85 = !DILocation(line: 31, column: 13, scope: !7)
!86 = !DILocation(line: 32, column: 8, scope: !7)
!87 = !DILocation(line: 32, column: 14, scope: !7)
!88 = !DILocation(line: 33, column: 8, scope: !7)
!89 = !DILocation(line: 33, column: 15, scope: !7)
!90 = !DILocation(line: 35, column: 5, scope: !7)
!91 = !DILocation(line: 38, column: 25, scope: !18)
!92 = !DILocalVariable(name: "a", arg: 1, scope: !18, file: !1, line: 38, type: !10)
!93 = !DILocalVariable(name: "b", arg: 2, scope: !18, file: !1, line: 38, type: !10)
!94 = !DILocation(line: 38, column: 36, scope: !18)
!95 = !DILocation(line: 40, column: 20, scope: !18)
!96 = !DILocalVariable(name: "width", scope: !18, file: !1, line: 40, type: !16)
!97 = !DILocation(line: 40, column: 9, scope: !18)
!98 = !DILocation(line: 41, column: 21, scope: !18)
!99 = !DILocalVariable(name: "height", scope: !18, file: !1, line: 41, type: !16)
!100 = !DILocation(line: 41, column: 9, scope: !18)
!101 = !DILocation(line: 42, column: 28, scope: !18)
!102 = !DILocalVariable(name: "a_data", scope: !18, file: !1, line: 42, type: !4)
!103 = !DILocation(line: 42, column: 16, scope: !18)
!104 = !DILocation(line: 43, column: 28, scope: !18)
!105 = !DILocalVariable(name: "b_data", scope: !18, file: !1, line: 43, type: !4)
!106 = !DILocation(line: 43, column: 16, scope: !18)
!107 = !DILocation(line: 46, column: 45, scope: !18)
!108 = !DILocation(line: 46, column: 39, scope: !18)
!109 = !DILocation(line: 46, column: 51, scope: !18)
!110 = !DILocation(line: 46, column: 32, scope: !18)
!111 = !DILocation(line: 46, column: 20, scope: !18)
!112 = !DILocalVariable(name: "data", scope: !18, file: !1, line: 46, type: !4)
!113 = !DILocation(line: 46, column: 13, scope: !18)
!114 = !DILocation(line: 47, column: 34, scope: !18)
!115 = !DILocation(line: 47, column: 29, scope: !18)
!116 = !DILocation(line: 47, column: 41, scope: !18)
!117 = !DILocation(line: 47, column: 22, scope: !18)
!118 = !DILocalVariable(name: "b_t", scope: !18, file: !1, line: 47, type: !4)
!119 = !DILocation(line: 47, column: 16, scope: !18)
!120 = !DILocalVariable(name: "j", scope: !18, file: !1, line: 39, type: !16)
!121 = !DILocation(line: 39, column: 9, scope: !18)
!122 = !DILocation(line: 49, column: 16, scope: !123)
!123 = !DILexicalBlockFile(scope: !124, file: !1, discriminator: 1)
!124 = distinct !DILexicalBlock(scope: !125, file: !1, line: 49, column: 2)
!125 = distinct !DILexicalBlock(scope: !18, file: !1, line: 49, column: 2)
!126 = !DILocation(line: 49, column: 2, scope: !123)
!127 = !DILocation(line: 51, column: 17, scope: !128)
!128 = !DILexicalBlockFile(scope: !129, file: !1, discriminator: 1)
!129 = distinct !DILexicalBlock(scope: !130, file: !1, line: 51, column: 3)
!130 = distinct !DILexicalBlock(scope: !131, file: !1, line: 51, column: 3)
!131 = distinct !DILexicalBlock(scope: !124, file: !1, line: 49, column: 31)
!132 = !DILocation(line: 51, column: 3, scope: !128)
!133 = !DILocation(line: 55, column: 16, scope: !134)
!134 = !DILexicalBlockFile(scope: !135, file: !1, discriminator: 1)
!135 = distinct !DILexicalBlock(scope: !136, file: !1, line: 55, column: 2)
!136 = distinct !DILexicalBlock(scope: !18, file: !1, line: 55, column: 2)
!137 = !DILocation(line: 55, column: 2, scope: !134)
!138 = !DILocation(line: 52, column: 29, scope: !139)
!139 = distinct !DILexicalBlock(scope: !129, file: !1, line: 51, column: 31)
!140 = !DILocation(line: 52, column: 35, scope: !139)
!141 = !DILocation(line: 52, column: 21, scope: !139)
!142 = !DILocation(line: 52, column: 9, scope: !139)
!143 = !DILocation(line: 52, column: 15, scope: !139)
!144 = !DILocation(line: 52, column: 4, scope: !139)
!145 = !DILocation(line: 52, column: 19, scope: !139)
!146 = !DILocalVariable(name: "i", scope: !18, file: !1, line: 39, type: !16)
!147 = !DILocation(line: 39, column: 6, scope: !18)
!148 = !DILocation(line: 57, column: 17, scope: !149)
!149 = !DILexicalBlockFile(scope: !150, file: !1, discriminator: 1)
!150 = distinct !DILexicalBlock(scope: !151, file: !1, line: 57, column: 3)
!151 = distinct !DILexicalBlock(scope: !152, file: !1, line: 57, column: 3)
!152 = distinct !DILexicalBlock(scope: !135, file: !1, line: 55, column: 31)
!153 = !DILocation(line: 57, column: 3, scope: !149)
!154 = !DILocation(line: 58, column: 10, scope: !155)
!155 = distinct !DILexicalBlock(scope: !150, file: !1, line: 57, column: 31)
!156 = !DILocation(line: 58, column: 16, scope: !155)
!157 = !DILocation(line: 58, column: 4, scope: !155)
!158 = !DILocation(line: 58, column: 20, scope: !155)
!159 = !DILocalVariable(name: "k", scope: !18, file: !1, line: 39, type: !16)
!160 = !DILocation(line: 39, column: 12, scope: !18)
!161 = !DILocation(line: 59, column: 13, scope: !162)
!162 = !DILexicalBlockFile(scope: !163, file: !1, discriminator: 1)
!163 = distinct !DILexicalBlock(scope: !164, file: !1, line: 59, column: 4)
!164 = distinct !DILexicalBlock(scope: !155, file: !1, line: 59, column: 4)
!165 = !DILocation(line: 59, column: 4, scope: !162)
!166 = !DILocation(line: 60, column: 29, scope: !167)
!167 = distinct !DILexicalBlock(scope: !163, file: !1, line: 59, column: 24)
!168 = !DILocation(line: 60, column: 35, scope: !167)
!169 = !DILocation(line: 60, column: 23, scope: !167)
!170 = !DILocation(line: 60, column: 49, scope: !167)
!171 = !DILocation(line: 60, column: 55, scope: !167)
!172 = !DILocation(line: 60, column: 41, scope: !167)
!173 = !DILocation(line: 60, column: 64, scope: !167)
!174 = !DILocation(line: 60, column: 70, scope: !167)
!175 = !DILocation(line: 60, column: 59, scope: !167)
!176 = !DILocation(line: 60, column: 58, scope: !167)
!177 = !DILocation(line: 60, column: 39, scope: !167)
!178 = !DILocation(line: 60, column: 11, scope: !167)
!179 = !DILocation(line: 60, column: 17, scope: !167)
!180 = !DILocation(line: 60, column: 5, scope: !167)
!181 = !DILocation(line: 60, column: 21, scope: !167)
!182 = !DILocation(line: 66, column: 17, scope: !18)
!183 = !DILocalVariable(name: "m", scope: !18, file: !1, line: 66, type: !10)
!184 = !DILocation(line: 66, column: 13, scope: !18)
!185 = !DILocation(line: 67, column: 8, scope: !18)
!186 = !DILocation(line: 67, column: 14, scope: !18)
!187 = !DILocation(line: 68, column: 8, scope: !18)
!188 = !DILocation(line: 68, column: 15, scope: !18)
!189 = !DILocation(line: 69, column: 13, scope: !18)
!190 = !DILocation(line: 70, column: 5, scope: !18)
!191 = !DILocation(line: 73, column: 14, scope: !21)
!192 = !DILocalVariable(name: "argc", arg: 1, scope: !21, file: !1, line: 73, type: !16)
!193 = !DILocalVariable(name: "args", arg: 2, scope: !21, file: !1, line: 73, type: !24)
!194 = !DILocation(line: 73, column: 27, scope: !21)
!195 = !DILocation(line: 76, column: 12, scope: !21)
!196 = !DILocalVariable(name: "max", scope: !21, file: !1, line: 75, type: !16)
!197 = !DIExpression(DW_OP_deref)
!198 = !DILocation(line: 75, column: 9, scope: !21)
!199 = !DILocation(line: 76, column: 5, scope: !21)
!200 = !DILocation(line: 77, column: 24, scope: !21)
!201 = !DILocation(line: 77, column: 5, scope: !21)
!202 = !DILocation(line: 79, column: 22, scope: !21)
!203 = !DILocation(line: 79, column: 17, scope: !21)
!204 = !DILocalVariable(name: "a", scope: !21, file: !1, line: 79, type: !10)
!205 = !DILocation(line: 79, column: 13, scope: !21)
!206 = !DILocation(line: 80, column: 22, scope: !21)
!207 = !DILocation(line: 80, column: 17, scope: !21)
!208 = !DILocalVariable(name: "b", scope: !21, file: !1, line: 80, type: !10)
!209 = !DILocation(line: 80, column: 13, scope: !21)
!210 = !DILocation(line: 82, column: 17, scope: !21)
!211 = !DILocalVariable(name: "c", scope: !21, file: !1, line: 82, type: !10)
!212 = !DILocation(line: 82, column: 13, scope: !21)
!213 = !DILocation(line: 87, column: 48, scope: !21)
!214 = !DILocation(line: 87, column: 5, scope: !21)
!215 = !DILocation(line: 89, column: 9, scope: !21)
!216 = !DILocation(line: 89, column: 12, scope: !21)
!217 = !DILocation(line: 89, column: 24, scope: !21)
!218 = !DILocation(line: 89, column: 47, scope: !21)
!219 = !DILocation(line: 89, column: 51, scope: !21)
!220 = !DILocation(line: 89, column: 28, scope: !21)
!221 = !DILocation(line: 89, column: 31, scope: !21)
!222 = !DILocation(line: 90, column: 9, scope: !21)
!223 = !DILocation(line: 90, column: 12, scope: !21)
!224 = !DILocation(line: 90, column: 24, scope: !21)
!225 = !DILocation(line: 90, column: 47, scope: !21)
!226 = !DILocation(line: 90, column: 51, scope: !21)
!227 = !DILocation(line: 90, column: 28, scope: !21)
!228 = !DILocation(line: 90, column: 31, scope: !21)
!229 = !DILocation(line: 91, column: 9, scope: !21)
!230 = !DILocation(line: 91, column: 12, scope: !21)
!231 = !DILocation(line: 91, column: 24, scope: !21)
!232 = !DILocation(line: 91, column: 47, scope: !21)
!233 = !DILocation(line: 91, column: 51, scope: !21)
!234 = !DILocation(line: 91, column: 28, scope: !21)
!235 = !DILocation(line: 91, column: 31, scope: !21)
!236 = !DILocation(line: 88, column: 5, scope: !21)
!237 = !DILocation(line: 93, column: 5, scope: !21)
