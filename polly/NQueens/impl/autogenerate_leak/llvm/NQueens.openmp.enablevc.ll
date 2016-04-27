; ModuleID = 'NQueens.c'
source_filename = "NQueens.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }
%struct.POS = type { i64, i64 }

@.str.1 = private unnamed_addr constant [4 x i8] c" r:\00", align 1
@.str.2 = private unnamed_addr constant [5 x i8] c"%lld\00", align 1
@.str.3 = private unnamed_addr constant [4 x i8] c" c:\00", align 1
@stderr = external global %struct._IO_FILE*, align 8
@.str.5 = private unnamed_addr constant [5 x i8] c"fail\00", align 1
@.str.6 = private unnamed_addr constant [6 x i8] c"%lld\0A\00", align 1

; Function Attrs: nounwind uwtable
define noalias %struct.POS* @copy_POS(%struct.POS* nocapture readonly %_POS) #0 !dbg !8 {
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
declare noalias i8* @malloc(i64) #1

; Function Attrs: nounwind uwtable
define noalias %struct.POS** @copy_array_POS(%struct.POS** nocapture readonly %_POS, i64 %_POS_size) #0 !dbg !35 {
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
  br i1 %exitcond, label %for.cond.cleanup.loopexit, label %for.body, !dbg !57
}

; Function Attrs: nounwind uwtable
define void @free_POS(%struct.POS* nocapture %pos) #0 !dbg !69 {
entry:
  tail call void @llvm.dbg.value(metadata %struct.POS* %pos, i64 0, metadata !73, metadata !22), !dbg !74
  %0 = bitcast %struct.POS* %pos to i8*, !dbg !75
  tail call void @free(i8* %0) #7, !dbg !76
  ret void, !dbg !77
}

; Function Attrs: nounwind
declare void @free(i8* nocapture) #1

; Function Attrs: nounwind uwtable
define void @printf_POS(%struct.POS* nocapture readonly %pos) #0 !dbg !78 {
entry:
  tail call void @llvm.dbg.value(metadata %struct.POS* %pos, i64 0, metadata !80, metadata !22), !dbg !81
  %putchar = tail call i32 @putchar(i32 123) #7, !dbg !82
  %call1 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.1, i64 0, i64 0)), !dbg !83
  %r = getelementptr inbounds %struct.POS, %struct.POS* %pos, i64 0, i32 0, !dbg !84
  %0 = load i64, i64* %r, align 8, !dbg !84, !tbaa !85
  %call2 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.2, i64 0, i64 0), i64 %0), !dbg !87
  %call3 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.3, i64 0, i64 0)), !dbg !88
  %c = getelementptr inbounds %struct.POS, %struct.POS* %pos, i64 0, i32 1, !dbg !89
  %1 = load i64, i64* %c, align 8, !dbg !89, !tbaa !90
  %call4 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.2, i64 0, i64 0), i64 %1), !dbg !91
  %putchar7 = tail call i32 @putchar(i32 125) #7, !dbg !92
  ret void, !dbg !93
}

; Function Attrs: nounwind
declare i32 @printf(i8* nocapture readonly, ...) #1

; Function Attrs: norecurse nounwind readonly uwtable
define i64 @conflict(%struct.POS* nocapture readonly %p, i64 %row, i64 %col) #2 !dbg !94 {
entry:
  %polly.access.cast.p = getelementptr inbounds %struct.POS, %struct.POS* %p, i64 0, i32 0
  %polly.access.p.load = load i64, i64* %polly.access.cast.p, align 8
  %polly.access.p44 = getelementptr i64, i64* %polly.access.cast.p, i64 1
  %polly.access.p44.load = load i64, i64* %polly.access.p44, align 8
  %0 = icmp slt i64 %polly.access.p.load, %row
  %1 = icmp slt i64 %polly.access.p44.load, %col
  %2 = icmp sgt i64 %polly.access.p44.load, %col
  %3 = icmp ne i64 %polly.access.p44.load, %col
  %4 = and i1 %0, %3
  %5 = icmp sgt i64 %polly.access.p.load, %row
  %6 = and i1 %5, %1
  %7 = or i1 %4, %6
  %8 = and i1 %5, %2
  %9 = or i1 %8, %7
  br i1 %9, label %polly.stmt.blklab0, label %polly.exiting

polly.exiting:                                    ; preds = %entry, %polly.stmt.blklab0
  %retval.0.s2a.0 = phi i64 [ %p_., %polly.stmt.blklab0 ], [ 1, %entry ]
  ret i64 %retval.0.s2a.0, !dbg !114

polly.stmt.blklab0:                               ; preds = %entry
  %p_sub = sub nsw i64 %polly.access.p44.load, %col, !dbg !115
  %p_ispos = icmp sgt i64 %p_sub, -1, !dbg !116
  %p_neg = sub i64 0, %p_sub, !dbg !116
  %p_ = select i1 %p_ispos, i64 %p_sub, i64 %p_neg, !dbg !116
  %p_sub6 = sub nsw i64 %polly.access.p.load, %row, !dbg !117
  %p_ispos41 = icmp sgt i64 %p_sub6, -1, !dbg !118
  %p_neg42 = sub i64 0, %p_sub6, !dbg !118
  %p_46 = select i1 %p_ispos41, i64 %p_sub6, i64 %p_neg42, !dbg !118
  %p_cmp8 = icmp eq i64 %p_, %p_46, !dbg !119
  %p_. = zext i1 %p_cmp8 to i64, !dbg !121
  br label %polly.exiting
}

; Function Attrs: nounwind uwtable
define i64 @run(%struct.POS** nocapture %queens, i64 %queens_size, i64 %n, i64 %dim) #0 !dbg !122 {
entry:
  tail call void @llvm.dbg.value(metadata %struct.POS** %queens, i64 0, metadata !126, metadata !22), !dbg !161
  tail call void @llvm.dbg.value(metadata i64 %queens_size, i64 0, metadata !127, metadata !22), !dbg !162
  tail call void @llvm.dbg.value(metadata i64 %n, i64 0, metadata !128, metadata !22), !dbg !163
  tail call void @llvm.dbg.value(metadata i64 %dim, i64 0, metadata !129, metadata !22), !dbg !164
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !130, metadata !22), !dbg !165
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !131, metadata !22), !dbg !166
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !132, metadata !22), !dbg !167
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !134, metadata !22), !dbg !168
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !136, metadata !22), !dbg !169
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !137, metadata !22), !dbg !170
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !138, metadata !22), !dbg !171
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !139, metadata !22), !dbg !172
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !140, metadata !22), !dbg !173
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !142, metadata !22), !dbg !174
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !143, metadata !22), !dbg !175
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !144, metadata !22), !dbg !176
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !145, metadata !22), !dbg !177
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !151, metadata !22), !dbg !178
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !152, metadata !22), !dbg !179
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !155, metadata !22), !dbg !180
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !156, metadata !22), !dbg !181
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !157, metadata !22), !dbg !182
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !158, metadata !22), !dbg !183
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !159, metadata !22), !dbg !184
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !160, metadata !22), !dbg !185
  %cmp = icmp eq i64 %dim, %n, !dbg !186
  br i1 %cmp, label %cleanup, label %while.cond.preheader, !dbg !188

while.cond.preheader:                             ; preds = %entry
  tail call void @llvm.dbg.value(metadata i64 %queens_size, i64 0, metadata !139, metadata !22), !dbg !172
  %cmp1 = icmp slt i64 %n, %queens_size, !dbg !189
  %cmp4 = icmp eq i64 %dim, %queens_size, !dbg !193
  %or.cond = and i1 %cmp1, %cmp4, !dbg !195
  tail call void @llvm.dbg.value(metadata i64 %queens_size, i64 0, metadata !140, metadata !22), !dbg !173
  br i1 %or.cond, label %blklab10.preheader, label %blklab11, !dbg !195

blklab10.preheader:                               ; preds = %while.cond.preheader
  %cmp22141 = icmp sgt i64 %n, 0, !dbg !196
  %arrayidx37 = getelementptr inbounds %struct.POS*, %struct.POS** %queens, i64 %n, !dbg !199
  %0 = bitcast %struct.POS** %arrayidx37 to i8**, !dbg !200
  %add38 = add nsw i64 %n, 1, !dbg !201
  %cmp7.us145 = icmp sgt i64 %dim, 0, !dbg !202
  br i1 %cmp7.us145, label %blklab14.preheader.us.preheader, label %cleanup, !dbg !204

blklab14.preheader.us.preheader:                  ; preds = %blklab10.preheader
  br label %blklab14.preheader.us, !dbg !177

blklab12.us:                                      ; preds = %blklab18.us
  %_23.0.us.lcssa = phi i64 [ %_23.0.us, %blklab18.us ]
  tail call void @llvm.dbg.value(metadata i64 1, i64 0, metadata !153, metadata !22), !dbg !205
  %cmp33.us = icmp eq i64 %_23.0.us.lcssa, 1, !dbg !206
  br i1 %cmp33.us, label %if.end35.us, label %blklab22.us, !dbg !208

if.end35.us:                                      ; preds = %blklab14.preheader.us, %blklab12.us
  %call36.us = tail call noalias i8* @malloc(i64 16) #7, !dbg !209
  %c.us = getelementptr inbounds i8, i8* %call36.us, i64 8, !dbg !210
  %1 = bitcast i8* %c.us to i64*, !dbg !210
  store i64 %col.0135.us148, i64* %1, align 8, !dbg !211, !tbaa !90
  %r.us = bitcast i8* %call36.us to i64*, !dbg !212
  store i64 %n, i64* %r.us, align 8, !dbg !213, !tbaa !85
  store i8* %call36.us, i8** %0, align 8, !dbg !200, !tbaa !61
  tail call void @llvm.dbg.value(metadata i64 1, i64 0, metadata !156, metadata !22), !dbg !181
  tail call void @llvm.dbg.value(metadata i64 %add38, i64 0, metadata !157, metadata !22), !dbg !182
  %call39.us = tail call i64 @run(%struct.POS** %queens, i64 %dim, i64 %add38, i64 %dim), !dbg !214
  tail call void @llvm.dbg.value(metadata i64 %call39.us, i64 0, metadata !155, metadata !22), !dbg !180
  %add40.us = add nsw i64 %call39.us, %num_solutions.0136.us146, !dbg !215
  tail call void @llvm.dbg.value(metadata i64 %add40.us, i64 0, metadata !158, metadata !22), !dbg !183
  tail call void @llvm.dbg.value(metadata i64 %add40.us, i64 0, metadata !131, metadata !22), !dbg !166
  br label %blklab22.us, !dbg !216

blklab22.us:                                      ; preds = %if.end35.us, %blklab12.us
  %num_solutions.1.us = phi i64 [ %num_solutions.0136.us146, %blklab12.us ], [ %add40.us, %if.end35.us ]
  tail call void @llvm.dbg.value(metadata i64 1, i64 0, metadata !159, metadata !22), !dbg !184
  %add41.us = add nuw nsw i64 %col.0135.us148, 1, !dbg !217
  tail call void @llvm.dbg.value(metadata i64 %add41.us, i64 0, metadata !160, metadata !22), !dbg !185
  tail call void @llvm.dbg.value(metadata i64 %add41.us, i64 0, metadata !132, metadata !22), !dbg !167
  tail call void @llvm.dbg.value(metadata i64 %queens_size, i64 0, metadata !139, metadata !22), !dbg !172
  tail call void @llvm.dbg.value(metadata i64 %queens_size, i64 0, metadata !140, metadata !22), !dbg !173
  %cmp7.us = icmp slt i64 %add41.us, %dim, !dbg !202
  br i1 %cmp7.us, label %blklab14.preheader.us, label %cleanup.loopexit, !dbg !204

if.end24.us:                                      ; preds = %if.end24.us.preheader, %blklab18.us
  %i.0133143.us = phi i64 [ %add.us, %blklab18.us ], [ 0, %if.end24.us.preheader ]
  %isSolution.0134142.us = phi i64 [ %_23.0.us, %blklab18.us ], [ 1, %if.end24.us.preheader ]
  %arrayidx.us = getelementptr inbounds %struct.POS*, %struct.POS** %queens, i64 %i.0133143.us, !dbg !218
  %2 = load %struct.POS*, %struct.POS** %arrayidx.us, align 8, !dbg !218, !tbaa !61
  tail call void @llvm.dbg.value(metadata %struct.POS* %2, i64 0, metadata !20, metadata !22) #7, !dbg !219
  %r.i.us = getelementptr inbounds %struct.POS, %struct.POS* %2, i64 0, i32 0, !dbg !221
  %3 = load i64, i64* %r.i.us, align 8, !dbg !222, !tbaa !85
  %c.i.us = getelementptr inbounds %struct.POS, %struct.POS* %2, i64 0, i32 1, !dbg !223
  %4 = load i64, i64* %c.i.us, align 8, !dbg !222, !tbaa !90
  tail call void @llvm.dbg.value(metadata i64 1, i64 0, metadata !147, metadata !22), !dbg !224
  %cmp26.us = icmp eq i64 %isSolution.0134142.us, 1, !dbg !225
  br i1 %cmp26.us, label %blklab20.us, label %blklab18.us, !dbg !227

blklab20.us:                                      ; preds = %if.end24.us
  %5 = icmp slt i64 %3, %n, !dbg !222
  %6 = icmp slt i64 %4, %col.0135.us148, !dbg !222
  %7 = icmp sgt i64 %4, %col.0135.us148, !dbg !222
  %8 = icmp ne i64 %4, %col.0135.us148, !dbg !222
  %9 = and i1 %5, %8, !dbg !222
  %10 = icmp sgt i64 %3, %n, !dbg !222
  %11 = and i1 %10, %6, !dbg !222
  %12 = or i1 %9, %11, !dbg !222
  %13 = and i1 %10, %7, !dbg !222
  %14 = or i1 %13, %12, !dbg !222
  br i1 %14, label %polly.stmt.blklab0.i.us, label %conflict.exit.us, !dbg !222

polly.stmt.blklab0.i.us:                          ; preds = %blklab20.us
  %p_sub.i.us = sub nsw i64 %4, %col.0135.us148, !dbg !228
  %p_ispos.i.us = icmp sgt i64 %p_sub.i.us, -1, !dbg !230
  %p_neg.i.us = sub i64 0, %p_sub.i.us, !dbg !230
  %p_.i.us = select i1 %p_ispos.i.us, i64 %p_sub.i.us, i64 %p_neg.i.us, !dbg !230
  %p_sub6.i.us = sub nsw i64 %3, %n, !dbg !231
  %p_ispos41.i.us = icmp sgt i64 %p_sub6.i.us, -1, !dbg !232
  %p_neg42.i.us = sub i64 0, %p_sub6.i.us, !dbg !232
  %p_46.i.us = select i1 %p_ispos41.i.us, i64 %p_sub6.i.us, i64 %p_neg42.i.us, !dbg !232
  %p_cmp8.i.us = icmp eq i64 %p_.i.us, %p_46.i.us, !dbg !233
  %p_..i.us = zext i1 %p_cmp8.i.us to i64, !dbg !234
  br label %conflict.exit.us, !dbg !222

conflict.exit.us:                                 ; preds = %polly.stmt.blklab0.i.us, %blklab20.us
  %retval.0.s2a.0.i.us = phi i64 [ %p_..i.us, %polly.stmt.blklab0.i.us ], [ 1, %blklab20.us ], !dbg !222
  tail call void @llvm.dbg.value(metadata i64 %retval.0.s2a.0.i.us, i64 0, metadata !148, metadata !22), !dbg !235
  tail call void @llvm.dbg.value(metadata i64 1, i64 0, metadata !149, metadata !22), !dbg !236
  tail call void @llvm.dbg.value(metadata i64 1, i64 0, metadata !150, metadata !22), !dbg !237
  %15 = xor i64 %retval.0.s2a.0.i.us, 1, !dbg !238
  br label %blklab18.us, !dbg !238

blklab18.us:                                      ; preds = %conflict.exit.us, %if.end24.us
  %_23.0.us = phi i64 [ 0, %if.end24.us ], [ %15, %conflict.exit.us ]
  tail call void @llvm.dbg.value(metadata i64 %_23.0.us, i64 0, metadata !133, metadata !22), !dbg !239
  tail call void @llvm.dbg.value(metadata i64 1, i64 0, metadata !151, metadata !22), !dbg !178
  %add.us = add nuw nsw i64 %i.0133143.us, 1, !dbg !240
  tail call void @llvm.dbg.value(metadata i64 %add.us, i64 0, metadata !152, metadata !22), !dbg !179
  tail call void @llvm.dbg.value(metadata i64 %add.us, i64 0, metadata !134, metadata !22), !dbg !168
  tail call void @llvm.dbg.value(metadata i64 %queens_size, i64 0, metadata !143, metadata !22), !dbg !175
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !144, metadata !22), !dbg !176
  tail call void @llvm.dbg.value(metadata i64 %queens_size, i64 0, metadata !145, metadata !22), !dbg !177
  %exitcond = icmp eq i64 %add.us, %n, !dbg !241
  br i1 %exitcond, label %blklab12.us, label %if.end24.us, !dbg !241

blklab14.preheader.us:                            ; preds = %blklab14.preheader.us.preheader, %blklab22.us
  %col.0135.us148 = phi i64 [ %add41.us, %blklab22.us ], [ 0, %blklab14.preheader.us.preheader ]
  %num_solutions.0136.us146 = phi i64 [ %num_solutions.1.us, %blklab22.us ], [ 0, %blklab14.preheader.us.preheader ]
  tail call void @llvm.dbg.value(metadata i64 %queens_size, i64 0, metadata !145, metadata !22), !dbg !177
  br i1 %cmp22141, label %if.end24.us.preheader, label %if.end35.us, !dbg !241

if.end24.us.preheader:                            ; preds = %blklab14.preheader.us
  br label %if.end24.us, !dbg !218

blklab11:                                         ; preds = %while.cond.preheader
  %16 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !dbg !242, !tbaa !61
  %17 = tail call i64 @fwrite(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.5, i64 0, i64 0), i64 4, i64 1, %struct._IO_FILE* %16) #9, !dbg !243
  tail call void @exit(i32 -1) #10, !dbg !244
  unreachable, !dbg !244

cleanup.loopexit:                                 ; preds = %blklab22.us
  %num_solutions.1.us.lcssa = phi i64 [ %num_solutions.1.us, %blklab22.us ]
  br label %cleanup, !dbg !245

cleanup:                                          ; preds = %cleanup.loopexit, %blklab10.preheader, %entry
  %retval.0 = phi i64 [ 1, %entry ], [ 0, %blklab10.preheader ], [ %num_solutions.1.us.lcssa, %cleanup.loopexit ]
  ret i64 %retval.0, !dbg !245
}

; Function Attrs: noreturn nounwind
declare void @exit(i32) #3

; Function Attrs: noreturn nounwind uwtable
define i32 @main(i32 %argc, i8** %args) #4 !dbg !247 {
entry:
  tail call void @llvm.dbg.value(metadata i32 %argc, i64 0, metadata !254, metadata !22), !dbg !293
  tail call void @llvm.dbg.value(metadata i8** %args, i64 0, metadata !255, metadata !22), !dbg !294
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !258, metadata !22), !dbg !295
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !260, metadata !22), !dbg !296
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !261, metadata !22), !dbg !297
  tail call void @llvm.dbg.value(metadata i64** null, i64 0, metadata !263, metadata !22), !dbg !298
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !265, metadata !22), !dbg !298
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !266, metadata !22), !dbg !298
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !267, metadata !22), !dbg !299
  tail call void @llvm.dbg.value(metadata i64* null, i64 0, metadata !268, metadata !22), !dbg !300
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !269, metadata !22), !dbg !300
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !270, metadata !22), !dbg !301
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !271, metadata !22), !dbg !302
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !274, metadata !22), !dbg !303
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !275, metadata !22), !dbg !304
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !276, metadata !22), !dbg !305
  tail call void @llvm.dbg.value(metadata i64* null, i64 0, metadata !278, metadata !22), !dbg !306
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !279, metadata !22), !dbg !306
  tail call void @llvm.dbg.value(metadata i64* null, i64 0, metadata !281, metadata !22), !dbg !307
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !282, metadata !22), !dbg !307
  tail call void @llvm.dbg.value(metadata i64* null, i64 0, metadata !285, metadata !22), !dbg !308
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !286, metadata !22), !dbg !308
  tail call void @llvm.dbg.value(metadata i64* null, i64 0, metadata !289, metadata !22), !dbg !309
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !290, metadata !22), !dbg !309
  %call = tail call i64** @convertArgsToIntArray(i32 %argc, i8** %args) #7, !dbg !310
  tail call void @llvm.dbg.value(metadata i64** %call, i64 0, metadata !263, metadata !22), !dbg !298
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !267, metadata !22), !dbg !299
  %0 = load i64*, i64** %call, align 8, !dbg !311, !tbaa !61
  tail call void @llvm.dbg.value(metadata i64* %0, i64 0, metadata !268, metadata !22), !dbg !300
  %call1 = tail call i64* @parseStringToInt(i64* %0) #7, !dbg !312
  tail call void @llvm.dbg.value(metadata i64* %call1, i64 0, metadata !262, metadata !22), !dbg !313
  tail call void @llvm.dbg.value(metadata i64* %call1, i64 0, metadata !256, metadata !22), !dbg !314
  %cmp = icmp eq i64* %call1, null, !dbg !315
  br i1 %cmp, label %blklab23, label %if.end, !dbg !317

if.end:                                           ; preds = %entry
  %1 = load i64, i64* %call1, align 8, !dbg !318, !tbaa !29
  tail call void @llvm.dbg.value(metadata i64 %1, i64 0, metadata !258, metadata !22), !dbg !295
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !270, metadata !22), !dbg !301
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !271, metadata !22), !dbg !302
  %mul = shl i64 %1, 3, !dbg !319
  %call4 = tail call noalias i8* @malloc(i64 %mul) #7, !dbg !320
  %2 = bitcast i8* %call4 to %struct.POS**, !dbg !320
  tail call void @llvm.dbg.value(metadata %struct.POS** %2, i64 0, metadata !273, metadata !22), !dbg !321
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !291, metadata !22), !dbg !322
  %cmp6137 = icmp sgt i64 %1, 0, !dbg !323
  br i1 %cmp6137, label %for.body.preheader, label %for.cond.cleanup, !dbg !326

for.body.preheader:                               ; preds = %if.end
  br label %for.body, !dbg !327

for.cond.cleanup.loopexit:                        ; preds = %for.body
  br label %for.cond.cleanup, !dbg !303

for.cond.cleanup:                                 ; preds = %for.cond.cleanup.loopexit, %if.end
  tail call void @llvm.dbg.value(metadata i64 %1, i64 0, metadata !274, metadata !22), !dbg !303
  tail call void @llvm.dbg.value(metadata i64 %1, i64 0, metadata !260, metadata !22), !dbg !296
  tail call void @llvm.dbg.value(metadata %struct.POS** %2, i64 0, metadata !259, metadata !22), !dbg !331
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !276, metadata !22), !dbg !305
  %call10 = tail call i64 @run(%struct.POS** %2, i64 %1, i64 0, i64 %1), !dbg !332
  tail call void @llvm.dbg.value(metadata i64 %call10, i64 0, metadata !275, metadata !22), !dbg !304
  tail call void @llvm.dbg.value(metadata i64 %call10, i64 0, metadata !261, metadata !22), !dbg !297
  tail call void @llvm.dbg.value(metadata i64 33, i64 0, metadata !279, metadata !22), !dbg !306
  %call11 = tail call noalias i8* @malloc(i64 264) #7, !dbg !333
  %3 = bitcast i8* %call11 to i64*, !dbg !333
  tail call void @llvm.dbg.value(metadata i64* %3, i64 0, metadata !278, metadata !22), !dbg !306
  %4 = bitcast i8* %call11 to <2 x i64>*, !dbg !334
  store <2 x i64> <i64 78, i64 45>, <2 x i64>* %4, align 8, !dbg !334, !tbaa !29
  %arrayidx14 = getelementptr inbounds i8, i8* %call11, i64 16, !dbg !335
  %5 = bitcast i8* %arrayidx14 to <2 x i64>*, !dbg !336
  store <2 x i64> <i64 81, i64 117>, <2 x i64>* %5, align 8, !dbg !336, !tbaa !29
  %arrayidx16 = getelementptr inbounds i8, i8* %call11, i64 32, !dbg !337
  %6 = bitcast i8* %arrayidx16 to <2 x i64>*, !dbg !338
  store <2 x i64> <i64 101, i64 101>, <2 x i64>* %6, align 8, !dbg !338, !tbaa !29
  %arrayidx18 = getelementptr inbounds i8, i8* %call11, i64 48, !dbg !339
  %7 = bitcast i8* %arrayidx18 to <2 x i64>*, !dbg !340
  store <2 x i64> <i64 110, i64 32>, <2 x i64>* %7, align 8, !dbg !340, !tbaa !29
  %arrayidx20 = getelementptr inbounds i8, i8* %call11, i64 64, !dbg !341
  %8 = bitcast i8* %arrayidx20 to <2 x i64>*, !dbg !342
  store <2 x i64> <i64 80, i64 114>, <2 x i64>* %8, align 8, !dbg !342, !tbaa !29
  %arrayidx22 = getelementptr inbounds i8, i8* %call11, i64 80, !dbg !343
  %9 = bitcast i8* %arrayidx22 to <2 x i64>*, !dbg !344
  store <2 x i64> <i64 111, i64 98>, <2 x i64>* %9, align 8, !dbg !344, !tbaa !29
  %arrayidx24 = getelementptr inbounds i8, i8* %call11, i64 96, !dbg !345
  %10 = bitcast i8* %arrayidx24 to <2 x i64>*, !dbg !346
  store <2 x i64> <i64 108, i64 101>, <2 x i64>* %10, align 8, !dbg !346, !tbaa !29
  %arrayidx26 = getelementptr inbounds i8, i8* %call11, i64 112, !dbg !347
  %11 = bitcast i8* %arrayidx26 to <2 x i64>*, !dbg !348
  store <2 x i64> <i64 109, i64 32>, <2 x i64>* %11, align 8, !dbg !348, !tbaa !29
  %arrayidx28 = getelementptr inbounds i8, i8* %call11, i64 128, !dbg !349
  %12 = bitcast i8* %arrayidx28 to <2 x i64>*, !dbg !350
  store <2 x i64> <i64 111, i64 110>, <2 x i64>* %12, align 8, !dbg !350, !tbaa !29
  %arrayidx30 = getelementptr inbounds i8, i8* %call11, i64 144, !dbg !351
  %13 = bitcast i8* %arrayidx30 to <2 x i64>*, !dbg !352
  store <2 x i64> <i64 32, i64 97>, <2 x i64>* %13, align 8, !dbg !352, !tbaa !29
  %arrayidx32 = getelementptr inbounds i8, i8* %call11, i64 160, !dbg !353
  %14 = bitcast i8* %arrayidx32 to <2 x i64>*, !dbg !354
  store <2 x i64> <i64 32, i64 78>, <2 x i64>* %14, align 8, !dbg !354, !tbaa !29
  %arrayidx34 = getelementptr inbounds i8, i8* %call11, i64 176, !dbg !355
  %15 = bitcast i8* %arrayidx34 to <2 x i64>*, !dbg !356
  store <2 x i64> <i64 32, i64 88>, <2 x i64>* %15, align 8, !dbg !356, !tbaa !29
  %arrayidx36 = getelementptr inbounds i8, i8* %call11, i64 192, !dbg !357
  %16 = bitcast i8* %arrayidx36 to <2 x i64>*, !dbg !358
  store <2 x i64> <i64 32, i64 78>, <2 x i64>* %16, align 8, !dbg !358, !tbaa !29
  %arrayidx38 = getelementptr inbounds i8, i8* %call11, i64 208, !dbg !359
  %17 = bitcast i8* %arrayidx38 to <2 x i64>*, !dbg !360
  store <2 x i64> <i64 32, i64 66>, <2 x i64>* %17, align 8, !dbg !360, !tbaa !29
  %arrayidx40 = getelementptr inbounds i8, i8* %call11, i64 224, !dbg !361
  %18 = bitcast i8* %arrayidx40 to <2 x i64>*, !dbg !362
  store <2 x i64> <i64 111, i64 97>, <2 x i64>* %18, align 8, !dbg !362, !tbaa !29
  %arrayidx42 = getelementptr inbounds i8, i8* %call11, i64 240, !dbg !363
  %19 = bitcast i8* %arrayidx42 to <2 x i64>*, !dbg !364
  store <2 x i64> <i64 114, i64 100>, <2 x i64>* %19, align 8, !dbg !364, !tbaa !29
  %arrayidx44 = getelementptr inbounds i8, i8* %call11, i64 256, !dbg !365
  %20 = bitcast i8* %arrayidx44 to i64*, !dbg !365
  store i64 46, i64* %20, align 8, !dbg !366, !tbaa !29
  tail call void @println_s(i64* %3, i64 33) #7, !dbg !367
  tail call void @llvm.dbg.value(metadata i64 4, i64 0, metadata !282, metadata !22), !dbg !307
  %call45 = tail call noalias i8* @malloc(i64 32) #7, !dbg !368
  %21 = bitcast i8* %call45 to i64*, !dbg !368
  tail call void @llvm.dbg.value(metadata i64* %21, i64 0, metadata !281, metadata !22), !dbg !307
  %22 = bitcast i8* %call45 to <2 x i64>*, !dbg !369
  store <2 x i64> <i64 78, i64 32>, <2 x i64>* %22, align 8, !dbg !369, !tbaa !29
  %arrayidx48 = getelementptr inbounds i8, i8* %call45, i64 16, !dbg !370
  %23 = bitcast i8* %arrayidx48 to <2 x i64>*, !dbg !371
  store <2 x i64> <i64 61, i64 32>, <2 x i64>* %23, align 8, !dbg !371, !tbaa !29
  tail call void @printf_s(i64* %21, i64 4) #7, !dbg !372
  %call50 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.6, i64 0, i64 0), i64 %1), !dbg !373
  tail call void @llvm.dbg.value(metadata i64 6, i64 0, metadata !286, metadata !22), !dbg !308
  %call51 = tail call noalias i8* @malloc(i64 48) #7, !dbg !374
  %24 = bitcast i8* %call51 to i64*, !dbg !374
  tail call void @llvm.dbg.value(metadata i64* %24, i64 0, metadata !285, metadata !22), !dbg !308
  %25 = bitcast i8* %call51 to <2 x i64>*, !dbg !375
  store <2 x i64> <i64 70, i64 111>, <2 x i64>* %25, align 8, !dbg !375, !tbaa !29
  %arrayidx54 = getelementptr inbounds i8, i8* %call51, i64 16, !dbg !376
  %26 = bitcast i8* %arrayidx54 to <2 x i64>*, !dbg !377
  store <2 x i64> <i64 117, i64 110>, <2 x i64>* %26, align 8, !dbg !377, !tbaa !29
  %arrayidx56 = getelementptr inbounds i8, i8* %call51, i64 32, !dbg !378
  %27 = bitcast i8* %arrayidx56 to <2 x i64>*, !dbg !379
  store <2 x i64> <i64 100, i64 32>, <2 x i64>* %27, align 8, !dbg !379, !tbaa !29
  tail call void @printf_s(i64* %24, i64 6) #7, !dbg !380
  %call58 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.2, i64 0, i64 0), i64 %call10), !dbg !381
  tail call void @llvm.dbg.value(metadata i64 11, i64 0, metadata !290, metadata !22), !dbg !309
  %call59 = tail call noalias i8* @malloc(i64 88) #7, !dbg !382
  %28 = bitcast i8* %call59 to i64*, !dbg !382
  tail call void @llvm.dbg.value(metadata i64* %28, i64 0, metadata !289, metadata !22), !dbg !309
  %29 = bitcast i8* %call59 to <2 x i64>*, !dbg !383
  store <2 x i64> <i64 32, i64 115>, <2 x i64>* %29, align 8, !dbg !383, !tbaa !29
  %arrayidx62 = getelementptr inbounds i8, i8* %call59, i64 16, !dbg !384
  %30 = bitcast i8* %arrayidx62 to <2 x i64>*, !dbg !385
  store <2 x i64> <i64 111, i64 108>, <2 x i64>* %30, align 8, !dbg !385, !tbaa !29
  %arrayidx64 = getelementptr inbounds i8, i8* %call59, i64 32, !dbg !386
  %31 = bitcast i8* %arrayidx64 to <2 x i64>*, !dbg !387
  store <2 x i64> <i64 117, i64 116>, <2 x i64>* %31, align 8, !dbg !387, !tbaa !29
  %arrayidx66 = getelementptr inbounds i8, i8* %call59, i64 48, !dbg !388
  %32 = bitcast i8* %arrayidx66 to <2 x i64>*, !dbg !389
  store <2 x i64> <i64 105, i64 111>, <2 x i64>* %32, align 8, !dbg !389, !tbaa !29
  %arrayidx68 = getelementptr inbounds i8, i8* %call59, i64 64, !dbg !390
  %33 = bitcast i8* %arrayidx68 to <2 x i64>*, !dbg !391
  store <2 x i64> <i64 110, i64 115>, <2 x i64>* %33, align 8, !dbg !391, !tbaa !29
  %arrayidx70 = getelementptr inbounds i8, i8* %call59, i64 80, !dbg !392
  %34 = bitcast i8* %arrayidx70 to i64*, !dbg !392
  store i64 46, i64* %34, align 8, !dbg !393, !tbaa !29
  tail call void @println_s(i64* %28, i64 11) #7, !dbg !394
  br label %blklab23, !dbg !394

for.body:                                         ; preds = %for.body.preheader, %for.body
  %indvars.iv = phi i64 [ %indvars.iv.next, %for.body ], [ 0, %for.body.preheader ]
  %call.i = tail call noalias i8* @malloc(i64 16) #7, !dbg !327
  %arrayidx9 = getelementptr inbounds %struct.POS*, %struct.POS** %2, i64 %indvars.iv, !dbg !395
  %35 = bitcast %struct.POS** %arrayidx9 to i8**, !dbg !396
  call void @llvm.memset.p0i8.i64(i8* %call.i, i8 0, i64 16, i32 8, i1 false), !dbg !397
  store i8* %call.i, i8** %35, align 8, !dbg !396, !tbaa !61
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1, !dbg !326
  %exitcond = icmp eq i64 %indvars.iv.next, %1, !dbg !326
  br i1 %exitcond, label %for.cond.cleanup.loopexit, label %for.body, !dbg !326

blklab23:                                         ; preds = %entry, %for.cond.cleanup
  tail call void @exit(i32 0) #10, !dbg !398
  unreachable, !dbg !398
}

declare i64** @convertArgsToIntArray(i32, i8**) #5

declare i64* @parseStringToInt(i64*) #5

declare void @println_s(i64*, i64) #5

declare void @printf_s(i64*, i64) #5

; Function Attrs: nounwind readnone
declare void @llvm.dbg.value(metadata, i64, metadata, metadata) #6

declare i32 @putchar(i32)

; Function Attrs: nounwind
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) #7

; Function Attrs: argmemonly nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture, i8, i64, i32, i1) #8

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { norecurse nounwind readonly uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "polly-optimized" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
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

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 3.9.0 (http://llvm.org/git/clang.git 83402ed45b681e9f38ce6626e5899c19159ceb29) (http://llvm.org/git/llvm.git 4fc8e6fd79f212952e8f538b6d5d9d78098b4505)", isOptimized: true, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3)
!1 = !DIFile(filename: "NQueens.c", directory: "/home/sam/workspace/WhileyOpenCL/polly/NQueens/impl/autogenerate_leak")
!2 = !{}
!3 = !{!4}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64, align: 64)
!5 = !{i32 2, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{!"clang version 3.9.0 (http://llvm.org/git/clang.git 83402ed45b681e9f38ce6626e5899c19159ceb29) (http://llvm.org/git/llvm.git 4fc8e6fd79f212952e8f538b6d5d9d78098b4505)"}
!8 = distinct !DISubprogram(name: "copy_POS", scope: !1, file: !1, line: 2, type: !9, isLocal: false, isDefinition: true, scopeLine: 2, flags: DIFlagPrototyped, isOptimized: true, unit: !0, variables: !19)
!9 = !DISubroutineType(types: !10)
!10 = !{!11, !11}
!11 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !12, size: 64, align: 64)
!12 = !DIDerivedType(tag: DW_TAG_typedef, name: "POS", file: !13, line: 5, baseType: !14)
!13 = !DIFile(filename: "./NQueens.h", directory: "/home/sam/workspace/WhileyOpenCL/polly/NQueens/impl/autogenerate_leak")
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
!69 = distinct !DISubprogram(name: "free_POS", scope: !1, file: !1, line: 15, type: !70, isLocal: false, isDefinition: true, scopeLine: 15, flags: DIFlagPrototyped, isOptimized: true, unit: !0, variables: !72)
!70 = !DISubroutineType(types: !71)
!71 = !{null, !11}
!72 = !{!73}
!73 = !DILocalVariable(name: "pos", arg: 1, scope: !69, file: !1, line: 15, type: !11)
!74 = !DILocation(line: 15, column: 20, scope: !69)
!75 = !DILocation(line: 16, column: 7, scope: !69)
!76 = !DILocation(line: 16, column: 2, scope: !69)
!77 = !DILocation(line: 17, column: 1, scope: !69)
!78 = distinct !DISubprogram(name: "printf_POS", scope: !1, file: !1, line: 18, type: !70, isLocal: false, isDefinition: true, scopeLine: 18, flags: DIFlagPrototyped, isOptimized: true, unit: !0, variables: !79)
!79 = !{!80}
!80 = !DILocalVariable(name: "pos", arg: 1, scope: !78, file: !1, line: 18, type: !11)
!81 = !DILocation(line: 18, column: 22, scope: !78)
!82 = !DILocation(line: 19, column: 2, scope: !78)
!83 = !DILocation(line: 20, column: 2, scope: !78)
!84 = !DILocation(line: 21, column: 22, scope: !78)
!85 = !{!86, !30, i64 0}
!86 = !{!"", !30, i64 0, !30, i64 8}
!87 = !DILocation(line: 21, column: 2, scope: !78)
!88 = !DILocation(line: 22, column: 2, scope: !78)
!89 = !DILocation(line: 23, column: 22, scope: !78)
!90 = !{!86, !30, i64 8}
!91 = !DILocation(line: 23, column: 2, scope: !78)
!92 = !DILocation(line: 24, column: 2, scope: !78)
!93 = !DILocation(line: 25, column: 1, scope: !78)
!94 = distinct !DISubprogram(name: "conflict", scope: !1, file: !1, line: 26, type: !95, isLocal: false, isDefinition: true, scopeLine: 26, flags: DIFlagPrototyped, isOptimized: true, unit: !0, variables: !97)
!95 = !DISubroutineType(types: !96)
!96 = !{!17, !11, !17, !17}
!97 = !{!98, !99, !100, !101, !102, !103, !104, !105, !106, !107, !108, !109, !110, !111, !112, !113}
!98 = !DILocalVariable(name: "p", arg: 1, scope: !94, file: !1, line: 26, type: !11)
!99 = !DILocalVariable(name: "row", arg: 2, scope: !94, file: !1, line: 26, type: !17)
!100 = !DILocalVariable(name: "col", arg: 3, scope: !94, file: !1, line: 26, type: !17)
!101 = !DILocalVariable(name: "_3", scope: !94, file: !1, line: 27, type: !17)
!102 = !DILocalVariable(name: "r", scope: !94, file: !1, line: 28, type: !17)
!103 = !DILocalVariable(name: "c", scope: !94, file: !1, line: 29, type: !17)
!104 = !DILocalVariable(name: "colDiff", scope: !94, file: !1, line: 30, type: !17)
!105 = !DILocalVariable(name: "rowDiff", scope: !94, file: !1, line: 31, type: !17)
!106 = !DILocalVariable(name: "_8", scope: !94, file: !1, line: 32, type: !17)
!107 = !DILocalVariable(name: "_9", scope: !94, file: !1, line: 33, type: !17)
!108 = !DILocalVariable(name: "_10", scope: !94, file: !1, line: 34, type: !17)
!109 = !DILocalVariable(name: "_11", scope: !94, file: !1, line: 35, type: !17)
!110 = !DILocalVariable(name: "_12", scope: !94, file: !1, line: 36, type: !17)
!111 = !DILocalVariable(name: "_13", scope: !94, file: !1, line: 37, type: !17)
!112 = !DILocalVariable(name: "_14", scope: !94, file: !1, line: 38, type: !17)
!113 = !DILocalVariable(name: "_15", scope: !94, file: !1, line: 39, type: !17)
!114 = !DILocation(line: 87, column: 1, scope: !94)
!115 = !DILocation(line: 61, column: 7, scope: !94)
!116 = !DILocation(line: 63, column: 8, scope: !94)
!117 = !DILocation(line: 67, column: 7, scope: !94)
!118 = !DILocation(line: 69, column: 8, scope: !94)
!119 = !DILocation(line: 73, column: 12, scope: !120)
!120 = distinct !DILexicalBlock(scope: !94, file: !1, line: 73, column: 5)
!121 = !DILocation(line: 81, column: 2, scope: !94)
!122 = distinct !DISubprogram(name: "run", scope: !1, file: !1, line: 89, type: !123, isLocal: false, isDefinition: true, scopeLine: 89, flags: DIFlagPrototyped, isOptimized: true, unit: !0, variables: !125)
!123 = !DISubroutineType(types: !124)
!124 = !{!17, !38, !17, !17, !17}
!125 = !{!126, !127, !128, !129, !130, !131, !132, !133, !134, !135, !136, !137, !138, !139, !140, !141, !142, !143, !144, !145, !146, !147, !148, !149, !150, !151, !152, !153, !154, !155, !156, !157, !158, !159, !160}
!126 = !DILocalVariable(name: "queens", arg: 1, scope: !122, file: !1, line: 89, type: !38)
!127 = !DILocalVariable(name: "queens_size", arg: 2, scope: !122, file: !1, line: 89, type: !17)
!128 = !DILocalVariable(name: "n", arg: 3, scope: !122, file: !1, line: 89, type: !17)
!129 = !DILocalVariable(name: "dim", arg: 4, scope: !122, file: !1, line: 89, type: !17)
!130 = !DILocalVariable(name: "_3", scope: !122, file: !1, line: 90, type: !17)
!131 = !DILocalVariable(name: "num_solutions", scope: !122, file: !1, line: 91, type: !17)
!132 = !DILocalVariable(name: "col", scope: !122, file: !1, line: 92, type: !17)
!133 = !DILocalVariable(name: "isSolution", scope: !122, file: !1, line: 93, type: !17)
!134 = !DILocalVariable(name: "i", scope: !122, file: !1, line: 94, type: !17)
!135 = !DILocalVariable(name: "p", scope: !122, file: !1, line: 95, type: !11)
!136 = !DILocalVariable(name: "_9", scope: !122, file: !1, line: 96, type: !17)
!137 = !DILocalVariable(name: "_10", scope: !122, file: !1, line: 97, type: !17)
!138 = !DILocalVariable(name: "_11", scope: !122, file: !1, line: 98, type: !17)
!139 = !DILocalVariable(name: "_12", scope: !122, file: !1, line: 99, type: !17)
!140 = !DILocalVariable(name: "_13", scope: !122, file: !1, line: 100, type: !17)
!141 = !DILocalVariable(name: "_14", scope: !122, file: !1, line: 101, type: !17)
!142 = !DILocalVariable(name: "_15", scope: !122, file: !1, line: 102, type: !17)
!143 = !DILocalVariable(name: "_16", scope: !122, file: !1, line: 103, type: !17)
!144 = !DILocalVariable(name: "_17", scope: !122, file: !1, line: 104, type: !17)
!145 = !DILocalVariable(name: "_18", scope: !122, file: !1, line: 105, type: !17)
!146 = !DILocalVariable(name: "_19", scope: !122, file: !1, line: 106, type: !11)
!147 = !DILocalVariable(name: "_20", scope: !122, file: !1, line: 107, type: !17)
!148 = !DILocalVariable(name: "_21", scope: !122, file: !1, line: 108, type: !17)
!149 = !DILocalVariable(name: "_22", scope: !122, file: !1, line: 109, type: !17)
!150 = !DILocalVariable(name: "_23", scope: !122, file: !1, line: 110, type: !17)
!151 = !DILocalVariable(name: "_24", scope: !122, file: !1, line: 111, type: !17)
!152 = !DILocalVariable(name: "_25", scope: !122, file: !1, line: 112, type: !17)
!153 = !DILocalVariable(name: "_26", scope: !122, file: !1, line: 113, type: !17)
!154 = !DILocalVariable(name: "_27", scope: !122, file: !1, line: 114, type: !11)
!155 = !DILocalVariable(name: "_28", scope: !122, file: !1, line: 115, type: !17)
!156 = !DILocalVariable(name: "_29", scope: !122, file: !1, line: 116, type: !17)
!157 = !DILocalVariable(name: "_30", scope: !122, file: !1, line: 117, type: !17)
!158 = !DILocalVariable(name: "_31", scope: !122, file: !1, line: 118, type: !17)
!159 = !DILocalVariable(name: "_32", scope: !122, file: !1, line: 119, type: !17)
!160 = !DILocalVariable(name: "_33", scope: !122, file: !1, line: 120, type: !17)
!161 = !DILocation(line: 89, column: 21, scope: !122)
!162 = !DILocation(line: 89, column: 39, scope: !122)
!163 = !DILocation(line: 89, column: 62, scope: !122)
!164 = !DILocation(line: 89, column: 75, scope: !122)
!165 = !DILocation(line: 90, column: 12, scope: !122)
!166 = !DILocation(line: 91, column: 12, scope: !122)
!167 = !DILocation(line: 92, column: 12, scope: !122)
!168 = !DILocation(line: 94, column: 12, scope: !122)
!169 = !DILocation(line: 96, column: 12, scope: !122)
!170 = !DILocation(line: 97, column: 12, scope: !122)
!171 = !DILocation(line: 98, column: 12, scope: !122)
!172 = !DILocation(line: 99, column: 12, scope: !122)
!173 = !DILocation(line: 100, column: 12, scope: !122)
!174 = !DILocation(line: 102, column: 12, scope: !122)
!175 = !DILocation(line: 103, column: 12, scope: !122)
!176 = !DILocation(line: 104, column: 12, scope: !122)
!177 = !DILocation(line: 105, column: 12, scope: !122)
!178 = !DILocation(line: 111, column: 12, scope: !122)
!179 = !DILocation(line: 112, column: 12, scope: !122)
!180 = !DILocation(line: 115, column: 12, scope: !122)
!181 = !DILocation(line: 116, column: 12, scope: !122)
!182 = !DILocation(line: 117, column: 12, scope: !122)
!183 = !DILocation(line: 118, column: 12, scope: !122)
!184 = !DILocation(line: 119, column: 12, scope: !122)
!185 = !DILocation(line: 120, column: 12, scope: !122)
!186 = !DILocation(line: 122, column: 8, scope: !187)
!187 = distinct !DILexicalBlock(scope: !122, file: !1, line: 122, column: 5)
!188 = !DILocation(line: 122, column: 5, scope: !122)
!189 = !DILocation(line: 146, column: 8, scope: !190)
!190 = distinct !DILexicalBlock(scope: !191, file: !1, line: 146, column: 7)
!191 = distinct !DILexicalBlock(scope: !192, file: !1, line: 142, column: 3)
!192 = distinct !DILexicalBlock(scope: !122, file: !1, line: 140, column: 13)
!193 = !DILocation(line: 150, column: 10, scope: !194)
!194 = distinct !DILexicalBlock(scope: !191, file: !1, line: 150, column: 7)
!195 = !DILocation(line: 146, column: 7, scope: !191)
!196 = !DILocation(line: 198, column: 8, scope: !197)
!197 = distinct !DILexicalBlock(scope: !198, file: !1, line: 198, column: 7)
!198 = distinct !DILexicalBlock(scope: !192, file: !1, line: 171, column: 14)
!199 = !DILocation(line: 255, column: 3, scope: !192)
!200 = !DILocation(line: 255, column: 13, scope: !192)
!201 = !DILocation(line: 259, column: 8, scope: !192)
!202 = !DILocation(line: 161, column: 9, scope: !203)
!203 = distinct !DILexicalBlock(scope: !192, file: !1, line: 161, column: 6)
!204 = !DILocation(line: 161, column: 6, scope: !192)
!205 = !DILocation(line: 113, column: 12, scope: !122)
!206 = !DILocation(line: 249, column: 16, scope: !207)
!207 = distinct !DILexicalBlock(scope: !192, file: !1, line: 249, column: 6)
!208 = !DILocation(line: 249, column: 6, scope: !192)
!209 = !DILocation(line: 251, column: 9, scope: !192)
!210 = !DILocation(line: 252, column: 8, scope: !192)
!211 = !DILocation(line: 252, column: 10, scope: !192)
!212 = !DILocation(line: 253, column: 8, scope: !192)
!213 = !DILocation(line: 253, column: 10, scope: !192)
!214 = !DILocation(line: 261, column: 9, scope: !192)
!215 = !DILocation(line: 263, column: 20, scope: !192)
!216 = !DILocation(line: 265, column: 3, scope: !192)
!217 = !DILocation(line: 271, column: 10, scope: !192)
!218 = !DILocation(line: 200, column: 19, scope: !198)
!219 = !DILocation(line: 2, column: 20, scope: !8, inlinedAt: !220)
!220 = distinct !DILocation(line: 200, column: 10, scope: !198)
!221 = !DILocation(line: 4, column: 21, scope: !8, inlinedAt: !220)
!222 = !DILocation(line: 212, column: 10, scope: !198)
!223 = !DILocation(line: 5, column: 21, scope: !8, inlinedAt: !220)
!224 = !DILocation(line: 107, column: 12, scope: !122)
!225 = !DILocation(line: 206, column: 17, scope: !226)
!226 = distinct !DILexicalBlock(scope: !198, file: !1, line: 206, column: 7)
!227 = !DILocation(line: 206, column: 7, scope: !198)
!228 = !DILocation(line: 61, column: 7, scope: !94, inlinedAt: !229)
!229 = distinct !DILocation(line: 212, column: 10, scope: !198)
!230 = !DILocation(line: 63, column: 8, scope: !94, inlinedAt: !229)
!231 = !DILocation(line: 67, column: 7, scope: !94, inlinedAt: !229)
!232 = !DILocation(line: 69, column: 8, scope: !94, inlinedAt: !229)
!233 = !DILocation(line: 73, column: 12, scope: !120, inlinedAt: !229)
!234 = !DILocation(line: 81, column: 2, scope: !94, inlinedAt: !229)
!235 = !DILocation(line: 108, column: 12, scope: !122)
!236 = !DILocation(line: 109, column: 12, scope: !122)
!237 = !DILocation(line: 110, column: 12, scope: !122)
!238 = !DILocation(line: 216, column: 7, scope: !198)
!239 = !DILocation(line: 93, column: 12, scope: !122)
!240 = !DILocation(line: 238, column: 9, scope: !198)
!241 = !DILocation(line: 198, column: 7, scope: !198)
!242 = !DILocation(line: 154, column: 12, scope: !191)
!243 = !DILocation(line: 154, column: 4, scope: !191)
!244 = !DILocation(line: 155, column: 4, scope: !191)
!245 = !DILocation(line: 284, column: 1, scope: !246)
!246 = !DILexicalBlockFile(scope: !122, file: !1, discriminator: 2)
!247 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 286, type: !248, isLocal: false, isDefinition: true, scopeLine: 286, flags: DIFlagPrototyped, isOptimized: true, unit: !0, variables: !253)
!248 = !DISubroutineType(types: !249)
!249 = !{!45, !45, !250}
!250 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !251, size: 64, align: 64)
!251 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !252, size: 64, align: 64)
!252 = !DIBasicType(name: "char", size: 8, align: 8, encoding: DW_ATE_signed_char)
!253 = !{!254, !255, !256, !258, !259, !260, !261, !262, !263, !265, !266, !267, !268, !269, !270, !271, !272, !273, !274, !275, !276, !277, !278, !279, !280, !281, !282, !283, !284, !285, !286, !287, !288, !289, !290, !291}
!254 = !DILocalVariable(name: "argc", arg: 1, scope: !247, file: !1, line: 286, type: !45)
!255 = !DILocalVariable(name: "args", arg: 2, scope: !247, file: !1, line: 286, type: !250)
!256 = !DILocalVariable(name: "max", scope: !247, file: !1, line: 287, type: !257)
!257 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !17, size: 64, align: 64)
!258 = !DILocalVariable(name: "n", scope: !247, file: !1, line: 288, type: !17)
!259 = !DILocalVariable(name: "init", scope: !247, file: !1, line: 289, type: !38)
!260 = !DILocalVariable(name: "init_size", scope: !247, file: !1, line: 290, type: !17)
!261 = !DILocalVariable(name: "num_solutions", scope: !247, file: !1, line: 291, type: !17)
!262 = !DILocalVariable(name: "_5", scope: !247, file: !1, line: 292, type: !257)
!263 = !DILocalVariable(name: "_6", scope: !247, file: !1, line: 293, type: !264)
!264 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !257, size: 64, align: 64)
!265 = !DILocalVariable(name: "_6_size", scope: !247, file: !1, line: 293, type: !17)
!266 = !DILocalVariable(name: "_6_size_size", scope: !247, file: !1, line: 293, type: !17)
!267 = !DILocalVariable(name: "_7", scope: !247, file: !1, line: 294, type: !17)
!268 = !DILocalVariable(name: "_8", scope: !247, file: !1, line: 295, type: !257)
!269 = !DILocalVariable(name: "_8_size", scope: !247, file: !1, line: 295, type: !17)
!270 = !DILocalVariable(name: "_9", scope: !247, file: !1, line: 296, type: !17)
!271 = !DILocalVariable(name: "_10", scope: !247, file: !1, line: 297, type: !17)
!272 = !DILocalVariable(name: "_11", scope: !247, file: !1, line: 298, type: !11)
!273 = !DILocalVariable(name: "_12", scope: !247, file: !1, line: 299, type: !38)
!274 = !DILocalVariable(name: "_12_size", scope: !247, file: !1, line: 300, type: !17)
!275 = !DILocalVariable(name: "_13", scope: !247, file: !1, line: 301, type: !17)
!276 = !DILocalVariable(name: "_14", scope: !247, file: !1, line: 302, type: !17)
!277 = !DILocalVariable(name: "_15", scope: !247, file: !1, line: 303, type: !4)
!278 = !DILocalVariable(name: "_17", scope: !247, file: !1, line: 304, type: !257)
!279 = !DILocalVariable(name: "_17_size", scope: !247, file: !1, line: 304, type: !17)
!280 = !DILocalVariable(name: "_18", scope: !247, file: !1, line: 305, type: !4)
!281 = !DILocalVariable(name: "_20", scope: !247, file: !1, line: 306, type: !257)
!282 = !DILocalVariable(name: "_20_size", scope: !247, file: !1, line: 306, type: !17)
!283 = !DILocalVariable(name: "_21", scope: !247, file: !1, line: 307, type: !4)
!284 = !DILocalVariable(name: "_23", scope: !247, file: !1, line: 308, type: !4)
!285 = !DILocalVariable(name: "_25", scope: !247, file: !1, line: 309, type: !257)
!286 = !DILocalVariable(name: "_25_size", scope: !247, file: !1, line: 309, type: !17)
!287 = !DILocalVariable(name: "_26", scope: !247, file: !1, line: 310, type: !4)
!288 = !DILocalVariable(name: "_28", scope: !247, file: !1, line: 311, type: !4)
!289 = !DILocalVariable(name: "_30", scope: !247, file: !1, line: 312, type: !257)
!290 = !DILocalVariable(name: "_30_size", scope: !247, file: !1, line: 312, type: !17)
!291 = !DILocalVariable(name: "_12_i", scope: !292, file: !1, line: 337, type: !45)
!292 = distinct !DILexicalBlock(scope: !247, file: !1, line: 337, column: 2)
!293 = !DILocation(line: 286, column: 14, scope: !247)
!294 = !DILocation(line: 286, column: 27, scope: !247)
!295 = !DILocation(line: 288, column: 12, scope: !247)
!296 = !DILocation(line: 290, column: 12, scope: !247)
!297 = !DILocation(line: 291, column: 12, scope: !247)
!298 = !DILocation(line: 293, column: 2, scope: !247)
!299 = !DILocation(line: 294, column: 12, scope: !247)
!300 = !DILocation(line: 295, column: 2, scope: !247)
!301 = !DILocation(line: 296, column: 12, scope: !247)
!302 = !DILocation(line: 297, column: 12, scope: !247)
!303 = !DILocation(line: 300, column: 12, scope: !247)
!304 = !DILocation(line: 301, column: 12, scope: !247)
!305 = !DILocation(line: 302, column: 12, scope: !247)
!306 = !DILocation(line: 304, column: 2, scope: !247)
!307 = !DILocation(line: 306, column: 2, scope: !247)
!308 = !DILocation(line: 309, column: 2, scope: !247)
!309 = !DILocation(line: 312, column: 2, scope: !247)
!310 = !DILocation(line: 314, column: 2, scope: !247)
!311 = !DILocation(line: 318, column: 5, scope: !247)
!312 = !DILocation(line: 320, column: 2, scope: !247)
!313 = !DILocation(line: 292, column: 13, scope: !247)
!314 = !DILocation(line: 287, column: 13, scope: !247)
!315 = !DILocation(line: 324, column: 9, scope: !316)
!316 = distinct !DILexicalBlock(scope: !247, file: !1, line: 324, column: 5)
!317 = !DILocation(line: 324, column: 5, scope: !247)
!318 = !DILocation(line: 326, column: 6, scope: !247)
!319 = !DILocation(line: 336, column: 16, scope: !247)
!320 = !DILocation(line: 336, column: 8, scope: !247)
!321 = !DILocation(line: 299, column: 8, scope: !247)
!322 = !DILocation(line: 337, column: 10, scope: !292)
!323 = !DILocation(line: 337, column: 23, scope: !324)
!324 = !DILexicalBlockFile(scope: !325, file: !1, discriminator: 1)
!325 = distinct !DILexicalBlock(scope: !292, file: !1, line: 337, column: 2)
!326 = !DILocation(line: 337, column: 2, scope: !324)
!327 = !DILocation(line: 3, column: 17, scope: !25, inlinedAt: !328)
!328 = distinct !DILocation(line: 337, column: 48, scope: !329)
!329 = !DILexicalBlockFile(scope: !330, file: !1, discriminator: 3)
!330 = distinct !DILexicalBlock(scope: !325, file: !1, line: 337, column: 34)
!331 = !DILocation(line: 289, column: 8, scope: !247)
!332 = !DILocation(line: 344, column: 8, scope: !247)
!333 = !DILocation(line: 350, column: 2, scope: !247)
!334 = !DILocation(line: 351, column: 9, scope: !247)
!335 = !DILocation(line: 351, column: 28, scope: !247)
!336 = !DILocation(line: 351, column: 35, scope: !247)
!337 = !DILocation(line: 351, column: 55, scope: !247)
!338 = !DILocation(line: 351, column: 62, scope: !247)
!339 = !DILocation(line: 351, column: 83, scope: !247)
!340 = !DILocation(line: 351, column: 90, scope: !247)
!341 = !DILocation(line: 351, column: 110, scope: !247)
!342 = !DILocation(line: 351, column: 117, scope: !247)
!343 = !DILocation(line: 351, column: 137, scope: !247)
!344 = !DILocation(line: 351, column: 145, scope: !247)
!345 = !DILocation(line: 351, column: 166, scope: !247)
!346 = !DILocation(line: 351, column: 174, scope: !247)
!347 = !DILocation(line: 351, column: 196, scope: !247)
!348 = !DILocation(line: 351, column: 204, scope: !247)
!349 = !DILocation(line: 351, column: 225, scope: !247)
!350 = !DILocation(line: 351, column: 233, scope: !247)
!351 = !DILocation(line: 351, column: 255, scope: !247)
!352 = !DILocation(line: 351, column: 263, scope: !247)
!353 = !DILocation(line: 351, column: 283, scope: !247)
!354 = !DILocation(line: 351, column: 291, scope: !247)
!355 = !DILocation(line: 351, column: 311, scope: !247)
!356 = !DILocation(line: 351, column: 319, scope: !247)
!357 = !DILocation(line: 351, column: 339, scope: !247)
!358 = !DILocation(line: 351, column: 347, scope: !247)
!359 = !DILocation(line: 351, column: 367, scope: !247)
!360 = !DILocation(line: 351, column: 375, scope: !247)
!361 = !DILocation(line: 351, column: 395, scope: !247)
!362 = !DILocation(line: 351, column: 403, scope: !247)
!363 = !DILocation(line: 351, column: 424, scope: !247)
!364 = !DILocation(line: 351, column: 432, scope: !247)
!365 = !DILocation(line: 351, column: 454, scope: !247)
!366 = !DILocation(line: 351, column: 462, scope: !247)
!367 = !DILocation(line: 353, column: 2, scope: !247)
!368 = !DILocation(line: 357, column: 2, scope: !247)
!369 = !DILocation(line: 358, column: 9, scope: !247)
!370 = !DILocation(line: 358, column: 28, scope: !247)
!371 = !DILocation(line: 358, column: 35, scope: !247)
!372 = !DILocation(line: 360, column: 2, scope: !247)
!373 = !DILocation(line: 364, column: 2, scope: !247)
!374 = !DILocation(line: 368, column: 2, scope: !247)
!375 = !DILocation(line: 369, column: 9, scope: !247)
!376 = !DILocation(line: 369, column: 29, scope: !247)
!377 = !DILocation(line: 369, column: 36, scope: !247)
!378 = !DILocation(line: 369, column: 57, scope: !247)
!379 = !DILocation(line: 369, column: 64, scope: !247)
!380 = !DILocation(line: 371, column: 2, scope: !247)
!381 = !DILocation(line: 375, column: 2, scope: !247)
!382 = !DILocation(line: 379, column: 2, scope: !247)
!383 = !DILocation(line: 380, column: 9, scope: !247)
!384 = !DILocation(line: 380, column: 29, scope: !247)
!385 = !DILocation(line: 380, column: 36, scope: !247)
!386 = !DILocation(line: 380, column: 57, scope: !247)
!387 = !DILocation(line: 380, column: 64, scope: !247)
!388 = !DILocation(line: 380, column: 85, scope: !247)
!389 = !DILocation(line: 380, column: 92, scope: !247)
!390 = !DILocation(line: 380, column: 113, scope: !247)
!391 = !DILocation(line: 380, column: 120, scope: !247)
!392 = !DILocation(line: 380, column: 141, scope: !247)
!393 = !DILocation(line: 380, column: 149, scope: !247)
!394 = !DILocation(line: 382, column: 2, scope: !247)
!395 = !DILocation(line: 337, column: 35, scope: !329)
!396 = !DILocation(line: 337, column: 46, scope: !329)
!397 = !DILocation(line: 5, column: 13, scope: !8, inlinedAt: !328)
!398 = !DILocation(line: 386, column: 2, scope: !247)
