; ModuleID = 'NQueens_original.c'
source_filename = "NQueens_original.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }
%struct.POS = type { i64, i64 }
%struct.NQueen = type { %struct.POS**, i64, i64 }

@.str.1 = private unnamed_addr constant [4 x i8] c" r:\00", align 1
@.str.2 = private unnamed_addr constant [5 x i8] c"%lld\00", align 1
@.str.3 = private unnamed_addr constant [4 x i8] c" c:\00", align 1
@.str.5 = private unnamed_addr constant [9 x i8] c" queens:\00", align 1
@.str.6 = private unnamed_addr constant [16 x i8] c" num_solutions:\00", align 1
@stderr = external local_unnamed_addr global %struct._IO_FILE*, align 8
@.str.7 = private unnamed_addr constant [5 x i8] c"fail\00", align 1
@.str.8 = private unnamed_addr constant [6 x i8] c"%lld\0A\00", align 1

; Function Attrs: nounwind uwtable
define noalias %struct.POS* @copy_POS(%struct.POS* nocapture readonly %_POS) local_unnamed_addr #0 !dbg !8 {
entry:
  tail call void @llvm.dbg.value(metadata %struct.POS* %_POS, i64 0, metadata !20, metadata !22), !dbg !23
  %call = tail call noalias i8* @malloc(i64 16) #7, !dbg !24
  %0 = bitcast i8* %call to %struct.POS*, !dbg !26
  tail call void @llvm.dbg.value(metadata %struct.POS* %0, i64 0, metadata !21, metadata !22), !dbg !27
  %1 = bitcast %struct.POS* %_POS to <2 x i64>*, !dbg !28
  %2 = load <2 x i64>, <2 x i64>* %1, align 8, !dbg !28, !tbaa !29
  %3 = bitcast i8* %call to <2 x i64>*, !dbg !33
  store <2 x i64> %2, <2 x i64>* %3, align 8, !dbg !33, !tbaa !29
  ret %struct.POS* %0, !dbg !34
}

; Function Attrs: nounwind
declare noalias i8* @malloc(i64) local_unnamed_addr #1

; Function Attrs: nounwind uwtable
define noalias %struct.POS** @copy_array_POS(%struct.POS** nocapture readonly %_POS, i64 %_POS_size) local_unnamed_addr #0 !dbg !35 {
entry:
  tail call void @llvm.dbg.value(metadata %struct.POS** %_POS, i64 0, metadata !40, metadata !22), !dbg !46
  tail call void @llvm.dbg.value(metadata i64 %_POS_size, i64 0, metadata !41, metadata !22), !dbg !47
  %mul = shl i64 %_POS_size, 3, !dbg !48
  %call = tail call noalias i8* @malloc(i64 %mul) #7, !dbg !49
  %0 = bitcast i8* %call to %struct.POS**, !dbg !51
  tail call void @llvm.dbg.value(metadata %struct.POS** %0, i64 0, metadata !42, metadata !22), !dbg !52
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !43, metadata !22), !dbg !53
  %cmp12 = icmp sgt i64 %_POS_size, 0, !dbg !54
  br i1 %cmp12, label %for.body.preheader, label %for.cond.cleanup, !dbg !57

for.body.preheader:                               ; preds = %entry
  br label %for.body, !dbg !58

for.cond.cleanup.loopexit:                        ; preds = %for.body
  br label %for.cond.cleanup, !dbg !60

for.cond.cleanup:                                 ; preds = %for.cond.cleanup.loopexit, %entry
  ret %struct.POS** %0, !dbg !60

for.body:                                         ; preds = %for.body.preheader, %for.body
  %indvars.iv = phi i64 [ %indvars.iv.next, %for.body ], [ 0, %for.body.preheader ]
  %arrayidx = getelementptr inbounds %struct.POS*, %struct.POS** %_POS, i64 %indvars.iv, !dbg !58
  %1 = bitcast %struct.POS** %arrayidx to <2 x i64>**, !dbg !58
  %2 = load <2 x i64>*, <2 x i64>** %1, align 8, !dbg !58, !tbaa !61
  %call.i = tail call noalias i8* @malloc(i64 16) #7, !dbg !63
  %3 = load <2 x i64>, <2 x i64>* %2, align 8, !dbg !65, !tbaa !29
  %4 = bitcast i8* %call.i to <2 x i64>*, !dbg !66
  store <2 x i64> %3, <2 x i64>* %4, align 8, !dbg !66, !tbaa !29
  %arrayidx4 = getelementptr inbounds %struct.POS*, %struct.POS** %0, i64 %indvars.iv, !dbg !67
  %5 = bitcast %struct.POS** %arrayidx4 to i8**, !dbg !68
  store i8* %call.i, i8** %5, align 8, !dbg !68, !tbaa !61
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1, !dbg !57
  %exitcond = icmp eq i64 %indvars.iv.next, %_POS_size, !dbg !57
  br i1 %exitcond, label %for.cond.cleanup.loopexit, label %for.body, !dbg !57, !llvm.loop !69
}

; Function Attrs: nounwind uwtable
define void @free_POS(%struct.POS* nocapture %pos) local_unnamed_addr #0 !dbg !71 {
entry:
  tail call void @llvm.dbg.value(metadata %struct.POS* %pos, i64 0, metadata !75, metadata !22), !dbg !76
  %0 = bitcast %struct.POS* %pos to i8*, !dbg !77
  tail call void @free(i8* %0) #7, !dbg !78
  ret void, !dbg !79
}

; Function Attrs: nounwind
declare void @free(i8* nocapture) local_unnamed_addr #1

; Function Attrs: nounwind uwtable
define void @printf_POS(%struct.POS* nocapture readonly %pos) local_unnamed_addr #0 !dbg !80 {
entry:
  tail call void @llvm.dbg.value(metadata %struct.POS* %pos, i64 0, metadata !82, metadata !22), !dbg !83
  %putchar = tail call i32 @putchar(i32 123) #7, !dbg !84
  %call1 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.1, i64 0, i64 0)), !dbg !85
  %r = getelementptr inbounds %struct.POS, %struct.POS* %pos, i64 0, i32 0, !dbg !86
  %0 = load i64, i64* %r, align 8, !dbg !86, !tbaa !87
  %call2 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.2, i64 0, i64 0), i64 %0), !dbg !89
  %call3 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.3, i64 0, i64 0)), !dbg !90
  %c = getelementptr inbounds %struct.POS, %struct.POS* %pos, i64 0, i32 1, !dbg !91
  %1 = load i64, i64* %c, align 8, !dbg !91, !tbaa !92
  %call4 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.2, i64 0, i64 0), i64 %1), !dbg !93
  %putchar7 = tail call i32 @putchar(i32 125) #7, !dbg !94
  ret void, !dbg !95
}

; Function Attrs: nounwind
declare i32 @printf(i8* nocapture readonly, ...) local_unnamed_addr #1

; Function Attrs: nounwind uwtable
define noalias %struct.NQueen* @copy_NQueen(%struct.NQueen* nocapture readonly %_NQueen) local_unnamed_addr #0 !dbg !96 {
entry:
  tail call void @llvm.dbg.value(metadata %struct.NQueen* %_NQueen, i64 0, metadata !107, metadata !22), !dbg !112
  %call = tail call noalias i8* @malloc(i64 24) #7, !dbg !113
  %0 = bitcast i8* %call to %struct.NQueen*, !dbg !115
  tail call void @llvm.dbg.value(metadata %struct.NQueen* %0, i64 0, metadata !108, metadata !22), !dbg !116
  %queens_size = getelementptr inbounds %struct.NQueen, %struct.NQueen* %_NQueen, i64 0, i32 1, !dbg !117
  %1 = load i64, i64* %queens_size, align 8, !dbg !117, !tbaa !118
  %mul = shl i64 %1, 3, !dbg !117
  %call1 = tail call noalias i8* @malloc(i64 %mul) #7, !dbg !117
  %2 = bitcast i8* %call to i8**, !dbg !117
  store i8* %call1, i8** %2, align 8, !dbg !117, !tbaa !120
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !109, metadata !22), !dbg !121
  %cmp25 = icmp sgt i64 %1, 0, !dbg !122
  %3 = bitcast i8* %call1 to %struct.POS**, !dbg !122
  br i1 %cmp25, label %for.body.preheader, label %for.cond.cleanup, !dbg !122

for.body.preheader:                               ; preds = %entry
  %queens4 = getelementptr inbounds %struct.NQueen, %struct.NQueen* %_NQueen, i64 0, i32 0, !dbg !125
  br label %for.body, !dbg !125

for.cond.cleanup.loopexit:                        ; preds = %for.body
  br label %for.cond.cleanup, !dbg !128

for.cond.cleanup:                                 ; preds = %for.cond.cleanup.loopexit, %entry
  %queens_size10 = getelementptr inbounds i8, i8* %call, i64 8, !dbg !128
  %4 = bitcast i8* %queens_size10 to i64*, !dbg !128
  store i64 %1, i64* %4, align 8, !dbg !128, !tbaa !118
  %num_solutions = getelementptr inbounds %struct.NQueen, %struct.NQueen* %_NQueen, i64 0, i32 2, !dbg !130
  %5 = load i64, i64* %num_solutions, align 8, !dbg !130, !tbaa !131
  %num_solutions11 = getelementptr inbounds i8, i8* %call, i64 16, !dbg !132
  %6 = bitcast i8* %num_solutions11 to i64*, !dbg !132
  store i64 %5, i64* %6, align 8, !dbg !133, !tbaa !131
  ret %struct.NQueen* %0, !dbg !134

for.body:                                         ; preds = %for.body.preheader, %for.body
  %indvars.iv = phi i64 [ %indvars.iv.next, %for.body ], [ 0, %for.body.preheader ]
  %7 = load %struct.POS**, %struct.POS*** %queens4, align 8, !dbg !125, !tbaa !120
  %arrayidx = getelementptr inbounds %struct.POS*, %struct.POS** %7, i64 %indvars.iv, !dbg !125
  %8 = bitcast %struct.POS** %arrayidx to <2 x i64>**, !dbg !125
  %9 = load <2 x i64>*, <2 x i64>** %8, align 8, !dbg !125, !tbaa !61
  %call.i = tail call noalias i8* @malloc(i64 16) #7, !dbg !135
  %10 = load <2 x i64>, <2 x i64>* %9, align 8, !dbg !137, !tbaa !29
  %11 = bitcast i8* %call.i to <2 x i64>*, !dbg !138
  store <2 x i64> %10, <2 x i64>* %11, align 8, !dbg !138, !tbaa !29
  %arrayidx8 = getelementptr inbounds %struct.POS*, %struct.POS** %3, i64 %indvars.iv, !dbg !125
  %12 = bitcast %struct.POS** %arrayidx8 to i8**, !dbg !125
  store i8* %call.i, i8** %12, align 8, !dbg !125, !tbaa !61
  %indvars.iv.next = add nuw i64 %indvars.iv, 1, !dbg !122
  %cmp = icmp slt i64 %indvars.iv.next, %1, !dbg !122
  br i1 %cmp, label %for.body, label %for.cond.cleanup.loopexit, !dbg !122, !llvm.loop !139
}

; Function Attrs: nounwind uwtable
define noalias %struct.NQueen** @copy_array_NQueen(%struct.NQueen** nocapture readonly %_NQueen, i64 %_NQueen_size) local_unnamed_addr #0 !dbg !140 {
entry:
  tail call void @llvm.dbg.value(metadata %struct.NQueen** %_NQueen, i64 0, metadata !145, metadata !22), !dbg !150
  tail call void @llvm.dbg.value(metadata i64 %_NQueen_size, i64 0, metadata !146, metadata !22), !dbg !151
  %mul = shl i64 %_NQueen_size, 3, !dbg !152
  %call = tail call noalias i8* @malloc(i64 %mul) #7, !dbg !153
  %0 = bitcast i8* %call to %struct.NQueen**, !dbg !155
  tail call void @llvm.dbg.value(metadata %struct.NQueen** %0, i64 0, metadata !147, metadata !22), !dbg !156
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !148, metadata !22), !dbg !157
  %cmp12 = icmp sgt i64 %_NQueen_size, 0, !dbg !158
  br i1 %cmp12, label %for.body.preheader, label %for.cond.cleanup, !dbg !161

for.body.preheader:                               ; preds = %entry
  br label %for.body, !dbg !162

for.cond.cleanup.loopexit:                        ; preds = %copy_NQueen.exit
  br label %for.cond.cleanup, !dbg !164

for.cond.cleanup:                                 ; preds = %for.cond.cleanup.loopexit, %entry
  ret %struct.NQueen** %0, !dbg !164

for.body:                                         ; preds = %for.body.preheader, %copy_NQueen.exit
  %indvars.iv = phi i64 [ %indvars.iv.next, %copy_NQueen.exit ], [ 0, %for.body.preheader ]
  %arrayidx = getelementptr inbounds %struct.NQueen*, %struct.NQueen** %_NQueen, i64 %indvars.iv, !dbg !162
  %1 = load %struct.NQueen*, %struct.NQueen** %arrayidx, align 8, !dbg !162, !tbaa !61
  tail call void @llvm.dbg.value(metadata %struct.NQueen* %1, i64 0, metadata !107, metadata !22) #7, !dbg !165
  %call.i = tail call noalias i8* @malloc(i64 24) #7, !dbg !167
  %queens_size.i = getelementptr inbounds %struct.NQueen, %struct.NQueen* %1, i64 0, i32 1, !dbg !168
  %2 = load i64, i64* %queens_size.i, align 8, !dbg !168, !tbaa !118
  %mul.i = shl i64 %2, 3, !dbg !168
  %call1.i = tail call noalias i8* @malloc(i64 %mul.i) #7, !dbg !168
  %3 = bitcast i8* %call.i to i8**, !dbg !168
  store i8* %call1.i, i8** %3, align 8, !dbg !168, !tbaa !120
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !109, metadata !22) #7, !dbg !169
  %cmp25.i = icmp sgt i64 %2, 0, !dbg !170
  %4 = bitcast i8* %call1.i to %struct.POS**, !dbg !170
  br i1 %cmp25.i, label %for.body.preheader.i, label %copy_NQueen.exit, !dbg !170

for.body.preheader.i:                             ; preds = %for.body
  %queens4.i = getelementptr inbounds %struct.NQueen, %struct.NQueen* %1, i64 0, i32 0, !dbg !171
  br label %for.body.i, !dbg !171

for.body.i:                                       ; preds = %for.body.i, %for.body.preheader.i
  %indvars.iv.i = phi i64 [ %indvars.iv.next.i, %for.body.i ], [ 0, %for.body.preheader.i ], !dbg !172
  %5 = load %struct.POS**, %struct.POS*** %queens4.i, align 8, !dbg !171, !tbaa !120
  %arrayidx.i = getelementptr inbounds %struct.POS*, %struct.POS** %5, i64 %indvars.iv.i, !dbg !171
  %6 = bitcast %struct.POS** %arrayidx.i to <2 x i64>**, !dbg !171
  %7 = load <2 x i64>*, <2 x i64>** %6, align 8, !dbg !171, !tbaa !61
  %call.i.i = tail call noalias i8* @malloc(i64 16) #7, !dbg !173
  %8 = load <2 x i64>, <2 x i64>* %7, align 8, !dbg !175, !tbaa !29
  %9 = bitcast i8* %call.i.i to <2 x i64>*, !dbg !176
  store <2 x i64> %8, <2 x i64>* %9, align 8, !dbg !176, !tbaa !29
  %arrayidx8.i = getelementptr inbounds %struct.POS*, %struct.POS** %4, i64 %indvars.iv.i, !dbg !171
  %10 = bitcast %struct.POS** %arrayidx8.i to i8**, !dbg !171
  store i8* %call.i.i, i8** %10, align 8, !dbg !171, !tbaa !61
  %indvars.iv.next.i = add nuw nsw i64 %indvars.iv.i, 1, !dbg !170
  %exitcond = icmp eq i64 %indvars.iv.next.i, %2, !dbg !170
  br i1 %exitcond, label %copy_NQueen.exit.loopexit, label %for.body.i, !dbg !170, !llvm.loop !139

copy_NQueen.exit.loopexit:                        ; preds = %for.body.i
  br label %copy_NQueen.exit, !dbg !177

copy_NQueen.exit:                                 ; preds = %copy_NQueen.exit.loopexit, %for.body
  %queens_size10.i = getelementptr inbounds i8, i8* %call.i, i64 8, !dbg !177
  %11 = bitcast i8* %queens_size10.i to i64*, !dbg !177
  store i64 %2, i64* %11, align 8, !dbg !177, !tbaa !118
  %num_solutions.i = getelementptr inbounds %struct.NQueen, %struct.NQueen* %1, i64 0, i32 2, !dbg !178
  %12 = load i64, i64* %num_solutions.i, align 8, !dbg !178, !tbaa !131
  %num_solutions11.i = getelementptr inbounds i8, i8* %call.i, i64 16, !dbg !179
  %13 = bitcast i8* %num_solutions11.i to i64*, !dbg !179
  store i64 %12, i64* %13, align 8, !dbg !180, !tbaa !131
  %arrayidx4 = getelementptr inbounds %struct.NQueen*, %struct.NQueen** %0, i64 %indvars.iv, !dbg !181
  %14 = bitcast %struct.NQueen** %arrayidx4 to i8**, !dbg !182
  store i8* %call.i, i8** %14, align 8, !dbg !182, !tbaa !61
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1, !dbg !161
  %exitcond15 = icmp eq i64 %indvars.iv.next, %_NQueen_size, !dbg !161
  br i1 %exitcond15, label %for.cond.cleanup.loopexit, label %for.body, !dbg !161, !llvm.loop !183
}

; Function Attrs: nounwind uwtable
define void @free_NQueen(%struct.NQueen* nocapture %nqueen) local_unnamed_addr #0 !dbg !185 {
entry:
  tail call void @llvm.dbg.value(metadata %struct.NQueen* %nqueen, i64 0, metadata !189, metadata !22), !dbg !193
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !190, metadata !22), !dbg !194
  %queens_size = getelementptr inbounds %struct.NQueen, %struct.NQueen* %nqueen, i64 0, i32 1, !dbg !195
  %0 = load i64, i64* %queens_size, align 8, !dbg !195, !tbaa !118
  %cmp16 = icmp sgt i64 %0, 0, !dbg !195
  %queens = getelementptr inbounds %struct.NQueen, %struct.NQueen* %nqueen, i64 0, i32 0, !dbg !198
  br i1 %cmp16, label %for.body.preheader, label %for.cond.cleanup, !dbg !195

for.body.preheader:                               ; preds = %entry
  br label %for.body, !dbg !198

for.cond.cleanup.loopexit:                        ; preds = %for.body
  br label %for.cond.cleanup, !dbg !201

for.cond.cleanup:                                 ; preds = %for.cond.cleanup.loopexit, %entry
  %1 = bitcast %struct.NQueen* %nqueen to i8**, !dbg !201
  %2 = load i8*, i8** %1, align 8, !dbg !201, !tbaa !120
  tail call void @free(i8* %2) #7, !dbg !201
  %3 = bitcast %struct.NQueen* %nqueen to i8*, !dbg !203
  tail call void @free(i8* %3) #7, !dbg !204
  ret void, !dbg !205

for.body:                                         ; preds = %for.body.preheader, %for.body
  %indvars.iv = phi i64 [ %indvars.iv.next, %for.body ], [ 0, %for.body.preheader ]
  %4 = load %struct.POS**, %struct.POS*** %queens, align 8, !dbg !198, !tbaa !120
  %arrayidx = getelementptr inbounds %struct.POS*, %struct.POS** %4, i64 %indvars.iv, !dbg !198
  %5 = bitcast %struct.POS** %arrayidx to i8**, !dbg !198
  %6 = load i8*, i8** %5, align 8, !dbg !198, !tbaa !61
  tail call void @free(i8* %6) #7, !dbg !206
  %7 = load %struct.POS**, %struct.POS*** %queens, align 8, !dbg !198, !tbaa !120
  %arrayidx4 = getelementptr inbounds %struct.POS*, %struct.POS** %7, i64 %indvars.iv, !dbg !198
  store %struct.POS* null, %struct.POS** %arrayidx4, align 8, !dbg !198, !tbaa !61
  %indvars.iv.next = add nuw i64 %indvars.iv, 1, !dbg !195
  %8 = load i64, i64* %queens_size, align 8, !dbg !195, !tbaa !118
  %cmp = icmp slt i64 %indvars.iv.next, %8, !dbg !195
  br i1 %cmp, label %for.body, label %for.cond.cleanup.loopexit, !dbg !195, !llvm.loop !208
}

; Function Attrs: nounwind uwtable
define void @printf_NQueen(%struct.NQueen* nocapture readonly %nqueen) local_unnamed_addr #0 !dbg !210 {
entry:
  tail call void @llvm.dbg.value(metadata %struct.NQueen* %nqueen, i64 0, metadata !212, metadata !22), !dbg !216
  %putchar = tail call i32 @putchar(i32 123) #7, !dbg !217
  %call1 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.5, i64 0, i64 0)), !dbg !218
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !213, metadata !22), !dbg !219
  %queens_size = getelementptr inbounds %struct.NQueen, %struct.NQueen* %nqueen, i64 0, i32 1, !dbg !220
  %0 = load i64, i64* %queens_size, align 8, !dbg !220, !tbaa !118
  %cmp12 = icmp sgt i64 %0, 0, !dbg !220
  br i1 %cmp12, label %for.body.preheader, label %for.cond.cleanup, !dbg !220

for.body.preheader:                               ; preds = %entry
  %queens = getelementptr inbounds %struct.NQueen, %struct.NQueen* %nqueen, i64 0, i32 0, !dbg !223
  br label %for.body, !dbg !223

for.cond.cleanup.loopexit:                        ; preds = %for.body
  br label %for.cond.cleanup, !dbg !226

for.cond.cleanup:                                 ; preds = %for.cond.cleanup.loopexit, %entry
  %call3 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.6, i64 0, i64 0)), !dbg !226
  %num_solutions = getelementptr inbounds %struct.NQueen, %struct.NQueen* %nqueen, i64 0, i32 2, !dbg !227
  %1 = load i64, i64* %num_solutions, align 8, !dbg !227, !tbaa !131
  %call4 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.2, i64 0, i64 0), i64 %1), !dbg !228
  %putchar11 = tail call i32 @putchar(i32 125) #7, !dbg !229
  ret void, !dbg !230

for.body:                                         ; preds = %for.body.preheader, %for.body
  %indvars.iv = phi i64 [ %indvars.iv.next, %for.body ], [ 0, %for.body.preheader ]
  %2 = load %struct.POS**, %struct.POS*** %queens, align 8, !dbg !223, !tbaa !120
  %arrayidx = getelementptr inbounds %struct.POS*, %struct.POS** %2, i64 %indvars.iv, !dbg !223
  %3 = load %struct.POS*, %struct.POS** %arrayidx, align 8, !dbg !223, !tbaa !61
  tail call void @llvm.dbg.value(metadata %struct.POS* %3, i64 0, metadata !82, metadata !22) #7, !dbg !231
  %putchar.i = tail call i32 @putchar(i32 123) #7, !dbg !233
  %call1.i = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.1, i64 0, i64 0)) #7, !dbg !234
  %r.i = getelementptr inbounds %struct.POS, %struct.POS* %3, i64 0, i32 0, !dbg !235
  %4 = load i64, i64* %r.i, align 8, !dbg !235, !tbaa !87
  %call2.i = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.2, i64 0, i64 0), i64 %4) #7, !dbg !236
  %call3.i = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.3, i64 0, i64 0)) #7, !dbg !237
  %c.i = getelementptr inbounds %struct.POS, %struct.POS* %3, i64 0, i32 1, !dbg !238
  %5 = load i64, i64* %c.i, align 8, !dbg !238, !tbaa !92
  %call4.i = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.2, i64 0, i64 0), i64 %5) #7, !dbg !239
  %putchar7.i = tail call i32 @putchar(i32 125) #7, !dbg !240
  %indvars.iv.next = add nuw i64 %indvars.iv, 1, !dbg !220
  %6 = load i64, i64* %queens_size, align 8, !dbg !220, !tbaa !118
  %cmp = icmp slt i64 %indvars.iv.next, %6, !dbg !220
  br i1 %cmp, label %for.body, label %for.cond.cleanup.loopexit, !dbg !220, !llvm.loop !241
}

; Function Attrs: nounwind uwtable
define noalias %struct.NQueen* @nqueen(i64 %num_solutions, %struct.POS** %queens, i64 %queens_size, i1 zeroext %queens_dealloc) local_unnamed_addr #0 !dbg !243 {
entry:
  tail call void @llvm.dbg.value(metadata i64 %num_solutions, i64 0, metadata !248, metadata !22), !dbg !261
  tail call void @llvm.dbg.value(metadata %struct.POS** %queens, i64 0, metadata !249, metadata !22), !dbg !262
  tail call void @llvm.dbg.value(metadata i64 %queens_size, i64 0, metadata !250, metadata !22), !dbg !263
  tail call void @llvm.dbg.value(metadata i1 %queens_dealloc, i64 0, metadata !251, metadata !264), !dbg !265
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !253, metadata !22), !dbg !266
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !255, metadata !22), !dbg !267
  %call = tail call noalias i8* @malloc(i64 24) #7, !dbg !268
  %0 = bitcast i8* %call to %struct.NQueen*, !dbg !268
  tail call void @llvm.dbg.value(metadata %struct.NQueen* %0, i64 0, metadata !254, metadata !22), !dbg !269
  %num_solutions1 = getelementptr inbounds i8, i8* %call, i64 16, !dbg !270
  %1 = bitcast i8* %num_solutions1 to i64*, !dbg !270
  store i64 %num_solutions, i64* %1, align 8, !dbg !271, !tbaa !131
  %queens_size2 = getelementptr inbounds i8, i8* %call, i64 8, !dbg !272
  %2 = bitcast i8* %queens_size2 to i64*, !dbg !272
  store i64 %queens_size, i64* %2, align 8, !dbg !272, !tbaa !118
  %queens3 = bitcast i8* %call to %struct.POS***, !dbg !272
  store %struct.POS** %queens, %struct.POS*** %queens3, align 8, !dbg !272, !tbaa !120
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !251, metadata !22), !dbg !265
  tail call void @llvm.dbg.value(metadata i8 1, i64 0, metadata !255, metadata !22), !dbg !267
  ret %struct.NQueen* %0, !dbg !273
}

; Function Attrs: nounwind uwtable
define i64 @conflict(%struct.POS* nocapture %p, i1 zeroext %p_dealloc, i64 %row, i64 %col) local_unnamed_addr #0 !dbg !274 {
entry:
  tail call void @llvm.dbg.value(metadata %struct.POS* %p, i64 0, metadata !278, metadata !22), !dbg !295
  tail call void @llvm.dbg.value(metadata i1 %p_dealloc, i64 0, metadata !279, metadata !264), !dbg !296
  tail call void @llvm.dbg.value(metadata i64 %row, i64 0, metadata !280, metadata !22), !dbg !297
  tail call void @llvm.dbg.value(metadata i64 %col, i64 0, metadata !281, metadata !22), !dbg !298
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !283, metadata !22), !dbg !299
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !284, metadata !22), !dbg !300
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !285, metadata !22), !dbg !301
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !286, metadata !22), !dbg !302
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !287, metadata !22), !dbg !303
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !288, metadata !22), !dbg !304
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !290, metadata !22), !dbg !305
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !291, metadata !22), !dbg !306
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !292, metadata !22), !dbg !307
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !293, metadata !22), !dbg !308
  %r1 = getelementptr inbounds %struct.POS, %struct.POS* %p, i64 0, i32 0, !dbg !309
  %0 = load i64, i64* %r1, align 8, !dbg !309, !tbaa !87
  tail call void @llvm.dbg.value(metadata i64 %0, i64 0, metadata !287, metadata !22), !dbg !303
  tail call void @llvm.dbg.value(metadata i64 %0, i64 0, metadata !283, metadata !22), !dbg !299
  %c2 = getelementptr inbounds %struct.POS, %struct.POS* %p, i64 0, i32 1, !dbg !310
  %1 = load i64, i64* %c2, align 8, !dbg !310, !tbaa !92
  tail call void @llvm.dbg.value(metadata i64 %1, i64 0, metadata !288, metadata !22), !dbg !304
  tail call void @llvm.dbg.value(metadata i64 %1, i64 0, metadata !284, metadata !22), !dbg !300
  %cmp = icmp eq i64 %0, %row, !dbg !311
  %cmp3 = icmp eq i64 %1, %col, !dbg !313
  %or.cond = or i1 %cmp, %cmp3, !dbg !315
  br i1 %or.cond, label %blklab1, label %blklab0, !dbg !315

blklab1:                                          ; preds = %entry
  tail call void @llvm.dbg.value(metadata i64 1, i64 0, metadata !289, metadata !22), !dbg !316
  br i1 %p_dealloc, label %if.then6, label %cleanup, !dbg !317

if.then6:                                         ; preds = %blklab1
  tail call void @llvm.dbg.value(metadata %struct.POS* %p, i64 0, metadata !75, metadata !22) #7, !dbg !319
  %2 = bitcast %struct.POS* %p to i8*, !dbg !324
  tail call void @free(i8* %2) #7, !dbg !325
  tail call void @llvm.dbg.value(metadata %struct.POS* null, i64 0, metadata !278, metadata !22), !dbg !295
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !279, metadata !22), !dbg !296
  br label %cleanup, !dbg !326

blklab0:                                          ; preds = %entry
  %sub = sub nsw i64 %1, %col, !dbg !327
  tail call void @llvm.dbg.value(metadata i64 %sub, i64 0, metadata !291, metadata !22), !dbg !306
  %ispos = icmp sgt i64 %sub, -1, !dbg !328
  %neg = sub i64 0, %sub, !dbg !328
  %3 = select i1 %ispos, i64 %sub, i64 %neg, !dbg !328
  tail call void @llvm.dbg.value(metadata i64 %3, i64 0, metadata !290, metadata !22), !dbg !305
  tail call void @llvm.dbg.value(metadata i64 %3, i64 0, metadata !285, metadata !22), !dbg !301
  %sub8 = sub nsw i64 %0, %row, !dbg !329
  tail call void @llvm.dbg.value(metadata i64 %sub8, i64 0, metadata !293, metadata !22), !dbg !308
  %ispos49 = icmp sgt i64 %sub8, -1, !dbg !330
  %neg50 = sub i64 0, %sub8, !dbg !330
  %4 = select i1 %ispos49, i64 %sub8, i64 %neg50, !dbg !330
  tail call void @llvm.dbg.value(metadata i64 %4, i64 0, metadata !292, metadata !22), !dbg !307
  tail call void @llvm.dbg.value(metadata i64 %4, i64 0, metadata !286, metadata !22), !dbg !302
  %cmp10 = icmp eq i64 %3, %4, !dbg !331
  %. = zext i1 %cmp10 to i64, !dbg !333
  br i1 %p_dealloc, label %if.then14, label %cleanup, !dbg !334

if.then14:                                        ; preds = %blklab0
  tail call void @llvm.dbg.value(metadata %struct.POS* %p, i64 0, metadata !75, metadata !22) #7, !dbg !336
  %5 = bitcast %struct.POS* %p to i8*, !dbg !341
  tail call void @free(i8* %5) #7, !dbg !342
  tail call void @llvm.dbg.value(metadata %struct.POS* null, i64 0, metadata !278, metadata !22), !dbg !295
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !279, metadata !22), !dbg !296
  br label %cleanup, !dbg !343

cleanup:                                          ; preds = %blklab0, %if.then14, %blklab1, %if.then6
  %retval.0 = phi i64 [ 1, %if.then6 ], [ 1, %blklab1 ], [ %., %if.then14 ], [ %., %blklab0 ]
  ret i64 %retval.0, !dbg !344
}

; Function Attrs: nounwind uwtable
define %struct.NQueen* @run(%struct.NQueen* %nq, i1 zeroext %nq_dealloc, i64 %n, i64 %dim) local_unnamed_addr #2 !dbg !345 {
entry:
  tail call void @llvm.dbg.value(metadata %struct.NQueen* %nq, i64 0, metadata !349, metadata !22), !dbg !453
  tail call void @llvm.dbg.value(metadata i1 %nq_dealloc, i64 0, metadata !350, metadata !264), !dbg !454
  tail call void @llvm.dbg.value(metadata i64 %n, i64 0, metadata !351, metadata !22), !dbg !455
  tail call void @llvm.dbg.value(metadata i64 %dim, i64 0, metadata !352, metadata !22), !dbg !456
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !354, metadata !22), !dbg !457
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !355, metadata !22), !dbg !458
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !357, metadata !22), !dbg !459
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !359, metadata !22), !dbg !460
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !360, metadata !22), !dbg !461
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !361, metadata !22), !dbg !462
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !362, metadata !22), !dbg !463
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !363, metadata !22), !dbg !464
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !365, metadata !22), !dbg !465
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !366, metadata !22), !dbg !466
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !367, metadata !22), !dbg !467
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !369, metadata !22), !dbg !468
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !370, metadata !22), !dbg !469
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !371, metadata !22), !dbg !470
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !373, metadata !22), !dbg !471
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !375, metadata !22), !dbg !472
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !376, metadata !22), !dbg !473
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !377, metadata !22), !dbg !474
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !378, metadata !22), !dbg !475
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !380, metadata !22), !dbg !476
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !381, metadata !22), !dbg !477
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !382, metadata !22), !dbg !478
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !384, metadata !22), !dbg !479
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !385, metadata !22), !dbg !480
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !387, metadata !22), !dbg !481
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !392, metadata !22), !dbg !482
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !393, metadata !22), !dbg !483
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !396, metadata !22), !dbg !484
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !398, metadata !22), !dbg !485
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !399, metadata !22), !dbg !486
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !400, metadata !22), !dbg !487
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !401, metadata !22), !dbg !488
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !402, metadata !22), !dbg !489
  %cmp = icmp eq i64 %dim, %n, !dbg !490
  br i1 %cmp, label %if.end, label %blklab6, !dbg !492

if.end:                                           ; preds = %entry
  %num_solutions = getelementptr inbounds %struct.NQueen, %struct.NQueen* %nq, i64 0, i32 2, !dbg !493
  %0 = load i64, i64* %num_solutions, align 8, !dbg !493, !tbaa !131
  tail call void @llvm.dbg.value(metadata i64 %0, i64 0, metadata !360, metadata !22), !dbg !461
  tail call void @llvm.dbg.value(metadata i64 1, i64 0, metadata !361, metadata !22), !dbg !462
  %add = add nsw i64 %0, 1, !dbg !494
  tail call void @llvm.dbg.value(metadata i64 %add, i64 0, metadata !362, metadata !22), !dbg !463
  store i64 %add, i64* %num_solutions, align 8, !dbg !495, !tbaa !131
  br label %cleanup, !dbg !496

blklab6:                                          ; preds = %entry
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !363, metadata !22), !dbg !464
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !355, metadata !22), !dbg !458
  %queens_size521 = getelementptr inbounds %struct.NQueen, %struct.NQueen* %nq, i64 0, i32 1, !dbg !497
  %1 = load i64, i64* %queens_size521, align 8, !dbg !497, !tbaa !118
  tail call void @llvm.dbg.value(metadata i64 %1, i64 0, metadata !365, metadata !22), !dbg !465
  tail call void @llvm.dbg.value(metadata i64 %1, i64 0, metadata !367, metadata !22), !dbg !467
  %cmp92523 = icmp sgt i64 %1, %n, !dbg !500
  %cmp98524 = icmp eq i64 %1, %dim, !dbg !502
  %or.cond525 = and i1 %cmp92523, %cmp98524, !dbg !504
  tail call void @llvm.dbg.value(metadata i64 %1, i64 0, metadata !369, metadata !22), !dbg !468
  tail call void @llvm.dbg.value(metadata i64 %1, i64 0, metadata !371, metadata !22), !dbg !470
  br i1 %or.cond525, label %blklab10.lr.ph, label %blklab11, !dbg !504

blklab10.lr.ph:                                   ; preds = %blklab6
  %frombool = zext i1 %nq_dealloc to i8
  %add164 = add nsw i64 %n, 1, !dbg !505
  %or.cond509.not516 = icmp sgt i64 %dim, %n, !dbg !506
  %cmp125549 = icmp sgt i64 %n, 0, !dbg !509
  br label %blklab10, !dbg !504

blklab11.loopexit:                                ; preds = %blklab22
  br label %blklab11, !dbg !511

blklab11:                                         ; preds = %blklab11.loopexit, %blklab6
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !dbg !511, !tbaa !61
  %3 = tail call i64 @fwrite(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.7, i64 0, i64 0), i64 4, i64 1, %struct._IO_FILE* %2) #9, !dbg !512
  tail call void @exit(i32 -1) #10, !dbg !513
  unreachable, !dbg !513

blklab10:                                         ; preds = %blklab10.lr.ph, %blklab22
  %nq.pn = phi %struct.NQueen* [ %nq, %blklab10.lr.ph ], [ %nq.addr.1, %blklab22 ]
  %nq_dealloc.addr.0527 = phi i8 [ %frombool, %blklab10.lr.ph ], [ %nq_dealloc.addr.1, %blklab22 ]
  %col.0526 = phi i64 [ 0, %blklab10.lr.ph ], [ %add175, %blklab22 ]
  %queens530 = getelementptr inbounds %struct.NQueen, %struct.NQueen* %nq.pn, i64 0, i32 0, !dbg !497
  %cmp102 = icmp slt i64 %col.0526, %dim, !dbg !514
  br i1 %cmp102, label %while.cond106.preheader, label %cleanup.loopexit, !dbg !516

while.cond106.preheader:                          ; preds = %blklab10
  tail call void @llvm.dbg.value(metadata i64 %dim, i64 0, metadata !375, metadata !22), !dbg !472
  tail call void @llvm.dbg.value(metadata i64 %dim, i64 0, metadata !377, metadata !22), !dbg !474
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !378, metadata !22), !dbg !475
  tail call void @llvm.dbg.value(metadata i64 %dim, i64 0, metadata !380, metadata !22), !dbg !476
  tail call void @llvm.dbg.value(metadata i64 %dim, i64 0, metadata !382, metadata !22), !dbg !478
  br i1 %or.cond509.not516, label %blklab14.preheader, label %blklab15, !dbg !506

blklab14.preheader:                               ; preds = %while.cond106.preheader
  br i1 %cmp125549, label %polly.split_new_and_old.preheader, label %if.end153, !dbg !517

polly.split_new_and_old.preheader:                ; preds = %blklab14.preheader
  br label %polly.split_new_and_old

blklab15:                                         ; preds = %while.cond106.preheader
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !dbg !518, !tbaa !61
  %5 = tail call i64 @fwrite(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.7, i64 0, i64 0), i64 4, i64 1, %struct._IO_FILE* %4) #9, !dbg !519
  tail call void @exit(i32 -1) #10, !dbg !520
  unreachable, !dbg !520

polly.split_new_and_old:                          ; preds = %polly.split_new_and_old.preheader, %blklab18
  %6 = phi i1 [ %14, %blklab18 ], [ true, %polly.split_new_and_old.preheader ]
  %i.0520550 = phi i64 [ %add146, %blklab18 ], [ 0, %polly.split_new_and_old.preheader ]
  br i1 %6, label %blklab20, label %blklab18

blklab20:                                         ; preds = %polly.split_new_and_old
  tail call void @llvm.dbg.value(metadata i64 undef, i64 0, metadata !384, metadata !22), !dbg !479
  tail call void @llvm.dbg.value(metadata %struct.POS** %7, i64 0, metadata !383, metadata !22), !dbg !521
  tail call void @llvm.dbg.value(metadata %struct.POS* %8, i64 0, metadata !386, metadata !22), !dbg !522
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !387, metadata !22), !dbg !481
  tail call void @llvm.dbg.value(metadata %struct.POS* %8, i64 0, metadata !358, metadata !22), !dbg !523
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !359, metadata !22), !dbg !460
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !387, metadata !22), !dbg !481
  tail call void @llvm.dbg.value(metadata i64 1, i64 0, metadata !388, metadata !22), !dbg !524
  %7 = load %struct.POS**, %struct.POS*** %queens530, align 8, !dbg !525, !tbaa !120
  %arrayidx131 = getelementptr inbounds %struct.POS*, %struct.POS** %7, i64 %i.0520550, !dbg !526
  %8 = load %struct.POS*, %struct.POS** %arrayidx131, align 8, !dbg !526, !tbaa !61
  tail call void @llvm.dbg.value(metadata %struct.POS* %8, i64 0, metadata !278, metadata !22), !dbg !527
  tail call void @llvm.dbg.value(metadata i1 false, i64 0, metadata !279, metadata !264), !dbg !529
  tail call void @llvm.dbg.value(metadata i64 %n, i64 0, metadata !280, metadata !22), !dbg !530
  tail call void @llvm.dbg.value(metadata i64 %col.0526, i64 0, metadata !281, metadata !22), !dbg !531
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !283, metadata !22), !dbg !532
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !284, metadata !22), !dbg !533
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !285, metadata !22), !dbg !534
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !286, metadata !22), !dbg !535
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !287, metadata !22), !dbg !536
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !288, metadata !22), !dbg !537
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !290, metadata !22), !dbg !538
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !291, metadata !22), !dbg !539
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !292, metadata !22), !dbg !540
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !293, metadata !22), !dbg !541
  %r1.i = getelementptr inbounds %struct.POS, %struct.POS* %8, i64 0, i32 0, !dbg !542
  %9 = load i64, i64* %r1.i, align 8, !dbg !542, !tbaa !87
  tail call void @llvm.dbg.value(metadata i64 %9, i64 0, metadata !287, metadata !22), !dbg !536
  tail call void @llvm.dbg.value(metadata i64 %9, i64 0, metadata !283, metadata !22), !dbg !532
  %c2.i = getelementptr inbounds %struct.POS, %struct.POS* %8, i64 0, i32 1, !dbg !543
  %10 = load i64, i64* %c2.i, align 8, !dbg !543, !tbaa !92
  tail call void @llvm.dbg.value(metadata i64 %10, i64 0, metadata !288, metadata !22), !dbg !537
  tail call void @llvm.dbg.value(metadata i64 %10, i64 0, metadata !284, metadata !22), !dbg !533
  %cmp.i = icmp eq i64 %9, %n, !dbg !544
  %cmp3.i = icmp eq i64 %10, %col.0526, !dbg !545
  %or.cond.i = or i1 %cmp.i, %cmp3.i, !dbg !546
  br i1 %or.cond.i, label %conflict.exit, label %blklab0.i, !dbg !546

blklab0.i:                                        ; preds = %blklab20
  %sub.i = sub nsw i64 %10, %col.0526, !dbg !547
  tail call void @llvm.dbg.value(metadata i64 %sub.i, i64 0, metadata !291, metadata !22), !dbg !539
  %ispos.i = icmp sgt i64 %sub.i, -1, !dbg !548
  %neg.i = sub i64 0, %sub.i, !dbg !548
  %11 = select i1 %ispos.i, i64 %sub.i, i64 %neg.i, !dbg !548
  tail call void @llvm.dbg.value(metadata i64 %11, i64 0, metadata !290, metadata !22), !dbg !538
  tail call void @llvm.dbg.value(metadata i64 %11, i64 0, metadata !285, metadata !22), !dbg !534
  %sub8.i = sub nsw i64 %9, %n, !dbg !549
  tail call void @llvm.dbg.value(metadata i64 %sub8.i, i64 0, metadata !293, metadata !22), !dbg !541
  %ispos49.i = icmp sgt i64 %sub8.i, -1, !dbg !550
  %neg50.i = sub i64 0, %sub8.i, !dbg !550
  %12 = select i1 %ispos49.i, i64 %sub8.i, i64 %neg50.i, !dbg !550
  tail call void @llvm.dbg.value(metadata i64 %12, i64 0, metadata !292, metadata !22), !dbg !540
  tail call void @llvm.dbg.value(metadata i64 %12, i64 0, metadata !286, metadata !22), !dbg !535
  %cmp10.i = icmp eq i64 %11, %12, !dbg !551
  %..i = zext i1 %cmp10.i to i64, !dbg !552
  br label %conflict.exit, !dbg !553

conflict.exit:                                    ; preds = %blklab20, %blklab0.i
  %retval.0.i = phi i64 [ %..i, %blklab0.i ], [ 1, %blklab20 ], !dbg !553
  tail call void @llvm.dbg.value(metadata i64 %retval.0.i, i64 0, metadata !389, metadata !22), !dbg !554
  tail call void @llvm.dbg.value(metadata i64 1, i64 0, metadata !390, metadata !22), !dbg !555
  tail call void @llvm.dbg.value(metadata i64 1, i64 0, metadata !391, metadata !22), !dbg !556
  %13 = xor i64 %retval.0.i, 1, !dbg !557
  br label %blklab18, !dbg !558

blklab18:                                         ; preds = %polly.split_new_and_old, %conflict.exit
  %_28.0.ph.merge = phi i64 [ %13, %conflict.exit ], [ 0, %polly.split_new_and_old ]
  tail call void @llvm.dbg.value(metadata i64 %_28.0.ph.merge, i64 0, metadata !356, metadata !22), !dbg !558
  tail call void @llvm.dbg.value(metadata i64 1, i64 0, metadata !392, metadata !22), !dbg !482
  %add146 = add nuw nsw i64 %i.0520550, 1, !dbg !559
  tail call void @llvm.dbg.value(metadata i64 %add146, i64 0, metadata !393, metadata !22), !dbg !483
  tail call void @llvm.dbg.value(metadata i64 %add146, i64 0, metadata !357, metadata !22), !dbg !459
  tail call void @llvm.dbg.value(metadata i64 %dim, i64 0, metadata !375, metadata !22), !dbg !472
  tail call void @llvm.dbg.value(metadata i64 %dim, i64 0, metadata !377, metadata !22), !dbg !474
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !378, metadata !22), !dbg !475
  tail call void @llvm.dbg.value(metadata i64 %dim, i64 0, metadata !380, metadata !22), !dbg !476
  tail call void @llvm.dbg.value(metadata i64 %dim, i64 0, metadata !382, metadata !22), !dbg !478
  %cmp125 = icmp slt i64 %add146, %n, !dbg !509
  %14 = icmp eq i64 %_28.0.ph.merge, 1
  br i1 %cmp125, label %polly.split_new_and_old, label %blklab12, !dbg !517

blklab12:                                         ; preds = %blklab18
  tail call void @llvm.dbg.value(metadata i64 1, i64 0, metadata !394, metadata !22), !dbg !560
  br i1 %14, label %if.end153, label %blklab22, !dbg !561

if.end153:                                        ; preds = %blklab14.preheader, %blklab12
  %call154 = tail call noalias i8* @malloc(i64 16) #7, !dbg !562
  %c = getelementptr inbounds i8, i8* %call154, i64 8, !dbg !563
  %15 = bitcast i8* %c to i64*, !dbg !563
  store i64 %col.0526, i64* %15, align 8, !dbg !564, !tbaa !92
  %r = bitcast i8* %call154 to i64*, !dbg !565
  store i64 %n, i64* %r, align 8, !dbg !566, !tbaa !87
  tail call void @llvm.dbg.value(metadata i8 1, i64 0, metadata !396, metadata !22), !dbg !484
  %16 = and i8 %nq_dealloc.addr.0527, 1, !dbg !567
  %tobool155 = icmp ne i8 %16, 0, !dbg !567
  br i1 %tobool155, label %if.then156, label %if.end161, !dbg !570

if.then156:                                       ; preds = %if.end153
  %17 = load %struct.POS**, %struct.POS*** %queens530, align 8, !dbg !571, !tbaa !120
  %arrayidx158 = getelementptr inbounds %struct.POS*, %struct.POS** %17, i64 %n, !dbg !571
  %18 = bitcast %struct.POS** %arrayidx158 to i8**, !dbg !571
  %19 = load i8*, i8** %18, align 8, !dbg !571, !tbaa !61
  tail call void @free(i8* %19) #7, !dbg !574
  %20 = load %struct.POS**, %struct.POS*** %queens530, align 8, !dbg !571, !tbaa !120
  %arrayidx160 = getelementptr inbounds %struct.POS*, %struct.POS** %20, i64 %n, !dbg !571
  store %struct.POS* null, %struct.POS** %arrayidx160, align 8, !dbg !571, !tbaa !61
  br label %if.end161, !dbg !571

if.end161:                                        ; preds = %if.then156, %if.end153
  %21 = load %struct.POS**, %struct.POS*** %queens530, align 8, !dbg !576, !tbaa !120
  %arrayidx163 = getelementptr inbounds %struct.POS*, %struct.POS** %21, i64 %n, !dbg !577
  %22 = bitcast %struct.POS** %arrayidx163 to i8**, !dbg !578
  store i8* %call154, i8** %22, align 8, !dbg !578, !tbaa !61
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !396, metadata !22), !dbg !484
  tail call void @llvm.dbg.value(metadata i64 1, i64 0, metadata !399, metadata !22), !dbg !486
  tail call void @llvm.dbg.value(metadata i64 %add164, i64 0, metadata !400, metadata !22), !dbg !487
  %call169 = tail call %struct.NQueen* @run(%struct.NQueen* %nq.pn, i1 zeroext %tobool155, i64 %add164, i64 %dim), !dbg !579
  tail call void @llvm.dbg.value(metadata %struct.NQueen* %call169, i64 0, metadata !397, metadata !22), !dbg !580
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !350, metadata !22), !dbg !454
  tail call void @llvm.dbg.value(metadata i8 1, i64 0, metadata !398, metadata !22), !dbg !485
  tail call void @llvm.dbg.value(metadata %struct.NQueen* %call169, i64 0, metadata !349, metadata !22), !dbg !453
  tail call void @llvm.dbg.value(metadata i8 1, i64 0, metadata !350, metadata !22), !dbg !454
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !398, metadata !22), !dbg !485
  br label %blklab22, !dbg !581

blklab22:                                         ; preds = %blklab12, %if.end161
  %nq_dealloc.addr.1 = phi i8 [ %nq_dealloc.addr.0527, %blklab12 ], [ 1, %if.end161 ]
  %nq.addr.1 = phi %struct.NQueen* [ %nq.pn, %blklab12 ], [ %call169, %if.end161 ]
  tail call void @llvm.dbg.value(metadata i64 1, i64 0, metadata !401, metadata !22), !dbg !488
  %add175 = add nuw nsw i64 %col.0526, 1, !dbg !582
  tail call void @llvm.dbg.value(metadata i64 %add175, i64 0, metadata !402, metadata !22), !dbg !489
  tail call void @llvm.dbg.value(metadata i64 %add175, i64 0, metadata !355, metadata !22), !dbg !458
  %queens_size = getelementptr inbounds %struct.NQueen, %struct.NQueen* %nq.addr.1, i64 0, i32 1, !dbg !497
  %23 = load i64, i64* %queens_size, align 8, !dbg !497, !tbaa !118
  tail call void @llvm.dbg.value(metadata i64 %23, i64 0, metadata !365, metadata !22), !dbg !465
  tail call void @llvm.dbg.value(metadata i64 %23, i64 0, metadata !367, metadata !22), !dbg !467
  %cmp92 = icmp sgt i64 %23, %n, !dbg !500
  %cmp98 = icmp eq i64 %23, %dim, !dbg !502
  %or.cond = and i1 %cmp92, %cmp98, !dbg !504
  tail call void @llvm.dbg.value(metadata i64 %23, i64 0, metadata !369, metadata !22), !dbg !468
  tail call void @llvm.dbg.value(metadata i64 %23, i64 0, metadata !371, metadata !22), !dbg !470
  br i1 %or.cond, label %blklab10, label %blklab11.loopexit, !dbg !504, !llvm.loop !583

cleanup.loopexit:                                 ; preds = %blklab10
  br label %cleanup, !dbg !585

cleanup:                                          ; preds = %cleanup.loopexit, %if.end
  %retval.0 = phi %struct.NQueen* [ %nq, %if.end ], [ %nq.pn, %cleanup.loopexit ]
  ret %struct.NQueen* %retval.0, !dbg !585
}

; Function Attrs: noreturn nounwind
declare void @exit(i32) local_unnamed_addr #3

; Function Attrs: noreturn nounwind uwtable
define i32 @main(i32 %argc, i8** %args) local_unnamed_addr #4 !dbg !587 {
entry:
  tail call void @llvm.dbg.value(metadata i32 %argc, i64 0, metadata !594, metadata !22), !dbg !675
  tail call void @llvm.dbg.value(metadata i8** %args, i64 0, metadata !595, metadata !22), !dbg !676
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !598, metadata !22), !dbg !677
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !599, metadata !22), !dbg !678
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !601, metadata !22), !dbg !679
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !602, metadata !22), !dbg !680
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !603, metadata !22), !dbg !681
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !605, metadata !22), !dbg !682
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !607, metadata !22), !dbg !683
  tail call void @llvm.dbg.value(metadata i64** null, i64 0, metadata !608, metadata !22), !dbg !684
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !610, metadata !22), !dbg !684
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !611, metadata !22), !dbg !684
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !612, metadata !22), !dbg !685
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !613, metadata !22), !dbg !686
  tail call void @llvm.dbg.value(metadata i64* null, i64 0, metadata !614, metadata !22), !dbg !687
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !615, metadata !22), !dbg !687
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !616, metadata !22), !dbg !688
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !617, metadata !22), !dbg !689
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !618, metadata !22), !dbg !690
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !620, metadata !22), !dbg !691
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !622, metadata !22), !dbg !692
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !623, metadata !22), !dbg !693
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !624, metadata !22), !dbg !694
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !626, metadata !22), !dbg !695
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !628, metadata !22), !dbg !696
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !629, metadata !22), !dbg !697
  tail call void @llvm.dbg.value(metadata i64* null, i64 0, metadata !631, metadata !22), !dbg !698
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !632, metadata !22), !dbg !698
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !633, metadata !22), !dbg !699
  tail call void @llvm.dbg.value(metadata i64* null, i64 0, metadata !635, metadata !22), !dbg !700
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !636, metadata !22), !dbg !700
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !637, metadata !22), !dbg !701
  tail call void @llvm.dbg.value(metadata i64* null, i64 0, metadata !640, metadata !22), !dbg !702
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !641, metadata !22), !dbg !702
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !642, metadata !22), !dbg !703
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !644, metadata !22), !dbg !704
  tail call void @llvm.dbg.value(metadata i64* null, i64 0, metadata !646, metadata !22), !dbg !705
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !647, metadata !22), !dbg !705
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !648, metadata !22), !dbg !706
  %call = tail call i64** @convertArgsToIntArray(i32 %argc, i8** %args) #7, !dbg !707
  tail call void @llvm.dbg.value(metadata i64** %call, i64 0, metadata !608, metadata !22), !dbg !684
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !613, metadata !22), !dbg !686
  %0 = load i64*, i64** %call, align 8, !dbg !708, !tbaa !61
  tail call void @llvm.dbg.value(metadata i64* %0, i64 0, metadata !614, metadata !22), !dbg !687
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !616, metadata !22), !dbg !688
  %call1 = tail call i64* @parseStringToInt(i64* %0) #7, !dbg !709
  tail call void @llvm.dbg.value(metadata i64* %call1, i64 0, metadata !606, metadata !22), !dbg !710
  tail call void @llvm.dbg.value(metadata i8 1, i64 0, metadata !607, metadata !22), !dbg !683
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !616, metadata !22), !dbg !688
  tail call void @llvm.dbg.value(metadata i64* %call1, i64 0, metadata !596, metadata !22), !dbg !711
  tail call void @llvm.dbg.value(metadata i8 1, i64 0, metadata !598, metadata !22), !dbg !677
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !607, metadata !22), !dbg !683
  %cmp = icmp eq i64* %call1, null, !dbg !712
  br i1 %cmp, label %if.end240, label %if.end5, !dbg !714

if.end5:                                          ; preds = %entry
  %1 = load i64, i64* %call1, align 8, !dbg !715, !tbaa !29
  tail call void @llvm.dbg.value(metadata i64 %1, i64 0, metadata !599, metadata !22), !dbg !678
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !617, metadata !22), !dbg !689
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !618, metadata !22), !dbg !690
  tail call void @llvm.dbg.value(metadata i8 1, i64 0, metadata !620, metadata !22), !dbg !691
  %mul = shl i64 %1, 3, !dbg !716
  %call19 = tail call noalias i8* @malloc(i64 %mul) #7, !dbg !716
  %2 = bitcast i8* %call19 to %struct.POS**, !dbg !716
  tail call void @llvm.dbg.value(metadata %struct.POS** %2, i64 0, metadata !621, metadata !22), !dbg !717
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !654, metadata !22), !dbg !718
  %cmp23407 = icmp sgt i64 %1, 0, !dbg !719
  br i1 %cmp23407, label %for.body26.preheader, label %if.end50.thread, !dbg !719

for.body26.preheader:                             ; preds = %if.end5
  br label %for.body26, !dbg !722

if.end50.thread:                                  ; preds = %if.end5
  tail call void @llvm.dbg.value(metadata i64 %1, i64 0, metadata !622, metadata !22), !dbg !692
  tail call void @llvm.dbg.value(metadata i8 1, i64 0, metadata !623, metadata !22), !dbg !693
  %call52418 = tail call noalias i8* @malloc(i64 %mul) #7, !dbg !726
  %3 = bitcast i8* %call52418 to %struct.POS**, !dbg !726
  tail call void @llvm.dbg.value(metadata %struct.POS** %5, i64 0, metadata !600, metadata !22), !dbg !727
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !662, metadata !22), !dbg !728
  br label %if.then191, !dbg !729

for.body26:                                       ; preds = %for.body26.preheader, %for.body26
  %indvars.iv410 = phi i64 [ %indvars.iv.next411, %for.body26 ], [ 0, %for.body26.preheader ]
  %call.i = tail call noalias i8* @malloc(i64 16) #7, !dbg !722
  %arrayidx29 = getelementptr inbounds %struct.POS*, %struct.POS** %2, i64 %indvars.iv410, !dbg !732
  %4 = bitcast %struct.POS** %arrayidx29 to i8**, !dbg !732
  call void @llvm.memset.p0i8.i64(i8* %call.i, i8 0, i64 16, i32 8, i1 false), !dbg !733
  store i8* %call.i, i8** %4, align 8, !dbg !732, !tbaa !61
  %indvars.iv.next411 = add nuw nsw i64 %indvars.iv410, 1, !dbg !719
  %exitcond425 = icmp eq i64 %indvars.iv.next411, %1, !dbg !719
  br i1 %exitcond425, label %for.body60.preheader, label %for.body26, !dbg !719, !llvm.loop !734

for.body60.preheader:                             ; preds = %for.body26
  tail call void @llvm.dbg.value(metadata i64 %1, i64 0, metadata !622, metadata !22), !dbg !692
  tail call void @llvm.dbg.value(metadata i8 1, i64 0, metadata !623, metadata !22), !dbg !693
  %call52 = tail call noalias i8* @malloc(i64 %mul) #7, !dbg !726
  %5 = bitcast i8* %call52 to %struct.POS**, !dbg !726
  tail call void @llvm.dbg.value(metadata %struct.POS** %5, i64 0, metadata !600, metadata !22), !dbg !727
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !662, metadata !22), !dbg !728
  br label %for.body60, !dbg !735

for.body60:                                       ; preds = %for.body60, %for.body60.preheader
  %indvars.iv = phi i64 [ %indvars.iv.next, %for.body60 ], [ 0, %for.body60.preheader ]
  %arrayidx62 = getelementptr inbounds %struct.POS*, %struct.POS** %2, i64 %indvars.iv, !dbg !735
  %6 = bitcast %struct.POS** %arrayidx62 to <2 x i64>**, !dbg !735
  %7 = load <2 x i64>*, <2 x i64>** %6, align 8, !dbg !735, !tbaa !61
  %call.i412 = tail call noalias i8* @malloc(i64 16) #7, !dbg !738
  %8 = load <2 x i64>, <2 x i64>* %7, align 8, !dbg !740, !tbaa !29
  %9 = bitcast i8* %call.i412 to <2 x i64>*, !dbg !741
  store <2 x i64> %8, <2 x i64>* %9, align 8, !dbg !741, !tbaa !29
  %arrayidx65 = getelementptr inbounds %struct.POS*, %struct.POS** %5, i64 %indvars.iv, !dbg !735
  %10 = bitcast %struct.POS** %arrayidx65 to i8**, !dbg !735
  store i8* %call.i412, i8** %10, align 8, !dbg !735, !tbaa !61
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1, !dbg !729
  %exitcond = icmp eq i64 %indvars.iv.next, %1, !dbg !729
  br i1 %exitcond, label %if.then191.loopexit, label %for.body60, !dbg !729, !llvm.loop !742

if.then191.loopexit:                              ; preds = %for.body60
  br label %if.then191, !dbg !679

if.then191:                                       ; preds = %if.then191.loopexit, %if.end50.thread
  %11 = phi %struct.POS** [ %3, %if.end50.thread ], [ %5, %if.then191.loopexit ]
  tail call void @llvm.dbg.value(metadata i64 %1, i64 0, metadata !601, metadata !22), !dbg !679
  tail call void @llvm.dbg.value(metadata i8 1, i64 0, metadata !602, metadata !22), !dbg !680
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !623, metadata !22), !dbg !693
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !624, metadata !22), !dbg !694
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !603, metadata !22), !dbg !681
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !248, metadata !22) #7, !dbg !743
  tail call void @llvm.dbg.value(metadata %struct.POS** %5, i64 0, metadata !249, metadata !22) #7, !dbg !745
  tail call void @llvm.dbg.value(metadata i64 %1, i64 0, metadata !250, metadata !22) #7, !dbg !746
  tail call void @llvm.dbg.value(metadata i1 undef, i64 0, metadata !251, metadata !264) #7, !dbg !747
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !253, metadata !22) #7, !dbg !748
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !255, metadata !22) #7, !dbg !749
  %call.i417 = tail call noalias i8* @malloc(i64 24) #7, !dbg !750
  %12 = bitcast i8* %call.i417 to %struct.NQueen*, !dbg !750
  tail call void @llvm.dbg.value(metadata %struct.NQueen* %12, i64 0, metadata !254, metadata !22) #7, !dbg !751
  %num_solutions1.i = getelementptr inbounds i8, i8* %call.i417, i64 16, !dbg !752
  %13 = bitcast i8* %num_solutions1.i to i64*, !dbg !752
  store i64 0, i64* %13, align 8, !dbg !753, !tbaa !131
  %queens_size2.i = getelementptr inbounds i8, i8* %call.i417, i64 8, !dbg !754
  %14 = bitcast i8* %queens_size2.i to i64*, !dbg !754
  store i64 %1, i64* %14, align 8, !dbg !754, !tbaa !118
  %queens3.i = bitcast i8* %call.i417 to %struct.POS***, !dbg !754
  store %struct.POS** %11, %struct.POS*** %queens3.i, align 8, !dbg !754, !tbaa !120
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !251, metadata !22) #7, !dbg !747
  tail call void @llvm.dbg.value(metadata i8 1, i64 0, metadata !255, metadata !22) #7, !dbg !749
  tail call void @llvm.dbg.value(metadata %struct.NQueen* %12, i64 0, metadata !625, metadata !22), !dbg !755
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !602, metadata !22), !dbg !680
  tail call void @llvm.dbg.value(metadata i8 1, i64 0, metadata !626, metadata !22), !dbg !695
  tail call void @llvm.dbg.value(metadata %struct.NQueen* %12, i64 0, metadata !604, metadata !22), !dbg !756
  tail call void @llvm.dbg.value(metadata i8 1, i64 0, metadata !605, metadata !22), !dbg !682
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !626, metadata !22), !dbg !695
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !629, metadata !22), !dbg !697
  %call86 = tail call %struct.NQueen* @run(%struct.NQueen* %12, i1 zeroext true, i64 0, i64 %1), !dbg !757
  tail call void @llvm.dbg.value(metadata %struct.NQueen* %call86, i64 0, metadata !627, metadata !22), !dbg !758
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !605, metadata !22), !dbg !682
  tail call void @llvm.dbg.value(metadata i8 1, i64 0, metadata !628, metadata !22), !dbg !696
  tail call void @llvm.dbg.value(metadata %struct.NQueen* %call86, i64 0, metadata !604, metadata !22), !dbg !756
  tail call void @llvm.dbg.value(metadata i8 1, i64 0, metadata !605, metadata !22), !dbg !682
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !628, metadata !22), !dbg !696
  tail call void @llvm.dbg.value(metadata i64 33, i64 0, metadata !632, metadata !22), !dbg !698
  %call96 = tail call i64* @create1DArray(i32 0, i32 33) #7, !dbg !759
  tail call void @llvm.dbg.value(metadata i64* %call96, i64 0, metadata !631, metadata !22), !dbg !698
  %15 = bitcast i64* %call96 to <2 x i64>*, !dbg !760
  store <2 x i64> <i64 78, i64 45>, <2 x i64>* %15, align 8, !dbg !760, !tbaa !29
  %arrayidx99 = getelementptr inbounds i64, i64* %call96, i64 2, !dbg !761
  %16 = bitcast i64* %arrayidx99 to <2 x i64>*, !dbg !762
  store <2 x i64> <i64 81, i64 117>, <2 x i64>* %16, align 8, !dbg !762, !tbaa !29
  %arrayidx101 = getelementptr inbounds i64, i64* %call96, i64 4, !dbg !763
  %17 = bitcast i64* %arrayidx101 to <2 x i64>*, !dbg !764
  store <2 x i64> <i64 101, i64 101>, <2 x i64>* %17, align 8, !dbg !764, !tbaa !29
  %arrayidx103 = getelementptr inbounds i64, i64* %call96, i64 6, !dbg !765
  %18 = bitcast i64* %arrayidx103 to <2 x i64>*, !dbg !766
  store <2 x i64> <i64 110, i64 32>, <2 x i64>* %18, align 8, !dbg !766, !tbaa !29
  %arrayidx105 = getelementptr inbounds i64, i64* %call96, i64 8, !dbg !767
  %19 = bitcast i64* %arrayidx105 to <2 x i64>*, !dbg !768
  store <2 x i64> <i64 80, i64 114>, <2 x i64>* %19, align 8, !dbg !768, !tbaa !29
  %arrayidx107 = getelementptr inbounds i64, i64* %call96, i64 10, !dbg !769
  %20 = bitcast i64* %arrayidx107 to <2 x i64>*, !dbg !770
  store <2 x i64> <i64 111, i64 98>, <2 x i64>* %20, align 8, !dbg !770, !tbaa !29
  %arrayidx109 = getelementptr inbounds i64, i64* %call96, i64 12, !dbg !771
  %21 = bitcast i64* %arrayidx109 to <2 x i64>*, !dbg !772
  store <2 x i64> <i64 108, i64 101>, <2 x i64>* %21, align 8, !dbg !772, !tbaa !29
  %arrayidx111 = getelementptr inbounds i64, i64* %call96, i64 14, !dbg !773
  %22 = bitcast i64* %arrayidx111 to <2 x i64>*, !dbg !774
  store <2 x i64> <i64 109, i64 32>, <2 x i64>* %22, align 8, !dbg !774, !tbaa !29
  %arrayidx113 = getelementptr inbounds i64, i64* %call96, i64 16, !dbg !775
  %23 = bitcast i64* %arrayidx113 to <2 x i64>*, !dbg !776
  store <2 x i64> <i64 111, i64 110>, <2 x i64>* %23, align 8, !dbg !776, !tbaa !29
  %arrayidx115 = getelementptr inbounds i64, i64* %call96, i64 18, !dbg !777
  %24 = bitcast i64* %arrayidx115 to <2 x i64>*, !dbg !778
  store <2 x i64> <i64 32, i64 97>, <2 x i64>* %24, align 8, !dbg !778, !tbaa !29
  %arrayidx117 = getelementptr inbounds i64, i64* %call96, i64 20, !dbg !779
  %25 = bitcast i64* %arrayidx117 to <2 x i64>*, !dbg !780
  store <2 x i64> <i64 32, i64 78>, <2 x i64>* %25, align 8, !dbg !780, !tbaa !29
  %arrayidx119 = getelementptr inbounds i64, i64* %call96, i64 22, !dbg !781
  %26 = bitcast i64* %arrayidx119 to <2 x i64>*, !dbg !782
  store <2 x i64> <i64 32, i64 88>, <2 x i64>* %26, align 8, !dbg !782, !tbaa !29
  %arrayidx121 = getelementptr inbounds i64, i64* %call96, i64 24, !dbg !783
  %27 = bitcast i64* %arrayidx121 to <2 x i64>*, !dbg !784
  store <2 x i64> <i64 32, i64 78>, <2 x i64>* %27, align 8, !dbg !784, !tbaa !29
  %arrayidx123 = getelementptr inbounds i64, i64* %call96, i64 26, !dbg !785
  %28 = bitcast i64* %arrayidx123 to <2 x i64>*, !dbg !786
  store <2 x i64> <i64 32, i64 66>, <2 x i64>* %28, align 8, !dbg !786, !tbaa !29
  %arrayidx125 = getelementptr inbounds i64, i64* %call96, i64 28, !dbg !787
  %29 = bitcast i64* %arrayidx125 to <2 x i64>*, !dbg !788
  store <2 x i64> <i64 111, i64 97>, <2 x i64>* %29, align 8, !dbg !788, !tbaa !29
  %arrayidx127 = getelementptr inbounds i64, i64* %call96, i64 30, !dbg !789
  %30 = bitcast i64* %arrayidx127 to <2 x i64>*, !dbg !790
  store <2 x i64> <i64 114, i64 100>, <2 x i64>* %30, align 8, !dbg !790, !tbaa !29
  %arrayidx129 = getelementptr inbounds i64, i64* %call96, i64 32, !dbg !791
  store i64 46, i64* %arrayidx129, align 8, !dbg !792, !tbaa !29
  tail call void @llvm.dbg.value(metadata i8 1, i64 0, metadata !633, metadata !22), !dbg !699
  tail call void @println_s(i64* %call96, i64 33) #7, !dbg !793
  tail call void @llvm.dbg.value(metadata i64 4, i64 0, metadata !636, metadata !22), !dbg !700
  %call134 = tail call i64* @create1DArray(i32 0, i32 4) #7, !dbg !794
  tail call void @llvm.dbg.value(metadata i64* %call134, i64 0, metadata !635, metadata !22), !dbg !700
  %31 = bitcast i64* %call134 to <2 x i64>*, !dbg !795
  store <2 x i64> <i64 78, i64 32>, <2 x i64>* %31, align 8, !dbg !795, !tbaa !29
  %arrayidx137 = getelementptr inbounds i64, i64* %call134, i64 2, !dbg !796
  %32 = bitcast i64* %arrayidx137 to <2 x i64>*, !dbg !797
  store <2 x i64> <i64 61, i64 32>, <2 x i64>* %32, align 8, !dbg !797, !tbaa !29
  tail call void @llvm.dbg.value(metadata i8 1, i64 0, metadata !637, metadata !22), !dbg !701
  tail call void @printf_s(i64* %call134, i64 4) #7, !dbg !798
  %call139 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.8, i64 0, i64 0), i64 %1), !dbg !799
  tail call void @llvm.dbg.value(metadata i64 6, i64 0, metadata !641, metadata !22), !dbg !702
  %call144 = tail call i64* @create1DArray(i32 0, i32 6) #7, !dbg !800
  tail call void @llvm.dbg.value(metadata i64* %call144, i64 0, metadata !640, metadata !22), !dbg !702
  %33 = bitcast i64* %call144 to <2 x i64>*, !dbg !801
  store <2 x i64> <i64 70, i64 111>, <2 x i64>* %33, align 8, !dbg !801, !tbaa !29
  %arrayidx147 = getelementptr inbounds i64, i64* %call144, i64 2, !dbg !802
  %34 = bitcast i64* %arrayidx147 to <2 x i64>*, !dbg !803
  store <2 x i64> <i64 117, i64 110>, <2 x i64>* %34, align 8, !dbg !803, !tbaa !29
  %arrayidx149 = getelementptr inbounds i64, i64* %call144, i64 4, !dbg !804
  %35 = bitcast i64* %arrayidx149 to <2 x i64>*, !dbg !805
  store <2 x i64> <i64 100, i64 32>, <2 x i64>* %35, align 8, !dbg !805, !tbaa !29
  tail call void @llvm.dbg.value(metadata i8 1, i64 0, metadata !642, metadata !22), !dbg !703
  tail call void @printf_s(i64* %call144, i64 6) #7, !dbg !806
  %num_solutions151 = getelementptr inbounds %struct.NQueen, %struct.NQueen* %call86, i64 0, i32 2, !dbg !807
  %36 = load i64, i64* %num_solutions151, align 8, !dbg !807, !tbaa !131
  tail call void @llvm.dbg.value(metadata i64 %36, i64 0, metadata !644, metadata !22), !dbg !704
  %call152 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.2, i64 0, i64 0), i64 %36), !dbg !808
  tail call void @llvm.dbg.value(metadata i64 11, i64 0, metadata !647, metadata !22), !dbg !705
  %call157 = tail call i64* @create1DArray(i32 0, i32 11) #7, !dbg !809
  tail call void @llvm.dbg.value(metadata i64* %call157, i64 0, metadata !646, metadata !22), !dbg !705
  %37 = bitcast i64* %call157 to <2 x i64>*, !dbg !810
  store <2 x i64> <i64 32, i64 115>, <2 x i64>* %37, align 8, !dbg !810, !tbaa !29
  %arrayidx160 = getelementptr inbounds i64, i64* %call157, i64 2, !dbg !811
  %38 = bitcast i64* %arrayidx160 to <2 x i64>*, !dbg !812
  store <2 x i64> <i64 111, i64 108>, <2 x i64>* %38, align 8, !dbg !812, !tbaa !29
  %arrayidx162 = getelementptr inbounds i64, i64* %call157, i64 4, !dbg !813
  %39 = bitcast i64* %arrayidx162 to <2 x i64>*, !dbg !814
  store <2 x i64> <i64 117, i64 116>, <2 x i64>* %39, align 8, !dbg !814, !tbaa !29
  %arrayidx164 = getelementptr inbounds i64, i64* %call157, i64 6, !dbg !815
  %40 = bitcast i64* %arrayidx164 to <2 x i64>*, !dbg !816
  store <2 x i64> <i64 105, i64 111>, <2 x i64>* %40, align 8, !dbg !816, !tbaa !29
  %arrayidx166 = getelementptr inbounds i64, i64* %call157, i64 8, !dbg !817
  %41 = bitcast i64* %arrayidx166 to <2 x i64>*, !dbg !818
  store <2 x i64> <i64 110, i64 115>, <2 x i64>* %41, align 8, !dbg !818, !tbaa !29
  %arrayidx168 = getelementptr inbounds i64, i64* %call157, i64 10, !dbg !819
  store i64 46, i64* %arrayidx168, align 8, !dbg !820, !tbaa !29
  tail call void @llvm.dbg.value(metadata i8 1, i64 0, metadata !648, metadata !22), !dbg !706
  tail call void @println_s(i64* %call157, i64 11) #7, !dbg !821
  %phitmp = bitcast i64* %call157 to i8*, !dbg !821
  %phitmp391 = bitcast i64* %call144 to i8*, !dbg !821
  %phitmp392 = bitcast i64* %call134 to i8*, !dbg !821
  %phitmp393 = bitcast i64* %call96 to i8*, !dbg !821
  %42 = bitcast i64* %call1 to i8*, !dbg !822
  tail call void @free(i8* %42) #7, !dbg !822
  tail call void @llvm.dbg.value(metadata i64* null, i64 0, metadata !596, metadata !22), !dbg !711
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !598, metadata !22), !dbg !677
  tail call void @llvm.dbg.value(metadata %struct.NQueen* undef, i64 0, metadata !189, metadata !22) #7, !dbg !827
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !190, metadata !22) #7, !dbg !833
  %queens_size.i = getelementptr inbounds %struct.NQueen, %struct.NQueen* %call86, i64 0, i32 1, !dbg !834
  %43 = load i64, i64* %queens_size.i, align 8, !dbg !834, !tbaa !118
  %cmp16.i = icmp sgt i64 %43, 0, !dbg !834
  %queens.i = getelementptr inbounds %struct.NQueen, %struct.NQueen* %call86, i64 0, i32 0, !dbg !835
  br i1 %cmp16.i, label %for.body.i.preheader, label %free_NQueen.exit, !dbg !834

for.body.i.preheader:                             ; preds = %if.then191
  br label %for.body.i, !dbg !835

for.body.i:                                       ; preds = %for.body.i.preheader, %for.body.i
  %indvars.iv.i = phi i64 [ %indvars.iv.next.i, %for.body.i ], [ 0, %for.body.i.preheader ], !dbg !836
  %44 = load %struct.POS**, %struct.POS*** %queens.i, align 8, !dbg !835, !tbaa !120
  %arrayidx.i = getelementptr inbounds %struct.POS*, %struct.POS** %44, i64 %indvars.iv.i, !dbg !835
  %45 = bitcast %struct.POS** %arrayidx.i to i8**, !dbg !835
  %46 = load i8*, i8** %45, align 8, !dbg !835, !tbaa !61
  tail call void @free(i8* %46) #7, !dbg !837
  %47 = load %struct.POS**, %struct.POS*** %queens.i, align 8, !dbg !835, !tbaa !120
  %arrayidx4.i = getelementptr inbounds %struct.POS*, %struct.POS** %47, i64 %indvars.iv.i, !dbg !835
  store %struct.POS* null, %struct.POS** %arrayidx4.i, align 8, !dbg !835, !tbaa !61
  %indvars.iv.next.i = add nuw i64 %indvars.iv.i, 1, !dbg !834
  %48 = load i64, i64* %queens_size.i, align 8, !dbg !834, !tbaa !118
  %cmp.i = icmp slt i64 %indvars.iv.next.i, %48, !dbg !834
  br i1 %cmp.i, label %for.body.i, label %free_NQueen.exit.loopexit, !dbg !834, !llvm.loop !208

free_NQueen.exit.loopexit:                        ; preds = %for.body.i
  br label %free_NQueen.exit, !dbg !839

free_NQueen.exit:                                 ; preds = %free_NQueen.exit.loopexit, %if.then191
  %49 = bitcast %struct.NQueen* %call86 to i8**, !dbg !839
  %50 = load i8*, i8** %49, align 8, !dbg !839, !tbaa !120
  tail call void @free(i8* %50) #7, !dbg !839
  %51 = bitcast %struct.NQueen* %call86 to i8*, !dbg !840
  tail call void @free(i8* %51) #7, !dbg !841
  tail call void @llvm.dbg.value(metadata %struct.NQueen* null, i64 0, metadata !604, metadata !22), !dbg !756
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !605, metadata !22), !dbg !682
  tail call void @llvm.dbg.value(metadata %struct.POS* undef, i64 0, metadata !75, metadata !22) #7, !dbg !842
  tail call void @llvm.dbg.value(metadata %struct.POS* null, i64 0, metadata !619, metadata !22), !dbg !848
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !620, metadata !22), !dbg !691
  tail call void @free(i8* %phitmp393) #7, !dbg !849
  tail call void @llvm.dbg.value(metadata i64* null, i64 0, metadata !631, metadata !22), !dbg !698
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !633, metadata !22), !dbg !699
  tail call void @free(i8* %phitmp392) #7, !dbg !854
  tail call void @llvm.dbg.value(metadata i64* null, i64 0, metadata !635, metadata !22), !dbg !700
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !637, metadata !22), !dbg !701
  tail call void @free(i8* %phitmp391) #7, !dbg !859
  tail call void @llvm.dbg.value(metadata i64* null, i64 0, metadata !640, metadata !22), !dbg !702
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !642, metadata !22), !dbg !703
  tail call void @free(i8* %phitmp) #7, !dbg !864
  tail call void @llvm.dbg.value(metadata i64* null, i64 0, metadata !646, metadata !22), !dbg !705
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !648, metadata !22), !dbg !706
  br label %if.end240, !dbg !864

if.end240:                                        ; preds = %entry, %free_NQueen.exit
  tail call void @exit(i32 0) #10, !dbg !869
  unreachable, !dbg !869
}

declare i64** @convertArgsToIntArray(i32, i8**) local_unnamed_addr #5

declare i64* @parseStringToInt(i64*) local_unnamed_addr #5

declare i64* @create1DArray(i32, i32) local_unnamed_addr #5

declare void @println_s(i64*, i64) local_unnamed_addr #5

declare void @printf_s(i64*, i64) local_unnamed_addr #5

; Function Attrs: nounwind readnone
declare void @llvm.dbg.value(metadata, i64, metadata, metadata) #6

declare i32 @putchar(i32) local_unnamed_addr

; Function Attrs: nounwind
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) local_unnamed_addr #7

; Function Attrs: argmemonly nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture, i8, i64, i32, i1) #8

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "polly-optimized" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { noreturn nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { noreturn nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #6 = { nounwind readnone }
attributes #7 = { nounwind }
attributes #8 = { argmemonly nounwind }
attributes #9 = { cold }
attributes #10 = { noreturn nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!5, !6}
!llvm.ident = !{!7}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 3.9.0 (http://llvm.org/git/clang.git f82fb5beb88e841f7a00cfb2a2ceabe46bcb2a9b) (http://llvm.org/git/llvm.git bafbf2b643f118fd2ea402ed6cd204281c7e9e94)", isOptimized: true, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3)
!1 = !DIFile(filename: "NQueens_original.c", directory: "/home/mw169/workspace/WhileyOpenCL/polly/NQueens/impl/original/copyreduced_dealloc")
!2 = !{}
!3 = !{!4}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64, align: 64)
!5 = !{i32 2, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{!"clang version 3.9.0 (http://llvm.org/git/clang.git f82fb5beb88e841f7a00cfb2a2ceabe46bcb2a9b) (http://llvm.org/git/llvm.git bafbf2b643f118fd2ea402ed6cd204281c7e9e94)"}
!8 = distinct !DISubprogram(name: "copy_POS", scope: !1, file: !1, line: 2, type: !9, isLocal: false, isDefinition: true, scopeLine: 2, flags: DIFlagPrototyped, isOptimized: true, unit: !0, variables: !19)
!9 = !DISubroutineType(types: !10)
!10 = !{!11, !11}
!11 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !12, size: 64, align: 64)
!12 = !DIDerivedType(tag: DW_TAG_typedef, name: "POS", file: !13, line: 5, baseType: !14)
!13 = !DIFile(filename: "./NQueens_original.h", directory: "/home/mw169/workspace/WhileyOpenCL/polly/NQueens/impl/original/copyreduced_dealloc")
!14 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !13, line: 2, size: 128, align: 64, elements: !15)
!15 = !{!16, !18}
!16 = !DIDerivedType(tag: DW_TAG_member, name: "r", scope: !14, file: !13, line: 3, baseType: !17, size: 64, align: 64)
!17 = !DIBasicType(name: "long long int", size: 64, align: 64, encoding: DW_ATE_signed)
!18 = !DIDerivedType(tag: DW_TAG_member, name: "c", scope: !14, file: !13, line: 4, baseType: !17, size: 64, align: 64, offset: 64)
!19 = !{!20, !21}
!20 = !DILocalVariable(name: "_POS", arg: 1, scope: !8, file: !1, line: 2, type: !11)
!21 = !DILocalVariable(name: "new_POS", scope: !8, file: !1, line: 3, type: !11)
!22 = !DIExpression()
!23 = !DILocation(line: 2, column: 20, scope: !8)
!24 = !DILocation(line: 3, column: 17, scope: !25)
!25 = !DILexicalBlockFile(scope: !8, file: !1, discriminator: 1)
!26 = !DILocation(line: 3, column: 17, scope: !8)
!27 = !DILocation(line: 3, column: 7, scope: !8)
!28 = !DILocation(line: 4, column: 21, scope: !8)
!29 = !{!30, !30, i64 0}
!30 = !{!"long long", !31, i64 0}
!31 = !{!"omnipotent char", !32, i64 0}
!32 = !{!"Simple C/C++ TBAA"}
!33 = !DILocation(line: 4, column: 13, scope: !8)
!34 = !DILocation(line: 6, column: 2, scope: !8)
!35 = distinct !DISubprogram(name: "copy_array_POS", scope: !1, file: !1, line: 8, type: !36, isLocal: false, isDefinition: true, scopeLine: 8, flags: DIFlagPrototyped, isOptimized: true, unit: !0, variables: !39)
!36 = !DISubroutineType(types: !37)
!37 = !{!38, !38, !17}
!38 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !11, size: 64, align: 64)
!39 = !{!40, !41, !42, !43}
!40 = !DILocalVariable(name: "_POS", arg: 1, scope: !35, file: !1, line: 8, type: !38)
!41 = !DILocalVariable(name: "_POS_size", arg: 2, scope: !35, file: !1, line: 8, type: !17)
!42 = !DILocalVariable(name: "new_POS", scope: !35, file: !1, line: 9, type: !38)
!43 = !DILocalVariable(name: "i", scope: !44, file: !1, line: 10, type: !45)
!44 = distinct !DILexicalBlock(scope: !35, file: !1, line: 10, column: 2)
!45 = !DIBasicType(name: "int", size: 32, align: 32, encoding: DW_ATE_signed)
!46 = !DILocation(line: 8, column: 28, scope: !35)
!47 = !DILocation(line: 8, column: 44, scope: !35)
!48 = !DILocation(line: 9, column: 34, scope: !35)
!49 = !DILocation(line: 9, column: 18, scope: !50)
!50 = !DILexicalBlockFile(scope: !35, file: !1, discriminator: 1)
!51 = !DILocation(line: 9, column: 18, scope: !35)
!52 = !DILocation(line: 9, column: 8, scope: !35)
!53 = !DILocation(line: 10, column: 10, scope: !44)
!54 = !DILocation(line: 10, column: 15, scope: !55)
!55 = !DILexicalBlockFile(scope: !56, file: !1, discriminator: 1)
!56 = distinct !DILexicalBlock(scope: !44, file: !1, line: 10, column: 2)
!57 = !DILocation(line: 10, column: 2, scope: !55)
!58 = !DILocation(line: 11, column: 25, scope: !59)
!59 = distinct !DILexicalBlock(scope: !56, file: !1, line: 10, column: 30)
!60 = !DILocation(line: 13, column: 2, scope: !35)
!61 = !{!62, !62, i64 0}
!62 = !{!"any pointer", !31, i64 0}
!63 = !DILocation(line: 3, column: 17, scope: !25, inlinedAt: !64)
!64 = distinct !DILocation(line: 11, column: 16, scope: !59)
!65 = !DILocation(line: 4, column: 21, scope: !8, inlinedAt: !64)
!66 = !DILocation(line: 4, column: 13, scope: !8, inlinedAt: !64)
!67 = !DILocation(line: 11, column: 3, scope: !59)
!68 = !DILocation(line: 11, column: 14, scope: !59)
!69 = distinct !{!69, !70}
!70 = !DILocation(line: 10, column: 2, scope: !35)
!71 = distinct !DISubprogram(name: "free_POS", scope: !1, file: !1, line: 15, type: !72, isLocal: false, isDefinition: true, scopeLine: 15, flags: DIFlagPrototyped, isOptimized: true, unit: !0, variables: !74)
!72 = !DISubroutineType(types: !73)
!73 = !{null, !11}
!74 = !{!75}
!75 = !DILocalVariable(name: "pos", arg: 1, scope: !71, file: !1, line: 15, type: !11)
!76 = !DILocation(line: 15, column: 20, scope: !71)
!77 = !DILocation(line: 16, column: 7, scope: !71)
!78 = !DILocation(line: 16, column: 2, scope: !71)
!79 = !DILocation(line: 17, column: 1, scope: !71)
!80 = distinct !DISubprogram(name: "printf_POS", scope: !1, file: !1, line: 18, type: !72, isLocal: false, isDefinition: true, scopeLine: 18, flags: DIFlagPrototyped, isOptimized: true, unit: !0, variables: !81)
!81 = !{!82}
!82 = !DILocalVariable(name: "pos", arg: 1, scope: !80, file: !1, line: 18, type: !11)
!83 = !DILocation(line: 18, column: 22, scope: !80)
!84 = !DILocation(line: 19, column: 2, scope: !80)
!85 = !DILocation(line: 20, column: 2, scope: !80)
!86 = !DILocation(line: 21, column: 22, scope: !80)
!87 = !{!88, !30, i64 0}
!88 = !{!"", !30, i64 0, !30, i64 8}
!89 = !DILocation(line: 21, column: 2, scope: !80)
!90 = !DILocation(line: 22, column: 2, scope: !80)
!91 = !DILocation(line: 23, column: 22, scope: !80)
!92 = !{!88, !30, i64 8}
!93 = !DILocation(line: 23, column: 2, scope: !80)
!94 = !DILocation(line: 24, column: 2, scope: !80)
!95 = !DILocation(line: 25, column: 1, scope: !80)
!96 = distinct !DISubprogram(name: "copy_NQueen", scope: !1, file: !1, line: 26, type: !97, isLocal: false, isDefinition: true, scopeLine: 26, flags: DIFlagPrototyped, isOptimized: true, unit: !0, variables: !106)
!97 = !DISubroutineType(types: !98)
!98 = !{!99, !99}
!99 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !100, size: 64, align: 64)
!100 = !DIDerivedType(tag: DW_TAG_typedef, name: "NQueen", file: !13, line: 13, baseType: !101)
!101 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !13, line: 9, size: 192, align: 64, elements: !102)
!102 = !{!103, !104, !105}
!103 = !DIDerivedType(tag: DW_TAG_member, name: "queens", scope: !101, file: !13, line: 10, baseType: !38, size: 64, align: 64)
!104 = !DIDerivedType(tag: DW_TAG_member, name: "queens_size", scope: !101, file: !13, line: 11, baseType: !17, size: 64, align: 64, offset: 64)
!105 = !DIDerivedType(tag: DW_TAG_member, name: "num_solutions", scope: !101, file: !13, line: 12, baseType: !17, size: 64, align: 64, offset: 128)
!106 = !{!107, !108, !109}
!107 = !DILocalVariable(name: "_NQueen", arg: 1, scope: !96, file: !1, line: 26, type: !99)
!108 = !DILocalVariable(name: "new_NQueen", scope: !96, file: !1, line: 27, type: !99)
!109 = !DILocalVariable(name: "i", scope: !110, file: !1, line: 28, type: !45)
!110 = distinct !DILexicalBlock(scope: !111, file: !1, line: 28, column: 2)
!111 = distinct !DILexicalBlock(scope: !96, file: !1, line: 28, column: 2)
!112 = !DILocation(line: 26, column: 29, scope: !96)
!113 = !DILocation(line: 27, column: 23, scope: !114)
!114 = !DILexicalBlockFile(scope: !96, file: !1, discriminator: 1)
!115 = !DILocation(line: 27, column: 23, scope: !96)
!116 = !DILocation(line: 27, column: 10, scope: !96)
!117 = !DILocation(line: 28, column: 2, scope: !111)
!118 = !{!119, !30, i64 8}
!119 = !{!"", !62, i64 0, !30, i64 8, !30, i64 16}
!120 = !{!119, !62, i64 0}
!121 = !DILocation(line: 28, column: 2, scope: !110)
!122 = !DILocation(line: 28, column: 2, scope: !123)
!123 = !DILexicalBlockFile(scope: !124, file: !1, discriminator: 1)
!124 = distinct !DILexicalBlock(scope: !110, file: !1, line: 28, column: 2)
!125 = !DILocation(line: 28, column: 2, scope: !126)
!126 = !DILexicalBlockFile(scope: !127, file: !1, discriminator: 3)
!127 = distinct !DILexicalBlock(scope: !124, file: !1, line: 28, column: 2)
!128 = !DILocation(line: 28, column: 2, scope: !129)
!129 = !DILexicalBlockFile(scope: !111, file: !1, discriminator: 5)
!130 = !DILocation(line: 29, column: 39, scope: !96)
!131 = !{!119, !30, i64 16}
!132 = !DILocation(line: 29, column: 14, scope: !96)
!133 = !DILocation(line: 29, column: 28, scope: !96)
!134 = !DILocation(line: 30, column: 2, scope: !96)
!135 = !DILocation(line: 3, column: 17, scope: !25, inlinedAt: !136)
!136 = distinct !DILocation(line: 28, column: 2, scope: !126)
!137 = !DILocation(line: 4, column: 21, scope: !8, inlinedAt: !136)
!138 = !DILocation(line: 4, column: 13, scope: !8, inlinedAt: !136)
!139 = distinct !{!139, !117}
!140 = distinct !DISubprogram(name: "copy_array_NQueen", scope: !1, file: !1, line: 32, type: !141, isLocal: false, isDefinition: true, scopeLine: 32, flags: DIFlagPrototyped, isOptimized: true, unit: !0, variables: !144)
!141 = !DISubroutineType(types: !142)
!142 = !{!143, !143, !17}
!143 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !99, size: 64, align: 64)
!144 = !{!145, !146, !147, !148}
!145 = !DILocalVariable(name: "_NQueen", arg: 1, scope: !140, file: !1, line: 32, type: !143)
!146 = !DILocalVariable(name: "_NQueen_size", arg: 2, scope: !140, file: !1, line: 32, type: !17)
!147 = !DILocalVariable(name: "new_NQueen", scope: !140, file: !1, line: 33, type: !143)
!148 = !DILocalVariable(name: "i", scope: !149, file: !1, line: 34, type: !45)
!149 = distinct !DILexicalBlock(scope: !140, file: !1, line: 34, column: 2)
!150 = !DILocation(line: 32, column: 37, scope: !140)
!151 = !DILocation(line: 32, column: 56, scope: !140)
!152 = !DILocation(line: 33, column: 43, scope: !140)
!153 = !DILocation(line: 33, column: 24, scope: !154)
!154 = !DILexicalBlockFile(scope: !140, file: !1, discriminator: 1)
!155 = !DILocation(line: 33, column: 24, scope: !140)
!156 = !DILocation(line: 33, column: 11, scope: !140)
!157 = !DILocation(line: 34, column: 10, scope: !149)
!158 = !DILocation(line: 34, column: 15, scope: !159)
!159 = !DILexicalBlockFile(scope: !160, file: !1, discriminator: 1)
!160 = distinct !DILexicalBlock(scope: !149, file: !1, line: 34, column: 2)
!161 = !DILocation(line: 34, column: 2, scope: !159)
!162 = !DILocation(line: 35, column: 31, scope: !163)
!163 = distinct !DILexicalBlock(scope: !160, file: !1, line: 34, column: 33)
!164 = !DILocation(line: 37, column: 2, scope: !140)
!165 = !DILocation(line: 26, column: 29, scope: !96, inlinedAt: !166)
!166 = distinct !DILocation(line: 35, column: 19, scope: !163)
!167 = !DILocation(line: 27, column: 23, scope: !114, inlinedAt: !166)
!168 = !DILocation(line: 28, column: 2, scope: !111, inlinedAt: !166)
!169 = !DILocation(line: 28, column: 2, scope: !110, inlinedAt: !166)
!170 = !DILocation(line: 28, column: 2, scope: !123, inlinedAt: !166)
!171 = !DILocation(line: 28, column: 2, scope: !126, inlinedAt: !166)
!172 = !DILocation(line: 35, column: 19, scope: !163)
!173 = !DILocation(line: 3, column: 17, scope: !25, inlinedAt: !174)
!174 = distinct !DILocation(line: 28, column: 2, scope: !126, inlinedAt: !166)
!175 = !DILocation(line: 4, column: 21, scope: !8, inlinedAt: !174)
!176 = !DILocation(line: 4, column: 13, scope: !8, inlinedAt: !174)
!177 = !DILocation(line: 28, column: 2, scope: !129, inlinedAt: !166)
!178 = !DILocation(line: 29, column: 39, scope: !96, inlinedAt: !166)
!179 = !DILocation(line: 29, column: 14, scope: !96, inlinedAt: !166)
!180 = !DILocation(line: 29, column: 28, scope: !96, inlinedAt: !166)
!181 = !DILocation(line: 35, column: 3, scope: !163)
!182 = !DILocation(line: 35, column: 17, scope: !163)
!183 = distinct !{!183, !184}
!184 = !DILocation(line: 34, column: 2, scope: !140)
!185 = distinct !DISubprogram(name: "free_NQueen", scope: !1, file: !1, line: 39, type: !186, isLocal: false, isDefinition: true, scopeLine: 39, flags: DIFlagPrototyped, isOptimized: true, unit: !0, variables: !188)
!186 = !DISubroutineType(types: !187)
!187 = !{null, !99}
!188 = !{!189, !190}
!189 = !DILocalVariable(name: "nqueen", arg: 1, scope: !185, file: !1, line: 39, type: !99)
!190 = !DILocalVariable(name: "i", scope: !191, file: !1, line: 40, type: !45)
!191 = distinct !DILexicalBlock(scope: !192, file: !1, line: 40, column: 2)
!192 = distinct !DILexicalBlock(scope: !185, file: !1, line: 40, column: 2)
!193 = !DILocation(line: 39, column: 26, scope: !185)
!194 = !DILocation(line: 40, column: 2, scope: !191)
!195 = !DILocation(line: 40, column: 2, scope: !196)
!196 = !DILexicalBlockFile(scope: !197, file: !1, discriminator: 1)
!197 = distinct !DILexicalBlock(scope: !191, file: !1, line: 40, column: 2)
!198 = !DILocation(line: 40, column: 2, scope: !199)
!199 = !DILexicalBlockFile(scope: !200, file: !1, discriminator: 3)
!200 = distinct !DILexicalBlock(scope: !197, file: !1, line: 40, column: 2)
!201 = !DILocation(line: 40, column: 2, scope: !202)
!202 = !DILexicalBlockFile(scope: !192, file: !1, discriminator: 5)
!203 = !DILocation(line: 41, column: 7, scope: !185)
!204 = !DILocation(line: 41, column: 2, scope: !185)
!205 = !DILocation(line: 42, column: 1, scope: !185)
!206 = !DILocation(line: 16, column: 2, scope: !71, inlinedAt: !207)
!207 = distinct !DILocation(line: 40, column: 2, scope: !199)
!208 = distinct !{!208, !209}
!209 = !DILocation(line: 40, column: 2, scope: !192)
!210 = distinct !DISubprogram(name: "printf_NQueen", scope: !1, file: !1, line: 43, type: !186, isLocal: false, isDefinition: true, scopeLine: 43, flags: DIFlagPrototyped, isOptimized: true, unit: !0, variables: !211)
!211 = !{!212, !213}
!212 = !DILocalVariable(name: "nqueen", arg: 1, scope: !210, file: !1, line: 43, type: !99)
!213 = !DILocalVariable(name: "i", scope: !214, file: !1, line: 46, type: !45)
!214 = distinct !DILexicalBlock(scope: !215, file: !1, line: 46, column: 2)
!215 = distinct !DILexicalBlock(scope: !210, file: !1, line: 46, column: 2)
!216 = !DILocation(line: 43, column: 28, scope: !210)
!217 = !DILocation(line: 44, column: 2, scope: !210)
!218 = !DILocation(line: 45, column: 2, scope: !210)
!219 = !DILocation(line: 46, column: 2, scope: !214)
!220 = !DILocation(line: 46, column: 2, scope: !221)
!221 = !DILexicalBlockFile(scope: !222, file: !1, discriminator: 1)
!222 = distinct !DILexicalBlock(scope: !214, file: !1, line: 46, column: 2)
!223 = !DILocation(line: 46, column: 2, scope: !224)
!224 = !DILexicalBlockFile(scope: !225, file: !1, discriminator: 3)
!225 = distinct !DILexicalBlock(scope: !222, file: !1, line: 46, column: 2)
!226 = !DILocation(line: 47, column: 2, scope: !210)
!227 = !DILocation(line: 48, column: 25, scope: !210)
!228 = !DILocation(line: 48, column: 2, scope: !210)
!229 = !DILocation(line: 49, column: 2, scope: !210)
!230 = !DILocation(line: 50, column: 1, scope: !210)
!231 = !DILocation(line: 18, column: 22, scope: !80, inlinedAt: !232)
!232 = distinct !DILocation(line: 46, column: 2, scope: !224)
!233 = !DILocation(line: 19, column: 2, scope: !80, inlinedAt: !232)
!234 = !DILocation(line: 20, column: 2, scope: !80, inlinedAt: !232)
!235 = !DILocation(line: 21, column: 22, scope: !80, inlinedAt: !232)
!236 = !DILocation(line: 21, column: 2, scope: !80, inlinedAt: !232)
!237 = !DILocation(line: 22, column: 2, scope: !80, inlinedAt: !232)
!238 = !DILocation(line: 23, column: 22, scope: !80, inlinedAt: !232)
!239 = !DILocation(line: 23, column: 2, scope: !80, inlinedAt: !232)
!240 = !DILocation(line: 24, column: 2, scope: !80, inlinedAt: !232)
!241 = distinct !{!241, !242}
!242 = !DILocation(line: 46, column: 2, scope: !215)
!243 = distinct !DISubprogram(name: "nqueen", scope: !1, file: !1, line: 51, type: !244, isLocal: false, isDefinition: true, scopeLine: 51, flags: DIFlagPrototyped, isOptimized: true, unit: !0, variables: !247)
!244 = !DISubroutineType(types: !245)
!245 = !{!99, !17, !38, !17, !246}
!246 = !DIBasicType(name: "_Bool", size: 8, align: 8, encoding: DW_ATE_boolean)
!247 = !{!248, !249, !250, !251, !252, !253, !254, !255, !256}
!248 = !DILocalVariable(name: "num_solutions", arg: 1, scope: !243, file: !1, line: 51, type: !17)
!249 = !DILocalVariable(name: "queens", arg: 2, scope: !243, file: !1, line: 51, type: !38)
!250 = !DILocalVariable(name: "queens_size", arg: 3, scope: !243, file: !1, line: 51, type: !17)
!251 = !DILocalVariable(name: "queens_dealloc", arg: 4, scope: !243, file: !1, line: 51, type: !246)
!252 = !DILocalVariable(name: "nq", scope: !243, file: !1, line: 52, type: !99)
!253 = !DILocalVariable(name: "nq_dealloc", scope: !243, file: !1, line: 53, type: !246)
!254 = !DILocalVariable(name: "_3", scope: !243, file: !1, line: 54, type: !99)
!255 = !DILocalVariable(name: "_3_dealloc", scope: !243, file: !1, line: 55, type: !246)
!256 = !DILocalVariable(name: "i", scope: !257, file: !1, line: 64, type: !45)
!257 = distinct !DILexicalBlock(scope: !258, file: !1, line: 64, column: 2)
!258 = distinct !DILexicalBlock(scope: !259, file: !1, line: 64, column: 2)
!259 = distinct !DILexicalBlock(scope: !260, file: !1, line: 64, column: 2)
!260 = distinct !DILexicalBlock(scope: !243, file: !1, line: 64, column: 2)
!261 = !DILocation(line: 51, column: 26, scope: !243)
!262 = !DILocation(line: 51, column: 47, scope: !243)
!263 = !DILocation(line: 51, column: 65, scope: !243)
!264 = !DIExpression(DW_OP_bit_piece, 0, 1)
!265 = !DILocation(line: 51, column: 78, scope: !243)
!266 = !DILocation(line: 53, column: 2, scope: !243)
!267 = !DILocation(line: 55, column: 2, scope: !243)
!268 = !DILocation(line: 58, column: 7, scope: !243)
!269 = !DILocation(line: 54, column: 10, scope: !243)
!270 = !DILocation(line: 59, column: 6, scope: !243)
!271 = !DILocation(line: 59, column: 20, scope: !243)
!272 = !DILocation(line: 60, column: 2, scope: !243)
!273 = !DILocation(line: 66, column: 2, scope: !243)
!274 = distinct !DISubprogram(name: "conflict", scope: !1, file: !1, line: 70, type: !275, isLocal: false, isDefinition: true, scopeLine: 70, flags: DIFlagPrototyped, isOptimized: true, unit: !0, variables: !277)
!275 = !DISubroutineType(types: !276)
!276 = !{!17, !11, !246, !17, !17}
!277 = !{!278, !279, !280, !281, !282, !283, !284, !285, !286, !287, !288, !289, !290, !291, !292, !293, !294}
!278 = !DILocalVariable(name: "p", arg: 1, scope: !274, file: !1, line: 70, type: !11)
!279 = !DILocalVariable(name: "p_dealloc", arg: 2, scope: !274, file: !1, line: 70, type: !246)
!280 = !DILocalVariable(name: "row", arg: 3, scope: !274, file: !1, line: 70, type: !17)
!281 = !DILocalVariable(name: "col", arg: 4, scope: !274, file: !1, line: 70, type: !17)
!282 = !DILocalVariable(name: "_3", scope: !274, file: !1, line: 71, type: !17)
!283 = !DILocalVariable(name: "r", scope: !274, file: !1, line: 72, type: !17)
!284 = !DILocalVariable(name: "c", scope: !274, file: !1, line: 73, type: !17)
!285 = !DILocalVariable(name: "colDiff", scope: !274, file: !1, line: 74, type: !17)
!286 = !DILocalVariable(name: "rowDiff", scope: !274, file: !1, line: 75, type: !17)
!287 = !DILocalVariable(name: "_8", scope: !274, file: !1, line: 76, type: !17)
!288 = !DILocalVariable(name: "_9", scope: !274, file: !1, line: 77, type: !17)
!289 = !DILocalVariable(name: "_10", scope: !274, file: !1, line: 78, type: !17)
!290 = !DILocalVariable(name: "_11", scope: !274, file: !1, line: 79, type: !17)
!291 = !DILocalVariable(name: "_12", scope: !274, file: !1, line: 80, type: !17)
!292 = !DILocalVariable(name: "_13", scope: !274, file: !1, line: 81, type: !17)
!293 = !DILocalVariable(name: "_14", scope: !274, file: !1, line: 82, type: !17)
!294 = !DILocalVariable(name: "_15", scope: !274, file: !1, line: 83, type: !17)
!295 = !DILocation(line: 70, column: 25, scope: !274)
!296 = !DILocation(line: 70, column: 28, scope: !274)
!297 = !DILocation(line: 70, column: 62, scope: !274)
!298 = !DILocation(line: 70, column: 77, scope: !274)
!299 = !DILocation(line: 72, column: 12, scope: !274)
!300 = !DILocation(line: 73, column: 12, scope: !274)
!301 = !DILocation(line: 74, column: 12, scope: !274)
!302 = !DILocation(line: 75, column: 12, scope: !274)
!303 = !DILocation(line: 76, column: 12, scope: !274)
!304 = !DILocation(line: 77, column: 12, scope: !274)
!305 = !DILocation(line: 79, column: 12, scope: !274)
!306 = !DILocation(line: 80, column: 12, scope: !274)
!307 = !DILocation(line: 81, column: 12, scope: !274)
!308 = !DILocation(line: 82, column: 12, scope: !274)
!309 = !DILocation(line: 85, column: 10, scope: !274)
!310 = !DILocation(line: 89, column: 10, scope: !274)
!311 = !DILocation(line: 93, column: 6, scope: !312)
!312 = distinct !DILexicalBlock(scope: !274, file: !1, line: 93, column: 5)
!313 = !DILocation(line: 95, column: 6, scope: !314)
!314 = distinct !DILexicalBlock(scope: !274, file: !1, line: 95, column: 5)
!315 = !DILocation(line: 93, column: 5, scope: !274)
!316 = !DILocation(line: 78, column: 12, scope: !274)
!317 = !DILocation(line: 101, column: 2, scope: !318)
!318 = distinct !DILexicalBlock(scope: !274, file: !1, line: 101, column: 2)
!319 = !DILocation(line: 15, column: 20, scope: !71, inlinedAt: !320)
!320 = distinct !DILocation(line: 101, column: 2, scope: !321)
!321 = !DILexicalBlockFile(scope: !322, file: !1, discriminator: 1)
!322 = distinct !DILexicalBlock(scope: !323, file: !1, line: 101, column: 2)
!323 = distinct !DILexicalBlock(scope: !318, file: !1, line: 101, column: 2)
!324 = !DILocation(line: 16, column: 7, scope: !71, inlinedAt: !320)
!325 = !DILocation(line: 16, column: 2, scope: !71, inlinedAt: !320)
!326 = !DILocation(line: 101, column: 2, scope: !321)
!327 = !DILocation(line: 106, column: 7, scope: !274)
!328 = !DILocation(line: 108, column: 8, scope: !274)
!329 = !DILocation(line: 112, column: 7, scope: !274)
!330 = !DILocation(line: 114, column: 8, scope: !274)
!331 = !DILocation(line: 118, column: 12, scope: !332)
!332 = distinct !DILexicalBlock(scope: !274, file: !1, line: 118, column: 5)
!333 = !DILocation(line: 126, column: 2, scope: !274)
!334 = !DILocation(line: 130, column: 2, scope: !335)
!335 = distinct !DILexicalBlock(scope: !274, file: !1, line: 130, column: 2)
!336 = !DILocation(line: 15, column: 20, scope: !71, inlinedAt: !337)
!337 = distinct !DILocation(line: 130, column: 2, scope: !338)
!338 = !DILexicalBlockFile(scope: !339, file: !1, discriminator: 1)
!339 = distinct !DILexicalBlock(scope: !340, file: !1, line: 130, column: 2)
!340 = distinct !DILexicalBlock(scope: !335, file: !1, line: 130, column: 2)
!341 = !DILocation(line: 16, column: 7, scope: !71, inlinedAt: !337)
!342 = !DILocation(line: 16, column: 2, scope: !71, inlinedAt: !337)
!343 = !DILocation(line: 130, column: 2, scope: !338)
!344 = !DILocation(line: 133, column: 1, scope: !274)
!345 = distinct !DISubprogram(name: "run", scope: !1, file: !1, line: 135, type: !346, isLocal: false, isDefinition: true, scopeLine: 135, flags: DIFlagPrototyped, isOptimized: true, unit: !0, variables: !348)
!346 = !DISubroutineType(types: !347)
!347 = !{!99, !99, !246, !17, !17}
!348 = !{!349, !350, !351, !352, !353, !354, !355, !356, !357, !358, !359, !360, !361, !362, !363, !364, !365, !366, !367, !368, !369, !370, !371, !372, !373, !374, !375, !376, !377, !378, !379, !380, !381, !382, !383, !384, !385, !386, !387, !388, !389, !390, !391, !392, !393, !394, !395, !396, !397, !398, !399, !400, !401, !402, !403, !408, !413, !418, !423, !428, !433, !438, !443, !448}
!349 = !DILocalVariable(name: "nq", arg: 1, scope: !345, file: !1, line: 135, type: !99)
!350 = !DILocalVariable(name: "nq_dealloc", arg: 2, scope: !345, file: !1, line: 135, type: !246)
!351 = !DILocalVariable(name: "n", arg: 3, scope: !345, file: !1, line: 135, type: !17)
!352 = !DILocalVariable(name: "dim", arg: 4, scope: !345, file: !1, line: 135, type: !17)
!353 = !DILocalVariable(name: "_3", scope: !345, file: !1, line: 136, type: !99)
!354 = !DILocalVariable(name: "_3_dealloc", scope: !345, file: !1, line: 137, type: !246)
!355 = !DILocalVariable(name: "col", scope: !345, file: !1, line: 138, type: !17)
!356 = !DILocalVariable(name: "isSolution", scope: !345, file: !1, line: 139, type: !17)
!357 = !DILocalVariable(name: "i", scope: !345, file: !1, line: 140, type: !17)
!358 = !DILocalVariable(name: "p", scope: !345, file: !1, line: 141, type: !11)
!359 = !DILocalVariable(name: "p_dealloc", scope: !345, file: !1, line: 142, type: !246)
!360 = !DILocalVariable(name: "_8", scope: !345, file: !1, line: 143, type: !17)
!361 = !DILocalVariable(name: "_9", scope: !345, file: !1, line: 144, type: !17)
!362 = !DILocalVariable(name: "_10", scope: !345, file: !1, line: 145, type: !17)
!363 = !DILocalVariable(name: "_11", scope: !345, file: !1, line: 146, type: !17)
!364 = !DILocalVariable(name: "_12", scope: !345, file: !1, line: 147, type: !38)
!365 = !DILocalVariable(name: "_12_size", scope: !345, file: !1, line: 148, type: !17)
!366 = !DILocalVariable(name: "_12_dealloc", scope: !345, file: !1, line: 149, type: !246)
!367 = !DILocalVariable(name: "_13", scope: !345, file: !1, line: 150, type: !17)
!368 = !DILocalVariable(name: "_14", scope: !345, file: !1, line: 151, type: !38)
!369 = !DILocalVariable(name: "_14_size", scope: !345, file: !1, line: 152, type: !17)
!370 = !DILocalVariable(name: "_14_dealloc", scope: !345, file: !1, line: 153, type: !246)
!371 = !DILocalVariable(name: "_15", scope: !345, file: !1, line: 154, type: !17)
!372 = !DILocalVariable(name: "_16", scope: !345, file: !1, line: 155, type: !17)
!373 = !DILocalVariable(name: "_17", scope: !345, file: !1, line: 156, type: !17)
!374 = !DILocalVariable(name: "_18", scope: !345, file: !1, line: 157, type: !38)
!375 = !DILocalVariable(name: "_18_size", scope: !345, file: !1, line: 158, type: !17)
!376 = !DILocalVariable(name: "_18_dealloc", scope: !345, file: !1, line: 159, type: !246)
!377 = !DILocalVariable(name: "_19", scope: !345, file: !1, line: 160, type: !17)
!378 = !DILocalVariable(name: "_20", scope: !345, file: !1, line: 161, type: !17)
!379 = !DILocalVariable(name: "_21", scope: !345, file: !1, line: 162, type: !38)
!380 = !DILocalVariable(name: "_21_size", scope: !345, file: !1, line: 163, type: !17)
!381 = !DILocalVariable(name: "_21_dealloc", scope: !345, file: !1, line: 164, type: !246)
!382 = !DILocalVariable(name: "_22", scope: !345, file: !1, line: 165, type: !17)
!383 = !DILocalVariable(name: "_23", scope: !345, file: !1, line: 166, type: !38)
!384 = !DILocalVariable(name: "_23_size", scope: !345, file: !1, line: 167, type: !17)
!385 = !DILocalVariable(name: "_23_dealloc", scope: !345, file: !1, line: 168, type: !246)
!386 = !DILocalVariable(name: "_24", scope: !345, file: !1, line: 169, type: !11)
!387 = !DILocalVariable(name: "_24_dealloc", scope: !345, file: !1, line: 170, type: !246)
!388 = !DILocalVariable(name: "_25", scope: !345, file: !1, line: 171, type: !17)
!389 = !DILocalVariable(name: "_26", scope: !345, file: !1, line: 172, type: !17)
!390 = !DILocalVariable(name: "_27", scope: !345, file: !1, line: 173, type: !17)
!391 = !DILocalVariable(name: "_28", scope: !345, file: !1, line: 174, type: !17)
!392 = !DILocalVariable(name: "_29", scope: !345, file: !1, line: 175, type: !17)
!393 = !DILocalVariable(name: "_30", scope: !345, file: !1, line: 176, type: !17)
!394 = !DILocalVariable(name: "_31", scope: !345, file: !1, line: 177, type: !17)
!395 = !DILocalVariable(name: "_32", scope: !345, file: !1, line: 178, type: !11)
!396 = !DILocalVariable(name: "_32_dealloc", scope: !345, file: !1, line: 179, type: !246)
!397 = !DILocalVariable(name: "_33", scope: !345, file: !1, line: 180, type: !99)
!398 = !DILocalVariable(name: "_33_dealloc", scope: !345, file: !1, line: 181, type: !246)
!399 = !DILocalVariable(name: "_34", scope: !345, file: !1, line: 182, type: !17)
!400 = !DILocalVariable(name: "_35", scope: !345, file: !1, line: 183, type: !17)
!401 = !DILocalVariable(name: "_36", scope: !345, file: !1, line: 184, type: !17)
!402 = !DILocalVariable(name: "_37", scope: !345, file: !1, line: 185, type: !17)
!403 = !DILocalVariable(name: "i", scope: !404, file: !1, line: 199, type: !45)
!404 = distinct !DILexicalBlock(scope: !405, file: !1, line: 199, column: 2)
!405 = distinct !DILexicalBlock(scope: !406, file: !1, line: 199, column: 2)
!406 = distinct !DILexicalBlock(scope: !407, file: !1, line: 199, column: 2)
!407 = distinct !DILexicalBlock(scope: !345, file: !1, line: 199, column: 2)
!408 = !DILocalVariable(name: "i", scope: !409, file: !1, line: 200, type: !45)
!409 = distinct !DILexicalBlock(scope: !410, file: !1, line: 200, column: 2)
!410 = distinct !DILexicalBlock(scope: !411, file: !1, line: 200, column: 2)
!411 = distinct !DILexicalBlock(scope: !412, file: !1, line: 200, column: 2)
!412 = distinct !DILexicalBlock(scope: !345, file: !1, line: 200, column: 2)
!413 = !DILocalVariable(name: "i", scope: !414, file: !1, line: 201, type: !45)
!414 = distinct !DILexicalBlock(scope: !415, file: !1, line: 201, column: 2)
!415 = distinct !DILexicalBlock(scope: !416, file: !1, line: 201, column: 2)
!416 = distinct !DILexicalBlock(scope: !417, file: !1, line: 201, column: 2)
!417 = distinct !DILexicalBlock(scope: !345, file: !1, line: 201, column: 2)
!418 = !DILocalVariable(name: "i", scope: !419, file: !1, line: 202, type: !45)
!419 = distinct !DILexicalBlock(scope: !420, file: !1, line: 202, column: 2)
!420 = distinct !DILexicalBlock(scope: !421, file: !1, line: 202, column: 2)
!421 = distinct !DILexicalBlock(scope: !422, file: !1, line: 202, column: 2)
!422 = distinct !DILexicalBlock(scope: !345, file: !1, line: 202, column: 2)
!423 = !DILocalVariable(name: "i", scope: !424, file: !1, line: 203, type: !45)
!424 = distinct !DILexicalBlock(scope: !425, file: !1, line: 203, column: 2)
!425 = distinct !DILexicalBlock(scope: !426, file: !1, line: 203, column: 2)
!426 = distinct !DILexicalBlock(scope: !427, file: !1, line: 203, column: 2)
!427 = distinct !DILexicalBlock(scope: !345, file: !1, line: 203, column: 2)
!428 = !DILocalVariable(name: "i", scope: !429, file: !1, line: 379, type: !45)
!429 = distinct !DILexicalBlock(scope: !430, file: !1, line: 379, column: 2)
!430 = distinct !DILexicalBlock(scope: !431, file: !1, line: 379, column: 2)
!431 = distinct !DILexicalBlock(scope: !432, file: !1, line: 379, column: 2)
!432 = distinct !DILexicalBlock(scope: !345, file: !1, line: 379, column: 2)
!433 = !DILocalVariable(name: "i", scope: !434, file: !1, line: 380, type: !45)
!434 = distinct !DILexicalBlock(scope: !435, file: !1, line: 380, column: 2)
!435 = distinct !DILexicalBlock(scope: !436, file: !1, line: 380, column: 2)
!436 = distinct !DILexicalBlock(scope: !437, file: !1, line: 380, column: 2)
!437 = distinct !DILexicalBlock(scope: !345, file: !1, line: 380, column: 2)
!438 = !DILocalVariable(name: "i", scope: !439, file: !1, line: 381, type: !45)
!439 = distinct !DILexicalBlock(scope: !440, file: !1, line: 381, column: 2)
!440 = distinct !DILexicalBlock(scope: !441, file: !1, line: 381, column: 2)
!441 = distinct !DILexicalBlock(scope: !442, file: !1, line: 381, column: 2)
!442 = distinct !DILexicalBlock(scope: !345, file: !1, line: 381, column: 2)
!443 = !DILocalVariable(name: "i", scope: !444, file: !1, line: 382, type: !45)
!444 = distinct !DILexicalBlock(scope: !445, file: !1, line: 382, column: 2)
!445 = distinct !DILexicalBlock(scope: !446, file: !1, line: 382, column: 2)
!446 = distinct !DILexicalBlock(scope: !447, file: !1, line: 382, column: 2)
!447 = distinct !DILexicalBlock(scope: !345, file: !1, line: 382, column: 2)
!448 = !DILocalVariable(name: "i", scope: !449, file: !1, line: 383, type: !45)
!449 = distinct !DILexicalBlock(scope: !450, file: !1, line: 383, column: 2)
!450 = distinct !DILexicalBlock(scope: !451, file: !1, line: 383, column: 2)
!451 = distinct !DILexicalBlock(scope: !452, file: !1, line: 383, column: 2)
!452 = distinct !DILexicalBlock(scope: !345, file: !1, line: 383, column: 2)
!453 = !DILocation(line: 135, column: 21, scope: !345)
!454 = !DILocation(line: 135, column: 25, scope: !345)
!455 = !DILocation(line: 135, column: 60, scope: !345)
!456 = !DILocation(line: 135, column: 73, scope: !345)
!457 = !DILocation(line: 137, column: 2, scope: !345)
!458 = !DILocation(line: 138, column: 12, scope: !345)
!459 = !DILocation(line: 140, column: 12, scope: !345)
!460 = !DILocation(line: 142, column: 2, scope: !345)
!461 = !DILocation(line: 143, column: 12, scope: !345)
!462 = !DILocation(line: 144, column: 12, scope: !345)
!463 = !DILocation(line: 145, column: 12, scope: !345)
!464 = !DILocation(line: 146, column: 12, scope: !345)
!465 = !DILocation(line: 148, column: 12, scope: !345)
!466 = !DILocation(line: 149, column: 2, scope: !345)
!467 = !DILocation(line: 150, column: 12, scope: !345)
!468 = !DILocation(line: 152, column: 12, scope: !345)
!469 = !DILocation(line: 153, column: 2, scope: !345)
!470 = !DILocation(line: 154, column: 12, scope: !345)
!471 = !DILocation(line: 156, column: 12, scope: !345)
!472 = !DILocation(line: 158, column: 12, scope: !345)
!473 = !DILocation(line: 159, column: 2, scope: !345)
!474 = !DILocation(line: 160, column: 12, scope: !345)
!475 = !DILocation(line: 161, column: 12, scope: !345)
!476 = !DILocation(line: 163, column: 12, scope: !345)
!477 = !DILocation(line: 164, column: 2, scope: !345)
!478 = !DILocation(line: 165, column: 12, scope: !345)
!479 = !DILocation(line: 167, column: 12, scope: !345)
!480 = !DILocation(line: 168, column: 2, scope: !345)
!481 = !DILocation(line: 170, column: 2, scope: !345)
!482 = !DILocation(line: 175, column: 12, scope: !345)
!483 = !DILocation(line: 176, column: 12, scope: !345)
!484 = !DILocation(line: 179, column: 2, scope: !345)
!485 = !DILocation(line: 181, column: 2, scope: !345)
!486 = !DILocation(line: 182, column: 12, scope: !345)
!487 = !DILocation(line: 183, column: 12, scope: !345)
!488 = !DILocation(line: 184, column: 12, scope: !345)
!489 = !DILocation(line: 185, column: 12, scope: !345)
!490 = !DILocation(line: 187, column: 8, scope: !491)
!491 = distinct !DILexicalBlock(scope: !345, file: !1, line: 187, column: 5)
!492 = !DILocation(line: 187, column: 5, scope: !345)
!493 = !DILocation(line: 189, column: 11, scope: !345)
!494 = !DILocation(line: 193, column: 8, scope: !345)
!495 = !DILocation(line: 195, column: 20, scope: !345)
!496 = !DILocation(line: 207, column: 2, scope: !345)
!497 = !DILocation(line: 221, column: 4, scope: !498)
!498 = distinct !DILexicalBlock(scope: !499, file: !1, line: 219, column: 3)
!499 = distinct !DILexicalBlock(scope: !345, file: !1, line: 217, column: 13)
!500 = !DILocation(line: 225, column: 8, scope: !501)
!501 = distinct !DILexicalBlock(scope: !498, file: !1, line: 225, column: 7)
!502 = !DILocation(line: 231, column: 10, scope: !503)
!503 = distinct !DILexicalBlock(scope: !498, file: !1, line: 231, column: 7)
!504 = !DILocation(line: 225, column: 7, scope: !498)
!505 = !DILocation(line: 353, column: 8, scope: !499)
!506 = !DILocation(line: 260, column: 8, scope: !507)
!507 = distinct !DILexicalBlock(scope: !508, file: !1, line: 254, column: 4)
!508 = distinct !DILexicalBlock(scope: !499, file: !1, line: 252, column: 14)
!509 = !DILocation(line: 283, column: 8, scope: !510)
!510 = distinct !DILexicalBlock(scope: !508, file: !1, line: 283, column: 7)
!511 = !DILocation(line: 235, column: 12, scope: !498)
!512 = !DILocation(line: 235, column: 4, scope: !498)
!513 = !DILocation(line: 236, column: 4, scope: !498)
!514 = !DILocation(line: 242, column: 9, scope: !515)
!515 = distinct !DILexicalBlock(scope: !499, file: !1, line: 242, column: 6)
!516 = !DILocation(line: 242, column: 6, scope: !499)
!517 = !DILocation(line: 283, column: 7, scope: !508)
!518 = !DILocation(line: 276, column: 13, scope: !507)
!519 = !DILocation(line: 276, column: 5, scope: !507)
!520 = !DILocation(line: 277, column: 5, scope: !507)
!521 = !DILocation(line: 166, column: 8, scope: !345)
!522 = !DILocation(line: 169, column: 7, scope: !345)
!523 = !DILocation(line: 141, column: 7, scope: !345)
!524 = !DILocation(line: 171, column: 12, scope: !345)
!525 = !DILocation(line: 256, column: 5, scope: !507)
!526 = !DILocation(line: 287, column: 8, scope: !508)
!527 = !DILocation(line: 70, column: 25, scope: !274, inlinedAt: !528)
!528 = distinct !DILocation(line: 302, column: 10, scope: !508)
!529 = !DILocation(line: 70, column: 28, scope: !274, inlinedAt: !528)
!530 = !DILocation(line: 70, column: 62, scope: !274, inlinedAt: !528)
!531 = !DILocation(line: 70, column: 77, scope: !274, inlinedAt: !528)
!532 = !DILocation(line: 72, column: 12, scope: !274, inlinedAt: !528)
!533 = !DILocation(line: 73, column: 12, scope: !274, inlinedAt: !528)
!534 = !DILocation(line: 74, column: 12, scope: !274, inlinedAt: !528)
!535 = !DILocation(line: 75, column: 12, scope: !274, inlinedAt: !528)
!536 = !DILocation(line: 76, column: 12, scope: !274, inlinedAt: !528)
!537 = !DILocation(line: 77, column: 12, scope: !274, inlinedAt: !528)
!538 = !DILocation(line: 79, column: 12, scope: !274, inlinedAt: !528)
!539 = !DILocation(line: 80, column: 12, scope: !274, inlinedAt: !528)
!540 = !DILocation(line: 81, column: 12, scope: !274, inlinedAt: !528)
!541 = !DILocation(line: 82, column: 12, scope: !274, inlinedAt: !528)
!542 = !DILocation(line: 85, column: 10, scope: !274, inlinedAt: !528)
!543 = !DILocation(line: 89, column: 10, scope: !274, inlinedAt: !528)
!544 = !DILocation(line: 93, column: 6, scope: !312, inlinedAt: !528)
!545 = !DILocation(line: 95, column: 6, scope: !314, inlinedAt: !528)
!546 = !DILocation(line: 93, column: 5, scope: !274, inlinedAt: !528)
!547 = !DILocation(line: 106, column: 7, scope: !274, inlinedAt: !528)
!548 = !DILocation(line: 108, column: 8, scope: !274, inlinedAt: !528)
!549 = !DILocation(line: 112, column: 7, scope: !274, inlinedAt: !528)
!550 = !DILocation(line: 114, column: 8, scope: !274, inlinedAt: !528)
!551 = !DILocation(line: 118, column: 12, scope: !332, inlinedAt: !528)
!552 = !DILocation(line: 126, column: 2, scope: !274, inlinedAt: !528)
!553 = !DILocation(line: 302, column: 10, scope: !508)
!554 = !DILocation(line: 172, column: 12, scope: !345)
!555 = !DILocation(line: 173, column: 12, scope: !345)
!556 = !DILocation(line: 174, column: 12, scope: !345)
!557 = !DILocation(line: 306, column: 7, scope: !508)
!558 = !DILocation(line: 139, column: 12, scope: !345)
!559 = !DILocation(line: 328, column: 9, scope: !508)
!560 = !DILocation(line: 177, column: 12, scope: !345)
!561 = !DILocation(line: 339, column: 6, scope: !499)
!562 = !DILocation(line: 342, column: 9, scope: !499)
!563 = !DILocation(line: 343, column: 8, scope: !499)
!564 = !DILocation(line: 343, column: 10, scope: !499)
!565 = !DILocation(line: 344, column: 8, scope: !499)
!566 = !DILocation(line: 344, column: 10, scope: !499)
!567 = !DILocation(line: 347, column: 3, scope: !568)
!568 = distinct !DILexicalBlock(scope: !569, file: !1, line: 347, column: 3)
!569 = distinct !DILexicalBlock(scope: !499, file: !1, line: 347, column: 3)
!570 = !DILocation(line: 347, column: 3, scope: !569)
!571 = !DILocation(line: 347, column: 3, scope: !572)
!572 = !DILexicalBlockFile(scope: !573, file: !1, discriminator: 1)
!573 = distinct !DILexicalBlock(scope: !568, file: !1, line: 347, column: 3)
!574 = !DILocation(line: 16, column: 2, scope: !71, inlinedAt: !575)
!575 = distinct !DILocation(line: 347, column: 3, scope: !572)
!576 = !DILocation(line: 348, column: 7, scope: !499)
!577 = !DILocation(line: 348, column: 3, scope: !499)
!578 = !DILocation(line: 348, column: 17, scope: !499)
!579 = !DILocation(line: 356, column: 9, scope: !499)
!580 = !DILocation(line: 180, column: 10, scope: !345)
!581 = !DILocation(line: 362, column: 3, scope: !499)
!582 = !DILocation(line: 368, column: 10, scope: !499)
!583 = distinct !{!583, !584}
!584 = !DILocation(line: 217, column: 2, scope: !345)
!585 = !DILocation(line: 391, column: 1, scope: !586)
!586 = !DILexicalBlockFile(scope: !345, file: !1, discriminator: 2)
!587 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 393, type: !588, isLocal: false, isDefinition: true, scopeLine: 393, flags: DIFlagPrototyped, isOptimized: true, unit: !0, variables: !593)
!588 = !DISubroutineType(types: !589)
!589 = !{!45, !45, !590}
!590 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !591, size: 64, align: 64)
!591 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !592, size: 64, align: 64)
!592 = !DIBasicType(name: "char", size: 8, align: 8, encoding: DW_ATE_signed_char)
!593 = !{!594, !595, !596, !598, !599, !600, !601, !602, !603, !604, !605, !606, !607, !608, !610, !611, !612, !613, !614, !615, !616, !617, !618, !619, !620, !621, !622, !623, !624, !625, !626, !627, !628, !629, !630, !631, !632, !633, !634, !635, !636, !637, !638, !639, !640, !641, !642, !643, !644, !645, !646, !647, !648, !649, !654, !657, !662, !665, !670}
!594 = !DILocalVariable(name: "argc", arg: 1, scope: !587, file: !1, line: 393, type: !45)
!595 = !DILocalVariable(name: "args", arg: 2, scope: !587, file: !1, line: 393, type: !590)
!596 = !DILocalVariable(name: "max", scope: !587, file: !1, line: 394, type: !597)
!597 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !17, size: 64, align: 64)
!598 = !DILocalVariable(name: "max_dealloc", scope: !587, file: !1, line: 395, type: !246)
!599 = !DILocalVariable(name: "n", scope: !587, file: !1, line: 396, type: !17)
!600 = !DILocalVariable(name: "queens", scope: !587, file: !1, line: 397, type: !38)
!601 = !DILocalVariable(name: "queens_size", scope: !587, file: !1, line: 398, type: !17)
!602 = !DILocalVariable(name: "queens_dealloc", scope: !587, file: !1, line: 399, type: !246)
!603 = !DILocalVariable(name: "num_solutions", scope: !587, file: !1, line: 400, type: !17)
!604 = !DILocalVariable(name: "nq", scope: !587, file: !1, line: 401, type: !99)
!605 = !DILocalVariable(name: "nq_dealloc", scope: !587, file: !1, line: 402, type: !246)
!606 = !DILocalVariable(name: "_6", scope: !587, file: !1, line: 403, type: !597)
!607 = !DILocalVariable(name: "_6_dealloc", scope: !587, file: !1, line: 404, type: !246)
!608 = !DILocalVariable(name: "_7", scope: !587, file: !1, line: 405, type: !609)
!609 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !597, size: 64, align: 64)
!610 = !DILocalVariable(name: "_7_size", scope: !587, file: !1, line: 405, type: !17)
!611 = !DILocalVariable(name: "_7_size_size", scope: !587, file: !1, line: 405, type: !17)
!612 = !DILocalVariable(name: "_7_dealloc", scope: !587, file: !1, line: 406, type: !246)
!613 = !DILocalVariable(name: "_8", scope: !587, file: !1, line: 407, type: !17)
!614 = !DILocalVariable(name: "_9", scope: !587, file: !1, line: 408, type: !597)
!615 = !DILocalVariable(name: "_9_size", scope: !587, file: !1, line: 408, type: !17)
!616 = !DILocalVariable(name: "_9_dealloc", scope: !587, file: !1, line: 409, type: !246)
!617 = !DILocalVariable(name: "_10", scope: !587, file: !1, line: 410, type: !17)
!618 = !DILocalVariable(name: "_11", scope: !587, file: !1, line: 411, type: !17)
!619 = !DILocalVariable(name: "_12", scope: !587, file: !1, line: 412, type: !11)
!620 = !DILocalVariable(name: "_12_dealloc", scope: !587, file: !1, line: 413, type: !246)
!621 = !DILocalVariable(name: "_13", scope: !587, file: !1, line: 414, type: !38)
!622 = !DILocalVariable(name: "_13_size", scope: !587, file: !1, line: 415, type: !17)
!623 = !DILocalVariable(name: "_13_dealloc", scope: !587, file: !1, line: 416, type: !246)
!624 = !DILocalVariable(name: "_14", scope: !587, file: !1, line: 417, type: !17)
!625 = !DILocalVariable(name: "_15", scope: !587, file: !1, line: 418, type: !99)
!626 = !DILocalVariable(name: "_15_dealloc", scope: !587, file: !1, line: 419, type: !246)
!627 = !DILocalVariable(name: "_16", scope: !587, file: !1, line: 420, type: !99)
!628 = !DILocalVariable(name: "_16_dealloc", scope: !587, file: !1, line: 421, type: !246)
!629 = !DILocalVariable(name: "_17", scope: !587, file: !1, line: 422, type: !17)
!630 = !DILocalVariable(name: "_18", scope: !587, file: !1, line: 423, type: !4)
!631 = !DILocalVariable(name: "_20", scope: !587, file: !1, line: 424, type: !597)
!632 = !DILocalVariable(name: "_20_size", scope: !587, file: !1, line: 424, type: !17)
!633 = !DILocalVariable(name: "_20_dealloc", scope: !587, file: !1, line: 425, type: !246)
!634 = !DILocalVariable(name: "_21", scope: !587, file: !1, line: 426, type: !4)
!635 = !DILocalVariable(name: "_23", scope: !587, file: !1, line: 427, type: !597)
!636 = !DILocalVariable(name: "_23_size", scope: !587, file: !1, line: 427, type: !17)
!637 = !DILocalVariable(name: "_23_dealloc", scope: !587, file: !1, line: 428, type: !246)
!638 = !DILocalVariable(name: "_24", scope: !587, file: !1, line: 429, type: !4)
!639 = !DILocalVariable(name: "_26", scope: !587, file: !1, line: 430, type: !4)
!640 = !DILocalVariable(name: "_28", scope: !587, file: !1, line: 431, type: !597)
!641 = !DILocalVariable(name: "_28_size", scope: !587, file: !1, line: 431, type: !17)
!642 = !DILocalVariable(name: "_28_dealloc", scope: !587, file: !1, line: 432, type: !246)
!643 = !DILocalVariable(name: "_29", scope: !587, file: !1, line: 433, type: !4)
!644 = !DILocalVariable(name: "_31", scope: !587, file: !1, line: 434, type: !17)
!645 = !DILocalVariable(name: "_32", scope: !587, file: !1, line: 435, type: !4)
!646 = !DILocalVariable(name: "_34", scope: !587, file: !1, line: 436, type: !597)
!647 = !DILocalVariable(name: "_34_size", scope: !587, file: !1, line: 436, type: !17)
!648 = !DILocalVariable(name: "_34_dealloc", scope: !587, file: !1, line: 437, type: !246)
!649 = !DILocalVariable(name: "i", scope: !650, file: !1, line: 468, type: !45)
!650 = distinct !DILexicalBlock(scope: !651, file: !1, line: 468, column: 2)
!651 = distinct !DILexicalBlock(scope: !652, file: !1, line: 468, column: 2)
!652 = distinct !DILexicalBlock(scope: !653, file: !1, line: 468, column: 2)
!653 = distinct !DILexicalBlock(scope: !587, file: !1, line: 468, column: 2)
!654 = !DILocalVariable(name: "i", scope: !655, file: !1, line: 469, type: !45)
!655 = distinct !DILexicalBlock(scope: !656, file: !1, line: 469, column: 2)
!656 = distinct !DILexicalBlock(scope: !587, file: !1, line: 469, column: 2)
!657 = !DILocalVariable(name: "i", scope: !658, file: !1, line: 472, type: !45)
!658 = distinct !DILexicalBlock(scope: !659, file: !1, line: 472, column: 2)
!659 = distinct !DILexicalBlock(scope: !660, file: !1, line: 472, column: 2)
!660 = distinct !DILexicalBlock(scope: !661, file: !1, line: 472, column: 2)
!661 = distinct !DILexicalBlock(scope: !587, file: !1, line: 472, column: 2)
!662 = !DILocalVariable(name: "i", scope: !663, file: !1, line: 473, type: !45)
!663 = distinct !DILexicalBlock(scope: !664, file: !1, line: 473, column: 2)
!664 = distinct !DILexicalBlock(scope: !587, file: !1, line: 473, column: 2)
!665 = !DILocalVariable(name: "i", scope: !666, file: !1, line: 549, type: !45)
!666 = distinct !DILexicalBlock(scope: !667, file: !1, line: 549, column: 2)
!667 = distinct !DILexicalBlock(scope: !668, file: !1, line: 549, column: 2)
!668 = distinct !DILexicalBlock(scope: !669, file: !1, line: 549, column: 2)
!669 = distinct !DILexicalBlock(scope: !587, file: !1, line: 549, column: 2)
!670 = !DILocalVariable(name: "i", scope: !671, file: !1, line: 555, type: !45)
!671 = distinct !DILexicalBlock(scope: !672, file: !1, line: 555, column: 2)
!672 = distinct !DILexicalBlock(scope: !673, file: !1, line: 555, column: 2)
!673 = distinct !DILexicalBlock(scope: !674, file: !1, line: 555, column: 2)
!674 = distinct !DILexicalBlock(scope: !587, file: !1, line: 555, column: 2)
!675 = !DILocation(line: 393, column: 14, scope: !587)
!676 = !DILocation(line: 393, column: 27, scope: !587)
!677 = !DILocation(line: 395, column: 2, scope: !587)
!678 = !DILocation(line: 396, column: 12, scope: !587)
!679 = !DILocation(line: 398, column: 12, scope: !587)
!680 = !DILocation(line: 399, column: 2, scope: !587)
!681 = !DILocation(line: 400, column: 12, scope: !587)
!682 = !DILocation(line: 402, column: 2, scope: !587)
!683 = !DILocation(line: 404, column: 2, scope: !587)
!684 = !DILocation(line: 405, column: 2, scope: !587)
!685 = !DILocation(line: 406, column: 2, scope: !587)
!686 = !DILocation(line: 407, column: 12, scope: !587)
!687 = !DILocation(line: 408, column: 2, scope: !587)
!688 = !DILocation(line: 409, column: 2, scope: !587)
!689 = !DILocation(line: 410, column: 12, scope: !587)
!690 = !DILocation(line: 411, column: 12, scope: !587)
!691 = !DILocation(line: 413, column: 2, scope: !587)
!692 = !DILocation(line: 415, column: 12, scope: !587)
!693 = !DILocation(line: 416, column: 2, scope: !587)
!694 = !DILocation(line: 417, column: 12, scope: !587)
!695 = !DILocation(line: 419, column: 2, scope: !587)
!696 = !DILocation(line: 421, column: 2, scope: !587)
!697 = !DILocation(line: 422, column: 12, scope: !587)
!698 = !DILocation(line: 424, column: 2, scope: !587)
!699 = !DILocation(line: 425, column: 2, scope: !587)
!700 = !DILocation(line: 427, column: 2, scope: !587)
!701 = !DILocation(line: 428, column: 2, scope: !587)
!702 = !DILocation(line: 431, column: 2, scope: !587)
!703 = !DILocation(line: 432, column: 2, scope: !587)
!704 = !DILocation(line: 434, column: 12, scope: !587)
!705 = !DILocation(line: 436, column: 2, scope: !587)
!706 = !DILocation(line: 437, column: 2, scope: !587)
!707 = !DILocation(line: 439, column: 2, scope: !587)
!708 = !DILocation(line: 443, column: 5, scope: !587)
!709 = !DILocation(line: 446, column: 2, scope: !587)
!710 = !DILocation(line: 403, column: 13, scope: !587)
!711 = !DILocation(line: 394, column: 13, scope: !587)
!712 = !DILocation(line: 454, column: 9, scope: !713)
!713 = distinct !DILexicalBlock(scope: !587, file: !1, line: 454, column: 5)
!714 = !DILocation(line: 454, column: 5, scope: !587)
!715 = !DILocation(line: 456, column: 6, scope: !587)
!716 = !DILocation(line: 469, column: 2, scope: !656)
!717 = !DILocation(line: 414, column: 8, scope: !587)
!718 = !DILocation(line: 469, column: 2, scope: !655)
!719 = !DILocation(line: 469, column: 2, scope: !720)
!720 = !DILexicalBlockFile(scope: !721, file: !1, discriminator: 1)
!721 = distinct !DILexicalBlock(scope: !655, file: !1, line: 469, column: 2)
!722 = !DILocation(line: 3, column: 17, scope: !25, inlinedAt: !723)
!723 = distinct !DILocation(line: 469, column: 2, scope: !724)
!724 = !DILexicalBlockFile(scope: !725, file: !1, discriminator: 3)
!725 = distinct !DILexicalBlock(scope: !721, file: !1, line: 469, column: 2)
!726 = !DILocation(line: 473, column: 2, scope: !664)
!727 = !DILocation(line: 397, column: 8, scope: !587)
!728 = !DILocation(line: 473, column: 2, scope: !663)
!729 = !DILocation(line: 473, column: 2, scope: !730)
!730 = !DILexicalBlockFile(scope: !731, file: !1, discriminator: 1)
!731 = distinct !DILexicalBlock(scope: !663, file: !1, line: 473, column: 2)
!732 = !DILocation(line: 469, column: 2, scope: !724)
!733 = !DILocation(line: 5, column: 13, scope: !8, inlinedAt: !723)
!734 = distinct !{!734, !716}
!735 = !DILocation(line: 473, column: 2, scope: !736)
!736 = !DILexicalBlockFile(scope: !737, file: !1, discriminator: 3)
!737 = distinct !DILexicalBlock(scope: !731, file: !1, line: 473, column: 2)
!738 = !DILocation(line: 3, column: 17, scope: !25, inlinedAt: !739)
!739 = distinct !DILocation(line: 473, column: 2, scope: !736)
!740 = !DILocation(line: 4, column: 21, scope: !8, inlinedAt: !739)
!741 = !DILocation(line: 4, column: 13, scope: !8, inlinedAt: !739)
!742 = distinct !{!742, !726}
!743 = !DILocation(line: 51, column: 26, scope: !243, inlinedAt: !744)
!744 = distinct !DILocation(line: 481, column: 8, scope: !587)
!745 = !DILocation(line: 51, column: 47, scope: !243, inlinedAt: !744)
!746 = !DILocation(line: 51, column: 65, scope: !243, inlinedAt: !744)
!747 = !DILocation(line: 51, column: 78, scope: !243, inlinedAt: !744)
!748 = !DILocation(line: 53, column: 2, scope: !243, inlinedAt: !744)
!749 = !DILocation(line: 55, column: 2, scope: !243, inlinedAt: !744)
!750 = !DILocation(line: 58, column: 7, scope: !243, inlinedAt: !744)
!751 = !DILocation(line: 54, column: 10, scope: !243, inlinedAt: !744)
!752 = !DILocation(line: 59, column: 6, scope: !243, inlinedAt: !744)
!753 = !DILocation(line: 59, column: 20, scope: !243, inlinedAt: !744)
!754 = !DILocation(line: 60, column: 2, scope: !243, inlinedAt: !744)
!755 = !DILocation(line: 418, column: 10, scope: !587)
!756 = !DILocation(line: 401, column: 10, scope: !587)
!757 = !DILocation(line: 492, column: 8, scope: !587)
!758 = !DILocation(line: 420, column: 10, scope: !587)
!759 = !DILocation(line: 503, column: 2, scope: !587)
!760 = !DILocation(line: 504, column: 9, scope: !587)
!761 = !DILocation(line: 504, column: 28, scope: !587)
!762 = !DILocation(line: 504, column: 35, scope: !587)
!763 = !DILocation(line: 504, column: 55, scope: !587)
!764 = !DILocation(line: 504, column: 62, scope: !587)
!765 = !DILocation(line: 504, column: 83, scope: !587)
!766 = !DILocation(line: 504, column: 90, scope: !587)
!767 = !DILocation(line: 504, column: 110, scope: !587)
!768 = !DILocation(line: 504, column: 117, scope: !587)
!769 = !DILocation(line: 504, column: 137, scope: !587)
!770 = !DILocation(line: 504, column: 145, scope: !587)
!771 = !DILocation(line: 504, column: 166, scope: !587)
!772 = !DILocation(line: 504, column: 174, scope: !587)
!773 = !DILocation(line: 504, column: 196, scope: !587)
!774 = !DILocation(line: 504, column: 204, scope: !587)
!775 = !DILocation(line: 504, column: 225, scope: !587)
!776 = !DILocation(line: 504, column: 233, scope: !587)
!777 = !DILocation(line: 504, column: 255, scope: !587)
!778 = !DILocation(line: 504, column: 263, scope: !587)
!779 = !DILocation(line: 504, column: 283, scope: !587)
!780 = !DILocation(line: 504, column: 291, scope: !587)
!781 = !DILocation(line: 504, column: 311, scope: !587)
!782 = !DILocation(line: 504, column: 319, scope: !587)
!783 = !DILocation(line: 504, column: 339, scope: !587)
!784 = !DILocation(line: 504, column: 347, scope: !587)
!785 = !DILocation(line: 504, column: 367, scope: !587)
!786 = !DILocation(line: 504, column: 375, scope: !587)
!787 = !DILocation(line: 504, column: 395, scope: !587)
!788 = !DILocation(line: 504, column: 403, scope: !587)
!789 = !DILocation(line: 504, column: 424, scope: !587)
!790 = !DILocation(line: 504, column: 432, scope: !587)
!791 = !DILocation(line: 504, column: 454, scope: !587)
!792 = !DILocation(line: 504, column: 462, scope: !587)
!793 = !DILocation(line: 507, column: 2, scope: !587)
!794 = !DILocation(line: 512, column: 2, scope: !587)
!795 = !DILocation(line: 513, column: 9, scope: !587)
!796 = !DILocation(line: 513, column: 28, scope: !587)
!797 = !DILocation(line: 513, column: 35, scope: !587)
!798 = !DILocation(line: 516, column: 2, scope: !587)
!799 = !DILocation(line: 520, column: 2, scope: !587)
!800 = !DILocation(line: 525, column: 2, scope: !587)
!801 = !DILocation(line: 526, column: 9, scope: !587)
!802 = !DILocation(line: 526, column: 29, scope: !587)
!803 = !DILocation(line: 526, column: 36, scope: !587)
!804 = !DILocation(line: 526, column: 57, scope: !587)
!805 = !DILocation(line: 526, column: 64, scope: !587)
!806 = !DILocation(line: 529, column: 2, scope: !587)
!807 = !DILocation(line: 533, column: 12, scope: !587)
!808 = !DILocation(line: 535, column: 2, scope: !587)
!809 = !DILocation(line: 540, column: 2, scope: !587)
!810 = !DILocation(line: 541, column: 9, scope: !587)
!811 = !DILocation(line: 541, column: 29, scope: !587)
!812 = !DILocation(line: 541, column: 36, scope: !587)
!813 = !DILocation(line: 541, column: 57, scope: !587)
!814 = !DILocation(line: 541, column: 64, scope: !587)
!815 = !DILocation(line: 541, column: 85, scope: !587)
!816 = !DILocation(line: 541, column: 92, scope: !587)
!817 = !DILocation(line: 541, column: 113, scope: !587)
!818 = !DILocation(line: 541, column: 120, scope: !587)
!819 = !DILocation(line: 541, column: 141, scope: !587)
!820 = !DILocation(line: 541, column: 149, scope: !587)
!821 = !DILocation(line: 544, column: 2, scope: !587)
!822 = !DILocation(line: 548, column: 2, scope: !823)
!823 = !DILexicalBlockFile(scope: !824, file: !1, discriminator: 1)
!824 = distinct !DILexicalBlock(scope: !825, file: !1, line: 548, column: 2)
!825 = distinct !DILexicalBlock(scope: !826, file: !1, line: 548, column: 2)
!826 = distinct !DILexicalBlock(scope: !587, file: !1, line: 548, column: 2)
!827 = !DILocation(line: 39, column: 26, scope: !185, inlinedAt: !828)
!828 = distinct !DILocation(line: 550, column: 2, scope: !829)
!829 = !DILexicalBlockFile(scope: !830, file: !1, discriminator: 1)
!830 = distinct !DILexicalBlock(scope: !831, file: !1, line: 550, column: 2)
!831 = distinct !DILexicalBlock(scope: !832, file: !1, line: 550, column: 2)
!832 = distinct !DILexicalBlock(scope: !587, file: !1, line: 550, column: 2)
!833 = !DILocation(line: 40, column: 2, scope: !191, inlinedAt: !828)
!834 = !DILocation(line: 40, column: 2, scope: !196, inlinedAt: !828)
!835 = !DILocation(line: 40, column: 2, scope: !199, inlinedAt: !828)
!836 = !DILocation(line: 550, column: 2, scope: !829)
!837 = !DILocation(line: 16, column: 2, scope: !71, inlinedAt: !838)
!838 = distinct !DILocation(line: 40, column: 2, scope: !199, inlinedAt: !828)
!839 = !DILocation(line: 40, column: 2, scope: !202, inlinedAt: !828)
!840 = !DILocation(line: 41, column: 7, scope: !185, inlinedAt: !828)
!841 = !DILocation(line: 41, column: 2, scope: !185, inlinedAt: !828)
!842 = !DILocation(line: 15, column: 20, scope: !71, inlinedAt: !843)
!843 = distinct !DILocation(line: 554, column: 2, scope: !844)
!844 = !DILexicalBlockFile(scope: !845, file: !1, discriminator: 1)
!845 = distinct !DILexicalBlock(scope: !846, file: !1, line: 554, column: 2)
!846 = distinct !DILexicalBlock(scope: !847, file: !1, line: 554, column: 2)
!847 = distinct !DILexicalBlock(scope: !587, file: !1, line: 554, column: 2)
!848 = !DILocation(line: 412, column: 7, scope: !587)
!849 = !DILocation(line: 558, column: 2, scope: !850)
!850 = !DILexicalBlockFile(scope: !851, file: !1, discriminator: 1)
!851 = distinct !DILexicalBlock(scope: !852, file: !1, line: 558, column: 2)
!852 = distinct !DILexicalBlock(scope: !853, file: !1, line: 558, column: 2)
!853 = distinct !DILexicalBlock(scope: !587, file: !1, line: 558, column: 2)
!854 = !DILocation(line: 559, column: 2, scope: !855)
!855 = !DILexicalBlockFile(scope: !856, file: !1, discriminator: 1)
!856 = distinct !DILexicalBlock(scope: !857, file: !1, line: 559, column: 2)
!857 = distinct !DILexicalBlock(scope: !858, file: !1, line: 559, column: 2)
!858 = distinct !DILexicalBlock(scope: !587, file: !1, line: 559, column: 2)
!859 = !DILocation(line: 560, column: 2, scope: !860)
!860 = !DILexicalBlockFile(scope: !861, file: !1, discriminator: 1)
!861 = distinct !DILexicalBlock(scope: !862, file: !1, line: 560, column: 2)
!862 = distinct !DILexicalBlock(scope: !863, file: !1, line: 560, column: 2)
!863 = distinct !DILexicalBlock(scope: !587, file: !1, line: 560, column: 2)
!864 = !DILocation(line: 561, column: 2, scope: !865)
!865 = !DILexicalBlockFile(scope: !866, file: !1, discriminator: 1)
!866 = distinct !DILexicalBlock(scope: !867, file: !1, line: 561, column: 2)
!867 = distinct !DILexicalBlock(scope: !868, file: !1, line: 561, column: 2)
!868 = distinct !DILexicalBlock(scope: !587, file: !1, line: 561, column: 2)
!869 = !DILocation(line: 562, column: 2, scope: !587)
