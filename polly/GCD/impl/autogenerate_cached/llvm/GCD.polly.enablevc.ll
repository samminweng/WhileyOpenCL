; ModuleID = 'GCD.c'
source_filename = "GCD.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external global %struct._IO_FILE*, align 8
@.str = private unnamed_addr constant [5 x i8] c"fail\00", align 1
@.str.1 = private unnamed_addr constant [6 x i8] c"%lld\0A\00", align 1

; Function Attrs: nounwind uwtable
define i64 @gcd(i64 %a, i64 %b) #0 !dbg !8 {
entry:
  tail call void @llvm.dbg.value(metadata i64 %a, i64 0, metadata !13, metadata !21), !dbg !22
  tail call void @llvm.dbg.value(metadata i64 %b, i64 0, metadata !14, metadata !21), !dbg !23
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !15, metadata !21), !dbg !24
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !16, metadata !21), !dbg !25
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !17, metadata !21), !dbg !26
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !18, metadata !21), !dbg !27
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !19, metadata !21), !dbg !28
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !20, metadata !21), !dbg !29
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !16, metadata !21), !dbg !25
  %cmp = icmp eq i64 %a, 0, !dbg !30
  br i1 %cmp, label %cleanup, label %while.cond.preheader, !dbg !32

while.cond.preheader:                             ; preds = %entry
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !17, metadata !21), !dbg !26
  %cmp13234 = icmp sgt i64 %a, -1, !dbg !33
  br i1 %cmp13234, label %blklab4.lr.ph.preheader, label %if.end3, !dbg !37

blklab4.lr.ph.preheader:                          ; preds = %while.cond.preheader
  %cmp447 = icmp eq i64 %b, 0, !dbg !38
  br i1 %cmp447, label %cleanup, label %blklab4.preheader.preheader, !dbg !40

blklab4.preheader.preheader:                      ; preds = %blklab4.lr.ph.preheader
  br label %blklab4.preheader, !dbg !27

blklab4.preheader:                                ; preds = %blklab4.preheader.preheader, %blklab5
  %b.addr.0.ph3549 = phi i64 [ %sub10, %blklab5 ], [ %b, %blklab4.preheader.preheader ]
  %a.addr.0.ph3648 = phi i64 [ %a.addr.033.lcssa, %blklab5 ], [ %a, %blklab4.preheader.preheader ]
  br label %blklab4, !dbg !27

if.end3.loopexit:                                 ; preds = %if.end9
  br label %if.end3, !dbg !41

if.end3:                                          ; preds = %if.end3.loopexit, %while.cond.preheader
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !dbg !41, !tbaa !42
  %1 = tail call i64 @fwrite(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str, i64 0, i64 0), i64 4, i64 1, %struct._IO_FILE* %0) #7, !dbg !46
  tail call void @exit(i32 -1) #8, !dbg !47
  unreachable, !dbg !47

blklab4:                                          ; preds = %blklab4.preheader, %if.end9
  %a.addr.033 = phi i64 [ %sub, %if.end9 ], [ %a.addr.0.ph3648, %blklab4.preheader ]
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !18, metadata !21), !dbg !27
  %cmp7 = icmp sgt i64 %a.addr.033, %b.addr.0.ph3549, !dbg !48
  br i1 %cmp7, label %if.end9, label %blklab5, !dbg !50

if.end9:                                          ; preds = %blklab4
  %sub = sub nsw i64 %a.addr.033, %b.addr.0.ph3549, !dbg !51
  tail call void @llvm.dbg.value(metadata i64 %sub, i64 0, metadata !19, metadata !21), !dbg !28
  tail call void @llvm.dbg.value(metadata i64 %sub, i64 0, metadata !13, metadata !21), !dbg !22
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !17, metadata !21), !dbg !26
  %cmp1 = icmp sgt i64 %sub, -1, !dbg !33
  br i1 %cmp1, label %blklab4, label %if.end3.loopexit, !dbg !37

blklab5:                                          ; preds = %blklab4
  %a.addr.033.lcssa = phi i64 [ %a.addr.033, %blklab4 ]
  %sub10 = sub nsw i64 %b.addr.0.ph3549, %a.addr.033.lcssa, !dbg !52
  tail call void @llvm.dbg.value(metadata i64 %sub10, i64 0, metadata !20, metadata !21), !dbg !29
  tail call void @llvm.dbg.value(metadata i64 %sub10, i64 0, metadata !14, metadata !21), !dbg !23
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !17, metadata !21), !dbg !26
  %cmp4 = icmp eq i64 %sub10, 0, !dbg !38
  br i1 %cmp4, label %cleanup.loopexit, label %blklab4.preheader, !dbg !40

cleanup.loopexit:                                 ; preds = %blklab5
  %a.addr.033.lcssa.lcssa = phi i64 [ %a.addr.033.lcssa, %blklab5 ]
  br label %cleanup, !dbg !53

cleanup:                                          ; preds = %cleanup.loopexit, %blklab4.lr.ph.preheader, %entry
  %retval.0 = phi i64 [ %b, %entry ], [ %a, %blklab4.lr.ph.preheader ], [ %a.addr.033.lcssa.lcssa, %cleanup.loopexit ]
  ret i64 %retval.0, !dbg !53
}

; Function Attrs: noreturn nounwind
declare void @exit(i32) #1

; Function Attrs: nounwind uwtable
define i64 @gcd_cached(i64 %a, i64 %b, i64 %n, i64* nocapture %gcds, i64 %gcds_size, i1 zeroext %gcds_has_ownership) #0 !dbg !54 {
entry:
  tail call void @llvm.dbg.value(metadata i64 %a, i64 0, metadata !60, metadata !21), !dbg !74
  tail call void @llvm.dbg.value(metadata i64 %b, i64 0, metadata !61, metadata !21), !dbg !75
  tail call void @llvm.dbg.value(metadata i64 %n, i64 0, metadata !62, metadata !21), !dbg !76
  tail call void @llvm.dbg.value(metadata i64* %gcds, i64 0, metadata !63, metadata !21), !dbg !77
  tail call void @llvm.dbg.value(metadata i64 %gcds_size, i64 0, metadata !64, metadata !21), !dbg !77
  tail call void @llvm.dbg.value(metadata i1 %gcds_has_ownership, i64 0, metadata !65, metadata !78), !dbg !79
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !66, metadata !21), !dbg !80
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !67, metadata !21), !dbg !81
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !68, metadata !21), !dbg !82
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !69, metadata !21), !dbg !83
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !70, metadata !21), !dbg !84
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !71, metadata !21), !dbg !85
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !72, metadata !21), !dbg !86
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !73, metadata !21), !dbg !87
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !67, metadata !21), !dbg !81
  %cmp = icmp eq i64 %a, 0, !dbg !88
  br i1 %cmp, label %if.end, label %blklab7, !dbg !90

if.end:                                           ; preds = %entry
  br i1 %gcds_has_ownership, label %if.then1, label %cleanup, !dbg !91

if.then1:                                         ; preds = %if.end
  %0 = bitcast i64* %gcds to i8*, !dbg !92
  tail call void @free(i8* %0) #6, !dbg !92
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !65, metadata !21), !dbg !79
  br label %cleanup, !dbg !92

blklab7:                                          ; preds = %entry
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !68, metadata !21), !dbg !82
  %cmp3 = icmp eq i64 %b, 0, !dbg !96
  br i1 %cmp3, label %if.end5, label %blklab9, !dbg !98

if.end5:                                          ; preds = %blklab7
  br i1 %gcds_has_ownership, label %if.then7, label %cleanup, !dbg !99

if.then7:                                         ; preds = %if.end5
  %1 = bitcast i64* %gcds to i8*, !dbg !100
  tail call void @free(i8* %1) #6, !dbg !100
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !65, metadata !21), !dbg !79
  br label %cleanup, !dbg !100

blklab9:                                          ; preds = %blklab7
  %cmp9 = icmp sgt i64 %a, %b, !dbg !104
  %a.op = sub i64 0, %a
  %sub12.neg = select i1 %cmp9, i64 0, i64 %a.op
  %b.addr.0 = add i64 %sub12.neg, %b, !dbg !106
  %sub = select i1 %cmp9, i64 %b, i64 0, !dbg !106
  %a.addr.0 = sub nsw i64 %a, %sub, !dbg !106
  %mul = mul nsw i64 %a.addr.0, %n, !dbg !107
  tail call void @llvm.dbg.value(metadata i64 %mul, i64 0, metadata !71, metadata !21), !dbg !85
  %add = add nsw i64 %b.addr.0, %mul, !dbg !108
  tail call void @llvm.dbg.value(metadata i64 %add, i64 0, metadata !72, metadata !21), !dbg !86
  %arrayidx = getelementptr inbounds i64, i64* %gcds, i64 %add, !dbg !109
  %2 = load i64, i64* %arrayidx, align 8, !dbg !109, !tbaa !110
  tail call void @llvm.dbg.value(metadata i64 %2, i64 0, metadata !73, metadata !21), !dbg !87
  br i1 %gcds_has_ownership, label %if.then14, label %cleanup, !dbg !112

if.then14:                                        ; preds = %blklab9
  %3 = bitcast i64* %gcds to i8*, !dbg !113
  tail call void @free(i8* %3) #6, !dbg !113
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !65, metadata !21), !dbg !79
  br label %cleanup, !dbg !113

cleanup:                                          ; preds = %blklab9, %if.then14, %if.end5, %if.then7, %if.end, %if.then1
  %retval.0 = phi i64 [ %b, %if.then1 ], [ %b, %if.end ], [ %a, %if.then7 ], [ %a, %if.end5 ], [ %2, %if.then14 ], [ %2, %blklab9 ]
  ret i64 %retval.0, !dbg !117
}

; Function Attrs: nounwind
declare void @free(i8* nocapture) #2

; Function Attrs: noreturn nounwind uwtable
define i32 @main(i32 %argc, i8** %args) #3 !dbg !119 {
entry:
  tail call void @llvm.dbg.value(metadata i32 %argc, i64 0, metadata !127, metadata !21), !dbg !180
  tail call void @llvm.dbg.value(metadata i8** %args, i64 0, metadata !128, metadata !21), !dbg !181
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !130, metadata !21), !dbg !182
  tail call void @llvm.dbg.value(metadata i64* null, i64 0, metadata !131, metadata !21), !dbg !183
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !132, metadata !21), !dbg !183
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !133, metadata !21), !dbg !184
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !134, metadata !21), !dbg !185
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !135, metadata !21), !dbg !186
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !136, metadata !21), !dbg !187
  tail call void @llvm.dbg.value(metadata i64** null, i64 0, metadata !138, metadata !21), !dbg !188
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !140, metadata !21), !dbg !188
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !141, metadata !21), !dbg !188
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !142, metadata !21), !dbg !189
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !143, metadata !21), !dbg !190
  tail call void @llvm.dbg.value(metadata i64* null, i64 0, metadata !144, metadata !21), !dbg !191
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !145, metadata !21), !dbg !191
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !146, metadata !21), !dbg !192
  tail call void @llvm.dbg.value(metadata i64* null, i64 0, metadata !148, metadata !21), !dbg !193
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !149, metadata !21), !dbg !193
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !150, metadata !21), !dbg !194
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !152, metadata !21), !dbg !195
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !153, metadata !21), !dbg !196
  tail call void @llvm.dbg.value(metadata i64* null, i64 0, metadata !154, metadata !21), !dbg !197
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !155, metadata !21), !dbg !197
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !156, metadata !21), !dbg !198
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !157, metadata !21), !dbg !199
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !158, metadata !21), !dbg !200
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !159, metadata !21), !dbg !201
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !160, metadata !21), !dbg !202
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !161, metadata !21), !dbg !203
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !162, metadata !21), !dbg !204
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !163, metadata !21), !dbg !205
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !164, metadata !21), !dbg !206
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !165, metadata !21), !dbg !207
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !166, metadata !21), !dbg !208
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !167, metadata !21), !dbg !209
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !168, metadata !21), !dbg !210
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !169, metadata !21), !dbg !211
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !170, metadata !21), !dbg !212
  tail call void @llvm.dbg.value(metadata i64* null, i64 0, metadata !172, metadata !21), !dbg !213
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !173, metadata !21), !dbg !213
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !174, metadata !21), !dbg !214
  tail call void @llvm.dbg.value(metadata i64* null, i64 0, metadata !177, metadata !21), !dbg !215
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !178, metadata !21), !dbg !215
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !179, metadata !21), !dbg !216
  %call = tail call i64** @convertArgsToIntArray(i32 %argc, i8** %args) #6, !dbg !217
  tail call void @llvm.dbg.value(metadata i64** %call, i64 0, metadata !138, metadata !21), !dbg !188
  %sub = add nsw i32 %argc, -1, !dbg !217
  %conv = sext i32 %sub to i64, !dbg !217
  tail call void @llvm.dbg.value(metadata i64 %conv, i64 0, metadata !140, metadata !21), !dbg !188
  tail call void @llvm.dbg.value(metadata i8 1, i64 0, metadata !142, metadata !21), !dbg !189
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !143, metadata !21), !dbg !190
  %0 = load i64*, i64** %call, align 8, !dbg !218, !tbaa !42
  tail call void @llvm.dbg.value(metadata i64* %0, i64 0, metadata !144, metadata !21), !dbg !191
  %call1 = tail call i64* @parseStringToInt(i64* %0) #6, !dbg !219
  tail call void @llvm.dbg.value(metadata i64* %call1, i64 0, metadata !137, metadata !21), !dbg !220
  tail call void @llvm.dbg.value(metadata i64* %call1, i64 0, metadata !129, metadata !21), !dbg !221
  %cmp = icmp eq i64* %call1, null, !dbg !222
  br i1 %cmp, label %if.end105.critedge, label %if.end, !dbg !224

if.end:                                           ; preds = %entry
  %1 = load i64, i64* %call1, align 8, !dbg !225, !tbaa !110
  tail call void @llvm.dbg.value(metadata i64 %1, i64 0, metadata !130, metadata !21), !dbg !182
  tail call void @llvm.dbg.value(metadata i64 4, i64 0, metadata !149, metadata !21), !dbg !193
  %call5 = tail call noalias i8* @malloc(i64 32) #6, !dbg !226
  %2 = bitcast i8* %call5 to i64*, !dbg !226
  tail call void @llvm.dbg.value(metadata i64* %2, i64 0, metadata !148, metadata !21), !dbg !193
  %3 = bitcast i8* %call5 to <2 x i64>*, !dbg !227
  store <2 x i64> <i64 78, i64 32>, <2 x i64>* %3, align 8, !dbg !227, !tbaa !110
  %arrayidx8 = getelementptr inbounds i8, i8* %call5, i64 16, !dbg !228
  %4 = bitcast i8* %arrayidx8 to <2 x i64>*, !dbg !229
  store <2 x i64> <i64 61, i64 32>, <2 x i64>* %4, align 8, !dbg !229, !tbaa !110
  tail call void @llvm.dbg.value(metadata i8 1, i64 0, metadata !150, metadata !21), !dbg !194
  tail call void @printf_s(i64* %2, i64 4) #6, !dbg !230
  %call10 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.1, i64 0, i64 0), i64 %1), !dbg !231
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !152, metadata !21), !dbg !195
  %mul = mul nsw i64 %1, %1, !dbg !232
  tail call void @llvm.dbg.value(metadata i64 %mul, i64 0, metadata !153, metadata !21), !dbg !196
  tail call void @llvm.dbg.value(metadata i64 %mul, i64 0, metadata !155, metadata !21), !dbg !197
  %conv15 = trunc i64 %mul to i32, !dbg !233
  %call16 = tail call i64* @gen1DArray(i32 0, i32 %conv15) #6, !dbg !233
  tail call void @llvm.dbg.value(metadata i64* %call16, i64 0, metadata !154, metadata !21), !dbg !197
  tail call void @llvm.dbg.value(metadata i8 1, i64 0, metadata !156, metadata !21), !dbg !198
  tail call void @llvm.dbg.value(metadata i64 %mul, i64 0, metadata !132, metadata !21), !dbg !183
  tail call void @llvm.dbg.value(metadata i64* %call16, i64 0, metadata !131, metadata !21), !dbg !183
  tail call void @llvm.dbg.value(metadata i8 1, i64 0, metadata !133, metadata !21), !dbg !184
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !156, metadata !21), !dbg !198
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !157, metadata !21), !dbg !199
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !134, metadata !21), !dbg !185
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !158, metadata !21), !dbg !200
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !135, metadata !21), !dbg !186
  %cmp20189 = icmp sgt i64 %1, 0, !dbg !234
  br i1 %cmp20189, label %while.cond24.preheader.us.preheader, label %if.then86, !dbg !237

while.cond24.preheader.us.preheader:              ; preds = %if.end
  %5 = add i64 %1, -4, !dbg !238
  %6 = lshr i64 %5, 2, !dbg !238
  %7 = add nuw nsw i64 %6, 1, !dbg !238
  %min.iters.check = icmp ult i64 %1, 4, !dbg !241
  %n.vec = and i64 %1, -4, !dbg !241
  %cmp.zero = icmp eq i64 %n.vec, 0, !dbg !241
  %xtraiter = and i64 %7, 1, !dbg !241
  %lcmp.mod = icmp eq i64 %7, %xtraiter, !dbg !241
  %unroll_iter = sub nsw i64 %7, %xtraiter, !dbg !241
  %8 = icmp eq i64 %xtraiter, 0, !dbg !242
  %cmp.n = icmp eq i64 %1, %n.vec
  br label %while.cond24.preheader.us, !dbg !238

while.cond24.preheader.us:                        ; preds = %while.cond24.preheader.us.preheader, %blklab16.loopexit.us
  %sum.0192.us = phi i64 [ %add36.lcssa.us, %blklab16.loopexit.us ], [ 0, %while.cond24.preheader.us.preheader ]
  %i.0190.us = phi i64 [ %add38.us, %blklab16.loopexit.us ], [ 0, %while.cond24.preheader.us.preheader ]
  %cmp.i.us = icmp eq i64 %i.0190.us, 0, !dbg !238
  %mul31.us = mul nsw i64 %i.0190.us, %1, !dbg !243
  %a.op.i.us = sub i64 0, %i.0190.us, !dbg !244
  br i1 %cmp.i.us, label %if.end29.us.us.preheader, label %if.end29.us196.preheader, !dbg !245

if.end29.us196.preheader:                         ; preds = %while.cond24.preheader.us
  br label %if.end29.us196, !dbg !241

if.end29.us.us.preheader:                         ; preds = %while.cond24.preheader.us
  br i1 %min.iters.check, label %if.end29.us.us.preheader230, label %min.iters.checked, !dbg !241

if.end29.us.us.preheader230:                      ; preds = %middle.block, %min.iters.checked, %if.end29.us.us.preheader
  %sum.1188.us.us.ph = phi i64 [ %sum.0192.us, %min.iters.checked ], [ %sum.0192.us, %if.end29.us.us.preheader ], [ %31, %middle.block ]
  %j.0187.us.us.ph = phi i64 [ 0, %min.iters.checked ], [ 0, %if.end29.us.us.preheader ], [ %n.vec, %middle.block ]
  br label %if.end29.us.us, !dbg !241

min.iters.checked:                                ; preds = %if.end29.us.us.preheader
  br i1 %cmp.zero, label %if.end29.us.us.preheader230, label %vector.ph, !dbg !241

vector.ph:                                        ; preds = %min.iters.checked
  %9 = insertelement <2 x i64> <i64 undef, i64 0>, i64 %sum.0192.us, i32 0, !dbg !241
  br i1 %lcmp.mod, label %middle.block.unr-lcssa, label %vector.ph.new, !dbg !241

vector.ph.new:                                    ; preds = %vector.ph
  br label %vector.body, !dbg !241

vector.body:                                      ; preds = %vector.body, %vector.ph.new
  %index = phi i64 [ 0, %vector.ph.new ], [ %index.next.1, %vector.body ], !dbg !246
  %vec.phi = phi <2 x i64> [ %9, %vector.ph.new ], [ %22, %vector.body ]
  %vec.phi223 = phi <2 x i64> [ zeroinitializer, %vector.ph.new ], [ %23, %vector.body ]
  %niter = phi i64 [ %unroll_iter, %vector.ph.new ], [ %niter.nsub.1, %vector.body ]
  %broadcast.splatinsert = insertelement <2 x i64> undef, i64 %index, i32 0
  %broadcast.splat = shufflevector <2 x i64> %broadcast.splatinsert, <2 x i64> undef, <2 x i32> zeroinitializer
  %induction = add <2 x i64> %broadcast.splat, <i64 0, i64 1>
  %induction224 = add <2 x i64> %broadcast.splat, <i64 2, i64 3>
  %10 = add nsw i64 %index, %mul31.us, !dbg !247
  %11 = getelementptr inbounds i64, i64* %call16, i64 %10, !dbg !247
  %12 = bitcast i64* %11 to <2 x i64>*, !dbg !248
  store <2 x i64> %induction, <2 x i64>* %12, align 8, !dbg !248, !tbaa !110
  %13 = getelementptr i64, i64* %11, i64 2, !dbg !248
  %14 = bitcast i64* %13 to <2 x i64>*, !dbg !248
  store <2 x i64> %induction224, <2 x i64>* %14, align 8, !dbg !248, !tbaa !110
  %15 = add nsw <2 x i64> %induction, %vec.phi, !dbg !242
  %16 = add nsw <2 x i64> %induction224, %vec.phi223, !dbg !242
  %index.next = or i64 %index, 4, !dbg !241
  %broadcast.splatinsert.1 = insertelement <2 x i64> undef, i64 %index.next, i32 0
  %broadcast.splat.1 = shufflevector <2 x i64> %broadcast.splatinsert.1, <2 x i64> undef, <2 x i32> zeroinitializer
  %induction.1 = add <2 x i64> %broadcast.splat.1, <i64 0, i64 1>
  %induction224.1 = add <2 x i64> %broadcast.splat.1, <i64 2, i64 3>
  %17 = add nsw i64 %index.next, %mul31.us, !dbg !247
  %18 = getelementptr inbounds i64, i64* %call16, i64 %17, !dbg !247
  %19 = bitcast i64* %18 to <2 x i64>*, !dbg !248
  store <2 x i64> %induction.1, <2 x i64>* %19, align 8, !dbg !248, !tbaa !110
  %20 = getelementptr i64, i64* %18, i64 2, !dbg !248
  %21 = bitcast i64* %20 to <2 x i64>*, !dbg !248
  store <2 x i64> %induction224.1, <2 x i64>* %21, align 8, !dbg !248, !tbaa !110
  %22 = add nsw <2 x i64> %induction.1, %15, !dbg !242
  %23 = add nsw <2 x i64> %induction224.1, %16, !dbg !242
  %index.next.1 = add i64 %index, 8, !dbg !241
  %niter.nsub.1 = add i64 %niter, -2, !dbg !241
  %niter.ncmp.1 = icmp eq i64 %niter.nsub.1, 0, !dbg !241
  br i1 %niter.ncmp.1, label %middle.block.unr-lcssa.loopexit, label %vector.body, !dbg !241, !llvm.loop !249

middle.block.unr-lcssa.loopexit:                  ; preds = %vector.body
  %index.next.1.lcssa = phi i64 [ %index.next.1, %vector.body ]
  %.lcssa234 = phi <2 x i64> [ %23, %vector.body ]
  %.lcssa233 = phi <2 x i64> [ %22, %vector.body ]
  br label %middle.block.unr-lcssa, !dbg !242

middle.block.unr-lcssa:                           ; preds = %vector.ph, %middle.block.unr-lcssa.loopexit
  %.lcssa232.ph = phi <2 x i64> [ undef, %vector.ph ], [ %.lcssa234, %middle.block.unr-lcssa.loopexit ]
  %.lcssa.ph = phi <2 x i64> [ undef, %vector.ph ], [ %.lcssa233, %middle.block.unr-lcssa.loopexit ]
  %index.unr = phi i64 [ 0, %vector.ph ], [ %index.next.1.lcssa, %middle.block.unr-lcssa.loopexit ]
  %vec.phi.unr = phi <2 x i64> [ %9, %vector.ph ], [ %.lcssa233, %middle.block.unr-lcssa.loopexit ]
  %vec.phi223.unr = phi <2 x i64> [ zeroinitializer, %vector.ph ], [ %.lcssa234, %middle.block.unr-lcssa.loopexit ]
  br i1 %8, label %middle.block, label %vector.body.epil.preheader, !dbg !242

vector.body.epil.preheader:                       ; preds = %middle.block.unr-lcssa
  br label %vector.body.epil, !dbg !242

vector.body.epil:                                 ; preds = %vector.body.epil.preheader
  %broadcast.splatinsert.epil = insertelement <2 x i64> undef, i64 %index.unr, i32 0
  %broadcast.splat.epil = shufflevector <2 x i64> %broadcast.splatinsert.epil, <2 x i64> undef, <2 x i32> zeroinitializer
  %induction.epil = add <2 x i64> %broadcast.splat.epil, <i64 0, i64 1>
  %induction224.epil = add <2 x i64> %broadcast.splat.epil, <i64 2, i64 3>
  %24 = add nsw i64 %index.unr, %mul31.us, !dbg !247
  %25 = getelementptr inbounds i64, i64* %call16, i64 %24, !dbg !247
  %26 = bitcast i64* %25 to <2 x i64>*, !dbg !248
  store <2 x i64> %induction.epil, <2 x i64>* %26, align 8, !dbg !248, !tbaa !110
  %27 = getelementptr i64, i64* %25, i64 2, !dbg !248
  %28 = bitcast i64* %27 to <2 x i64>*, !dbg !248
  store <2 x i64> %induction224.epil, <2 x i64>* %28, align 8, !dbg !248, !tbaa !110
  br label %middle.block.epilog-lcssa, !dbg !241

middle.block.epilog-lcssa:                        ; preds = %vector.body.epil
  %29 = add nsw <2 x i64> %induction224.epil, %vec.phi223.unr, !dbg !242
  %30 = add nsw <2 x i64> %induction.epil, %vec.phi.unr, !dbg !242
  br label %middle.block, !dbg !242

middle.block:                                     ; preds = %middle.block.unr-lcssa, %middle.block.epilog-lcssa
  %.lcssa232 = phi <2 x i64> [ %.lcssa232.ph, %middle.block.unr-lcssa ], [ %29, %middle.block.epilog-lcssa ]
  %.lcssa = phi <2 x i64> [ %.lcssa.ph, %middle.block.unr-lcssa ], [ %30, %middle.block.epilog-lcssa ]
  %bin.rdx = add <2 x i64> %.lcssa232, %.lcssa, !dbg !242
  %rdx.shuf = shufflevector <2 x i64> %bin.rdx, <2 x i64> undef, <2 x i32> <i32 1, i32 undef>, !dbg !242
  %bin.rdx229 = add <2 x i64> %bin.rdx, %rdx.shuf, !dbg !242
  %31 = extractelement <2 x i64> %bin.rdx229, i32 0, !dbg !242
  br i1 %cmp.n, label %blklab16.loopexit.us, label %if.end29.us.us.preheader230, !dbg !241

if.end29.us196:                                   ; preds = %if.end29.us196.preheader, %gcd_cached.exit.us210
  %sum.1188.us197 = phi i64 [ %add36.us214, %gcd_cached.exit.us210 ], [ %sum.0192.us, %if.end29.us196.preheader ]
  %j.0187.us198 = phi i64 [ %add37.us215, %gcd_cached.exit.us210 ], [ 0, %if.end29.us196.preheader ]
  tail call void @llvm.dbg.value(metadata i64 %i.0190.us, i64 0, metadata !60, metadata !21), !dbg !241
  tail call void @llvm.dbg.value(metadata i64 %j.0187.us198, i64 0, metadata !61, metadata !21), !dbg !252
  tail call void @llvm.dbg.value(metadata i64 %1, i64 0, metadata !62, metadata !21), !dbg !253
  tail call void @llvm.dbg.value(metadata i64* %call16, i64 0, metadata !63, metadata !21), !dbg !254
  tail call void @llvm.dbg.value(metadata i64 undef, i64 0, metadata !64, metadata !21), !dbg !254
  tail call void @llvm.dbg.value(metadata i1 false, i64 0, metadata !65, metadata !78), !dbg !255
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !66, metadata !21), !dbg !256
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !67, metadata !21), !dbg !257
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !68, metadata !21), !dbg !258
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !69, metadata !21), !dbg !259
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !70, metadata !21), !dbg !260
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !71, metadata !21), !dbg !261
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !72, metadata !21), !dbg !262
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !73, metadata !21), !dbg !263
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !67, metadata !21), !dbg !257
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !68, metadata !21), !dbg !258
  %cmp3.i.us200 = icmp eq i64 %j.0187.us198, 0, !dbg !264
  br i1 %cmp3.i.us200, label %gcd_cached.exit.us210, label %blklab9.i.us201, !dbg !265

blklab9.i.us201:                                  ; preds = %if.end29.us196
  %cmp9.i.us202 = icmp sgt i64 %i.0190.us, %j.0187.us198, !dbg !266
  %sub12.neg.i.us203 = select i1 %cmp9.i.us202, i64 0, i64 %a.op.i.us, !dbg !244
  %b.addr.0.i.us204 = add i64 %sub12.neg.i.us203, %j.0187.us198, !dbg !267
  %sub.i.us205 = select i1 %cmp9.i.us202, i64 %j.0187.us198, i64 0, !dbg !267
  %a.addr.0.i.us206 = sub nsw i64 %i.0190.us, %sub.i.us205, !dbg !267
  %mul.i.us207 = mul nsw i64 %a.addr.0.i.us206, %1, !dbg !268
  tail call void @llvm.dbg.value(metadata i64 %mul.i.us207, i64 0, metadata !71, metadata !21), !dbg !261
  %add.i.us208 = add nsw i64 %b.addr.0.i.us204, %mul.i.us207, !dbg !269
  tail call void @llvm.dbg.value(metadata i64 %add.i.us208, i64 0, metadata !72, metadata !21), !dbg !262
  %arrayidx.i.us209 = getelementptr inbounds i64, i64* %call16, i64 %add.i.us208, !dbg !270
  %32 = load i64, i64* %arrayidx.i.us209, align 8, !dbg !270, !tbaa !110
  tail call void @llvm.dbg.value(metadata i64 %32, i64 0, metadata !73, metadata !21), !dbg !263
  br label %gcd_cached.exit.us210, !dbg !244

gcd_cached.exit.us210:                            ; preds = %blklab9.i.us201, %if.end29.us196
  %retval.0.i.us211 = phi i64 [ %32, %blklab9.i.us201 ], [ %i.0190.us, %if.end29.us196 ], !dbg !244
  tail call void @llvm.dbg.value(metadata i64 %retval.0.i.us211, i64 0, metadata !160, metadata !21), !dbg !202
  tail call void @llvm.dbg.value(metadata i64 %mul31.us, i64 0, metadata !161, metadata !21), !dbg !203
  %add.us212 = add nsw i64 %j.0187.us198, %mul31.us, !dbg !271
  tail call void @llvm.dbg.value(metadata i64 %add.us212, i64 0, metadata !162, metadata !21), !dbg !204
  %arrayidx32.us213 = getelementptr inbounds i64, i64* %call16, i64 %add.us212, !dbg !247
  store i64 %retval.0.i.us211, i64* %arrayidx32.us213, align 8, !dbg !248, !tbaa !110
  tail call void @llvm.dbg.value(metadata i64 %mul31.us, i64 0, metadata !163, metadata !21), !dbg !205
  tail call void @llvm.dbg.value(metadata i64 %add.us212, i64 0, metadata !164, metadata !21), !dbg !206
  tail call void @llvm.dbg.value(metadata i64 %retval.0.i.us211, i64 0, metadata !165, metadata !21), !dbg !207
  %add36.us214 = add nsw i64 %retval.0.i.us211, %sum.1188.us197, !dbg !242
  tail call void @llvm.dbg.value(metadata i64 %add36.us214, i64 0, metadata !166, metadata !21), !dbg !208
  tail call void @llvm.dbg.value(metadata i64 %add36.us214, i64 0, metadata !134, metadata !21), !dbg !185
  tail call void @llvm.dbg.value(metadata i64 1, i64 0, metadata !167, metadata !21), !dbg !209
  %add37.us215 = add nuw nsw i64 %j.0187.us198, 1, !dbg !246
  tail call void @llvm.dbg.value(metadata i64 %add37.us215, i64 0, metadata !168, metadata !21), !dbg !210
  tail call void @llvm.dbg.value(metadata i64 %add37.us215, i64 0, metadata !136, metadata !21), !dbg !187
  %exitcond.us216 = icmp eq i64 %add37.us215, %1, !dbg !272
  br i1 %exitcond.us216, label %blklab16.loopexit.us.loopexit231, label %if.end29.us196, !dbg !272

blklab16.loopexit.us.loopexit:                    ; preds = %if.end29.us.us
  %add36.us.us.lcssa = phi i64 [ %add36.us.us, %if.end29.us.us ]
  br label %blklab16.loopexit.us, !dbg !211

blklab16.loopexit.us.loopexit231:                 ; preds = %gcd_cached.exit.us210
  %add36.us214.lcssa = phi i64 [ %add36.us214, %gcd_cached.exit.us210 ]
  br label %blklab16.loopexit.us, !dbg !211

blklab16.loopexit.us:                             ; preds = %blklab16.loopexit.us.loopexit231, %blklab16.loopexit.us.loopexit, %middle.block
  %add36.lcssa.us = phi i64 [ %31, %middle.block ], [ %add36.us.us.lcssa, %blklab16.loopexit.us.loopexit ], [ %add36.us214.lcssa, %blklab16.loopexit.us.loopexit231 ]
  tail call void @llvm.dbg.value(metadata i64 1, i64 0, metadata !169, metadata !21), !dbg !211
  %add38.us = add nuw nsw i64 %i.0190.us, 1, !dbg !273
  tail call void @llvm.dbg.value(metadata i64 %add38.us, i64 0, metadata !170, metadata !21), !dbg !212
  tail call void @llvm.dbg.value(metadata i64 %add38.us, i64 0, metadata !135, metadata !21), !dbg !186
  %exitcond194.us = icmp eq i64 %add38.us, %1, !dbg !237
  br i1 %exitcond194.us, label %if.then86.loopexit, label %while.cond24.preheader.us, !dbg !237

if.end29.us.us:                                   ; preds = %if.end29.us.us.preheader230, %if.end29.us.us
  %sum.1188.us.us = phi i64 [ %add36.us.us, %if.end29.us.us ], [ %sum.1188.us.us.ph, %if.end29.us.us.preheader230 ]
  %j.0187.us.us = phi i64 [ %add37.us.us, %if.end29.us.us ], [ %j.0187.us.us.ph, %if.end29.us.us.preheader230 ]
  tail call void @llvm.dbg.value(metadata i64 %i.0190.us, i64 0, metadata !60, metadata !21), !dbg !241
  tail call void @llvm.dbg.value(metadata i64 %j.0187.us.us, i64 0, metadata !61, metadata !21), !dbg !252
  tail call void @llvm.dbg.value(metadata i64 %1, i64 0, metadata !62, metadata !21), !dbg !253
  tail call void @llvm.dbg.value(metadata i64* %call16, i64 0, metadata !63, metadata !21), !dbg !254
  tail call void @llvm.dbg.value(metadata i64 undef, i64 0, metadata !64, metadata !21), !dbg !254
  tail call void @llvm.dbg.value(metadata i1 false, i64 0, metadata !65, metadata !78), !dbg !255
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !66, metadata !21), !dbg !256
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !67, metadata !21), !dbg !257
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !68, metadata !21), !dbg !258
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !69, metadata !21), !dbg !259
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !70, metadata !21), !dbg !260
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !71, metadata !21), !dbg !261
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !72, metadata !21), !dbg !262
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !73, metadata !21), !dbg !263
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !67, metadata !21), !dbg !257
  tail call void @llvm.dbg.value(metadata i64 %j.0187.us.us, i64 0, metadata !160, metadata !21), !dbg !202
  tail call void @llvm.dbg.value(metadata i64 %mul31.us, i64 0, metadata !161, metadata !21), !dbg !203
  %add.us.us = add nsw i64 %j.0187.us.us, %mul31.us, !dbg !271
  tail call void @llvm.dbg.value(metadata i64 %add.us.us, i64 0, metadata !162, metadata !21), !dbg !204
  %arrayidx32.us.us = getelementptr inbounds i64, i64* %call16, i64 %add.us.us, !dbg !247
  store i64 %j.0187.us.us, i64* %arrayidx32.us.us, align 8, !dbg !248, !tbaa !110
  tail call void @llvm.dbg.value(metadata i64 %mul31.us, i64 0, metadata !163, metadata !21), !dbg !205
  tail call void @llvm.dbg.value(metadata i64 %add.us.us, i64 0, metadata !164, metadata !21), !dbg !206
  tail call void @llvm.dbg.value(metadata i64 %j.0187.us.us, i64 0, metadata !165, metadata !21), !dbg !207
  %add36.us.us = add nsw i64 %j.0187.us.us, %sum.1188.us.us, !dbg !242
  tail call void @llvm.dbg.value(metadata i64 %add36.us.us, i64 0, metadata !166, metadata !21), !dbg !208
  tail call void @llvm.dbg.value(metadata i64 %add36.us.us, i64 0, metadata !134, metadata !21), !dbg !185
  tail call void @llvm.dbg.value(metadata i64 1, i64 0, metadata !167, metadata !21), !dbg !209
  %add37.us.us = add nuw nsw i64 %j.0187.us.us, 1, !dbg !246
  tail call void @llvm.dbg.value(metadata i64 %add37.us.us, i64 0, metadata !168, metadata !21), !dbg !210
  tail call void @llvm.dbg.value(metadata i64 %add37.us.us, i64 0, metadata !136, metadata !21), !dbg !187
  %exitcond.us.us = icmp eq i64 %add37.us.us, %1, !dbg !272
  br i1 %exitcond.us.us, label %blklab16.loopexit.us.loopexit, label %if.end29.us.us, !dbg !272, !llvm.loop !274

if.then86.loopexit:                               ; preds = %blklab16.loopexit.us
  %add36.lcssa.us.lcssa = phi i64 [ %add36.lcssa.us, %blklab16.loopexit.us ]
  br label %if.then86, !dbg !213

if.then86:                                        ; preds = %if.then86.loopexit, %if.end
  %sum.0.lcssa = phi i64 [ 0, %if.end ], [ %add36.lcssa.us.lcssa, %if.then86.loopexit ]
  tail call void @llvm.dbg.value(metadata i64 5, i64 0, metadata !173, metadata !21), !dbg !213
  %call42 = tail call noalias i8* @malloc(i64 40) #6, !dbg !276
  %33 = bitcast i8* %call42 to i64*, !dbg !276
  tail call void @llvm.dbg.value(metadata i64* %33, i64 0, metadata !172, metadata !21), !dbg !213
  %34 = bitcast i8* %call42 to <2 x i64>*, !dbg !277
  store <2 x i64> <i64 83, i64 117>, <2 x i64>* %34, align 8, !dbg !277, !tbaa !110
  %arrayidx45 = getelementptr inbounds i8, i8* %call42, i64 16, !dbg !278
  %35 = bitcast i8* %arrayidx45 to <2 x i64>*, !dbg !279
  store <2 x i64> <i64 109, i64 58>, <2 x i64>* %35, align 8, !dbg !279, !tbaa !110
  %arrayidx47 = getelementptr inbounds i8, i8* %call42, i64 32, !dbg !280
  %36 = bitcast i8* %arrayidx47 to i64*, !dbg !280
  store i64 32, i64* %36, align 8, !dbg !281, !tbaa !110
  tail call void @llvm.dbg.value(metadata i8 1, i64 0, metadata !174, metadata !21), !dbg !214
  tail call void @printf_s(i64* %33, i64 5) #6, !dbg !282
  %call48 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.1, i64 0, i64 0), i64 %sum.0.lcssa), !dbg !283
  tail call void @llvm.dbg.value(metadata i64 32, i64 0, metadata !178, metadata !21), !dbg !215
  %call52 = tail call noalias i8* @malloc(i64 256) #6, !dbg !284
  %37 = bitcast i8* %call52 to i64*, !dbg !284
  tail call void @llvm.dbg.value(metadata i64* %37, i64 0, metadata !177, metadata !21), !dbg !215
  %38 = bitcast i8* %call52 to <2 x i64>*, !dbg !285
  store <2 x i64> <i64 80, i64 97>, <2 x i64>* %38, align 8, !dbg !285, !tbaa !110
  %arrayidx55 = getelementptr inbounds i8, i8* %call52, i64 16, !dbg !286
  %39 = bitcast i8* %arrayidx55 to <2 x i64>*, !dbg !287
  store <2 x i64> <i64 115, i64 115>, <2 x i64>* %39, align 8, !dbg !287, !tbaa !110
  %arrayidx57 = getelementptr inbounds i8, i8* %call52, i64 32, !dbg !288
  %40 = bitcast i8* %arrayidx57 to <2 x i64>*, !dbg !289
  store <2 x i64> <i64 32, i64 99>, <2 x i64>* %40, align 8, !dbg !289, !tbaa !110
  %arrayidx59 = getelementptr inbounds i8, i8* %call52, i64 48, !dbg !290
  %41 = bitcast i8* %arrayidx59 to <2 x i64>*, !dbg !291
  store <2 x i64> <i64 97, i64 99>, <2 x i64>* %41, align 8, !dbg !291, !tbaa !110
  %arrayidx61 = getelementptr inbounds i8, i8* %call52, i64 64, !dbg !292
  %42 = bitcast i8* %arrayidx61 to <2 x i64>*, !dbg !293
  store <2 x i64> <i64 104, i64 101>, <2 x i64>* %42, align 8, !dbg !293, !tbaa !110
  %arrayidx63 = getelementptr inbounds i8, i8* %call52, i64 80, !dbg !294
  %43 = bitcast i8* %arrayidx63 to <2 x i64>*, !dbg !295
  store <2 x i64> <i64 100, i64 32>, <2 x i64>* %43, align 8, !dbg !295, !tbaa !110
  %arrayidx65 = getelementptr inbounds i8, i8* %call52, i64 96, !dbg !296
  %44 = bitcast i8* %arrayidx65 to <2 x i64>*, !dbg !297
  store <2 x i64> <i64 69, i64 117>, <2 x i64>* %44, align 8, !dbg !297, !tbaa !110
  %arrayidx67 = getelementptr inbounds i8, i8* %call52, i64 112, !dbg !298
  %45 = bitcast i8* %arrayidx67 to <2 x i64>*, !dbg !299
  store <2 x i64> <i64 99, i64 108>, <2 x i64>* %45, align 8, !dbg !299, !tbaa !110
  %arrayidx69 = getelementptr inbounds i8, i8* %call52, i64 128, !dbg !300
  %46 = bitcast i8* %arrayidx69 to <2 x i64>*, !dbg !301
  store <2 x i64> <i64 105, i64 100>, <2 x i64>* %46, align 8, !dbg !301, !tbaa !110
  %arrayidx71 = getelementptr inbounds i8, i8* %call52, i64 144, !dbg !302
  %47 = bitcast i8* %arrayidx71 to <2 x i64>*, !dbg !303
  store <2 x i64> <i64 32, i64 71>, <2 x i64>* %47, align 8, !dbg !303, !tbaa !110
  %arrayidx73 = getelementptr inbounds i8, i8* %call52, i64 160, !dbg !304
  %48 = bitcast i8* %arrayidx73 to <2 x i64>*, !dbg !305
  store <2 x i64> <i64 67, i64 68>, <2 x i64>* %48, align 8, !dbg !305, !tbaa !110
  %arrayidx75 = getelementptr inbounds i8, i8* %call52, i64 176, !dbg !306
  %49 = bitcast i8* %arrayidx75 to <2 x i64>*, !dbg !307
  store <2 x i64> <i64 32, i64 116>, <2 x i64>* %49, align 8, !dbg !307, !tbaa !110
  %arrayidx77 = getelementptr inbounds i8, i8* %call52, i64 192, !dbg !308
  %50 = bitcast i8* %arrayidx77 to <2 x i64>*, !dbg !309
  store <2 x i64> <i64 101, i64 115>, <2 x i64>* %50, align 8, !dbg !309, !tbaa !110
  %arrayidx79 = getelementptr inbounds i8, i8* %call52, i64 208, !dbg !310
  %51 = bitcast i8* %arrayidx79 to <2 x i64>*, !dbg !311
  store <2 x i64> <i64 116, i64 32>, <2 x i64>* %51, align 8, !dbg !311, !tbaa !110
  %arrayidx81 = getelementptr inbounds i8, i8* %call52, i64 224, !dbg !312
  %52 = bitcast i8* %arrayidx81 to <2 x i64>*, !dbg !313
  store <2 x i64> <i64 99, i64 97>, <2 x i64>* %52, align 8, !dbg !313, !tbaa !110
  %arrayidx83 = getelementptr inbounds i8, i8* %call52, i64 240, !dbg !314
  %53 = bitcast i8* %arrayidx83 to <2 x i64>*, !dbg !315
  store <2 x i64> <i64 115, i64 101>, <2 x i64>* %53, align 8, !dbg !315, !tbaa !110
  tail call void @llvm.dbg.value(metadata i8 1, i64 0, metadata !179, metadata !21), !dbg !216
  tail call void @println_s(i64* %37, i64 32) #6, !dbg !316
  %phitmp = bitcast i64* %call16 to i8*, !dbg !316
  tail call void @free(i8* %phitmp) #6, !dbg !317
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !133, metadata !21), !dbg !184
  tail call void @free2DArray(i64** %call, i64 %conv) #6, !dbg !321
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !142, metadata !21), !dbg !189
  tail call void @free(i8* %call5) #6, !dbg !325
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !150, metadata !21), !dbg !194
  tail call void @free(i8* %call42) #6, !dbg !329
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !174, metadata !21), !dbg !214
  tail call void @free(i8* %call52) #6, !dbg !333
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !179, metadata !21), !dbg !216
  br label %if.end105, !dbg !333

if.end105.critedge:                               ; preds = %entry
  tail call void @free2DArray(i64** %call, i64 %conv) #6, !dbg !321
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !142, metadata !21), !dbg !189
  br label %if.end105

if.end105:                                        ; preds = %if.end105.critedge, %if.then86
  tail call void @exit(i32 0) #8, !dbg !337
  unreachable, !dbg !337
}

declare i64** @convertArgsToIntArray(i32, i8**) #4

declare i64* @parseStringToInt(i64*) #4

; Function Attrs: nounwind
declare noalias i8* @malloc(i64) #2

declare void @printf_s(i64*, i64) #4

; Function Attrs: nounwind
declare i32 @printf(i8* nocapture readonly, ...) #2

declare i64* @gen1DArray(i32, i32) #4

declare void @println_s(i64*, i64) #4

declare void @free2DArray(i64**, i64) #4

; Function Attrs: nounwind readnone
declare void @llvm.dbg.value(metadata, i64, metadata, metadata) #5

; Function Attrs: nounwind
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) #6

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { noreturn nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { noreturn nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { nounwind readnone }
attributes #6 = { nounwind }
attributes #7 = { cold }
attributes #8 = { noreturn nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!5, !6}
!llvm.ident = !{!7}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 3.9.0 (http://llvm.org/git/clang.git 2af14cc4a90f43170f8ea9c1dfa0f71f46a0621c) (http://llvm.org/git/llvm.git 1e7e2b2b556977af8ccc12b7afba61302f3a2da9)", isOptimized: true, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3)
!1 = !DIFile(filename: "GCD.c", directory: "/home/mw169/workspace/WhileyOpenCL/polly/GCD/impl/autogenerate_cached_copyfree")
!2 = !{}
!3 = !{!4}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64, align: 64)
!5 = !{i32 2, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{!"clang version 3.9.0 (http://llvm.org/git/clang.git 2af14cc4a90f43170f8ea9c1dfa0f71f46a0621c) (http://llvm.org/git/llvm.git 1e7e2b2b556977af8ccc12b7afba61302f3a2da9)"}
!8 = distinct !DISubprogram(name: "gcd", scope: !1, file: !1, line: 2, type: !9, isLocal: false, isDefinition: true, scopeLine: 2, flags: DIFlagPrototyped, isOptimized: true, unit: !0, variables: !12)
!9 = !DISubroutineType(types: !10)
!10 = !{!11, !11, !11}
!11 = !DIBasicType(name: "long long int", size: 64, align: 64, encoding: DW_ATE_signed)
!12 = !{!13, !14, !15, !16, !17, !18, !19, !20}
!13 = !DILocalVariable(name: "a", arg: 1, scope: !8, file: !1, line: 2, type: !11)
!14 = !DILocalVariable(name: "b", arg: 2, scope: !8, file: !1, line: 2, type: !11)
!15 = !DILocalVariable(name: "_2", scope: !8, file: !1, line: 3, type: !11)
!16 = !DILocalVariable(name: "_3", scope: !8, file: !1, line: 4, type: !11)
!17 = !DILocalVariable(name: "_4", scope: !8, file: !1, line: 5, type: !11)
!18 = !DILocalVariable(name: "_5", scope: !8, file: !1, line: 6, type: !11)
!19 = !DILocalVariable(name: "_6", scope: !8, file: !1, line: 7, type: !11)
!20 = !DILocalVariable(name: "_7", scope: !8, file: !1, line: 8, type: !11)
!21 = !DIExpression()
!22 = !DILocation(line: 2, column: 25, scope: !8)
!23 = !DILocation(line: 2, column: 38, scope: !8)
!24 = !DILocation(line: 3, column: 12, scope: !8)
!25 = !DILocation(line: 4, column: 12, scope: !8)
!26 = !DILocation(line: 5, column: 12, scope: !8)
!27 = !DILocation(line: 6, column: 12, scope: !8)
!28 = !DILocation(line: 7, column: 12, scope: !8)
!29 = !DILocation(line: 8, column: 12, scope: !8)
!30 = !DILocation(line: 12, column: 6, scope: !31)
!31 = distinct !DILexicalBlock(scope: !8, file: !1, line: 12, column: 5)
!32 = !DILocation(line: 12, column: 5, scope: !8)
!33 = !DILocation(line: 24, column: 8, scope: !34)
!34 = distinct !DILexicalBlock(scope: !35, file: !1, line: 24, column: 7)
!35 = distinct !DILexicalBlock(scope: !36, file: !1, line: 20, column: 3)
!36 = distinct !DILexicalBlock(scope: !8, file: !1, line: 18, column: 13)
!37 = !DILocation(line: 24, column: 7, scope: !35)
!38 = !DILocation(line: 35, column: 7, scope: !39)
!39 = distinct !DILexicalBlock(scope: !36, file: !1, line: 35, column: 6)
!40 = !DILocation(line: 35, column: 6, scope: !36)
!41 = !DILocation(line: 26, column: 12, scope: !35)
!42 = !{!43, !43, i64 0}
!43 = !{!"any pointer", !44, i64 0}
!44 = !{!"omnipotent char", !45, i64 0}
!45 = !{!"Simple C/C++ TBAA"}
!46 = !DILocation(line: 26, column: 4, scope: !35)
!47 = !DILocation(line: 27, column: 4, scope: !35)
!48 = !DILocation(line: 37, column: 7, scope: !49)
!49 = distinct !DILexicalBlock(scope: !36, file: !1, line: 37, column: 6)
!50 = !DILocation(line: 37, column: 6, scope: !36)
!51 = !DILocation(line: 39, column: 7, scope: !36)
!52 = !DILocation(line: 47, column: 7, scope: !36)
!53 = !DILocation(line: 60, column: 1, scope: !8)
!54 = distinct !DISubprogram(name: "gcd_cached", scope: !1, file: !1, line: 62, type: !55, isLocal: false, isDefinition: true, scopeLine: 62, flags: DIFlagPrototyped, isOptimized: true, unit: !0, variables: !59)
!55 = !DISubroutineType(types: !56)
!56 = !{!11, !11, !11, !11, !57, !11, !58}
!57 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !11, size: 64, align: 64)
!58 = !DIBasicType(name: "_Bool", size: 8, align: 8, encoding: DW_ATE_boolean)
!59 = !{!60, !61, !62, !63, !64, !65, !66, !67, !68, !69, !70, !71, !72, !73}
!60 = !DILocalVariable(name: "a", arg: 1, scope: !54, file: !1, line: 62, type: !11)
!61 = !DILocalVariable(name: "b", arg: 2, scope: !54, file: !1, line: 62, type: !11)
!62 = !DILocalVariable(name: "n", arg: 3, scope: !54, file: !1, line: 62, type: !11)
!63 = !DILocalVariable(name: "gcds", arg: 4, scope: !54, file: !1, line: 62, type: !57)
!64 = !DILocalVariable(name: "gcds_size", arg: 5, scope: !54, file: !1, line: 62, type: !11)
!65 = !DILocalVariable(name: "gcds_has_ownership", arg: 6, scope: !54, file: !1, line: 62, type: !58)
!66 = !DILocalVariable(name: "_4", scope: !54, file: !1, line: 63, type: !11)
!67 = !DILocalVariable(name: "_5", scope: !54, file: !1, line: 64, type: !11)
!68 = !DILocalVariable(name: "_6", scope: !54, file: !1, line: 65, type: !11)
!69 = !DILocalVariable(name: "_7", scope: !54, file: !1, line: 66, type: !11)
!70 = !DILocalVariable(name: "_8", scope: !54, file: !1, line: 67, type: !11)
!71 = !DILocalVariable(name: "_9", scope: !54, file: !1, line: 68, type: !11)
!72 = !DILocalVariable(name: "_10", scope: !54, file: !1, line: 69, type: !11)
!73 = !DILocalVariable(name: "_11", scope: !54, file: !1, line: 70, type: !11)
!74 = !DILocation(line: 62, column: 32, scope: !54)
!75 = !DILocation(line: 62, column: 45, scope: !54)
!76 = !DILocation(line: 62, column: 58, scope: !54)
!77 = !DILocation(line: 62, column: 61, scope: !54)
!78 = !DIExpression(DW_OP_bit_piece, 0, 1)
!79 = !DILocation(line: 62, column: 88, scope: !54)
!80 = !DILocation(line: 63, column: 12, scope: !54)
!81 = !DILocation(line: 64, column: 12, scope: !54)
!82 = !DILocation(line: 65, column: 12, scope: !54)
!83 = !DILocation(line: 66, column: 12, scope: !54)
!84 = !DILocation(line: 67, column: 12, scope: !54)
!85 = !DILocation(line: 68, column: 12, scope: !54)
!86 = !DILocation(line: 69, column: 12, scope: !54)
!87 = !DILocation(line: 70, column: 12, scope: !54)
!88 = !DILocation(line: 74, column: 6, scope: !89)
!89 = distinct !DILexicalBlock(scope: !54, file: !1, line: 74, column: 5)
!90 = !DILocation(line: 74, column: 5, scope: !54)
!91 = !DILocation(line: 76, column: 2, scope: !54)
!92 = !DILocation(line: 76, column: 2, scope: !93)
!93 = !DILexicalBlockFile(scope: !94, file: !1, discriminator: 1)
!94 = distinct !DILexicalBlock(scope: !95, file: !1, line: 76, column: 2)
!95 = distinct !DILexicalBlock(scope: !54, file: !1, line: 76, column: 2)
!96 = !DILocation(line: 85, column: 6, scope: !97)
!97 = distinct !DILexicalBlock(scope: !54, file: !1, line: 85, column: 5)
!98 = !DILocation(line: 85, column: 5, scope: !54)
!99 = !DILocation(line: 87, column: 2, scope: !54)
!100 = !DILocation(line: 87, column: 2, scope: !101)
!101 = !DILexicalBlockFile(scope: !102, file: !1, discriminator: 1)
!102 = distinct !DILexicalBlock(scope: !103, file: !1, line: 87, column: 2)
!103 = distinct !DILexicalBlock(scope: !54, file: !1, line: 87, column: 2)
!104 = !DILocation(line: 94, column: 6, scope: !105)
!105 = distinct !DILexicalBlock(scope: !54, file: !1, line: 94, column: 5)
!106 = !DILocation(line: 94, column: 5, scope: !54)
!107 = !DILocation(line: 110, column: 6, scope: !54)
!108 = !DILocation(line: 112, column: 8, scope: !54)
!109 = !DILocation(line: 114, column: 6, scope: !54)
!110 = !{!111, !111, i64 0}
!111 = !{!"long long", !44, i64 0}
!112 = !DILocation(line: 116, column: 2, scope: !54)
!113 = !DILocation(line: 116, column: 2, scope: !114)
!114 = !DILexicalBlockFile(scope: !115, file: !1, discriminator: 1)
!115 = distinct !DILexicalBlock(scope: !116, file: !1, line: 116, column: 2)
!116 = distinct !DILexicalBlock(scope: !54, file: !1, line: 116, column: 2)
!117 = !DILocation(line: 123, column: 1, scope: !118)
!118 = !DILexicalBlockFile(scope: !54, file: !1, discriminator: 2)
!119 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 125, type: !120, isLocal: false, isDefinition: true, scopeLine: 125, flags: DIFlagPrototyped, isOptimized: true, unit: !0, variables: !126)
!120 = !DISubroutineType(types: !121)
!121 = !{!122, !122, !123}
!122 = !DIBasicType(name: "int", size: 32, align: 32, encoding: DW_ATE_signed)
!123 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !124, size: 64, align: 64)
!124 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !125, size: 64, align: 64)
!125 = !DIBasicType(name: "char", size: 8, align: 8, encoding: DW_ATE_signed_char)
!126 = !{!127, !128, !129, !130, !131, !132, !133, !134, !135, !136, !137, !138, !140, !141, !142, !143, !144, !145, !146, !147, !148, !149, !150, !151, !152, !153, !154, !155, !156, !157, !158, !159, !160, !161, !162, !163, !164, !165, !166, !167, !168, !169, !170, !171, !172, !173, !174, !175, !176, !177, !178, !179}
!127 = !DILocalVariable(name: "argc", arg: 1, scope: !119, file: !1, line: 125, type: !122)
!128 = !DILocalVariable(name: "args", arg: 2, scope: !119, file: !1, line: 125, type: !123)
!129 = !DILocalVariable(name: "max", scope: !119, file: !1, line: 126, type: !57)
!130 = !DILocalVariable(name: "n", scope: !119, file: !1, line: 127, type: !11)
!131 = !DILocalVariable(name: "gcds", scope: !119, file: !1, line: 128, type: !57)
!132 = !DILocalVariable(name: "gcds_size", scope: !119, file: !1, line: 128, type: !11)
!133 = !DILocalVariable(name: "gcds_has_ownership", scope: !119, file: !1, line: 129, type: !58)
!134 = !DILocalVariable(name: "sum", scope: !119, file: !1, line: 130, type: !11)
!135 = !DILocalVariable(name: "i", scope: !119, file: !1, line: 131, type: !11)
!136 = !DILocalVariable(name: "j", scope: !119, file: !1, line: 132, type: !11)
!137 = !DILocalVariable(name: "_7", scope: !119, file: !1, line: 133, type: !57)
!138 = !DILocalVariable(name: "_8", scope: !119, file: !1, line: 134, type: !139)
!139 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !57, size: 64, align: 64)
!140 = !DILocalVariable(name: "_8_size", scope: !119, file: !1, line: 134, type: !11)
!141 = !DILocalVariable(name: "_8_size_size", scope: !119, file: !1, line: 134, type: !11)
!142 = !DILocalVariable(name: "_8_has_ownership", scope: !119, file: !1, line: 135, type: !58)
!143 = !DILocalVariable(name: "_9", scope: !119, file: !1, line: 136, type: !11)
!144 = !DILocalVariable(name: "_10", scope: !119, file: !1, line: 137, type: !57)
!145 = !DILocalVariable(name: "_10_size", scope: !119, file: !1, line: 137, type: !11)
!146 = !DILocalVariable(name: "_10_has_ownership", scope: !119, file: !1, line: 138, type: !58)
!147 = !DILocalVariable(name: "_11", scope: !119, file: !1, line: 139, type: !4)
!148 = !DILocalVariable(name: "_13", scope: !119, file: !1, line: 140, type: !57)
!149 = !DILocalVariable(name: "_13_size", scope: !119, file: !1, line: 140, type: !11)
!150 = !DILocalVariable(name: "_13_has_ownership", scope: !119, file: !1, line: 141, type: !58)
!151 = !DILocalVariable(name: "_14", scope: !119, file: !1, line: 142, type: !4)
!152 = !DILocalVariable(name: "_16", scope: !119, file: !1, line: 143, type: !11)
!153 = !DILocalVariable(name: "_17", scope: !119, file: !1, line: 144, type: !11)
!154 = !DILocalVariable(name: "_18", scope: !119, file: !1, line: 145, type: !57)
!155 = !DILocalVariable(name: "_18_size", scope: !119, file: !1, line: 145, type: !11)
!156 = !DILocalVariable(name: "_18_has_ownership", scope: !119, file: !1, line: 146, type: !58)
!157 = !DILocalVariable(name: "_19", scope: !119, file: !1, line: 147, type: !11)
!158 = !DILocalVariable(name: "_20", scope: !119, file: !1, line: 148, type: !11)
!159 = !DILocalVariable(name: "_21", scope: !119, file: !1, line: 149, type: !11)
!160 = !DILocalVariable(name: "_22", scope: !119, file: !1, line: 150, type: !11)
!161 = !DILocalVariable(name: "_23", scope: !119, file: !1, line: 151, type: !11)
!162 = !DILocalVariable(name: "_24", scope: !119, file: !1, line: 152, type: !11)
!163 = !DILocalVariable(name: "_25", scope: !119, file: !1, line: 153, type: !11)
!164 = !DILocalVariable(name: "_26", scope: !119, file: !1, line: 154, type: !11)
!165 = !DILocalVariable(name: "_27", scope: !119, file: !1, line: 155, type: !11)
!166 = !DILocalVariable(name: "_28", scope: !119, file: !1, line: 156, type: !11)
!167 = !DILocalVariable(name: "_29", scope: !119, file: !1, line: 157, type: !11)
!168 = !DILocalVariable(name: "_30", scope: !119, file: !1, line: 158, type: !11)
!169 = !DILocalVariable(name: "_31", scope: !119, file: !1, line: 159, type: !11)
!170 = !DILocalVariable(name: "_32", scope: !119, file: !1, line: 160, type: !11)
!171 = !DILocalVariable(name: "_33", scope: !119, file: !1, line: 161, type: !4)
!172 = !DILocalVariable(name: "_35", scope: !119, file: !1, line: 162, type: !57)
!173 = !DILocalVariable(name: "_35_size", scope: !119, file: !1, line: 162, type: !11)
!174 = !DILocalVariable(name: "_35_has_ownership", scope: !119, file: !1, line: 163, type: !58)
!175 = !DILocalVariable(name: "_36", scope: !119, file: !1, line: 164, type: !4)
!176 = !DILocalVariable(name: "_38", scope: !119, file: !1, line: 165, type: !4)
!177 = !DILocalVariable(name: "_40", scope: !119, file: !1, line: 166, type: !57)
!178 = !DILocalVariable(name: "_40_size", scope: !119, file: !1, line: 166, type: !11)
!179 = !DILocalVariable(name: "_40_has_ownership", scope: !119, file: !1, line: 167, type: !58)
!180 = !DILocation(line: 125, column: 14, scope: !119)
!181 = !DILocation(line: 125, column: 27, scope: !119)
!182 = !DILocation(line: 127, column: 12, scope: !119)
!183 = !DILocation(line: 128, column: 2, scope: !119)
!184 = !DILocation(line: 129, column: 2, scope: !119)
!185 = !DILocation(line: 130, column: 12, scope: !119)
!186 = !DILocation(line: 131, column: 12, scope: !119)
!187 = !DILocation(line: 132, column: 12, scope: !119)
!188 = !DILocation(line: 134, column: 2, scope: !119)
!189 = !DILocation(line: 135, column: 2, scope: !119)
!190 = !DILocation(line: 136, column: 12, scope: !119)
!191 = !DILocation(line: 137, column: 2, scope: !119)
!192 = !DILocation(line: 138, column: 2, scope: !119)
!193 = !DILocation(line: 140, column: 2, scope: !119)
!194 = !DILocation(line: 141, column: 2, scope: !119)
!195 = !DILocation(line: 143, column: 12, scope: !119)
!196 = !DILocation(line: 144, column: 12, scope: !119)
!197 = !DILocation(line: 145, column: 2, scope: !119)
!198 = !DILocation(line: 146, column: 2, scope: !119)
!199 = !DILocation(line: 147, column: 12, scope: !119)
!200 = !DILocation(line: 148, column: 12, scope: !119)
!201 = !DILocation(line: 149, column: 12, scope: !119)
!202 = !DILocation(line: 150, column: 12, scope: !119)
!203 = !DILocation(line: 151, column: 12, scope: !119)
!204 = !DILocation(line: 152, column: 12, scope: !119)
!205 = !DILocation(line: 153, column: 12, scope: !119)
!206 = !DILocation(line: 154, column: 12, scope: !119)
!207 = !DILocation(line: 155, column: 12, scope: !119)
!208 = !DILocation(line: 156, column: 12, scope: !119)
!209 = !DILocation(line: 157, column: 12, scope: !119)
!210 = !DILocation(line: 158, column: 12, scope: !119)
!211 = !DILocation(line: 159, column: 12, scope: !119)
!212 = !DILocation(line: 160, column: 12, scope: !119)
!213 = !DILocation(line: 162, column: 2, scope: !119)
!214 = !DILocation(line: 163, column: 2, scope: !119)
!215 = !DILocation(line: 166, column: 2, scope: !119)
!216 = !DILocation(line: 167, column: 2, scope: !119)
!217 = !DILocation(line: 169, column: 2, scope: !119)
!218 = !DILocation(line: 174, column: 6, scope: !119)
!219 = !DILocation(line: 176, column: 2, scope: !119)
!220 = !DILocation(line: 133, column: 13, scope: !119)
!221 = !DILocation(line: 126, column: 13, scope: !119)
!222 = !DILocation(line: 180, column: 9, scope: !223)
!223 = distinct !DILexicalBlock(scope: !119, file: !1, line: 180, column: 5)
!224 = !DILocation(line: 180, column: 5, scope: !119)
!225 = !DILocation(line: 182, column: 6, scope: !119)
!226 = !DILocation(line: 187, column: 2, scope: !119)
!227 = !DILocation(line: 188, column: 9, scope: !119)
!228 = !DILocation(line: 188, column: 28, scope: !119)
!229 = !DILocation(line: 188, column: 35, scope: !119)
!230 = !DILocation(line: 191, column: 2, scope: !119)
!231 = !DILocation(line: 195, column: 2, scope: !119)
!232 = !DILocation(line: 199, column: 7, scope: !119)
!233 = !DILocation(line: 202, column: 2, scope: !119)
!234 = !DILocation(line: 220, column: 7, scope: !235)
!235 = distinct !DILexicalBlock(scope: !236, file: !1, line: 220, column: 6)
!236 = distinct !DILexicalBlock(scope: !119, file: !1, line: 218, column: 13)
!237 = !DILocation(line: 220, column: 6, scope: !236)
!238 = !DILocation(line: 74, column: 6, scope: !89, inlinedAt: !239)
!239 = distinct !DILocation(line: 230, column: 10, scope: !240)
!240 = distinct !DILexicalBlock(scope: !236, file: !1, line: 226, column: 14)
!241 = !DILocation(line: 62, column: 32, scope: !54, inlinedAt: !239)
!242 = !DILocation(line: 244, column: 11, scope: !240)
!243 = !DILocation(line: 232, column: 9, scope: !240)
!244 = !DILocation(line: 230, column: 10, scope: !240)
!245 = !DILocation(line: 74, column: 5, scope: !54, inlinedAt: !239)
!246 = !DILocation(line: 250, column: 9, scope: !240)
!247 = !DILocation(line: 236, column: 4, scope: !240)
!248 = !DILocation(line: 236, column: 14, scope: !240)
!249 = distinct !{!249, !250, !251}
!250 = !{!"llvm.loop.vectorize.width", i32 1}
!251 = !{!"llvm.loop.interleave.count", i32 1}
!252 = !DILocation(line: 62, column: 45, scope: !54, inlinedAt: !239)
!253 = !DILocation(line: 62, column: 58, scope: !54, inlinedAt: !239)
!254 = !DILocation(line: 62, column: 61, scope: !54, inlinedAt: !239)
!255 = !DILocation(line: 62, column: 88, scope: !54, inlinedAt: !239)
!256 = !DILocation(line: 63, column: 12, scope: !54, inlinedAt: !239)
!257 = !DILocation(line: 64, column: 12, scope: !54, inlinedAt: !239)
!258 = !DILocation(line: 65, column: 12, scope: !54, inlinedAt: !239)
!259 = !DILocation(line: 66, column: 12, scope: !54, inlinedAt: !239)
!260 = !DILocation(line: 67, column: 12, scope: !54, inlinedAt: !239)
!261 = !DILocation(line: 68, column: 12, scope: !54, inlinedAt: !239)
!262 = !DILocation(line: 69, column: 12, scope: !54, inlinedAt: !239)
!263 = !DILocation(line: 70, column: 12, scope: !54, inlinedAt: !239)
!264 = !DILocation(line: 85, column: 6, scope: !97, inlinedAt: !239)
!265 = !DILocation(line: 85, column: 5, scope: !54, inlinedAt: !239)
!266 = !DILocation(line: 94, column: 6, scope: !105, inlinedAt: !239)
!267 = !DILocation(line: 94, column: 5, scope: !54, inlinedAt: !239)
!268 = !DILocation(line: 110, column: 6, scope: !54, inlinedAt: !239)
!269 = !DILocation(line: 112, column: 8, scope: !54, inlinedAt: !239)
!270 = !DILocation(line: 114, column: 6, scope: !54, inlinedAt: !239)
!271 = !DILocation(line: 234, column: 11, scope: !240)
!272 = !DILocation(line: 228, column: 7, scope: !240)
!273 = !DILocation(line: 261, column: 8, scope: !236)
!274 = distinct !{!274, !275, !250, !251}
!275 = !{!"llvm.loop.unroll.runtime.disable"}
!276 = !DILocation(line: 273, column: 2, scope: !119)
!277 = !DILocation(line: 274, column: 9, scope: !119)
!278 = !DILocation(line: 274, column: 29, scope: !119)
!279 = !DILocation(line: 274, column: 36, scope: !119)
!280 = !DILocation(line: 274, column: 56, scope: !119)
!281 = !DILocation(line: 274, column: 63, scope: !119)
!282 = !DILocation(line: 277, column: 2, scope: !119)
!283 = !DILocation(line: 281, column: 2, scope: !119)
!284 = !DILocation(line: 286, column: 2, scope: !119)
!285 = !DILocation(line: 287, column: 9, scope: !119)
!286 = !DILocation(line: 287, column: 28, scope: !119)
!287 = !DILocation(line: 287, column: 35, scope: !119)
!288 = !DILocation(line: 287, column: 56, scope: !119)
!289 = !DILocation(line: 287, column: 63, scope: !119)
!290 = !DILocation(line: 287, column: 82, scope: !119)
!291 = !DILocation(line: 287, column: 89, scope: !119)
!292 = !DILocation(line: 287, column: 108, scope: !119)
!293 = !DILocation(line: 287, column: 115, scope: !119)
!294 = !DILocation(line: 287, column: 136, scope: !119)
!295 = !DILocation(line: 287, column: 144, scope: !119)
!296 = !DILocation(line: 287, column: 165, scope: !119)
!297 = !DILocation(line: 287, column: 173, scope: !119)
!298 = !DILocation(line: 287, column: 194, scope: !119)
!299 = !DILocation(line: 287, column: 202, scope: !119)
!300 = !DILocation(line: 287, column: 223, scope: !119)
!301 = !DILocation(line: 287, column: 231, scope: !119)
!302 = !DILocation(line: 287, column: 253, scope: !119)
!303 = !DILocation(line: 287, column: 261, scope: !119)
!304 = !DILocation(line: 287, column: 281, scope: !119)
!305 = !DILocation(line: 287, column: 289, scope: !119)
!306 = !DILocation(line: 287, column: 309, scope: !119)
!307 = !DILocation(line: 287, column: 317, scope: !119)
!308 = !DILocation(line: 287, column: 338, scope: !119)
!309 = !DILocation(line: 287, column: 346, scope: !119)
!310 = !DILocation(line: 287, column: 368, scope: !119)
!311 = !DILocation(line: 287, column: 376, scope: !119)
!312 = !DILocation(line: 287, column: 397, scope: !119)
!313 = !DILocation(line: 287, column: 405, scope: !119)
!314 = !DILocation(line: 287, column: 425, scope: !119)
!315 = !DILocation(line: 287, column: 433, scope: !119)
!316 = !DILocation(line: 290, column: 2, scope: !119)
!317 = !DILocation(line: 294, column: 2, scope: !318)
!318 = !DILexicalBlockFile(scope: !319, file: !1, discriminator: 1)
!319 = distinct !DILexicalBlock(scope: !320, file: !1, line: 294, column: 2)
!320 = distinct !DILexicalBlock(scope: !119, file: !1, line: 294, column: 2)
!321 = !DILocation(line: 295, column: 2, scope: !322)
!322 = !DILexicalBlockFile(scope: !323, file: !1, discriminator: 1)
!323 = distinct !DILexicalBlock(scope: !324, file: !1, line: 295, column: 2)
!324 = distinct !DILexicalBlock(scope: !119, file: !1, line: 295, column: 2)
!325 = !DILocation(line: 297, column: 2, scope: !326)
!326 = !DILexicalBlockFile(scope: !327, file: !1, discriminator: 1)
!327 = distinct !DILexicalBlock(scope: !328, file: !1, line: 297, column: 2)
!328 = distinct !DILexicalBlock(scope: !119, file: !1, line: 297, column: 2)
!329 = !DILocation(line: 299, column: 2, scope: !330)
!330 = !DILexicalBlockFile(scope: !331, file: !1, discriminator: 1)
!331 = distinct !DILexicalBlock(scope: !332, file: !1, line: 299, column: 2)
!332 = distinct !DILexicalBlock(scope: !119, file: !1, line: 299, column: 2)
!333 = !DILocation(line: 300, column: 2, scope: !334)
!334 = !DILexicalBlockFile(scope: !335, file: !1, discriminator: 1)
!335 = distinct !DILexicalBlock(scope: !336, file: !1, line: 300, column: 2)
!336 = distinct !DILexicalBlock(scope: !119, file: !1, line: 300, column: 2)
!337 = !DILocation(line: 301, column: 2, scope: !119)
