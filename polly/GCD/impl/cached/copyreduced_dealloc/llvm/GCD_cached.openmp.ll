; ModuleID = 'GCD_cached.c'
source_filename = "GCD_cached.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external local_unnamed_addr global %struct._IO_FILE*, align 8
@.str = private unnamed_addr constant [5 x i8] c"fail\00", align 1
@.str.1 = private unnamed_addr constant [6 x i8] c"%lld\0A\00", align 1

; Function Attrs: nounwind uwtable
define i64 @gcd(i64 %a, i64 %b) local_unnamed_addr #0 !dbg !8 {
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
  %a.addr.0.ph3648 = phi i64 [ %a.addr.033, %blklab5 ], [ %a, %blklab4.preheader.preheader ]
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
  %sub10 = sub nsw i64 %b.addr.0.ph3549, %a.addr.033, !dbg !52
  tail call void @llvm.dbg.value(metadata i64 %sub10, i64 0, metadata !20, metadata !21), !dbg !29
  tail call void @llvm.dbg.value(metadata i64 %sub10, i64 0, metadata !14, metadata !21), !dbg !23
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !17, metadata !21), !dbg !26
  %cmp4 = icmp eq i64 %sub10, 0, !dbg !38
  br i1 %cmp4, label %cleanup.loopexit, label %blklab4.preheader, !dbg !40

cleanup.loopexit:                                 ; preds = %blklab5
  br label %cleanup, !dbg !53

cleanup:                                          ; preds = %cleanup.loopexit, %blklab4.lr.ph.preheader, %entry
  %retval.0 = phi i64 [ %b, %entry ], [ %a, %blklab4.lr.ph.preheader ], [ %a.addr.033, %cleanup.loopexit ]
  ret i64 %retval.0, !dbg !53
}

; Function Attrs: noreturn nounwind
declare void @exit(i32) local_unnamed_addr #1

; Function Attrs: nounwind uwtable
define i64 @gcd_cached(i64 %a, i64 %b, i64 %n, i64* nocapture %gcds, i64 %gcds_size, i1 zeroext %gcds_dealloc) local_unnamed_addr #0 !dbg !54 {
entry:
  tail call void @llvm.dbg.value(metadata i64 %a, i64 0, metadata !60, metadata !21), !dbg !74
  tail call void @llvm.dbg.value(metadata i64 %b, i64 0, metadata !61, metadata !21), !dbg !75
  tail call void @llvm.dbg.value(metadata i64 %n, i64 0, metadata !62, metadata !21), !dbg !76
  tail call void @llvm.dbg.value(metadata i64* %gcds, i64 0, metadata !63, metadata !21), !dbg !77
  tail call void @llvm.dbg.value(metadata i64 %gcds_size, i64 0, metadata !64, metadata !21), !dbg !77
  tail call void @llvm.dbg.value(metadata i1 %gcds_dealloc, i64 0, metadata !65, metadata !78), !dbg !79
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
  br i1 %gcds_dealloc, label %if.then1, label %cleanup, !dbg !91

if.then1:                                         ; preds = %if.end
  %0 = bitcast i64* %gcds to i8*, !dbg !93
  tail call void @free(i8* %0) #6, !dbg !93
  tail call void @llvm.dbg.value(metadata i64* null, i64 0, metadata !63, metadata !21), !dbg !77
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !65, metadata !21), !dbg !79
  br label %cleanup, !dbg !93

blklab7:                                          ; preds = %entry
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !68, metadata !21), !dbg !82
  %cmp3 = icmp eq i64 %b, 0, !dbg !97
  br i1 %cmp3, label %if.end5, label %blklab9, !dbg !99

if.end5:                                          ; preds = %blklab7
  br i1 %gcds_dealloc, label %if.then7, label %cleanup, !dbg !100

if.then7:                                         ; preds = %if.end5
  %1 = bitcast i64* %gcds to i8*, !dbg !102
  tail call void @free(i8* %1) #6, !dbg !102
  tail call void @llvm.dbg.value(metadata i64* null, i64 0, metadata !63, metadata !21), !dbg !77
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !65, metadata !21), !dbg !79
  br label %cleanup, !dbg !102

blklab9:                                          ; preds = %blklab7
  %cmp9 = icmp sgt i64 %a, %b, !dbg !106
  %a.op = sub i64 0, %a
  %sub12.neg = select i1 %cmp9, i64 0, i64 %a.op
  %b.addr.0 = add i64 %sub12.neg, %b, !dbg !108
  %sub = select i1 %cmp9, i64 %b, i64 0, !dbg !108
  %a.addr.0 = sub nsw i64 %a, %sub, !dbg !108
  %mul = mul nsw i64 %a.addr.0, %n, !dbg !109
  tail call void @llvm.dbg.value(metadata i64 %mul, i64 0, metadata !71, metadata !21), !dbg !85
  %add = add nsw i64 %b.addr.0, %mul, !dbg !110
  tail call void @llvm.dbg.value(metadata i64 %add, i64 0, metadata !72, metadata !21), !dbg !86
  %arrayidx = getelementptr inbounds i64, i64* %gcds, i64 %add, !dbg !111
  %2 = load i64, i64* %arrayidx, align 8, !dbg !111, !tbaa !112
  tail call void @llvm.dbg.value(metadata i64 %2, i64 0, metadata !73, metadata !21), !dbg !87
  br i1 %gcds_dealloc, label %if.then14, label %cleanup, !dbg !114

if.then14:                                        ; preds = %blklab9
  %3 = bitcast i64* %gcds to i8*, !dbg !116
  tail call void @free(i8* %3) #6, !dbg !116
  tail call void @llvm.dbg.value(metadata i64* null, i64 0, metadata !63, metadata !21), !dbg !77
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !65, metadata !21), !dbg !79
  br label %cleanup, !dbg !116

cleanup:                                          ; preds = %blklab9, %if.then14, %if.end5, %if.then7, %if.end, %if.then1
  %retval.0 = phi i64 [ %b, %if.then1 ], [ %b, %if.end ], [ %a, %if.then7 ], [ %a, %if.end5 ], [ %2, %if.then14 ], [ %2, %blklab9 ]
  ret i64 %retval.0, !dbg !120
}

; Function Attrs: nounwind
declare void @free(i8* nocapture) local_unnamed_addr #2

; Function Attrs: noreturn nounwind uwtable
define i32 @main(i32 %argc, i8** %args) local_unnamed_addr #3 !dbg !122 {
entry:
  tail call void @llvm.dbg.value(metadata i32 %argc, i64 0, metadata !130, metadata !21), !dbg !185
  tail call void @llvm.dbg.value(metadata i8** %args, i64 0, metadata !131, metadata !21), !dbg !186
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !133, metadata !21), !dbg !187
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !134, metadata !21), !dbg !188
  tail call void @llvm.dbg.value(metadata i64* null, i64 0, metadata !135, metadata !21), !dbg !189
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !136, metadata !21), !dbg !189
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !137, metadata !21), !dbg !190
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !138, metadata !21), !dbg !191
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !139, metadata !21), !dbg !192
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !140, metadata !21), !dbg !193
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !142, metadata !21), !dbg !194
  tail call void @llvm.dbg.value(metadata i64** null, i64 0, metadata !143, metadata !21), !dbg !195
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !145, metadata !21), !dbg !195
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !146, metadata !21), !dbg !195
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !147, metadata !21), !dbg !196
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !148, metadata !21), !dbg !197
  tail call void @llvm.dbg.value(metadata i64* null, i64 0, metadata !149, metadata !21), !dbg !198
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !150, metadata !21), !dbg !198
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !151, metadata !21), !dbg !199
  tail call void @llvm.dbg.value(metadata i64* null, i64 0, metadata !153, metadata !21), !dbg !200
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !154, metadata !21), !dbg !200
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !155, metadata !21), !dbg !201
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !157, metadata !21), !dbg !202
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !158, metadata !21), !dbg !203
  tail call void @llvm.dbg.value(metadata i64* null, i64 0, metadata !159, metadata !21), !dbg !204
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !160, metadata !21), !dbg !204
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !161, metadata !21), !dbg !205
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !162, metadata !21), !dbg !206
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !163, metadata !21), !dbg !207
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !164, metadata !21), !dbg !208
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !165, metadata !21), !dbg !209
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !166, metadata !21), !dbg !210
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !167, metadata !21), !dbg !211
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !168, metadata !21), !dbg !212
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !169, metadata !21), !dbg !213
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !170, metadata !21), !dbg !214
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !171, metadata !21), !dbg !215
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !172, metadata !21), !dbg !216
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !173, metadata !21), !dbg !217
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !174, metadata !21), !dbg !218
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !175, metadata !21), !dbg !219
  tail call void @llvm.dbg.value(metadata i64* null, i64 0, metadata !177, metadata !21), !dbg !220
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !178, metadata !21), !dbg !220
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !179, metadata !21), !dbg !221
  tail call void @llvm.dbg.value(metadata i64* null, i64 0, metadata !182, metadata !21), !dbg !222
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !183, metadata !21), !dbg !222
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !184, metadata !21), !dbg !223
  %call = tail call i64** @convertArgsToIntArray(i32 %argc, i8** %args) #6, !dbg !224
  tail call void @llvm.dbg.value(metadata i64** %call, i64 0, metadata !143, metadata !21), !dbg !195
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !148, metadata !21), !dbg !197
  %0 = load i64*, i64** %call, align 8, !dbg !225, !tbaa !42
  tail call void @llvm.dbg.value(metadata i64* %0, i64 0, metadata !149, metadata !21), !dbg !198
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !151, metadata !21), !dbg !199
  %call1 = tail call i64* @parseStringToInt(i64* %0) #6, !dbg !226
  tail call void @llvm.dbg.value(metadata i64* %call1, i64 0, metadata !141, metadata !21), !dbg !227
  tail call void @llvm.dbg.value(metadata i8 1, i64 0, metadata !142, metadata !21), !dbg !194
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !151, metadata !21), !dbg !199
  tail call void @llvm.dbg.value(metadata i64* %call1, i64 0, metadata !132, metadata !21), !dbg !228
  tail call void @llvm.dbg.value(metadata i8 1, i64 0, metadata !133, metadata !21), !dbg !187
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !142, metadata !21), !dbg !194
  %cmp = icmp eq i64* %call1, null, !dbg !229
  br i1 %cmp, label %if.end120, label %if.end5, !dbg !231

if.end5:                                          ; preds = %entry
  %1 = load i64, i64* %call1, align 8, !dbg !232, !tbaa !112
  tail call void @llvm.dbg.value(metadata i64 %1, i64 0, metadata !134, metadata !21), !dbg !188
  tail call void @llvm.dbg.value(metadata i64 4, i64 0, metadata !154, metadata !21), !dbg !200
  %call10 = tail call i64* @create1DArray(i32 0, i32 4) #6, !dbg !233
  tail call void @llvm.dbg.value(metadata i64* %call10, i64 0, metadata !153, metadata !21), !dbg !200
  %2 = bitcast i64* %call10 to <2 x i64>*, !dbg !234
  store <2 x i64> <i64 78, i64 32>, <2 x i64>* %2, align 8, !dbg !234, !tbaa !112
  %arrayidx13 = getelementptr inbounds i64, i64* %call10, i64 2, !dbg !235
  %3 = bitcast i64* %arrayidx13 to <2 x i64>*, !dbg !236
  store <2 x i64> <i64 61, i64 32>, <2 x i64>* %3, align 8, !dbg !236, !tbaa !112
  tail call void @llvm.dbg.value(metadata i8 1, i64 0, metadata !155, metadata !21), !dbg !201
  tail call void @printf_s(i64* %call10, i64 4) #6, !dbg !237
  %call15 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.1, i64 0, i64 0), i64 %1), !dbg !238
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !157, metadata !21), !dbg !202
  %mul = mul nsw i64 %1, %1, !dbg !239
  tail call void @llvm.dbg.value(metadata i64 %mul, i64 0, metadata !158, metadata !21), !dbg !203
  tail call void @llvm.dbg.value(metadata i64 %mul, i64 0, metadata !160, metadata !21), !dbg !204
  %conv20 = trunc i64 %mul to i32, !dbg !240
  %call21 = tail call i64* @create1DArray(i32 0, i32 %conv20) #6, !dbg !240
  tail call void @llvm.dbg.value(metadata i64* %call21, i64 0, metadata !159, metadata !21), !dbg !204
  tail call void @llvm.dbg.value(metadata i8 1, i64 0, metadata !161, metadata !21), !dbg !205
  tail call void @llvm.dbg.value(metadata i64 %mul, i64 0, metadata !136, metadata !21), !dbg !189
  tail call void @llvm.dbg.value(metadata i64* %call21, i64 0, metadata !135, metadata !21), !dbg !189
  tail call void @llvm.dbg.value(metadata i8 1, i64 0, metadata !137, metadata !21), !dbg !190
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !161, metadata !21), !dbg !205
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !162, metadata !21), !dbg !206
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !138, metadata !21), !dbg !191
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !163, metadata !21), !dbg !207
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !139, metadata !21), !dbg !192
  %cmp27218 = icmp sgt i64 %1, 0, !dbg !241
  br i1 %cmp27218, label %while.cond31.preheader.us.preheader, label %if.then98, !dbg !244

while.cond31.preheader.us.preheader:              ; preds = %if.end5
  %4 = add i64 %1, -4, !dbg !245
  %5 = lshr i64 %4, 2, !dbg !245
  %6 = add nuw nsw i64 %5, 1, !dbg !245
  %min.iters.check = icmp ult i64 %1, 4, !dbg !248
  %n.vec = and i64 %1, -4, !dbg !248
  %cmp.zero = icmp eq i64 %n.vec, 0, !dbg !248
  %xtraiter = and i64 %6, 1, !dbg !248
  %7 = icmp eq i64 %5, 0, !dbg !248
  %lcmp.mod = icmp eq i64 %xtraiter, 0, !dbg !249
  %cmp.n = icmp eq i64 %1, %n.vec
  %unroll_iter = sub nsw i64 %6, %xtraiter, !dbg !248
  br label %while.cond31.preheader.us, !dbg !245

while.cond31.preheader.us:                        ; preds = %while.cond31.preheader.us.preheader, %blklab16.loopexit.us
  %sum.0221.us = phi i64 [ %add43.lcssa.us, %blklab16.loopexit.us ], [ 0, %while.cond31.preheader.us.preheader ]
  %i.0219.us = phi i64 [ %add45.us, %blklab16.loopexit.us ], [ 0, %while.cond31.preheader.us.preheader ]
  %cmp.i.us = icmp eq i64 %i.0219.us, 0, !dbg !245
  %mul38.us = mul nsw i64 %i.0219.us, %1, !dbg !250
  %a.op.i.us = sub i64 0, %i.0219.us, !dbg !251
  br i1 %cmp.i.us, label %if.end36.us.us.preheader, label %if.end36.us228.preheader, !dbg !252

if.end36.us228.preheader:                         ; preds = %while.cond31.preheader.us
  br label %if.end36.us228, !dbg !248

if.end36.us.us.preheader:                         ; preds = %while.cond31.preheader.us
  br i1 %min.iters.check, label %if.end36.us.us.preheader260, label %min.iters.checked, !dbg !248

if.end36.us.us.preheader260:                      ; preds = %middle.block, %min.iters.checked, %if.end36.us.us.preheader
  %sum.1217.us.us.ph = phi i64 [ %sum.0221.us, %min.iters.checked ], [ %sum.0221.us, %if.end36.us.us.preheader ], [ %30, %middle.block ]
  %j.0216.us.us.ph = phi i64 [ 0, %min.iters.checked ], [ 0, %if.end36.us.us.preheader ], [ %n.vec, %middle.block ]
  br label %if.end36.us.us, !dbg !248

min.iters.checked:                                ; preds = %if.end36.us.us.preheader
  br i1 %cmp.zero, label %if.end36.us.us.preheader260, label %vector.ph, !dbg !248

vector.ph:                                        ; preds = %min.iters.checked
  %8 = insertelement <2 x i64> <i64 undef, i64 0>, i64 %sum.0221.us, i32 0, !dbg !248
  br i1 %7, label %middle.block.unr-lcssa, label %vector.ph.new, !dbg !248

vector.ph.new:                                    ; preds = %vector.ph
  br label %vector.body, !dbg !248

vector.body:                                      ; preds = %vector.body, %vector.ph.new
  %vec.phi = phi <2 x i64> [ %8, %vector.ph.new ], [ %21, %vector.body ]
  %vec.phi255 = phi <2 x i64> [ zeroinitializer, %vector.ph.new ], [ %22, %vector.body ]
  %vec.ind = phi <2 x i64> [ <i64 0, i64 1>, %vector.ph.new ], [ %step.add256.1, %vector.body ]
  %niter = phi i64 [ %unroll_iter, %vector.ph.new ], [ %niter.nsub.1, %vector.body ]
  %step.add = add <2 x i64> %vec.ind, <i64 2, i64 2>, !dbg !248
  %step.add256 = add <2 x i64> %vec.ind, <i64 4, i64 4>, !dbg !248
  %.lhs = extractelement <2 x i64> %vec.ind, i32 0, !dbg !253
  %9 = add nsw i64 %.lhs, %mul38.us, !dbg !253
  %10 = getelementptr inbounds i64, i64* %call21, i64 %9, !dbg !253
  %11 = bitcast i64* %10 to <2 x i64>*, !dbg !254
  store <2 x i64> %vec.ind, <2 x i64>* %11, align 8, !dbg !254, !tbaa !112
  %12 = getelementptr i64, i64* %10, i64 2, !dbg !254
  %13 = bitcast i64* %12 to <2 x i64>*, !dbg !254
  store <2 x i64> %step.add, <2 x i64>* %13, align 8, !dbg !254, !tbaa !112
  %14 = add nsw <2 x i64> %vec.ind, %vec.phi, !dbg !249
  %15 = add nsw <2 x i64> %step.add, %vec.phi255, !dbg !249
  %step.add.1 = add <2 x i64> %vec.ind, <i64 6, i64 6>, !dbg !248
  %step.add256.1 = add <2 x i64> %vec.ind, <i64 8, i64 8>, !dbg !248
  %.lhs.1 = extractelement <2 x i64> %step.add256, i32 0, !dbg !253
  %16 = add nsw i64 %.lhs.1, %mul38.us, !dbg !253
  %17 = getelementptr inbounds i64, i64* %call21, i64 %16, !dbg !253
  %18 = bitcast i64* %17 to <2 x i64>*, !dbg !254
  store <2 x i64> %step.add256, <2 x i64>* %18, align 8, !dbg !254, !tbaa !112
  %19 = getelementptr i64, i64* %17, i64 2, !dbg !254
  %20 = bitcast i64* %19 to <2 x i64>*, !dbg !254
  store <2 x i64> %step.add.1, <2 x i64>* %20, align 8, !dbg !254, !tbaa !112
  %21 = add nsw <2 x i64> %step.add256, %14, !dbg !249
  %22 = add nsw <2 x i64> %step.add.1, %15, !dbg !249
  %niter.nsub.1 = add i64 %niter, -2, !dbg !248
  %niter.ncmp.1 = icmp eq i64 %niter.nsub.1, 0, !dbg !248
  br i1 %niter.ncmp.1, label %middle.block.unr-lcssa.loopexit, label %vector.body, !dbg !248, !llvm.loop !255

middle.block.unr-lcssa.loopexit:                  ; preds = %vector.body
  br label %middle.block.unr-lcssa, !dbg !249

middle.block.unr-lcssa:                           ; preds = %middle.block.unr-lcssa.loopexit, %vector.ph
  %.lcssa262.ph = phi <2 x i64> [ undef, %vector.ph ], [ %22, %middle.block.unr-lcssa.loopexit ]
  %.lcssa.ph = phi <2 x i64> [ undef, %vector.ph ], [ %21, %middle.block.unr-lcssa.loopexit ]
  %vec.phi.unr = phi <2 x i64> [ %8, %vector.ph ], [ %21, %middle.block.unr-lcssa.loopexit ]
  %vec.phi255.unr = phi <2 x i64> [ zeroinitializer, %vector.ph ], [ %22, %middle.block.unr-lcssa.loopexit ]
  %vec.ind.unr = phi <2 x i64> [ <i64 0, i64 1>, %vector.ph ], [ %step.add256.1, %middle.block.unr-lcssa.loopexit ]
  br i1 %lcmp.mod, label %middle.block, label %vector.body.epil.preheader, !dbg !249

vector.body.epil.preheader:                       ; preds = %middle.block.unr-lcssa
  br label %vector.body.epil, !dbg !249

vector.body.epil:                                 ; preds = %vector.body.epil.preheader
  %step.add.epil = add <2 x i64> %vec.ind.unr, <i64 2, i64 2>, !dbg !248
  %.lhs.epil = extractelement <2 x i64> %vec.ind.unr, i32 0, !dbg !253
  %23 = add nsw i64 %.lhs.epil, %mul38.us, !dbg !253
  %24 = getelementptr inbounds i64, i64* %call21, i64 %23, !dbg !253
  %25 = bitcast i64* %24 to <2 x i64>*, !dbg !254
  store <2 x i64> %vec.ind.unr, <2 x i64>* %25, align 8, !dbg !254, !tbaa !112
  %26 = getelementptr i64, i64* %24, i64 2, !dbg !254
  %27 = bitcast i64* %26 to <2 x i64>*, !dbg !254
  store <2 x i64> %step.add.epil, <2 x i64>* %27, align 8, !dbg !254, !tbaa !112
  br label %middle.block.epilog-lcssa, !dbg !248

middle.block.epilog-lcssa:                        ; preds = %vector.body.epil
  %28 = add nsw <2 x i64> %step.add.epil, %vec.phi255.unr, !dbg !249
  %29 = add nsw <2 x i64> %vec.ind.unr, %vec.phi.unr, !dbg !249
  br label %middle.block, !dbg !249

middle.block:                                     ; preds = %middle.block.unr-lcssa, %middle.block.epilog-lcssa
  %.lcssa262 = phi <2 x i64> [ %.lcssa262.ph, %middle.block.unr-lcssa ], [ %28, %middle.block.epilog-lcssa ]
  %.lcssa = phi <2 x i64> [ %.lcssa.ph, %middle.block.unr-lcssa ], [ %29, %middle.block.epilog-lcssa ]
  %bin.rdx = add <2 x i64> %.lcssa262, %.lcssa, !dbg !249
  %rdx.shuf = shufflevector <2 x i64> %bin.rdx, <2 x i64> undef, <2 x i32> <i32 1, i32 undef>, !dbg !249
  %bin.rdx259 = add <2 x i64> %bin.rdx, %rdx.shuf, !dbg !249
  %30 = extractelement <2 x i64> %bin.rdx259, i32 0, !dbg !249
  br i1 %cmp.n, label %blklab16.loopexit.us, label %if.end36.us.us.preheader260, !dbg !248

if.end36.us228:                                   ; preds = %if.end36.us228.preheader, %gcd_cached.exit.us242
  %sum.1217.us229 = phi i64 [ %add43.us246, %gcd_cached.exit.us242 ], [ %sum.0221.us, %if.end36.us228.preheader ]
  %j.0216.us230 = phi i64 [ %add44.us247, %gcd_cached.exit.us242 ], [ 0, %if.end36.us228.preheader ]
  tail call void @llvm.dbg.value(metadata i64 %i.0219.us, i64 0, metadata !60, metadata !21), !dbg !248
  tail call void @llvm.dbg.value(metadata i64 %j.0216.us230, i64 0, metadata !61, metadata !21), !dbg !259
  tail call void @llvm.dbg.value(metadata i64 %1, i64 0, metadata !62, metadata !21), !dbg !260
  tail call void @llvm.dbg.value(metadata i64* %call21, i64 0, metadata !63, metadata !21), !dbg !261
  tail call void @llvm.dbg.value(metadata i64 undef, i64 0, metadata !64, metadata !21), !dbg !261
  tail call void @llvm.dbg.value(metadata i1 false, i64 0, metadata !65, metadata !78), !dbg !262
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !66, metadata !21), !dbg !263
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !67, metadata !21), !dbg !264
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !68, metadata !21), !dbg !265
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !69, metadata !21), !dbg !266
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !70, metadata !21), !dbg !267
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !71, metadata !21), !dbg !268
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !72, metadata !21), !dbg !269
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !73, metadata !21), !dbg !270
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !67, metadata !21), !dbg !264
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !68, metadata !21), !dbg !265
  %cmp3.i.us232 = icmp eq i64 %j.0216.us230, 0, !dbg !271
  br i1 %cmp3.i.us232, label %gcd_cached.exit.us242, label %blklab9.i.us233, !dbg !272

blklab9.i.us233:                                  ; preds = %if.end36.us228
  %cmp9.i.us234 = icmp sgt i64 %i.0219.us, %j.0216.us230, !dbg !273
  %sub12.neg.i.us235 = select i1 %cmp9.i.us234, i64 0, i64 %a.op.i.us, !dbg !251
  %b.addr.0.i.us236 = add i64 %sub12.neg.i.us235, %j.0216.us230, !dbg !274
  %sub.i.us237 = select i1 %cmp9.i.us234, i64 %j.0216.us230, i64 0, !dbg !274
  %a.addr.0.i.us238 = sub nsw i64 %i.0219.us, %sub.i.us237, !dbg !274
  %mul.i.us239 = mul nsw i64 %a.addr.0.i.us238, %1, !dbg !275
  tail call void @llvm.dbg.value(metadata i64 %mul.i.us239, i64 0, metadata !71, metadata !21), !dbg !268
  %add.i.us240 = add nsw i64 %b.addr.0.i.us236, %mul.i.us239, !dbg !276
  tail call void @llvm.dbg.value(metadata i64 %add.i.us240, i64 0, metadata !72, metadata !21), !dbg !269
  %arrayidx.i.us241 = getelementptr inbounds i64, i64* %call21, i64 %add.i.us240, !dbg !277
  %31 = load i64, i64* %arrayidx.i.us241, align 8, !dbg !277, !tbaa !112
  tail call void @llvm.dbg.value(metadata i64 %31, i64 0, metadata !73, metadata !21), !dbg !270
  br label %gcd_cached.exit.us242, !dbg !251

gcd_cached.exit.us242:                            ; preds = %blklab9.i.us233, %if.end36.us228
  %retval.0.i.us243 = phi i64 [ %31, %blklab9.i.us233 ], [ %i.0219.us, %if.end36.us228 ], !dbg !251
  tail call void @llvm.dbg.value(metadata i64 %retval.0.i.us243, i64 0, metadata !165, metadata !21), !dbg !209
  tail call void @llvm.dbg.value(metadata i64 %mul38.us, i64 0, metadata !166, metadata !21), !dbg !210
  %add.us244 = add nsw i64 %j.0216.us230, %mul38.us, !dbg !278
  tail call void @llvm.dbg.value(metadata i64 %add.us244, i64 0, metadata !167, metadata !21), !dbg !211
  %arrayidx39.us245 = getelementptr inbounds i64, i64* %call21, i64 %add.us244, !dbg !253
  store i64 %retval.0.i.us243, i64* %arrayidx39.us245, align 8, !dbg !254, !tbaa !112
  tail call void @llvm.dbg.value(metadata i64 %mul38.us, i64 0, metadata !168, metadata !21), !dbg !212
  tail call void @llvm.dbg.value(metadata i64 %add.us244, i64 0, metadata !169, metadata !21), !dbg !213
  tail call void @llvm.dbg.value(metadata i64 %retval.0.i.us243, i64 0, metadata !170, metadata !21), !dbg !214
  %add43.us246 = add nsw i64 %retval.0.i.us243, %sum.1217.us229, !dbg !249
  tail call void @llvm.dbg.value(metadata i64 %add43.us246, i64 0, metadata !171, metadata !21), !dbg !215
  tail call void @llvm.dbg.value(metadata i64 %add43.us246, i64 0, metadata !138, metadata !21), !dbg !191
  tail call void @llvm.dbg.value(metadata i64 1, i64 0, metadata !172, metadata !21), !dbg !216
  %add44.us247 = add nuw nsw i64 %j.0216.us230, 1, !dbg !279
  tail call void @llvm.dbg.value(metadata i64 %add44.us247, i64 0, metadata !173, metadata !21), !dbg !217
  tail call void @llvm.dbg.value(metadata i64 %add44.us247, i64 0, metadata !140, metadata !21), !dbg !193
  %exitcond.us248 = icmp eq i64 %add44.us247, %1, !dbg !280
  br i1 %exitcond.us248, label %blklab16.loopexit.us.loopexit261, label %if.end36.us228, !dbg !280, !llvm.loop !281

blklab16.loopexit.us.loopexit:                    ; preds = %if.end36.us.us
  br label %blklab16.loopexit.us, !dbg !218

blklab16.loopexit.us.loopexit261:                 ; preds = %gcd_cached.exit.us242
  br label %blklab16.loopexit.us, !dbg !218

blklab16.loopexit.us:                             ; preds = %blklab16.loopexit.us.loopexit261, %blklab16.loopexit.us.loopexit, %middle.block
  %add43.lcssa.us = phi i64 [ %30, %middle.block ], [ %add43.us.us, %blklab16.loopexit.us.loopexit ], [ %add43.us246, %blklab16.loopexit.us.loopexit261 ]
  tail call void @llvm.dbg.value(metadata i64 1, i64 0, metadata !174, metadata !21), !dbg !218
  %add45.us = add nuw nsw i64 %i.0219.us, 1, !dbg !282
  tail call void @llvm.dbg.value(metadata i64 %add45.us, i64 0, metadata !175, metadata !21), !dbg !219
  tail call void @llvm.dbg.value(metadata i64 %add45.us, i64 0, metadata !139, metadata !21), !dbg !192
  %exitcond223.us = icmp eq i64 %add45.us, %1, !dbg !244
  br i1 %exitcond223.us, label %if.then98.loopexit, label %while.cond31.preheader.us, !dbg !244, !llvm.loop !283

if.end36.us.us:                                   ; preds = %if.end36.us.us.preheader260, %if.end36.us.us
  %sum.1217.us.us = phi i64 [ %add43.us.us, %if.end36.us.us ], [ %sum.1217.us.us.ph, %if.end36.us.us.preheader260 ]
  %j.0216.us.us = phi i64 [ %add44.us.us, %if.end36.us.us ], [ %j.0216.us.us.ph, %if.end36.us.us.preheader260 ]
  tail call void @llvm.dbg.value(metadata i64 %i.0219.us, i64 0, metadata !60, metadata !21), !dbg !248
  tail call void @llvm.dbg.value(metadata i64 %j.0216.us.us, i64 0, metadata !61, metadata !21), !dbg !259
  tail call void @llvm.dbg.value(metadata i64 %1, i64 0, metadata !62, metadata !21), !dbg !260
  tail call void @llvm.dbg.value(metadata i64* %call21, i64 0, metadata !63, metadata !21), !dbg !261
  tail call void @llvm.dbg.value(metadata i64 undef, i64 0, metadata !64, metadata !21), !dbg !261
  tail call void @llvm.dbg.value(metadata i1 false, i64 0, metadata !65, metadata !78), !dbg !262
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !66, metadata !21), !dbg !263
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !67, metadata !21), !dbg !264
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !68, metadata !21), !dbg !265
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !69, metadata !21), !dbg !266
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !70, metadata !21), !dbg !267
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !71, metadata !21), !dbg !268
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !72, metadata !21), !dbg !269
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !73, metadata !21), !dbg !270
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !67, metadata !21), !dbg !264
  tail call void @llvm.dbg.value(metadata i64 %j.0216.us.us, i64 0, metadata !165, metadata !21), !dbg !209
  tail call void @llvm.dbg.value(metadata i64 %mul38.us, i64 0, metadata !166, metadata !21), !dbg !210
  %add.us.us = add nsw i64 %j.0216.us.us, %mul38.us, !dbg !278
  tail call void @llvm.dbg.value(metadata i64 %add.us.us, i64 0, metadata !167, metadata !21), !dbg !211
  %arrayidx39.us.us = getelementptr inbounds i64, i64* %call21, i64 %add.us.us, !dbg !253
  store i64 %j.0216.us.us, i64* %arrayidx39.us.us, align 8, !dbg !254, !tbaa !112
  tail call void @llvm.dbg.value(metadata i64 %mul38.us, i64 0, metadata !168, metadata !21), !dbg !212
  tail call void @llvm.dbg.value(metadata i64 %add.us.us, i64 0, metadata !169, metadata !21), !dbg !213
  tail call void @llvm.dbg.value(metadata i64 %j.0216.us.us, i64 0, metadata !170, metadata !21), !dbg !214
  %add43.us.us = add nsw i64 %j.0216.us.us, %sum.1217.us.us, !dbg !249
  tail call void @llvm.dbg.value(metadata i64 %add43.us.us, i64 0, metadata !171, metadata !21), !dbg !215
  tail call void @llvm.dbg.value(metadata i64 %add43.us.us, i64 0, metadata !138, metadata !21), !dbg !191
  tail call void @llvm.dbg.value(metadata i64 1, i64 0, metadata !172, metadata !21), !dbg !216
  %add44.us.us = add nuw nsw i64 %j.0216.us.us, 1, !dbg !279
  tail call void @llvm.dbg.value(metadata i64 %add44.us.us, i64 0, metadata !173, metadata !21), !dbg !217
  tail call void @llvm.dbg.value(metadata i64 %add44.us.us, i64 0, metadata !140, metadata !21), !dbg !193
  %exitcond.us.us = icmp eq i64 %add44.us.us, %1, !dbg !280
  br i1 %exitcond.us.us, label %blklab16.loopexit.us.loopexit, label %if.end36.us.us, !dbg !280, !llvm.loop !285

if.then98.loopexit:                               ; preds = %blklab16.loopexit.us
  br label %if.then98, !dbg !220

if.then98:                                        ; preds = %if.then98.loopexit, %if.end5
  %sum.0.lcssa = phi i64 [ 0, %if.end5 ], [ %add43.lcssa.us, %if.then98.loopexit ]
  tail call void @llvm.dbg.value(metadata i64 5, i64 0, metadata !178, metadata !21), !dbg !220
  %call50 = tail call i64* @create1DArray(i32 0, i32 5) #6, !dbg !287
  tail call void @llvm.dbg.value(metadata i64* %call50, i64 0, metadata !177, metadata !21), !dbg !220
  %32 = bitcast i64* %call50 to <2 x i64>*, !dbg !288
  store <2 x i64> <i64 83, i64 117>, <2 x i64>* %32, align 8, !dbg !288, !tbaa !112
  %arrayidx53 = getelementptr inbounds i64, i64* %call50, i64 2, !dbg !289
  %33 = bitcast i64* %arrayidx53 to <2 x i64>*, !dbg !290
  store <2 x i64> <i64 109, i64 58>, <2 x i64>* %33, align 8, !dbg !290, !tbaa !112
  %arrayidx55 = getelementptr inbounds i64, i64* %call50, i64 4, !dbg !291
  store i64 32, i64* %arrayidx55, align 8, !dbg !292, !tbaa !112
  tail call void @llvm.dbg.value(metadata i8 1, i64 0, metadata !179, metadata !21), !dbg !221
  tail call void @printf_s(i64* %call50, i64 5) #6, !dbg !293
  %call56 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.1, i64 0, i64 0), i64 %sum.0.lcssa), !dbg !294
  tail call void @llvm.dbg.value(metadata i64 32, i64 0, metadata !183, metadata !21), !dbg !222
  %call61 = tail call i64* @create1DArray(i32 0, i32 32) #6, !dbg !295
  tail call void @llvm.dbg.value(metadata i64* %call61, i64 0, metadata !182, metadata !21), !dbg !222
  %34 = bitcast i64* %call61 to <2 x i64>*, !dbg !296
  store <2 x i64> <i64 80, i64 97>, <2 x i64>* %34, align 8, !dbg !296, !tbaa !112
  %arrayidx64 = getelementptr inbounds i64, i64* %call61, i64 2, !dbg !297
  %35 = bitcast i64* %arrayidx64 to <2 x i64>*, !dbg !298
  store <2 x i64> <i64 115, i64 115>, <2 x i64>* %35, align 8, !dbg !298, !tbaa !112
  %arrayidx66 = getelementptr inbounds i64, i64* %call61, i64 4, !dbg !299
  %36 = bitcast i64* %arrayidx66 to <2 x i64>*, !dbg !300
  store <2 x i64> <i64 32, i64 99>, <2 x i64>* %36, align 8, !dbg !300, !tbaa !112
  %arrayidx68 = getelementptr inbounds i64, i64* %call61, i64 6, !dbg !301
  %37 = bitcast i64* %arrayidx68 to <2 x i64>*, !dbg !302
  store <2 x i64> <i64 97, i64 99>, <2 x i64>* %37, align 8, !dbg !302, !tbaa !112
  %arrayidx70 = getelementptr inbounds i64, i64* %call61, i64 8, !dbg !303
  %38 = bitcast i64* %arrayidx70 to <2 x i64>*, !dbg !304
  store <2 x i64> <i64 104, i64 101>, <2 x i64>* %38, align 8, !dbg !304, !tbaa !112
  %arrayidx72 = getelementptr inbounds i64, i64* %call61, i64 10, !dbg !305
  %39 = bitcast i64* %arrayidx72 to <2 x i64>*, !dbg !306
  store <2 x i64> <i64 100, i64 32>, <2 x i64>* %39, align 8, !dbg !306, !tbaa !112
  %arrayidx74 = getelementptr inbounds i64, i64* %call61, i64 12, !dbg !307
  %40 = bitcast i64* %arrayidx74 to <2 x i64>*, !dbg !308
  store <2 x i64> <i64 69, i64 117>, <2 x i64>* %40, align 8, !dbg !308, !tbaa !112
  %arrayidx76 = getelementptr inbounds i64, i64* %call61, i64 14, !dbg !309
  %41 = bitcast i64* %arrayidx76 to <2 x i64>*, !dbg !310
  store <2 x i64> <i64 99, i64 108>, <2 x i64>* %41, align 8, !dbg !310, !tbaa !112
  %arrayidx78 = getelementptr inbounds i64, i64* %call61, i64 16, !dbg !311
  %42 = bitcast i64* %arrayidx78 to <2 x i64>*, !dbg !312
  store <2 x i64> <i64 105, i64 100>, <2 x i64>* %42, align 8, !dbg !312, !tbaa !112
  %arrayidx80 = getelementptr inbounds i64, i64* %call61, i64 18, !dbg !313
  %43 = bitcast i64* %arrayidx80 to <2 x i64>*, !dbg !314
  store <2 x i64> <i64 32, i64 71>, <2 x i64>* %43, align 8, !dbg !314, !tbaa !112
  %arrayidx82 = getelementptr inbounds i64, i64* %call61, i64 20, !dbg !315
  %44 = bitcast i64* %arrayidx82 to <2 x i64>*, !dbg !316
  store <2 x i64> <i64 67, i64 68>, <2 x i64>* %44, align 8, !dbg !316, !tbaa !112
  %arrayidx84 = getelementptr inbounds i64, i64* %call61, i64 22, !dbg !317
  %45 = bitcast i64* %arrayidx84 to <2 x i64>*, !dbg !318
  store <2 x i64> <i64 32, i64 116>, <2 x i64>* %45, align 8, !dbg !318, !tbaa !112
  %arrayidx86 = getelementptr inbounds i64, i64* %call61, i64 24, !dbg !319
  %46 = bitcast i64* %arrayidx86 to <2 x i64>*, !dbg !320
  store <2 x i64> <i64 101, i64 115>, <2 x i64>* %46, align 8, !dbg !320, !tbaa !112
  %arrayidx88 = getelementptr inbounds i64, i64* %call61, i64 26, !dbg !321
  %47 = bitcast i64* %arrayidx88 to <2 x i64>*, !dbg !322
  store <2 x i64> <i64 116, i64 32>, <2 x i64>* %47, align 8, !dbg !322, !tbaa !112
  %arrayidx90 = getelementptr inbounds i64, i64* %call61, i64 28, !dbg !323
  %48 = bitcast i64* %arrayidx90 to <2 x i64>*, !dbg !324
  store <2 x i64> <i64 99, i64 97>, <2 x i64>* %48, align 8, !dbg !324, !tbaa !112
  %arrayidx92 = getelementptr inbounds i64, i64* %call61, i64 30, !dbg !325
  %49 = bitcast i64* %arrayidx92 to <2 x i64>*, !dbg !326
  store <2 x i64> <i64 115, i64 101>, <2 x i64>* %49, align 8, !dbg !326, !tbaa !112
  tail call void @llvm.dbg.value(metadata i8 1, i64 0, metadata !184, metadata !21), !dbg !223
  tail call void @println_s(i64* %call61, i64 32) #6, !dbg !327
  %phitmp = bitcast i64* %call61 to i8*, !dbg !327
  %phitmp209 = bitcast i64* %call50 to i8*, !dbg !327
  %phitmp210 = bitcast i64* %call10 to i8*, !dbg !327
  %phitmp211 = bitcast i64* %call21 to i8*, !dbg !327
  %50 = bitcast i64* %call1 to i8*, !dbg !328
  tail call void @free(i8* %50) #6, !dbg !328
  tail call void @llvm.dbg.value(metadata i64* null, i64 0, metadata !132, metadata !21), !dbg !228
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !133, metadata !21), !dbg !187
  tail call void @free(i8* %phitmp211) #6, !dbg !333
  tail call void @llvm.dbg.value(metadata i64* null, i64 0, metadata !135, metadata !21), !dbg !189
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !137, metadata !21), !dbg !190
  tail call void @free(i8* %phitmp210) #6, !dbg !338
  tail call void @llvm.dbg.value(metadata i64* null, i64 0, metadata !153, metadata !21), !dbg !200
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !155, metadata !21), !dbg !201
  tail call void @free(i8* %phitmp209) #6, !dbg !343
  tail call void @llvm.dbg.value(metadata i64* null, i64 0, metadata !177, metadata !21), !dbg !220
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !179, metadata !21), !dbg !221
  tail call void @free(i8* %phitmp) #6, !dbg !348
  tail call void @llvm.dbg.value(metadata i64* null, i64 0, metadata !182, metadata !21), !dbg !222
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !184, metadata !21), !dbg !223
  br label %if.end120, !dbg !348

if.end120:                                        ; preds = %entry, %if.then98
  tail call void @exit(i32 0) #8, !dbg !353
  unreachable, !dbg !353
}

declare i64** @convertArgsToIntArray(i32, i8**) local_unnamed_addr #4

declare i64* @parseStringToInt(i64*) local_unnamed_addr #4

declare i64* @create1DArray(i32, i32) local_unnamed_addr #4

declare void @printf_s(i64*, i64) local_unnamed_addr #4

; Function Attrs: nounwind
declare i32 @printf(i8* nocapture readonly, ...) local_unnamed_addr #2

declare void @println_s(i64*, i64) local_unnamed_addr #4

; Function Attrs: nounwind readnone
declare void @llvm.dbg.value(metadata, i64, metadata, metadata) #5

; Function Attrs: nounwind
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) local_unnamed_addr #6

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

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 3.9.0 (http://llvm.org/git/clang.git f82fb5beb88e841f7a00cfb2a2ceabe46bcb2a9b) (http://llvm.org/git/llvm.git bafbf2b643f118fd2ea402ed6cd204281c7e9e94)", isOptimized: true, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3)
!1 = !DIFile(filename: "GCD_cached.c", directory: "/home/mw169/workspace/WhileyOpenCL/polly/GCD/impl/cached/copyreduced_dealloc")
!2 = !{}
!3 = !{!4}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64, align: 64)
!5 = !{i32 2, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{!"clang version 3.9.0 (http://llvm.org/git/clang.git f82fb5beb88e841f7a00cfb2a2ceabe46bcb2a9b) (http://llvm.org/git/llvm.git bafbf2b643f118fd2ea402ed6cd204281c7e9e94)"}
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
!65 = !DILocalVariable(name: "gcds_dealloc", arg: 6, scope: !54, file: !1, line: 62, type: !58)
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
!91 = !DILocation(line: 76, column: 2, scope: !92)
!92 = distinct !DILexicalBlock(scope: !54, file: !1, line: 76, column: 2)
!93 = !DILocation(line: 76, column: 2, scope: !94)
!94 = !DILexicalBlockFile(scope: !95, file: !1, discriminator: 1)
!95 = distinct !DILexicalBlock(scope: !96, file: !1, line: 76, column: 2)
!96 = distinct !DILexicalBlock(scope: !92, file: !1, line: 76, column: 2)
!97 = !DILocation(line: 85, column: 6, scope: !98)
!98 = distinct !DILexicalBlock(scope: !54, file: !1, line: 85, column: 5)
!99 = !DILocation(line: 85, column: 5, scope: !54)
!100 = !DILocation(line: 87, column: 2, scope: !101)
!101 = distinct !DILexicalBlock(scope: !54, file: !1, line: 87, column: 2)
!102 = !DILocation(line: 87, column: 2, scope: !103)
!103 = !DILexicalBlockFile(scope: !104, file: !1, discriminator: 1)
!104 = distinct !DILexicalBlock(scope: !105, file: !1, line: 87, column: 2)
!105 = distinct !DILexicalBlock(scope: !101, file: !1, line: 87, column: 2)
!106 = !DILocation(line: 94, column: 6, scope: !107)
!107 = distinct !DILexicalBlock(scope: !54, file: !1, line: 94, column: 5)
!108 = !DILocation(line: 94, column: 5, scope: !54)
!109 = !DILocation(line: 110, column: 6, scope: !54)
!110 = !DILocation(line: 112, column: 8, scope: !54)
!111 = !DILocation(line: 114, column: 6, scope: !54)
!112 = !{!113, !113, i64 0}
!113 = !{!"long long", !44, i64 0}
!114 = !DILocation(line: 116, column: 2, scope: !115)
!115 = distinct !DILexicalBlock(scope: !54, file: !1, line: 116, column: 2)
!116 = !DILocation(line: 116, column: 2, scope: !117)
!117 = !DILexicalBlockFile(scope: !118, file: !1, discriminator: 1)
!118 = distinct !DILexicalBlock(scope: !119, file: !1, line: 116, column: 2)
!119 = distinct !DILexicalBlock(scope: !115, file: !1, line: 116, column: 2)
!120 = !DILocation(line: 123, column: 1, scope: !121)
!121 = !DILexicalBlockFile(scope: !54, file: !1, discriminator: 2)
!122 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 125, type: !123, isLocal: false, isDefinition: true, scopeLine: 125, flags: DIFlagPrototyped, isOptimized: true, unit: !0, variables: !129)
!123 = !DISubroutineType(types: !124)
!124 = !{!125, !125, !126}
!125 = !DIBasicType(name: "int", size: 32, align: 32, encoding: DW_ATE_signed)
!126 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !127, size: 64, align: 64)
!127 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !128, size: 64, align: 64)
!128 = !DIBasicType(name: "char", size: 8, align: 8, encoding: DW_ATE_signed_char)
!129 = !{!130, !131, !132, !133, !134, !135, !136, !137, !138, !139, !140, !141, !142, !143, !145, !146, !147, !148, !149, !150, !151, !152, !153, !154, !155, !156, !157, !158, !159, !160, !161, !162, !163, !164, !165, !166, !167, !168, !169, !170, !171, !172, !173, !174, !175, !176, !177, !178, !179, !180, !181, !182, !183, !184}
!130 = !DILocalVariable(name: "argc", arg: 1, scope: !122, file: !1, line: 125, type: !125)
!131 = !DILocalVariable(name: "args", arg: 2, scope: !122, file: !1, line: 125, type: !126)
!132 = !DILocalVariable(name: "max", scope: !122, file: !1, line: 126, type: !57)
!133 = !DILocalVariable(name: "max_dealloc", scope: !122, file: !1, line: 127, type: !58)
!134 = !DILocalVariable(name: "n", scope: !122, file: !1, line: 128, type: !11)
!135 = !DILocalVariable(name: "gcds", scope: !122, file: !1, line: 129, type: !57)
!136 = !DILocalVariable(name: "gcds_size", scope: !122, file: !1, line: 129, type: !11)
!137 = !DILocalVariable(name: "gcds_dealloc", scope: !122, file: !1, line: 130, type: !58)
!138 = !DILocalVariable(name: "sum", scope: !122, file: !1, line: 131, type: !11)
!139 = !DILocalVariable(name: "i", scope: !122, file: !1, line: 132, type: !11)
!140 = !DILocalVariable(name: "j", scope: !122, file: !1, line: 133, type: !11)
!141 = !DILocalVariable(name: "_7", scope: !122, file: !1, line: 134, type: !57)
!142 = !DILocalVariable(name: "_7_dealloc", scope: !122, file: !1, line: 135, type: !58)
!143 = !DILocalVariable(name: "_8", scope: !122, file: !1, line: 136, type: !144)
!144 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !57, size: 64, align: 64)
!145 = !DILocalVariable(name: "_8_size", scope: !122, file: !1, line: 136, type: !11)
!146 = !DILocalVariable(name: "_8_size_size", scope: !122, file: !1, line: 136, type: !11)
!147 = !DILocalVariable(name: "_8_dealloc", scope: !122, file: !1, line: 137, type: !58)
!148 = !DILocalVariable(name: "_9", scope: !122, file: !1, line: 138, type: !11)
!149 = !DILocalVariable(name: "_10", scope: !122, file: !1, line: 139, type: !57)
!150 = !DILocalVariable(name: "_10_size", scope: !122, file: !1, line: 139, type: !11)
!151 = !DILocalVariable(name: "_10_dealloc", scope: !122, file: !1, line: 140, type: !58)
!152 = !DILocalVariable(name: "_11", scope: !122, file: !1, line: 141, type: !4)
!153 = !DILocalVariable(name: "_13", scope: !122, file: !1, line: 142, type: !57)
!154 = !DILocalVariable(name: "_13_size", scope: !122, file: !1, line: 142, type: !11)
!155 = !DILocalVariable(name: "_13_dealloc", scope: !122, file: !1, line: 143, type: !58)
!156 = !DILocalVariable(name: "_14", scope: !122, file: !1, line: 144, type: !4)
!157 = !DILocalVariable(name: "_16", scope: !122, file: !1, line: 145, type: !11)
!158 = !DILocalVariable(name: "_17", scope: !122, file: !1, line: 146, type: !11)
!159 = !DILocalVariable(name: "_18", scope: !122, file: !1, line: 147, type: !57)
!160 = !DILocalVariable(name: "_18_size", scope: !122, file: !1, line: 147, type: !11)
!161 = !DILocalVariable(name: "_18_dealloc", scope: !122, file: !1, line: 148, type: !58)
!162 = !DILocalVariable(name: "_19", scope: !122, file: !1, line: 149, type: !11)
!163 = !DILocalVariable(name: "_20", scope: !122, file: !1, line: 150, type: !11)
!164 = !DILocalVariable(name: "_21", scope: !122, file: !1, line: 151, type: !11)
!165 = !DILocalVariable(name: "_22", scope: !122, file: !1, line: 152, type: !11)
!166 = !DILocalVariable(name: "_23", scope: !122, file: !1, line: 153, type: !11)
!167 = !DILocalVariable(name: "_24", scope: !122, file: !1, line: 154, type: !11)
!168 = !DILocalVariable(name: "_25", scope: !122, file: !1, line: 155, type: !11)
!169 = !DILocalVariable(name: "_26", scope: !122, file: !1, line: 156, type: !11)
!170 = !DILocalVariable(name: "_27", scope: !122, file: !1, line: 157, type: !11)
!171 = !DILocalVariable(name: "_28", scope: !122, file: !1, line: 158, type: !11)
!172 = !DILocalVariable(name: "_29", scope: !122, file: !1, line: 159, type: !11)
!173 = !DILocalVariable(name: "_30", scope: !122, file: !1, line: 160, type: !11)
!174 = !DILocalVariable(name: "_31", scope: !122, file: !1, line: 161, type: !11)
!175 = !DILocalVariable(name: "_32", scope: !122, file: !1, line: 162, type: !11)
!176 = !DILocalVariable(name: "_33", scope: !122, file: !1, line: 163, type: !4)
!177 = !DILocalVariable(name: "_35", scope: !122, file: !1, line: 164, type: !57)
!178 = !DILocalVariable(name: "_35_size", scope: !122, file: !1, line: 164, type: !11)
!179 = !DILocalVariable(name: "_35_dealloc", scope: !122, file: !1, line: 165, type: !58)
!180 = !DILocalVariable(name: "_36", scope: !122, file: !1, line: 166, type: !4)
!181 = !DILocalVariable(name: "_38", scope: !122, file: !1, line: 167, type: !4)
!182 = !DILocalVariable(name: "_40", scope: !122, file: !1, line: 168, type: !57)
!183 = !DILocalVariable(name: "_40_size", scope: !122, file: !1, line: 168, type: !11)
!184 = !DILocalVariable(name: "_40_dealloc", scope: !122, file: !1, line: 169, type: !58)
!185 = !DILocation(line: 125, column: 14, scope: !122)
!186 = !DILocation(line: 125, column: 27, scope: !122)
!187 = !DILocation(line: 127, column: 2, scope: !122)
!188 = !DILocation(line: 128, column: 12, scope: !122)
!189 = !DILocation(line: 129, column: 2, scope: !122)
!190 = !DILocation(line: 130, column: 2, scope: !122)
!191 = !DILocation(line: 131, column: 12, scope: !122)
!192 = !DILocation(line: 132, column: 12, scope: !122)
!193 = !DILocation(line: 133, column: 12, scope: !122)
!194 = !DILocation(line: 135, column: 2, scope: !122)
!195 = !DILocation(line: 136, column: 2, scope: !122)
!196 = !DILocation(line: 137, column: 2, scope: !122)
!197 = !DILocation(line: 138, column: 12, scope: !122)
!198 = !DILocation(line: 139, column: 2, scope: !122)
!199 = !DILocation(line: 140, column: 2, scope: !122)
!200 = !DILocation(line: 142, column: 2, scope: !122)
!201 = !DILocation(line: 143, column: 2, scope: !122)
!202 = !DILocation(line: 145, column: 12, scope: !122)
!203 = !DILocation(line: 146, column: 12, scope: !122)
!204 = !DILocation(line: 147, column: 2, scope: !122)
!205 = !DILocation(line: 148, column: 2, scope: !122)
!206 = !DILocation(line: 149, column: 12, scope: !122)
!207 = !DILocation(line: 150, column: 12, scope: !122)
!208 = !DILocation(line: 151, column: 12, scope: !122)
!209 = !DILocation(line: 152, column: 12, scope: !122)
!210 = !DILocation(line: 153, column: 12, scope: !122)
!211 = !DILocation(line: 154, column: 12, scope: !122)
!212 = !DILocation(line: 155, column: 12, scope: !122)
!213 = !DILocation(line: 156, column: 12, scope: !122)
!214 = !DILocation(line: 157, column: 12, scope: !122)
!215 = !DILocation(line: 158, column: 12, scope: !122)
!216 = !DILocation(line: 159, column: 12, scope: !122)
!217 = !DILocation(line: 160, column: 12, scope: !122)
!218 = !DILocation(line: 161, column: 12, scope: !122)
!219 = !DILocation(line: 162, column: 12, scope: !122)
!220 = !DILocation(line: 164, column: 2, scope: !122)
!221 = !DILocation(line: 165, column: 2, scope: !122)
!222 = !DILocation(line: 168, column: 2, scope: !122)
!223 = !DILocation(line: 169, column: 2, scope: !122)
!224 = !DILocation(line: 171, column: 2, scope: !122)
!225 = !DILocation(line: 175, column: 6, scope: !122)
!226 = !DILocation(line: 178, column: 2, scope: !122)
!227 = !DILocation(line: 134, column: 13, scope: !122)
!228 = !DILocation(line: 126, column: 13, scope: !122)
!229 = !DILocation(line: 186, column: 9, scope: !230)
!230 = distinct !DILexicalBlock(scope: !122, file: !1, line: 186, column: 5)
!231 = !DILocation(line: 186, column: 5, scope: !122)
!232 = !DILocation(line: 188, column: 6, scope: !122)
!233 = !DILocation(line: 193, column: 2, scope: !122)
!234 = !DILocation(line: 194, column: 9, scope: !122)
!235 = !DILocation(line: 194, column: 28, scope: !122)
!236 = !DILocation(line: 194, column: 35, scope: !122)
!237 = !DILocation(line: 197, column: 2, scope: !122)
!238 = !DILocation(line: 201, column: 2, scope: !122)
!239 = !DILocation(line: 205, column: 7, scope: !122)
!240 = !DILocation(line: 208, column: 2, scope: !122)
!241 = !DILocation(line: 225, column: 7, scope: !242)
!242 = distinct !DILexicalBlock(scope: !243, file: !1, line: 225, column: 6)
!243 = distinct !DILexicalBlock(scope: !122, file: !1, line: 223, column: 13)
!244 = !DILocation(line: 225, column: 6, scope: !243)
!245 = !DILocation(line: 74, column: 6, scope: !89, inlinedAt: !246)
!246 = distinct !DILocation(line: 235, column: 10, scope: !247)
!247 = distinct !DILexicalBlock(scope: !243, file: !1, line: 231, column: 14)
!248 = !DILocation(line: 62, column: 32, scope: !54, inlinedAt: !246)
!249 = !DILocation(line: 249, column: 11, scope: !247)
!250 = !DILocation(line: 237, column: 9, scope: !247)
!251 = !DILocation(line: 235, column: 10, scope: !247)
!252 = !DILocation(line: 74, column: 5, scope: !54, inlinedAt: !246)
!253 = !DILocation(line: 241, column: 4, scope: !247)
!254 = !DILocation(line: 241, column: 14, scope: !247)
!255 = distinct !{!255, !256, !257, !258}
!256 = !DILocation(line: 231, column: 3, scope: !243)
!257 = !{!"llvm.loop.vectorize.width", i32 1}
!258 = !{!"llvm.loop.interleave.count", i32 1}
!259 = !DILocation(line: 62, column: 45, scope: !54, inlinedAt: !246)
!260 = !DILocation(line: 62, column: 58, scope: !54, inlinedAt: !246)
!261 = !DILocation(line: 62, column: 61, scope: !54, inlinedAt: !246)
!262 = !DILocation(line: 62, column: 88, scope: !54, inlinedAt: !246)
!263 = !DILocation(line: 63, column: 12, scope: !54, inlinedAt: !246)
!264 = !DILocation(line: 64, column: 12, scope: !54, inlinedAt: !246)
!265 = !DILocation(line: 65, column: 12, scope: !54, inlinedAt: !246)
!266 = !DILocation(line: 66, column: 12, scope: !54, inlinedAt: !246)
!267 = !DILocation(line: 67, column: 12, scope: !54, inlinedAt: !246)
!268 = !DILocation(line: 68, column: 12, scope: !54, inlinedAt: !246)
!269 = !DILocation(line: 69, column: 12, scope: !54, inlinedAt: !246)
!270 = !DILocation(line: 70, column: 12, scope: !54, inlinedAt: !246)
!271 = !DILocation(line: 85, column: 6, scope: !98, inlinedAt: !246)
!272 = !DILocation(line: 85, column: 5, scope: !54, inlinedAt: !246)
!273 = !DILocation(line: 94, column: 6, scope: !107, inlinedAt: !246)
!274 = !DILocation(line: 94, column: 5, scope: !54, inlinedAt: !246)
!275 = !DILocation(line: 110, column: 6, scope: !54, inlinedAt: !246)
!276 = !DILocation(line: 112, column: 8, scope: !54, inlinedAt: !246)
!277 = !DILocation(line: 114, column: 6, scope: !54, inlinedAt: !246)
!278 = !DILocation(line: 239, column: 11, scope: !247)
!279 = !DILocation(line: 255, column: 9, scope: !247)
!280 = !DILocation(line: 233, column: 7, scope: !247)
!281 = distinct !{!281, !256}
!282 = !DILocation(line: 266, column: 8, scope: !243)
!283 = distinct !{!283, !284}
!284 = !DILocation(line: 223, column: 2, scope: !122)
!285 = distinct !{!285, !256, !286, !257, !258}
!286 = !{!"llvm.loop.unroll.runtime.disable"}
!287 = !DILocation(line: 278, column: 2, scope: !122)
!288 = !DILocation(line: 279, column: 9, scope: !122)
!289 = !DILocation(line: 279, column: 29, scope: !122)
!290 = !DILocation(line: 279, column: 36, scope: !122)
!291 = !DILocation(line: 279, column: 56, scope: !122)
!292 = !DILocation(line: 279, column: 63, scope: !122)
!293 = !DILocation(line: 282, column: 2, scope: !122)
!294 = !DILocation(line: 286, column: 2, scope: !122)
!295 = !DILocation(line: 291, column: 2, scope: !122)
!296 = !DILocation(line: 292, column: 9, scope: !122)
!297 = !DILocation(line: 292, column: 28, scope: !122)
!298 = !DILocation(line: 292, column: 35, scope: !122)
!299 = !DILocation(line: 292, column: 56, scope: !122)
!300 = !DILocation(line: 292, column: 63, scope: !122)
!301 = !DILocation(line: 292, column: 82, scope: !122)
!302 = !DILocation(line: 292, column: 89, scope: !122)
!303 = !DILocation(line: 292, column: 108, scope: !122)
!304 = !DILocation(line: 292, column: 115, scope: !122)
!305 = !DILocation(line: 292, column: 136, scope: !122)
!306 = !DILocation(line: 292, column: 144, scope: !122)
!307 = !DILocation(line: 292, column: 165, scope: !122)
!308 = !DILocation(line: 292, column: 173, scope: !122)
!309 = !DILocation(line: 292, column: 194, scope: !122)
!310 = !DILocation(line: 292, column: 202, scope: !122)
!311 = !DILocation(line: 292, column: 223, scope: !122)
!312 = !DILocation(line: 292, column: 231, scope: !122)
!313 = !DILocation(line: 292, column: 253, scope: !122)
!314 = !DILocation(line: 292, column: 261, scope: !122)
!315 = !DILocation(line: 292, column: 281, scope: !122)
!316 = !DILocation(line: 292, column: 289, scope: !122)
!317 = !DILocation(line: 292, column: 309, scope: !122)
!318 = !DILocation(line: 292, column: 317, scope: !122)
!319 = !DILocation(line: 292, column: 338, scope: !122)
!320 = !DILocation(line: 292, column: 346, scope: !122)
!321 = !DILocation(line: 292, column: 368, scope: !122)
!322 = !DILocation(line: 292, column: 376, scope: !122)
!323 = !DILocation(line: 292, column: 397, scope: !122)
!324 = !DILocation(line: 292, column: 405, scope: !122)
!325 = !DILocation(line: 292, column: 425, scope: !122)
!326 = !DILocation(line: 292, column: 433, scope: !122)
!327 = !DILocation(line: 295, column: 2, scope: !122)
!328 = !DILocation(line: 299, column: 2, scope: !329)
!329 = !DILexicalBlockFile(scope: !330, file: !1, discriminator: 1)
!330 = distinct !DILexicalBlock(scope: !331, file: !1, line: 299, column: 2)
!331 = distinct !DILexicalBlock(scope: !332, file: !1, line: 299, column: 2)
!332 = distinct !DILexicalBlock(scope: !122, file: !1, line: 299, column: 2)
!333 = !DILocation(line: 300, column: 2, scope: !334)
!334 = !DILexicalBlockFile(scope: !335, file: !1, discriminator: 1)
!335 = distinct !DILexicalBlock(scope: !336, file: !1, line: 300, column: 2)
!336 = distinct !DILexicalBlock(scope: !337, file: !1, line: 300, column: 2)
!337 = distinct !DILexicalBlock(scope: !122, file: !1, line: 300, column: 2)
!338 = !DILocation(line: 304, column: 2, scope: !339)
!339 = !DILexicalBlockFile(scope: !340, file: !1, discriminator: 1)
!340 = distinct !DILexicalBlock(scope: !341, file: !1, line: 304, column: 2)
!341 = distinct !DILexicalBlock(scope: !342, file: !1, line: 304, column: 2)
!342 = distinct !DILexicalBlock(scope: !122, file: !1, line: 304, column: 2)
!343 = !DILocation(line: 306, column: 2, scope: !344)
!344 = !DILexicalBlockFile(scope: !345, file: !1, discriminator: 1)
!345 = distinct !DILexicalBlock(scope: !346, file: !1, line: 306, column: 2)
!346 = distinct !DILexicalBlock(scope: !347, file: !1, line: 306, column: 2)
!347 = distinct !DILexicalBlock(scope: !122, file: !1, line: 306, column: 2)
!348 = !DILocation(line: 307, column: 2, scope: !349)
!349 = !DILexicalBlockFile(scope: !350, file: !1, discriminator: 1)
!350 = distinct !DILexicalBlock(scope: !351, file: !1, line: 307, column: 2)
!351 = distinct !DILexicalBlock(scope: !352, file: !1, line: 307, column: 2)
!352 = distinct !DILexicalBlock(scope: !122, file: !1, line: 307, column: 2)
!353 = !DILocation(line: 308, column: 2, scope: !122)
