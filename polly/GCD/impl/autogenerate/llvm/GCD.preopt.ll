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
define i64 @gcd(i64 %a, i64 %b) #0 !dbg !4 {
entry:
  br label %entry.split, !dbg !26

entry.split:                                      ; preds = %entry
  tail call void @llvm.dbg.value(metadata i64 %a, i64 0, metadata !27, metadata !28), !dbg !26
  tail call void @llvm.dbg.value(metadata i64 %b, i64 0, metadata !29, metadata !28), !dbg !30
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !31, metadata !28), !dbg !32
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !33, metadata !28), !dbg !34
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !35, metadata !28), !dbg !36
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !37, metadata !28), !dbg !38
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !39, metadata !28), !dbg !40
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !41, metadata !28), !dbg !42
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !33, metadata !28), !dbg !34
  %cmp = icmp eq i64 %a, 0, !dbg !43
  br i1 %cmp, label %return, label %while.body.preheader, !dbg !45

while.body.preheader:                             ; preds = %entry.split
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !35, metadata !28), !dbg !36
  %cmp12 = icmp sgt i64 %a, -1, !dbg !46
  br i1 %cmp12, label %blklab4.lr.ph, label %if.end3, !dbg !50

blklab4.lr.ph:                                    ; preds = %while.body.preheader
  br label %blklab4, !dbg !50

while.body.if.end3_crit_edge:                     ; preds = %if.end6
  br label %if.end3, !dbg !50

if.end3:                                          ; preds = %while.body.if.end3_crit_edge, %while.body.preheader
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !dbg !51
  %1 = tail call i64 @fwrite(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str, i64 0, i64 0), i64 4, i64 1, %struct._IO_FILE* %0) #6, !dbg !52
  tail call void @exit(i32 -1) #7, !dbg !53
  unreachable, !dbg !53

blklab4:                                          ; preds = %blklab4.lr.ph, %if.end6
  %a.addr.04 = phi i64 [ %a, %blklab4.lr.ph ], [ %a.addr.1, %if.end6 ]
  %b.addr.03 = phi i64 [ %b, %blklab4.lr.ph ], [ %b.addr.1, %if.end6 ]
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !37, metadata !28), !dbg !38
  %cmp4 = icmp eq i64 %b.addr.03, 0, !dbg !54
  br i1 %cmp4, label %return.loopexit, label %if.end6, !dbg !56

if.end6:                                          ; preds = %blklab4
  %cmp7 = icmp sgt i64 %a.addr.04, %b.addr.03, !dbg !57
  %sub10 = select i1 %cmp7, i64 0, i64 %a.addr.04, !dbg !59
  %b.addr.1 = sub nsw i64 %b.addr.03, %sub10, !dbg !59
  %sub = select i1 %cmp7, i64 %b.addr.03, i64 0, !dbg !59
  %a.addr.1 = sub nsw i64 %a.addr.04, %sub, !dbg !59
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !35, metadata !28), !dbg !36
  %cmp1 = icmp sgt i64 %a.addr.1, -1, !dbg !46
  br i1 %cmp1, label %blklab4, label %while.body.if.end3_crit_edge, !dbg !50

return.loopexit:                                  ; preds = %blklab4
  %a.addr.04.lcssa = phi i64 [ %a.addr.04, %blklab4 ]
  br label %return, !dbg !60

return:                                           ; preds = %return.loopexit, %entry.split
  %retval.0 = phi i64 [ %b, %entry.split ], [ %a.addr.04.lcssa, %return.loopexit ]
  ret i64 %retval.0, !dbg !60
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) #2

; Function Attrs: noreturn nounwind
declare void @exit(i32) #3

; Function Attrs: nounwind uwtable
define i64* @gcd_array(i64* %data, i64 %data_size, i1 zeroext %data_has_ownership, i64 %n) #0 !dbg !8 {
entry:
  br label %entry.split, !dbg !61

entry.split:                                      ; preds = %entry
  tail call void @llvm.dbg.value(metadata i64* %data, i64 0, metadata !62, metadata !28), !dbg !61
  tail call void @llvm.dbg.value(metadata i64 %data_size, i64 0, metadata !63, metadata !28), !dbg !61
  tail call void @llvm.dbg.value(metadata i1 %data_has_ownership, i64 0, metadata !64, metadata !65), !dbg !66
  tail call void @llvm.dbg.value(metadata i64 %n, i64 0, metadata !67, metadata !28), !dbg !68
  tail call void @llvm.dbg.value(metadata i64* null, i64 0, metadata !69, metadata !28), !dbg !70
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !71, metadata !28), !dbg !70
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !72, metadata !28), !dbg !73
  tail call void @llvm.dbg.value(metadata i64* null, i64 0, metadata !74, metadata !28), !dbg !75
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !76, metadata !28), !dbg !75
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !77, metadata !28), !dbg !78
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !79, metadata !28), !dbg !80
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !81, metadata !28), !dbg !82
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !83, metadata !28), !dbg !84
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !85, metadata !28), !dbg !86
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !87, metadata !28), !dbg !88
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !89, metadata !28), !dbg !90
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !91, metadata !28), !dbg !92
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !93, metadata !28), !dbg !94
  tail call void @llvm.dbg.value(metadata i64* null, i64 0, metadata !95, metadata !28), !dbg !96
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !97, metadata !28), !dbg !96
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !98, metadata !28), !dbg !99
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !100, metadata !28), !dbg !101
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !102, metadata !28), !dbg !103
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !104, metadata !28), !dbg !105
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !106, metadata !28), !dbg !107
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !108, metadata !28), !dbg !109
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !110, metadata !28), !dbg !111
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !112, metadata !28), !dbg !113
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !114, metadata !28), !dbg !115
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !116, metadata !28), !dbg !117
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !118, metadata !28), !dbg !119
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !120, metadata !28), !dbg !121
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !122, metadata !28), !dbg !123
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !124, metadata !28), !dbg !125
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !126, metadata !28), !dbg !127
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !128, metadata !28), !dbg !129
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !130, metadata !28), !dbg !131
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !132, metadata !28), !dbg !133
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !134, metadata !28), !dbg !135
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !136, metadata !28), !dbg !137
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !138, metadata !28), !dbg !139
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !140, metadata !28), !dbg !141
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !91, metadata !28), !dbg !92
  %mul = mul nsw i64 %n, %n, !dbg !142
  tail call void @llvm.dbg.value(metadata i64 %mul, i64 0, metadata !93, metadata !28), !dbg !94
  tail call void @llvm.dbg.value(metadata i64 %mul, i64 0, metadata !97, metadata !28), !dbg !96
  %conv1 = trunc i64 %mul to i32, !dbg !143
  %call = tail call i64* @gen1DArray(i32 0, i32 %conv1) #5, !dbg !143
  tail call void @llvm.dbg.value(metadata i64* %call, i64 0, metadata !95, metadata !28), !dbg !96
  tail call void @llvm.dbg.value(metadata i8 1, i64 0, metadata !98, metadata !28), !dbg !99
  tail call void @llvm.dbg.value(metadata i64 %mul, i64 0, metadata !76, metadata !28), !dbg !75
  tail call void @llvm.dbg.value(metadata i64* %call, i64 0, metadata !74, metadata !28), !dbg !75
  tail call void @llvm.dbg.value(metadata i8 1, i64 0, metadata !77, metadata !28), !dbg !78
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !98, metadata !28), !dbg !99
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !100, metadata !28), !dbg !101
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !79, metadata !28), !dbg !80
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !102, metadata !28), !dbg !103
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !81, metadata !28), !dbg !82
  %cmp7 = icmp sgt i64 %n, 0, !dbg !144
  br i1 %cmp7, label %while.body9.preheader.lr.ph, label %blklab7, !dbg !147

while.body9.preheader.lr.ph:                      ; preds = %entry.split
  br label %while.body9.preheader, !dbg !147

while.body9.preheader:                            ; preds = %while.body9.preheader.lr.ph, %blklab8
  %i.08 = phi i64 [ 0, %while.body9.preheader.lr.ph ], [ %add42, %blklab8 ]
  %cmp105 = icmp sgt i64 %n, 0, !dbg !148
  br i1 %cmp105, label %if.end13.lr.ph, label %blklab8, !dbg !151

if.end13.lr.ph:                                   ; preds = %while.body9.preheader
  br label %if.end13, !dbg !151

if.end13:                                         ; preds = %if.end13.lr.ph, %blklab12
  %j.06 = phi i64 [ 0, %if.end13.lr.ph ], [ %add41, %blklab12 ]
  %arrayidx = getelementptr inbounds i64, i64* %data, i64 %i.08, !dbg !152
  %0 = load i64, i64* %arrayidx, align 8, !dbg !152
  tail call void @llvm.dbg.value(metadata i64 %0, i64 0, metadata !106, metadata !28), !dbg !107
  tail call void @llvm.dbg.value(metadata i64 %0, i64 0, metadata !85, metadata !28), !dbg !86
  %arrayidx14 = getelementptr inbounds i64, i64* %data, i64 %j.06, !dbg !153
  %1 = load i64, i64* %arrayidx14, align 8, !dbg !153
  tail call void @llvm.dbg.value(metadata i64 %1, i64 0, metadata !108, metadata !28), !dbg !109
  tail call void @llvm.dbg.value(metadata i64 %1, i64 0, metadata !87, metadata !28), !dbg !88
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !110, metadata !28), !dbg !111
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !89, metadata !28), !dbg !90
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !112, metadata !28), !dbg !113
  %cmp15 = icmp eq i64 %0, 0, !dbg !154
  br i1 %cmp15, label %blklab12, label %while.body20.preheader, !dbg !156

while.body20.preheader:                           ; preds = %if.end13
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !114, metadata !28), !dbg !115
  %cmp212 = icmp sgt i64 %0, -1, !dbg !157
  br i1 %cmp212, label %blklab15.lr.ph, label %while.body20.preheader.if.end24_crit_edge, !dbg !161

blklab15.lr.ph:                                   ; preds = %while.body20.preheader
  br label %blklab15, !dbg !161

while.body20.preheader.if.end24_crit_edge:        ; preds = %while.body20.preheader
  br label %if.end24, !dbg !161

while.body20.if.end24_crit_edge:                  ; preds = %if.end29
  br label %if.end24, !dbg !161

if.end24:                                         ; preds = %while.body20.if.end24_crit_edge, %while.body20.preheader.if.end24_crit_edge
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !dbg !162
  %3 = tail call i64 @fwrite(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str, i64 0, i64 0), i64 4, i64 1, %struct._IO_FILE* %2) #6, !dbg !163
  tail call void @exit(i32 -1) #7, !dbg !164
  unreachable, !dbg !164

blklab15:                                         ; preds = %blklab15.lr.ph, %if.end29
  %a.04 = phi i64 [ %0, %blklab15.lr.ph ], [ %a.1, %if.end29 ]
  %b.03 = phi i64 [ %1, %blklab15.lr.ph ], [ %b.1, %if.end29 ]
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !116, metadata !28), !dbg !117
  %cmp26 = icmp eq i64 %b.03, 0, !dbg !165
  br i1 %cmp26, label %blklab12.loopexit, label %if.end29, !dbg !167

if.end29:                                         ; preds = %blklab15
  %cmp30 = icmp sgt i64 %a.04, %b.03, !dbg !168
  %sub34 = select i1 %cmp30, i64 0, i64 %a.04, !dbg !170
  %b.1 = sub nsw i64 %b.03, %sub34, !dbg !170
  %sub = select i1 %cmp30, i64 %b.03, i64 0, !dbg !170
  %a.1 = sub nsw i64 %a.04, %sub, !dbg !170
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !114, metadata !28), !dbg !115
  %cmp21 = icmp sgt i64 %a.1, -1, !dbg !157
  br i1 %cmp21, label %blklab15, label %while.body20.if.end24_crit_edge, !dbg !161

blklab12.loopexit:                                ; preds = %blklab15
  %a.04.lcssa = phi i64 [ %a.04, %blklab15 ]
  br label %blklab12, !dbg !171

blklab12:                                         ; preds = %blklab12.loopexit, %if.end13
  %g.0 = phi i64 [ %1, %if.end13 ], [ %a.04.lcssa, %blklab12.loopexit ]
  %mul35 = mul nsw i64 %i.08, %n, !dbg !171
  tail call void @llvm.dbg.value(metadata i64 %mul35, i64 0, metadata !122, metadata !28), !dbg !123
  %add = add nsw i64 %j.06, %mul35, !dbg !172
  tail call void @llvm.dbg.value(metadata i64 %add, i64 0, metadata !124, metadata !28), !dbg !125
  %arrayidx36 = getelementptr inbounds i64, i64* %call, i64 %add, !dbg !173
  %4 = load i64, i64* %arrayidx36, align 8, !dbg !173
  tail call void @llvm.dbg.value(metadata i64 %4, i64 0, metadata !126, metadata !28), !dbg !127
  %add37 = add nsw i64 %4, %g.0, !dbg !174
  tail call void @llvm.dbg.value(metadata i64 %add37, i64 0, metadata !128, metadata !28), !dbg !129
  %mul38 = mul nsw i64 %i.08, %n, !dbg !175
  tail call void @llvm.dbg.value(metadata i64 %mul38, i64 0, metadata !130, metadata !28), !dbg !131
  %add39 = add nsw i64 %j.06, %mul38, !dbg !176
  tail call void @llvm.dbg.value(metadata i64 %add39, i64 0, metadata !132, metadata !28), !dbg !133
  %arrayidx40 = getelementptr inbounds i64, i64* %call, i64 %add39, !dbg !177
  store i64 %add37, i64* %arrayidx40, align 8, !dbg !178
  tail call void @llvm.dbg.value(metadata i64 1, i64 0, metadata !134, metadata !28), !dbg !135
  tail call void @llvm.dbg.value(metadata i64 %add41, i64 0, metadata !136, metadata !28), !dbg !137
  tail call void @llvm.dbg.value(metadata i64 %add41, i64 0, metadata !83, metadata !28), !dbg !84
  %add41 = add nuw nsw i64 %j.06, 1, !dbg !179
  %cmp10 = icmp slt i64 %add41, %n, !dbg !148
  br i1 %cmp10, label %if.end13, label %while.body9.blklab8_crit_edge, !dbg !151

while.body9.blklab8_crit_edge:                    ; preds = %blklab12
  br label %blklab8, !dbg !151

blklab8:                                          ; preds = %while.body9.blklab8_crit_edge, %while.body9.preheader
  tail call void @llvm.dbg.value(metadata i64 1, i64 0, metadata !138, metadata !28), !dbg !139
  tail call void @llvm.dbg.value(metadata i64 %add42, i64 0, metadata !140, metadata !28), !dbg !141
  tail call void @llvm.dbg.value(metadata i64 %add42, i64 0, metadata !81, metadata !28), !dbg !82
  %add42 = add nuw nsw i64 %i.08, 1, !dbg !180
  %cmp = icmp slt i64 %add42, %n, !dbg !144
  br i1 %cmp, label %while.body9.preheader, label %while.body.blklab7_crit_edge, !dbg !147

while.body.blklab7_crit_edge:                     ; preds = %blklab8
  br label %blklab7, !dbg !147

blklab7:                                          ; preds = %while.body.blklab7_crit_edge, %entry.split
  br i1 %data_has_ownership, label %if.then44, label %if.end51, !dbg !181

if.then44:                                        ; preds = %blklab7
  %5 = bitcast i64* %data to i8*, !dbg !182
  tail call void @free(i8* %5) #5, !dbg !182
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !64, metadata !28), !dbg !66
  br label %if.end51, !dbg !182

if.end51:                                         ; preds = %if.then44, %blklab7
  ret i64* %call, !dbg !186
}

; Function Attrs: nounwind
declare void @free(i8*) #4

declare i64* @gen1DArray(i32, i32) #2

; Function Attrs: nounwind uwtable
define i64* @init(i64 %n) #0 !dbg !13 {
entry:
  br label %entry.split, !dbg !187

entry.split:                                      ; preds = %entry
  tail call void @llvm.dbg.value(metadata i64 %n, i64 0, metadata !188, metadata !28), !dbg !187
  tail call void @llvm.dbg.value(metadata i64* null, i64 0, metadata !189, metadata !28), !dbg !190
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !191, metadata !28), !dbg !190
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !192, metadata !28), !dbg !193
  tail call void @llvm.dbg.value(metadata i64* null, i64 0, metadata !194, metadata !28), !dbg !195
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !196, metadata !28), !dbg !195
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !197, metadata !28), !dbg !198
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !199, metadata !28), !dbg !200
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !201, metadata !28), !dbg !202
  tail call void @llvm.dbg.value(metadata i64* null, i64 0, metadata !203, metadata !28), !dbg !204
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !205, metadata !28), !dbg !204
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !206, metadata !28), !dbg !207
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !208, metadata !28), !dbg !209
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !210, metadata !28), !dbg !211
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !212, metadata !28), !dbg !213
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !214, metadata !28), !dbg !215
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !216, metadata !28), !dbg !217
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !201, metadata !28), !dbg !202
  tail call void @llvm.dbg.value(metadata i64 %n, i64 0, metadata !205, metadata !28), !dbg !204
  %conv1 = trunc i64 %n to i32, !dbg !218
  %call = tail call i64* @gen1DArray(i32 0, i32 %conv1) #5, !dbg !218
  tail call void @llvm.dbg.value(metadata i64* %call, i64 0, metadata !203, metadata !28), !dbg !204
  tail call void @llvm.dbg.value(metadata i8 1, i64 0, metadata !206, metadata !28), !dbg !207
  tail call void @llvm.dbg.value(metadata i64 %n, i64 0, metadata !196, metadata !28), !dbg !195
  tail call void @llvm.dbg.value(metadata i64* %call, i64 0, metadata !194, metadata !28), !dbg !195
  tail call void @llvm.dbg.value(metadata i8 1, i64 0, metadata !197, metadata !28), !dbg !198
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !206, metadata !28), !dbg !207
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !208, metadata !28), !dbg !209
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !199, metadata !28), !dbg !200
  %cmp1 = icmp sgt i64 %n, 0, !dbg !219
  br i1 %cmp1, label %if.end7.lr.ph, label %if.end15, !dbg !222

if.end7.lr.ph:                                    ; preds = %entry.split
  br label %if.end7, !dbg !222

if.end7:                                          ; preds = %if.end7.lr.ph, %if.end7
  %i.02 = phi i64 [ 0, %if.end7.lr.ph ], [ %add9, %if.end7 ]
  %arrayidx = getelementptr inbounds i64, i64* %call, i64 %i.02, !dbg !223
  %0 = load i64, i64* %arrayidx, align 8, !dbg !223
  tail call void @llvm.dbg.value(metadata i64 %0, i64 0, metadata !210, metadata !28), !dbg !211
  %add = add nsw i64 %0, %i.02, !dbg !224
  tail call void @llvm.dbg.value(metadata i64 %add, i64 0, metadata !212, metadata !28), !dbg !213
  %arrayidx8 = getelementptr inbounds i64, i64* %call, i64 %i.02, !dbg !225
  store i64 %add, i64* %arrayidx8, align 8, !dbg !226
  tail call void @llvm.dbg.value(metadata i64 1, i64 0, metadata !214, metadata !28), !dbg !215
  tail call void @llvm.dbg.value(metadata i64 %add9, i64 0, metadata !216, metadata !28), !dbg !217
  tail call void @llvm.dbg.value(metadata i64 %add9, i64 0, metadata !199, metadata !28), !dbg !200
  %add9 = add nuw nsw i64 %i.02, 1, !dbg !227
  %exitcond = icmp ne i64 %add9, %n, !dbg !222
  br i1 %exitcond, label %if.end7, label %while.body.if.end15_crit_edge, !dbg !222

while.body.if.end15_crit_edge:                    ; preds = %if.end7
  br label %if.end15, !dbg !222

if.end15:                                         ; preds = %while.body.if.end15_crit_edge, %entry.split
  ret i64* %call, !dbg !228
}

; Function Attrs: nounwind uwtable
define i32 @main(i32 %argc, i8** %args) #0 !dbg !16 {
entry:
  br label %entry.split, !dbg !229

entry.split:                                      ; preds = %entry
  tail call void @llvm.dbg.value(metadata i32 %argc, i64 0, metadata !230, metadata !28), !dbg !229
  tail call void @llvm.dbg.value(metadata i8** %args, i64 0, metadata !231, metadata !28), !dbg !232
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !233, metadata !28), !dbg !234
  tail call void @llvm.dbg.value(metadata i64* null, i64 0, metadata !235, metadata !28), !dbg !236
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !237, metadata !28), !dbg !236
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !238, metadata !28), !dbg !239
  tail call void @llvm.dbg.value(metadata i64* null, i64 0, metadata !240, metadata !28), !dbg !241
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !242, metadata !28), !dbg !241
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !243, metadata !28), !dbg !244
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !245, metadata !28), !dbg !246
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !247, metadata !28), !dbg !248
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !249, metadata !28), !dbg !250
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !251, metadata !28), !dbg !252
  tail call void @llvm.dbg.value(metadata i64* null, i64 0, metadata !253, metadata !28), !dbg !254
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !255, metadata !28), !dbg !254
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !256, metadata !28), !dbg !257
  tail call void @llvm.dbg.value(metadata i64* null, i64 0, metadata !258, metadata !28), !dbg !259
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !260, metadata !28), !dbg !259
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !261, metadata !28), !dbg !262
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !263, metadata !28), !dbg !264
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !265, metadata !28), !dbg !266
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !267, metadata !28), !dbg !268
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !269, metadata !28), !dbg !270
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !271, metadata !28), !dbg !272
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !273, metadata !28), !dbg !274
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !275, metadata !28), !dbg !276
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !277, metadata !28), !dbg !278
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !279, metadata !28), !dbg !280
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !281, metadata !28), !dbg !282
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !283, metadata !28), !dbg !284
  tail call void @llvm.dbg.value(metadata i64* null, i64 0, metadata !285, metadata !28), !dbg !286
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !287, metadata !28), !dbg !286
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !288, metadata !28), !dbg !289
  tail call void @llvm.dbg.value(metadata i64 1000, i64 0, metadata !251, metadata !28), !dbg !252
  tail call void @llvm.dbg.value(metadata i64 1000, i64 0, metadata !233, metadata !28), !dbg !234
  %call = tail call i64* @init(i64 1000), !dbg !290
  tail call void @llvm.dbg.value(metadata i64* %call, i64 0, metadata !253, metadata !28), !dbg !254
  tail call void @llvm.dbg.value(metadata i8 1, i64 0, metadata !256, metadata !28), !dbg !257
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !237, metadata !28), !dbg !236
  tail call void @llvm.dbg.value(metadata i64* %call, i64 0, metadata !235, metadata !28), !dbg !236
  tail call void @llvm.dbg.value(metadata i8 1, i64 0, metadata !238, metadata !28), !dbg !239
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !256, metadata !28), !dbg !257
  tail call void @llvm.dbg.value(metadata i8 1, i64 0, metadata !238, metadata !28), !dbg !239
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !260, metadata !28), !dbg !259
  %call7 = tail call i64* @gcd_array(i64* %call, i64 0, i1 zeroext false, i64 1000), !dbg !291
  tail call void @llvm.dbg.value(metadata i64* %call7, i64 0, metadata !258, metadata !28), !dbg !259
  tail call void @llvm.dbg.value(metadata i8 1, i64 0, metadata !261, metadata !28), !dbg !262
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !242, metadata !28), !dbg !241
  tail call void @llvm.dbg.value(metadata i64* %call7, i64 0, metadata !240, metadata !28), !dbg !241
  tail call void @llvm.dbg.value(metadata i8 1, i64 0, metadata !243, metadata !28), !dbg !244
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !261, metadata !28), !dbg !262
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !263, metadata !28), !dbg !264
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !245, metadata !28), !dbg !246
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !265, metadata !28), !dbg !266
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !247, metadata !28), !dbg !248
  br label %while.body14.preheader, !dbg !292

while.body14.preheader:                           ; preds = %entry.split, %blklab21
  %sum.04 = phi i64 [ 0, %entry.split ], [ %add18.lcssa, %blklab21 ]
  %i.03 = phi i64 [ 0, %entry.split ], [ %add20, %blklab21 ]
  br label %blklab23, !dbg !294

blklab23:                                         ; preds = %while.body14.preheader, %blklab23
  %sum.12 = phi i64 [ %sum.04, %while.body14.preheader ], [ %add18, %blklab23 ]
  %j.01 = phi i64 [ 0, %while.body14.preheader ], [ %add19, %blklab23 ]
  tail call void @llvm.dbg.value(metadata i64 %mul, i64 0, metadata !269, metadata !28), !dbg !270
  tail call void @llvm.dbg.value(metadata i64 %add, i64 0, metadata !271, metadata !28), !dbg !272
  tail call void @llvm.dbg.value(metadata i64 %0, i64 0, metadata !273, metadata !28), !dbg !274
  tail call void @llvm.dbg.value(metadata i64 %add18, i64 0, metadata !275, metadata !28), !dbg !276
  tail call void @llvm.dbg.value(metadata i64 %add18, i64 0, metadata !245, metadata !28), !dbg !246
  tail call void @llvm.dbg.value(metadata i64 1, i64 0, metadata !277, metadata !28), !dbg !278
  tail call void @llvm.dbg.value(metadata i64 %add19, i64 0, metadata !279, metadata !28), !dbg !280
  tail call void @llvm.dbg.value(metadata i64 %add19, i64 0, metadata !249, metadata !28), !dbg !250
  %add19 = add nuw nsw i64 %j.01, 1, !dbg !296
  %mul = mul nuw nsw i64 %i.03, 1000, !dbg !297
  %add = add nuw nsw i64 %j.01, %mul, !dbg !298
  %arrayidx = getelementptr inbounds i64, i64* %call7, i64 %add, !dbg !299
  %0 = load i64, i64* %arrayidx, align 8, !dbg !299
  %add18 = add nsw i64 %0, %sum.12, !dbg !300
  %exitcond = icmp eq i64 %add19, 1000, !dbg !294
  br i1 %exitcond, label %blklab21, label %blklab23, !dbg !294

blklab21:                                         ; preds = %blklab23
  %add18.lcssa = phi i64 [ %add18, %blklab23 ]
  tail call void @llvm.dbg.value(metadata i64 1, i64 0, metadata !281, metadata !28), !dbg !282
  tail call void @llvm.dbg.value(metadata i64 %add20, i64 0, metadata !283, metadata !28), !dbg !284
  tail call void @llvm.dbg.value(metadata i64 %add20, i64 0, metadata !247, metadata !28), !dbg !248
  %add20 = add nuw nsw i64 %i.03, 1, !dbg !301
  %exitcond5 = icmp eq i64 %add20, 1000, !dbg !292
  br i1 %exitcond5, label %if.end23, label %while.body14.preheader, !dbg !292

if.end23:                                         ; preds = %blklab21
  %add18.lcssa.lcssa = phi i64 [ %add18.lcssa, %blklab21 ]
  tail call void @llvm.dbg.value(metadata i64 4, i64 0, metadata !287, metadata !28), !dbg !286
  %call24 = tail call noalias i8* @malloc(i64 32) #5, !dbg !302
  %1 = bitcast i8* %call24 to i64*, !dbg !302
  tail call void @llvm.dbg.value(metadata i64* %1, i64 0, metadata !285, metadata !28), !dbg !286
  store i64 83, i64* %1, align 8, !dbg !303
  %arrayidx26 = getelementptr inbounds i8, i8* %call24, i64 8, !dbg !304
  %2 = bitcast i8* %arrayidx26 to i64*, !dbg !304
  store i64 85, i64* %2, align 8, !dbg !305
  %arrayidx27 = getelementptr inbounds i8, i8* %call24, i64 16, !dbg !306
  %3 = bitcast i8* %arrayidx27 to i64*, !dbg !306
  store i64 77, i64* %3, align 8, !dbg !307
  %arrayidx28 = getelementptr inbounds i8, i8* %call24, i64 24, !dbg !308
  %4 = bitcast i8* %arrayidx28 to i64*, !dbg !308
  store i64 58, i64* %4, align 8, !dbg !309
  tail call void @llvm.dbg.value(metadata i8 1, i64 0, metadata !288, metadata !28), !dbg !289
  tail call void @printf_s(i64* %1, i64 4) #5, !dbg !310
  %call29 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.1, i64 0, i64 0), i64 %add18.lcssa.lcssa) #5, !dbg !311
  %5 = bitcast i64* %call to i8*, !dbg !312
  tail call void @free(i8* %5) #5, !dbg !312
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !238, metadata !28), !dbg !239
  %6 = bitcast i64* %call7 to i8*, !dbg !316
  tail call void @free(i8* %6) #5, !dbg !316
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !243, metadata !28), !dbg !244
  tail call void @free(i8* %call24) #5, !dbg !320
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !288, metadata !28), !dbg !289
  tail call void @exit(i32 0) #7, !dbg !324
  unreachable, !dbg !324
}

; Function Attrs: nounwind
declare noalias i8* @malloc(i64) #4

declare void @printf_s(i64*, i64) #2

declare i32 @printf(i8*, ...) #2

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
!llvm.module.flags = !{!23, !24}
!llvm.ident = !{!25}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 3.9.0 (http://llvm.org/git/clang.git cf7bc8edf8cccb1b5de656c403cb55ad44132e98) (http://llvm.org/git/llvm.git 22706dc4c03305692f494d0e42a6de1050d0ec62)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, subprograms: !3)
!1 = !DIFile(filename: "GCD.c", directory: "/home/sam/workspace/WhileyOpenCL/polly/GCD/impl/autogenerate")
!2 = !{}
!3 = !{!4, !8, !13, !16}
!4 = distinct !DISubprogram(name: "gcd", scope: !1, file: !1, line: 2, type: !5, isLocal: false, isDefinition: true, scopeLine: 2, flags: DIFlagPrototyped, isOptimized: false, variables: !2)
!5 = !DISubroutineType(types: !6)
!6 = !{!7, !7, !7}
!7 = !DIBasicType(name: "long long int", size: 64, align: 64, encoding: DW_ATE_signed)
!8 = distinct !DISubprogram(name: "gcd_array", scope: !1, file: !1, line: 62, type: !9, isLocal: false, isDefinition: true, scopeLine: 62, flags: DIFlagPrototyped, isOptimized: false, variables: !2)
!9 = !DISubroutineType(types: !10)
!10 = !{!11, !11, !7, !12, !7}
!11 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !7, size: 64, align: 64)
!12 = !DIBasicType(name: "_Bool", size: 8, align: 8, encoding: DW_ATE_boolean)
!13 = distinct !DISubprogram(name: "init", scope: !1, file: !1, line: 241, type: !14, isLocal: false, isDefinition: true, scopeLine: 241, flags: DIFlagPrototyped, isOptimized: false, variables: !2)
!14 = !DISubroutineType(types: !15)
!15 = !{!11, !7}
!16 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 298, type: !17, isLocal: false, isDefinition: true, scopeLine: 298, flags: DIFlagPrototyped, isOptimized: false, variables: !2)
!17 = !DISubroutineType(types: !18)
!18 = !{!19, !19, !20}
!19 = !DIBasicType(name: "int", size: 32, align: 32, encoding: DW_ATE_signed)
!20 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !21, size: 64, align: 64)
!21 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !22, size: 64, align: 64)
!22 = !DIBasicType(name: "char", size: 8, align: 8, encoding: DW_ATE_signed_char)
!23 = !{i32 2, !"Dwarf Version", i32 4}
!24 = !{i32 2, !"Debug Info Version", i32 3}
!25 = !{!"clang version 3.9.0 (http://llvm.org/git/clang.git cf7bc8edf8cccb1b5de656c403cb55ad44132e98) (http://llvm.org/git/llvm.git 22706dc4c03305692f494d0e42a6de1050d0ec62)"}
!26 = !DILocation(line: 2, column: 25, scope: !4)
!27 = !DILocalVariable(name: "a", arg: 1, scope: !4, file: !1, line: 2, type: !7)
!28 = !DIExpression()
!29 = !DILocalVariable(name: "b", arg: 2, scope: !4, file: !1, line: 2, type: !7)
!30 = !DILocation(line: 2, column: 38, scope: !4)
!31 = !DILocalVariable(name: "_2", scope: !4, file: !1, line: 3, type: !7)
!32 = !DILocation(line: 3, column: 12, scope: !4)
!33 = !DILocalVariable(name: "_3", scope: !4, file: !1, line: 4, type: !7)
!34 = !DILocation(line: 4, column: 12, scope: !4)
!35 = !DILocalVariable(name: "_4", scope: !4, file: !1, line: 5, type: !7)
!36 = !DILocation(line: 5, column: 12, scope: !4)
!37 = !DILocalVariable(name: "_5", scope: !4, file: !1, line: 6, type: !7)
!38 = !DILocation(line: 6, column: 12, scope: !4)
!39 = !DILocalVariable(name: "_6", scope: !4, file: !1, line: 7, type: !7)
!40 = !DILocation(line: 7, column: 12, scope: !4)
!41 = !DILocalVariable(name: "_7", scope: !4, file: !1, line: 8, type: !7)
!42 = !DILocation(line: 8, column: 12, scope: !4)
!43 = !DILocation(line: 12, column: 6, scope: !44)
!44 = distinct !DILexicalBlock(scope: !4, file: !1, line: 12, column: 5)
!45 = !DILocation(line: 12, column: 5, scope: !4)
!46 = !DILocation(line: 24, column: 8, scope: !47)
!47 = distinct !DILexicalBlock(scope: !48, file: !1, line: 24, column: 7)
!48 = distinct !DILexicalBlock(scope: !49, file: !1, line: 20, column: 3)
!49 = distinct !DILexicalBlock(scope: !4, file: !1, line: 18, column: 13)
!50 = !DILocation(line: 24, column: 7, scope: !48)
!51 = !DILocation(line: 26, column: 12, scope: !48)
!52 = !DILocation(line: 26, column: 4, scope: !48)
!53 = !DILocation(line: 27, column: 4, scope: !48)
!54 = !DILocation(line: 35, column: 7, scope: !55)
!55 = distinct !DILexicalBlock(scope: !49, file: !1, line: 35, column: 6)
!56 = !DILocation(line: 35, column: 6, scope: !49)
!57 = !DILocation(line: 37, column: 7, scope: !58)
!58 = distinct !DILexicalBlock(scope: !49, file: !1, line: 37, column: 6)
!59 = !DILocation(line: 37, column: 6, scope: !49)
!60 = !DILocation(line: 60, column: 1, scope: !4)
!61 = !DILocation(line: 62, column: 22, scope: !8)
!62 = !DILocalVariable(name: "data", arg: 1, scope: !8, file: !1, line: 62, type: !11)
!63 = !DILocalVariable(name: "data_size", arg: 2, scope: !8, file: !1, line: 62, type: !7)
!64 = !DILocalVariable(name: "data_has_ownership", arg: 3, scope: !8, file: !1, line: 62, type: !12)
!65 = !DIExpression(DW_OP_bit_piece, 0, 1)
!66 = !DILocation(line: 62, column: 49, scope: !8)
!67 = !DILocalVariable(name: "n", arg: 4, scope: !8, file: !1, line: 62, type: !7)
!68 = !DILocation(line: 62, column: 88, scope: !8)
!69 = !DILocalVariable(name: "_2", scope: !8, file: !1, line: 63, type: !11)
!70 = !DILocation(line: 63, column: 2, scope: !8)
!71 = !DILocalVariable(name: "_2_size", scope: !8, file: !1, line: 63, type: !7)
!72 = !DILocalVariable(name: "_2_has_ownership", scope: !8, file: !1, line: 64, type: !12)
!73 = !DILocation(line: 64, column: 2, scope: !8)
!74 = !DILocalVariable(name: "gcds", scope: !8, file: !1, line: 65, type: !11)
!75 = !DILocation(line: 65, column: 2, scope: !8)
!76 = !DILocalVariable(name: "gcds_size", scope: !8, file: !1, line: 65, type: !7)
!77 = !DILocalVariable(name: "gcds_has_ownership", scope: !8, file: !1, line: 66, type: !12)
!78 = !DILocation(line: 66, column: 2, scope: !8)
!79 = !DILocalVariable(name: "sum", scope: !8, file: !1, line: 67, type: !7)
!80 = !DILocation(line: 67, column: 12, scope: !8)
!81 = !DILocalVariable(name: "i", scope: !8, file: !1, line: 68, type: !7)
!82 = !DILocation(line: 68, column: 12, scope: !8)
!83 = !DILocalVariable(name: "j", scope: !8, file: !1, line: 69, type: !7)
!84 = !DILocation(line: 69, column: 12, scope: !8)
!85 = !DILocalVariable(name: "a", scope: !8, file: !1, line: 70, type: !7)
!86 = !DILocation(line: 70, column: 12, scope: !8)
!87 = !DILocalVariable(name: "b", scope: !8, file: !1, line: 71, type: !7)
!88 = !DILocation(line: 71, column: 12, scope: !8)
!89 = !DILocalVariable(name: "g", scope: !8, file: !1, line: 72, type: !7)
!90 = !DILocation(line: 72, column: 12, scope: !8)
!91 = !DILocalVariable(name: "_10", scope: !8, file: !1, line: 73, type: !7)
!92 = !DILocation(line: 73, column: 12, scope: !8)
!93 = !DILocalVariable(name: "_11", scope: !8, file: !1, line: 74, type: !7)
!94 = !DILocation(line: 74, column: 12, scope: !8)
!95 = !DILocalVariable(name: "_12", scope: !8, file: !1, line: 75, type: !11)
!96 = !DILocation(line: 75, column: 2, scope: !8)
!97 = !DILocalVariable(name: "_12_size", scope: !8, file: !1, line: 75, type: !7)
!98 = !DILocalVariable(name: "_12_has_ownership", scope: !8, file: !1, line: 76, type: !12)
!99 = !DILocation(line: 76, column: 2, scope: !8)
!100 = !DILocalVariable(name: "_13", scope: !8, file: !1, line: 77, type: !7)
!101 = !DILocation(line: 77, column: 12, scope: !8)
!102 = !DILocalVariable(name: "_14", scope: !8, file: !1, line: 78, type: !7)
!103 = !DILocation(line: 78, column: 12, scope: !8)
!104 = !DILocalVariable(name: "_15", scope: !8, file: !1, line: 79, type: !7)
!105 = !DILocation(line: 79, column: 12, scope: !8)
!106 = !DILocalVariable(name: "_16", scope: !8, file: !1, line: 80, type: !7)
!107 = !DILocation(line: 80, column: 12, scope: !8)
!108 = !DILocalVariable(name: "_17", scope: !8, file: !1, line: 81, type: !7)
!109 = !DILocation(line: 81, column: 12, scope: !8)
!110 = !DILocalVariable(name: "_18", scope: !8, file: !1, line: 82, type: !7)
!111 = !DILocation(line: 82, column: 12, scope: !8)
!112 = !DILocalVariable(name: "_19", scope: !8, file: !1, line: 83, type: !7)
!113 = !DILocation(line: 83, column: 12, scope: !8)
!114 = !DILocalVariable(name: "_20", scope: !8, file: !1, line: 84, type: !7)
!115 = !DILocation(line: 84, column: 12, scope: !8)
!116 = !DILocalVariable(name: "_21", scope: !8, file: !1, line: 85, type: !7)
!117 = !DILocation(line: 85, column: 12, scope: !8)
!118 = !DILocalVariable(name: "_22", scope: !8, file: !1, line: 86, type: !7)
!119 = !DILocation(line: 86, column: 12, scope: !8)
!120 = !DILocalVariable(name: "_23", scope: !8, file: !1, line: 87, type: !7)
!121 = !DILocation(line: 87, column: 12, scope: !8)
!122 = !DILocalVariable(name: "_24", scope: !8, file: !1, line: 88, type: !7)
!123 = !DILocation(line: 88, column: 12, scope: !8)
!124 = !DILocalVariable(name: "_25", scope: !8, file: !1, line: 89, type: !7)
!125 = !DILocation(line: 89, column: 12, scope: !8)
!126 = !DILocalVariable(name: "_26", scope: !8, file: !1, line: 90, type: !7)
!127 = !DILocation(line: 90, column: 12, scope: !8)
!128 = !DILocalVariable(name: "_27", scope: !8, file: !1, line: 91, type: !7)
!129 = !DILocation(line: 91, column: 12, scope: !8)
!130 = !DILocalVariable(name: "_28", scope: !8, file: !1, line: 92, type: !7)
!131 = !DILocation(line: 92, column: 12, scope: !8)
!132 = !DILocalVariable(name: "_29", scope: !8, file: !1, line: 93, type: !7)
!133 = !DILocation(line: 93, column: 12, scope: !8)
!134 = !DILocalVariable(name: "_30", scope: !8, file: !1, line: 94, type: !7)
!135 = !DILocation(line: 94, column: 12, scope: !8)
!136 = !DILocalVariable(name: "_31", scope: !8, file: !1, line: 95, type: !7)
!137 = !DILocation(line: 95, column: 12, scope: !8)
!138 = !DILocalVariable(name: "_32", scope: !8, file: !1, line: 96, type: !7)
!139 = !DILocation(line: 96, column: 12, scope: !8)
!140 = !DILocalVariable(name: "_33", scope: !8, file: !1, line: 97, type: !7)
!141 = !DILocation(line: 97, column: 12, scope: !8)
!142 = !DILocation(line: 101, column: 7, scope: !8)
!143 = !DILocation(line: 104, column: 2, scope: !8)
!144 = !DILocation(line: 122, column: 7, scope: !145)
!145 = distinct !DILexicalBlock(scope: !146, file: !1, line: 122, column: 6)
!146 = distinct !DILexicalBlock(scope: !8, file: !1, line: 120, column: 13)
!147 = !DILocation(line: 122, column: 6, scope: !146)
!148 = !DILocation(line: 130, column: 8, scope: !149)
!149 = distinct !DILexicalBlock(scope: !150, file: !1, line: 130, column: 7)
!150 = distinct !DILexicalBlock(scope: !146, file: !1, line: 128, column: 14)
!151 = !DILocation(line: 130, column: 7, scope: !150)
!152 = !DILocation(line: 132, column: 8, scope: !150)
!153 = !DILocation(line: 136, column: 8, scope: !150)
!154 = !DILocation(line: 146, column: 8, scope: !155)
!155 = distinct !DILexicalBlock(scope: !150, file: !1, line: 146, column: 7)
!156 = !DILocation(line: 146, column: 7, scope: !150)
!157 = !DILocation(line: 160, column: 10, scope: !158)
!158 = distinct !DILexicalBlock(scope: !159, file: !1, line: 160, column: 9)
!159 = distinct !DILexicalBlock(scope: !160, file: !1, line: 156, column: 5)
!160 = distinct !DILexicalBlock(scope: !150, file: !1, line: 154, column: 15)
!161 = !DILocation(line: 160, column: 9, scope: !159)
!162 = !DILocation(line: 162, column: 14, scope: !159)
!163 = !DILocation(line: 162, column: 6, scope: !159)
!164 = !DILocation(line: 163, column: 6, scope: !159)
!165 = !DILocation(line: 171, column: 9, scope: !166)
!166 = distinct !DILexicalBlock(scope: !160, file: !1, line: 171, column: 8)
!167 = !DILocation(line: 171, column: 8, scope: !160)
!168 = !DILocation(line: 173, column: 9, scope: !169)
!169 = distinct !DILexicalBlock(scope: !160, file: !1, line: 173, column: 8)
!170 = !DILocation(line: 173, column: 8, scope: !160)
!171 = !DILocation(line: 198, column: 9, scope: !150)
!172 = !DILocation(line: 200, column: 11, scope: !150)
!173 = !DILocation(line: 202, column: 8, scope: !150)
!174 = !DILocation(line: 204, column: 11, scope: !150)
!175 = !DILocation(line: 206, column: 9, scope: !150)
!176 = !DILocation(line: 208, column: 11, scope: !150)
!177 = !DILocation(line: 210, column: 4, scope: !150)
!178 = !DILocation(line: 210, column: 14, scope: !150)
!179 = !DILocation(line: 214, column: 9, scope: !150)
!180 = !DILocation(line: 225, column: 8, scope: !146)
!181 = !DILocation(line: 234, column: 2, scope: !8)
!182 = !DILocation(line: 234, column: 2, scope: !183)
!183 = !DILexicalBlockFile(scope: !184, file: !1, discriminator: 1)
!184 = distinct !DILexicalBlock(scope: !185, file: !1, line: 234, column: 2)
!185 = distinct !DILexicalBlock(scope: !8, file: !1, line: 234, column: 2)
!186 = !DILocation(line: 237, column: 2, scope: !8)
!187 = !DILocation(line: 241, column: 27, scope: !13)
!188 = !DILocalVariable(name: "n", arg: 1, scope: !13, file: !1, line: 241, type: !7)
!189 = !DILocalVariable(name: "_1", scope: !13, file: !1, line: 242, type: !11)
!190 = !DILocation(line: 242, column: 2, scope: !13)
!191 = !DILocalVariable(name: "_1_size", scope: !13, file: !1, line: 242, type: !7)
!192 = !DILocalVariable(name: "_1_has_ownership", scope: !13, file: !1, line: 243, type: !12)
!193 = !DILocation(line: 243, column: 2, scope: !13)
!194 = !DILocalVariable(name: "data", scope: !13, file: !1, line: 244, type: !11)
!195 = !DILocation(line: 244, column: 2, scope: !13)
!196 = !DILocalVariable(name: "data_size", scope: !13, file: !1, line: 244, type: !7)
!197 = !DILocalVariable(name: "data_has_ownership", scope: !13, file: !1, line: 245, type: !12)
!198 = !DILocation(line: 245, column: 2, scope: !13)
!199 = !DILocalVariable(name: "i", scope: !13, file: !1, line: 246, type: !7)
!200 = !DILocation(line: 246, column: 12, scope: !13)
!201 = !DILocalVariable(name: "_4", scope: !13, file: !1, line: 247, type: !7)
!202 = !DILocation(line: 247, column: 12, scope: !13)
!203 = !DILocalVariable(name: "_5", scope: !13, file: !1, line: 248, type: !11)
!204 = !DILocation(line: 248, column: 2, scope: !13)
!205 = !DILocalVariable(name: "_5_size", scope: !13, file: !1, line: 248, type: !7)
!206 = !DILocalVariable(name: "_5_has_ownership", scope: !13, file: !1, line: 249, type: !12)
!207 = !DILocation(line: 249, column: 2, scope: !13)
!208 = !DILocalVariable(name: "_6", scope: !13, file: !1, line: 250, type: !7)
!209 = !DILocation(line: 250, column: 12, scope: !13)
!210 = !DILocalVariable(name: "_7", scope: !13, file: !1, line: 251, type: !7)
!211 = !DILocation(line: 251, column: 12, scope: !13)
!212 = !DILocalVariable(name: "_8", scope: !13, file: !1, line: 252, type: !7)
!213 = !DILocation(line: 252, column: 12, scope: !13)
!214 = !DILocalVariable(name: "_9", scope: !13, file: !1, line: 253, type: !7)
!215 = !DILocation(line: 253, column: 12, scope: !13)
!216 = !DILocalVariable(name: "_10", scope: !13, file: !1, line: 254, type: !7)
!217 = !DILocation(line: 254, column: 12, scope: !13)
!218 = !DILocation(line: 259, column: 2, scope: !13)
!219 = !DILocation(line: 273, column: 7, scope: !220)
!220 = distinct !DILexicalBlock(scope: !221, file: !1, line: 273, column: 6)
!221 = distinct !DILexicalBlock(scope: !13, file: !1, line: 271, column: 13)
!222 = !DILocation(line: 273, column: 6, scope: !221)
!223 = !DILocation(line: 275, column: 6, scope: !221)
!224 = !DILocation(line: 277, column: 8, scope: !221)
!225 = !DILocation(line: 279, column: 3, scope: !221)
!226 = !DILocation(line: 279, column: 11, scope: !221)
!227 = !DILocation(line: 283, column: 8, scope: !221)
!228 = !DILocation(line: 294, column: 2, scope: !13)
!229 = !DILocation(line: 298, column: 14, scope: !16)
!230 = !DILocalVariable(name: "argc", arg: 1, scope: !16, file: !1, line: 298, type: !19)
!231 = !DILocalVariable(name: "args", arg: 2, scope: !16, file: !1, line: 298, type: !20)
!232 = !DILocation(line: 298, column: 27, scope: !16)
!233 = !DILocalVariable(name: "n", scope: !16, file: !1, line: 299, type: !7)
!234 = !DILocation(line: 299, column: 12, scope: !16)
!235 = !DILocalVariable(name: "data", scope: !16, file: !1, line: 300, type: !11)
!236 = !DILocation(line: 300, column: 2, scope: !16)
!237 = !DILocalVariable(name: "data_size", scope: !16, file: !1, line: 300, type: !7)
!238 = !DILocalVariable(name: "data_has_ownership", scope: !16, file: !1, line: 301, type: !12)
!239 = !DILocation(line: 301, column: 2, scope: !16)
!240 = !DILocalVariable(name: "gcds", scope: !16, file: !1, line: 302, type: !11)
!241 = !DILocation(line: 302, column: 2, scope: !16)
!242 = !DILocalVariable(name: "gcds_size", scope: !16, file: !1, line: 302, type: !7)
!243 = !DILocalVariable(name: "gcds_has_ownership", scope: !16, file: !1, line: 303, type: !12)
!244 = !DILocation(line: 303, column: 2, scope: !16)
!245 = !DILocalVariable(name: "sum", scope: !16, file: !1, line: 304, type: !7)
!246 = !DILocation(line: 304, column: 12, scope: !16)
!247 = !DILocalVariable(name: "i", scope: !16, file: !1, line: 305, type: !7)
!248 = !DILocation(line: 305, column: 12, scope: !16)
!249 = !DILocalVariable(name: "j", scope: !16, file: !1, line: 306, type: !7)
!250 = !DILocation(line: 306, column: 12, scope: !16)
!251 = !DILocalVariable(name: "_7", scope: !16, file: !1, line: 307, type: !7)
!252 = !DILocation(line: 307, column: 12, scope: !16)
!253 = !DILocalVariable(name: "_8", scope: !16, file: !1, line: 308, type: !11)
!254 = !DILocation(line: 308, column: 2, scope: !16)
!255 = !DILocalVariable(name: "_8_size", scope: !16, file: !1, line: 308, type: !7)
!256 = !DILocalVariable(name: "_8_has_ownership", scope: !16, file: !1, line: 309, type: !12)
!257 = !DILocation(line: 309, column: 2, scope: !16)
!258 = !DILocalVariable(name: "_9", scope: !16, file: !1, line: 310, type: !11)
!259 = !DILocation(line: 310, column: 2, scope: !16)
!260 = !DILocalVariable(name: "_9_size", scope: !16, file: !1, line: 310, type: !7)
!261 = !DILocalVariable(name: "_9_has_ownership", scope: !16, file: !1, line: 311, type: !12)
!262 = !DILocation(line: 311, column: 2, scope: !16)
!263 = !DILocalVariable(name: "_10", scope: !16, file: !1, line: 312, type: !7)
!264 = !DILocation(line: 312, column: 12, scope: !16)
!265 = !DILocalVariable(name: "_11", scope: !16, file: !1, line: 313, type: !7)
!266 = !DILocation(line: 313, column: 12, scope: !16)
!267 = !DILocalVariable(name: "_12", scope: !16, file: !1, line: 314, type: !7)
!268 = !DILocation(line: 314, column: 12, scope: !16)
!269 = !DILocalVariable(name: "_13", scope: !16, file: !1, line: 315, type: !7)
!270 = !DILocation(line: 315, column: 12, scope: !16)
!271 = !DILocalVariable(name: "_14", scope: !16, file: !1, line: 316, type: !7)
!272 = !DILocation(line: 316, column: 12, scope: !16)
!273 = !DILocalVariable(name: "_15", scope: !16, file: !1, line: 317, type: !7)
!274 = !DILocation(line: 317, column: 12, scope: !16)
!275 = !DILocalVariable(name: "_16", scope: !16, file: !1, line: 318, type: !7)
!276 = !DILocation(line: 318, column: 12, scope: !16)
!277 = !DILocalVariable(name: "_17", scope: !16, file: !1, line: 319, type: !7)
!278 = !DILocation(line: 319, column: 12, scope: !16)
!279 = !DILocalVariable(name: "_18", scope: !16, file: !1, line: 320, type: !7)
!280 = !DILocation(line: 320, column: 12, scope: !16)
!281 = !DILocalVariable(name: "_19", scope: !16, file: !1, line: 321, type: !7)
!282 = !DILocation(line: 321, column: 12, scope: !16)
!283 = !DILocalVariable(name: "_20", scope: !16, file: !1, line: 322, type: !7)
!284 = !DILocation(line: 322, column: 12, scope: !16)
!285 = !DILocalVariable(name: "_23", scope: !16, file: !1, line: 324, type: !11)
!286 = !DILocation(line: 324, column: 2, scope: !16)
!287 = !DILocalVariable(name: "_23_size", scope: !16, file: !1, line: 324, type: !7)
!288 = !DILocalVariable(name: "_23_has_ownership", scope: !16, file: !1, line: 325, type: !12)
!289 = !DILocation(line: 325, column: 2, scope: !16)
!290 = !DILocation(line: 333, column: 7, scope: !16)
!291 = !DILocation(line: 344, column: 7, scope: !16)
!292 = !DILocation(line: 362, column: 6, scope: !293)
!293 = distinct !DILexicalBlock(scope: !16, file: !1, line: 360, column: 13)
!294 = !DILocation(line: 370, column: 7, scope: !295)
!295 = distinct !DILexicalBlock(scope: !293, file: !1, line: 368, column: 14)
!296 = !DILocation(line: 384, column: 9, scope: !295)
!297 = !DILocation(line: 372, column: 9, scope: !295)
!298 = !DILocation(line: 374, column: 11, scope: !295)
!299 = !DILocation(line: 376, column: 8, scope: !295)
!300 = !DILocation(line: 378, column: 11, scope: !295)
!301 = !DILocation(line: 395, column: 8, scope: !293)
!302 = !DILocation(line: 407, column: 2, scope: !16)
!303 = !DILocation(line: 408, column: 9, scope: !16)
!304 = !DILocation(line: 408, column: 15, scope: !16)
!305 = !DILocation(line: 408, column: 22, scope: !16)
!306 = !DILocation(line: 408, column: 28, scope: !16)
!307 = !DILocation(line: 408, column: 35, scope: !16)
!308 = !DILocation(line: 408, column: 41, scope: !16)
!309 = !DILocation(line: 408, column: 48, scope: !16)
!310 = !DILocation(line: 411, column: 2, scope: !16)
!311 = !DILocation(line: 415, column: 2, scope: !16)
!312 = !DILocation(line: 417, column: 2, scope: !313)
!313 = !DILexicalBlockFile(scope: !314, file: !1, discriminator: 1)
!314 = distinct !DILexicalBlock(scope: !315, file: !1, line: 417, column: 2)
!315 = distinct !DILexicalBlock(scope: !16, file: !1, line: 417, column: 2)
!316 = !DILocation(line: 418, column: 2, scope: !317)
!317 = !DILexicalBlockFile(scope: !318, file: !1, discriminator: 1)
!318 = distinct !DILexicalBlock(scope: !319, file: !1, line: 418, column: 2)
!319 = distinct !DILexicalBlock(scope: !16, file: !1, line: 418, column: 2)
!320 = !DILocation(line: 421, column: 2, scope: !321)
!321 = !DILexicalBlockFile(scope: !322, file: !1, discriminator: 1)
!322 = distinct !DILexicalBlock(scope: !323, file: !1, line: 421, column: 2)
!323 = distinct !DILexicalBlock(scope: !16, file: !1, line: 421, column: 2)
!324 = !DILocation(line: 422, column: 2, scope: !16)
