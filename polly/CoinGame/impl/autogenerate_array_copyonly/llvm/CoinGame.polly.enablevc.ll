; ModuleID = 'CoinGame.c'
source_filename = "CoinGame.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [6 x i8] c"%lld\0A\00", align 1

; Function Attrs: nounwind uwtable
define i64* @findMoves(i64* %moves, i64 %moves_size, i64 %n) #0 !dbg !8 {
entry:
  tail call void @llvm.dbg.value(metadata i64* %moves, i64 0, metadata !14, metadata !93), !dbg !94
  tail call void @llvm.dbg.value(metadata i64 %moves_size, i64 0, metadata !15, metadata !93), !dbg !94
  tail call void @llvm.dbg.value(metadata i64 %n, i64 0, metadata !16, metadata !93), !dbg !95
  tail call void @llvm.dbg.value(metadata i64* null, i64 0, metadata !17, metadata !93), !dbg !96
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !18, metadata !93), !dbg !96
  tail call void @llvm.dbg.value(metadata i64* null, i64 0, metadata !19, metadata !93), !dbg !97
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !20, metadata !93), !dbg !97
  tail call void @llvm.dbg.value(metadata i64* null, i64 0, metadata !21, metadata !93), !dbg !98
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !22, metadata !93), !dbg !98
  tail call void @llvm.dbg.value(metadata i64* null, i64 0, metadata !23, metadata !93), !dbg !99
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !24, metadata !93), !dbg !99
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !25, metadata !93), !dbg !100
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !26, metadata !93), !dbg !101
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !27, metadata !93), !dbg !102
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !28, metadata !93), !dbg !103
  tail call void @llvm.dbg.value(metadata i64* null, i64 0, metadata !29, metadata !93), !dbg !104
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !30, metadata !93), !dbg !104
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !31, metadata !93), !dbg !105
  tail call void @llvm.dbg.value(metadata i64* null, i64 0, metadata !32, metadata !93), !dbg !106
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !33, metadata !93), !dbg !106
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !34, metadata !93), !dbg !107
  tail call void @llvm.dbg.value(metadata i64* null, i64 0, metadata !35, metadata !93), !dbg !108
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !36, metadata !93), !dbg !108
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !37, metadata !93), !dbg !109
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !38, metadata !93), !dbg !110
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !39, metadata !93), !dbg !111
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !40, metadata !93), !dbg !112
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !41, metadata !93), !dbg !113
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !42, metadata !93), !dbg !114
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !43, metadata !93), !dbg !115
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !44, metadata !93), !dbg !116
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !45, metadata !93), !dbg !117
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !46, metadata !93), !dbg !118
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !47, metadata !93), !dbg !119
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !48, metadata !93), !dbg !120
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !49, metadata !93), !dbg !121
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !50, metadata !93), !dbg !122
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !51, metadata !93), !dbg !123
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !52, metadata !93), !dbg !124
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !53, metadata !93), !dbg !125
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !54, metadata !93), !dbg !126
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !55, metadata !93), !dbg !127
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !56, metadata !93), !dbg !128
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !57, metadata !93), !dbg !129
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !58, metadata !93), !dbg !130
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !59, metadata !93), !dbg !131
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !60, metadata !93), !dbg !132
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !61, metadata !93), !dbg !133
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !62, metadata !93), !dbg !134
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !63, metadata !93), !dbg !135
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !64, metadata !93), !dbg !136
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !65, metadata !93), !dbg !137
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !66, metadata !93), !dbg !138
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !67, metadata !93), !dbg !139
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !68, metadata !93), !dbg !140
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !69, metadata !93), !dbg !141
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !70, metadata !93), !dbg !142
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !71, metadata !93), !dbg !143
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !72, metadata !93), !dbg !144
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !73, metadata !93), !dbg !145
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !74, metadata !93), !dbg !146
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !75, metadata !93), !dbg !147
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !76, metadata !93), !dbg !148
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !77, metadata !93), !dbg !149
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !78, metadata !93), !dbg !150
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !79, metadata !93), !dbg !151
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !80, metadata !93), !dbg !152
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !81, metadata !93), !dbg !153
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !82, metadata !93), !dbg !154
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !83, metadata !93), !dbg !155
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !84, metadata !93), !dbg !156
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !85, metadata !93), !dbg !157
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !86, metadata !93), !dbg !158
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !87, metadata !93), !dbg !159
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !88, metadata !93), !dbg !160
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !89, metadata !93), !dbg !161
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !90, metadata !93), !dbg !162
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !91, metadata !93), !dbg !163
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !92, metadata !93), !dbg !164
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !28, metadata !93), !dbg !103
  tail call void @llvm.dbg.value(metadata i64 %n, i64 0, metadata !30, metadata !93), !dbg !104
  %conv1 = trunc i64 %n to i32, !dbg !165
  %call = tail call i64* @gen1DArray(i32 0, i32 %conv1) #7, !dbg !165
  %call392 = bitcast i64* %call to i8*
  tail call void @llvm.dbg.value(metadata i64* %call, i64 0, metadata !29, metadata !93), !dbg !104
  tail call void @llvm.dbg.value(metadata i64 %n, i64 0, metadata !20, metadata !93), !dbg !97
  tail call void @llvm.dbg.value(metadata i64* %call, i64 0, metadata !19, metadata !93), !dbg !97
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !31, metadata !93), !dbg !105
  tail call void @llvm.dbg.value(metadata i64 %n, i64 0, metadata !33, metadata !93), !dbg !106
  %call4 = tail call i64* @gen1DArray(i32 0, i32 %conv1) #7, !dbg !166
  %call4391 = bitcast i64* %call4 to i8*
  tail call void @llvm.dbg.value(metadata i64* %call4, i64 0, metadata !32, metadata !93), !dbg !106
  tail call void @llvm.dbg.value(metadata i64 %n, i64 0, metadata !22, metadata !93), !dbg !98
  tail call void @llvm.dbg.value(metadata i64* %call4, i64 0, metadata !21, metadata !93), !dbg !98
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !34, metadata !93), !dbg !107
  tail call void @llvm.dbg.value(metadata i64 %n, i64 0, metadata !36, metadata !93), !dbg !108
  %call7 = tail call i64* @gen1DArray(i32 0, i32 %conv1) #7, !dbg !167
  %call7394 = bitcast i64* %call7 to i8*
  tail call void @llvm.dbg.value(metadata i64* %call7, i64 0, metadata !35, metadata !93), !dbg !108
  tail call void @llvm.dbg.value(metadata i64 %n, i64 0, metadata !24, metadata !93), !dbg !99
  tail call void @llvm.dbg.value(metadata i64* %call7, i64 0, metadata !23, metadata !93), !dbg !99
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !37, metadata !93), !dbg !109
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !25, metadata !93), !dbg !100
  %cmp238 = icmp sgt i64 %n, 0, !dbg !168
  br i1 %cmp238, label %polly.split_new_and_old, label %blklab0, !dbg !171

polly.split_new_and_old:                          ; preds = %entry
  %0 = icmp ne i64 %n, 9223372036854775807
  %polly.access.add.moves = mul i64 %n, %n
  %polly.access.moves = getelementptr i64, i64* %moves, i64 %polly.access.add.moves
  %1 = icmp ule i64* %polly.access.moves, %call7
  %polly.access.call7241 = getelementptr i64, i64* %call7, i64 %n
  %2 = icmp ule i64* %polly.access.call7241, %moves
  %3 = or i1 %1, %2
  %4 = and i1 %0, %3
  %polly.access.call = getelementptr i64, i64* %call, i64 %n
  %5 = icmp ule i64* %polly.access.call, %call7
  %6 = icmp ule i64* %polly.access.call7241, %call
  %7 = or i1 %5, %6
  %8 = and i1 %7, %4
  %polly.access.call4 = getelementptr i64, i64* %call4, i64 %n
  %9 = icmp ule i64* %polly.access.call4, %call7
  %10 = icmp ule i64* %polly.access.call7241, %call4
  %11 = or i1 %9, %10
  %12 = and i1 %11, %8
  %13 = icmp ule i64* %polly.access.call, %moves
  %14 = icmp ule i64* %polly.access.moves, %call
  %15 = or i1 %14, %13
  %16 = and i1 %15, %12
  %17 = icmp ule i64* %polly.access.call4, %moves
  %18 = icmp ule i64* %polly.access.moves, %call4
  %19 = or i1 %18, %17
  %20 = and i1 %19, %16
  %21 = icmp ule i64* %polly.access.call4, %call
  %22 = icmp ule i64* %polly.access.call, %call4
  %23 = or i1 %22, %21
  %24 = and i1 %23, %20
  br i1 %24, label %polly.loop_preheader, label %while.cond9.preheader.preheader

while.cond9.preheader.preheader:                  ; preds = %polly.split_new_and_old
  br label %while.cond9.preheader, !dbg !172

while.cond9.preheader:                            ; preds = %while.cond9.preheader.preheader, %blklab2
  %indvars.iv = phi i64 [ %indvars.iv.next, %blklab2 ], [ %n, %while.cond9.preheader.preheader ]
  %s.0239 = phi i64 [ %add86, %blklab2 ], [ 0, %while.cond9.preheader.preheader ]
  br label %if.end14, !dbg !172

if.end14:                                         ; preds = %blklab8, %while.cond9.preheader
  %j.0237 = phi i64 [ %s.0239, %while.cond9.preheader ], [ %add84, %blklab8 ]
  %i.0236 = phi i64 [ 0, %while.cond9.preheader ], [ %add, %blklab8 ]
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !39, metadata !93), !dbg !111
  %arrayidx = getelementptr inbounds i64, i64* %call4, i64 %i.0236, !dbg !174
  store i64 0, i64* %arrayidx, align 8, !dbg !175, !tbaa !176
  tail call void @llvm.dbg.value(metadata i64 1, i64 0, metadata !40, metadata !93), !dbg !112
  %add = add nuw nsw i64 %i.0236, 1, !dbg !180
  tail call void @llvm.dbg.value(metadata i64 %add, i64 0, metadata !41, metadata !93), !dbg !113
  %cmp15 = icmp sge i64 %add, %n, !dbg !181
  %cmp19 = icmp slt i64 %j.0237, 1, !dbg !183
  %or.cond = or i1 %cmp19, %cmp15, !dbg !185
  tail call void @llvm.dbg.value(metadata i64 1, i64 0, metadata !42, metadata !93), !dbg !114
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !44, metadata !93), !dbg !116
  br i1 %or.cond, label %blklab4, label %if.end22, !dbg !185

if.end22:                                         ; preds = %if.end14
  tail call void @llvm.dbg.value(metadata i64 1, i64 0, metadata !45, metadata !93), !dbg !117
  tail call void @llvm.dbg.value(metadata i64 %add, i64 0, metadata !46, metadata !93), !dbg !118
  %mul = mul nsw i64 %add, %n, !dbg !186
  tail call void @llvm.dbg.value(metadata i64 %mul, i64 0, metadata !47, metadata !93), !dbg !119
  tail call void @llvm.dbg.value(metadata i64 %add24, i64 0, metadata !48, metadata !93), !dbg !120
  tail call void @llvm.dbg.value(metadata i64 1, i64 0, metadata !49, metadata !93), !dbg !121
  %add24 = add nsw i64 %j.0237, -1, !dbg !187
  %sub25 = add i64 %add24, %mul, !dbg !188
  tail call void @llvm.dbg.value(metadata i64 %sub25, i64 0, metadata !50, metadata !93), !dbg !122
  %arrayidx26 = getelementptr inbounds i64, i64* %moves, i64 %sub25, !dbg !189
  %25 = load i64, i64* %arrayidx26, align 8, !dbg !189, !tbaa !176
  tail call void @llvm.dbg.value(metadata i64 %25, i64 0, metadata !51, metadata !93), !dbg !123
  store i64 %25, i64* %arrayidx, align 8, !dbg !190, !tbaa !176
  br label %blklab4, !dbg !191

blklab4:                                          ; preds = %if.end14, %if.end22
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !52, metadata !93), !dbg !124
  %arrayidx28 = getelementptr inbounds i64, i64* %call, i64 %i.0236, !dbg !192
  store i64 0, i64* %arrayidx28, align 8, !dbg !193, !tbaa !176
  tail call void @llvm.dbg.value(metadata i64 2, i64 0, metadata !53, metadata !93), !dbg !125
  %add29 = add nuw nsw i64 %i.0236, 2, !dbg !194
  tail call void @llvm.dbg.value(metadata i64 %add29, i64 0, metadata !54, metadata !93), !dbg !126
  %cmp30 = icmp slt i64 %add29, %n, !dbg !195
  br i1 %cmp30, label %if.end33, label %blklab5, !dbg !197

if.end33:                                         ; preds = %blklab4
  tail call void @llvm.dbg.value(metadata i64 2, i64 0, metadata !55, metadata !93), !dbg !127
  tail call void @llvm.dbg.value(metadata i64 %add29, i64 0, metadata !56, metadata !93), !dbg !128
  %mul35 = mul nsw i64 %add29, %n, !dbg !198
  tail call void @llvm.dbg.value(metadata i64 %mul35, i64 0, metadata !57, metadata !93), !dbg !129
  %add36 = add nsw i64 %mul35, %j.0237, !dbg !199
  tail call void @llvm.dbg.value(metadata i64 %add36, i64 0, metadata !58, metadata !93), !dbg !130
  %arrayidx37 = getelementptr inbounds i64, i64* %moves, i64 %add36, !dbg !200
  %26 = load i64, i64* %arrayidx37, align 8, !dbg !200, !tbaa !176
  tail call void @llvm.dbg.value(metadata i64 %26, i64 0, metadata !59, metadata !93), !dbg !131
  store i64 %26, i64* %arrayidx28, align 8, !dbg !201, !tbaa !176
  br label %blklab5, !dbg !202

blklab5:                                          ; preds = %blklab4, %if.end33
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !60, metadata !93), !dbg !132
  %arrayidx39 = getelementptr inbounds i64, i64* %call7, i64 %i.0236, !dbg !203
  store i64 0, i64* %arrayidx39, align 8, !dbg !204, !tbaa !176
  tail call void @llvm.dbg.value(metadata i64 1, i64 0, metadata !61, metadata !93), !dbg !133
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !63, metadata !93), !dbg !135
  %cmp41 = icmp slt i64 %j.0237, 2, !dbg !205
  br i1 %cmp41, label %blklab6, label %if.end44, !dbg !207

if.end44:                                         ; preds = %blklab5
  %mul45 = mul nsw i64 %i.0236, %n, !dbg !208
  tail call void @llvm.dbg.value(metadata i64 %mul45, i64 0, metadata !64, metadata !93), !dbg !136
  tail call void @llvm.dbg.value(metadata i64 %add46, i64 0, metadata !65, metadata !93), !dbg !137
  tail call void @llvm.dbg.value(metadata i64 2, i64 0, metadata !66, metadata !93), !dbg !138
  %add46 = add nsw i64 %j.0237, -2, !dbg !209
  %sub47 = add i64 %add46, %mul45, !dbg !210
  tail call void @llvm.dbg.value(metadata i64 %sub47, i64 0, metadata !67, metadata !93), !dbg !139
  %arrayidx48 = getelementptr inbounds i64, i64* %moves, i64 %sub47, !dbg !211
  %27 = load i64, i64* %arrayidx48, align 8, !dbg !211, !tbaa !176
  tail call void @llvm.dbg.value(metadata i64 %27, i64 0, metadata !68, metadata !93), !dbg !140
  store i64 %27, i64* %arrayidx39, align 8, !dbg !212, !tbaa !176
  br label %blklab6, !dbg !213

blklab6:                                          ; preds = %blklab5, %if.end44
  %28 = phi i64 [ 0, %blklab5 ], [ %27, %if.end44 ]
  %29 = load i64, i64* %arrayidx28, align 8, !dbg !214, !tbaa !176
  tail call void @llvm.dbg.value(metadata i64 %29, i64 0, metadata !69, metadata !93), !dbg !141
  %30 = load i64, i64* %arrayidx, align 8, !dbg !215, !tbaa !176
  tail call void @llvm.dbg.value(metadata i64 %30, i64 0, metadata !70, metadata !93), !dbg !142
  %cmp52 = icmp sgt i64 %29, %30, !dbg !216
  br i1 %cmp52, label %if.end55, label %blklab7, !dbg !218

if.end55:                                         ; preds = %blklab6
  tail call void @llvm.dbg.value(metadata i64 %30, i64 0, metadata !71, metadata !93), !dbg !143
  store i64 %30, i64* %arrayidx28, align 8, !dbg !219, !tbaa !176
  %.pre = load i64, i64* %arrayidx39, align 8, !dbg !220, !tbaa !176
  %.pre397 = load i64, i64* %arrayidx, align 8, !dbg !221, !tbaa !176
  br label %blklab7, !dbg !222

blklab7:                                          ; preds = %blklab6, %if.end55
  %31 = phi i64 [ %29, %blklab6 ], [ %30, %if.end55 ]
  %32 = phi i64 [ %30, %blklab6 ], [ %.pre397, %if.end55 ], !dbg !221
  %33 = phi i64 [ %28, %blklab6 ], [ %.pre, %if.end55 ], !dbg !220
  tail call void @llvm.dbg.value(metadata i64 %33, i64 0, metadata !72, metadata !93), !dbg !144
  tail call void @llvm.dbg.value(metadata i64 %32, i64 0, metadata !73, metadata !93), !dbg !145
  %cmp60 = icmp sgt i64 %33, %32, !dbg !223
  br i1 %cmp60, label %if.end63, label %blklab8, !dbg !225

if.end63:                                         ; preds = %blklab7
  tail call void @llvm.dbg.value(metadata i64 %32, i64 0, metadata !74, metadata !93), !dbg !146
  store i64 %32, i64* %arrayidx39, align 8, !dbg !226, !tbaa !176
  %.pre398 = load i64, i64* %arrayidx28, align 8, !dbg !227, !tbaa !176
  br label %blklab8, !dbg !228

blklab8:                                          ; preds = %blklab7, %if.end63
  %34 = phi i64 [ %33, %blklab7 ], [ %32, %if.end63 ], !dbg !229
  %35 = phi i64 [ %31, %blklab7 ], [ %.pre398, %if.end63 ], !dbg !227
  tail call void @llvm.dbg.value(metadata i64 %35, i64 0, metadata !75, metadata !93), !dbg !147
  %add67 = add nsw i64 %35, %i.0236, !dbg !230
  tail call void @llvm.dbg.value(metadata i64 %add67, i64 0, metadata !76, metadata !93), !dbg !148
  tail call void @llvm.dbg.value(metadata i64 %34, i64 0, metadata !77, metadata !93), !dbg !149
  %add69 = add nsw i64 %34, %j.0237, !dbg !231
  tail call void @llvm.dbg.value(metadata i64 %add69, i64 0, metadata !78, metadata !93), !dbg !150
  %cmp70 = icmp sgt i64 %add67, %add69, !dbg !232
  %mul76 = mul nsw i64 %i.0236, %n, !dbg !234
  %add77 = add nsw i64 %mul76, %j.0237, !dbg !235
  %arrayidx78 = getelementptr inbounds i64, i64* %moves, i64 %add77, !dbg !236
  %add67.add69 = select i1 %cmp70, i64 %add67, i64 %add69, !dbg !237
  store i64 %add67.add69, i64* %arrayidx78, align 8, !dbg !238, !tbaa !176
  tail call void @llvm.dbg.value(metadata i64 1, i64 0, metadata !87, metadata !93), !dbg !159
  %add84 = add nuw nsw i64 %j.0237, 1, !dbg !239
  tail call void @llvm.dbg.value(metadata i64 %add84, i64 0, metadata !88, metadata !93), !dbg !160
  tail call void @llvm.dbg.value(metadata i64 %add84, i64 0, metadata !26, metadata !93), !dbg !101
  tail call void @llvm.dbg.value(metadata i64 1, i64 0, metadata !89, metadata !93), !dbg !161
  tail call void @llvm.dbg.value(metadata i64 %add, i64 0, metadata !90, metadata !93), !dbg !162
  tail call void @llvm.dbg.value(metadata i64 %add, i64 0, metadata !27, metadata !93), !dbg !102
  %exitcond = icmp eq i64 %add, %indvars.iv, !dbg !172
  br i1 %exitcond, label %blklab2, label %if.end14, !dbg !172

blklab2:                                          ; preds = %blklab8
  tail call void @llvm.dbg.value(metadata i64 1, i64 0, metadata !91, metadata !93), !dbg !163
  %add86 = add nuw nsw i64 %s.0239, 1, !dbg !240
  tail call void @llvm.dbg.value(metadata i64 %add86, i64 0, metadata !92, metadata !93), !dbg !164
  tail call void @llvm.dbg.value(metadata i64 %add86, i64 0, metadata !25, metadata !93), !dbg !100
  %indvars.iv.next = add i64 %indvars.iv, -1, !dbg !171
  %exitcond240 = icmp eq i64 %add86, %n, !dbg !171
  br i1 %exitcond240, label %blklab0.loopexit401, label %while.cond9.preheader, !dbg !171

blklab0.loopexit:                                 ; preds = %polly.loop_exit375
  br label %blklab0, !dbg !241

blklab0.loopexit401:                              ; preds = %blklab2
  br label %blklab0, !dbg !241

blklab0:                                          ; preds = %blklab0.loopexit401, %blklab0.loopexit, %entry
  ret i64* %moves, !dbg !241

polly.loop_header:                                ; preds = %polly.loop_exit375, %polly.loop_preheader
  %polly.indvar = phi i64 [ 0, %polly.loop_preheader ], [ %polly.indvar_next, %polly.loop_exit375 ]
  %36 = sub i64 %51, %polly.indvar
  %37 = icmp sgt i64 %36, 0
  %smax395 = select i1 %37, i64 %36, i64 0
  %38 = shl i64 %smax395, 3
  %39 = add i64 %38, 8
  %40 = sub nsw i64 %n, %polly.indvar
  %polly.loop_guard275 = icmp sgt i64 %40, 0
  br i1 %polly.loop_guard275, label %polly.loop_header291.preheader, label %polly.loop_exit293

polly.loop_header291.preheader:                   ; preds = %polly.loop_header
  call void @llvm.memset.p0i8.i64(i8* %call4391, i8 0, i64 %39, i32 8, i1 false)
  call void @llvm.memset.p0i8.i64(i8* %call392, i8 0, i64 %39, i32 8, i1 false)
  call void @llvm.memset.p0i8.i64(i8* %call7394, i8 0, i64 %39, i32 8, i1 false)
  br label %polly.loop_exit293

polly.loop_exit293:                               ; preds = %polly.loop_header291.preheader, %polly.loop_header
  %41 = sub nsw i64 1, %polly.indvar
  %42 = icmp slt i64 %41, 0
  %43 = select i1 %42, i64 0, i64 %41
  %44 = icmp slt i64 %51, %40
  %45 = select i1 %44, i64 %51, i64 %40
  %polly.loop_guard304 = icmp slt i64 %43, %45
  br i1 %polly.loop_guard304, label %polly.loop_preheader302, label %polly.loop_exit303

polly.loop_exit303.loopexit:                      ; preds = %polly.loop_header301
  br label %polly.loop_exit303

polly.loop_exit303:                               ; preds = %polly.loop_exit303.loopexit, %polly.loop_exit293
  %46 = icmp slt i64 %55, %40
  %47 = select i1 %46, i64 %55, i64 %40
  %polly.loop_guard318 = icmp sgt i64 %47, 0
  br i1 %polly.loop_guard318, label %polly.loop_preheader316, label %polly.loop_exit317

polly.loop_exit317.loopexit:                      ; preds = %polly.loop_header315
  br label %polly.loop_exit317

polly.loop_exit317:                               ; preds = %polly.loop_exit317.loopexit, %polly.loop_exit303
  %48 = sub nsw i64 2, %polly.indvar
  %49 = icmp slt i64 %48, 0
  %50 = select i1 %49, i64 0, i64 %48
  %polly.loop_guard334 = icmp slt i64 %50, %40
  br i1 %polly.loop_guard334, label %polly.loop_preheader332, label %polly.loop_exit333

polly.loop_exit333.loopexit:                      ; preds = %polly.loop_header331
  br label %polly.loop_exit333

polly.loop_exit333:                               ; preds = %polly.loop_exit333.loopexit, %polly.loop_exit317
  br i1 %polly.loop_guard275, label %polly.loop_header347.preheader, label %polly.loop_exit375

polly.loop_header347.preheader:                   ; preds = %polly.loop_exit333
  %polly.adjust_ub353 = add i64 %40, -1
  br label %polly.loop_header347

polly.loop_exit375.loopexit:                      ; preds = %polly.loop_header373
  br label %polly.loop_exit375

polly.loop_exit375:                               ; preds = %polly.loop_exit375.loopexit, %polly.loop_exit333
  %polly.indvar_next = add nuw nsw i64 %polly.indvar, 1
  %exitcond396 = icmp eq i64 %polly.indvar_next, %n
  br i1 %exitcond396, label %blklab0.loopexit, label %polly.loop_header

polly.loop_preheader:                             ; preds = %polly.split_new_and_old
  %51 = add i64 %n, -1
  %scevgep309 = getelementptr i64, i64* %moves, i64 %51
  %52 = shl i64 %n, 3
  %53 = add i64 %52, 8
  %54 = shl i64 %n, 1
  %scevgep323 = getelementptr i64, i64* %moves, i64 %54
  %scevgep339 = getelementptr i64, i64* %moves, i64 -2
  %55 = add nsw i64 %n, -2
  br label %polly.loop_header

polly.loop_header301:                             ; preds = %polly.loop_header301, %polly.loop_preheader302
  %polly.indvar305 = phi i64 [ %43, %polly.loop_preheader302 ], [ %polly.indvar_next306, %polly.loop_header301 ]
  %56 = mul i64 %polly.indvar305, %53
  %uglygep = getelementptr i8, i8* %scevgep310311, i64 %56
  %uglygep312 = bitcast i8* %uglygep to i64*
  %_p_scalar_ = load i64, i64* %uglygep312, align 8, !alias.scope !242, !noalias !244, !llvm.mem.parallel_loop_access !249
  %scevgep313 = getelementptr i64, i64* %call4, i64 %polly.indvar305
  store i64 %_p_scalar_, i64* %scevgep313, align 8, !alias.scope !246, !noalias !250, !llvm.mem.parallel_loop_access !249
  %polly.indvar_next306 = add nuw nsw i64 %polly.indvar305, 1
  %polly.loop_cond308 = icmp slt i64 %polly.indvar305, %polly.adjust_ub307
  br i1 %polly.loop_cond308, label %polly.loop_header301, label %polly.loop_exit303.loopexit, !llvm.loop !249

polly.loop_preheader302:                          ; preds = %polly.loop_exit293
  %scevgep310 = getelementptr i64, i64* %scevgep309, i64 %polly.indvar
  %scevgep310311 = bitcast i64* %scevgep310 to i8*
  %polly.adjust_ub307 = add i64 %45, -1
  br label %polly.loop_header301

polly.loop_header315:                             ; preds = %polly.loop_header315, %polly.loop_preheader316
  %polly.indvar319 = phi i64 [ 0, %polly.loop_preheader316 ], [ %polly.indvar_next320, %polly.loop_header315 ]
  %57 = mul i64 %polly.indvar319, %53
  %uglygep326 = getelementptr i8, i8* %scevgep324325, i64 %57
  %uglygep326327 = bitcast i8* %uglygep326 to i64*
  %_p_scalar_328 = load i64, i64* %uglygep326327, align 8, !alias.scope !242, !noalias !244, !llvm.mem.parallel_loop_access !251
  %scevgep329 = getelementptr i64, i64* %call, i64 %polly.indvar319
  store i64 %_p_scalar_328, i64* %scevgep329, align 8, !alias.scope !248, !noalias !252, !llvm.mem.parallel_loop_access !251
  %polly.indvar_next320 = add nuw nsw i64 %polly.indvar319, 1
  %polly.loop_cond322 = icmp slt i64 %polly.indvar319, %polly.adjust_ub321
  br i1 %polly.loop_cond322, label %polly.loop_header315, label %polly.loop_exit317.loopexit, !llvm.loop !251

polly.loop_preheader316:                          ; preds = %polly.loop_exit303
  %scevgep324 = getelementptr i64, i64* %scevgep323, i64 %polly.indvar
  %scevgep324325 = bitcast i64* %scevgep324 to i8*
  %polly.adjust_ub321 = add i64 %47, -1
  br label %polly.loop_header315

polly.loop_header331:                             ; preds = %polly.loop_header331, %polly.loop_preheader332
  %polly.indvar335 = phi i64 [ %50, %polly.loop_preheader332 ], [ %polly.indvar_next336, %polly.loop_header331 ]
  %58 = mul i64 %polly.indvar335, %53
  %uglygep342 = getelementptr i8, i8* %scevgep340341, i64 %58
  %uglygep342343 = bitcast i8* %uglygep342 to i64*
  %_p_scalar_344 = load i64, i64* %uglygep342343, align 8, !alias.scope !242, !noalias !244, !llvm.mem.parallel_loop_access !253
  %scevgep345 = getelementptr i64, i64* %call7, i64 %polly.indvar335
  store i64 %_p_scalar_344, i64* %scevgep345, align 8, !alias.scope !247, !noalias !254, !llvm.mem.parallel_loop_access !253
  %polly.indvar_next336 = add nuw nsw i64 %polly.indvar335, 1
  %polly.loop_cond338 = icmp slt i64 %polly.indvar335, %polly.adjust_ub337
  br i1 %polly.loop_cond338, label %polly.loop_header331, label %polly.loop_exit333.loopexit, !llvm.loop !253

polly.loop_preheader332:                          ; preds = %polly.loop_exit317
  %scevgep340 = getelementptr i64, i64* %scevgep339, i64 %polly.indvar
  %scevgep340341 = bitcast i64* %scevgep340 to i8*
  %polly.adjust_ub337 = add i64 %40, -1
  br label %polly.loop_header331

polly.loop_header347:                             ; preds = %polly.loop_header347.preheader, %polly.stmt.blklab7.exit
  %polly.indvar351 = phi i64 [ %polly.indvar_next352, %polly.stmt.blklab7.exit ], [ 0, %polly.loop_header347.preheader ]
  %scevgep355 = getelementptr i64, i64* %call, i64 %polly.indvar351
  %_p_scalar_356 = load i64, i64* %scevgep355, align 8, !alias.scope !248, !noalias !252, !llvm.mem.parallel_loop_access !255
  %scevgep357 = getelementptr i64, i64* %call4, i64 %polly.indvar351
  %_p_scalar_358 = load i64, i64* %scevgep357, align 8, !alias.scope !246, !noalias !250, !llvm.mem.parallel_loop_access !255
  %p_cmp52 = icmp sgt i64 %_p_scalar_356, %_p_scalar_358, !dbg !216
  br i1 %p_cmp52, label %polly.stmt.if.end55, label %polly.stmt.blklab7.exit, !dbg !218

polly.stmt.if.end55:                              ; preds = %polly.loop_header347
  store i64 %_p_scalar_358, i64* %scevgep355, align 8, !alias.scope !248, !noalias !252, !llvm.mem.parallel_loop_access !255
  br label %polly.stmt.blklab7.exit, !dbg !222

polly.stmt.blklab7.exit:                          ; preds = %polly.stmt.if.end55, %polly.loop_header347
  %polly.indvar_next352 = add nuw nsw i64 %polly.indvar351, 1
  %polly.loop_cond354 = icmp slt i64 %polly.indvar351, %polly.adjust_ub353
  br i1 %polly.loop_cond354, label %polly.loop_header347, label %polly.loop_header360.preheader, !llvm.loop !255

polly.loop_header360.preheader:                   ; preds = %polly.stmt.blklab7.exit
  br label %polly.loop_header360

polly.loop_header360:                             ; preds = %polly.loop_header360.preheader, %polly.stmt.blklab8.exit
  %polly.indvar364 = phi i64 [ %polly.indvar_next365, %polly.stmt.blklab8.exit ], [ 0, %polly.loop_header360.preheader ]
  %scevgep368 = getelementptr i64, i64* %call7, i64 %polly.indvar364
  %_p_scalar_369 = load i64, i64* %scevgep368, align 8, !alias.scope !247, !noalias !254, !llvm.mem.parallel_loop_access !256
  %scevgep370 = getelementptr i64, i64* %call4, i64 %polly.indvar364
  %_p_scalar_371 = load i64, i64* %scevgep370, align 8, !alias.scope !246, !noalias !250, !llvm.mem.parallel_loop_access !256
  %p_cmp60 = icmp sgt i64 %_p_scalar_369, %_p_scalar_371, !dbg !223
  br i1 %p_cmp60, label %polly.stmt.if.end63, label %polly.stmt.blklab8.exit, !dbg !225

polly.stmt.if.end63:                              ; preds = %polly.loop_header360
  store i64 %_p_scalar_371, i64* %scevgep368, align 8, !alias.scope !247, !noalias !254, !llvm.mem.parallel_loop_access !256
  br label %polly.stmt.blklab8.exit, !dbg !228

polly.stmt.blklab8.exit:                          ; preds = %polly.stmt.if.end63, %polly.loop_header360
  %polly.indvar_next365 = add nuw nsw i64 %polly.indvar364, 1
  %polly.loop_cond367 = icmp slt i64 %polly.indvar364, %polly.adjust_ub353
  br i1 %polly.loop_cond367, label %polly.loop_header360, label %polly.loop_preheader374, !llvm.loop !256

polly.loop_header373:                             ; preds = %polly.loop_header373, %polly.loop_preheader374
  %polly.indvar377 = phi i64 [ 0, %polly.loop_preheader374 ], [ %polly.indvar_next378, %polly.loop_header373 ]
  %scevgep381 = getelementptr i64, i64* %call, i64 %polly.indvar377
  %_p_scalar_382 = load i64, i64* %scevgep381, align 8, !alias.scope !248, !noalias !252
  %p_add67 = add nsw i64 %_p_scalar_382, %polly.indvar377, !dbg !230
  %scevgep383 = getelementptr i64, i64* %call7, i64 %polly.indvar377
  %_p_scalar_384 = load i64, i64* %scevgep383, align 8, !alias.scope !247, !noalias !254
  %59 = add nuw i64 %polly.indvar377, %polly.indvar
  %p_add69 = add nsw i64 %59, %_p_scalar_384, !dbg !231
  %p_cmp70 = icmp sgt i64 %p_add67, %p_add69, !dbg !232
  %polly.storemerge = select i1 %p_cmp70, i64 %p_add67, i64 %p_add69, !dbg !257
  %60 = mul i64 %polly.indvar377, %53
  %uglygep387 = getelementptr i8, i8* %scevgep385386, i64 %60
  %uglygep387388 = bitcast i8* %uglygep387 to i64*
  store i64 %polly.storemerge, i64* %uglygep387388, align 8, !alias.scope !242, !noalias !244
  %polly.indvar_next378 = add nuw nsw i64 %polly.indvar377, 1
  %polly.loop_cond380 = icmp slt i64 %polly.indvar377, %polly.adjust_ub353
  br i1 %polly.loop_cond380, label %polly.loop_header373, label %polly.loop_exit375.loopexit

polly.loop_preheader374:                          ; preds = %polly.stmt.blklab8.exit
  %scevgep385 = getelementptr i64, i64* %moves, i64 %polly.indvar
  %scevgep385386 = bitcast i64* %scevgep385 to i8*
  br label %polly.loop_header373
}

declare i64* @gen1DArray(i32, i32) #1

; Function Attrs: noreturn nounwind uwtable
define i32 @main(i32 %argc, i8** %args) #2 !dbg !258 {
entry:
  tail call void @llvm.dbg.value(metadata i32 %argc, i64 0, metadata !266, metadata !93), !dbg !297
  tail call void @llvm.dbg.value(metadata i8** %args, i64 0, metadata !267, metadata !93), !dbg !298
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !269, metadata !93), !dbg !299
  tail call void @llvm.dbg.value(metadata i64* null, i64 0, metadata !270, metadata !93), !dbg !300
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !271, metadata !93), !dbg !300
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !272, metadata !93), !dbg !301
  tail call void @llvm.dbg.value(metadata i64** null, i64 0, metadata !274, metadata !93), !dbg !302
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !276, metadata !93), !dbg !302
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !277, metadata !93), !dbg !302
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !278, metadata !93), !dbg !303
  tail call void @llvm.dbg.value(metadata i64* null, i64 0, metadata !279, metadata !93), !dbg !304
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !280, metadata !93), !dbg !304
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !281, metadata !93), !dbg !305
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !282, metadata !93), !dbg !306
  tail call void @llvm.dbg.value(metadata i64* null, i64 0, metadata !283, metadata !93), !dbg !307
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !284, metadata !93), !dbg !307
  tail call void @llvm.dbg.value(metadata i64* null, i64 0, metadata !285, metadata !93), !dbg !308
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !286, metadata !93), !dbg !308
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !287, metadata !93), !dbg !309
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !288, metadata !93), !dbg !310
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !289, metadata !93), !dbg !311
  tail call void @llvm.dbg.value(metadata i64* null, i64 0, metadata !291, metadata !93), !dbg !312
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !292, metadata !93), !dbg !312
  tail call void @llvm.dbg.value(metadata i64* null, i64 0, metadata !295, metadata !93), !dbg !313
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !296, metadata !93), !dbg !313
  %call = tail call i64** @convertArgsToIntArray(i32 %argc, i8** %args) #7, !dbg !314
  tail call void @llvm.dbg.value(metadata i64** %call, i64 0, metadata !274, metadata !93), !dbg !302
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !278, metadata !93), !dbg !303
  %0 = load i64*, i64** %call, align 8, !dbg !315, !tbaa !316
  tail call void @llvm.dbg.value(metadata i64* %0, i64 0, metadata !279, metadata !93), !dbg !304
  %call1 = tail call i64* @parseStringToInt(i64* %0) #7, !dbg !318
  tail call void @llvm.dbg.value(metadata i64* %call1, i64 0, metadata !273, metadata !93), !dbg !319
  tail call void @llvm.dbg.value(metadata i64* %call1, i64 0, metadata !268, metadata !93), !dbg !320
  %cmp = icmp eq i64* %call1, null, !dbg !321
  br i1 %cmp, label %blklab11, label %if.end, !dbg !323

if.end:                                           ; preds = %entry
  %1 = load i64, i64* %call1, align 8, !dbg !324, !tbaa !176
  tail call void @llvm.dbg.value(metadata i64 %1, i64 0, metadata !269, metadata !93), !dbg !299
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !281, metadata !93), !dbg !305
  %mul = mul nsw i64 %1, %1, !dbg !325
  tail call void @llvm.dbg.value(metadata i64 %mul, i64 0, metadata !282, metadata !93), !dbg !306
  tail call void @llvm.dbg.value(metadata i64 %mul, i64 0, metadata !284, metadata !93), !dbg !307
  %conv4 = trunc i64 %mul to i32, !dbg !326
  %call5 = tail call i64* @gen1DArray(i32 0, i32 %conv4) #7, !dbg !326
  tail call void @llvm.dbg.value(metadata i64* %call5, i64 0, metadata !283, metadata !93), !dbg !307
  tail call void @llvm.dbg.value(metadata i64 %mul, i64 0, metadata !271, metadata !93), !dbg !300
  tail call void @llvm.dbg.value(metadata i64* %call5, i64 0, metadata !270, metadata !93), !dbg !300
  tail call void @llvm.dbg.value(metadata i64 %mul, i64 0, metadata !286, metadata !93), !dbg !308
  %call6 = tail call i64* @findMoves(i64* %call5, i64 undef, i64 %1), !dbg !327
  tail call void @llvm.dbg.value(metadata i64* %call6, i64 0, metadata !285, metadata !93), !dbg !308
  tail call void @llvm.dbg.value(metadata i64 %mul, i64 0, metadata !271, metadata !93), !dbg !300
  tail call void @llvm.dbg.value(metadata i64* %call6, i64 0, metadata !270, metadata !93), !dbg !300
  tail call void @llvm.dbg.value(metadata i64 1, i64 0, metadata !287, metadata !93), !dbg !309
  %sub7 = add nsw i64 %1, -1, !dbg !328
  tail call void @llvm.dbg.value(metadata i64 %sub7, i64 0, metadata !288, metadata !93), !dbg !310
  %arrayidx8 = getelementptr inbounds i64, i64* %call6, i64 %sub7, !dbg !329
  %2 = load i64, i64* %arrayidx8, align 8, !dbg !329, !tbaa !176
  tail call void @llvm.dbg.value(metadata i64 %2, i64 0, metadata !289, metadata !93), !dbg !311
  tail call void @llvm.dbg.value(metadata i64 %2, i64 0, metadata !272, metadata !93), !dbg !301
  tail call void @llvm.dbg.value(metadata i64 50, i64 0, metadata !292, metadata !93), !dbg !312
  %call9 = tail call noalias i8* @malloc(i64 400) #7, !dbg !330
  %3 = bitcast i8* %call9 to i64*, !dbg !330
  tail call void @llvm.dbg.value(metadata i64* %3, i64 0, metadata !291, metadata !93), !dbg !312
  %4 = bitcast i8* %call9 to <2 x i64>*, !dbg !331
  store <2 x i64> <i64 84, i64 104>, <2 x i64>* %4, align 8, !dbg !331, !tbaa !176
  %arrayidx12 = getelementptr inbounds i8, i8* %call9, i64 16, !dbg !332
  %5 = bitcast i8* %arrayidx12 to <2 x i64>*, !dbg !333
  store <2 x i64> <i64 101, i64 32>, <2 x i64>* %5, align 8, !dbg !333, !tbaa !176
  %arrayidx14 = getelementptr inbounds i8, i8* %call9, i64 32, !dbg !334
  %6 = bitcast i8* %arrayidx14 to <2 x i64>*, !dbg !335
  store <2 x i64> <i64 116, i64 111>, <2 x i64>* %6, align 8, !dbg !335, !tbaa !176
  %arrayidx16 = getelementptr inbounds i8, i8* %call9, i64 48, !dbg !336
  %7 = bitcast i8* %arrayidx16 to <2 x i64>*, !dbg !337
  store <2 x i64> <i64 116, i64 97>, <2 x i64>* %7, align 8, !dbg !337, !tbaa !176
  %arrayidx18 = getelementptr inbounds i8, i8* %call9, i64 64, !dbg !338
  %8 = bitcast i8* %arrayidx18 to <2 x i64>*, !dbg !339
  store <2 x i64> <i64 108, i64 32>, <2 x i64>* %8, align 8, !dbg !339, !tbaa !176
  %arrayidx20 = getelementptr inbounds i8, i8* %call9, i64 80, !dbg !340
  %9 = bitcast i8* %arrayidx20 to <2 x i64>*, !dbg !341
  store <2 x i64> <i64 97, i64 109>, <2 x i64>* %9, align 8, !dbg !341, !tbaa !176
  %arrayidx22 = getelementptr inbounds i8, i8* %call9, i64 96, !dbg !342
  %10 = bitcast i8* %arrayidx22 to <2 x i64>*, !dbg !343
  store <2 x i64> <i64 111, i64 117>, <2 x i64>* %10, align 8, !dbg !343, !tbaa !176
  %arrayidx24 = getelementptr inbounds i8, i8* %call9, i64 112, !dbg !344
  %11 = bitcast i8* %arrayidx24 to <2 x i64>*, !dbg !345
  store <2 x i64> <i64 110, i64 116>, <2 x i64>* %11, align 8, !dbg !345, !tbaa !176
  %arrayidx26 = getelementptr inbounds i8, i8* %call9, i64 128, !dbg !346
  %12 = bitcast i8* %arrayidx26 to <2 x i64>*, !dbg !347
  store <2 x i64> <i64 32, i64 111>, <2 x i64>* %12, align 8, !dbg !347, !tbaa !176
  %arrayidx28 = getelementptr inbounds i8, i8* %call9, i64 144, !dbg !348
  %13 = bitcast i8* %arrayidx28 to <2 x i64>*, !dbg !349
  store <2 x i64> <i64 102, i64 32>, <2 x i64>* %13, align 8, !dbg !349, !tbaa !176
  %arrayidx30 = getelementptr inbounds i8, i8* %call9, i64 160, !dbg !350
  %14 = bitcast i8* %arrayidx30 to <2 x i64>*, !dbg !351
  store <2 x i64> <i64 109, i64 111>, <2 x i64>* %14, align 8, !dbg !351, !tbaa !176
  %arrayidx32 = getelementptr inbounds i8, i8* %call9, i64 176, !dbg !352
  %15 = bitcast i8* %arrayidx32 to <2 x i64>*, !dbg !353
  store <2 x i64> <i64 110, i64 101>, <2 x i64>* %15, align 8, !dbg !353, !tbaa !176
  %arrayidx34 = getelementptr inbounds i8, i8* %call9, i64 192, !dbg !354
  %16 = bitcast i8* %arrayidx34 to <2 x i64>*, !dbg !355
  store <2 x i64> <i64 121, i64 32>, <2 x i64>* %16, align 8, !dbg !355, !tbaa !176
  %arrayidx36 = getelementptr inbounds i8, i8* %call9, i64 208, !dbg !356
  %17 = bitcast i8* %arrayidx36 to <2 x i64>*, !dbg !357
  store <2 x i64> <i64 40, i64 109>, <2 x i64>* %17, align 8, !dbg !357, !tbaa !176
  %arrayidx38 = getelementptr inbounds i8, i8* %call9, i64 224, !dbg !358
  %18 = bitcast i8* %arrayidx38 to <2 x i64>*, !dbg !359
  store <2 x i64> <i64 97, i64 120>, <2 x i64>* %18, align 8, !dbg !359, !tbaa !176
  %arrayidx40 = getelementptr inbounds i8, i8* %call9, i64 240, !dbg !360
  %19 = bitcast i8* %arrayidx40 to <2 x i64>*, !dbg !361
  store <2 x i64> <i64 105, i64 109>, <2 x i64>* %19, align 8, !dbg !361, !tbaa !176
  %arrayidx42 = getelementptr inbounds i8, i8* %call9, i64 256, !dbg !362
  %20 = bitcast i8* %arrayidx42 to <2 x i64>*, !dbg !363
  store <2 x i64> <i64 117, i64 109>, <2 x i64>* %20, align 8, !dbg !363, !tbaa !176
  %arrayidx44 = getelementptr inbounds i8, i8* %call9, i64 272, !dbg !364
  %21 = bitcast i8* %arrayidx44 to <2 x i64>*, !dbg !365
  store <2 x i64> <i64 41, i64 32>, <2 x i64>* %21, align 8, !dbg !365, !tbaa !176
  %arrayidx46 = getelementptr inbounds i8, i8* %call9, i64 288, !dbg !366
  %22 = bitcast i8* %arrayidx46 to <2 x i64>*, !dbg !367
  store <2 x i64> <i64 65, i64 108>, <2 x i64>* %22, align 8, !dbg !367, !tbaa !176
  %arrayidx48 = getelementptr inbounds i8, i8* %call9, i64 304, !dbg !368
  %23 = bitcast i8* %arrayidx48 to <2 x i64>*, !dbg !369
  store <2 x i64> <i64 105, i64 99>, <2 x i64>* %23, align 8, !dbg !369, !tbaa !176
  %arrayidx50 = getelementptr inbounds i8, i8* %call9, i64 320, !dbg !370
  %24 = bitcast i8* %arrayidx50 to <2 x i64>*, !dbg !371
  store <2 x i64> <i64 101, i64 32>, <2 x i64>* %24, align 8, !dbg !371, !tbaa !176
  %arrayidx52 = getelementptr inbounds i8, i8* %call9, i64 336, !dbg !372
  %25 = bitcast i8* %arrayidx52 to <2 x i64>*, !dbg !373
  store <2 x i64> <i64 103, i64 101>, <2 x i64>* %25, align 8, !dbg !373, !tbaa !176
  %arrayidx54 = getelementptr inbounds i8, i8* %call9, i64 352, !dbg !374
  %26 = bitcast i8* %arrayidx54 to <2 x i64>*, !dbg !375
  store <2 x i64> <i64 116, i64 115>, <2 x i64>* %26, align 8, !dbg !375, !tbaa !176
  %arrayidx56 = getelementptr inbounds i8, i8* %call9, i64 368, !dbg !376
  %27 = bitcast i8* %arrayidx56 to <2 x i64>*, !dbg !377
  store <2 x i64> <i64 32, i64 105>, <2 x i64>* %27, align 8, !dbg !377, !tbaa !176
  %arrayidx58 = getelementptr inbounds i8, i8* %call9, i64 384, !dbg !378
  %28 = bitcast i8* %arrayidx58 to <2 x i64>*, !dbg !379
  store <2 x i64> <i64 115, i64 32>, <2 x i64>* %28, align 8, !dbg !379, !tbaa !176
  tail call void @printf_s(i64* %3, i64 50) #7, !dbg !380
  %call60 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str, i64 0, i64 0), i64 %2), !dbg !381
  tail call void @llvm.dbg.value(metadata i64 23, i64 0, metadata !296, metadata !93), !dbg !313
  %call61 = tail call noalias i8* @malloc(i64 184) #7, !dbg !382
  %29 = bitcast i8* %call61 to i64*, !dbg !382
  tail call void @llvm.dbg.value(metadata i64* %29, i64 0, metadata !295, metadata !93), !dbg !313
  %30 = bitcast i8* %call61 to <2 x i64>*, !dbg !383
  store <2 x i64> <i64 80, i64 97>, <2 x i64>* %30, align 8, !dbg !383, !tbaa !176
  %arrayidx64 = getelementptr inbounds i8, i8* %call61, i64 16, !dbg !384
  %31 = bitcast i8* %arrayidx64 to <2 x i64>*, !dbg !385
  store <2 x i64> <i64 115, i64 115>, <2 x i64>* %31, align 8, !dbg !385, !tbaa !176
  %arrayidx66 = getelementptr inbounds i8, i8* %call61, i64 32, !dbg !386
  %32 = bitcast i8* %arrayidx66 to <2 x i64>*, !dbg !387
  store <2 x i64> <i64 32, i64 67>, <2 x i64>* %32, align 8, !dbg !387, !tbaa !176
  %arrayidx68 = getelementptr inbounds i8, i8* %call61, i64 48, !dbg !388
  %33 = bitcast i8* %arrayidx68 to <2 x i64>*, !dbg !389
  store <2 x i64> <i64 111, i64 105>, <2 x i64>* %33, align 8, !dbg !389, !tbaa !176
  %arrayidx70 = getelementptr inbounds i8, i8* %call61, i64 64, !dbg !390
  %34 = bitcast i8* %arrayidx70 to <2 x i64>*, !dbg !391
  store <2 x i64> <i64 110, i64 71>, <2 x i64>* %34, align 8, !dbg !391, !tbaa !176
  %arrayidx72 = getelementptr inbounds i8, i8* %call61, i64 80, !dbg !392
  %35 = bitcast i8* %arrayidx72 to <2 x i64>*, !dbg !393
  store <2 x i64> <i64 97, i64 109>, <2 x i64>* %35, align 8, !dbg !393, !tbaa !176
  %arrayidx74 = getelementptr inbounds i8, i8* %call61, i64 96, !dbg !394
  %36 = bitcast i8* %arrayidx74 to <2 x i64>*, !dbg !395
  store <2 x i64> <i64 101, i64 32>, <2 x i64>* %36, align 8, !dbg !395, !tbaa !176
  %arrayidx76 = getelementptr inbounds i8, i8* %call61, i64 112, !dbg !396
  %37 = bitcast i8* %arrayidx76 to <2 x i64>*, !dbg !397
  store <2 x i64> <i64 116, i64 101>, <2 x i64>* %37, align 8, !dbg !397, !tbaa !176
  %arrayidx78 = getelementptr inbounds i8, i8* %call61, i64 128, !dbg !398
  %38 = bitcast i8* %arrayidx78 to <2 x i64>*, !dbg !399
  store <2 x i64> <i64 115, i64 116>, <2 x i64>* %38, align 8, !dbg !399, !tbaa !176
  %arrayidx80 = getelementptr inbounds i8, i8* %call61, i64 144, !dbg !400
  %39 = bitcast i8* %arrayidx80 to <2 x i64>*, !dbg !401
  store <2 x i64> <i64 32, i64 99>, <2 x i64>* %39, align 8, !dbg !401, !tbaa !176
  %arrayidx82 = getelementptr inbounds i8, i8* %call61, i64 160, !dbg !402
  %40 = bitcast i8* %arrayidx82 to <2 x i64>*, !dbg !403
  store <2 x i64> <i64 97, i64 115>, <2 x i64>* %40, align 8, !dbg !403, !tbaa !176
  %arrayidx84 = getelementptr inbounds i8, i8* %call61, i64 176, !dbg !404
  %41 = bitcast i8* %arrayidx84 to i64*, !dbg !404
  store i64 101, i64* %41, align 8, !dbg !405, !tbaa !176
  tail call void @println_s(i64* %29, i64 23) #7, !dbg !406
  br label %blklab11, !dbg !406

blklab11:                                         ; preds = %entry, %if.end
  tail call void @exit(i32 0) #8, !dbg !407
  unreachable, !dbg !407
}

declare i64** @convertArgsToIntArray(i32, i8**) #1

declare i64* @parseStringToInt(i64*) #1

; Function Attrs: nounwind
declare noalias i8* @malloc(i64) #3

declare void @printf_s(i64*, i64) #1

; Function Attrs: nounwind
declare i32 @printf(i8* nocapture readonly, ...) #3

declare void @println_s(i64*, i64) #1

; Function Attrs: noreturn nounwind
declare void @exit(i32) #4

; Function Attrs: nounwind readnone
declare void @llvm.dbg.value(metadata, i64, metadata, metadata) #5

; Function Attrs: argmemonly nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture, i8, i64, i32, i1) #6

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "polly-optimized" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noreturn nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { noreturn nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { nounwind readnone }
attributes #6 = { argmemonly nounwind }
attributes #7 = { nounwind }
attributes #8 = { noreturn nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!5, !6}
!llvm.ident = !{!7}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 3.9.0 (http://llvm.org/git/clang.git 83402ed45b681e9f38ce6626e5899c19159ceb29) (http://llvm.org/git/llvm.git 4fc8e6fd79f212952e8f538b6d5d9d78098b4505)", isOptimized: true, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3)
!1 = !DIFile(filename: "CoinGame.c", directory: "/home/sam/workspace/WhileyOpenCL/polly/CoinGame/impl/autogenerate_array_copyonly")
!2 = !{}
!3 = !{!4}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64, align: 64)
!5 = !{i32 2, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{!"clang version 3.9.0 (http://llvm.org/git/clang.git 83402ed45b681e9f38ce6626e5899c19159ceb29) (http://llvm.org/git/llvm.git 4fc8e6fd79f212952e8f538b6d5d9d78098b4505)"}
!8 = distinct !DISubprogram(name: "findMoves", scope: !1, file: !1, line: 2, type: !9, isLocal: false, isDefinition: true, scopeLine: 2, flags: DIFlagPrototyped, isOptimized: true, unit: !0, variables: !13)
!9 = !DISubroutineType(types: !10)
!10 = !{!11, !11, !12, !12}
!11 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !12, size: 64, align: 64)
!12 = !DIBasicType(name: "long long int", size: 64, align: 64, encoding: DW_ATE_signed)
!13 = !{!14, !15, !16, !17, !18, !19, !20, !21, !22, !23, !24, !25, !26, !27, !28, !29, !30, !31, !32, !33, !34, !35, !36, !37, !38, !39, !40, !41, !42, !43, !44, !45, !46, !47, !48, !49, !50, !51, !52, !53, !54, !55, !56, !57, !58, !59, !60, !61, !62, !63, !64, !65, !66, !67, !68, !69, !70, !71, !72, !73, !74, !75, !76, !77, !78, !79, !80, !81, !82, !83, !84, !85, !86, !87, !88, !89, !90, !91, !92}
!14 = !DILocalVariable(name: "moves", arg: 1, scope: !8, file: !1, line: 2, type: !11)
!15 = !DILocalVariable(name: "moves_size", arg: 2, scope: !8, file: !1, line: 2, type: !12)
!16 = !DILocalVariable(name: "n", arg: 3, scope: !8, file: !1, line: 2, type: !12)
!17 = !DILocalVariable(name: "_2", scope: !8, file: !1, line: 3, type: !11)
!18 = !DILocalVariable(name: "_2_size", scope: !8, file: !1, line: 3, type: !12)
!19 = !DILocalVariable(name: "x", scope: !8, file: !1, line: 4, type: !11)
!20 = !DILocalVariable(name: "x_size", scope: !8, file: !1, line: 4, type: !12)
!21 = !DILocalVariable(name: "y", scope: !8, file: !1, line: 5, type: !11)
!22 = !DILocalVariable(name: "y_size", scope: !8, file: !1, line: 5, type: !12)
!23 = !DILocalVariable(name: "z", scope: !8, file: !1, line: 6, type: !11)
!24 = !DILocalVariable(name: "z_size", scope: !8, file: !1, line: 6, type: !12)
!25 = !DILocalVariable(name: "s", scope: !8, file: !1, line: 7, type: !12)
!26 = !DILocalVariable(name: "j", scope: !8, file: !1, line: 8, type: !12)
!27 = !DILocalVariable(name: "i", scope: !8, file: !1, line: 9, type: !12)
!28 = !DILocalVariable(name: "_9", scope: !8, file: !1, line: 10, type: !12)
!29 = !DILocalVariable(name: "_10", scope: !8, file: !1, line: 11, type: !11)
!30 = !DILocalVariable(name: "_10_size", scope: !8, file: !1, line: 11, type: !12)
!31 = !DILocalVariable(name: "_11", scope: !8, file: !1, line: 12, type: !12)
!32 = !DILocalVariable(name: "_12", scope: !8, file: !1, line: 13, type: !11)
!33 = !DILocalVariable(name: "_12_size", scope: !8, file: !1, line: 13, type: !12)
!34 = !DILocalVariable(name: "_13", scope: !8, file: !1, line: 14, type: !12)
!35 = !DILocalVariable(name: "_14", scope: !8, file: !1, line: 15, type: !11)
!36 = !DILocalVariable(name: "_14_size", scope: !8, file: !1, line: 15, type: !12)
!37 = !DILocalVariable(name: "_15", scope: !8, file: !1, line: 16, type: !12)
!38 = !DILocalVariable(name: "_16", scope: !8, file: !1, line: 17, type: !12)
!39 = !DILocalVariable(name: "_17", scope: !8, file: !1, line: 18, type: !12)
!40 = !DILocalVariable(name: "_18", scope: !8, file: !1, line: 19, type: !12)
!41 = !DILocalVariable(name: "_19", scope: !8, file: !1, line: 20, type: !12)
!42 = !DILocalVariable(name: "_20", scope: !8, file: !1, line: 21, type: !12)
!43 = !DILocalVariable(name: "_21", scope: !8, file: !1, line: 22, type: !12)
!44 = !DILocalVariable(name: "_22", scope: !8, file: !1, line: 23, type: !12)
!45 = !DILocalVariable(name: "_23", scope: !8, file: !1, line: 24, type: !12)
!46 = !DILocalVariable(name: "_24", scope: !8, file: !1, line: 25, type: !12)
!47 = !DILocalVariable(name: "_25", scope: !8, file: !1, line: 26, type: !12)
!48 = !DILocalVariable(name: "_26", scope: !8, file: !1, line: 27, type: !12)
!49 = !DILocalVariable(name: "_27", scope: !8, file: !1, line: 28, type: !12)
!50 = !DILocalVariable(name: "_28", scope: !8, file: !1, line: 29, type: !12)
!51 = !DILocalVariable(name: "_29", scope: !8, file: !1, line: 30, type: !12)
!52 = !DILocalVariable(name: "_30", scope: !8, file: !1, line: 31, type: !12)
!53 = !DILocalVariable(name: "_31", scope: !8, file: !1, line: 32, type: !12)
!54 = !DILocalVariable(name: "_32", scope: !8, file: !1, line: 33, type: !12)
!55 = !DILocalVariable(name: "_33", scope: !8, file: !1, line: 34, type: !12)
!56 = !DILocalVariable(name: "_34", scope: !8, file: !1, line: 35, type: !12)
!57 = !DILocalVariable(name: "_35", scope: !8, file: !1, line: 36, type: !12)
!58 = !DILocalVariable(name: "_36", scope: !8, file: !1, line: 37, type: !12)
!59 = !DILocalVariable(name: "_37", scope: !8, file: !1, line: 38, type: !12)
!60 = !DILocalVariable(name: "_38", scope: !8, file: !1, line: 39, type: !12)
!61 = !DILocalVariable(name: "_39", scope: !8, file: !1, line: 40, type: !12)
!62 = !DILocalVariable(name: "_40", scope: !8, file: !1, line: 41, type: !12)
!63 = !DILocalVariable(name: "_41", scope: !8, file: !1, line: 42, type: !12)
!64 = !DILocalVariable(name: "_42", scope: !8, file: !1, line: 43, type: !12)
!65 = !DILocalVariable(name: "_43", scope: !8, file: !1, line: 44, type: !12)
!66 = !DILocalVariable(name: "_44", scope: !8, file: !1, line: 45, type: !12)
!67 = !DILocalVariable(name: "_45", scope: !8, file: !1, line: 46, type: !12)
!68 = !DILocalVariable(name: "_46", scope: !8, file: !1, line: 47, type: !12)
!69 = !DILocalVariable(name: "_47", scope: !8, file: !1, line: 48, type: !12)
!70 = !DILocalVariable(name: "_48", scope: !8, file: !1, line: 49, type: !12)
!71 = !DILocalVariable(name: "_49", scope: !8, file: !1, line: 50, type: !12)
!72 = !DILocalVariable(name: "_50", scope: !8, file: !1, line: 51, type: !12)
!73 = !DILocalVariable(name: "_51", scope: !8, file: !1, line: 52, type: !12)
!74 = !DILocalVariable(name: "_52", scope: !8, file: !1, line: 53, type: !12)
!75 = !DILocalVariable(name: "_53", scope: !8, file: !1, line: 54, type: !12)
!76 = !DILocalVariable(name: "_54", scope: !8, file: !1, line: 55, type: !12)
!77 = !DILocalVariable(name: "_55", scope: !8, file: !1, line: 56, type: !12)
!78 = !DILocalVariable(name: "_56", scope: !8, file: !1, line: 57, type: !12)
!79 = !DILocalVariable(name: "_57", scope: !8, file: !1, line: 58, type: !12)
!80 = !DILocalVariable(name: "_58", scope: !8, file: !1, line: 59, type: !12)
!81 = !DILocalVariable(name: "_59", scope: !8, file: !1, line: 60, type: !12)
!82 = !DILocalVariable(name: "_60", scope: !8, file: !1, line: 61, type: !12)
!83 = !DILocalVariable(name: "_61", scope: !8, file: !1, line: 62, type: !12)
!84 = !DILocalVariable(name: "_62", scope: !8, file: !1, line: 63, type: !12)
!85 = !DILocalVariable(name: "_63", scope: !8, file: !1, line: 64, type: !12)
!86 = !DILocalVariable(name: "_64", scope: !8, file: !1, line: 65, type: !12)
!87 = !DILocalVariable(name: "_65", scope: !8, file: !1, line: 66, type: !12)
!88 = !DILocalVariable(name: "_66", scope: !8, file: !1, line: 67, type: !12)
!89 = !DILocalVariable(name: "_67", scope: !8, file: !1, line: 68, type: !12)
!90 = !DILocalVariable(name: "_68", scope: !8, file: !1, line: 69, type: !12)
!91 = !DILocalVariable(name: "_69", scope: !8, file: !1, line: 70, type: !12)
!92 = !DILocalVariable(name: "_70", scope: !8, file: !1, line: 71, type: !12)
!93 = !DIExpression()
!94 = !DILocation(line: 2, column: 22, scope: !8)
!95 = !DILocation(line: 2, column: 60, scope: !8)
!96 = !DILocation(line: 3, column: 2, scope: !8)
!97 = !DILocation(line: 4, column: 2, scope: !8)
!98 = !DILocation(line: 5, column: 2, scope: !8)
!99 = !DILocation(line: 6, column: 2, scope: !8)
!100 = !DILocation(line: 7, column: 12, scope: !8)
!101 = !DILocation(line: 8, column: 12, scope: !8)
!102 = !DILocation(line: 9, column: 12, scope: !8)
!103 = !DILocation(line: 10, column: 12, scope: !8)
!104 = !DILocation(line: 11, column: 2, scope: !8)
!105 = !DILocation(line: 12, column: 12, scope: !8)
!106 = !DILocation(line: 13, column: 2, scope: !8)
!107 = !DILocation(line: 14, column: 12, scope: !8)
!108 = !DILocation(line: 15, column: 2, scope: !8)
!109 = !DILocation(line: 16, column: 12, scope: !8)
!110 = !DILocation(line: 17, column: 12, scope: !8)
!111 = !DILocation(line: 18, column: 12, scope: !8)
!112 = !DILocation(line: 19, column: 12, scope: !8)
!113 = !DILocation(line: 20, column: 12, scope: !8)
!114 = !DILocation(line: 21, column: 12, scope: !8)
!115 = !DILocation(line: 22, column: 12, scope: !8)
!116 = !DILocation(line: 23, column: 12, scope: !8)
!117 = !DILocation(line: 24, column: 12, scope: !8)
!118 = !DILocation(line: 25, column: 12, scope: !8)
!119 = !DILocation(line: 26, column: 12, scope: !8)
!120 = !DILocation(line: 27, column: 12, scope: !8)
!121 = !DILocation(line: 28, column: 12, scope: !8)
!122 = !DILocation(line: 29, column: 12, scope: !8)
!123 = !DILocation(line: 30, column: 12, scope: !8)
!124 = !DILocation(line: 31, column: 12, scope: !8)
!125 = !DILocation(line: 32, column: 12, scope: !8)
!126 = !DILocation(line: 33, column: 12, scope: !8)
!127 = !DILocation(line: 34, column: 12, scope: !8)
!128 = !DILocation(line: 35, column: 12, scope: !8)
!129 = !DILocation(line: 36, column: 12, scope: !8)
!130 = !DILocation(line: 37, column: 12, scope: !8)
!131 = !DILocation(line: 38, column: 12, scope: !8)
!132 = !DILocation(line: 39, column: 12, scope: !8)
!133 = !DILocation(line: 40, column: 12, scope: !8)
!134 = !DILocation(line: 41, column: 12, scope: !8)
!135 = !DILocation(line: 42, column: 12, scope: !8)
!136 = !DILocation(line: 43, column: 12, scope: !8)
!137 = !DILocation(line: 44, column: 12, scope: !8)
!138 = !DILocation(line: 45, column: 12, scope: !8)
!139 = !DILocation(line: 46, column: 12, scope: !8)
!140 = !DILocation(line: 47, column: 12, scope: !8)
!141 = !DILocation(line: 48, column: 12, scope: !8)
!142 = !DILocation(line: 49, column: 12, scope: !8)
!143 = !DILocation(line: 50, column: 12, scope: !8)
!144 = !DILocation(line: 51, column: 12, scope: !8)
!145 = !DILocation(line: 52, column: 12, scope: !8)
!146 = !DILocation(line: 53, column: 12, scope: !8)
!147 = !DILocation(line: 54, column: 12, scope: !8)
!148 = !DILocation(line: 55, column: 12, scope: !8)
!149 = !DILocation(line: 56, column: 12, scope: !8)
!150 = !DILocation(line: 57, column: 12, scope: !8)
!151 = !DILocation(line: 58, column: 12, scope: !8)
!152 = !DILocation(line: 59, column: 12, scope: !8)
!153 = !DILocation(line: 60, column: 12, scope: !8)
!154 = !DILocation(line: 61, column: 12, scope: !8)
!155 = !DILocation(line: 62, column: 12, scope: !8)
!156 = !DILocation(line: 63, column: 12, scope: !8)
!157 = !DILocation(line: 64, column: 12, scope: !8)
!158 = !DILocation(line: 65, column: 12, scope: !8)
!159 = !DILocation(line: 66, column: 12, scope: !8)
!160 = !DILocation(line: 67, column: 12, scope: !8)
!161 = !DILocation(line: 68, column: 12, scope: !8)
!162 = !DILocation(line: 69, column: 12, scope: !8)
!163 = !DILocation(line: 70, column: 12, scope: !8)
!164 = !DILocation(line: 71, column: 12, scope: !8)
!165 = !DILocation(line: 75, column: 2, scope: !8)
!166 = !DILocation(line: 81, column: 2, scope: !8)
!167 = !DILocation(line: 87, column: 2, scope: !8)
!168 = !DILocation(line: 97, column: 7, scope: !169)
!169 = distinct !DILexicalBlock(scope: !170, file: !1, line: 97, column: 6)
!170 = distinct !DILexicalBlock(scope: !8, file: !1, line: 95, column: 13)
!171 = !DILocation(line: 97, column: 6, scope: !170)
!172 = !DILocation(line: 107, column: 7, scope: !173)
!173 = distinct !DILexicalBlock(scope: !170, file: !1, line: 105, column: 14)
!174 = !DILocation(line: 111, column: 4, scope: !173)
!175 = !DILocation(line: 111, column: 9, scope: !173)
!176 = !{!177, !177, i64 0}
!177 = !{!"long long", !178, i64 0}
!178 = !{!"omnipotent char", !179, i64 0}
!179 = !{!"Simple C/C++ TBAA"}
!180 = !DILocation(line: 115, column: 9, scope: !173)
!181 = !DILocation(line: 117, column: 10, scope: !182)
!182 = distinct !DILexicalBlock(scope: !173, file: !1, line: 117, column: 7)
!183 = !DILocation(line: 125, column: 10, scope: !184)
!184 = distinct !DILexicalBlock(scope: !173, file: !1, line: 125, column: 7)
!185 = !DILocation(line: 117, column: 7, scope: !173)
!186 = !DILocation(line: 131, column: 11, scope: !173)
!187 = !DILocation(line: 133, column: 11, scope: !173)
!188 = !DILocation(line: 137, column: 11, scope: !173)
!189 = !DILocation(line: 139, column: 8, scope: !173)
!190 = !DILocation(line: 141, column: 9, scope: !173)
!191 = !DILocation(line: 141, column: 4, scope: !173)
!192 = !DILocation(line: 147, column: 4, scope: !173)
!193 = !DILocation(line: 147, column: 9, scope: !173)
!194 = !DILocation(line: 151, column: 9, scope: !173)
!195 = !DILocation(line: 153, column: 10, scope: !196)
!196 = distinct !DILexicalBlock(scope: !173, file: !1, line: 153, column: 7)
!197 = !DILocation(line: 153, column: 7, scope: !173)
!198 = !DILocation(line: 159, column: 11, scope: !173)
!199 = !DILocation(line: 161, column: 11, scope: !173)
!200 = !DILocation(line: 163, column: 8, scope: !173)
!201 = !DILocation(line: 165, column: 9, scope: !173)
!202 = !DILocation(line: 165, column: 4, scope: !173)
!203 = !DILocation(line: 171, column: 4, scope: !173)
!204 = !DILocation(line: 171, column: 9, scope: !173)
!205 = !DILocation(line: 179, column: 10, scope: !206)
!206 = distinct !DILexicalBlock(scope: !173, file: !1, line: 179, column: 7)
!207 = !DILocation(line: 179, column: 7, scope: !173)
!208 = !DILocation(line: 181, column: 9, scope: !173)
!209 = !DILocation(line: 183, column: 11, scope: !173)
!210 = !DILocation(line: 187, column: 11, scope: !173)
!211 = !DILocation(line: 189, column: 8, scope: !173)
!212 = !DILocation(line: 191, column: 9, scope: !173)
!213 = !DILocation(line: 191, column: 4, scope: !173)
!214 = !DILocation(line: 195, column: 8, scope: !173)
!215 = !DILocation(line: 197, column: 8, scope: !173)
!216 = !DILocation(line: 199, column: 10, scope: !217)
!217 = distinct !DILexicalBlock(scope: !173, file: !1, line: 199, column: 7)
!218 = !DILocation(line: 199, column: 7, scope: !173)
!219 = !DILocation(line: 203, column: 9, scope: !173)
!220 = !DILocation(line: 207, column: 8, scope: !173)
!221 = !DILocation(line: 209, column: 8, scope: !173)
!222 = !DILocation(line: 203, column: 4, scope: !173)
!223 = !DILocation(line: 211, column: 10, scope: !224)
!224 = distinct !DILexicalBlock(scope: !173, file: !1, line: 211, column: 7)
!225 = !DILocation(line: 211, column: 7, scope: !173)
!226 = !DILocation(line: 215, column: 9, scope: !173)
!227 = !DILocation(line: 219, column: 8, scope: !173)
!228 = !DILocation(line: 215, column: 4, scope: !173)
!229 = !DILocation(line: 223, column: 8, scope: !173)
!230 = !DILocation(line: 221, column: 9, scope: !173)
!231 = !DILocation(line: 225, column: 9, scope: !173)
!232 = !DILocation(line: 227, column: 10, scope: !233)
!233 = distinct !DILexicalBlock(scope: !173, file: !1, line: 227, column: 7)
!234 = !DILocation(line: 233, column: 9, scope: !173)
!235 = !DILocation(line: 235, column: 11, scope: !173)
!236 = !DILocation(line: 237, column: 4, scope: !173)
!237 = !DILocation(line: 239, column: 4, scope: !173)
!238 = !DILocation(line: 237, column: 15, scope: !173)
!239 = !DILocation(line: 257, column: 9, scope: !173)
!240 = !DILocation(line: 274, column: 8, scope: !170)
!241 = !DILocation(line: 283, column: 2, scope: !8)
!242 = distinct !{!242, !243, !"polly.alias.scope.moves"}
!243 = distinct !{!243, !"polly.alias.scope.domain"}
!244 = !{!245, !246, !247, !248}
!245 = distinct !{!245, !243, !"polly.alias.scope.storemerge"}
!246 = distinct !{!246, !243, !"polly.alias.scope.call4"}
!247 = distinct !{!247, !243, !"polly.alias.scope.call7"}
!248 = distinct !{!248, !243, !"polly.alias.scope.call"}
!249 = distinct !{!249}
!250 = !{!245, !247, !242, !248}
!251 = distinct !{!251}
!252 = !{!245, !246, !247, !242}
!253 = distinct !{!253}
!254 = !{!245, !246, !242, !248}
!255 = distinct !{!255}
!256 = distinct !{!256}
!257 = !DILocation(line: 227, column: 7, scope: !173)
!258 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 287, type: !259, isLocal: false, isDefinition: true, scopeLine: 287, flags: DIFlagPrototyped, isOptimized: true, unit: !0, variables: !265)
!259 = !DISubroutineType(types: !260)
!260 = !{!261, !261, !262}
!261 = !DIBasicType(name: "int", size: 32, align: 32, encoding: DW_ATE_signed)
!262 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !263, size: 64, align: 64)
!263 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !264, size: 64, align: 64)
!264 = !DIBasicType(name: "char", size: 8, align: 8, encoding: DW_ATE_signed_char)
!265 = !{!266, !267, !268, !269, !270, !271, !272, !273, !274, !276, !277, !278, !279, !280, !281, !282, !283, !284, !285, !286, !287, !288, !289, !290, !291, !292, !293, !294, !295, !296}
!266 = !DILocalVariable(name: "argc", arg: 1, scope: !258, file: !1, line: 287, type: !261)
!267 = !DILocalVariable(name: "args", arg: 2, scope: !258, file: !1, line: 287, type: !262)
!268 = !DILocalVariable(name: "max", scope: !258, file: !1, line: 288, type: !11)
!269 = !DILocalVariable(name: "n", scope: !258, file: !1, line: 289, type: !12)
!270 = !DILocalVariable(name: "moves", scope: !258, file: !1, line: 290, type: !11)
!271 = !DILocalVariable(name: "moves_size", scope: !258, file: !1, line: 290, type: !12)
!272 = !DILocalVariable(name: "sum_alice", scope: !258, file: !1, line: 291, type: !12)
!273 = !DILocalVariable(name: "_5", scope: !258, file: !1, line: 292, type: !11)
!274 = !DILocalVariable(name: "_6", scope: !258, file: !1, line: 293, type: !275)
!275 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !11, size: 64, align: 64)
!276 = !DILocalVariable(name: "_6_size", scope: !258, file: !1, line: 293, type: !12)
!277 = !DILocalVariable(name: "_6_size_size", scope: !258, file: !1, line: 293, type: !12)
!278 = !DILocalVariable(name: "_7", scope: !258, file: !1, line: 294, type: !12)
!279 = !DILocalVariable(name: "_8", scope: !258, file: !1, line: 295, type: !11)
!280 = !DILocalVariable(name: "_8_size", scope: !258, file: !1, line: 295, type: !12)
!281 = !DILocalVariable(name: "_9", scope: !258, file: !1, line: 296, type: !12)
!282 = !DILocalVariable(name: "_10", scope: !258, file: !1, line: 297, type: !12)
!283 = !DILocalVariable(name: "_11", scope: !258, file: !1, line: 298, type: !11)
!284 = !DILocalVariable(name: "_11_size", scope: !258, file: !1, line: 298, type: !12)
!285 = !DILocalVariable(name: "_12", scope: !258, file: !1, line: 299, type: !11)
!286 = !DILocalVariable(name: "_12_size", scope: !258, file: !1, line: 299, type: !12)
!287 = !DILocalVariable(name: "_13", scope: !258, file: !1, line: 300, type: !12)
!288 = !DILocalVariable(name: "_14", scope: !258, file: !1, line: 301, type: !12)
!289 = !DILocalVariable(name: "_15", scope: !258, file: !1, line: 302, type: !12)
!290 = !DILocalVariable(name: "_16", scope: !258, file: !1, line: 303, type: !4)
!291 = !DILocalVariable(name: "_18", scope: !258, file: !1, line: 304, type: !11)
!292 = !DILocalVariable(name: "_18_size", scope: !258, file: !1, line: 304, type: !12)
!293 = !DILocalVariable(name: "_19", scope: !258, file: !1, line: 305, type: !4)
!294 = !DILocalVariable(name: "_21", scope: !258, file: !1, line: 306, type: !4)
!295 = !DILocalVariable(name: "_23", scope: !258, file: !1, line: 307, type: !11)
!296 = !DILocalVariable(name: "_23_size", scope: !258, file: !1, line: 307, type: !12)
!297 = !DILocation(line: 287, column: 14, scope: !258)
!298 = !DILocation(line: 287, column: 27, scope: !258)
!299 = !DILocation(line: 289, column: 12, scope: !258)
!300 = !DILocation(line: 290, column: 2, scope: !258)
!301 = !DILocation(line: 291, column: 12, scope: !258)
!302 = !DILocation(line: 293, column: 2, scope: !258)
!303 = !DILocation(line: 294, column: 12, scope: !258)
!304 = !DILocation(line: 295, column: 2, scope: !258)
!305 = !DILocation(line: 296, column: 12, scope: !258)
!306 = !DILocation(line: 297, column: 12, scope: !258)
!307 = !DILocation(line: 298, column: 2, scope: !258)
!308 = !DILocation(line: 299, column: 2, scope: !258)
!309 = !DILocation(line: 300, column: 12, scope: !258)
!310 = !DILocation(line: 301, column: 12, scope: !258)
!311 = !DILocation(line: 302, column: 12, scope: !258)
!312 = !DILocation(line: 304, column: 2, scope: !258)
!313 = !DILocation(line: 307, column: 2, scope: !258)
!314 = !DILocation(line: 309, column: 2, scope: !258)
!315 = !DILocation(line: 313, column: 5, scope: !258)
!316 = !{!317, !317, i64 0}
!317 = !{!"any pointer", !178, i64 0}
!318 = !DILocation(line: 315, column: 2, scope: !258)
!319 = !DILocation(line: 292, column: 13, scope: !258)
!320 = !DILocation(line: 288, column: 13, scope: !258)
!321 = !DILocation(line: 319, column: 9, scope: !322)
!322 = distinct !DILexicalBlock(scope: !258, file: !1, line: 319, column: 5)
!323 = !DILocation(line: 319, column: 5, scope: !258)
!324 = !DILocation(line: 321, column: 6, scope: !258)
!325 = !DILocation(line: 325, column: 7, scope: !258)
!326 = !DILocation(line: 327, column: 2, scope: !258)
!327 = !DILocation(line: 332, column: 8, scope: !258)
!328 = !DILocation(line: 338, column: 7, scope: !258)
!329 = !DILocation(line: 340, column: 6, scope: !258)
!330 = !DILocation(line: 346, column: 2, scope: !258)
!331 = !DILocation(line: 347, column: 9, scope: !258)
!332 = !DILocation(line: 347, column: 29, scope: !258)
!333 = !DILocation(line: 347, column: 36, scope: !258)
!334 = !DILocation(line: 347, column: 56, scope: !258)
!335 = !DILocation(line: 347, column: 63, scope: !258)
!336 = !DILocation(line: 347, column: 84, scope: !258)
!337 = !DILocation(line: 347, column: 91, scope: !258)
!338 = !DILocation(line: 347, column: 111, scope: !258)
!339 = !DILocation(line: 347, column: 118, scope: !258)
!340 = !DILocation(line: 347, column: 138, scope: !258)
!341 = !DILocation(line: 347, column: 146, scope: !258)
!342 = !DILocation(line: 347, column: 167, scope: !258)
!343 = !DILocation(line: 347, column: 175, scope: !258)
!344 = !DILocation(line: 347, column: 197, scope: !258)
!345 = !DILocation(line: 347, column: 205, scope: !258)
!346 = !DILocation(line: 347, column: 227, scope: !258)
!347 = !DILocation(line: 347, column: 235, scope: !258)
!348 = !DILocation(line: 347, column: 256, scope: !258)
!349 = !DILocation(line: 347, column: 264, scope: !258)
!350 = !DILocation(line: 347, column: 285, scope: !258)
!351 = !DILocation(line: 347, column: 293, scope: !258)
!352 = !DILocation(line: 347, column: 315, scope: !258)
!353 = !DILocation(line: 347, column: 323, scope: !258)
!354 = !DILocation(line: 347, column: 345, scope: !258)
!355 = !DILocation(line: 347, column: 353, scope: !258)
!356 = !DILocation(line: 347, column: 374, scope: !258)
!357 = !DILocation(line: 347, column: 382, scope: !258)
!358 = !DILocation(line: 347, column: 403, scope: !258)
!359 = !DILocation(line: 347, column: 411, scope: !258)
!360 = !DILocation(line: 347, column: 432, scope: !258)
!361 = !DILocation(line: 347, column: 440, scope: !258)
!362 = !DILocation(line: 347, column: 462, scope: !258)
!363 = !DILocation(line: 347, column: 470, scope: !258)
!364 = !DILocation(line: 347, column: 492, scope: !258)
!365 = !DILocation(line: 347, column: 500, scope: !258)
!366 = !DILocation(line: 347, column: 520, scope: !258)
!367 = !DILocation(line: 347, column: 528, scope: !258)
!368 = !DILocation(line: 347, column: 549, scope: !258)
!369 = !DILocation(line: 347, column: 557, scope: !258)
!370 = !DILocation(line: 347, column: 578, scope: !258)
!371 = !DILocation(line: 347, column: 586, scope: !258)
!372 = !DILocation(line: 347, column: 607, scope: !258)
!373 = !DILocation(line: 347, column: 615, scope: !258)
!374 = !DILocation(line: 347, column: 637, scope: !258)
!375 = !DILocation(line: 347, column: 645, scope: !258)
!376 = !DILocation(line: 347, column: 667, scope: !258)
!377 = !DILocation(line: 347, column: 675, scope: !258)
!378 = !DILocation(line: 347, column: 696, scope: !258)
!379 = !DILocation(line: 347, column: 704, scope: !258)
!380 = !DILocation(line: 349, column: 2, scope: !258)
!381 = !DILocation(line: 353, column: 2, scope: !258)
!382 = !DILocation(line: 357, column: 2, scope: !258)
!383 = !DILocation(line: 358, column: 9, scope: !258)
!384 = !DILocation(line: 358, column: 28, scope: !258)
!385 = !DILocation(line: 358, column: 35, scope: !258)
!386 = !DILocation(line: 358, column: 56, scope: !258)
!387 = !DILocation(line: 358, column: 63, scope: !258)
!388 = !DILocation(line: 358, column: 82, scope: !258)
!389 = !DILocation(line: 358, column: 89, scope: !258)
!390 = !DILocation(line: 358, column: 110, scope: !258)
!391 = !DILocation(line: 358, column: 117, scope: !258)
!392 = !DILocation(line: 358, column: 137, scope: !258)
!393 = !DILocation(line: 358, column: 145, scope: !258)
!394 = !DILocation(line: 358, column: 166, scope: !258)
!395 = !DILocation(line: 358, column: 174, scope: !258)
!396 = !DILocation(line: 358, column: 195, scope: !258)
!397 = !DILocation(line: 358, column: 203, scope: !258)
!398 = !DILocation(line: 358, column: 225, scope: !258)
!399 = !DILocation(line: 358, column: 233, scope: !258)
!400 = !DILocation(line: 358, column: 255, scope: !258)
!401 = !DILocation(line: 358, column: 263, scope: !258)
!402 = !DILocation(line: 358, column: 283, scope: !258)
!403 = !DILocation(line: 358, column: 291, scope: !258)
!404 = !DILocation(line: 358, column: 312, scope: !258)
!405 = !DILocation(line: 358, column: 320, scope: !258)
!406 = !DILocation(line: 360, column: 2, scope: !258)
!407 = !DILocation(line: 364, column: 2, scope: !258)
