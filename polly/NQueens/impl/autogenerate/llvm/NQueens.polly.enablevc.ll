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
define noalias %struct.POS* @copy_POS(%struct.POS* nocapture readonly %_POS) #0 !dbg !6 {
entry:
  tail call void @llvm.dbg.value(metadata %struct.POS* %_POS, i64 0, metadata !18, metadata !161), !dbg !162
  %call = tail call noalias i8* @malloc(i64 16) #7, !dbg !163
  %0 = bitcast i8* %call to %struct.POS*, !dbg !165
  tail call void @llvm.dbg.value(metadata %struct.POS* %0, i64 0, metadata !19, metadata !161), !dbg !166
  %1 = bitcast %struct.POS* %_POS to <2 x i64>*, !dbg !167
  %2 = load <2 x i64>, <2 x i64>* %1, align 8, !dbg !167, !tbaa !168
  %3 = bitcast i8* %call to <2 x i64>*, !dbg !172
  store <2 x i64> %2, <2 x i64>* %3, align 8, !dbg !172, !tbaa !168
  ret %struct.POS* %0, !dbg !173
}

; Function Attrs: nounwind
declare noalias i8* @malloc(i64) #1

; Function Attrs: nounwind uwtable
define noalias %struct.POS** @copy_array_POS(%struct.POS** nocapture readonly %_POS, i64 %_POS_size) #0 !dbg !20 {
entry:
  tail call void @llvm.dbg.value(metadata %struct.POS** %_POS, i64 0, metadata !25, metadata !161), !dbg !174
  tail call void @llvm.dbg.value(metadata i64 %_POS_size, i64 0, metadata !26, metadata !161), !dbg !175
  %mul = shl i64 %_POS_size, 3, !dbg !176
  %call = tail call noalias i8* @malloc(i64 %mul) #7, !dbg !177
  %0 = bitcast i8* %call to %struct.POS**, !dbg !179
  tail call void @llvm.dbg.value(metadata %struct.POS** %0, i64 0, metadata !27, metadata !161), !dbg !180
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !28, metadata !161), !dbg !181
  %cmp12 = icmp sgt i64 %_POS_size, 0, !dbg !182
  br i1 %cmp12, label %for.body.preheader, label %for.cond.cleanup, !dbg !185

for.body.preheader:                               ; preds = %entry
  br label %for.body, !dbg !186

for.cond.cleanup.loopexit:                        ; preds = %for.body
  br label %for.cond.cleanup, !dbg !188

for.cond.cleanup:                                 ; preds = %for.cond.cleanup.loopexit, %entry
  ret %struct.POS** %0, !dbg !188

for.body:                                         ; preds = %for.body.preheader, %for.body
  %indvars.iv = phi i64 [ %indvars.iv.next, %for.body ], [ 0, %for.body.preheader ]
  %arrayidx = getelementptr inbounds %struct.POS*, %struct.POS** %_POS, i64 %indvars.iv, !dbg !186
  %1 = bitcast %struct.POS** %arrayidx to <2 x i64>**, !dbg !186
  %2 = load <2 x i64>*, <2 x i64>** %1, align 8, !dbg !186, !tbaa !189
  %call.i = tail call noalias i8* @malloc(i64 16) #7, !dbg !191
  %3 = load <2 x i64>, <2 x i64>* %2, align 8, !dbg !193, !tbaa !168
  %4 = bitcast i8* %call.i to <2 x i64>*, !dbg !194
  store <2 x i64> %3, <2 x i64>* %4, align 8, !dbg !194, !tbaa !168
  %arrayidx4 = getelementptr inbounds %struct.POS*, %struct.POS** %0, i64 %indvars.iv, !dbg !195
  %5 = bitcast %struct.POS** %arrayidx4 to i8**, !dbg !196
  store i8* %call.i, i8** %5, align 8, !dbg !196, !tbaa !189
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1, !dbg !185
  %exitcond = icmp eq i64 %indvars.iv.next, %_POS_size, !dbg !185
  br i1 %exitcond, label %for.cond.cleanup.loopexit, label %for.body, !dbg !185
}

; Function Attrs: nounwind uwtable
define void @free_POS(%struct.POS* nocapture %pos) #0 !dbg !31 {
entry:
  tail call void @llvm.dbg.value(metadata %struct.POS* %pos, i64 0, metadata !35, metadata !161), !dbg !197
  %0 = bitcast %struct.POS* %pos to i8*, !dbg !198
  tail call void @free(i8* %0) #7, !dbg !199
  ret void, !dbg !200
}

; Function Attrs: nounwind
declare void @free(i8* nocapture) #1

; Function Attrs: nounwind uwtable
define void @printf_POS(%struct.POS* nocapture readonly %pos) #0 !dbg !36 {
entry:
  tail call void @llvm.dbg.value(metadata %struct.POS* %pos, i64 0, metadata !38, metadata !161), !dbg !201
  %putchar = tail call i32 @putchar(i32 123) #7, !dbg !202
  %call1 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.1, i64 0, i64 0)), !dbg !203
  %r = getelementptr inbounds %struct.POS, %struct.POS* %pos, i64 0, i32 0, !dbg !204
  %0 = load i64, i64* %r, align 8, !dbg !204, !tbaa !205
  %call2 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.2, i64 0, i64 0), i64 %0), !dbg !207
  %call3 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.3, i64 0, i64 0)), !dbg !208
  %c = getelementptr inbounds %struct.POS, %struct.POS* %pos, i64 0, i32 1, !dbg !209
  %1 = load i64, i64* %c, align 8, !dbg !209, !tbaa !210
  %call4 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.2, i64 0, i64 0), i64 %1), !dbg !211
  %putchar7 = tail call i32 @putchar(i32 125) #7, !dbg !212
  ret void, !dbg !213
}

; Function Attrs: nounwind
declare i32 @printf(i8* nocapture readonly, ...) #1

; Function Attrs: norecurse nounwind readonly uwtable
define i64 @conflict(%struct.POS* nocapture readonly %p, i1 zeroext %p_has_ownership, i64 %row, i64 %col) #2 !dbg !39 {
entry:
  %polly.access.cast.p = getelementptr inbounds %struct.POS, %struct.POS* %p, i64 0, i32 0
  %polly.access.p.load = load i64, i64* %polly.access.cast.p, align 8
  %polly.access.p44 = getelementptr i64, i64* %polly.access.cast.p, i64 1
  %polly.access.p44.load = load i64, i64* %polly.access.p44, align 8
  %0 = icmp sgt i64 %polly.access.p.load, %row
  %1 = icmp sgt i64 %polly.access.p44.load, %col
  %2 = icmp slt i64 %polly.access.p44.load, %col
  %3 = icmp ne i64 %polly.access.p44.load, %col
  %4 = and i1 %0, %3
  %5 = icmp slt i64 %polly.access.p.load, %row
  %6 = and i1 %5, %1
  %7 = or i1 %4, %6
  %8 = and i1 %5, %2
  %9 = or i1 %8, %7
  br i1 %9, label %polly.stmt.blklab0, label %polly.exiting

polly.exiting:                                    ; preds = %entry, %polly.stmt.blklab0
  %retval.0.s2a.0 = phi i64 [ %p_., %polly.stmt.blklab0 ], [ 1, %entry ]
  ret i64 %retval.0.s2a.0, !dbg !214

polly.stmt.blklab0:                               ; preds = %entry
  %p_sub = sub nsw i64 %polly.access.p44.load, %col, !dbg !215
  %p_ispos = icmp sgt i64 %p_sub, -1, !dbg !216
  %p_neg = sub i64 0, %p_sub, !dbg !216
  %p_ = select i1 %p_ispos, i64 %p_sub, i64 %p_neg, !dbg !216
  %p_sub6 = sub nsw i64 %polly.access.p.load, %row, !dbg !217
  %p_ispos41 = icmp sgt i64 %p_sub6, -1, !dbg !218
  %p_neg42 = sub i64 0, %p_sub6, !dbg !218
  %p_46 = select i1 %p_ispos41, i64 %p_sub6, i64 %p_neg42, !dbg !218
  %p_cmp8 = icmp eq i64 %p_, %p_46, !dbg !219
  %p_. = zext i1 %p_cmp8 to i64, !dbg !221
  br label %polly.exiting
}

; Function Attrs: nounwind uwtable
define i64 @run(%struct.POS** nocapture %queens, i64 %queens_size, i1 zeroext %queens_has_ownership, i64 %n, i64 %dim) #0 !dbg !61 {
entry:
  tail call void @llvm.dbg.value(metadata %struct.POS** %queens, i64 0, metadata !65, metadata !161), !dbg !222
  tail call void @llvm.dbg.value(metadata i64 %queens_size, i64 0, metadata !66, metadata !161), !dbg !223
  tail call void @llvm.dbg.value(metadata i1 %queens_has_ownership, i64 0, metadata !67, metadata !224), !dbg !225
  tail call void @llvm.dbg.value(metadata i64 %n, i64 0, metadata !68, metadata !161), !dbg !226
  tail call void @llvm.dbg.value(metadata i64 %dim, i64 0, metadata !69, metadata !161), !dbg !227
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !70, metadata !161), !dbg !228
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !71, metadata !161), !dbg !229
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !72, metadata !161), !dbg !230
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !74, metadata !161), !dbg !231
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !76, metadata !161), !dbg !232
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !77, metadata !161), !dbg !233
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !78, metadata !161), !dbg !234
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !79, metadata !161), !dbg !235
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !80, metadata !161), !dbg !236
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !81, metadata !161), !dbg !237
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !83, metadata !161), !dbg !238
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !84, metadata !161), !dbg !239
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !85, metadata !161), !dbg !240
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !86, metadata !161), !dbg !241
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !88, metadata !161), !dbg !242
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !92, metadata !161), !dbg !243
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !93, metadata !161), !dbg !244
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !96, metadata !161), !dbg !245
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !97, metadata !161), !dbg !246
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !98, metadata !161), !dbg !247
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !99, metadata !161), !dbg !248
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !100, metadata !161), !dbg !249
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !101, metadata !161), !dbg !250
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !102, metadata !161), !dbg !251
  %cmp = icmp eq i64 %dim, %n, !dbg !252
  br i1 %cmp, label %cleanup, label %while.cond.preheader, !dbg !254

while.cond.preheader:                             ; preds = %entry
  tail call void @llvm.dbg.value(metadata i64 %queens_size, i64 0, metadata !80, metadata !161), !dbg !236
  %cmp9 = icmp slt i64 %n, %queens_size, !dbg !255
  %cmp12 = icmp eq i64 %dim, %queens_size, !dbg !259
  %or.cond = and i1 %cmp9, %cmp12, !dbg !261
  tail call void @llvm.dbg.value(metadata i64 %queens_size, i64 0, metadata !81, metadata !161), !dbg !237
  br i1 %or.cond, label %blklab10.preheader, label %blklab11, !dbg !261

blklab10.preheader:                               ; preds = %while.cond.preheader
  %cmp30213 = icmp sgt i64 %n, 0, !dbg !262
  %arrayidx51 = getelementptr inbounds %struct.POS*, %struct.POS** %queens, i64 %n, !dbg !265
  %0 = bitcast %struct.POS** %arrayidx51 to i8**, !dbg !266
  %add52 = add nsw i64 %n, 1, !dbg !267
  %cmp15.us226 = icmp sgt i64 %dim, 0, !dbg !268
  br i1 %cmp15.us226, label %blklab14.preheader.us.preheader, label %blklab8, !dbg !270

blklab14.preheader.us.preheader:                  ; preds = %blklab10.preheader
  br label %blklab14.preheader.us, !dbg !241

blklab14.us:                                      ; preds = %conflict.exit.us
  tail call void @llvm.dbg.value(metadata i64 %queens_size, i64 0, metadata !86, metadata !161), !dbg !241
  %cmp30.us = icmp slt i64 %add.us, %n, !dbg !262
  br i1 %cmp30.us, label %if.end35.us, label %if.end46.us.loopexit, !dbg !271

if.end46.us.loopexit:                             ; preds = %blklab14.us
  %call.i.us.lcssa240 = phi i8* [ %call.i.us, %blklab14.us ]
  br label %if.end46.us, !dbg !272

if.end46.us:                                      ; preds = %if.end46.us.loopexit, %blklab14.preheader.us
  %.lcssa204.us = phi i8* [ %23, %blklab14.preheader.us ], [ %call.i.us.lcssa240, %if.end46.us.loopexit ]
  %.lcssa.us = phi i8* [ %24, %blklab14.preheader.us ], [ %call.i.us.lcssa240, %if.end46.us.loopexit ]
  %p_has_ownership.1180.lcssa.us = phi i8 [ %p_has_ownership.0182.us232, %blklab14.preheader.us ], [ 1, %if.end46.us.loopexit ]
  tail call void @llvm.dbg.value(metadata i64 1, i64 0, metadata !94, metadata !161), !dbg !272
  %1 = and i8 %_26_has_ownership.0188.us227, 1, !dbg !273
  %tobool47.us = icmp eq i8 %1, 0, !dbg !273
  br i1 %tobool47.us, label %if.end49.us, label %if.then48.us, !dbg !275

if.then48.us:                                     ; preds = %if.end46.us
  tail call void @llvm.dbg.value(metadata %struct.POS* undef, i64 0, metadata !35, metadata !161) #7, !dbg !276
  tail call void @free(i8* %25) #7, !dbg !280
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !96, metadata !161), !dbg !245
  br label %if.end49.us, !dbg !281

if.end49.us:                                      ; preds = %if.then48.us, %if.end46.us
  %call50.us = tail call noalias i8* @malloc(i64 16) #7, !dbg !282
  %c.us = getelementptr inbounds i8, i8* %call50.us, i64 8, !dbg !283
  %2 = bitcast i8* %c.us to i64*, !dbg !283
  store i64 %col.0183.us231, i64* %2, align 8, !dbg !284, !tbaa !210
  %r.us = bitcast i8* %call50.us to i64*, !dbg !285
  store i64 %n, i64* %r.us, align 8, !dbg !286, !tbaa !205
  tail call void @llvm.dbg.value(metadata i8 1, i64 0, metadata !96, metadata !161), !dbg !245
  store i8* %call50.us, i8** %0, align 8, !dbg !266, !tbaa !189
  tail call void @llvm.dbg.value(metadata i64 1, i64 0, metadata !98, metadata !161), !dbg !247
  tail call void @llvm.dbg.value(metadata i64 %add52, i64 0, metadata !99, metadata !161), !dbg !248
  tail call void @llvm.dbg.value(metadata i8 1, i64 0, metadata !67, metadata !161), !dbg !225
  %call53.us = tail call i64 @run(%struct.POS** %queens, i64 %dim, i1 zeroext undef, i64 %add52, i64 %dim), !dbg !287
  tail call void @llvm.dbg.value(metadata i64 %call53.us, i64 0, metadata !97, metadata !161), !dbg !246
  %add54.us = add nsw i64 %call53.us, %num_solutions.0186.us229, !dbg !288
  tail call void @llvm.dbg.value(metadata i64 %add54.us, i64 0, metadata !100, metadata !161), !dbg !249
  tail call void @llvm.dbg.value(metadata i64 %add54.us, i64 0, metadata !71, metadata !161), !dbg !229
  br label %blklab19.us, !dbg !289

if.end35.us:                                      ; preds = %if.end35.us.preheader, %blklab14.us
  %i.0178215.us = phi i64 [ %add.us, %blklab14.us ], [ 0, %if.end35.us.preheader ]
  %3 = phi i8* [ %call.i.us, %blklab14.us ], [ %23, %if.end35.us.preheader ]
  %p_has_ownership.1180214.us = phi i8 [ 1, %blklab14.us ], [ %p_has_ownership.0182.us232, %if.end35.us.preheader ]
  %arrayidx.us = getelementptr inbounds %struct.POS*, %struct.POS** %queens, i64 %i.0178215.us, !dbg !290
  %4 = load %struct.POS*, %struct.POS** %arrayidx.us, align 8, !dbg !290, !tbaa !189
  tail call void @llvm.dbg.value(metadata %struct.POS* %4, i64 0, metadata !18, metadata !161) #7, !dbg !291
  %call.i.us = tail call noalias i8* @malloc(i64 16) #7, !dbg !293
  %r.i.us = getelementptr inbounds %struct.POS, %struct.POS* %4, i64 0, i32 0, !dbg !294
  %5 = load i64, i64* %r.i.us, align 8, !dbg !294, !tbaa !205
  %r1.i.us = bitcast i8* %call.i.us to i64*, !dbg !295
  store i64 %5, i64* %r1.i.us, align 8, !dbg !296, !tbaa !205
  %c.i.us = getelementptr inbounds %struct.POS, %struct.POS* %4, i64 0, i32 1, !dbg !297
  %6 = load i64, i64* %c.i.us, align 8, !dbg !297, !tbaa !210
  %c2.i.us = getelementptr inbounds i8, i8* %call.i.us, i64 8, !dbg !298
  %7 = bitcast i8* %c2.i.us to i64*, !dbg !298
  store i64 %6, i64* %7, align 8, !dbg !299, !tbaa !210
  tail call void @llvm.dbg.value(metadata i8 1, i64 0, metadata !88, metadata !161), !dbg !242
  %8 = and i8 %p_has_ownership.1180214.us, 1, !dbg !300
  %tobool37.us = icmp eq i8 %8, 0, !dbg !300
  br i1 %tobool37.us, label %if.end39.us, label %if.then38.us, !dbg !302

if.then38.us:                                     ; preds = %if.end35.us
  tail call void @llvm.dbg.value(metadata %struct.POS* undef, i64 0, metadata !35, metadata !161) #7, !dbg !303
  tail call void @free(i8* %3) #7, !dbg !307
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !76, metadata !161), !dbg !232
  %polly.access.p.load.i.us.pre = load i64, i64* %r1.i.us, align 8, !dbg !308
  %polly.access.p44.load.i.us.pre = load i64, i64* %7, align 8, !dbg !308
  br label %if.end39.us, !dbg !309

if.end39.us:                                      ; preds = %if.then38.us, %if.end35.us
  %polly.access.p44.load.i.us = phi i64 [ %polly.access.p44.load.i.us.pre, %if.then38.us ], [ %6, %if.end35.us ], !dbg !308
  %polly.access.p.load.i.us = phi i64 [ %polly.access.p.load.i.us.pre, %if.then38.us ], [ %5, %if.end35.us ], !dbg !308
  tail call void @llvm.dbg.value(metadata i8 1, i64 0, metadata !76, metadata !161), !dbg !232
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !88, metadata !161), !dbg !242
  tail call void @llvm.dbg.value(metadata i8 1, i64 0, metadata !76, metadata !161), !dbg !232
  %9 = icmp sgt i64 %polly.access.p.load.i.us, %n, !dbg !308
  %10 = icmp sgt i64 %polly.access.p44.load.i.us, %col.0183.us231, !dbg !308
  %11 = icmp slt i64 %polly.access.p44.load.i.us, %col.0183.us231, !dbg !308
  %12 = icmp ne i64 %polly.access.p44.load.i.us, %col.0183.us231, !dbg !308
  %13 = and i1 %9, %12, !dbg !308
  %14 = icmp slt i64 %polly.access.p.load.i.us, %n, !dbg !308
  %15 = and i1 %14, %10, !dbg !308
  %16 = or i1 %13, %15, !dbg !308
  %17 = and i1 %14, %11, !dbg !308
  %18 = or i1 %17, %16, !dbg !308
  br i1 %18, label %conflict.exit.us, label %blklab19.us.loopexit, !dbg !308

conflict.exit.us:                                 ; preds = %if.end39.us
  %p_sub.i.us = sub nsw i64 %polly.access.p44.load.i.us, %col.0183.us231, !dbg !310
  %p_ispos.i.us = icmp sgt i64 %p_sub.i.us, -1, !dbg !312
  %p_neg.i.us = sub i64 0, %p_sub.i.us, !dbg !312
  %p_.i.us = select i1 %p_ispos.i.us, i64 %p_sub.i.us, i64 %p_neg.i.us, !dbg !312
  %p_sub6.i.us = sub nsw i64 %polly.access.p.load.i.us, %n, !dbg !313
  %p_ispos41.i.us = icmp sgt i64 %p_sub6.i.us, -1, !dbg !314
  %p_neg42.i.us = sub i64 0, %p_sub6.i.us, !dbg !314
  %p_46.i.us = select i1 %p_ispos41.i.us, i64 %p_sub6.i.us, i64 %p_neg42.i.us, !dbg !314
  %p_cmp8.i.us = icmp eq i64 %p_.i.us, %p_46.i.us, !dbg !315
  tail call void @llvm.dbg.value(metadata i64 1, i64 0, metadata !90, metadata !161), !dbg !316
  tail call void @llvm.dbg.value(metadata i64 1, i64 0, metadata !92, metadata !161), !dbg !243
  tail call void @llvm.dbg.value(metadata i64 %add.us, i64 0, metadata !93, metadata !161), !dbg !244
  tail call void @llvm.dbg.value(metadata i64 %add.us, i64 0, metadata !74, metadata !161), !dbg !231
  %add.us = add nuw nsw i64 %i.0178215.us, 1, !dbg !317
  tail call void @llvm.dbg.value(metadata i64 %queens_size, i64 0, metadata !84, metadata !161), !dbg !239
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !85, metadata !161), !dbg !240
  br i1 %p_cmp8.i.us, label %blklab19.us.loopexit, label %blklab14.us, !dbg !318

blklab19.us.loopexit:                             ; preds = %conflict.exit.us, %if.end39.us
  %call.i.us.lcssa = phi i8* [ %call.i.us, %conflict.exit.us ], [ %call.i.us, %if.end39.us ]
  br label %blklab19.us, !dbg !250

blklab19.us:                                      ; preds = %blklab19.us.loopexit, %if.end49.us
  %p_has_ownership.2201.us = phi i8 [ %p_has_ownership.1180.lcssa.us, %if.end49.us ], [ 1, %blklab19.us.loopexit ]
  %19 = phi i8* [ %.lcssa.us, %if.end49.us ], [ %call.i.us.lcssa, %blklab19.us.loopexit ]
  %20 = phi i8* [ %.lcssa204.us, %if.end49.us ], [ %call.i.us.lcssa, %blklab19.us.loopexit ]
  %num_solutions.1.us = phi i64 [ %add54.us, %if.end49.us ], [ %num_solutions.0186.us229, %blklab19.us.loopexit ]
  %21 = phi i8* [ %call50.us, %if.end49.us ], [ %26, %blklab19.us.loopexit ]
  %22 = phi i8* [ %call50.us, %if.end49.us ], [ %25, %blklab19.us.loopexit ]
  %_26_has_ownership.1.us = phi i8 [ 1, %if.end49.us ], [ %_26_has_ownership.0188.us227, %blklab19.us.loopexit ]
  tail call void @llvm.dbg.value(metadata i64 1, i64 0, metadata !101, metadata !161), !dbg !250
  %add55.us = add nuw nsw i64 %col.0183.us231, 1, !dbg !319
  tail call void @llvm.dbg.value(metadata i64 %add55.us, i64 0, metadata !102, metadata !161), !dbg !251
  tail call void @llvm.dbg.value(metadata i64 %add55.us, i64 0, metadata !72, metadata !161), !dbg !230
  tail call void @llvm.dbg.value(metadata i64 %queens_size, i64 0, metadata !80, metadata !161), !dbg !236
  tail call void @llvm.dbg.value(metadata i64 %queens_size, i64 0, metadata !81, metadata !161), !dbg !237
  %cmp15.us = icmp slt i64 %add55.us, %dim, !dbg !268
  br i1 %cmp15.us, label %blklab14.preheader.us, label %blklab8.loopexit, !dbg !270

blklab14.preheader.us:                            ; preds = %blklab14.preheader.us.preheader, %blklab19.us
  %23 = phi i8* [ %20, %blklab19.us ], [ undef, %blklab14.preheader.us.preheader ]
  %24 = phi i8* [ %19, %blklab19.us ], [ undef, %blklab14.preheader.us.preheader ]
  %p_has_ownership.0182.us232 = phi i8 [ %p_has_ownership.2201.us, %blklab19.us ], [ 0, %blklab14.preheader.us.preheader ]
  %col.0183.us231 = phi i64 [ %add55.us, %blklab19.us ], [ 0, %blklab14.preheader.us.preheader ]
  %num_solutions.0186.us229 = phi i64 [ %num_solutions.1.us, %blklab19.us ], [ 0, %blklab14.preheader.us.preheader ]
  %25 = phi i8* [ %22, %blklab19.us ], [ undef, %blklab14.preheader.us.preheader ]
  %26 = phi i8* [ %21, %blklab19.us ], [ undef, %blklab14.preheader.us.preheader ]
  %_26_has_ownership.0188.us227 = phi i8 [ %_26_has_ownership.1.us, %blklab19.us ], [ 0, %blklab14.preheader.us.preheader ]
  tail call void @llvm.dbg.value(metadata i64 %queens_size, i64 0, metadata !86, metadata !161), !dbg !241
  br i1 %cmp30213, label %if.end35.us.preheader, label %if.end46.us, !dbg !271

if.end35.us.preheader:                            ; preds = %blklab14.preheader.us
  br label %if.end35.us, !dbg !290

blklab11:                                         ; preds = %while.cond.preheader
  %27 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !dbg !320, !tbaa !189
  %28 = tail call i64 @fwrite(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.5, i64 0, i64 0), i64 4, i64 1, %struct._IO_FILE* %27) #9, !dbg !321
  tail call void @exit(i32 -1) #10, !dbg !322
  unreachable, !dbg !322

blklab8.loopexit:                                 ; preds = %blklab19.us
  %_26_has_ownership.1.us.lcssa = phi i8 [ %_26_has_ownership.1.us, %blklab19.us ]
  %.lcssa242 = phi i8* [ %21, %blklab19.us ]
  %num_solutions.1.us.lcssa = phi i64 [ %num_solutions.1.us, %blklab19.us ]
  %.lcssa241 = phi i8* [ %19, %blklab19.us ]
  %p_has_ownership.2201.us.lcssa = phi i8 [ %p_has_ownership.2201.us, %blklab19.us ]
  br label %blklab8, !dbg !323

blklab8:                                          ; preds = %blklab8.loopexit, %blklab10.preheader
  %.lcssa225 = phi i8* [ undef, %blklab10.preheader ], [ %.lcssa241, %blklab8.loopexit ]
  %p_has_ownership.0182.us.lcssa = phi i8 [ 0, %blklab10.preheader ], [ %p_has_ownership.2201.us.lcssa, %blklab8.loopexit ]
  %num_solutions.0186.us.lcssa = phi i64 [ 0, %blklab10.preheader ], [ %num_solutions.1.us.lcssa, %blklab8.loopexit ]
  %.lcssa = phi i8* [ undef, %blklab10.preheader ], [ %.lcssa242, %blklab8.loopexit ]
  %_26_has_ownership.0188.us.lcssa = phi i8 [ 0, %blklab10.preheader ], [ %_26_has_ownership.1.us.lcssa, %blklab8.loopexit ]
  %29 = and i8 %p_has_ownership.0182.us.lcssa, 1, !dbg !323
  %tobool56 = icmp eq i8 %29, 0, !dbg !323
  br i1 %tobool56, label %if.end61, label %if.then57, !dbg !325

if.then57:                                        ; preds = %blklab8
  tail call void @free(i8* %.lcssa225) #7, !dbg !326
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !76, metadata !161), !dbg !232
  br label %if.end61, !dbg !330

if.end61:                                         ; preds = %if.then57, %blklab8
  %30 = and i8 %_26_has_ownership.0188.us.lcssa, 1, !dbg !331
  %tobool62 = icmp eq i8 %30, 0, !dbg !331
  br i1 %tobool62, label %cleanup, label %if.then63, !dbg !333

if.then63:                                        ; preds = %if.end61
  tail call void @llvm.dbg.value(metadata %struct.POS* undef, i64 0, metadata !35, metadata !161) #7, !dbg !334
  tail call void @free(i8* %.lcssa) #7, !dbg !338
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !96, metadata !161), !dbg !245
  br label %cleanup, !dbg !339

cleanup:                                          ; preds = %if.then63, %if.end61, %entry
  %retval.0 = phi i64 [ 1, %entry ], [ %num_solutions.0186.us.lcssa, %if.end61 ], [ %num_solutions.0186.us.lcssa, %if.then63 ]
  ret i64 %retval.0, !dbg !340
}

; Function Attrs: noreturn nounwind
declare void @exit(i32) #3

; Function Attrs: noreturn nounwind uwtable
define i32 @main(i32 %argc, i8** %args) #4 !dbg !103 {
entry:
  tail call void @llvm.dbg.value(metadata i32 %argc, i64 0, metadata !110, metadata !161), !dbg !342
  tail call void @llvm.dbg.value(metadata i8** %args, i64 0, metadata !111, metadata !161), !dbg !343
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !114, metadata !161), !dbg !344
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !116, metadata !161), !dbg !345
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !117, metadata !161), !dbg !346
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !118, metadata !161), !dbg !347
  tail call void @llvm.dbg.value(metadata i64** null, i64 0, metadata !120, metadata !161), !dbg !348
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !122, metadata !161), !dbg !348
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !123, metadata !161), !dbg !348
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !124, metadata !161), !dbg !349
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !125, metadata !161), !dbg !350
  tail call void @llvm.dbg.value(metadata i64* null, i64 0, metadata !126, metadata !161), !dbg !351
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !127, metadata !161), !dbg !351
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !128, metadata !161), !dbg !352
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !129, metadata !161), !dbg !353
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !130, metadata !161), !dbg !354
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !132, metadata !161), !dbg !355
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !134, metadata !161), !dbg !356
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !135, metadata !161), !dbg !357
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !136, metadata !161), !dbg !358
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !137, metadata !161), !dbg !359
  tail call void @llvm.dbg.value(metadata i64* null, i64 0, metadata !139, metadata !161), !dbg !360
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !140, metadata !161), !dbg !360
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !141, metadata !161), !dbg !361
  tail call void @llvm.dbg.value(metadata i64* null, i64 0, metadata !143, metadata !161), !dbg !362
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !144, metadata !161), !dbg !362
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !145, metadata !161), !dbg !363
  tail call void @llvm.dbg.value(metadata i64* null, i64 0, metadata !148, metadata !161), !dbg !364
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !149, metadata !161), !dbg !364
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !150, metadata !161), !dbg !365
  tail call void @llvm.dbg.value(metadata i64* null, i64 0, metadata !153, metadata !161), !dbg !366
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !154, metadata !161), !dbg !366
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !155, metadata !161), !dbg !367
  %call = tail call i64** @convertArgsToIntArray(i32 %argc, i8** %args) #7, !dbg !368
  tail call void @llvm.dbg.value(metadata i64** %call, i64 0, metadata !120, metadata !161), !dbg !348
  %sub = add nsw i32 %argc, -1, !dbg !368
  %conv = sext i32 %sub to i64, !dbg !368
  tail call void @llvm.dbg.value(metadata i64 %conv, i64 0, metadata !122, metadata !161), !dbg !348
  tail call void @llvm.dbg.value(metadata i8 1, i64 0, metadata !124, metadata !161), !dbg !349
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !125, metadata !161), !dbg !350
  %0 = load i64*, i64** %call, align 8, !dbg !369, !tbaa !189
  tail call void @llvm.dbg.value(metadata i64* %0, i64 0, metadata !126, metadata !161), !dbg !351
  %call1 = tail call i64* @parseStringToInt(i64* %0) #7, !dbg !370
  tail call void @llvm.dbg.value(metadata i64* %call1, i64 0, metadata !119, metadata !161), !dbg !371
  tail call void @llvm.dbg.value(metadata i64* %call1, i64 0, metadata !112, metadata !161), !dbg !372
  %cmp = icmp eq i64* %call1, null, !dbg !373
  br i1 %cmp, label %if.end117.critedge, label %if.end, !dbg !375

if.end:                                           ; preds = %entry
  %1 = load i64, i64* %call1, align 8, !dbg !376, !tbaa !168
  tail call void @llvm.dbg.value(metadata i64 %1, i64 0, metadata !114, metadata !161), !dbg !344
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !129, metadata !161), !dbg !353
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !130, metadata !161), !dbg !354
  tail call void @llvm.dbg.value(metadata i8 1, i64 0, metadata !132, metadata !161), !dbg !355
  %mul = shl i64 %1, 3, !dbg !377
  %call9 = tail call noalias i8* @malloc(i64 %mul) #7, !dbg !378
  %2 = bitcast i8* %call9 to %struct.POS**, !dbg !378
  tail call void @llvm.dbg.value(metadata %struct.POS** %2, i64 0, metadata !133, metadata !161), !dbg !379
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !156, metadata !161), !dbg !380
  %cmp11213 = icmp sgt i64 %1, 0, !dbg !381
  br i1 %cmp11213, label %for.body.preheader, label %if.then92, !dbg !384

for.body.preheader:                               ; preds = %if.end
  br label %for.body, !dbg !385

for.body:                                         ; preds = %for.body.preheader, %for.body
  %indvars.iv = phi i64 [ %indvars.iv.next, %for.body ], [ 0, %for.body.preheader ]
  %call.i = tail call noalias i8* @malloc(i64 16) #7, !dbg !385
  %arrayidx14 = getelementptr inbounds %struct.POS*, %struct.POS** %2, i64 %indvars.iv, !dbg !389
  %3 = bitcast %struct.POS** %arrayidx14 to i8**, !dbg !390
  call void @llvm.memset.p0i8.i64(i8* %call.i, i8 0, i64 16, i32 8, i1 false), !dbg !391
  store i8* %call.i, i8** %3, align 8, !dbg !390, !tbaa !189
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1, !dbg !384
  %exitcond = icmp eq i64 %indvars.iv.next, %1, !dbg !384
  br i1 %exitcond, label %if.then92.loopexit, label %for.body, !dbg !384

if.then92.loopexit:                               ; preds = %for.body
  br label %if.then92, !dbg !356

if.then92:                                        ; preds = %if.then92.loopexit, %if.end
  tail call void @llvm.dbg.value(metadata i64 %1, i64 0, metadata !134, metadata !161), !dbg !356
  tail call void @llvm.dbg.value(metadata i8 1, i64 0, metadata !135, metadata !161), !dbg !357
  tail call void @llvm.dbg.value(metadata i64 %1, i64 0, metadata !116, metadata !161), !dbg !345
  tail call void @llvm.dbg.value(metadata %struct.POS** %2, i64 0, metadata !115, metadata !161), !dbg !392
  tail call void @llvm.dbg.value(metadata i8 1, i64 0, metadata !117, metadata !161), !dbg !346
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !135, metadata !161), !dbg !357
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !137, metadata !161), !dbg !359
  tail call void @llvm.dbg.value(metadata i8 1, i64 0, metadata !117, metadata !161), !dbg !346
  %call18 = tail call i64 @run(%struct.POS** %2, i64 %1, i1 zeroext undef, i64 0, i64 %1), !dbg !393
  tail call void @llvm.dbg.value(metadata i64 %call18, i64 0, metadata !136, metadata !161), !dbg !358
  tail call void @llvm.dbg.value(metadata i64 %call18, i64 0, metadata !118, metadata !161), !dbg !347
  tail call void @llvm.dbg.value(metadata i64 33, i64 0, metadata !140, metadata !161), !dbg !360
  %call22 = tail call noalias i8* @malloc(i64 264) #7, !dbg !394
  %4 = bitcast i8* %call22 to i64*, !dbg !394
  tail call void @llvm.dbg.value(metadata i64* %4, i64 0, metadata !139, metadata !161), !dbg !360
  %5 = bitcast i8* %call22 to <2 x i64>*, !dbg !395
  store <2 x i64> <i64 78, i64 45>, <2 x i64>* %5, align 8, !dbg !395, !tbaa !168
  %arrayidx25 = getelementptr inbounds i8, i8* %call22, i64 16, !dbg !396
  %6 = bitcast i8* %arrayidx25 to <2 x i64>*, !dbg !397
  store <2 x i64> <i64 81, i64 117>, <2 x i64>* %6, align 8, !dbg !397, !tbaa !168
  %arrayidx27 = getelementptr inbounds i8, i8* %call22, i64 32, !dbg !398
  %7 = bitcast i8* %arrayidx27 to <2 x i64>*, !dbg !399
  store <2 x i64> <i64 101, i64 101>, <2 x i64>* %7, align 8, !dbg !399, !tbaa !168
  %arrayidx29 = getelementptr inbounds i8, i8* %call22, i64 48, !dbg !400
  %8 = bitcast i8* %arrayidx29 to <2 x i64>*, !dbg !401
  store <2 x i64> <i64 110, i64 32>, <2 x i64>* %8, align 8, !dbg !401, !tbaa !168
  %arrayidx31 = getelementptr inbounds i8, i8* %call22, i64 64, !dbg !402
  %9 = bitcast i8* %arrayidx31 to <2 x i64>*, !dbg !403
  store <2 x i64> <i64 80, i64 114>, <2 x i64>* %9, align 8, !dbg !403, !tbaa !168
  %arrayidx33 = getelementptr inbounds i8, i8* %call22, i64 80, !dbg !404
  %10 = bitcast i8* %arrayidx33 to <2 x i64>*, !dbg !405
  store <2 x i64> <i64 111, i64 98>, <2 x i64>* %10, align 8, !dbg !405, !tbaa !168
  %arrayidx35 = getelementptr inbounds i8, i8* %call22, i64 96, !dbg !406
  %11 = bitcast i8* %arrayidx35 to <2 x i64>*, !dbg !407
  store <2 x i64> <i64 108, i64 101>, <2 x i64>* %11, align 8, !dbg !407, !tbaa !168
  %arrayidx37 = getelementptr inbounds i8, i8* %call22, i64 112, !dbg !408
  %12 = bitcast i8* %arrayidx37 to <2 x i64>*, !dbg !409
  store <2 x i64> <i64 109, i64 32>, <2 x i64>* %12, align 8, !dbg !409, !tbaa !168
  %arrayidx39 = getelementptr inbounds i8, i8* %call22, i64 128, !dbg !410
  %13 = bitcast i8* %arrayidx39 to <2 x i64>*, !dbg !411
  store <2 x i64> <i64 111, i64 110>, <2 x i64>* %13, align 8, !dbg !411, !tbaa !168
  %arrayidx41 = getelementptr inbounds i8, i8* %call22, i64 144, !dbg !412
  %14 = bitcast i8* %arrayidx41 to <2 x i64>*, !dbg !413
  store <2 x i64> <i64 32, i64 97>, <2 x i64>* %14, align 8, !dbg !413, !tbaa !168
  %arrayidx43 = getelementptr inbounds i8, i8* %call22, i64 160, !dbg !414
  %15 = bitcast i8* %arrayidx43 to <2 x i64>*, !dbg !415
  store <2 x i64> <i64 32, i64 78>, <2 x i64>* %15, align 8, !dbg !415, !tbaa !168
  %arrayidx45 = getelementptr inbounds i8, i8* %call22, i64 176, !dbg !416
  %16 = bitcast i8* %arrayidx45 to <2 x i64>*, !dbg !417
  store <2 x i64> <i64 32, i64 88>, <2 x i64>* %16, align 8, !dbg !417, !tbaa !168
  %arrayidx47 = getelementptr inbounds i8, i8* %call22, i64 192, !dbg !418
  %17 = bitcast i8* %arrayidx47 to <2 x i64>*, !dbg !419
  store <2 x i64> <i64 32, i64 78>, <2 x i64>* %17, align 8, !dbg !419, !tbaa !168
  %arrayidx49 = getelementptr inbounds i8, i8* %call22, i64 208, !dbg !420
  %18 = bitcast i8* %arrayidx49 to <2 x i64>*, !dbg !421
  store <2 x i64> <i64 32, i64 66>, <2 x i64>* %18, align 8, !dbg !421, !tbaa !168
  %arrayidx51 = getelementptr inbounds i8, i8* %call22, i64 224, !dbg !422
  %19 = bitcast i8* %arrayidx51 to <2 x i64>*, !dbg !423
  store <2 x i64> <i64 111, i64 97>, <2 x i64>* %19, align 8, !dbg !423, !tbaa !168
  %arrayidx53 = getelementptr inbounds i8, i8* %call22, i64 240, !dbg !424
  %20 = bitcast i8* %arrayidx53 to <2 x i64>*, !dbg !425
  store <2 x i64> <i64 114, i64 100>, <2 x i64>* %20, align 8, !dbg !425, !tbaa !168
  %arrayidx55 = getelementptr inbounds i8, i8* %call22, i64 256, !dbg !426
  %21 = bitcast i8* %arrayidx55 to i64*, !dbg !426
  store i64 46, i64* %21, align 8, !dbg !427, !tbaa !168
  tail call void @llvm.dbg.value(metadata i8 1, i64 0, metadata !141, metadata !161), !dbg !361
  tail call void @println_s(i64* %4, i64 33) #7, !dbg !428
  tail call void @llvm.dbg.value(metadata i64 4, i64 0, metadata !144, metadata !161), !dbg !362
  %call59 = tail call noalias i8* @malloc(i64 32) #7, !dbg !429
  %22 = bitcast i8* %call59 to i64*, !dbg !429
  tail call void @llvm.dbg.value(metadata i64* %22, i64 0, metadata !143, metadata !161), !dbg !362
  %23 = bitcast i8* %call59 to <2 x i64>*, !dbg !430
  store <2 x i64> <i64 78, i64 32>, <2 x i64>* %23, align 8, !dbg !430, !tbaa !168
  %arrayidx62 = getelementptr inbounds i8, i8* %call59, i64 16, !dbg !431
  %24 = bitcast i8* %arrayidx62 to <2 x i64>*, !dbg !432
  store <2 x i64> <i64 61, i64 32>, <2 x i64>* %24, align 8, !dbg !432, !tbaa !168
  tail call void @llvm.dbg.value(metadata i8 1, i64 0, metadata !145, metadata !161), !dbg !363
  tail call void @printf_s(i64* %22, i64 4) #7, !dbg !433
  %call64 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.6, i64 0, i64 0), i64 %1), !dbg !434
  tail call void @llvm.dbg.value(metadata i64 6, i64 0, metadata !149, metadata !161), !dbg !364
  %call68 = tail call noalias i8* @malloc(i64 48) #7, !dbg !435
  %25 = bitcast i8* %call68 to i64*, !dbg !435
  tail call void @llvm.dbg.value(metadata i64* %25, i64 0, metadata !148, metadata !161), !dbg !364
  %26 = bitcast i8* %call68 to <2 x i64>*, !dbg !436
  store <2 x i64> <i64 70, i64 111>, <2 x i64>* %26, align 8, !dbg !436, !tbaa !168
  %arrayidx71 = getelementptr inbounds i8, i8* %call68, i64 16, !dbg !437
  %27 = bitcast i8* %arrayidx71 to <2 x i64>*, !dbg !438
  store <2 x i64> <i64 117, i64 110>, <2 x i64>* %27, align 8, !dbg !438, !tbaa !168
  %arrayidx73 = getelementptr inbounds i8, i8* %call68, i64 32, !dbg !439
  %28 = bitcast i8* %arrayidx73 to <2 x i64>*, !dbg !440
  store <2 x i64> <i64 100, i64 32>, <2 x i64>* %28, align 8, !dbg !440, !tbaa !168
  tail call void @llvm.dbg.value(metadata i8 1, i64 0, metadata !150, metadata !161), !dbg !365
  tail call void @printf_s(i64* %25, i64 6) #7, !dbg !441
  %call75 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.2, i64 0, i64 0), i64 %call18), !dbg !442
  tail call void @llvm.dbg.value(metadata i64 11, i64 0, metadata !154, metadata !161), !dbg !366
  %call79 = tail call noalias i8* @malloc(i64 88) #7, !dbg !443
  %29 = bitcast i8* %call79 to i64*, !dbg !443
  tail call void @llvm.dbg.value(metadata i64* %29, i64 0, metadata !153, metadata !161), !dbg !366
  %30 = bitcast i8* %call79 to <2 x i64>*, !dbg !444
  store <2 x i64> <i64 32, i64 115>, <2 x i64>* %30, align 8, !dbg !444, !tbaa !168
  %arrayidx82 = getelementptr inbounds i8, i8* %call79, i64 16, !dbg !445
  %31 = bitcast i8* %arrayidx82 to <2 x i64>*, !dbg !446
  store <2 x i64> <i64 111, i64 108>, <2 x i64>* %31, align 8, !dbg !446, !tbaa !168
  %arrayidx84 = getelementptr inbounds i8, i8* %call79, i64 32, !dbg !447
  %32 = bitcast i8* %arrayidx84 to <2 x i64>*, !dbg !448
  store <2 x i64> <i64 117, i64 116>, <2 x i64>* %32, align 8, !dbg !448, !tbaa !168
  %arrayidx86 = getelementptr inbounds i8, i8* %call79, i64 48, !dbg !449
  %33 = bitcast i8* %arrayidx86 to <2 x i64>*, !dbg !450
  store <2 x i64> <i64 105, i64 111>, <2 x i64>* %33, align 8, !dbg !450, !tbaa !168
  %arrayidx88 = getelementptr inbounds i8, i8* %call79, i64 64, !dbg !451
  %34 = bitcast i8* %arrayidx88 to <2 x i64>*, !dbg !452
  store <2 x i64> <i64 110, i64 115>, <2 x i64>* %34, align 8, !dbg !452, !tbaa !168
  %arrayidx90 = getelementptr inbounds i8, i8* %call79, i64 80, !dbg !453
  %35 = bitcast i8* %arrayidx90 to i64*, !dbg !453
  store i64 46, i64* %35, align 8, !dbg !454, !tbaa !168
  tail call void @llvm.dbg.value(metadata i8 1, i64 0, metadata !155, metadata !161), !dbg !367
  tail call void @println_s(i64* %29, i64 11) #7, !dbg !455
  tail call void @free(i8* %call9) #7, !dbg !456
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !117, metadata !161), !dbg !346
  tail call void @free2DArray(i64** %call, i64 %conv) #7, !dbg !460
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !124, metadata !161), !dbg !349
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !132, metadata !161), !dbg !355
  tail call void @free(i8* %call22) #7, !dbg !464
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !141, metadata !161), !dbg !361
  tail call void @free(i8* %call59) #7, !dbg !468
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !145, metadata !161), !dbg !363
  tail call void @free(i8* %call68) #7, !dbg !472
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !150, metadata !161), !dbg !365
  tail call void @free(i8* %call79) #7, !dbg !476
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !155, metadata !161), !dbg !367
  br label %if.end117, !dbg !476

if.end117.critedge:                               ; preds = %entry
  tail call void @free2DArray(i64** %call, i64 %conv) #7, !dbg !460
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !124, metadata !161), !dbg !349
  br label %if.end117

if.end117:                                        ; preds = %if.end117.critedge, %if.then92
  tail call void @exit(i32 0) #10, !dbg !480
  unreachable, !dbg !480
}

declare i64** @convertArgsToIntArray(i32, i8**) #5

declare i64* @parseStringToInt(i64*) #5

declare void @println_s(i64*, i64) #5

declare void @printf_s(i64*, i64) #5

declare void @free2DArray(i64**, i64) #5

; Function Attrs: nounwind readnone
declare void @llvm.dbg.value(metadata, i64, metadata, metadata) #6

declare i32 @putchar(i32)

; Function Attrs: nounwind
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) #7

; Function Attrs: argmemonly nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture, i8, i64, i32, i1) #8

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { norecurse nounwind readonly uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "polly-optimized" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { noreturn nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { noreturn nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #6 = { nounwind readnone }
attributes #7 = { nounwind }
attributes #8 = { argmemonly nounwind }
attributes #9 = { cold }
attributes #10 = { noreturn nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!158, !159}
!llvm.ident = !{!160}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 3.9.0 (http://llvm.org/git/clang.git cf7bc8edf8cccb1b5de656c403cb55ad44132e98) (http://llvm.org/git/llvm.git 22706dc4c03305692f494d0e42a6de1050d0ec62)", isOptimized: true, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, subprograms: !5)
!1 = !DIFile(filename: "NQueens.c", directory: "/home/sam/workspace/WhileyOpenCL/polly/NQueens/impl/autogenerate")
!2 = !{}
!3 = !{!4}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64, align: 64)
!5 = !{!6, !20, !31, !36, !39, !61, !103}
!6 = distinct !DISubprogram(name: "copy_POS", scope: !1, file: !1, line: 2, type: !7, isLocal: false, isDefinition: true, scopeLine: 2, flags: DIFlagPrototyped, isOptimized: true, variables: !17)
!7 = !DISubroutineType(types: !8)
!8 = !{!9, !9}
!9 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !10, size: 64, align: 64)
!10 = !DIDerivedType(tag: DW_TAG_typedef, name: "POS", file: !11, line: 5, baseType: !12)
!11 = !DIFile(filename: "./NQueens.h", directory: "/home/sam/workspace/WhileyOpenCL/polly/NQueens/impl/autogenerate")
!12 = !DICompositeType(tag: DW_TAG_structure_type, file: !11, line: 2, size: 128, align: 64, elements: !13)
!13 = !{!14, !16}
!14 = !DIDerivedType(tag: DW_TAG_member, name: "r", scope: !12, file: !11, line: 3, baseType: !15, size: 64, align: 64)
!15 = !DIBasicType(name: "long long int", size: 64, align: 64, encoding: DW_ATE_signed)
!16 = !DIDerivedType(tag: DW_TAG_member, name: "c", scope: !12, file: !11, line: 4, baseType: !15, size: 64, align: 64, offset: 64)
!17 = !{!18, !19}
!18 = !DILocalVariable(name: "_POS", arg: 1, scope: !6, file: !1, line: 2, type: !9)
!19 = !DILocalVariable(name: "new_POS", scope: !6, file: !1, line: 3, type: !9)
!20 = distinct !DISubprogram(name: "copy_array_POS", scope: !1, file: !1, line: 8, type: !21, isLocal: false, isDefinition: true, scopeLine: 8, flags: DIFlagPrototyped, isOptimized: true, variables: !24)
!21 = !DISubroutineType(types: !22)
!22 = !{!23, !23, !15}
!23 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !9, size: 64, align: 64)
!24 = !{!25, !26, !27, !28}
!25 = !DILocalVariable(name: "_POS", arg: 1, scope: !20, file: !1, line: 8, type: !23)
!26 = !DILocalVariable(name: "_POS_size", arg: 2, scope: !20, file: !1, line: 8, type: !15)
!27 = !DILocalVariable(name: "new_POS", scope: !20, file: !1, line: 9, type: !23)
!28 = !DILocalVariable(name: "i", scope: !29, file: !1, line: 10, type: !30)
!29 = distinct !DILexicalBlock(scope: !20, file: !1, line: 10, column: 2)
!30 = !DIBasicType(name: "int", size: 32, align: 32, encoding: DW_ATE_signed)
!31 = distinct !DISubprogram(name: "free_POS", scope: !1, file: !1, line: 15, type: !32, isLocal: false, isDefinition: true, scopeLine: 15, flags: DIFlagPrototyped, isOptimized: true, variables: !34)
!32 = !DISubroutineType(types: !33)
!33 = !{null, !9}
!34 = !{!35}
!35 = !DILocalVariable(name: "pos", arg: 1, scope: !31, file: !1, line: 15, type: !9)
!36 = distinct !DISubprogram(name: "printf_POS", scope: !1, file: !1, line: 18, type: !32, isLocal: false, isDefinition: true, scopeLine: 18, flags: DIFlagPrototyped, isOptimized: true, variables: !37)
!37 = !{!38}
!38 = !DILocalVariable(name: "pos", arg: 1, scope: !36, file: !1, line: 18, type: !9)
!39 = distinct !DISubprogram(name: "conflict", scope: !1, file: !1, line: 26, type: !40, isLocal: false, isDefinition: true, scopeLine: 26, flags: DIFlagPrototyped, isOptimized: true, variables: !43)
!40 = !DISubroutineType(types: !41)
!41 = !{!15, !9, !42, !15, !15}
!42 = !DIBasicType(name: "_Bool", size: 8, align: 8, encoding: DW_ATE_boolean)
!43 = !{!44, !45, !46, !47, !48, !49, !50, !51, !52, !53, !54, !55, !56, !57, !58, !59, !60}
!44 = !DILocalVariable(name: "p", arg: 1, scope: !39, file: !1, line: 26, type: !9)
!45 = !DILocalVariable(name: "p_has_ownership", arg: 2, scope: !39, file: !1, line: 26, type: !42)
!46 = !DILocalVariable(name: "row", arg: 3, scope: !39, file: !1, line: 26, type: !15)
!47 = !DILocalVariable(name: "col", arg: 4, scope: !39, file: !1, line: 26, type: !15)
!48 = !DILocalVariable(name: "_3", scope: !39, file: !1, line: 27, type: !15)
!49 = !DILocalVariable(name: "r", scope: !39, file: !1, line: 28, type: !15)
!50 = !DILocalVariable(name: "c", scope: !39, file: !1, line: 29, type: !15)
!51 = !DILocalVariable(name: "colDiff", scope: !39, file: !1, line: 30, type: !15)
!52 = !DILocalVariable(name: "rowDiff", scope: !39, file: !1, line: 31, type: !15)
!53 = !DILocalVariable(name: "_8", scope: !39, file: !1, line: 32, type: !15)
!54 = !DILocalVariable(name: "_9", scope: !39, file: !1, line: 33, type: !15)
!55 = !DILocalVariable(name: "_10", scope: !39, file: !1, line: 34, type: !15)
!56 = !DILocalVariable(name: "_11", scope: !39, file: !1, line: 35, type: !15)
!57 = !DILocalVariable(name: "_12", scope: !39, file: !1, line: 36, type: !15)
!58 = !DILocalVariable(name: "_13", scope: !39, file: !1, line: 37, type: !15)
!59 = !DILocalVariable(name: "_14", scope: !39, file: !1, line: 38, type: !15)
!60 = !DILocalVariable(name: "_15", scope: !39, file: !1, line: 39, type: !15)
!61 = distinct !DISubprogram(name: "run", scope: !1, file: !1, line: 89, type: !62, isLocal: false, isDefinition: true, scopeLine: 89, flags: DIFlagPrototyped, isOptimized: true, variables: !64)
!62 = !DISubroutineType(types: !63)
!63 = !{!15, !23, !15, !42, !15, !15}
!64 = !{!65, !66, !67, !68, !69, !70, !71, !72, !73, !74, !75, !76, !77, !78, !79, !80, !81, !82, !83, !84, !85, !86, !87, !88, !89, !90, !91, !92, !93, !94, !95, !96, !97, !98, !99, !100, !101, !102}
!65 = !DILocalVariable(name: "queens", arg: 1, scope: !61, file: !1, line: 89, type: !23)
!66 = !DILocalVariable(name: "queens_size", arg: 2, scope: !61, file: !1, line: 89, type: !15)
!67 = !DILocalVariable(name: "queens_has_ownership", arg: 3, scope: !61, file: !1, line: 89, type: !42)
!68 = !DILocalVariable(name: "n", arg: 4, scope: !61, file: !1, line: 89, type: !15)
!69 = !DILocalVariable(name: "dim", arg: 5, scope: !61, file: !1, line: 89, type: !15)
!70 = !DILocalVariable(name: "_3", scope: !61, file: !1, line: 90, type: !15)
!71 = !DILocalVariable(name: "num_solutions", scope: !61, file: !1, line: 91, type: !15)
!72 = !DILocalVariable(name: "col", scope: !61, file: !1, line: 92, type: !15)
!73 = !DILocalVariable(name: "solution", scope: !61, file: !1, line: 93, type: !15)
!74 = !DILocalVariable(name: "i", scope: !61, file: !1, line: 94, type: !15)
!75 = !DILocalVariable(name: "p", scope: !61, file: !1, line: 95, type: !9)
!76 = !DILocalVariable(name: "p_has_ownership", scope: !61, file: !1, line: 96, type: !42)
!77 = !DILocalVariable(name: "_9", scope: !61, file: !1, line: 97, type: !15)
!78 = !DILocalVariable(name: "_10", scope: !61, file: !1, line: 98, type: !15)
!79 = !DILocalVariable(name: "_11", scope: !61, file: !1, line: 99, type: !15)
!80 = !DILocalVariable(name: "_12", scope: !61, file: !1, line: 100, type: !15)
!81 = !DILocalVariable(name: "_13", scope: !61, file: !1, line: 101, type: !15)
!82 = !DILocalVariable(name: "_14", scope: !61, file: !1, line: 102, type: !15)
!83 = !DILocalVariable(name: "_15", scope: !61, file: !1, line: 103, type: !15)
!84 = !DILocalVariable(name: "_16", scope: !61, file: !1, line: 104, type: !15)
!85 = !DILocalVariable(name: "_17", scope: !61, file: !1, line: 105, type: !15)
!86 = !DILocalVariable(name: "_18", scope: !61, file: !1, line: 106, type: !15)
!87 = !DILocalVariable(name: "_19", scope: !61, file: !1, line: 107, type: !9)
!88 = !DILocalVariable(name: "_19_has_ownership", scope: !61, file: !1, line: 108, type: !42)
!89 = !DILocalVariable(name: "_20", scope: !61, file: !1, line: 109, type: !15)
!90 = !DILocalVariable(name: "_21", scope: !61, file: !1, line: 110, type: !15)
!91 = !DILocalVariable(name: "_22", scope: !61, file: !1, line: 111, type: !15)
!92 = !DILocalVariable(name: "_23", scope: !61, file: !1, line: 112, type: !15)
!93 = !DILocalVariable(name: "_24", scope: !61, file: !1, line: 113, type: !15)
!94 = !DILocalVariable(name: "_25", scope: !61, file: !1, line: 114, type: !15)
!95 = !DILocalVariable(name: "_26", scope: !61, file: !1, line: 115, type: !9)
!96 = !DILocalVariable(name: "_26_has_ownership", scope: !61, file: !1, line: 116, type: !42)
!97 = !DILocalVariable(name: "_27", scope: !61, file: !1, line: 117, type: !15)
!98 = !DILocalVariable(name: "_28", scope: !61, file: !1, line: 118, type: !15)
!99 = !DILocalVariable(name: "_29", scope: !61, file: !1, line: 119, type: !15)
!100 = !DILocalVariable(name: "_30", scope: !61, file: !1, line: 120, type: !15)
!101 = !DILocalVariable(name: "_31", scope: !61, file: !1, line: 121, type: !15)
!102 = !DILocalVariable(name: "_32", scope: !61, file: !1, line: 122, type: !15)
!103 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 289, type: !104, isLocal: false, isDefinition: true, scopeLine: 289, flags: DIFlagPrototyped, isOptimized: true, variables: !109)
!104 = !DISubroutineType(types: !105)
!105 = !{!30, !30, !106}
!106 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !107, size: 64, align: 64)
!107 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !108, size: 64, align: 64)
!108 = !DIBasicType(name: "char", size: 8, align: 8, encoding: DW_ATE_signed_char)
!109 = !{!110, !111, !112, !114, !115, !116, !117, !118, !119, !120, !122, !123, !124, !125, !126, !127, !128, !129, !130, !131, !132, !133, !134, !135, !136, !137, !138, !139, !140, !141, !142, !143, !144, !145, !146, !147, !148, !149, !150, !151, !152, !153, !154, !155, !156}
!110 = !DILocalVariable(name: "argc", arg: 1, scope: !103, file: !1, line: 289, type: !30)
!111 = !DILocalVariable(name: "args", arg: 2, scope: !103, file: !1, line: 289, type: !106)
!112 = !DILocalVariable(name: "max", scope: !103, file: !1, line: 290, type: !113)
!113 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !15, size: 64, align: 64)
!114 = !DILocalVariable(name: "n", scope: !103, file: !1, line: 291, type: !15)
!115 = !DILocalVariable(name: "init", scope: !103, file: !1, line: 292, type: !23)
!116 = !DILocalVariable(name: "init_size", scope: !103, file: !1, line: 293, type: !15)
!117 = !DILocalVariable(name: "init_has_ownership", scope: !103, file: !1, line: 294, type: !42)
!118 = !DILocalVariable(name: "num_solutions", scope: !103, file: !1, line: 295, type: !15)
!119 = !DILocalVariable(name: "_5", scope: !103, file: !1, line: 296, type: !113)
!120 = !DILocalVariable(name: "_6", scope: !103, file: !1, line: 297, type: !121)
!121 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !113, size: 64, align: 64)
!122 = !DILocalVariable(name: "_6_size", scope: !103, file: !1, line: 297, type: !15)
!123 = !DILocalVariable(name: "_6_size_size", scope: !103, file: !1, line: 297, type: !15)
!124 = !DILocalVariable(name: "_6_has_ownership", scope: !103, file: !1, line: 298, type: !42)
!125 = !DILocalVariable(name: "_7", scope: !103, file: !1, line: 299, type: !15)
!126 = !DILocalVariable(name: "_8", scope: !103, file: !1, line: 300, type: !113)
!127 = !DILocalVariable(name: "_8_size", scope: !103, file: !1, line: 300, type: !15)
!128 = !DILocalVariable(name: "_8_has_ownership", scope: !103, file: !1, line: 301, type: !42)
!129 = !DILocalVariable(name: "_9", scope: !103, file: !1, line: 302, type: !15)
!130 = !DILocalVariable(name: "_10", scope: !103, file: !1, line: 303, type: !15)
!131 = !DILocalVariable(name: "_11", scope: !103, file: !1, line: 304, type: !9)
!132 = !DILocalVariable(name: "_11_has_ownership", scope: !103, file: !1, line: 305, type: !42)
!133 = !DILocalVariable(name: "_12", scope: !103, file: !1, line: 306, type: !23)
!134 = !DILocalVariable(name: "_12_size", scope: !103, file: !1, line: 307, type: !15)
!135 = !DILocalVariable(name: "_12_has_ownership", scope: !103, file: !1, line: 308, type: !42)
!136 = !DILocalVariable(name: "_13", scope: !103, file: !1, line: 309, type: !15)
!137 = !DILocalVariable(name: "_14", scope: !103, file: !1, line: 310, type: !15)
!138 = !DILocalVariable(name: "_15", scope: !103, file: !1, line: 311, type: !4)
!139 = !DILocalVariable(name: "_17", scope: !103, file: !1, line: 312, type: !113)
!140 = !DILocalVariable(name: "_17_size", scope: !103, file: !1, line: 312, type: !15)
!141 = !DILocalVariable(name: "_17_has_ownership", scope: !103, file: !1, line: 313, type: !42)
!142 = !DILocalVariable(name: "_18", scope: !103, file: !1, line: 314, type: !4)
!143 = !DILocalVariable(name: "_20", scope: !103, file: !1, line: 315, type: !113)
!144 = !DILocalVariable(name: "_20_size", scope: !103, file: !1, line: 315, type: !15)
!145 = !DILocalVariable(name: "_20_has_ownership", scope: !103, file: !1, line: 316, type: !42)
!146 = !DILocalVariable(name: "_21", scope: !103, file: !1, line: 317, type: !4)
!147 = !DILocalVariable(name: "_23", scope: !103, file: !1, line: 318, type: !4)
!148 = !DILocalVariable(name: "_25", scope: !103, file: !1, line: 319, type: !113)
!149 = !DILocalVariable(name: "_25_size", scope: !103, file: !1, line: 319, type: !15)
!150 = !DILocalVariable(name: "_25_has_ownership", scope: !103, file: !1, line: 320, type: !42)
!151 = !DILocalVariable(name: "_26", scope: !103, file: !1, line: 321, type: !4)
!152 = !DILocalVariable(name: "_28", scope: !103, file: !1, line: 322, type: !4)
!153 = !DILocalVariable(name: "_30", scope: !103, file: !1, line: 323, type: !113)
!154 = !DILocalVariable(name: "_30_size", scope: !103, file: !1, line: 323, type: !15)
!155 = !DILocalVariable(name: "_30_has_ownership", scope: !103, file: !1, line: 324, type: !42)
!156 = !DILocalVariable(name: "_12_i", scope: !157, file: !1, line: 353, type: !30)
!157 = distinct !DILexicalBlock(scope: !103, file: !1, line: 353, column: 2)
!158 = !{i32 2, !"Dwarf Version", i32 4}
!159 = !{i32 2, !"Debug Info Version", i32 3}
!160 = !{!"clang version 3.9.0 (http://llvm.org/git/clang.git cf7bc8edf8cccb1b5de656c403cb55ad44132e98) (http://llvm.org/git/llvm.git 22706dc4c03305692f494d0e42a6de1050d0ec62)"}
!161 = !DIExpression()
!162 = !DILocation(line: 2, column: 20, scope: !6)
!163 = !DILocation(line: 3, column: 17, scope: !164)
!164 = !DILexicalBlockFile(scope: !6, file: !1, discriminator: 1)
!165 = !DILocation(line: 3, column: 17, scope: !6)
!166 = !DILocation(line: 3, column: 7, scope: !6)
!167 = !DILocation(line: 4, column: 21, scope: !6)
!168 = !{!169, !169, i64 0}
!169 = !{!"long long", !170, i64 0}
!170 = !{!"omnipotent char", !171, i64 0}
!171 = !{!"Simple C/C++ TBAA"}
!172 = !DILocation(line: 4, column: 13, scope: !6)
!173 = !DILocation(line: 6, column: 2, scope: !6)
!174 = !DILocation(line: 8, column: 28, scope: !20)
!175 = !DILocation(line: 8, column: 44, scope: !20)
!176 = !DILocation(line: 9, column: 34, scope: !20)
!177 = !DILocation(line: 9, column: 18, scope: !178)
!178 = !DILexicalBlockFile(scope: !20, file: !1, discriminator: 1)
!179 = !DILocation(line: 9, column: 18, scope: !20)
!180 = !DILocation(line: 9, column: 8, scope: !20)
!181 = !DILocation(line: 10, column: 10, scope: !29)
!182 = !DILocation(line: 10, column: 15, scope: !183)
!183 = !DILexicalBlockFile(scope: !184, file: !1, discriminator: 1)
!184 = distinct !DILexicalBlock(scope: !29, file: !1, line: 10, column: 2)
!185 = !DILocation(line: 10, column: 2, scope: !183)
!186 = !DILocation(line: 11, column: 25, scope: !187)
!187 = distinct !DILexicalBlock(scope: !184, file: !1, line: 10, column: 30)
!188 = !DILocation(line: 13, column: 2, scope: !20)
!189 = !{!190, !190, i64 0}
!190 = !{!"any pointer", !170, i64 0}
!191 = !DILocation(line: 3, column: 17, scope: !164, inlinedAt: !192)
!192 = distinct !DILocation(line: 11, column: 16, scope: !187)
!193 = !DILocation(line: 4, column: 21, scope: !6, inlinedAt: !192)
!194 = !DILocation(line: 4, column: 13, scope: !6, inlinedAt: !192)
!195 = !DILocation(line: 11, column: 3, scope: !187)
!196 = !DILocation(line: 11, column: 14, scope: !187)
!197 = !DILocation(line: 15, column: 20, scope: !31)
!198 = !DILocation(line: 16, column: 7, scope: !31)
!199 = !DILocation(line: 16, column: 2, scope: !31)
!200 = !DILocation(line: 17, column: 1, scope: !31)
!201 = !DILocation(line: 18, column: 22, scope: !36)
!202 = !DILocation(line: 19, column: 2, scope: !36)
!203 = !DILocation(line: 20, column: 2, scope: !36)
!204 = !DILocation(line: 21, column: 22, scope: !36)
!205 = !{!206, !169, i64 0}
!206 = !{!"", !169, i64 0, !169, i64 8}
!207 = !DILocation(line: 21, column: 2, scope: !36)
!208 = !DILocation(line: 22, column: 2, scope: !36)
!209 = !DILocation(line: 23, column: 22, scope: !36)
!210 = !{!206, !169, i64 8}
!211 = !DILocation(line: 23, column: 2, scope: !36)
!212 = !DILocation(line: 24, column: 2, scope: !36)
!213 = !DILocation(line: 25, column: 1, scope: !36)
!214 = !DILocation(line: 87, column: 1, scope: !39)
!215 = !DILocation(line: 61, column: 7, scope: !39)
!216 = !DILocation(line: 63, column: 8, scope: !39)
!217 = !DILocation(line: 67, column: 7, scope: !39)
!218 = !DILocation(line: 69, column: 8, scope: !39)
!219 = !DILocation(line: 73, column: 12, scope: !220)
!220 = distinct !DILexicalBlock(scope: !39, file: !1, line: 73, column: 5)
!221 = !DILocation(line: 81, column: 2, scope: !39)
!222 = !DILocation(line: 89, column: 21, scope: !61)
!223 = !DILocation(line: 89, column: 39, scope: !61)
!224 = !DIExpression(DW_OP_bit_piece, 0, 1)
!225 = !DILocation(line: 89, column: 52, scope: !61)
!226 = !DILocation(line: 89, column: 93, scope: !61)
!227 = !DILocation(line: 89, column: 106, scope: !61)
!228 = !DILocation(line: 90, column: 12, scope: !61)
!229 = !DILocation(line: 91, column: 12, scope: !61)
!230 = !DILocation(line: 92, column: 12, scope: !61)
!231 = !DILocation(line: 94, column: 12, scope: !61)
!232 = !DILocation(line: 96, column: 2, scope: !61)
!233 = !DILocation(line: 97, column: 12, scope: !61)
!234 = !DILocation(line: 98, column: 12, scope: !61)
!235 = !DILocation(line: 99, column: 12, scope: !61)
!236 = !DILocation(line: 100, column: 12, scope: !61)
!237 = !DILocation(line: 101, column: 12, scope: !61)
!238 = !DILocation(line: 103, column: 12, scope: !61)
!239 = !DILocation(line: 104, column: 12, scope: !61)
!240 = !DILocation(line: 105, column: 12, scope: !61)
!241 = !DILocation(line: 106, column: 12, scope: !61)
!242 = !DILocation(line: 108, column: 2, scope: !61)
!243 = !DILocation(line: 112, column: 12, scope: !61)
!244 = !DILocation(line: 113, column: 12, scope: !61)
!245 = !DILocation(line: 116, column: 2, scope: !61)
!246 = !DILocation(line: 117, column: 12, scope: !61)
!247 = !DILocation(line: 118, column: 12, scope: !61)
!248 = !DILocation(line: 119, column: 12, scope: !61)
!249 = !DILocation(line: 120, column: 12, scope: !61)
!250 = !DILocation(line: 121, column: 12, scope: !61)
!251 = !DILocation(line: 122, column: 12, scope: !61)
!252 = !DILocation(line: 124, column: 8, scope: !253)
!253 = distinct !DILexicalBlock(scope: !61, file: !1, line: 124, column: 5)
!254 = !DILocation(line: 124, column: 5, scope: !61)
!255 = !DILocation(line: 151, column: 8, scope: !256)
!256 = distinct !DILexicalBlock(scope: !257, file: !1, line: 151, column: 7)
!257 = distinct !DILexicalBlock(scope: !258, file: !1, line: 147, column: 3)
!258 = distinct !DILexicalBlock(scope: !61, file: !1, line: 145, column: 13)
!259 = !DILocation(line: 155, column: 10, scope: !260)
!260 = distinct !DILexicalBlock(scope: !257, file: !1, line: 155, column: 7)
!261 = !DILocation(line: 151, column: 7, scope: !257)
!262 = !DILocation(line: 203, column: 8, scope: !263)
!263 = distinct !DILexicalBlock(scope: !264, file: !1, line: 203, column: 7)
!264 = distinct !DILexicalBlock(scope: !258, file: !1, line: 176, column: 14)
!265 = !DILocation(line: 254, column: 3, scope: !258)
!266 = !DILocation(line: 254, column: 13, scope: !258)
!267 = !DILocation(line: 258, column: 8, scope: !258)
!268 = !DILocation(line: 166, column: 9, scope: !269)
!269 = distinct !DILexicalBlock(scope: !258, file: !1, line: 166, column: 6)
!270 = !DILocation(line: 166, column: 6, scope: !258)
!271 = !DILocation(line: 203, column: 7, scope: !264)
!272 = !DILocation(line: 114, column: 12, scope: !61)
!273 = !DILocation(line: 248, column: 3, scope: !274)
!274 = distinct !DILexicalBlock(scope: !258, file: !1, line: 248, column: 3)
!275 = !DILocation(line: 248, column: 3, scope: !258)
!276 = !DILocation(line: 15, column: 20, scope: !31, inlinedAt: !277)
!277 = distinct !DILocation(line: 248, column: 3, scope: !278)
!278 = !DILexicalBlockFile(scope: !279, file: !1, discriminator: 1)
!279 = distinct !DILexicalBlock(scope: !274, file: !1, line: 248, column: 3)
!280 = !DILocation(line: 16, column: 2, scope: !31, inlinedAt: !277)
!281 = !DILocation(line: 248, column: 3, scope: !278)
!282 = !DILocation(line: 249, column: 9, scope: !258)
!283 = !DILocation(line: 250, column: 8, scope: !258)
!284 = !DILocation(line: 250, column: 10, scope: !258)
!285 = !DILocation(line: 251, column: 8, scope: !258)
!286 = !DILocation(line: 251, column: 10, scope: !258)
!287 = !DILocation(line: 261, column: 9, scope: !258)
!288 = !DILocation(line: 263, column: 20, scope: !258)
!289 = !DILocation(line: 265, column: 3, scope: !258)
!290 = !DILocation(line: 206, column: 19, scope: !264)
!291 = !DILocation(line: 2, column: 20, scope: !6, inlinedAt: !292)
!292 = distinct !DILocation(line: 206, column: 10, scope: !264)
!293 = !DILocation(line: 3, column: 17, scope: !164, inlinedAt: !292)
!294 = !DILocation(line: 4, column: 21, scope: !6, inlinedAt: !292)
!295 = !DILocation(line: 4, column: 11, scope: !6, inlinedAt: !292)
!296 = !DILocation(line: 4, column: 13, scope: !6, inlinedAt: !292)
!297 = !DILocation(line: 5, column: 21, scope: !6, inlinedAt: !292)
!298 = !DILocation(line: 5, column: 11, scope: !6, inlinedAt: !292)
!299 = !DILocation(line: 5, column: 13, scope: !6, inlinedAt: !292)
!300 = !DILocation(line: 209, column: 4, scope: !301)
!301 = distinct !DILexicalBlock(scope: !264, file: !1, line: 209, column: 4)
!302 = !DILocation(line: 209, column: 4, scope: !264)
!303 = !DILocation(line: 15, column: 20, scope: !31, inlinedAt: !304)
!304 = distinct !DILocation(line: 209, column: 4, scope: !305)
!305 = !DILexicalBlockFile(scope: !306, file: !1, discriminator: 1)
!306 = distinct !DILexicalBlock(scope: !301, file: !1, line: 209, column: 4)
!307 = !DILocation(line: 16, column: 2, scope: !31, inlinedAt: !304)
!308 = !DILocation(line: 215, column: 10, scope: !264)
!309 = !DILocation(line: 209, column: 4, scope: !305)
!310 = !DILocation(line: 61, column: 7, scope: !39, inlinedAt: !311)
!311 = distinct !DILocation(line: 215, column: 10, scope: !264)
!312 = !DILocation(line: 63, column: 8, scope: !39, inlinedAt: !311)
!313 = !DILocation(line: 67, column: 7, scope: !39, inlinedAt: !311)
!314 = !DILocation(line: 69, column: 8, scope: !39, inlinedAt: !311)
!315 = !DILocation(line: 73, column: 12, scope: !220, inlinedAt: !311)
!316 = !DILocation(line: 110, column: 12, scope: !61)
!317 = !DILocation(line: 235, column: 9, scope: !264)
!318 = !DILocation(line: 219, column: 7, scope: !264)
!319 = !DILocation(line: 271, column: 10, scope: !258)
!320 = !DILocation(line: 159, column: 12, scope: !257)
!321 = !DILocation(line: 159, column: 4, scope: !257)
!322 = !DILocation(line: 160, column: 4, scope: !257)
!323 = !DILocation(line: 280, column: 2, scope: !324)
!324 = distinct !DILexicalBlock(scope: !61, file: !1, line: 280, column: 2)
!325 = !DILocation(line: 280, column: 2, scope: !61)
!326 = !DILocation(line: 16, column: 2, scope: !31, inlinedAt: !327)
!327 = distinct !DILocation(line: 280, column: 2, scope: !328)
!328 = !DILexicalBlockFile(scope: !329, file: !1, discriminator: 1)
!329 = distinct !DILexicalBlock(scope: !324, file: !1, line: 280, column: 2)
!330 = !DILocation(line: 280, column: 2, scope: !328)
!331 = !DILocation(line: 282, column: 2, scope: !332)
!332 = distinct !DILexicalBlock(scope: !61, file: !1, line: 282, column: 2)
!333 = !DILocation(line: 282, column: 2, scope: !61)
!334 = !DILocation(line: 15, column: 20, scope: !31, inlinedAt: !335)
!335 = distinct !DILocation(line: 282, column: 2, scope: !336)
!336 = !DILexicalBlockFile(scope: !337, file: !1, discriminator: 1)
!337 = distinct !DILexicalBlock(scope: !332, file: !1, line: 282, column: 2)
!338 = !DILocation(line: 16, column: 2, scope: !31, inlinedAt: !335)
!339 = !DILocation(line: 282, column: 2, scope: !336)
!340 = !DILocation(line: 287, column: 1, scope: !341)
!341 = !DILexicalBlockFile(scope: !61, file: !1, discriminator: 2)
!342 = !DILocation(line: 289, column: 14, scope: !103)
!343 = !DILocation(line: 289, column: 27, scope: !103)
!344 = !DILocation(line: 291, column: 12, scope: !103)
!345 = !DILocation(line: 293, column: 12, scope: !103)
!346 = !DILocation(line: 294, column: 2, scope: !103)
!347 = !DILocation(line: 295, column: 12, scope: !103)
!348 = !DILocation(line: 297, column: 2, scope: !103)
!349 = !DILocation(line: 298, column: 2, scope: !103)
!350 = !DILocation(line: 299, column: 12, scope: !103)
!351 = !DILocation(line: 300, column: 2, scope: !103)
!352 = !DILocation(line: 301, column: 2, scope: !103)
!353 = !DILocation(line: 302, column: 12, scope: !103)
!354 = !DILocation(line: 303, column: 12, scope: !103)
!355 = !DILocation(line: 305, column: 2, scope: !103)
!356 = !DILocation(line: 307, column: 12, scope: !103)
!357 = !DILocation(line: 308, column: 2, scope: !103)
!358 = !DILocation(line: 309, column: 12, scope: !103)
!359 = !DILocation(line: 310, column: 12, scope: !103)
!360 = !DILocation(line: 312, column: 2, scope: !103)
!361 = !DILocation(line: 313, column: 2, scope: !103)
!362 = !DILocation(line: 315, column: 2, scope: !103)
!363 = !DILocation(line: 316, column: 2, scope: !103)
!364 = !DILocation(line: 319, column: 2, scope: !103)
!365 = !DILocation(line: 320, column: 2, scope: !103)
!366 = !DILocation(line: 323, column: 2, scope: !103)
!367 = !DILocation(line: 324, column: 2, scope: !103)
!368 = !DILocation(line: 326, column: 2, scope: !103)
!369 = !DILocation(line: 331, column: 5, scope: !103)
!370 = !DILocation(line: 333, column: 2, scope: !103)
!371 = !DILocation(line: 296, column: 13, scope: !103)
!372 = !DILocation(line: 290, column: 13, scope: !103)
!373 = !DILocation(line: 337, column: 9, scope: !374)
!374 = distinct !DILexicalBlock(scope: !103, file: !1, line: 337, column: 5)
!375 = !DILocation(line: 337, column: 5, scope: !103)
!376 = !DILocation(line: 339, column: 6, scope: !103)
!377 = !DILocation(line: 352, column: 16, scope: !103)
!378 = !DILocation(line: 352, column: 8, scope: !103)
!379 = !DILocation(line: 306, column: 8, scope: !103)
!380 = !DILocation(line: 353, column: 10, scope: !157)
!381 = !DILocation(line: 353, column: 23, scope: !382)
!382 = !DILexicalBlockFile(scope: !383, file: !1, discriminator: 1)
!383 = distinct !DILexicalBlock(scope: !157, file: !1, line: 353, column: 2)
!384 = !DILocation(line: 353, column: 2, scope: !382)
!385 = !DILocation(line: 3, column: 17, scope: !164, inlinedAt: !386)
!386 = distinct !DILocation(line: 353, column: 48, scope: !387)
!387 = !DILexicalBlockFile(scope: !388, file: !1, discriminator: 3)
!388 = distinct !DILexicalBlock(scope: !383, file: !1, line: 353, column: 34)
!389 = !DILocation(line: 353, column: 35, scope: !387)
!390 = !DILocation(line: 353, column: 46, scope: !387)
!391 = !DILocation(line: 5, column: 13, scope: !6, inlinedAt: !386)
!392 = !DILocation(line: 292, column: 8, scope: !103)
!393 = !DILocation(line: 365, column: 8, scope: !103)
!394 = !DILocation(line: 372, column: 2, scope: !103)
!395 = !DILocation(line: 373, column: 9, scope: !103)
!396 = !DILocation(line: 373, column: 28, scope: !103)
!397 = !DILocation(line: 373, column: 35, scope: !103)
!398 = !DILocation(line: 373, column: 55, scope: !103)
!399 = !DILocation(line: 373, column: 62, scope: !103)
!400 = !DILocation(line: 373, column: 83, scope: !103)
!401 = !DILocation(line: 373, column: 90, scope: !103)
!402 = !DILocation(line: 373, column: 110, scope: !103)
!403 = !DILocation(line: 373, column: 117, scope: !103)
!404 = !DILocation(line: 373, column: 137, scope: !103)
!405 = !DILocation(line: 373, column: 145, scope: !103)
!406 = !DILocation(line: 373, column: 166, scope: !103)
!407 = !DILocation(line: 373, column: 174, scope: !103)
!408 = !DILocation(line: 373, column: 196, scope: !103)
!409 = !DILocation(line: 373, column: 204, scope: !103)
!410 = !DILocation(line: 373, column: 225, scope: !103)
!411 = !DILocation(line: 373, column: 233, scope: !103)
!412 = !DILocation(line: 373, column: 255, scope: !103)
!413 = !DILocation(line: 373, column: 263, scope: !103)
!414 = !DILocation(line: 373, column: 283, scope: !103)
!415 = !DILocation(line: 373, column: 291, scope: !103)
!416 = !DILocation(line: 373, column: 311, scope: !103)
!417 = !DILocation(line: 373, column: 319, scope: !103)
!418 = !DILocation(line: 373, column: 339, scope: !103)
!419 = !DILocation(line: 373, column: 347, scope: !103)
!420 = !DILocation(line: 373, column: 367, scope: !103)
!421 = !DILocation(line: 373, column: 375, scope: !103)
!422 = !DILocation(line: 373, column: 395, scope: !103)
!423 = !DILocation(line: 373, column: 403, scope: !103)
!424 = !DILocation(line: 373, column: 424, scope: !103)
!425 = !DILocation(line: 373, column: 432, scope: !103)
!426 = !DILocation(line: 373, column: 454, scope: !103)
!427 = !DILocation(line: 373, column: 462, scope: !103)
!428 = !DILocation(line: 376, column: 2, scope: !103)
!429 = !DILocation(line: 381, column: 2, scope: !103)
!430 = !DILocation(line: 382, column: 9, scope: !103)
!431 = !DILocation(line: 382, column: 28, scope: !103)
!432 = !DILocation(line: 382, column: 35, scope: !103)
!433 = !DILocation(line: 385, column: 2, scope: !103)
!434 = !DILocation(line: 389, column: 2, scope: !103)
!435 = !DILocation(line: 394, column: 2, scope: !103)
!436 = !DILocation(line: 395, column: 9, scope: !103)
!437 = !DILocation(line: 395, column: 29, scope: !103)
!438 = !DILocation(line: 395, column: 36, scope: !103)
!439 = !DILocation(line: 395, column: 57, scope: !103)
!440 = !DILocation(line: 395, column: 64, scope: !103)
!441 = !DILocation(line: 398, column: 2, scope: !103)
!442 = !DILocation(line: 402, column: 2, scope: !103)
!443 = !DILocation(line: 407, column: 2, scope: !103)
!444 = !DILocation(line: 408, column: 9, scope: !103)
!445 = !DILocation(line: 408, column: 29, scope: !103)
!446 = !DILocation(line: 408, column: 36, scope: !103)
!447 = !DILocation(line: 408, column: 57, scope: !103)
!448 = !DILocation(line: 408, column: 64, scope: !103)
!449 = !DILocation(line: 408, column: 85, scope: !103)
!450 = !DILocation(line: 408, column: 92, scope: !103)
!451 = !DILocation(line: 408, column: 113, scope: !103)
!452 = !DILocation(line: 408, column: 120, scope: !103)
!453 = !DILocation(line: 408, column: 141, scope: !103)
!454 = !DILocation(line: 408, column: 149, scope: !103)
!455 = !DILocation(line: 411, column: 2, scope: !103)
!456 = !DILocation(line: 415, column: 2, scope: !457)
!457 = !DILexicalBlockFile(scope: !458, file: !1, discriminator: 1)
!458 = distinct !DILexicalBlock(scope: !459, file: !1, line: 415, column: 2)
!459 = distinct !DILexicalBlock(scope: !103, file: !1, line: 415, column: 2)
!460 = !DILocation(line: 416, column: 2, scope: !461)
!461 = !DILexicalBlockFile(scope: !462, file: !1, discriminator: 1)
!462 = distinct !DILexicalBlock(scope: !463, file: !1, line: 416, column: 2)
!463 = distinct !DILexicalBlock(scope: !103, file: !1, line: 416, column: 2)
!464 = !DILocation(line: 420, column: 2, scope: !465)
!465 = !DILexicalBlockFile(scope: !466, file: !1, discriminator: 1)
!466 = distinct !DILexicalBlock(scope: !467, file: !1, line: 420, column: 2)
!467 = distinct !DILexicalBlock(scope: !103, file: !1, line: 420, column: 2)
!468 = !DILocation(line: 421, column: 2, scope: !469)
!469 = !DILexicalBlockFile(scope: !470, file: !1, discriminator: 1)
!470 = distinct !DILexicalBlock(scope: !471, file: !1, line: 421, column: 2)
!471 = distinct !DILexicalBlock(scope: !103, file: !1, line: 421, column: 2)
!472 = !DILocation(line: 422, column: 2, scope: !473)
!473 = !DILexicalBlockFile(scope: !474, file: !1, discriminator: 1)
!474 = distinct !DILexicalBlock(scope: !475, file: !1, line: 422, column: 2)
!475 = distinct !DILexicalBlock(scope: !103, file: !1, line: 422, column: 2)
!476 = !DILocation(line: 423, column: 2, scope: !477)
!477 = !DILexicalBlockFile(scope: !478, file: !1, discriminator: 1)
!478 = distinct !DILexicalBlock(scope: !479, file: !1, line: 423, column: 2)
!479 = distinct !DILexicalBlock(scope: !103, file: !1, line: 423, column: 2)
!480 = !DILocation(line: 424, column: 2, scope: !103)
