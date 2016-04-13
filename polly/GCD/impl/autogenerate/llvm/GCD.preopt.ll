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
  br label %entry.split, !dbg !27

entry.split:                                      ; preds = %entry
  tail call void @llvm.dbg.value(metadata i64 %a, i64 0, metadata !28, metadata !29), !dbg !27
  tail call void @llvm.dbg.value(metadata i64 %b, i64 0, metadata !30, metadata !29), !dbg !31
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !32, metadata !29), !dbg !33
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !34, metadata !29), !dbg !35
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !36, metadata !29), !dbg !37
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !38, metadata !29), !dbg !39
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !40, metadata !29), !dbg !41
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !42, metadata !29), !dbg !43
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !34, metadata !29), !dbg !35
  %cmp = icmp eq i64 %a, 0, !dbg !44
  br i1 %cmp, label %return, label %while.body.preheader, !dbg !46

while.body.preheader:                             ; preds = %entry.split
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !36, metadata !29), !dbg !37
  %cmp12 = icmp sgt i64 %a, -1, !dbg !47
  br i1 %cmp12, label %blklab4.lr.ph, label %if.end3, !dbg !51

blklab4.lr.ph:                                    ; preds = %while.body.preheader
  br label %blklab4, !dbg !51

while.body.if.end3_crit_edge:                     ; preds = %if.end6
  br label %if.end3, !dbg !51

if.end3:                                          ; preds = %while.body.if.end3_crit_edge, %while.body.preheader
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !dbg !52
  %1 = tail call i64 @fwrite(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str, i64 0, i64 0), i64 4, i64 1, %struct._IO_FILE* %0) #6, !dbg !53
  tail call void @exit(i32 -1) #7, !dbg !54
  unreachable, !dbg !54

blklab4:                                          ; preds = %blklab4.lr.ph, %if.end6
  %a.addr.04 = phi i64 [ %a, %blklab4.lr.ph ], [ %a.addr.1, %if.end6 ]
  %b.addr.03 = phi i64 [ %b, %blklab4.lr.ph ], [ %b.addr.1, %if.end6 ]
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !38, metadata !29), !dbg !39
  %cmp4 = icmp eq i64 %b.addr.03, 0, !dbg !55
  br i1 %cmp4, label %return.loopexit, label %if.end6, !dbg !57

if.end6:                                          ; preds = %blklab4
  %cmp7 = icmp sgt i64 %a.addr.04, %b.addr.03, !dbg !58
  %sub10 = select i1 %cmp7, i64 0, i64 %a.addr.04, !dbg !60
  %b.addr.1 = sub nsw i64 %b.addr.03, %sub10, !dbg !60
  %sub = select i1 %cmp7, i64 %b.addr.03, i64 0, !dbg !60
  %a.addr.1 = sub nsw i64 %a.addr.04, %sub, !dbg !60
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !36, metadata !29), !dbg !37
  %cmp1 = icmp sgt i64 %a.addr.1, -1, !dbg !47
  br i1 %cmp1, label %blklab4, label %while.body.if.end3_crit_edge, !dbg !51

return.loopexit:                                  ; preds = %blklab4
  %a.addr.04.lcssa = phi i64 [ %a.addr.04, %blklab4 ]
  br label %return, !dbg !61

return:                                           ; preds = %return.loopexit, %entry.split
  %retval.0 = phi i64 [ %b, %entry.split ], [ %a.addr.04.lcssa, %return.loopexit ]
  ret i64 %retval.0, !dbg !61
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) #2

; Function Attrs: noreturn nounwind
declare void @exit(i32) #3

; Function Attrs: nounwind uwtable
define i64* @gcd_array(i64* %data, i64 %data_size, i64 %n) #0 !dbg !10 {
entry:
  br label %entry.split, !dbg !62

entry.split:                                      ; preds = %entry
  tail call void @llvm.dbg.value(metadata i64* %data, i64 0, metadata !63, metadata !29), !dbg !62
  tail call void @llvm.dbg.value(metadata i64 %data_size, i64 0, metadata !64, metadata !29), !dbg !62
  tail call void @llvm.dbg.value(metadata i64 %n, i64 0, metadata !65, metadata !29), !dbg !66
  tail call void @llvm.dbg.value(metadata i64* null, i64 0, metadata !67, metadata !29), !dbg !68
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !69, metadata !29), !dbg !68
  tail call void @llvm.dbg.value(metadata i64* null, i64 0, metadata !70, metadata !29), !dbg !71
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !72, metadata !29), !dbg !71
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !73, metadata !29), !dbg !74
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !75, metadata !29), !dbg !76
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !77, metadata !29), !dbg !78
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !79, metadata !29), !dbg !80
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !81, metadata !29), !dbg !82
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !83, metadata !29), !dbg !84
  tail call void @llvm.dbg.value(metadata i64* null, i64 0, metadata !85, metadata !29), !dbg !86
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !87, metadata !29), !dbg !86
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !88, metadata !29), !dbg !89
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !90, metadata !29), !dbg !91
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !92, metadata !29), !dbg !93
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !94, metadata !29), !dbg !95
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !96, metadata !29), !dbg !97
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !98, metadata !29), !dbg !99
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !100, metadata !29), !dbg !101
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !102, metadata !29), !dbg !103
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !104, metadata !29), !dbg !105
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !106, metadata !29), !dbg !107
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !108, metadata !29), !dbg !109
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !110, metadata !29), !dbg !111
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !112, metadata !29), !dbg !113
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !114, metadata !29), !dbg !115
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !116, metadata !29), !dbg !117
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !118, metadata !29), !dbg !119
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !120, metadata !29), !dbg !121
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !122, metadata !29), !dbg !123
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !124, metadata !29), !dbg !125
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !126, metadata !29), !dbg !127
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !128, metadata !29), !dbg !129
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !130, metadata !29), !dbg !131
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !132, metadata !29), !dbg !133
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !134, metadata !29), !dbg !135
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !136, metadata !29), !dbg !137
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !81, metadata !29), !dbg !82
  %mul = mul nsw i64 %n, %n, !dbg !138
  tail call void @llvm.dbg.value(metadata i64 %mul, i64 0, metadata !83, metadata !29), !dbg !84
  tail call void @llvm.dbg.value(metadata i64 %mul, i64 0, metadata !87, metadata !29), !dbg !86
  %conv1 = trunc i64 %mul to i32, !dbg !139
  %call = tail call i64* @gen1DArray(i32 0, i32 %conv1) #5, !dbg !139
  tail call void @llvm.dbg.value(metadata i64* %call, i64 0, metadata !85, metadata !29), !dbg !86
  tail call void @llvm.dbg.value(metadata i64 %mul, i64 0, metadata !72, metadata !29), !dbg !71
  tail call void @llvm.dbg.value(metadata i64* %call, i64 0, metadata !70, metadata !29), !dbg !71
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !88, metadata !29), !dbg !89
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !73, metadata !29), !dbg !74
  %cmp8 = icmp sgt i64 %n, 0, !dbg !140
  br i1 %cmp8, label %while.body4.preheader.lr.ph, label %blklab7, !dbg !143

while.body4.preheader.lr.ph:                      ; preds = %entry.split
  br label %while.body4.preheader, !dbg !143

while.body4.preheader:                            ; preds = %while.body4.preheader.lr.ph, %blklab8
  %i.09 = phi i64 [ 0, %while.body4.preheader.lr.ph ], [ %add44, %blklab8 ]
  %cmp55 = icmp sgt i64 %n, 0, !dbg !144
  br i1 %cmp55, label %if.end8.lr.ph, label %blklab8, !dbg !147

if.end8.lr.ph:                                    ; preds = %while.body4.preheader
  br label %if.end8, !dbg !147

if.end8:                                          ; preds = %if.end8.lr.ph, %blklab10
  %j.06 = phi i64 [ 0, %if.end8.lr.ph ], [ %add43, %blklab10 ]
  %arrayidx = getelementptr inbounds i64, i64* %data, i64 %i.09, !dbg !148
  %0 = load i64, i64* %arrayidx, align 8, !dbg !148
  tail call void @llvm.dbg.value(metadata i64 %0, i64 0, metadata !92, metadata !29), !dbg !93
  tail call void @llvm.dbg.value(metadata i64 %0, i64 0, metadata !77, metadata !29), !dbg !78
  %arrayidx9 = getelementptr inbounds i64, i64* %data, i64 %j.06, !dbg !149
  %1 = load i64, i64* %arrayidx9, align 8, !dbg !149
  tail call void @llvm.dbg.value(metadata i64 %1, i64 0, metadata !94, metadata !29), !dbg !95
  tail call void @llvm.dbg.value(metadata i64 %1, i64 0, metadata !79, metadata !29), !dbg !80
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !96, metadata !29), !dbg !97
  %cmp10 = icmp eq i64 %0, 0, !dbg !150
  br i1 %cmp10, label %if.end13, label %while.body21.preheader, !dbg !152

while.body21.preheader:                           ; preds = %if.end8
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !110, metadata !29), !dbg !111
  %cmp222 = icmp sgt i64 %0, -1, !dbg !153
  br i1 %cmp222, label %blklab15.lr.ph, label %while.body21.preheader.if.end25_crit_edge, !dbg !157

blklab15.lr.ph:                                   ; preds = %while.body21.preheader
  br label %blklab15, !dbg !157

if.end13:                                         ; preds = %if.end8
  %mul14 = mul nsw i64 %i.09, %n, !dbg !158
  tail call void @llvm.dbg.value(metadata i64 %mul14, i64 0, metadata !98, metadata !29), !dbg !99
  %add = add nsw i64 %j.06, %mul14, !dbg !159
  tail call void @llvm.dbg.value(metadata i64 %add, i64 0, metadata !100, metadata !29), !dbg !101
  %arrayidx15 = getelementptr inbounds i64, i64* %call, i64 %add, !dbg !160
  %2 = load i64, i64* %arrayidx15, align 8, !dbg !160
  tail call void @llvm.dbg.value(metadata i64 %2, i64 0, metadata !102, metadata !29), !dbg !103
  %add16 = add nsw i64 %2, %1, !dbg !161
  tail call void @llvm.dbg.value(metadata i64 %add16, i64 0, metadata !104, metadata !29), !dbg !105
  %mul17 = mul nsw i64 %i.09, %n, !dbg !162
  tail call void @llvm.dbg.value(metadata i64 %mul17, i64 0, metadata !106, metadata !29), !dbg !107
  %add18 = add nsw i64 %j.06, %mul17, !dbg !163
  tail call void @llvm.dbg.value(metadata i64 %add18, i64 0, metadata !108, metadata !29), !dbg !109
  %arrayidx19 = getelementptr inbounds i64, i64* %call, i64 %add18, !dbg !164
  store i64 %add16, i64* %arrayidx19, align 8, !dbg !165
  br label %blklab10, !dbg !166

while.body21.preheader.if.end25_crit_edge:        ; preds = %while.body21.preheader
  br label %if.end25, !dbg !157

while.body21.if.end25_crit_edge:                  ; preds = %if.end30
  br label %if.end25, !dbg !157

if.end25:                                         ; preds = %while.body21.if.end25_crit_edge, %while.body21.preheader.if.end25_crit_edge
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !dbg !167
  %4 = tail call i64 @fwrite(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str, i64 0, i64 0), i64 4, i64 1, %struct._IO_FILE* %3) #6, !dbg !168
  tail call void @exit(i32 -1) #7, !dbg !169
  unreachable, !dbg !169

blklab15:                                         ; preds = %blklab15.lr.ph, %if.end30
  %a.04 = phi i64 [ %0, %blklab15.lr.ph ], [ %a.1, %if.end30 ]
  %b.03 = phi i64 [ %1, %blklab15.lr.ph ], [ %b.1, %if.end30 ]
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !112, metadata !29), !dbg !113
  %cmp27 = icmp eq i64 %b.03, 0, !dbg !170
  br i1 %cmp27, label %blklab13, label %if.end30, !dbg !172

if.end30:                                         ; preds = %blklab15
  %cmp31 = icmp sgt i64 %a.04, %b.03, !dbg !173
  %sub35 = select i1 %cmp31, i64 0, i64 %a.04, !dbg !175
  %b.1 = sub nsw i64 %b.03, %sub35, !dbg !175
  %sub = select i1 %cmp31, i64 %b.03, i64 0, !dbg !175
  %a.1 = sub nsw i64 %a.04, %sub, !dbg !175
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !110, metadata !29), !dbg !111
  %cmp22 = icmp sgt i64 %a.1, -1, !dbg !153
  br i1 %cmp22, label %blklab15, label %while.body21.if.end25_crit_edge, !dbg !157

blklab13:                                         ; preds = %blklab15
  %a.04.lcssa = phi i64 [ %a.04, %blklab15 ]
  %mul36 = mul nsw i64 %i.09, %n, !dbg !176
  tail call void @llvm.dbg.value(metadata i64 %mul36, i64 0, metadata !118, metadata !29), !dbg !119
  %add37 = add nsw i64 %j.06, %mul36, !dbg !177
  tail call void @llvm.dbg.value(metadata i64 %add37, i64 0, metadata !120, metadata !29), !dbg !121
  %arrayidx38 = getelementptr inbounds i64, i64* %call, i64 %add37, !dbg !178
  %5 = load i64, i64* %arrayidx38, align 8, !dbg !178
  tail call void @llvm.dbg.value(metadata i64 %5, i64 0, metadata !122, metadata !29), !dbg !123
  %add39 = add nsw i64 %5, %a.04.lcssa, !dbg !179
  tail call void @llvm.dbg.value(metadata i64 %add39, i64 0, metadata !124, metadata !29), !dbg !125
  %mul40 = mul nsw i64 %i.09, %n, !dbg !180
  tail call void @llvm.dbg.value(metadata i64 %mul40, i64 0, metadata !126, metadata !29), !dbg !127
  %add41 = add nsw i64 %j.06, %mul40, !dbg !181
  tail call void @llvm.dbg.value(metadata i64 %add41, i64 0, metadata !128, metadata !29), !dbg !129
  %arrayidx42 = getelementptr inbounds i64, i64* %call, i64 %add41, !dbg !182
  store i64 %add39, i64* %arrayidx42, align 8, !dbg !183
  br label %blklab10, !dbg !182

blklab10:                                         ; preds = %if.end13, %blklab13
  tail call void @llvm.dbg.value(metadata i64 1, i64 0, metadata !130, metadata !29), !dbg !131
  tail call void @llvm.dbg.value(metadata i64 %add43, i64 0, metadata !132, metadata !29), !dbg !133
  tail call void @llvm.dbg.value(metadata i64 %add43, i64 0, metadata !75, metadata !29), !dbg !76
  %add43 = add nuw nsw i64 %j.06, 1, !dbg !184
  %cmp5 = icmp slt i64 %add43, %n, !dbg !144
  br i1 %cmp5, label %if.end8, label %while.body4.blklab8_crit_edge, !dbg !147

while.body4.blklab8_crit_edge:                    ; preds = %blklab10
  br label %blklab8, !dbg !147

blklab8:                                          ; preds = %while.body4.blklab8_crit_edge, %while.body4.preheader
  tail call void @llvm.dbg.value(metadata i64 1, i64 0, metadata !134, metadata !29), !dbg !135
  tail call void @llvm.dbg.value(metadata i64 %add44, i64 0, metadata !136, metadata !29), !dbg !137
  tail call void @llvm.dbg.value(metadata i64 %add44, i64 0, metadata !73, metadata !29), !dbg !74
  %add44 = add nuw nsw i64 %i.09, 1, !dbg !185
  %cmp = icmp slt i64 %add44, %n, !dbg !140
  br i1 %cmp, label %while.body4.preheader, label %while.body.blklab7_crit_edge, !dbg !143

while.body.blklab7_crit_edge:                     ; preds = %blklab8
  br label %blklab7, !dbg !143

blklab7:                                          ; preds = %while.body.blklab7_crit_edge, %entry.split
  ret i64* %call, !dbg !186
}

declare i64* @gen1DArray(i32, i32) #2

; Function Attrs: nounwind uwtable
define i64* @init(i64 %n) #0 !dbg !14 {
entry:
  br label %entry.split, !dbg !187

entry.split:                                      ; preds = %entry
  tail call void @llvm.dbg.value(metadata i64 %n, i64 0, metadata !188, metadata !29), !dbg !187
  tail call void @llvm.dbg.value(metadata i64* null, i64 0, metadata !189, metadata !29), !dbg !190
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !191, metadata !29), !dbg !190
  tail call void @llvm.dbg.value(metadata i64* null, i64 0, metadata !192, metadata !29), !dbg !193
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !194, metadata !29), !dbg !193
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !195, metadata !29), !dbg !196
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !197, metadata !29), !dbg !198
  tail call void @llvm.dbg.value(metadata i64* null, i64 0, metadata !199, metadata !29), !dbg !200
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !201, metadata !29), !dbg !200
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !202, metadata !29), !dbg !203
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !204, metadata !29), !dbg !205
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !206, metadata !29), !dbg !207
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !208, metadata !29), !dbg !209
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !210, metadata !29), !dbg !211
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !197, metadata !29), !dbg !198
  tail call void @llvm.dbg.value(metadata i64 %n, i64 0, metadata !201, metadata !29), !dbg !200
  %conv1 = trunc i64 %n to i32, !dbg !212
  %call = tail call i64* @gen1DArray(i32 0, i32 %conv1) #5, !dbg !212
  tail call void @llvm.dbg.value(metadata i64* %call, i64 0, metadata !199, metadata !29), !dbg !200
  tail call void @llvm.dbg.value(metadata i64 %n, i64 0, metadata !194, metadata !29), !dbg !193
  tail call void @llvm.dbg.value(metadata i64* %call, i64 0, metadata !192, metadata !29), !dbg !193
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !202, metadata !29), !dbg !203
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !195, metadata !29), !dbg !196
  %cmp1 = icmp sgt i64 %n, 0, !dbg !213
  br i1 %cmp1, label %if.end.lr.ph, label %blklab18, !dbg !216

if.end.lr.ph:                                     ; preds = %entry.split
  br label %if.end, !dbg !216

if.end:                                           ; preds = %if.end.lr.ph, %if.end
  %i.02 = phi i64 [ 0, %if.end.lr.ph ], [ %add4, %if.end ]
  %arrayidx = getelementptr inbounds i64, i64* %call, i64 %i.02, !dbg !217
  %0 = load i64, i64* %arrayidx, align 8, !dbg !217
  tail call void @llvm.dbg.value(metadata i64 %0, i64 0, metadata !204, metadata !29), !dbg !205
  %add = add nsw i64 %0, %i.02, !dbg !218
  tail call void @llvm.dbg.value(metadata i64 %add, i64 0, metadata !206, metadata !29), !dbg !207
  %arrayidx3 = getelementptr inbounds i64, i64* %call, i64 %i.02, !dbg !219
  store i64 %add, i64* %arrayidx3, align 8, !dbg !220
  tail call void @llvm.dbg.value(metadata i64 1, i64 0, metadata !208, metadata !29), !dbg !209
  tail call void @llvm.dbg.value(metadata i64 %add4, i64 0, metadata !210, metadata !29), !dbg !211
  tail call void @llvm.dbg.value(metadata i64 %add4, i64 0, metadata !195, metadata !29), !dbg !196
  %add4 = add nuw nsw i64 %i.02, 1, !dbg !221
  %exitcond = icmp ne i64 %add4, %n, !dbg !216
  br i1 %exitcond, label %if.end, label %while.body.blklab18_crit_edge, !dbg !216

while.body.blklab18_crit_edge:                    ; preds = %if.end
  br label %blklab18, !dbg !216

blklab18:                                         ; preds = %while.body.blklab18_crit_edge, %entry.split
  ret i64* %call, !dbg !222
}

; Function Attrs: nounwind uwtable
define i32 @main(i32 %argc, i8** %args) #0 !dbg !17 {
entry:
  br label %entry.split, !dbg !223

entry.split:                                      ; preds = %entry
  tail call void @llvm.dbg.value(metadata i32 %argc, i64 0, metadata !224, metadata !29), !dbg !223
  tail call void @llvm.dbg.value(metadata i8** %args, i64 0, metadata !225, metadata !29), !dbg !226
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !227, metadata !29), !dbg !228
  tail call void @llvm.dbg.value(metadata i64* null, i64 0, metadata !229, metadata !29), !dbg !230
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !231, metadata !29), !dbg !230
  tail call void @llvm.dbg.value(metadata i64* null, i64 0, metadata !232, metadata !29), !dbg !233
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !234, metadata !29), !dbg !233
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !235, metadata !29), !dbg !236
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !237, metadata !29), !dbg !238
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !239, metadata !29), !dbg !240
  tail call void @llvm.dbg.value(metadata i64** null, i64 0, metadata !241, metadata !29), !dbg !243
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !244, metadata !29), !dbg !243
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !245, metadata !29), !dbg !243
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !246, metadata !29), !dbg !247
  tail call void @llvm.dbg.value(metadata i64* null, i64 0, metadata !248, metadata !29), !dbg !249
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !250, metadata !29), !dbg !249
  tail call void @llvm.dbg.value(metadata i64* null, i64 0, metadata !251, metadata !29), !dbg !252
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !253, metadata !29), !dbg !252
  tail call void @llvm.dbg.value(metadata i64* null, i64 0, metadata !254, metadata !29), !dbg !255
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !256, metadata !29), !dbg !255
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !257, metadata !29), !dbg !258
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !259, metadata !29), !dbg !260
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !261, metadata !29), !dbg !262
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !263, metadata !29), !dbg !264
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !265, metadata !29), !dbg !266
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !267, metadata !29), !dbg !268
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !269, metadata !29), !dbg !270
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !271, metadata !29), !dbg !272
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !273, metadata !29), !dbg !274
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !275, metadata !29), !dbg !276
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !277, metadata !29), !dbg !278
  tail call void @llvm.dbg.value(metadata i64* null, i64 0, metadata !279, metadata !29), !dbg !280
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !281, metadata !29), !dbg !280
  %call = tail call i64** @convertArgsToIntArray(i32 %argc, i8** %args) #5, !dbg !282
  tail call void @llvm.dbg.value(metadata i64** %call, i64 0, metadata !241, metadata !29), !dbg !243
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !246, metadata !29), !dbg !247
  %0 = load i64*, i64** %call, align 8, !dbg !283
  tail call void @llvm.dbg.value(metadata i64* %0, i64 0, metadata !248, metadata !29), !dbg !249
  %call1 = tail call i64* @parseStringToInt(i64* %0) #5, !dbg !284
  tail call void @llvm.dbg.value(metadata i64* %call1, i64 0, metadata !285, metadata !29), !dbg !286
  tail call void @llvm.dbg.value(metadata i64* %call1, i64 0, metadata !287, metadata !29), !dbg !288
  %cmp = icmp eq i64* %call1, null, !dbg !289
  br i1 %cmp, label %blklab20, label %if.end, !dbg !291

if.end:                                           ; preds = %entry.split
  %1 = load i64, i64* %call1, align 8, !dbg !292
  tail call void @llvm.dbg.value(metadata i64 %1, i64 0, metadata !227, metadata !29), !dbg !228
  %call3 = tail call i64* @init(i64 %1), !dbg !293
  tail call void @llvm.dbg.value(metadata i64* %call3, i64 0, metadata !251, metadata !29), !dbg !252
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !231, metadata !29), !dbg !230
  tail call void @llvm.dbg.value(metadata i64* %call3, i64 0, metadata !229, metadata !29), !dbg !230
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !256, metadata !29), !dbg !255
  %call4 = tail call i64* @gcd_array(i64* %call3, i64 0, i64 %1), !dbg !294
  tail call void @llvm.dbg.value(metadata i64* %call4, i64 0, metadata !254, metadata !29), !dbg !255
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !234, metadata !29), !dbg !233
  tail call void @llvm.dbg.value(metadata i64* %call4, i64 0, metadata !232, metadata !29), !dbg !233
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !257, metadata !29), !dbg !258
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !235, metadata !29), !dbg !236
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !259, metadata !29), !dbg !260
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !237, metadata !29), !dbg !238
  %cmp54 = icmp sgt i64 %1, 0, !dbg !295
  br i1 %cmp54, label %while.body10.preheader.lr.ph, label %blklab21, !dbg !298

while.body10.preheader.lr.ph:                     ; preds = %if.end
  br label %while.body10.preheader, !dbg !298

while.body10.preheader:                           ; preds = %while.body10.preheader.lr.ph, %blklab22
  %sum.07 = phi i64 [ 0, %while.body10.preheader.lr.ph ], [ %sum.1.lcssa, %blklab22 ]
  %i.05 = phi i64 [ 0, %while.body10.preheader.lr.ph ], [ %add18, %blklab22 ]
  %cmp111 = icmp sgt i64 %1, 0, !dbg !299
  br i1 %cmp111, label %blklab24.lr.ph, label %blklab22, !dbg !302

blklab24.lr.ph:                                   ; preds = %while.body10.preheader
  br label %blklab24, !dbg !302

blklab24:                                         ; preds = %blklab24.lr.ph, %blklab24
  %sum.13 = phi i64 [ %sum.07, %blklab24.lr.ph ], [ %add16, %blklab24 ]
  %j.02 = phi i64 [ 0, %blklab24.lr.ph ], [ %add17, %blklab24 ]
  tail call void @llvm.dbg.value(metadata i64 %mul, i64 0, metadata !263, metadata !29), !dbg !264
  tail call void @llvm.dbg.value(metadata i64 %add, i64 0, metadata !265, metadata !29), !dbg !266
  tail call void @llvm.dbg.value(metadata i64 %2, i64 0, metadata !267, metadata !29), !dbg !268
  tail call void @llvm.dbg.value(metadata i64 %add16, i64 0, metadata !269, metadata !29), !dbg !270
  tail call void @llvm.dbg.value(metadata i64 %add16, i64 0, metadata !235, metadata !29), !dbg !236
  tail call void @llvm.dbg.value(metadata i64 1, i64 0, metadata !271, metadata !29), !dbg !272
  tail call void @llvm.dbg.value(metadata i64 %add17, i64 0, metadata !273, metadata !29), !dbg !274
  tail call void @llvm.dbg.value(metadata i64 %add17, i64 0, metadata !239, metadata !29), !dbg !240
  %add17 = add nuw nsw i64 %j.02, 1, !dbg !303
  %mul = mul nsw i64 %i.05, %1, !dbg !304
  %add = add nsw i64 %j.02, %mul, !dbg !305
  %arrayidx15 = getelementptr inbounds i64, i64* %call4, i64 %add, !dbg !306
  %2 = load i64, i64* %arrayidx15, align 8, !dbg !306
  %add16 = add nsw i64 %2, %sum.13, !dbg !307
  %exitcond = icmp ne i64 %add17, %1, !dbg !302
  br i1 %exitcond, label %blklab24, label %while.body10.blklab22_crit_edge, !dbg !302

while.body10.blklab22_crit_edge:                  ; preds = %blklab24
  %add16.lcssa = phi i64 [ %add16, %blklab24 ]
  br label %blklab22, !dbg !302

blklab22:                                         ; preds = %while.body10.blklab22_crit_edge, %while.body10.preheader
  %sum.1.lcssa = phi i64 [ %add16.lcssa, %while.body10.blklab22_crit_edge ], [ %sum.07, %while.body10.preheader ]
  tail call void @llvm.dbg.value(metadata i64 1, i64 0, metadata !275, metadata !29), !dbg !276
  tail call void @llvm.dbg.value(metadata i64 %add18, i64 0, metadata !277, metadata !29), !dbg !278
  tail call void @llvm.dbg.value(metadata i64 %add18, i64 0, metadata !237, metadata !29), !dbg !238
  %add18 = add nuw nsw i64 %i.05, 1, !dbg !308
  %exitcond9 = icmp ne i64 %add18, %1, !dbg !298
  br i1 %exitcond9, label %while.body10.preheader, label %while.body.blklab21_crit_edge, !dbg !298

while.body.blklab21_crit_edge:                    ; preds = %blklab22
  %sum.1.lcssa.lcssa = phi i64 [ %sum.1.lcssa, %blklab22 ]
  br label %blklab21, !dbg !298

blklab21:                                         ; preds = %while.body.blklab21_crit_edge, %if.end
  %sum.0.lcssa = phi i64 [ %sum.1.lcssa.lcssa, %while.body.blklab21_crit_edge ], [ 0, %if.end ]
  tail call void @llvm.dbg.value(metadata i64 4, i64 0, metadata !281, metadata !29), !dbg !280
  %call19 = tail call noalias i8* @malloc(i64 32) #5, !dbg !309
  %3 = bitcast i8* %call19 to i64*, !dbg !309
  tail call void @llvm.dbg.value(metadata i64* %3, i64 0, metadata !279, metadata !29), !dbg !280
  store i64 83, i64* %3, align 8, !dbg !310
  %arrayidx21 = getelementptr inbounds i8, i8* %call19, i64 8, !dbg !311
  %4 = bitcast i8* %arrayidx21 to i64*, !dbg !311
  store i64 85, i64* %4, align 8, !dbg !312
  %arrayidx22 = getelementptr inbounds i8, i8* %call19, i64 16, !dbg !313
  %5 = bitcast i8* %arrayidx22 to i64*, !dbg !313
  store i64 77, i64* %5, align 8, !dbg !314
  %arrayidx23 = getelementptr inbounds i8, i8* %call19, i64 24, !dbg !315
  %6 = bitcast i8* %arrayidx23 to i64*, !dbg !315
  store i64 58, i64* %6, align 8, !dbg !316
  tail call void @printf_s(i64* %3, i64 4) #5, !dbg !317
  %call24 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.1, i64 0, i64 0), i64 %sum.0.lcssa) #5, !dbg !318
  br label %blklab20, !dbg !318

blklab20:                                         ; preds = %entry.split, %blklab21
  tail call void @exit(i32 0) #7, !dbg !319
  unreachable, !dbg !319
}

declare i64** @convertArgsToIntArray(i32, i8**) #2

declare i64* @parseStringToInt(i64*) #2

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
!llvm.module.flags = !{!24, !25}
!llvm.ident = !{!26}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 3.9.0 (http://llvm.org/git/clang.git cf7bc8edf8cccb1b5de656c403cb55ad44132e98) (http://llvm.org/git/llvm.git 22706dc4c03305692f494d0e42a6de1050d0ec62)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, subprograms: !5)
!1 = !DIFile(filename: "GCD.c", directory: "/home/sam/workspace/WhileyOpenCL/polly/GCD/impl/autogenerate")
!2 = !{}
!3 = !{!4}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64, align: 64)
!5 = !{!6, !10, !14, !17}
!6 = distinct !DISubprogram(name: "gcd", scope: !1, file: !1, line: 2, type: !7, isLocal: false, isDefinition: true, scopeLine: 2, flags: DIFlagPrototyped, isOptimized: false, variables: !2)
!7 = !DISubroutineType(types: !8)
!8 = !{!9, !9, !9}
!9 = !DIBasicType(name: "long long int", size: 64, align: 64, encoding: DW_ATE_signed)
!10 = distinct !DISubprogram(name: "gcd_array", scope: !1, file: !1, line: 62, type: !11, isLocal: false, isDefinition: true, scopeLine: 62, flags: DIFlagPrototyped, isOptimized: false, variables: !2)
!11 = !DISubroutineType(types: !12)
!12 = !{!13, !13, !9, !9}
!13 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !9, size: 64, align: 64)
!14 = distinct !DISubprogram(name: "init", scope: !1, file: !1, line: 234, type: !15, isLocal: false, isDefinition: true, scopeLine: 234, flags: DIFlagPrototyped, isOptimized: false, variables: !2)
!15 = !DISubroutineType(types: !16)
!16 = !{!13, !9}
!17 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 281, type: !18, isLocal: false, isDefinition: true, scopeLine: 281, flags: DIFlagPrototyped, isOptimized: false, variables: !2)
!18 = !DISubroutineType(types: !19)
!19 = !{!20, !20, !21}
!20 = !DIBasicType(name: "int", size: 32, align: 32, encoding: DW_ATE_signed)
!21 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !22, size: 64, align: 64)
!22 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !23, size: 64, align: 64)
!23 = !DIBasicType(name: "char", size: 8, align: 8, encoding: DW_ATE_signed_char)
!24 = !{i32 2, !"Dwarf Version", i32 4}
!25 = !{i32 2, !"Debug Info Version", i32 3}
!26 = !{!"clang version 3.9.0 (http://llvm.org/git/clang.git cf7bc8edf8cccb1b5de656c403cb55ad44132e98) (http://llvm.org/git/llvm.git 22706dc4c03305692f494d0e42a6de1050d0ec62)"}
!27 = !DILocation(line: 2, column: 25, scope: !6)
!28 = !DILocalVariable(name: "a", arg: 1, scope: !6, file: !1, line: 2, type: !9)
!29 = !DIExpression()
!30 = !DILocalVariable(name: "b", arg: 2, scope: !6, file: !1, line: 2, type: !9)
!31 = !DILocation(line: 2, column: 38, scope: !6)
!32 = !DILocalVariable(name: "_2", scope: !6, file: !1, line: 3, type: !9)
!33 = !DILocation(line: 3, column: 12, scope: !6)
!34 = !DILocalVariable(name: "_3", scope: !6, file: !1, line: 4, type: !9)
!35 = !DILocation(line: 4, column: 12, scope: !6)
!36 = !DILocalVariable(name: "_4", scope: !6, file: !1, line: 5, type: !9)
!37 = !DILocation(line: 5, column: 12, scope: !6)
!38 = !DILocalVariable(name: "_5", scope: !6, file: !1, line: 6, type: !9)
!39 = !DILocation(line: 6, column: 12, scope: !6)
!40 = !DILocalVariable(name: "_6", scope: !6, file: !1, line: 7, type: !9)
!41 = !DILocation(line: 7, column: 12, scope: !6)
!42 = !DILocalVariable(name: "_7", scope: !6, file: !1, line: 8, type: !9)
!43 = !DILocation(line: 8, column: 12, scope: !6)
!44 = !DILocation(line: 12, column: 6, scope: !45)
!45 = distinct !DILexicalBlock(scope: !6, file: !1, line: 12, column: 5)
!46 = !DILocation(line: 12, column: 5, scope: !6)
!47 = !DILocation(line: 24, column: 8, scope: !48)
!48 = distinct !DILexicalBlock(scope: !49, file: !1, line: 24, column: 7)
!49 = distinct !DILexicalBlock(scope: !50, file: !1, line: 20, column: 3)
!50 = distinct !DILexicalBlock(scope: !6, file: !1, line: 18, column: 13)
!51 = !DILocation(line: 24, column: 7, scope: !49)
!52 = !DILocation(line: 26, column: 12, scope: !49)
!53 = !DILocation(line: 26, column: 4, scope: !49)
!54 = !DILocation(line: 27, column: 4, scope: !49)
!55 = !DILocation(line: 35, column: 7, scope: !56)
!56 = distinct !DILexicalBlock(scope: !50, file: !1, line: 35, column: 6)
!57 = !DILocation(line: 35, column: 6, scope: !50)
!58 = !DILocation(line: 37, column: 7, scope: !59)
!59 = distinct !DILexicalBlock(scope: !50, file: !1, line: 37, column: 6)
!60 = !DILocation(line: 37, column: 6, scope: !50)
!61 = !DILocation(line: 60, column: 1, scope: !6)
!62 = !DILocation(line: 62, column: 22, scope: !10)
!63 = !DILocalVariable(name: "data", arg: 1, scope: !10, file: !1, line: 62, type: !13)
!64 = !DILocalVariable(name: "data_size", arg: 2, scope: !10, file: !1, line: 62, type: !9)
!65 = !DILocalVariable(name: "n", arg: 3, scope: !10, file: !1, line: 62, type: !9)
!66 = !DILocation(line: 62, column: 59, scope: !10)
!67 = !DILocalVariable(name: "_2", scope: !10, file: !1, line: 63, type: !13)
!68 = !DILocation(line: 63, column: 2, scope: !10)
!69 = !DILocalVariable(name: "_2_size", scope: !10, file: !1, line: 63, type: !9)
!70 = !DILocalVariable(name: "gcds", scope: !10, file: !1, line: 64, type: !13)
!71 = !DILocation(line: 64, column: 2, scope: !10)
!72 = !DILocalVariable(name: "gcds_size", scope: !10, file: !1, line: 64, type: !9)
!73 = !DILocalVariable(name: "i", scope: !10, file: !1, line: 65, type: !9)
!74 = !DILocation(line: 65, column: 12, scope: !10)
!75 = !DILocalVariable(name: "j", scope: !10, file: !1, line: 66, type: !9)
!76 = !DILocation(line: 66, column: 12, scope: !10)
!77 = !DILocalVariable(name: "a", scope: !10, file: !1, line: 67, type: !9)
!78 = !DILocation(line: 67, column: 12, scope: !10)
!79 = !DILocalVariable(name: "b", scope: !10, file: !1, line: 68, type: !9)
!80 = !DILocation(line: 68, column: 12, scope: !10)
!81 = !DILocalVariable(name: "_8", scope: !10, file: !1, line: 69, type: !9)
!82 = !DILocation(line: 69, column: 12, scope: !10)
!83 = !DILocalVariable(name: "_9", scope: !10, file: !1, line: 70, type: !9)
!84 = !DILocation(line: 70, column: 12, scope: !10)
!85 = !DILocalVariable(name: "_10", scope: !10, file: !1, line: 71, type: !13)
!86 = !DILocation(line: 71, column: 2, scope: !10)
!87 = !DILocalVariable(name: "_10_size", scope: !10, file: !1, line: 71, type: !9)
!88 = !DILocalVariable(name: "_11", scope: !10, file: !1, line: 72, type: !9)
!89 = !DILocation(line: 72, column: 12, scope: !10)
!90 = !DILocalVariable(name: "_12", scope: !10, file: !1, line: 73, type: !9)
!91 = !DILocation(line: 73, column: 12, scope: !10)
!92 = !DILocalVariable(name: "_13", scope: !10, file: !1, line: 74, type: !9)
!93 = !DILocation(line: 74, column: 12, scope: !10)
!94 = !DILocalVariable(name: "_14", scope: !10, file: !1, line: 75, type: !9)
!95 = !DILocation(line: 75, column: 12, scope: !10)
!96 = !DILocalVariable(name: "_15", scope: !10, file: !1, line: 76, type: !9)
!97 = !DILocation(line: 76, column: 12, scope: !10)
!98 = !DILocalVariable(name: "_16", scope: !10, file: !1, line: 77, type: !9)
!99 = !DILocation(line: 77, column: 12, scope: !10)
!100 = !DILocalVariable(name: "_17", scope: !10, file: !1, line: 78, type: !9)
!101 = !DILocation(line: 78, column: 12, scope: !10)
!102 = !DILocalVariable(name: "_18", scope: !10, file: !1, line: 79, type: !9)
!103 = !DILocation(line: 79, column: 12, scope: !10)
!104 = !DILocalVariable(name: "_19", scope: !10, file: !1, line: 80, type: !9)
!105 = !DILocation(line: 80, column: 12, scope: !10)
!106 = !DILocalVariable(name: "_20", scope: !10, file: !1, line: 81, type: !9)
!107 = !DILocation(line: 81, column: 12, scope: !10)
!108 = !DILocalVariable(name: "_21", scope: !10, file: !1, line: 82, type: !9)
!109 = !DILocation(line: 82, column: 12, scope: !10)
!110 = !DILocalVariable(name: "_22", scope: !10, file: !1, line: 83, type: !9)
!111 = !DILocation(line: 83, column: 12, scope: !10)
!112 = !DILocalVariable(name: "_23", scope: !10, file: !1, line: 84, type: !9)
!113 = !DILocation(line: 84, column: 12, scope: !10)
!114 = !DILocalVariable(name: "_24", scope: !10, file: !1, line: 85, type: !9)
!115 = !DILocation(line: 85, column: 12, scope: !10)
!116 = !DILocalVariable(name: "_25", scope: !10, file: !1, line: 86, type: !9)
!117 = !DILocation(line: 86, column: 12, scope: !10)
!118 = !DILocalVariable(name: "_26", scope: !10, file: !1, line: 87, type: !9)
!119 = !DILocation(line: 87, column: 12, scope: !10)
!120 = !DILocalVariable(name: "_27", scope: !10, file: !1, line: 88, type: !9)
!121 = !DILocation(line: 88, column: 12, scope: !10)
!122 = !DILocalVariable(name: "_28", scope: !10, file: !1, line: 89, type: !9)
!123 = !DILocation(line: 89, column: 12, scope: !10)
!124 = !DILocalVariable(name: "_29", scope: !10, file: !1, line: 90, type: !9)
!125 = !DILocation(line: 90, column: 12, scope: !10)
!126 = !DILocalVariable(name: "_30", scope: !10, file: !1, line: 91, type: !9)
!127 = !DILocation(line: 91, column: 12, scope: !10)
!128 = !DILocalVariable(name: "_31", scope: !10, file: !1, line: 92, type: !9)
!129 = !DILocation(line: 92, column: 12, scope: !10)
!130 = !DILocalVariable(name: "_32", scope: !10, file: !1, line: 93, type: !9)
!131 = !DILocation(line: 93, column: 12, scope: !10)
!132 = !DILocalVariable(name: "_33", scope: !10, file: !1, line: 94, type: !9)
!133 = !DILocation(line: 94, column: 12, scope: !10)
!134 = !DILocalVariable(name: "_34", scope: !10, file: !1, line: 95, type: !9)
!135 = !DILocation(line: 95, column: 12, scope: !10)
!136 = !DILocalVariable(name: "_35", scope: !10, file: !1, line: 96, type: !9)
!137 = !DILocation(line: 96, column: 12, scope: !10)
!138 = !DILocation(line: 100, column: 6, scope: !10)
!139 = !DILocation(line: 102, column: 2, scope: !10)
!140 = !DILocation(line: 112, column: 7, scope: !141)
!141 = distinct !DILexicalBlock(scope: !142, file: !1, line: 112, column: 6)
!142 = distinct !DILexicalBlock(scope: !10, file: !1, line: 110, column: 13)
!143 = !DILocation(line: 112, column: 6, scope: !142)
!144 = !DILocation(line: 120, column: 8, scope: !145)
!145 = distinct !DILexicalBlock(scope: !146, file: !1, line: 120, column: 7)
!146 = distinct !DILexicalBlock(scope: !142, file: !1, line: 118, column: 14)
!147 = !DILocation(line: 120, column: 7, scope: !146)
!148 = !DILocation(line: 122, column: 8, scope: !146)
!149 = !DILocation(line: 126, column: 8, scope: !146)
!150 = !DILocation(line: 132, column: 8, scope: !151)
!151 = distinct !DILexicalBlock(scope: !146, file: !1, line: 132, column: 7)
!152 = !DILocation(line: 132, column: 7, scope: !146)
!153 = !DILocation(line: 158, column: 10, scope: !154)
!154 = distinct !DILexicalBlock(scope: !155, file: !1, line: 158, column: 9)
!155 = distinct !DILexicalBlock(scope: !156, file: !1, line: 154, column: 5)
!156 = distinct !DILexicalBlock(scope: !146, file: !1, line: 152, column: 15)
!157 = !DILocation(line: 158, column: 9, scope: !155)
!158 = !DILocation(line: 134, column: 9, scope: !146)
!159 = !DILocation(line: 136, column: 11, scope: !146)
!160 = !DILocation(line: 138, column: 8, scope: !146)
!161 = !DILocation(line: 140, column: 11, scope: !146)
!162 = !DILocation(line: 142, column: 9, scope: !146)
!163 = !DILocation(line: 144, column: 11, scope: !146)
!164 = !DILocation(line: 146, column: 4, scope: !146)
!165 = !DILocation(line: 146, column: 14, scope: !146)
!166 = !DILocation(line: 148, column: 4, scope: !146)
!167 = !DILocation(line: 160, column: 14, scope: !155)
!168 = !DILocation(line: 160, column: 6, scope: !155)
!169 = !DILocation(line: 161, column: 6, scope: !155)
!170 = !DILocation(line: 169, column: 9, scope: !171)
!171 = distinct !DILexicalBlock(scope: !156, file: !1, line: 169, column: 8)
!172 = !DILocation(line: 169, column: 8, scope: !156)
!173 = !DILocation(line: 171, column: 9, scope: !174)
!174 = distinct !DILexicalBlock(scope: !156, file: !1, line: 171, column: 8)
!175 = !DILocation(line: 171, column: 8, scope: !156)
!176 = !DILocation(line: 192, column: 9, scope: !146)
!177 = !DILocation(line: 194, column: 11, scope: !146)
!178 = !DILocation(line: 196, column: 8, scope: !146)
!179 = !DILocation(line: 198, column: 11, scope: !146)
!180 = !DILocation(line: 200, column: 9, scope: !146)
!181 = !DILocation(line: 202, column: 11, scope: !146)
!182 = !DILocation(line: 204, column: 4, scope: !146)
!183 = !DILocation(line: 204, column: 14, scope: !146)
!184 = !DILocation(line: 210, column: 9, scope: !146)
!185 = !DILocation(line: 221, column: 8, scope: !142)
!186 = !DILocation(line: 230, column: 2, scope: !10)
!187 = !DILocation(line: 234, column: 27, scope: !14)
!188 = !DILocalVariable(name: "n", arg: 1, scope: !14, file: !1, line: 234, type: !9)
!189 = !DILocalVariable(name: "_1", scope: !14, file: !1, line: 235, type: !13)
!190 = !DILocation(line: 235, column: 2, scope: !14)
!191 = !DILocalVariable(name: "_1_size", scope: !14, file: !1, line: 235, type: !9)
!192 = !DILocalVariable(name: "data", scope: !14, file: !1, line: 236, type: !13)
!193 = !DILocation(line: 236, column: 2, scope: !14)
!194 = !DILocalVariable(name: "data_size", scope: !14, file: !1, line: 236, type: !9)
!195 = !DILocalVariable(name: "i", scope: !14, file: !1, line: 237, type: !9)
!196 = !DILocation(line: 237, column: 12, scope: !14)
!197 = !DILocalVariable(name: "_4", scope: !14, file: !1, line: 238, type: !9)
!198 = !DILocation(line: 238, column: 12, scope: !14)
!199 = !DILocalVariable(name: "_5", scope: !14, file: !1, line: 239, type: !13)
!200 = !DILocation(line: 239, column: 2, scope: !14)
!201 = !DILocalVariable(name: "_5_size", scope: !14, file: !1, line: 239, type: !9)
!202 = !DILocalVariable(name: "_6", scope: !14, file: !1, line: 240, type: !9)
!203 = !DILocation(line: 240, column: 12, scope: !14)
!204 = !DILocalVariable(name: "_7", scope: !14, file: !1, line: 241, type: !9)
!205 = !DILocation(line: 241, column: 12, scope: !14)
!206 = !DILocalVariable(name: "_8", scope: !14, file: !1, line: 242, type: !9)
!207 = !DILocation(line: 242, column: 12, scope: !14)
!208 = !DILocalVariable(name: "_9", scope: !14, file: !1, line: 243, type: !9)
!209 = !DILocation(line: 243, column: 12, scope: !14)
!210 = !DILocalVariable(name: "_10", scope: !14, file: !1, line: 244, type: !9)
!211 = !DILocation(line: 244, column: 12, scope: !14)
!212 = !DILocation(line: 248, column: 2, scope: !14)
!213 = !DILocation(line: 258, column: 7, scope: !214)
!214 = distinct !DILexicalBlock(scope: !215, file: !1, line: 258, column: 6)
!215 = distinct !DILexicalBlock(scope: !14, file: !1, line: 256, column: 13)
!216 = !DILocation(line: 258, column: 6, scope: !215)
!217 = !DILocation(line: 260, column: 6, scope: !215)
!218 = !DILocation(line: 262, column: 8, scope: !215)
!219 = !DILocation(line: 264, column: 3, scope: !215)
!220 = !DILocation(line: 264, column: 11, scope: !215)
!221 = !DILocation(line: 268, column: 8, scope: !215)
!222 = !DILocation(line: 277, column: 2, scope: !14)
!223 = !DILocation(line: 281, column: 14, scope: !17)
!224 = !DILocalVariable(name: "argc", arg: 1, scope: !17, file: !1, line: 281, type: !20)
!225 = !DILocalVariable(name: "args", arg: 2, scope: !17, file: !1, line: 281, type: !21)
!226 = !DILocation(line: 281, column: 27, scope: !17)
!227 = !DILocalVariable(name: "n", scope: !17, file: !1, line: 283, type: !9)
!228 = !DILocation(line: 283, column: 12, scope: !17)
!229 = !DILocalVariable(name: "data", scope: !17, file: !1, line: 284, type: !13)
!230 = !DILocation(line: 284, column: 2, scope: !17)
!231 = !DILocalVariable(name: "data_size", scope: !17, file: !1, line: 284, type: !9)
!232 = !DILocalVariable(name: "gcds", scope: !17, file: !1, line: 285, type: !13)
!233 = !DILocation(line: 285, column: 2, scope: !17)
!234 = !DILocalVariable(name: "gcds_size", scope: !17, file: !1, line: 285, type: !9)
!235 = !DILocalVariable(name: "sum", scope: !17, file: !1, line: 286, type: !9)
!236 = !DILocation(line: 286, column: 12, scope: !17)
!237 = !DILocalVariable(name: "i", scope: !17, file: !1, line: 287, type: !9)
!238 = !DILocation(line: 287, column: 12, scope: !17)
!239 = !DILocalVariable(name: "j", scope: !17, file: !1, line: 288, type: !9)
!240 = !DILocation(line: 288, column: 12, scope: !17)
!241 = !DILocalVariable(name: "_9", scope: !17, file: !1, line: 290, type: !242)
!242 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !13, size: 64, align: 64)
!243 = !DILocation(line: 290, column: 2, scope: !17)
!244 = !DILocalVariable(name: "_9_size", scope: !17, file: !1, line: 290, type: !9)
!245 = !DILocalVariable(name: "_9_size_size", scope: !17, file: !1, line: 290, type: !9)
!246 = !DILocalVariable(name: "_10", scope: !17, file: !1, line: 291, type: !9)
!247 = !DILocation(line: 291, column: 12, scope: !17)
!248 = !DILocalVariable(name: "_11", scope: !17, file: !1, line: 292, type: !13)
!249 = !DILocation(line: 292, column: 2, scope: !17)
!250 = !DILocalVariable(name: "_11_size", scope: !17, file: !1, line: 292, type: !9)
!251 = !DILocalVariable(name: "_12", scope: !17, file: !1, line: 293, type: !13)
!252 = !DILocation(line: 293, column: 2, scope: !17)
!253 = !DILocalVariable(name: "_12_size", scope: !17, file: !1, line: 293, type: !9)
!254 = !DILocalVariable(name: "_13", scope: !17, file: !1, line: 294, type: !13)
!255 = !DILocation(line: 294, column: 2, scope: !17)
!256 = !DILocalVariable(name: "_13_size", scope: !17, file: !1, line: 294, type: !9)
!257 = !DILocalVariable(name: "_14", scope: !17, file: !1, line: 295, type: !9)
!258 = !DILocation(line: 295, column: 12, scope: !17)
!259 = !DILocalVariable(name: "_15", scope: !17, file: !1, line: 296, type: !9)
!260 = !DILocation(line: 296, column: 12, scope: !17)
!261 = !DILocalVariable(name: "_16", scope: !17, file: !1, line: 297, type: !9)
!262 = !DILocation(line: 297, column: 12, scope: !17)
!263 = !DILocalVariable(name: "_17", scope: !17, file: !1, line: 298, type: !9)
!264 = !DILocation(line: 298, column: 12, scope: !17)
!265 = !DILocalVariable(name: "_18", scope: !17, file: !1, line: 299, type: !9)
!266 = !DILocation(line: 299, column: 12, scope: !17)
!267 = !DILocalVariable(name: "_19", scope: !17, file: !1, line: 300, type: !9)
!268 = !DILocation(line: 300, column: 12, scope: !17)
!269 = !DILocalVariable(name: "_20", scope: !17, file: !1, line: 301, type: !9)
!270 = !DILocation(line: 301, column: 12, scope: !17)
!271 = !DILocalVariable(name: "_21", scope: !17, file: !1, line: 302, type: !9)
!272 = !DILocation(line: 302, column: 12, scope: !17)
!273 = !DILocalVariable(name: "_22", scope: !17, file: !1, line: 303, type: !9)
!274 = !DILocation(line: 303, column: 12, scope: !17)
!275 = !DILocalVariable(name: "_23", scope: !17, file: !1, line: 304, type: !9)
!276 = !DILocation(line: 304, column: 12, scope: !17)
!277 = !DILocalVariable(name: "_24", scope: !17, file: !1, line: 305, type: !9)
!278 = !DILocation(line: 305, column: 12, scope: !17)
!279 = !DILocalVariable(name: "_27", scope: !17, file: !1, line: 307, type: !13)
!280 = !DILocation(line: 307, column: 2, scope: !17)
!281 = !DILocalVariable(name: "_27_size", scope: !17, file: !1, line: 307, type: !9)
!282 = !DILocation(line: 310, column: 2, scope: !17)
!283 = !DILocation(line: 314, column: 6, scope: !17)
!284 = !DILocation(line: 316, column: 2, scope: !17)
!285 = !DILocalVariable(name: "_8", scope: !17, file: !1, line: 289, type: !13)
!286 = !DILocation(line: 289, column: 13, scope: !17)
!287 = !DILocalVariable(name: "max", scope: !17, file: !1, line: 282, type: !13)
!288 = !DILocation(line: 282, column: 13, scope: !17)
!289 = !DILocation(line: 320, column: 9, scope: !290)
!290 = distinct !DILexicalBlock(scope: !17, file: !1, line: 320, column: 5)
!291 = !DILocation(line: 320, column: 5, scope: !17)
!292 = !DILocation(line: 322, column: 6, scope: !17)
!293 = !DILocation(line: 324, column: 8, scope: !17)
!294 = !DILocation(line: 329, column: 8, scope: !17)
!295 = !DILocation(line: 343, column: 7, scope: !296)
!296 = distinct !DILexicalBlock(scope: !297, file: !1, line: 343, column: 6)
!297 = distinct !DILexicalBlock(scope: !17, file: !1, line: 341, column: 13)
!298 = !DILocation(line: 343, column: 6, scope: !297)
!299 = !DILocation(line: 351, column: 8, scope: !300)
!300 = distinct !DILexicalBlock(scope: !301, file: !1, line: 351, column: 7)
!301 = distinct !DILexicalBlock(scope: !297, file: !1, line: 349, column: 14)
!302 = !DILocation(line: 351, column: 7, scope: !301)
!303 = !DILocation(line: 365, column: 9, scope: !301)
!304 = !DILocation(line: 353, column: 9, scope: !301)
!305 = !DILocation(line: 355, column: 11, scope: !301)
!306 = !DILocation(line: 357, column: 8, scope: !301)
!307 = !DILocation(line: 359, column: 11, scope: !301)
!308 = !DILocation(line: 376, column: 8, scope: !297)
!309 = !DILocation(line: 387, column: 2, scope: !17)
!310 = !DILocation(line: 388, column: 9, scope: !17)
!311 = !DILocation(line: 388, column: 15, scope: !17)
!312 = !DILocation(line: 388, column: 22, scope: !17)
!313 = !DILocation(line: 388, column: 28, scope: !17)
!314 = !DILocation(line: 388, column: 35, scope: !17)
!315 = !DILocation(line: 388, column: 41, scope: !17)
!316 = !DILocation(line: 388, column: 48, scope: !17)
!317 = !DILocation(line: 390, column: 2, scope: !17)
!318 = !DILocation(line: 394, column: 2, scope: !17)
!319 = !DILocation(line: 398, column: 2, scope: !17)
