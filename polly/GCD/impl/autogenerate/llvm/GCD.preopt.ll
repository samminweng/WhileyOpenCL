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
  br label %entry.split, !dbg !25

entry.split:                                      ; preds = %entry
  tail call void @llvm.dbg.value(metadata i64 %a, i64 0, metadata !26, metadata !27), !dbg !25
  tail call void @llvm.dbg.value(metadata i64 %b, i64 0, metadata !28, metadata !27), !dbg !29
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !30, metadata !27), !dbg !31
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !32, metadata !27), !dbg !33
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !34, metadata !27), !dbg !35
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !36, metadata !27), !dbg !37
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !38, metadata !27), !dbg !39
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !40, metadata !27), !dbg !41
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !32, metadata !27), !dbg !33
  %cmp = icmp eq i64 %a, 0, !dbg !42
  br i1 %cmp, label %return, label %while.body.preheader, !dbg !44

while.body.preheader:                             ; preds = %entry.split
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !34, metadata !27), !dbg !35
  %cmp12 = icmp sgt i64 %a, -1, !dbg !45
  br i1 %cmp12, label %blklab4.lr.ph, label %if.end3, !dbg !49

blklab4.lr.ph:                                    ; preds = %while.body.preheader
  br label %blklab4, !dbg !49

while.body.if.end3_crit_edge:                     ; preds = %if.end6
  br label %if.end3, !dbg !49

if.end3:                                          ; preds = %while.body.if.end3_crit_edge, %while.body.preheader
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !dbg !50
  %1 = tail call i64 @fwrite(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str, i64 0, i64 0), i64 4, i64 1, %struct._IO_FILE* %0) #6, !dbg !51
  tail call void @exit(i32 -1) #7, !dbg !52
  unreachable, !dbg !52

blklab4:                                          ; preds = %blklab4.lr.ph, %if.end6
  %a.addr.04 = phi i64 [ %a, %blklab4.lr.ph ], [ %a.addr.1, %if.end6 ]
  %b.addr.03 = phi i64 [ %b, %blklab4.lr.ph ], [ %b.addr.1, %if.end6 ]
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !36, metadata !27), !dbg !37
  %cmp4 = icmp eq i64 %b.addr.03, 0, !dbg !53
  br i1 %cmp4, label %return.loopexit, label %if.end6, !dbg !55

if.end6:                                          ; preds = %blklab4
  %cmp7 = icmp sgt i64 %a.addr.04, %b.addr.03, !dbg !56
  %sub10 = select i1 %cmp7, i64 0, i64 %a.addr.04, !dbg !58
  %b.addr.1 = sub nsw i64 %b.addr.03, %sub10, !dbg !58
  %sub = select i1 %cmp7, i64 %b.addr.03, i64 0, !dbg !58
  %a.addr.1 = sub nsw i64 %a.addr.04, %sub, !dbg !58
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !34, metadata !27), !dbg !35
  %cmp1 = icmp sgt i64 %a.addr.1, -1, !dbg !45
  br i1 %cmp1, label %blklab4, label %while.body.if.end3_crit_edge, !dbg !49

return.loopexit:                                  ; preds = %blklab4
  %a.addr.04.lcssa = phi i64 [ %a.addr.04, %blklab4 ]
  br label %return, !dbg !59

return:                                           ; preds = %return.loopexit, %entry.split
  %retval.0 = phi i64 [ %b, %entry.split ], [ %a.addr.04.lcssa, %return.loopexit ]
  ret i64 %retval.0, !dbg !59
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) #2

; Function Attrs: noreturn nounwind
declare void @exit(i32) #3

; Function Attrs: nounwind uwtable
define i64* @gcd_array(i64* %data, i64 %data_size, i64 %n) #0 !dbg !8 {
entry:
  br label %entry.split, !dbg !60

entry.split:                                      ; preds = %entry
  tail call void @llvm.dbg.value(metadata i64* %data, i64 0, metadata !61, metadata !27), !dbg !60
  tail call void @llvm.dbg.value(metadata i64 %data_size, i64 0, metadata !62, metadata !27), !dbg !60
  tail call void @llvm.dbg.value(metadata i64 %n, i64 0, metadata !63, metadata !27), !dbg !64
  tail call void @llvm.dbg.value(metadata i64* null, i64 0, metadata !65, metadata !27), !dbg !66
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !67, metadata !27), !dbg !66
  tail call void @llvm.dbg.value(metadata i64* null, i64 0, metadata !68, metadata !27), !dbg !69
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !70, metadata !27), !dbg !69
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !71, metadata !27), !dbg !72
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !73, metadata !27), !dbg !74
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !75, metadata !27), !dbg !76
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !77, metadata !27), !dbg !78
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !79, metadata !27), !dbg !80
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !81, metadata !27), !dbg !82
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !83, metadata !27), !dbg !84
  tail call void @llvm.dbg.value(metadata i64* null, i64 0, metadata !85, metadata !27), !dbg !86
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !87, metadata !27), !dbg !86
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !88, metadata !27), !dbg !89
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !90, metadata !27), !dbg !91
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !92, metadata !27), !dbg !93
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !94, metadata !27), !dbg !95
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !96, metadata !27), !dbg !97
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !98, metadata !27), !dbg !99
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !100, metadata !27), !dbg !101
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !102, metadata !27), !dbg !103
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !104, metadata !27), !dbg !105
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !106, metadata !27), !dbg !107
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !108, metadata !27), !dbg !109
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !110, metadata !27), !dbg !111
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !112, metadata !27), !dbg !113
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !114, metadata !27), !dbg !115
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !116, metadata !27), !dbg !117
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !118, metadata !27), !dbg !119
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !120, metadata !27), !dbg !121
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !122, metadata !27), !dbg !123
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !124, metadata !27), !dbg !125
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !126, metadata !27), !dbg !127
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !128, metadata !27), !dbg !129
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !130, metadata !27), !dbg !131
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !132, metadata !27), !dbg !133
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !134, metadata !27), !dbg !135
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !136, metadata !27), !dbg !137
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !138, metadata !27), !dbg !139
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !81, metadata !27), !dbg !82
  %mul = mul nsw i64 %n, %n, !dbg !140
  tail call void @llvm.dbg.value(metadata i64 %mul, i64 0, metadata !83, metadata !27), !dbg !84
  tail call void @llvm.dbg.value(metadata i64 %mul, i64 0, metadata !87, metadata !27), !dbg !86
  %conv1 = trunc i64 %mul to i32, !dbg !141
  %call = tail call i64* @gen1DArray(i32 0, i32 %conv1) #5, !dbg !141
  tail call void @llvm.dbg.value(metadata i64* %call, i64 0, metadata !85, metadata !27), !dbg !86
  tail call void @llvm.dbg.value(metadata i64 %mul, i64 0, metadata !70, metadata !27), !dbg !69
  tail call void @llvm.dbg.value(metadata i64* %call, i64 0, metadata !68, metadata !27), !dbg !69
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !88, metadata !27), !dbg !89
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !71, metadata !27), !dbg !72
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !90, metadata !27), !dbg !91
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !73, metadata !27), !dbg !74
  %cmp8 = icmp sgt i64 %n, 0, !dbg !142
  br i1 %cmp8, label %while.body4.preheader.lr.ph, label %blklab7, !dbg !145

while.body4.preheader.lr.ph:                      ; preds = %entry.split
  br label %while.body4.preheader, !dbg !145

while.body4.preheader:                            ; preds = %while.body4.preheader.lr.ph, %blklab8
  %i.09 = phi i64 [ 0, %while.body4.preheader.lr.ph ], [ %add44, %blklab8 ]
  %cmp55 = icmp sgt i64 %n, 0, !dbg !146
  br i1 %cmp55, label %if.end8.lr.ph, label %blklab8, !dbg !149

if.end8.lr.ph:                                    ; preds = %while.body4.preheader
  br label %if.end8, !dbg !149

if.end8:                                          ; preds = %if.end8.lr.ph, %blklab10
  %j.06 = phi i64 [ 0, %if.end8.lr.ph ], [ %add43, %blklab10 ]
  %arrayidx = getelementptr inbounds i64, i64* %data, i64 %i.09, !dbg !150
  %0 = load i64, i64* %arrayidx, align 8, !dbg !150
  tail call void @llvm.dbg.value(metadata i64 %0, i64 0, metadata !94, metadata !27), !dbg !95
  tail call void @llvm.dbg.value(metadata i64 %0, i64 0, metadata !77, metadata !27), !dbg !78
  %arrayidx9 = getelementptr inbounds i64, i64* %data, i64 %j.06, !dbg !151
  %1 = load i64, i64* %arrayidx9, align 8, !dbg !151
  tail call void @llvm.dbg.value(metadata i64 %1, i64 0, metadata !96, metadata !27), !dbg !97
  tail call void @llvm.dbg.value(metadata i64 %1, i64 0, metadata !79, metadata !27), !dbg !80
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !98, metadata !27), !dbg !99
  %cmp10 = icmp eq i64 %0, 0, !dbg !152
  br i1 %cmp10, label %if.end13, label %while.body21.preheader, !dbg !154

while.body21.preheader:                           ; preds = %if.end8
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !112, metadata !27), !dbg !113
  %cmp222 = icmp sgt i64 %0, -1, !dbg !155
  br i1 %cmp222, label %blklab15.lr.ph, label %while.body21.preheader.if.end25_crit_edge, !dbg !159

blklab15.lr.ph:                                   ; preds = %while.body21.preheader
  br label %blklab15, !dbg !159

if.end13:                                         ; preds = %if.end8
  %mul14 = mul nsw i64 %i.09, %n, !dbg !160
  tail call void @llvm.dbg.value(metadata i64 %mul14, i64 0, metadata !100, metadata !27), !dbg !101
  %add = add nsw i64 %j.06, %mul14, !dbg !161
  tail call void @llvm.dbg.value(metadata i64 %add, i64 0, metadata !102, metadata !27), !dbg !103
  %arrayidx15 = getelementptr inbounds i64, i64* %call, i64 %add, !dbg !162
  %2 = load i64, i64* %arrayidx15, align 8, !dbg !162
  tail call void @llvm.dbg.value(metadata i64 %2, i64 0, metadata !104, metadata !27), !dbg !105
  %add16 = add nsw i64 %2, %1, !dbg !163
  tail call void @llvm.dbg.value(metadata i64 %add16, i64 0, metadata !106, metadata !27), !dbg !107
  %mul17 = mul nsw i64 %i.09, %n, !dbg !164
  tail call void @llvm.dbg.value(metadata i64 %mul17, i64 0, metadata !108, metadata !27), !dbg !109
  %add18 = add nsw i64 %j.06, %mul17, !dbg !165
  tail call void @llvm.dbg.value(metadata i64 %add18, i64 0, metadata !110, metadata !27), !dbg !111
  %arrayidx19 = getelementptr inbounds i64, i64* %call, i64 %add18, !dbg !166
  store i64 %add16, i64* %arrayidx19, align 8, !dbg !167
  br label %blklab10, !dbg !168

while.body21.preheader.if.end25_crit_edge:        ; preds = %while.body21.preheader
  br label %if.end25, !dbg !159

while.body21.if.end25_crit_edge:                  ; preds = %if.end30
  br label %if.end25, !dbg !159

if.end25:                                         ; preds = %while.body21.if.end25_crit_edge, %while.body21.preheader.if.end25_crit_edge
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !dbg !169
  %4 = tail call i64 @fwrite(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str, i64 0, i64 0), i64 4, i64 1, %struct._IO_FILE* %3) #6, !dbg !170
  tail call void @exit(i32 -1) #7, !dbg !171
  unreachable, !dbg !171

blklab15:                                         ; preds = %blklab15.lr.ph, %if.end30
  %a.04 = phi i64 [ %0, %blklab15.lr.ph ], [ %a.1, %if.end30 ]
  %b.03 = phi i64 [ %1, %blklab15.lr.ph ], [ %b.1, %if.end30 ]
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !114, metadata !27), !dbg !115
  %cmp27 = icmp eq i64 %b.03, 0, !dbg !172
  br i1 %cmp27, label %blklab13, label %if.end30, !dbg !174

if.end30:                                         ; preds = %blklab15
  %cmp31 = icmp sgt i64 %a.04, %b.03, !dbg !175
  %sub35 = select i1 %cmp31, i64 0, i64 %a.04, !dbg !177
  %b.1 = sub nsw i64 %b.03, %sub35, !dbg !177
  %sub = select i1 %cmp31, i64 %b.03, i64 0, !dbg !177
  %a.1 = sub nsw i64 %a.04, %sub, !dbg !177
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !112, metadata !27), !dbg !113
  %cmp22 = icmp sgt i64 %a.1, -1, !dbg !155
  br i1 %cmp22, label %blklab15, label %while.body21.if.end25_crit_edge, !dbg !159

blklab13:                                         ; preds = %blklab15
  %a.04.lcssa = phi i64 [ %a.04, %blklab15 ]
  %mul36 = mul nsw i64 %i.09, %n, !dbg !178
  tail call void @llvm.dbg.value(metadata i64 %mul36, i64 0, metadata !120, metadata !27), !dbg !121
  %add37 = add nsw i64 %j.06, %mul36, !dbg !179
  tail call void @llvm.dbg.value(metadata i64 %add37, i64 0, metadata !122, metadata !27), !dbg !123
  %arrayidx38 = getelementptr inbounds i64, i64* %call, i64 %add37, !dbg !180
  %5 = load i64, i64* %arrayidx38, align 8, !dbg !180
  tail call void @llvm.dbg.value(metadata i64 %5, i64 0, metadata !124, metadata !27), !dbg !125
  %add39 = add nsw i64 %5, %a.04.lcssa, !dbg !181
  tail call void @llvm.dbg.value(metadata i64 %add39, i64 0, metadata !126, metadata !27), !dbg !127
  %mul40 = mul nsw i64 %i.09, %n, !dbg !182
  tail call void @llvm.dbg.value(metadata i64 %mul40, i64 0, metadata !128, metadata !27), !dbg !129
  %add41 = add nsw i64 %j.06, %mul40, !dbg !183
  tail call void @llvm.dbg.value(metadata i64 %add41, i64 0, metadata !130, metadata !27), !dbg !131
  %arrayidx42 = getelementptr inbounds i64, i64* %call, i64 %add41, !dbg !184
  store i64 %add39, i64* %arrayidx42, align 8, !dbg !185
  br label %blklab10, !dbg !184

blklab10:                                         ; preds = %if.end13, %blklab13
  tail call void @llvm.dbg.value(metadata i64 1, i64 0, metadata !132, metadata !27), !dbg !133
  tail call void @llvm.dbg.value(metadata i64 %add43, i64 0, metadata !134, metadata !27), !dbg !135
  tail call void @llvm.dbg.value(metadata i64 %add43, i64 0, metadata !75, metadata !27), !dbg !76
  %add43 = add nuw nsw i64 %j.06, 1, !dbg !186
  %cmp5 = icmp slt i64 %add43, %n, !dbg !146
  br i1 %cmp5, label %if.end8, label %while.body4.blklab8_crit_edge, !dbg !149

while.body4.blklab8_crit_edge:                    ; preds = %blklab10
  br label %blklab8, !dbg !149

blklab8:                                          ; preds = %while.body4.blklab8_crit_edge, %while.body4.preheader
  tail call void @llvm.dbg.value(metadata i64 1, i64 0, metadata !136, metadata !27), !dbg !137
  tail call void @llvm.dbg.value(metadata i64 %add44, i64 0, metadata !138, metadata !27), !dbg !139
  tail call void @llvm.dbg.value(metadata i64 %add44, i64 0, metadata !73, metadata !27), !dbg !74
  %add44 = add nuw nsw i64 %i.09, 1, !dbg !187
  %cmp = icmp slt i64 %add44, %n, !dbg !142
  br i1 %cmp, label %while.body4.preheader, label %while.body.blklab7_crit_edge, !dbg !145

while.body.blklab7_crit_edge:                     ; preds = %blklab8
  br label %blklab7, !dbg !145

blklab7:                                          ; preds = %while.body.blklab7_crit_edge, %entry.split
  ret i64* %call, !dbg !188
}

declare i64* @gen1DArray(i32, i32) #2

; Function Attrs: nounwind uwtable
define i64* @init(i64 %n) #0 !dbg !12 {
entry:
  br label %entry.split, !dbg !189

entry.split:                                      ; preds = %entry
  tail call void @llvm.dbg.value(metadata i64 %n, i64 0, metadata !190, metadata !27), !dbg !189
  tail call void @llvm.dbg.value(metadata i64* null, i64 0, metadata !191, metadata !27), !dbg !192
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !193, metadata !27), !dbg !192
  tail call void @llvm.dbg.value(metadata i64* null, i64 0, metadata !194, metadata !27), !dbg !195
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !196, metadata !27), !dbg !195
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !197, metadata !27), !dbg !198
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !199, metadata !27), !dbg !200
  tail call void @llvm.dbg.value(metadata i64* null, i64 0, metadata !201, metadata !27), !dbg !202
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !203, metadata !27), !dbg !202
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !204, metadata !27), !dbg !205
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !206, metadata !27), !dbg !207
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !208, metadata !27), !dbg !209
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !210, metadata !27), !dbg !211
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !212, metadata !27), !dbg !213
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !199, metadata !27), !dbg !200
  tail call void @llvm.dbg.value(metadata i64 %n, i64 0, metadata !203, metadata !27), !dbg !202
  %conv1 = trunc i64 %n to i32, !dbg !214
  %call = tail call i64* @gen1DArray(i32 0, i32 %conv1) #5, !dbg !214
  tail call void @llvm.dbg.value(metadata i64* %call, i64 0, metadata !201, metadata !27), !dbg !202
  tail call void @llvm.dbg.value(metadata i64 %n, i64 0, metadata !196, metadata !27), !dbg !195
  tail call void @llvm.dbg.value(metadata i64* %call, i64 0, metadata !194, metadata !27), !dbg !195
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !204, metadata !27), !dbg !205
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !197, metadata !27), !dbg !198
  %cmp1 = icmp sgt i64 %n, 0, !dbg !215
  br i1 %cmp1, label %if.end.lr.ph, label %blklab18, !dbg !218

if.end.lr.ph:                                     ; preds = %entry.split
  br label %if.end, !dbg !218

if.end:                                           ; preds = %if.end.lr.ph, %if.end
  %i.02 = phi i64 [ 0, %if.end.lr.ph ], [ %add4, %if.end ]
  %arrayidx = getelementptr inbounds i64, i64* %call, i64 %i.02, !dbg !219
  %0 = load i64, i64* %arrayidx, align 8, !dbg !219
  tail call void @llvm.dbg.value(metadata i64 %0, i64 0, metadata !206, metadata !27), !dbg !207
  %add = add nsw i64 %0, %i.02, !dbg !220
  tail call void @llvm.dbg.value(metadata i64 %add, i64 0, metadata !208, metadata !27), !dbg !209
  %arrayidx3 = getelementptr inbounds i64, i64* %call, i64 %i.02, !dbg !221
  store i64 %add, i64* %arrayidx3, align 8, !dbg !222
  tail call void @llvm.dbg.value(metadata i64 1, i64 0, metadata !210, metadata !27), !dbg !211
  tail call void @llvm.dbg.value(metadata i64 %add4, i64 0, metadata !212, metadata !27), !dbg !213
  tail call void @llvm.dbg.value(metadata i64 %add4, i64 0, metadata !197, metadata !27), !dbg !198
  %add4 = add nuw nsw i64 %i.02, 1, !dbg !223
  %exitcond = icmp ne i64 %add4, %n, !dbg !218
  br i1 %exitcond, label %if.end, label %while.body.blklab18_crit_edge, !dbg !218

while.body.blklab18_crit_edge:                    ; preds = %if.end
  br label %blklab18, !dbg !218

blklab18:                                         ; preds = %while.body.blklab18_crit_edge, %entry.split
  ret i64* %call, !dbg !224
}

; Function Attrs: nounwind uwtable
define i32 @main(i32 %argc, i8** %args) #0 !dbg !15 {
entry:
  br label %entry.split, !dbg !225

entry.split:                                      ; preds = %entry
  tail call void @llvm.dbg.value(metadata i32 %argc, i64 0, metadata !226, metadata !27), !dbg !225
  tail call void @llvm.dbg.value(metadata i8** %args, i64 0, metadata !227, metadata !27), !dbg !228
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !229, metadata !27), !dbg !230
  tail call void @llvm.dbg.value(metadata i64* null, i64 0, metadata !231, metadata !27), !dbg !232
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !233, metadata !27), !dbg !232
  tail call void @llvm.dbg.value(metadata i64* null, i64 0, metadata !234, metadata !27), !dbg !235
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !236, metadata !27), !dbg !235
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !237, metadata !27), !dbg !238
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !239, metadata !27), !dbg !240
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !241, metadata !27), !dbg !242
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !243, metadata !27), !dbg !244
  tail call void @llvm.dbg.value(metadata i64* null, i64 0, metadata !245, metadata !27), !dbg !246
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !247, metadata !27), !dbg !246
  tail call void @llvm.dbg.value(metadata i64* null, i64 0, metadata !248, metadata !27), !dbg !249
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !250, metadata !27), !dbg !249
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !251, metadata !27), !dbg !252
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !253, metadata !27), !dbg !254
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !255, metadata !27), !dbg !256
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !257, metadata !27), !dbg !258
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !259, metadata !27), !dbg !260
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !261, metadata !27), !dbg !262
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !263, metadata !27), !dbg !264
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !265, metadata !27), !dbg !266
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !267, metadata !27), !dbg !268
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !269, metadata !27), !dbg !270
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !271, metadata !27), !dbg !272
  tail call void @llvm.dbg.value(metadata i64* null, i64 0, metadata !273, metadata !27), !dbg !274
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !275, metadata !27), !dbg !274
  tail call void @llvm.dbg.value(metadata i64 1000, i64 0, metadata !243, metadata !27), !dbg !244
  tail call void @llvm.dbg.value(metadata i64 1000, i64 0, metadata !229, metadata !27), !dbg !230
  %call = tail call i64* @init(i64 1000), !dbg !276
  tail call void @llvm.dbg.value(metadata i64* %call, i64 0, metadata !245, metadata !27), !dbg !246
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !233, metadata !27), !dbg !232
  tail call void @llvm.dbg.value(metadata i64* %call, i64 0, metadata !231, metadata !27), !dbg !232
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !250, metadata !27), !dbg !249
  %call1 = tail call i64* @gcd_array(i64* %call, i64 0, i64 1000), !dbg !277
  tail call void @llvm.dbg.value(metadata i64* %call1, i64 0, metadata !248, metadata !27), !dbg !249
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !236, metadata !27), !dbg !235
  tail call void @llvm.dbg.value(metadata i64* %call1, i64 0, metadata !234, metadata !27), !dbg !235
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !251, metadata !27), !dbg !252
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !237, metadata !27), !dbg !238
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !253, metadata !27), !dbg !254
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !239, metadata !27), !dbg !240
  br label %while.body3.preheader, !dbg !278

while.body3.preheader:                            ; preds = %entry.split, %blklab21
  %sum.04 = phi i64 [ 0, %entry.split ], [ %add7.lcssa, %blklab21 ]
  %i.03 = phi i64 [ 0, %entry.split ], [ %add9, %blklab21 ]
  br label %blklab23, !dbg !280

blklab23:                                         ; preds = %while.body3.preheader, %blklab23
  %sum.12 = phi i64 [ %sum.04, %while.body3.preheader ], [ %add7, %blklab23 ]
  %j.01 = phi i64 [ 0, %while.body3.preheader ], [ %add8, %blklab23 ]
  tail call void @llvm.dbg.value(metadata i64 %mul, i64 0, metadata !257, metadata !27), !dbg !258
  tail call void @llvm.dbg.value(metadata i64 %add, i64 0, metadata !259, metadata !27), !dbg !260
  tail call void @llvm.dbg.value(metadata i64 %0, i64 0, metadata !261, metadata !27), !dbg !262
  tail call void @llvm.dbg.value(metadata i64 %add7, i64 0, metadata !263, metadata !27), !dbg !264
  tail call void @llvm.dbg.value(metadata i64 %add7, i64 0, metadata !237, metadata !27), !dbg !238
  tail call void @llvm.dbg.value(metadata i64 1, i64 0, metadata !265, metadata !27), !dbg !266
  tail call void @llvm.dbg.value(metadata i64 %add8, i64 0, metadata !267, metadata !27), !dbg !268
  tail call void @llvm.dbg.value(metadata i64 %add8, i64 0, metadata !241, metadata !27), !dbg !242
  %add8 = add nuw nsw i64 %j.01, 1, !dbg !282
  %mul = mul nuw nsw i64 %i.03, 1000, !dbg !283
  %add = add nuw nsw i64 %j.01, %mul, !dbg !284
  %arrayidx = getelementptr inbounds i64, i64* %call1, i64 %add, !dbg !285
  %0 = load i64, i64* %arrayidx, align 8, !dbg !285
  %add7 = add nsw i64 %0, %sum.12, !dbg !286
  %exitcond = icmp eq i64 %add8, 1000, !dbg !280
  br i1 %exitcond, label %blklab21, label %blklab23, !dbg !280

blklab21:                                         ; preds = %blklab23
  %add7.lcssa = phi i64 [ %add7, %blklab23 ]
  tail call void @llvm.dbg.value(metadata i64 1, i64 0, metadata !269, metadata !27), !dbg !270
  tail call void @llvm.dbg.value(metadata i64 %add9, i64 0, metadata !271, metadata !27), !dbg !272
  tail call void @llvm.dbg.value(metadata i64 %add9, i64 0, metadata !239, metadata !27), !dbg !240
  %add9 = add nuw nsw i64 %i.03, 1, !dbg !287
  %exitcond5 = icmp eq i64 %add9, 1000, !dbg !278
  br i1 %exitcond5, label %blklab20, label %while.body3.preheader, !dbg !278

blklab20:                                         ; preds = %blklab21
  %add7.lcssa.lcssa = phi i64 [ %add7.lcssa, %blklab21 ]
  tail call void @llvm.dbg.value(metadata i64 4, i64 0, metadata !275, metadata !27), !dbg !274
  %call10 = tail call noalias i8* @malloc(i64 32) #5, !dbg !288
  %1 = bitcast i8* %call10 to i64*, !dbg !288
  tail call void @llvm.dbg.value(metadata i64* %1, i64 0, metadata !273, metadata !27), !dbg !274
  store i64 83, i64* %1, align 8, !dbg !289
  %arrayidx12 = getelementptr inbounds i8, i8* %call10, i64 8, !dbg !290
  %2 = bitcast i8* %arrayidx12 to i64*, !dbg !290
  store i64 85, i64* %2, align 8, !dbg !291
  %arrayidx13 = getelementptr inbounds i8, i8* %call10, i64 16, !dbg !292
  %3 = bitcast i8* %arrayidx13 to i64*, !dbg !292
  store i64 77, i64* %3, align 8, !dbg !293
  %arrayidx14 = getelementptr inbounds i8, i8* %call10, i64 24, !dbg !294
  %4 = bitcast i8* %arrayidx14 to i64*, !dbg !294
  store i64 58, i64* %4, align 8, !dbg !295
  tail call void @printf_s(i64* %1, i64 4) #5, !dbg !296
  %call15 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.1, i64 0, i64 0), i64 %add7.lcssa.lcssa) #5, !dbg !297
  tail call void @exit(i32 0) #7, !dbg !298
  unreachable, !dbg !298
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
!llvm.module.flags = !{!22, !23}
!llvm.ident = !{!24}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 3.9.0 (http://llvm.org/git/clang.git cf7bc8edf8cccb1b5de656c403cb55ad44132e98) (http://llvm.org/git/llvm.git 22706dc4c03305692f494d0e42a6de1050d0ec62)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, subprograms: !3)
!1 = !DIFile(filename: "GCD.c", directory: "/home/sam/workspace/WhileyOpenCL/polly/GCD/impl/autogenerate")
!2 = !{}
!3 = !{!4, !8, !12, !15}
!4 = distinct !DISubprogram(name: "gcd", scope: !1, file: !1, line: 2, type: !5, isLocal: false, isDefinition: true, scopeLine: 2, flags: DIFlagPrototyped, isOptimized: false, variables: !2)
!5 = !DISubroutineType(types: !6)
!6 = !{!7, !7, !7}
!7 = !DIBasicType(name: "long long int", size: 64, align: 64, encoding: DW_ATE_signed)
!8 = distinct !DISubprogram(name: "gcd_array", scope: !1, file: !1, line: 62, type: !9, isLocal: false, isDefinition: true, scopeLine: 62, flags: DIFlagPrototyped, isOptimized: false, variables: !2)
!9 = !DISubroutineType(types: !10)
!10 = !{!11, !11, !7, !7}
!11 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !7, size: 64, align: 64)
!12 = distinct !DISubprogram(name: "init", scope: !1, file: !1, line: 240, type: !13, isLocal: false, isDefinition: true, scopeLine: 240, flags: DIFlagPrototyped, isOptimized: false, variables: !2)
!13 = !DISubroutineType(types: !14)
!14 = !{!11, !7}
!15 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 287, type: !16, isLocal: false, isDefinition: true, scopeLine: 287, flags: DIFlagPrototyped, isOptimized: false, variables: !2)
!16 = !DISubroutineType(types: !17)
!17 = !{!18, !18, !19}
!18 = !DIBasicType(name: "int", size: 32, align: 32, encoding: DW_ATE_signed)
!19 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !20, size: 64, align: 64)
!20 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !21, size: 64, align: 64)
!21 = !DIBasicType(name: "char", size: 8, align: 8, encoding: DW_ATE_signed_char)
!22 = !{i32 2, !"Dwarf Version", i32 4}
!23 = !{i32 2, !"Debug Info Version", i32 3}
!24 = !{!"clang version 3.9.0 (http://llvm.org/git/clang.git cf7bc8edf8cccb1b5de656c403cb55ad44132e98) (http://llvm.org/git/llvm.git 22706dc4c03305692f494d0e42a6de1050d0ec62)"}
!25 = !DILocation(line: 2, column: 25, scope: !4)
!26 = !DILocalVariable(name: "a", arg: 1, scope: !4, file: !1, line: 2, type: !7)
!27 = !DIExpression()
!28 = !DILocalVariable(name: "b", arg: 2, scope: !4, file: !1, line: 2, type: !7)
!29 = !DILocation(line: 2, column: 38, scope: !4)
!30 = !DILocalVariable(name: "_2", scope: !4, file: !1, line: 3, type: !7)
!31 = !DILocation(line: 3, column: 12, scope: !4)
!32 = !DILocalVariable(name: "_3", scope: !4, file: !1, line: 4, type: !7)
!33 = !DILocation(line: 4, column: 12, scope: !4)
!34 = !DILocalVariable(name: "_4", scope: !4, file: !1, line: 5, type: !7)
!35 = !DILocation(line: 5, column: 12, scope: !4)
!36 = !DILocalVariable(name: "_5", scope: !4, file: !1, line: 6, type: !7)
!37 = !DILocation(line: 6, column: 12, scope: !4)
!38 = !DILocalVariable(name: "_6", scope: !4, file: !1, line: 7, type: !7)
!39 = !DILocation(line: 7, column: 12, scope: !4)
!40 = !DILocalVariable(name: "_7", scope: !4, file: !1, line: 8, type: !7)
!41 = !DILocation(line: 8, column: 12, scope: !4)
!42 = !DILocation(line: 12, column: 6, scope: !43)
!43 = distinct !DILexicalBlock(scope: !4, file: !1, line: 12, column: 5)
!44 = !DILocation(line: 12, column: 5, scope: !4)
!45 = !DILocation(line: 24, column: 8, scope: !46)
!46 = distinct !DILexicalBlock(scope: !47, file: !1, line: 24, column: 7)
!47 = distinct !DILexicalBlock(scope: !48, file: !1, line: 20, column: 3)
!48 = distinct !DILexicalBlock(scope: !4, file: !1, line: 18, column: 13)
!49 = !DILocation(line: 24, column: 7, scope: !47)
!50 = !DILocation(line: 26, column: 12, scope: !47)
!51 = !DILocation(line: 26, column: 4, scope: !47)
!52 = !DILocation(line: 27, column: 4, scope: !47)
!53 = !DILocation(line: 35, column: 7, scope: !54)
!54 = distinct !DILexicalBlock(scope: !48, file: !1, line: 35, column: 6)
!55 = !DILocation(line: 35, column: 6, scope: !48)
!56 = !DILocation(line: 37, column: 7, scope: !57)
!57 = distinct !DILexicalBlock(scope: !48, file: !1, line: 37, column: 6)
!58 = !DILocation(line: 37, column: 6, scope: !48)
!59 = !DILocation(line: 60, column: 1, scope: !4)
!60 = !DILocation(line: 62, column: 22, scope: !8)
!61 = !DILocalVariable(name: "data", arg: 1, scope: !8, file: !1, line: 62, type: !11)
!62 = !DILocalVariable(name: "data_size", arg: 2, scope: !8, file: !1, line: 62, type: !7)
!63 = !DILocalVariable(name: "n", arg: 3, scope: !8, file: !1, line: 62, type: !7)
!64 = !DILocation(line: 62, column: 59, scope: !8)
!65 = !DILocalVariable(name: "_2", scope: !8, file: !1, line: 63, type: !11)
!66 = !DILocation(line: 63, column: 2, scope: !8)
!67 = !DILocalVariable(name: "_2_size", scope: !8, file: !1, line: 63, type: !7)
!68 = !DILocalVariable(name: "gcds", scope: !8, file: !1, line: 64, type: !11)
!69 = !DILocation(line: 64, column: 2, scope: !8)
!70 = !DILocalVariable(name: "gcds_size", scope: !8, file: !1, line: 64, type: !7)
!71 = !DILocalVariable(name: "sum", scope: !8, file: !1, line: 65, type: !7)
!72 = !DILocation(line: 65, column: 12, scope: !8)
!73 = !DILocalVariable(name: "i", scope: !8, file: !1, line: 66, type: !7)
!74 = !DILocation(line: 66, column: 12, scope: !8)
!75 = !DILocalVariable(name: "j", scope: !8, file: !1, line: 67, type: !7)
!76 = !DILocation(line: 67, column: 12, scope: !8)
!77 = !DILocalVariable(name: "a", scope: !8, file: !1, line: 68, type: !7)
!78 = !DILocation(line: 68, column: 12, scope: !8)
!79 = !DILocalVariable(name: "b", scope: !8, file: !1, line: 69, type: !7)
!80 = !DILocation(line: 69, column: 12, scope: !8)
!81 = !DILocalVariable(name: "_9", scope: !8, file: !1, line: 70, type: !7)
!82 = !DILocation(line: 70, column: 12, scope: !8)
!83 = !DILocalVariable(name: "_10", scope: !8, file: !1, line: 71, type: !7)
!84 = !DILocation(line: 71, column: 12, scope: !8)
!85 = !DILocalVariable(name: "_11", scope: !8, file: !1, line: 72, type: !11)
!86 = !DILocation(line: 72, column: 2, scope: !8)
!87 = !DILocalVariable(name: "_11_size", scope: !8, file: !1, line: 72, type: !7)
!88 = !DILocalVariable(name: "_12", scope: !8, file: !1, line: 73, type: !7)
!89 = !DILocation(line: 73, column: 12, scope: !8)
!90 = !DILocalVariable(name: "_13", scope: !8, file: !1, line: 74, type: !7)
!91 = !DILocation(line: 74, column: 12, scope: !8)
!92 = !DILocalVariable(name: "_14", scope: !8, file: !1, line: 75, type: !7)
!93 = !DILocation(line: 75, column: 12, scope: !8)
!94 = !DILocalVariable(name: "_15", scope: !8, file: !1, line: 76, type: !7)
!95 = !DILocation(line: 76, column: 12, scope: !8)
!96 = !DILocalVariable(name: "_16", scope: !8, file: !1, line: 77, type: !7)
!97 = !DILocation(line: 77, column: 12, scope: !8)
!98 = !DILocalVariable(name: "_17", scope: !8, file: !1, line: 78, type: !7)
!99 = !DILocation(line: 78, column: 12, scope: !8)
!100 = !DILocalVariable(name: "_18", scope: !8, file: !1, line: 79, type: !7)
!101 = !DILocation(line: 79, column: 12, scope: !8)
!102 = !DILocalVariable(name: "_19", scope: !8, file: !1, line: 80, type: !7)
!103 = !DILocation(line: 80, column: 12, scope: !8)
!104 = !DILocalVariable(name: "_20", scope: !8, file: !1, line: 81, type: !7)
!105 = !DILocation(line: 81, column: 12, scope: !8)
!106 = !DILocalVariable(name: "_21", scope: !8, file: !1, line: 82, type: !7)
!107 = !DILocation(line: 82, column: 12, scope: !8)
!108 = !DILocalVariable(name: "_22", scope: !8, file: !1, line: 83, type: !7)
!109 = !DILocation(line: 83, column: 12, scope: !8)
!110 = !DILocalVariable(name: "_23", scope: !8, file: !1, line: 84, type: !7)
!111 = !DILocation(line: 84, column: 12, scope: !8)
!112 = !DILocalVariable(name: "_24", scope: !8, file: !1, line: 85, type: !7)
!113 = !DILocation(line: 85, column: 12, scope: !8)
!114 = !DILocalVariable(name: "_25", scope: !8, file: !1, line: 86, type: !7)
!115 = !DILocation(line: 86, column: 12, scope: !8)
!116 = !DILocalVariable(name: "_26", scope: !8, file: !1, line: 87, type: !7)
!117 = !DILocation(line: 87, column: 12, scope: !8)
!118 = !DILocalVariable(name: "_27", scope: !8, file: !1, line: 88, type: !7)
!119 = !DILocation(line: 88, column: 12, scope: !8)
!120 = !DILocalVariable(name: "_28", scope: !8, file: !1, line: 89, type: !7)
!121 = !DILocation(line: 89, column: 12, scope: !8)
!122 = !DILocalVariable(name: "_29", scope: !8, file: !1, line: 90, type: !7)
!123 = !DILocation(line: 90, column: 12, scope: !8)
!124 = !DILocalVariable(name: "_30", scope: !8, file: !1, line: 91, type: !7)
!125 = !DILocation(line: 91, column: 12, scope: !8)
!126 = !DILocalVariable(name: "_31", scope: !8, file: !1, line: 92, type: !7)
!127 = !DILocation(line: 92, column: 12, scope: !8)
!128 = !DILocalVariable(name: "_32", scope: !8, file: !1, line: 93, type: !7)
!129 = !DILocation(line: 93, column: 12, scope: !8)
!130 = !DILocalVariable(name: "_33", scope: !8, file: !1, line: 94, type: !7)
!131 = !DILocation(line: 94, column: 12, scope: !8)
!132 = !DILocalVariable(name: "_34", scope: !8, file: !1, line: 95, type: !7)
!133 = !DILocation(line: 95, column: 12, scope: !8)
!134 = !DILocalVariable(name: "_35", scope: !8, file: !1, line: 96, type: !7)
!135 = !DILocation(line: 96, column: 12, scope: !8)
!136 = !DILocalVariable(name: "_36", scope: !8, file: !1, line: 97, type: !7)
!137 = !DILocation(line: 97, column: 12, scope: !8)
!138 = !DILocalVariable(name: "_37", scope: !8, file: !1, line: 98, type: !7)
!139 = !DILocation(line: 98, column: 12, scope: !8)
!140 = !DILocation(line: 102, column: 7, scope: !8)
!141 = !DILocation(line: 104, column: 2, scope: !8)
!142 = !DILocation(line: 118, column: 7, scope: !143)
!143 = distinct !DILexicalBlock(scope: !144, file: !1, line: 118, column: 6)
!144 = distinct !DILexicalBlock(scope: !8, file: !1, line: 116, column: 13)
!145 = !DILocation(line: 118, column: 6, scope: !144)
!146 = !DILocation(line: 126, column: 8, scope: !147)
!147 = distinct !DILexicalBlock(scope: !148, file: !1, line: 126, column: 7)
!148 = distinct !DILexicalBlock(scope: !144, file: !1, line: 124, column: 14)
!149 = !DILocation(line: 126, column: 7, scope: !148)
!150 = !DILocation(line: 128, column: 8, scope: !148)
!151 = !DILocation(line: 132, column: 8, scope: !148)
!152 = !DILocation(line: 138, column: 8, scope: !153)
!153 = distinct !DILexicalBlock(scope: !148, file: !1, line: 138, column: 7)
!154 = !DILocation(line: 138, column: 7, scope: !148)
!155 = !DILocation(line: 164, column: 10, scope: !156)
!156 = distinct !DILexicalBlock(scope: !157, file: !1, line: 164, column: 9)
!157 = distinct !DILexicalBlock(scope: !158, file: !1, line: 160, column: 5)
!158 = distinct !DILexicalBlock(scope: !148, file: !1, line: 158, column: 15)
!159 = !DILocation(line: 164, column: 9, scope: !157)
!160 = !DILocation(line: 140, column: 9, scope: !148)
!161 = !DILocation(line: 142, column: 11, scope: !148)
!162 = !DILocation(line: 144, column: 8, scope: !148)
!163 = !DILocation(line: 146, column: 11, scope: !148)
!164 = !DILocation(line: 148, column: 9, scope: !148)
!165 = !DILocation(line: 150, column: 11, scope: !148)
!166 = !DILocation(line: 152, column: 4, scope: !148)
!167 = !DILocation(line: 152, column: 14, scope: !148)
!168 = !DILocation(line: 154, column: 4, scope: !148)
!169 = !DILocation(line: 166, column: 14, scope: !157)
!170 = !DILocation(line: 166, column: 6, scope: !157)
!171 = !DILocation(line: 167, column: 6, scope: !157)
!172 = !DILocation(line: 175, column: 9, scope: !173)
!173 = distinct !DILexicalBlock(scope: !158, file: !1, line: 175, column: 8)
!174 = !DILocation(line: 175, column: 8, scope: !158)
!175 = !DILocation(line: 177, column: 9, scope: !176)
!176 = distinct !DILexicalBlock(scope: !158, file: !1, line: 177, column: 8)
!177 = !DILocation(line: 177, column: 8, scope: !158)
!178 = !DILocation(line: 198, column: 9, scope: !148)
!179 = !DILocation(line: 200, column: 11, scope: !148)
!180 = !DILocation(line: 202, column: 8, scope: !148)
!181 = !DILocation(line: 204, column: 11, scope: !148)
!182 = !DILocation(line: 206, column: 9, scope: !148)
!183 = !DILocation(line: 208, column: 11, scope: !148)
!184 = !DILocation(line: 210, column: 4, scope: !148)
!185 = !DILocation(line: 210, column: 14, scope: !148)
!186 = !DILocation(line: 216, column: 9, scope: !148)
!187 = !DILocation(line: 227, column: 8, scope: !144)
!188 = !DILocation(line: 236, column: 2, scope: !8)
!189 = !DILocation(line: 240, column: 27, scope: !12)
!190 = !DILocalVariable(name: "n", arg: 1, scope: !12, file: !1, line: 240, type: !7)
!191 = !DILocalVariable(name: "_1", scope: !12, file: !1, line: 241, type: !11)
!192 = !DILocation(line: 241, column: 2, scope: !12)
!193 = !DILocalVariable(name: "_1_size", scope: !12, file: !1, line: 241, type: !7)
!194 = !DILocalVariable(name: "data", scope: !12, file: !1, line: 242, type: !11)
!195 = !DILocation(line: 242, column: 2, scope: !12)
!196 = !DILocalVariable(name: "data_size", scope: !12, file: !1, line: 242, type: !7)
!197 = !DILocalVariable(name: "i", scope: !12, file: !1, line: 243, type: !7)
!198 = !DILocation(line: 243, column: 12, scope: !12)
!199 = !DILocalVariable(name: "_4", scope: !12, file: !1, line: 244, type: !7)
!200 = !DILocation(line: 244, column: 12, scope: !12)
!201 = !DILocalVariable(name: "_5", scope: !12, file: !1, line: 245, type: !11)
!202 = !DILocation(line: 245, column: 2, scope: !12)
!203 = !DILocalVariable(name: "_5_size", scope: !12, file: !1, line: 245, type: !7)
!204 = !DILocalVariable(name: "_6", scope: !12, file: !1, line: 246, type: !7)
!205 = !DILocation(line: 246, column: 12, scope: !12)
!206 = !DILocalVariable(name: "_7", scope: !12, file: !1, line: 247, type: !7)
!207 = !DILocation(line: 247, column: 12, scope: !12)
!208 = !DILocalVariable(name: "_8", scope: !12, file: !1, line: 248, type: !7)
!209 = !DILocation(line: 248, column: 12, scope: !12)
!210 = !DILocalVariable(name: "_9", scope: !12, file: !1, line: 249, type: !7)
!211 = !DILocation(line: 249, column: 12, scope: !12)
!212 = !DILocalVariable(name: "_10", scope: !12, file: !1, line: 250, type: !7)
!213 = !DILocation(line: 250, column: 12, scope: !12)
!214 = !DILocation(line: 254, column: 2, scope: !12)
!215 = !DILocation(line: 264, column: 7, scope: !216)
!216 = distinct !DILexicalBlock(scope: !217, file: !1, line: 264, column: 6)
!217 = distinct !DILexicalBlock(scope: !12, file: !1, line: 262, column: 13)
!218 = !DILocation(line: 264, column: 6, scope: !217)
!219 = !DILocation(line: 266, column: 6, scope: !217)
!220 = !DILocation(line: 268, column: 8, scope: !217)
!221 = !DILocation(line: 270, column: 3, scope: !217)
!222 = !DILocation(line: 270, column: 11, scope: !217)
!223 = !DILocation(line: 274, column: 8, scope: !217)
!224 = !DILocation(line: 283, column: 2, scope: !12)
!225 = !DILocation(line: 287, column: 14, scope: !15)
!226 = !DILocalVariable(name: "argc", arg: 1, scope: !15, file: !1, line: 287, type: !18)
!227 = !DILocalVariable(name: "args", arg: 2, scope: !15, file: !1, line: 287, type: !19)
!228 = !DILocation(line: 287, column: 27, scope: !15)
!229 = !DILocalVariable(name: "n", scope: !15, file: !1, line: 288, type: !7)
!230 = !DILocation(line: 288, column: 12, scope: !15)
!231 = !DILocalVariable(name: "data", scope: !15, file: !1, line: 289, type: !11)
!232 = !DILocation(line: 289, column: 2, scope: !15)
!233 = !DILocalVariable(name: "data_size", scope: !15, file: !1, line: 289, type: !7)
!234 = !DILocalVariable(name: "gcds", scope: !15, file: !1, line: 290, type: !11)
!235 = !DILocation(line: 290, column: 2, scope: !15)
!236 = !DILocalVariable(name: "gcds_size", scope: !15, file: !1, line: 290, type: !7)
!237 = !DILocalVariable(name: "sum", scope: !15, file: !1, line: 291, type: !7)
!238 = !DILocation(line: 291, column: 12, scope: !15)
!239 = !DILocalVariable(name: "i", scope: !15, file: !1, line: 292, type: !7)
!240 = !DILocation(line: 292, column: 12, scope: !15)
!241 = !DILocalVariable(name: "j", scope: !15, file: !1, line: 293, type: !7)
!242 = !DILocation(line: 293, column: 12, scope: !15)
!243 = !DILocalVariable(name: "_7", scope: !15, file: !1, line: 294, type: !7)
!244 = !DILocation(line: 294, column: 12, scope: !15)
!245 = !DILocalVariable(name: "_8", scope: !15, file: !1, line: 295, type: !11)
!246 = !DILocation(line: 295, column: 2, scope: !15)
!247 = !DILocalVariable(name: "_8_size", scope: !15, file: !1, line: 295, type: !7)
!248 = !DILocalVariable(name: "_9", scope: !15, file: !1, line: 296, type: !11)
!249 = !DILocation(line: 296, column: 2, scope: !15)
!250 = !DILocalVariable(name: "_9_size", scope: !15, file: !1, line: 296, type: !7)
!251 = !DILocalVariable(name: "_10", scope: !15, file: !1, line: 297, type: !7)
!252 = !DILocation(line: 297, column: 12, scope: !15)
!253 = !DILocalVariable(name: "_11", scope: !15, file: !1, line: 298, type: !7)
!254 = !DILocation(line: 298, column: 12, scope: !15)
!255 = !DILocalVariable(name: "_12", scope: !15, file: !1, line: 299, type: !7)
!256 = !DILocation(line: 299, column: 12, scope: !15)
!257 = !DILocalVariable(name: "_13", scope: !15, file: !1, line: 300, type: !7)
!258 = !DILocation(line: 300, column: 12, scope: !15)
!259 = !DILocalVariable(name: "_14", scope: !15, file: !1, line: 301, type: !7)
!260 = !DILocation(line: 301, column: 12, scope: !15)
!261 = !DILocalVariable(name: "_15", scope: !15, file: !1, line: 302, type: !7)
!262 = !DILocation(line: 302, column: 12, scope: !15)
!263 = !DILocalVariable(name: "_16", scope: !15, file: !1, line: 303, type: !7)
!264 = !DILocation(line: 303, column: 12, scope: !15)
!265 = !DILocalVariable(name: "_17", scope: !15, file: !1, line: 304, type: !7)
!266 = !DILocation(line: 304, column: 12, scope: !15)
!267 = !DILocalVariable(name: "_18", scope: !15, file: !1, line: 305, type: !7)
!268 = !DILocation(line: 305, column: 12, scope: !15)
!269 = !DILocalVariable(name: "_19", scope: !15, file: !1, line: 306, type: !7)
!270 = !DILocation(line: 306, column: 12, scope: !15)
!271 = !DILocalVariable(name: "_20", scope: !15, file: !1, line: 307, type: !7)
!272 = !DILocation(line: 307, column: 12, scope: !15)
!273 = !DILocalVariable(name: "_23", scope: !15, file: !1, line: 309, type: !11)
!274 = !DILocation(line: 309, column: 2, scope: !15)
!275 = !DILocalVariable(name: "_23_size", scope: !15, file: !1, line: 309, type: !7)
!276 = !DILocation(line: 316, column: 7, scope: !15)
!277 = !DILocation(line: 321, column: 7, scope: !15)
!278 = !DILocation(line: 335, column: 6, scope: !279)
!279 = distinct !DILexicalBlock(scope: !15, file: !1, line: 333, column: 13)
!280 = !DILocation(line: 343, column: 7, scope: !281)
!281 = distinct !DILexicalBlock(scope: !279, file: !1, line: 341, column: 14)
!282 = !DILocation(line: 357, column: 9, scope: !281)
!283 = !DILocation(line: 345, column: 9, scope: !281)
!284 = !DILocation(line: 347, column: 11, scope: !281)
!285 = !DILocation(line: 349, column: 8, scope: !281)
!286 = !DILocation(line: 351, column: 11, scope: !281)
!287 = !DILocation(line: 368, column: 8, scope: !279)
!288 = !DILocation(line: 379, column: 2, scope: !15)
!289 = !DILocation(line: 380, column: 9, scope: !15)
!290 = !DILocation(line: 380, column: 15, scope: !15)
!291 = !DILocation(line: 380, column: 22, scope: !15)
!292 = !DILocation(line: 380, column: 28, scope: !15)
!293 = !DILocation(line: 380, column: 35, scope: !15)
!294 = !DILocation(line: 380, column: 41, scope: !15)
!295 = !DILocation(line: 380, column: 48, scope: !15)
!296 = !DILocation(line: 382, column: 2, scope: !15)
!297 = !DILocation(line: 386, column: 2, scope: !15)
!298 = !DILocation(line: 388, column: 2, scope: !15)
