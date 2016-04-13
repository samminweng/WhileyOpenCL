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
  br label %entry.split, !dbg !28

entry.split:                                      ; preds = %entry
  tail call void @llvm.dbg.value(metadata i64 %a, i64 0, metadata !29, metadata !30), !dbg !28
  tail call void @llvm.dbg.value(metadata i64 %b, i64 0, metadata !31, metadata !30), !dbg !32
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !33, metadata !30), !dbg !34
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !35, metadata !30), !dbg !36
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !37, metadata !30), !dbg !38
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !39, metadata !30), !dbg !40
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !41, metadata !30), !dbg !42
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !43, metadata !30), !dbg !44
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !35, metadata !30), !dbg !36
  %cmp = icmp eq i64 %a, 0, !dbg !45
  br i1 %cmp, label %return, label %while.body.preheader, !dbg !47

while.body.preheader:                             ; preds = %entry.split
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !37, metadata !30), !dbg !38
  %cmp12 = icmp sgt i64 %a, -1, !dbg !48
  br i1 %cmp12, label %blklab4.lr.ph, label %if.end3, !dbg !52

blklab4.lr.ph:                                    ; preds = %while.body.preheader
  br label %blklab4, !dbg !52

while.body.if.end3_crit_edge:                     ; preds = %if.end6
  br label %if.end3, !dbg !52

if.end3:                                          ; preds = %while.body.if.end3_crit_edge, %while.body.preheader
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !dbg !53
  %1 = tail call i64 @fwrite(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str, i64 0, i64 0), i64 4, i64 1, %struct._IO_FILE* %0) #6, !dbg !54
  tail call void @exit(i32 -1) #7, !dbg !55
  unreachable, !dbg !55

blklab4:                                          ; preds = %blklab4.lr.ph, %if.end6
  %a.addr.04 = phi i64 [ %a, %blklab4.lr.ph ], [ %a.addr.1, %if.end6 ]
  %b.addr.03 = phi i64 [ %b, %blklab4.lr.ph ], [ %b.addr.1, %if.end6 ]
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !39, metadata !30), !dbg !40
  %cmp4 = icmp eq i64 %b.addr.03, 0, !dbg !56
  br i1 %cmp4, label %return.loopexit, label %if.end6, !dbg !58

if.end6:                                          ; preds = %blklab4
  %cmp7 = icmp sgt i64 %a.addr.04, %b.addr.03, !dbg !59
  %sub10 = select i1 %cmp7, i64 0, i64 %a.addr.04, !dbg !61
  %b.addr.1 = sub nsw i64 %b.addr.03, %sub10, !dbg !61
  %sub = select i1 %cmp7, i64 %b.addr.03, i64 0, !dbg !61
  %a.addr.1 = sub nsw i64 %a.addr.04, %sub, !dbg !61
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !37, metadata !30), !dbg !38
  %cmp1 = icmp sgt i64 %a.addr.1, -1, !dbg !48
  br i1 %cmp1, label %blklab4, label %while.body.if.end3_crit_edge, !dbg !52

return.loopexit:                                  ; preds = %blklab4
  %a.addr.04.lcssa = phi i64 [ %a.addr.04, %blklab4 ]
  br label %return, !dbg !62

return:                                           ; preds = %return.loopexit, %entry.split
  %retval.0 = phi i64 [ %b, %entry.split ], [ %a.addr.04.lcssa, %return.loopexit ]
  ret i64 %retval.0, !dbg !62
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) #2

; Function Attrs: noreturn nounwind
declare void @exit(i32) #3

; Function Attrs: nounwind uwtable
define i64* @gcd_array(i64* %data, i64 %data_size, i1 zeroext %data_has_ownership, i64 %n) #0 !dbg !10 {
entry:
  br label %entry.split, !dbg !63

entry.split:                                      ; preds = %entry
  tail call void @llvm.dbg.value(metadata i64* %data, i64 0, metadata !64, metadata !30), !dbg !63
  tail call void @llvm.dbg.value(metadata i64 %data_size, i64 0, metadata !65, metadata !30), !dbg !63
  tail call void @llvm.dbg.value(metadata i1 %data_has_ownership, i64 0, metadata !66, metadata !67), !dbg !68
  tail call void @llvm.dbg.value(metadata i64 %n, i64 0, metadata !69, metadata !30), !dbg !70
  tail call void @llvm.dbg.value(metadata i64* null, i64 0, metadata !71, metadata !30), !dbg !72
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !73, metadata !30), !dbg !72
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !74, metadata !30), !dbg !75
  tail call void @llvm.dbg.value(metadata i64* null, i64 0, metadata !76, metadata !30), !dbg !77
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !78, metadata !30), !dbg !77
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !79, metadata !30), !dbg !80
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !81, metadata !30), !dbg !82
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !83, metadata !30), !dbg !84
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !85, metadata !30), !dbg !86
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !87, metadata !30), !dbg !88
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !89, metadata !30), !dbg !90
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !91, metadata !30), !dbg !92
  tail call void @llvm.dbg.value(metadata i64* null, i64 0, metadata !93, metadata !30), !dbg !94
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !95, metadata !30), !dbg !94
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !96, metadata !30), !dbg !97
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !98, metadata !30), !dbg !99
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !100, metadata !30), !dbg !101
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !102, metadata !30), !dbg !103
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !104, metadata !30), !dbg !105
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !106, metadata !30), !dbg !107
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !108, metadata !30), !dbg !109
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !110, metadata !30), !dbg !111
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !112, metadata !30), !dbg !113
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !114, metadata !30), !dbg !115
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !116, metadata !30), !dbg !117
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !118, metadata !30), !dbg !119
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !120, metadata !30), !dbg !121
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !122, metadata !30), !dbg !123
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !124, metadata !30), !dbg !125
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !126, metadata !30), !dbg !127
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !128, metadata !30), !dbg !129
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !130, metadata !30), !dbg !131
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !132, metadata !30), !dbg !133
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !134, metadata !30), !dbg !135
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !136, metadata !30), !dbg !137
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !138, metadata !30), !dbg !139
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !140, metadata !30), !dbg !141
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !142, metadata !30), !dbg !143
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !144, metadata !30), !dbg !145
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !146, metadata !30), !dbg !147
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !89, metadata !30), !dbg !90
  %mul = mul nsw i64 %n, %n, !dbg !148
  tail call void @llvm.dbg.value(metadata i64 %mul, i64 0, metadata !91, metadata !30), !dbg !92
  tail call void @llvm.dbg.value(metadata i64 %mul, i64 0, metadata !95, metadata !30), !dbg !94
  %conv1 = trunc i64 %mul to i32, !dbg !149
  %call = tail call i64* @gen1DArray(i32 0, i32 %conv1) #5, !dbg !149
  tail call void @llvm.dbg.value(metadata i64* %call, i64 0, metadata !93, metadata !30), !dbg !94
  tail call void @llvm.dbg.value(metadata i8 1, i64 0, metadata !96, metadata !30), !dbg !97
  tail call void @llvm.dbg.value(metadata i64 %mul, i64 0, metadata !78, metadata !30), !dbg !77
  tail call void @llvm.dbg.value(metadata i64* %call, i64 0, metadata !76, metadata !30), !dbg !77
  tail call void @llvm.dbg.value(metadata i8 1, i64 0, metadata !79, metadata !30), !dbg !80
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !96, metadata !30), !dbg !97
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !98, metadata !30), !dbg !99
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !81, metadata !30), !dbg !82
  %cmp8 = icmp sgt i64 %n, 0, !dbg !150
  br i1 %cmp8, label %while.body9.preheader.lr.ph, label %blklab7, !dbg !153

while.body9.preheader.lr.ph:                      ; preds = %entry.split
  br label %while.body9.preheader, !dbg !153

while.body9.preheader:                            ; preds = %while.body9.preheader.lr.ph, %blklab8
  %i.09 = phi i64 [ 0, %while.body9.preheader.lr.ph ], [ %add49, %blklab8 ]
  %cmp105 = icmp sgt i64 %n, 0, !dbg !154
  br i1 %cmp105, label %if.end13.lr.ph, label %blklab8, !dbg !157

if.end13.lr.ph:                                   ; preds = %while.body9.preheader
  br label %if.end13, !dbg !157

if.end13:                                         ; preds = %if.end13.lr.ph, %blklab10
  %j.06 = phi i64 [ 0, %if.end13.lr.ph ], [ %add48, %blklab10 ]
  %arrayidx = getelementptr inbounds i64, i64* %data, i64 %i.09, !dbg !158
  %0 = load i64, i64* %arrayidx, align 8, !dbg !158
  tail call void @llvm.dbg.value(metadata i64 %0, i64 0, metadata !102, metadata !30), !dbg !103
  tail call void @llvm.dbg.value(metadata i64 %0, i64 0, metadata !85, metadata !30), !dbg !86
  %arrayidx14 = getelementptr inbounds i64, i64* %data, i64 %j.06, !dbg !159
  %1 = load i64, i64* %arrayidx14, align 8, !dbg !159
  tail call void @llvm.dbg.value(metadata i64 %1, i64 0, metadata !104, metadata !30), !dbg !105
  tail call void @llvm.dbg.value(metadata i64 %1, i64 0, metadata !87, metadata !30), !dbg !88
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !106, metadata !30), !dbg !107
  %cmp15 = icmp eq i64 %0, 0, !dbg !160
  br i1 %cmp15, label %if.end18, label %while.body26.preheader, !dbg !162

while.body26.preheader:                           ; preds = %if.end13
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !120, metadata !30), !dbg !121
  %cmp272 = icmp sgt i64 %0, -1, !dbg !163
  br i1 %cmp272, label %blklab15.lr.ph, label %while.body26.preheader.if.end30_crit_edge, !dbg !167

blklab15.lr.ph:                                   ; preds = %while.body26.preheader
  br label %blklab15, !dbg !167

if.end18:                                         ; preds = %if.end13
  %mul19 = mul nsw i64 %i.09, %n, !dbg !168
  tail call void @llvm.dbg.value(metadata i64 %mul19, i64 0, metadata !108, metadata !30), !dbg !109
  %add = add nsw i64 %j.06, %mul19, !dbg !169
  tail call void @llvm.dbg.value(metadata i64 %add, i64 0, metadata !110, metadata !30), !dbg !111
  %arrayidx20 = getelementptr inbounds i64, i64* %call, i64 %add, !dbg !170
  %2 = load i64, i64* %arrayidx20, align 8, !dbg !170
  tail call void @llvm.dbg.value(metadata i64 %2, i64 0, metadata !112, metadata !30), !dbg !113
  %add21 = add nsw i64 %2, %1, !dbg !171
  tail call void @llvm.dbg.value(metadata i64 %add21, i64 0, metadata !114, metadata !30), !dbg !115
  %mul22 = mul nsw i64 %i.09, %n, !dbg !172
  tail call void @llvm.dbg.value(metadata i64 %mul22, i64 0, metadata !116, metadata !30), !dbg !117
  %add23 = add nsw i64 %j.06, %mul22, !dbg !173
  tail call void @llvm.dbg.value(metadata i64 %add23, i64 0, metadata !118, metadata !30), !dbg !119
  %arrayidx24 = getelementptr inbounds i64, i64* %call, i64 %add23, !dbg !174
  store i64 %add21, i64* %arrayidx24, align 8, !dbg !175
  br label %blklab10, !dbg !176

while.body26.preheader.if.end30_crit_edge:        ; preds = %while.body26.preheader
  br label %if.end30, !dbg !167

while.body26.if.end30_crit_edge:                  ; preds = %if.end35
  br label %if.end30, !dbg !167

if.end30:                                         ; preds = %while.body26.if.end30_crit_edge, %while.body26.preheader.if.end30_crit_edge
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !dbg !177
  %4 = tail call i64 @fwrite(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str, i64 0, i64 0), i64 4, i64 1, %struct._IO_FILE* %3) #6, !dbg !178
  tail call void @exit(i32 -1) #7, !dbg !179
  unreachable, !dbg !179

blklab15:                                         ; preds = %blklab15.lr.ph, %if.end35
  %a.04 = phi i64 [ %0, %blklab15.lr.ph ], [ %a.1, %if.end35 ]
  %b.03 = phi i64 [ %1, %blklab15.lr.ph ], [ %b.1, %if.end35 ]
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !122, metadata !30), !dbg !123
  %cmp32 = icmp eq i64 %b.03, 0, !dbg !180
  br i1 %cmp32, label %blklab13, label %if.end35, !dbg !182

if.end35:                                         ; preds = %blklab15
  %cmp36 = icmp sgt i64 %a.04, %b.03, !dbg !183
  %sub40 = select i1 %cmp36, i64 0, i64 %a.04, !dbg !185
  %b.1 = sub nsw i64 %b.03, %sub40, !dbg !185
  %sub = select i1 %cmp36, i64 %b.03, i64 0, !dbg !185
  %a.1 = sub nsw i64 %a.04, %sub, !dbg !185
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !120, metadata !30), !dbg !121
  %cmp27 = icmp sgt i64 %a.1, -1, !dbg !163
  br i1 %cmp27, label %blklab15, label %while.body26.if.end30_crit_edge, !dbg !167

blklab13:                                         ; preds = %blklab15
  %a.04.lcssa = phi i64 [ %a.04, %blklab15 ]
  %mul41 = mul nsw i64 %i.09, %n, !dbg !186
  tail call void @llvm.dbg.value(metadata i64 %mul41, i64 0, metadata !128, metadata !30), !dbg !129
  %add42 = add nsw i64 %j.06, %mul41, !dbg !187
  tail call void @llvm.dbg.value(metadata i64 %add42, i64 0, metadata !130, metadata !30), !dbg !131
  %arrayidx43 = getelementptr inbounds i64, i64* %call, i64 %add42, !dbg !188
  %5 = load i64, i64* %arrayidx43, align 8, !dbg !188
  tail call void @llvm.dbg.value(metadata i64 %5, i64 0, metadata !132, metadata !30), !dbg !133
  %add44 = add nsw i64 %5, %a.04.lcssa, !dbg !189
  tail call void @llvm.dbg.value(metadata i64 %add44, i64 0, metadata !134, metadata !30), !dbg !135
  %mul45 = mul nsw i64 %i.09, %n, !dbg !190
  tail call void @llvm.dbg.value(metadata i64 %mul45, i64 0, metadata !136, metadata !30), !dbg !137
  %add46 = add nsw i64 %j.06, %mul45, !dbg !191
  tail call void @llvm.dbg.value(metadata i64 %add46, i64 0, metadata !138, metadata !30), !dbg !139
  %arrayidx47 = getelementptr inbounds i64, i64* %call, i64 %add46, !dbg !192
  store i64 %add44, i64* %arrayidx47, align 8, !dbg !193
  br label %blklab10, !dbg !192

blklab10:                                         ; preds = %if.end18, %blklab13
  tail call void @llvm.dbg.value(metadata i64 1, i64 0, metadata !140, metadata !30), !dbg !141
  tail call void @llvm.dbg.value(metadata i64 %add48, i64 0, metadata !142, metadata !30), !dbg !143
  tail call void @llvm.dbg.value(metadata i64 %add48, i64 0, metadata !83, metadata !30), !dbg !84
  %add48 = add nuw nsw i64 %j.06, 1, !dbg !194
  %cmp10 = icmp slt i64 %add48, %n, !dbg !154
  br i1 %cmp10, label %if.end13, label %while.body9.blklab8_crit_edge, !dbg !157

while.body9.blklab8_crit_edge:                    ; preds = %blklab10
  br label %blklab8, !dbg !157

blklab8:                                          ; preds = %while.body9.blklab8_crit_edge, %while.body9.preheader
  tail call void @llvm.dbg.value(metadata i64 1, i64 0, metadata !144, metadata !30), !dbg !145
  tail call void @llvm.dbg.value(metadata i64 %add49, i64 0, metadata !146, metadata !30), !dbg !147
  tail call void @llvm.dbg.value(metadata i64 %add49, i64 0, metadata !81, metadata !30), !dbg !82
  %add49 = add nuw nsw i64 %i.09, 1, !dbg !195
  %cmp = icmp slt i64 %add49, %n, !dbg !150
  br i1 %cmp, label %while.body9.preheader, label %while.body.blklab7_crit_edge, !dbg !153

while.body.blklab7_crit_edge:                     ; preds = %blklab8
  br label %blklab7, !dbg !153

blklab7:                                          ; preds = %while.body.blklab7_crit_edge, %entry.split
  br i1 %data_has_ownership, label %if.then51, label %if.end58, !dbg !196

if.then51:                                        ; preds = %blklab7
  %6 = bitcast i64* %data to i8*, !dbg !197
  tail call void @free(i8* %6) #5, !dbg !197
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !66, metadata !30), !dbg !68
  br label %if.end58, !dbg !197

if.end58:                                         ; preds = %if.then51, %blklab7
  ret i64* %call, !dbg !201
}

; Function Attrs: nounwind
declare void @free(i8*) #4

declare i64* @gen1DArray(i32, i32) #2

; Function Attrs: nounwind uwtable
define i64* @init(i64 %n) #0 !dbg !15 {
entry:
  br label %entry.split, !dbg !202

entry.split:                                      ; preds = %entry
  tail call void @llvm.dbg.value(metadata i64 %n, i64 0, metadata !203, metadata !30), !dbg !202
  tail call void @llvm.dbg.value(metadata i64* null, i64 0, metadata !204, metadata !30), !dbg !205
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !206, metadata !30), !dbg !205
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !207, metadata !30), !dbg !208
  tail call void @llvm.dbg.value(metadata i64* null, i64 0, metadata !209, metadata !30), !dbg !210
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !211, metadata !30), !dbg !210
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !212, metadata !30), !dbg !213
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !214, metadata !30), !dbg !215
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !216, metadata !30), !dbg !217
  tail call void @llvm.dbg.value(metadata i64* null, i64 0, metadata !218, metadata !30), !dbg !219
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !220, metadata !30), !dbg !219
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !221, metadata !30), !dbg !222
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !223, metadata !30), !dbg !224
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !225, metadata !30), !dbg !226
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !227, metadata !30), !dbg !228
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !229, metadata !30), !dbg !230
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !231, metadata !30), !dbg !232
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !216, metadata !30), !dbg !217
  tail call void @llvm.dbg.value(metadata i64 %n, i64 0, metadata !220, metadata !30), !dbg !219
  %conv1 = trunc i64 %n to i32, !dbg !233
  %call = tail call i64* @gen1DArray(i32 0, i32 %conv1) #5, !dbg !233
  tail call void @llvm.dbg.value(metadata i64* %call, i64 0, metadata !218, metadata !30), !dbg !219
  tail call void @llvm.dbg.value(metadata i8 1, i64 0, metadata !221, metadata !30), !dbg !222
  tail call void @llvm.dbg.value(metadata i64 %n, i64 0, metadata !211, metadata !30), !dbg !210
  tail call void @llvm.dbg.value(metadata i64* %call, i64 0, metadata !209, metadata !30), !dbg !210
  tail call void @llvm.dbg.value(metadata i8 1, i64 0, metadata !212, metadata !30), !dbg !213
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !221, metadata !30), !dbg !222
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !223, metadata !30), !dbg !224
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !214, metadata !30), !dbg !215
  %cmp1 = icmp sgt i64 %n, 0, !dbg !234
  br i1 %cmp1, label %if.end7.lr.ph, label %if.end15, !dbg !237

if.end7.lr.ph:                                    ; preds = %entry.split
  br label %if.end7, !dbg !237

if.end7:                                          ; preds = %if.end7.lr.ph, %if.end7
  %i.02 = phi i64 [ 0, %if.end7.lr.ph ], [ %add9, %if.end7 ]
  %arrayidx = getelementptr inbounds i64, i64* %call, i64 %i.02, !dbg !238
  %0 = load i64, i64* %arrayidx, align 8, !dbg !238
  tail call void @llvm.dbg.value(metadata i64 %0, i64 0, metadata !225, metadata !30), !dbg !226
  %add = add nsw i64 %0, %i.02, !dbg !239
  tail call void @llvm.dbg.value(metadata i64 %add, i64 0, metadata !227, metadata !30), !dbg !228
  %arrayidx8 = getelementptr inbounds i64, i64* %call, i64 %i.02, !dbg !240
  store i64 %add, i64* %arrayidx8, align 8, !dbg !241
  tail call void @llvm.dbg.value(metadata i64 1, i64 0, metadata !229, metadata !30), !dbg !230
  tail call void @llvm.dbg.value(metadata i64 %add9, i64 0, metadata !231, metadata !30), !dbg !232
  tail call void @llvm.dbg.value(metadata i64 %add9, i64 0, metadata !214, metadata !30), !dbg !215
  %add9 = add nuw nsw i64 %i.02, 1, !dbg !242
  %exitcond = icmp ne i64 %add9, %n, !dbg !237
  br i1 %exitcond, label %if.end7, label %while.body.if.end15_crit_edge, !dbg !237

while.body.if.end15_crit_edge:                    ; preds = %if.end7
  br label %if.end15, !dbg !237

if.end15:                                         ; preds = %while.body.if.end15_crit_edge, %entry.split
  ret i64* %call, !dbg !243
}

; Function Attrs: nounwind uwtable
define i32 @main(i32 %argc, i8** %args) #0 !dbg !18 {
entry:
  br label %entry.split, !dbg !244

entry.split:                                      ; preds = %entry
  tail call void @llvm.dbg.value(metadata i32 %argc, i64 0, metadata !245, metadata !30), !dbg !244
  tail call void @llvm.dbg.value(metadata i8** %args, i64 0, metadata !246, metadata !30), !dbg !247
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !248, metadata !30), !dbg !249
  tail call void @llvm.dbg.value(metadata i64* null, i64 0, metadata !250, metadata !30), !dbg !251
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !252, metadata !30), !dbg !251
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !253, metadata !30), !dbg !254
  tail call void @llvm.dbg.value(metadata i64* null, i64 0, metadata !255, metadata !30), !dbg !256
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !257, metadata !30), !dbg !256
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !258, metadata !30), !dbg !259
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !260, metadata !30), !dbg !261
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !262, metadata !30), !dbg !263
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !264, metadata !30), !dbg !265
  tail call void @llvm.dbg.value(metadata i64** null, i64 0, metadata !266, metadata !30), !dbg !268
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !269, metadata !30), !dbg !268
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !270, metadata !30), !dbg !268
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !271, metadata !30), !dbg !272
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !273, metadata !30), !dbg !274
  tail call void @llvm.dbg.value(metadata i64* null, i64 0, metadata !275, metadata !30), !dbg !276
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !277, metadata !30), !dbg !276
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !278, metadata !30), !dbg !279
  tail call void @llvm.dbg.value(metadata i64* null, i64 0, metadata !280, metadata !30), !dbg !281
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !282, metadata !30), !dbg !281
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !283, metadata !30), !dbg !284
  tail call void @llvm.dbg.value(metadata i64* null, i64 0, metadata !285, metadata !30), !dbg !286
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !287, metadata !30), !dbg !286
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !288, metadata !30), !dbg !289
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !290, metadata !30), !dbg !291
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !292, metadata !30), !dbg !293
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !294, metadata !30), !dbg !295
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !296, metadata !30), !dbg !297
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !298, metadata !30), !dbg !299
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !300, metadata !30), !dbg !301
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !302, metadata !30), !dbg !303
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !304, metadata !30), !dbg !305
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !306, metadata !30), !dbg !307
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !308, metadata !30), !dbg !309
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !310, metadata !30), !dbg !311
  tail call void @llvm.dbg.value(metadata i64* null, i64 0, metadata !312, metadata !30), !dbg !313
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !314, metadata !30), !dbg !313
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !315, metadata !30), !dbg !316
  %call = tail call i64** @convertArgsToIntArray(i32 %argc, i8** %args) #5, !dbg !317
  tail call void @llvm.dbg.value(metadata i64** %call, i64 0, metadata !266, metadata !30), !dbg !268
  %sub = add nsw i32 %argc, -1, !dbg !317
  %conv = sext i32 %sub to i64, !dbg !317
  tail call void @llvm.dbg.value(metadata i64 %conv, i64 0, metadata !269, metadata !30), !dbg !268
  tail call void @llvm.dbg.value(metadata i8 1, i64 0, metadata !271, metadata !30), !dbg !272
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !273, metadata !30), !dbg !274
  %0 = load i64*, i64** %call, align 8, !dbg !318
  tail call void @llvm.dbg.value(metadata i64* %0, i64 0, metadata !275, metadata !30), !dbg !276
  %call1 = tail call i64* @parseStringToInt(i64* %0) #5, !dbg !319
  tail call void @llvm.dbg.value(metadata i64* %call1, i64 0, metadata !320, metadata !30), !dbg !321
  tail call void @llvm.dbg.value(metadata i64* %call1, i64 0, metadata !322, metadata !30), !dbg !323
  %cmp = icmp eq i64* %call1, null, !dbg !324
  br i1 %cmp, label %blklab20, label %if.end, !dbg !326

if.end:                                           ; preds = %entry.split
  %1 = load i64, i64* %call1, align 8, !dbg !327
  tail call void @llvm.dbg.value(metadata i64 %1, i64 0, metadata !248, metadata !30), !dbg !249
  %call5 = tail call i64* @init(i64 %1), !dbg !328
  tail call void @llvm.dbg.value(metadata i64* %call5, i64 0, metadata !280, metadata !30), !dbg !281
  tail call void @llvm.dbg.value(metadata i8 1, i64 0, metadata !283, metadata !30), !dbg !284
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !252, metadata !30), !dbg !251
  tail call void @llvm.dbg.value(metadata i64* %call5, i64 0, metadata !250, metadata !30), !dbg !251
  tail call void @llvm.dbg.value(metadata i8 1, i64 0, metadata !253, metadata !30), !dbg !254
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !283, metadata !30), !dbg !284
  tail call void @llvm.dbg.value(metadata i8 1, i64 0, metadata !253, metadata !30), !dbg !254
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !287, metadata !30), !dbg !286
  %call12 = tail call i64* @gcd_array(i64* %call5, i64 0, i1 zeroext false, i64 %1), !dbg !329
  tail call void @llvm.dbg.value(metadata i64* %call12, i64 0, metadata !285, metadata !30), !dbg !286
  tail call void @llvm.dbg.value(metadata i8 1, i64 0, metadata !288, metadata !30), !dbg !289
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !257, metadata !30), !dbg !256
  tail call void @llvm.dbg.value(metadata i64* %call12, i64 0, metadata !255, metadata !30), !dbg !256
  tail call void @llvm.dbg.value(metadata i8 1, i64 0, metadata !258, metadata !30), !dbg !259
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !288, metadata !30), !dbg !289
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !290, metadata !30), !dbg !291
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !260, metadata !30), !dbg !261
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !292, metadata !30), !dbg !293
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !262, metadata !30), !dbg !263
  %cmp165 = icmp sgt i64 %1, 0, !dbg !330
  br i1 %cmp165, label %while.body21.preheader.lr.ph, label %if.end32, !dbg !333

while.body21.preheader.lr.ph:                     ; preds = %if.end
  br label %while.body21.preheader, !dbg !333

while.body21.preheader:                           ; preds = %while.body21.preheader.lr.ph, %blklab22
  %sum.08 = phi i64 [ 0, %while.body21.preheader.lr.ph ], [ %sum.1.lcssa, %blklab22 ]
  %i.06 = phi i64 [ 0, %while.body21.preheader.lr.ph ], [ %add29, %blklab22 ]
  %cmp222 = icmp sgt i64 %1, 0, !dbg !334
  br i1 %cmp222, label %blklab24.lr.ph, label %blklab22, !dbg !337

blklab24.lr.ph:                                   ; preds = %while.body21.preheader
  br label %blklab24, !dbg !337

blklab24:                                         ; preds = %blklab24.lr.ph, %blklab24
  %sum.14 = phi i64 [ %sum.08, %blklab24.lr.ph ], [ %add27, %blklab24 ]
  %j.03 = phi i64 [ 0, %blklab24.lr.ph ], [ %add28, %blklab24 ]
  tail call void @llvm.dbg.value(metadata i64 %mul, i64 0, metadata !296, metadata !30), !dbg !297
  tail call void @llvm.dbg.value(metadata i64 %add, i64 0, metadata !298, metadata !30), !dbg !299
  tail call void @llvm.dbg.value(metadata i64 %2, i64 0, metadata !300, metadata !30), !dbg !301
  tail call void @llvm.dbg.value(metadata i64 %add27, i64 0, metadata !302, metadata !30), !dbg !303
  tail call void @llvm.dbg.value(metadata i64 %add27, i64 0, metadata !260, metadata !30), !dbg !261
  tail call void @llvm.dbg.value(metadata i64 1, i64 0, metadata !304, metadata !30), !dbg !305
  tail call void @llvm.dbg.value(metadata i64 %add28, i64 0, metadata !306, metadata !30), !dbg !307
  tail call void @llvm.dbg.value(metadata i64 %add28, i64 0, metadata !264, metadata !30), !dbg !265
  %add28 = add nuw nsw i64 %j.03, 1, !dbg !338
  %mul = mul nsw i64 %i.06, %1, !dbg !339
  %add = add nsw i64 %j.03, %mul, !dbg !340
  %arrayidx26 = getelementptr inbounds i64, i64* %call12, i64 %add, !dbg !341
  %2 = load i64, i64* %arrayidx26, align 8, !dbg !341
  %add27 = add nsw i64 %2, %sum.14, !dbg !342
  %exitcond = icmp ne i64 %add28, %1, !dbg !337
  br i1 %exitcond, label %blklab24, label %while.body21.blklab22_crit_edge, !dbg !337

while.body21.blklab22_crit_edge:                  ; preds = %blklab24
  %add27.lcssa = phi i64 [ %add27, %blklab24 ]
  br label %blklab22, !dbg !337

blklab22:                                         ; preds = %while.body21.blklab22_crit_edge, %while.body21.preheader
  %sum.1.lcssa = phi i64 [ %add27.lcssa, %while.body21.blklab22_crit_edge ], [ %sum.08, %while.body21.preheader ]
  tail call void @llvm.dbg.value(metadata i64 1, i64 0, metadata !308, metadata !30), !dbg !309
  tail call void @llvm.dbg.value(metadata i64 %add29, i64 0, metadata !310, metadata !30), !dbg !311
  tail call void @llvm.dbg.value(metadata i64 %add29, i64 0, metadata !262, metadata !30), !dbg !263
  %add29 = add nuw nsw i64 %i.06, 1, !dbg !343
  %exitcond10 = icmp ne i64 %add29, %1, !dbg !333
  br i1 %exitcond10, label %while.body21.preheader, label %while.body.if.end32_crit_edge, !dbg !333

while.body.if.end32_crit_edge:                    ; preds = %blklab22
  %sum.1.lcssa.lcssa = phi i64 [ %sum.1.lcssa, %blklab22 ]
  br label %if.end32, !dbg !333

if.end32:                                         ; preds = %while.body.if.end32_crit_edge, %if.end
  %sum.0.lcssa = phi i64 [ %sum.1.lcssa.lcssa, %while.body.if.end32_crit_edge ], [ 0, %if.end ]
  tail call void @llvm.dbg.value(metadata i64 4, i64 0, metadata !314, metadata !30), !dbg !313
  %call33 = tail call noalias i8* @malloc(i64 32) #5, !dbg !344
  %3 = bitcast i8* %call33 to i64*, !dbg !344
  tail call void @llvm.dbg.value(metadata i64* %3, i64 0, metadata !312, metadata !30), !dbg !313
  store i64 83, i64* %3, align 8, !dbg !345
  %arrayidx35 = getelementptr inbounds i8, i8* %call33, i64 8, !dbg !346
  %4 = bitcast i8* %arrayidx35 to i64*, !dbg !346
  store i64 85, i64* %4, align 8, !dbg !347
  %arrayidx36 = getelementptr inbounds i8, i8* %call33, i64 16, !dbg !348
  %5 = bitcast i8* %arrayidx36 to i64*, !dbg !348
  store i64 77, i64* %5, align 8, !dbg !349
  %arrayidx37 = getelementptr inbounds i8, i8* %call33, i64 24, !dbg !350
  %6 = bitcast i8* %arrayidx37 to i64*, !dbg !350
  store i64 58, i64* %6, align 8, !dbg !351
  tail call void @llvm.dbg.value(metadata i8 1, i64 0, metadata !315, metadata !30), !dbg !316
  tail call void @printf_s(i64* %3, i64 4) #5, !dbg !352
  %call38 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.1, i64 0, i64 0), i64 %sum.0.lcssa) #5, !dbg !353
  %phitmp = bitcast i64* %call12 to i8*, !dbg !353
  %phitmp1 = bitcast i64* %call5 to i8*, !dbg !353
  br label %blklab20, !dbg !353

blklab20:                                         ; preds = %entry.split, %if.end32
  %gcds_has_ownership.0 = phi i1 [ true, %if.end32 ], [ false, %entry.split ]
  %gcds.0 = phi i8* [ %phitmp, %if.end32 ], [ null, %entry.split ]
  %data.0 = phi i8* [ %phitmp1, %if.end32 ], [ null, %entry.split ]
  %7 = phi i8* [ %call33, %if.end32 ], [ null, %entry.split ]
  br i1 %gcds_has_ownership.0, label %if.then40, label %if.end59.critedge, !dbg !354

if.then40:                                        ; preds = %blklab20
  tail call void @free(i8* %data.0) #5, !dbg !355
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !253, metadata !30), !dbg !254
  tail call void @free(i8* %gcds.0) #5, !dbg !359
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !258, metadata !30), !dbg !259
  tail call void @free2DArray(i64** %call, i64 %conv) #5, !dbg !363
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !271, metadata !30), !dbg !272
  tail call void @free(i8* %7) #5, !dbg !367
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !315, metadata !30), !dbg !316
  br label %if.end59, !dbg !367

if.end59.critedge:                                ; preds = %blklab20
  tail call void @free2DArray(i64** %call, i64 %conv) #5, !dbg !363
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !271, metadata !30), !dbg !272
  br label %if.end59

if.end59:                                         ; preds = %if.end59.critedge, %if.then40
  tail call void @exit(i32 0) #7, !dbg !371
  unreachable, !dbg !371
}

declare i64** @convertArgsToIntArray(i32, i8**) #2

declare i64* @parseStringToInt(i64*) #2

; Function Attrs: nounwind
declare noalias i8* @malloc(i64) #4

declare void @printf_s(i64*, i64) #2

declare i32 @printf(i8*, ...) #2

declare void @free2DArray(i64**, i64) #2

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
!llvm.module.flags = !{!25, !26}
!llvm.ident = !{!27}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 3.9.0 (http://llvm.org/git/clang.git cf7bc8edf8cccb1b5de656c403cb55ad44132e98) (http://llvm.org/git/llvm.git 22706dc4c03305692f494d0e42a6de1050d0ec62)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, subprograms: !5)
!1 = !DIFile(filename: "GCD.c", directory: "/home/sam/workspace/WhileyOpenCL/polly/GCD/impl/autogenerate")
!2 = !{}
!3 = !{!4}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64, align: 64)
!5 = !{!6, !10, !15, !18}
!6 = distinct !DISubprogram(name: "gcd", scope: !1, file: !1, line: 2, type: !7, isLocal: false, isDefinition: true, scopeLine: 2, flags: DIFlagPrototyped, isOptimized: false, variables: !2)
!7 = !DISubroutineType(types: !8)
!8 = !{!9, !9, !9}
!9 = !DIBasicType(name: "long long int", size: 64, align: 64, encoding: DW_ATE_signed)
!10 = distinct !DISubprogram(name: "gcd_array", scope: !1, file: !1, line: 62, type: !11, isLocal: false, isDefinition: true, scopeLine: 62, flags: DIFlagPrototyped, isOptimized: false, variables: !2)
!11 = !DISubroutineType(types: !12)
!12 = !{!13, !13, !9, !14, !9}
!13 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !9, size: 64, align: 64)
!14 = !DIBasicType(name: "_Bool", size: 8, align: 8, encoding: DW_ATE_boolean)
!15 = distinct !DISubprogram(name: "init", scope: !1, file: !1, line: 245, type: !16, isLocal: false, isDefinition: true, scopeLine: 245, flags: DIFlagPrototyped, isOptimized: false, variables: !2)
!16 = !DISubroutineType(types: !17)
!17 = !{!13, !9}
!18 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 302, type: !19, isLocal: false, isDefinition: true, scopeLine: 302, flags: DIFlagPrototyped, isOptimized: false, variables: !2)
!19 = !DISubroutineType(types: !20)
!20 = !{!21, !21, !22}
!21 = !DIBasicType(name: "int", size: 32, align: 32, encoding: DW_ATE_signed)
!22 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !23, size: 64, align: 64)
!23 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !24, size: 64, align: 64)
!24 = !DIBasicType(name: "char", size: 8, align: 8, encoding: DW_ATE_signed_char)
!25 = !{i32 2, !"Dwarf Version", i32 4}
!26 = !{i32 2, !"Debug Info Version", i32 3}
!27 = !{!"clang version 3.9.0 (http://llvm.org/git/clang.git cf7bc8edf8cccb1b5de656c403cb55ad44132e98) (http://llvm.org/git/llvm.git 22706dc4c03305692f494d0e42a6de1050d0ec62)"}
!28 = !DILocation(line: 2, column: 25, scope: !6)
!29 = !DILocalVariable(name: "a", arg: 1, scope: !6, file: !1, line: 2, type: !9)
!30 = !DIExpression()
!31 = !DILocalVariable(name: "b", arg: 2, scope: !6, file: !1, line: 2, type: !9)
!32 = !DILocation(line: 2, column: 38, scope: !6)
!33 = !DILocalVariable(name: "_2", scope: !6, file: !1, line: 3, type: !9)
!34 = !DILocation(line: 3, column: 12, scope: !6)
!35 = !DILocalVariable(name: "_3", scope: !6, file: !1, line: 4, type: !9)
!36 = !DILocation(line: 4, column: 12, scope: !6)
!37 = !DILocalVariable(name: "_4", scope: !6, file: !1, line: 5, type: !9)
!38 = !DILocation(line: 5, column: 12, scope: !6)
!39 = !DILocalVariable(name: "_5", scope: !6, file: !1, line: 6, type: !9)
!40 = !DILocation(line: 6, column: 12, scope: !6)
!41 = !DILocalVariable(name: "_6", scope: !6, file: !1, line: 7, type: !9)
!42 = !DILocation(line: 7, column: 12, scope: !6)
!43 = !DILocalVariable(name: "_7", scope: !6, file: !1, line: 8, type: !9)
!44 = !DILocation(line: 8, column: 12, scope: !6)
!45 = !DILocation(line: 12, column: 6, scope: !46)
!46 = distinct !DILexicalBlock(scope: !6, file: !1, line: 12, column: 5)
!47 = !DILocation(line: 12, column: 5, scope: !6)
!48 = !DILocation(line: 24, column: 8, scope: !49)
!49 = distinct !DILexicalBlock(scope: !50, file: !1, line: 24, column: 7)
!50 = distinct !DILexicalBlock(scope: !51, file: !1, line: 20, column: 3)
!51 = distinct !DILexicalBlock(scope: !6, file: !1, line: 18, column: 13)
!52 = !DILocation(line: 24, column: 7, scope: !50)
!53 = !DILocation(line: 26, column: 12, scope: !50)
!54 = !DILocation(line: 26, column: 4, scope: !50)
!55 = !DILocation(line: 27, column: 4, scope: !50)
!56 = !DILocation(line: 35, column: 7, scope: !57)
!57 = distinct !DILexicalBlock(scope: !51, file: !1, line: 35, column: 6)
!58 = !DILocation(line: 35, column: 6, scope: !51)
!59 = !DILocation(line: 37, column: 7, scope: !60)
!60 = distinct !DILexicalBlock(scope: !51, file: !1, line: 37, column: 6)
!61 = !DILocation(line: 37, column: 6, scope: !51)
!62 = !DILocation(line: 60, column: 1, scope: !6)
!63 = !DILocation(line: 62, column: 22, scope: !10)
!64 = !DILocalVariable(name: "data", arg: 1, scope: !10, file: !1, line: 62, type: !13)
!65 = !DILocalVariable(name: "data_size", arg: 2, scope: !10, file: !1, line: 62, type: !9)
!66 = !DILocalVariable(name: "data_has_ownership", arg: 3, scope: !10, file: !1, line: 62, type: !14)
!67 = !DIExpression(DW_OP_bit_piece, 0, 1)
!68 = !DILocation(line: 62, column: 49, scope: !10)
!69 = !DILocalVariable(name: "n", arg: 4, scope: !10, file: !1, line: 62, type: !9)
!70 = !DILocation(line: 62, column: 88, scope: !10)
!71 = !DILocalVariable(name: "_2", scope: !10, file: !1, line: 63, type: !13)
!72 = !DILocation(line: 63, column: 2, scope: !10)
!73 = !DILocalVariable(name: "_2_size", scope: !10, file: !1, line: 63, type: !9)
!74 = !DILocalVariable(name: "_2_has_ownership", scope: !10, file: !1, line: 64, type: !14)
!75 = !DILocation(line: 64, column: 2, scope: !10)
!76 = !DILocalVariable(name: "gcds", scope: !10, file: !1, line: 65, type: !13)
!77 = !DILocation(line: 65, column: 2, scope: !10)
!78 = !DILocalVariable(name: "gcds_size", scope: !10, file: !1, line: 65, type: !9)
!79 = !DILocalVariable(name: "gcds_has_ownership", scope: !10, file: !1, line: 66, type: !14)
!80 = !DILocation(line: 66, column: 2, scope: !10)
!81 = !DILocalVariable(name: "i", scope: !10, file: !1, line: 67, type: !9)
!82 = !DILocation(line: 67, column: 12, scope: !10)
!83 = !DILocalVariable(name: "j", scope: !10, file: !1, line: 68, type: !9)
!84 = !DILocation(line: 68, column: 12, scope: !10)
!85 = !DILocalVariable(name: "a", scope: !10, file: !1, line: 69, type: !9)
!86 = !DILocation(line: 69, column: 12, scope: !10)
!87 = !DILocalVariable(name: "b", scope: !10, file: !1, line: 70, type: !9)
!88 = !DILocation(line: 70, column: 12, scope: !10)
!89 = !DILocalVariable(name: "_8", scope: !10, file: !1, line: 71, type: !9)
!90 = !DILocation(line: 71, column: 12, scope: !10)
!91 = !DILocalVariable(name: "_9", scope: !10, file: !1, line: 72, type: !9)
!92 = !DILocation(line: 72, column: 12, scope: !10)
!93 = !DILocalVariable(name: "_10", scope: !10, file: !1, line: 73, type: !13)
!94 = !DILocation(line: 73, column: 2, scope: !10)
!95 = !DILocalVariable(name: "_10_size", scope: !10, file: !1, line: 73, type: !9)
!96 = !DILocalVariable(name: "_10_has_ownership", scope: !10, file: !1, line: 74, type: !14)
!97 = !DILocation(line: 74, column: 2, scope: !10)
!98 = !DILocalVariable(name: "_11", scope: !10, file: !1, line: 75, type: !9)
!99 = !DILocation(line: 75, column: 12, scope: !10)
!100 = !DILocalVariable(name: "_12", scope: !10, file: !1, line: 76, type: !9)
!101 = !DILocation(line: 76, column: 12, scope: !10)
!102 = !DILocalVariable(name: "_13", scope: !10, file: !1, line: 77, type: !9)
!103 = !DILocation(line: 77, column: 12, scope: !10)
!104 = !DILocalVariable(name: "_14", scope: !10, file: !1, line: 78, type: !9)
!105 = !DILocation(line: 78, column: 12, scope: !10)
!106 = !DILocalVariable(name: "_15", scope: !10, file: !1, line: 79, type: !9)
!107 = !DILocation(line: 79, column: 12, scope: !10)
!108 = !DILocalVariable(name: "_16", scope: !10, file: !1, line: 80, type: !9)
!109 = !DILocation(line: 80, column: 12, scope: !10)
!110 = !DILocalVariable(name: "_17", scope: !10, file: !1, line: 81, type: !9)
!111 = !DILocation(line: 81, column: 12, scope: !10)
!112 = !DILocalVariable(name: "_18", scope: !10, file: !1, line: 82, type: !9)
!113 = !DILocation(line: 82, column: 12, scope: !10)
!114 = !DILocalVariable(name: "_19", scope: !10, file: !1, line: 83, type: !9)
!115 = !DILocation(line: 83, column: 12, scope: !10)
!116 = !DILocalVariable(name: "_20", scope: !10, file: !1, line: 84, type: !9)
!117 = !DILocation(line: 84, column: 12, scope: !10)
!118 = !DILocalVariable(name: "_21", scope: !10, file: !1, line: 85, type: !9)
!119 = !DILocation(line: 85, column: 12, scope: !10)
!120 = !DILocalVariable(name: "_22", scope: !10, file: !1, line: 86, type: !9)
!121 = !DILocation(line: 86, column: 12, scope: !10)
!122 = !DILocalVariable(name: "_23", scope: !10, file: !1, line: 87, type: !9)
!123 = !DILocation(line: 87, column: 12, scope: !10)
!124 = !DILocalVariable(name: "_24", scope: !10, file: !1, line: 88, type: !9)
!125 = !DILocation(line: 88, column: 12, scope: !10)
!126 = !DILocalVariable(name: "_25", scope: !10, file: !1, line: 89, type: !9)
!127 = !DILocation(line: 89, column: 12, scope: !10)
!128 = !DILocalVariable(name: "_26", scope: !10, file: !1, line: 90, type: !9)
!129 = !DILocation(line: 90, column: 12, scope: !10)
!130 = !DILocalVariable(name: "_27", scope: !10, file: !1, line: 91, type: !9)
!131 = !DILocation(line: 91, column: 12, scope: !10)
!132 = !DILocalVariable(name: "_28", scope: !10, file: !1, line: 92, type: !9)
!133 = !DILocation(line: 92, column: 12, scope: !10)
!134 = !DILocalVariable(name: "_29", scope: !10, file: !1, line: 93, type: !9)
!135 = !DILocation(line: 93, column: 12, scope: !10)
!136 = !DILocalVariable(name: "_30", scope: !10, file: !1, line: 94, type: !9)
!137 = !DILocation(line: 94, column: 12, scope: !10)
!138 = !DILocalVariable(name: "_31", scope: !10, file: !1, line: 95, type: !9)
!139 = !DILocation(line: 95, column: 12, scope: !10)
!140 = !DILocalVariable(name: "_32", scope: !10, file: !1, line: 96, type: !9)
!141 = !DILocation(line: 96, column: 12, scope: !10)
!142 = !DILocalVariable(name: "_33", scope: !10, file: !1, line: 97, type: !9)
!143 = !DILocation(line: 97, column: 12, scope: !10)
!144 = !DILocalVariable(name: "_34", scope: !10, file: !1, line: 98, type: !9)
!145 = !DILocation(line: 98, column: 12, scope: !10)
!146 = !DILocalVariable(name: "_35", scope: !10, file: !1, line: 99, type: !9)
!147 = !DILocation(line: 99, column: 12, scope: !10)
!148 = !DILocation(line: 103, column: 6, scope: !10)
!149 = !DILocation(line: 106, column: 2, scope: !10)
!150 = !DILocation(line: 120, column: 7, scope: !151)
!151 = distinct !DILexicalBlock(scope: !152, file: !1, line: 120, column: 6)
!152 = distinct !DILexicalBlock(scope: !10, file: !1, line: 118, column: 13)
!153 = !DILocation(line: 120, column: 6, scope: !152)
!154 = !DILocation(line: 128, column: 8, scope: !155)
!155 = distinct !DILexicalBlock(scope: !156, file: !1, line: 128, column: 7)
!156 = distinct !DILexicalBlock(scope: !152, file: !1, line: 126, column: 14)
!157 = !DILocation(line: 128, column: 7, scope: !156)
!158 = !DILocation(line: 130, column: 8, scope: !156)
!159 = !DILocation(line: 134, column: 8, scope: !156)
!160 = !DILocation(line: 140, column: 8, scope: !161)
!161 = distinct !DILexicalBlock(scope: !156, file: !1, line: 140, column: 7)
!162 = !DILocation(line: 140, column: 7, scope: !156)
!163 = !DILocation(line: 166, column: 10, scope: !164)
!164 = distinct !DILexicalBlock(scope: !165, file: !1, line: 166, column: 9)
!165 = distinct !DILexicalBlock(scope: !166, file: !1, line: 162, column: 5)
!166 = distinct !DILexicalBlock(scope: !156, file: !1, line: 160, column: 15)
!167 = !DILocation(line: 166, column: 9, scope: !165)
!168 = !DILocation(line: 142, column: 9, scope: !156)
!169 = !DILocation(line: 144, column: 11, scope: !156)
!170 = !DILocation(line: 146, column: 8, scope: !156)
!171 = !DILocation(line: 148, column: 11, scope: !156)
!172 = !DILocation(line: 150, column: 9, scope: !156)
!173 = !DILocation(line: 152, column: 11, scope: !156)
!174 = !DILocation(line: 154, column: 4, scope: !156)
!175 = !DILocation(line: 154, column: 14, scope: !156)
!176 = !DILocation(line: 156, column: 4, scope: !156)
!177 = !DILocation(line: 168, column: 14, scope: !165)
!178 = !DILocation(line: 168, column: 6, scope: !165)
!179 = !DILocation(line: 169, column: 6, scope: !165)
!180 = !DILocation(line: 177, column: 9, scope: !181)
!181 = distinct !DILexicalBlock(scope: !166, file: !1, line: 177, column: 8)
!182 = !DILocation(line: 177, column: 8, scope: !166)
!183 = !DILocation(line: 179, column: 9, scope: !184)
!184 = distinct !DILexicalBlock(scope: !166, file: !1, line: 179, column: 8)
!185 = !DILocation(line: 179, column: 8, scope: !166)
!186 = !DILocation(line: 200, column: 9, scope: !156)
!187 = !DILocation(line: 202, column: 11, scope: !156)
!188 = !DILocation(line: 204, column: 8, scope: !156)
!189 = !DILocation(line: 206, column: 11, scope: !156)
!190 = !DILocation(line: 208, column: 9, scope: !156)
!191 = !DILocation(line: 210, column: 11, scope: !156)
!192 = !DILocation(line: 212, column: 4, scope: !156)
!193 = !DILocation(line: 212, column: 14, scope: !156)
!194 = !DILocation(line: 218, column: 9, scope: !156)
!195 = !DILocation(line: 229, column: 8, scope: !152)
!196 = !DILocation(line: 238, column: 2, scope: !10)
!197 = !DILocation(line: 238, column: 2, scope: !198)
!198 = !DILexicalBlockFile(scope: !199, file: !1, discriminator: 1)
!199 = distinct !DILexicalBlock(scope: !200, file: !1, line: 238, column: 2)
!200 = distinct !DILexicalBlock(scope: !10, file: !1, line: 238, column: 2)
!201 = !DILocation(line: 241, column: 2, scope: !10)
!202 = !DILocation(line: 245, column: 27, scope: !15)
!203 = !DILocalVariable(name: "n", arg: 1, scope: !15, file: !1, line: 245, type: !9)
!204 = !DILocalVariable(name: "_1", scope: !15, file: !1, line: 246, type: !13)
!205 = !DILocation(line: 246, column: 2, scope: !15)
!206 = !DILocalVariable(name: "_1_size", scope: !15, file: !1, line: 246, type: !9)
!207 = !DILocalVariable(name: "_1_has_ownership", scope: !15, file: !1, line: 247, type: !14)
!208 = !DILocation(line: 247, column: 2, scope: !15)
!209 = !DILocalVariable(name: "data", scope: !15, file: !1, line: 248, type: !13)
!210 = !DILocation(line: 248, column: 2, scope: !15)
!211 = !DILocalVariable(name: "data_size", scope: !15, file: !1, line: 248, type: !9)
!212 = !DILocalVariable(name: "data_has_ownership", scope: !15, file: !1, line: 249, type: !14)
!213 = !DILocation(line: 249, column: 2, scope: !15)
!214 = !DILocalVariable(name: "i", scope: !15, file: !1, line: 250, type: !9)
!215 = !DILocation(line: 250, column: 12, scope: !15)
!216 = !DILocalVariable(name: "_4", scope: !15, file: !1, line: 251, type: !9)
!217 = !DILocation(line: 251, column: 12, scope: !15)
!218 = !DILocalVariable(name: "_5", scope: !15, file: !1, line: 252, type: !13)
!219 = !DILocation(line: 252, column: 2, scope: !15)
!220 = !DILocalVariable(name: "_5_size", scope: !15, file: !1, line: 252, type: !9)
!221 = !DILocalVariable(name: "_5_has_ownership", scope: !15, file: !1, line: 253, type: !14)
!222 = !DILocation(line: 253, column: 2, scope: !15)
!223 = !DILocalVariable(name: "_6", scope: !15, file: !1, line: 254, type: !9)
!224 = !DILocation(line: 254, column: 12, scope: !15)
!225 = !DILocalVariable(name: "_7", scope: !15, file: !1, line: 255, type: !9)
!226 = !DILocation(line: 255, column: 12, scope: !15)
!227 = !DILocalVariable(name: "_8", scope: !15, file: !1, line: 256, type: !9)
!228 = !DILocation(line: 256, column: 12, scope: !15)
!229 = !DILocalVariable(name: "_9", scope: !15, file: !1, line: 257, type: !9)
!230 = !DILocation(line: 257, column: 12, scope: !15)
!231 = !DILocalVariable(name: "_10", scope: !15, file: !1, line: 258, type: !9)
!232 = !DILocation(line: 258, column: 12, scope: !15)
!233 = !DILocation(line: 263, column: 2, scope: !15)
!234 = !DILocation(line: 277, column: 7, scope: !235)
!235 = distinct !DILexicalBlock(scope: !236, file: !1, line: 277, column: 6)
!236 = distinct !DILexicalBlock(scope: !15, file: !1, line: 275, column: 13)
!237 = !DILocation(line: 277, column: 6, scope: !236)
!238 = !DILocation(line: 279, column: 6, scope: !236)
!239 = !DILocation(line: 281, column: 8, scope: !236)
!240 = !DILocation(line: 283, column: 3, scope: !236)
!241 = !DILocation(line: 283, column: 11, scope: !236)
!242 = !DILocation(line: 287, column: 8, scope: !236)
!243 = !DILocation(line: 298, column: 2, scope: !15)
!244 = !DILocation(line: 302, column: 14, scope: !18)
!245 = !DILocalVariable(name: "argc", arg: 1, scope: !18, file: !1, line: 302, type: !21)
!246 = !DILocalVariable(name: "args", arg: 2, scope: !18, file: !1, line: 302, type: !22)
!247 = !DILocation(line: 302, column: 27, scope: !18)
!248 = !DILocalVariable(name: "n", scope: !18, file: !1, line: 304, type: !9)
!249 = !DILocation(line: 304, column: 12, scope: !18)
!250 = !DILocalVariable(name: "data", scope: !18, file: !1, line: 305, type: !13)
!251 = !DILocation(line: 305, column: 2, scope: !18)
!252 = !DILocalVariable(name: "data_size", scope: !18, file: !1, line: 305, type: !9)
!253 = !DILocalVariable(name: "data_has_ownership", scope: !18, file: !1, line: 306, type: !14)
!254 = !DILocation(line: 306, column: 2, scope: !18)
!255 = !DILocalVariable(name: "gcds", scope: !18, file: !1, line: 307, type: !13)
!256 = !DILocation(line: 307, column: 2, scope: !18)
!257 = !DILocalVariable(name: "gcds_size", scope: !18, file: !1, line: 307, type: !9)
!258 = !DILocalVariable(name: "gcds_has_ownership", scope: !18, file: !1, line: 308, type: !14)
!259 = !DILocation(line: 308, column: 2, scope: !18)
!260 = !DILocalVariable(name: "sum", scope: !18, file: !1, line: 309, type: !9)
!261 = !DILocation(line: 309, column: 12, scope: !18)
!262 = !DILocalVariable(name: "i", scope: !18, file: !1, line: 310, type: !9)
!263 = !DILocation(line: 310, column: 12, scope: !18)
!264 = !DILocalVariable(name: "j", scope: !18, file: !1, line: 311, type: !9)
!265 = !DILocation(line: 311, column: 12, scope: !18)
!266 = !DILocalVariable(name: "_9", scope: !18, file: !1, line: 313, type: !267)
!267 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !13, size: 64, align: 64)
!268 = !DILocation(line: 313, column: 2, scope: !18)
!269 = !DILocalVariable(name: "_9_size", scope: !18, file: !1, line: 313, type: !9)
!270 = !DILocalVariable(name: "_9_size_size", scope: !18, file: !1, line: 313, type: !9)
!271 = !DILocalVariable(name: "_9_has_ownership", scope: !18, file: !1, line: 314, type: !14)
!272 = !DILocation(line: 314, column: 2, scope: !18)
!273 = !DILocalVariable(name: "_10", scope: !18, file: !1, line: 315, type: !9)
!274 = !DILocation(line: 315, column: 12, scope: !18)
!275 = !DILocalVariable(name: "_11", scope: !18, file: !1, line: 316, type: !13)
!276 = !DILocation(line: 316, column: 2, scope: !18)
!277 = !DILocalVariable(name: "_11_size", scope: !18, file: !1, line: 316, type: !9)
!278 = !DILocalVariable(name: "_11_has_ownership", scope: !18, file: !1, line: 317, type: !14)
!279 = !DILocation(line: 317, column: 2, scope: !18)
!280 = !DILocalVariable(name: "_12", scope: !18, file: !1, line: 318, type: !13)
!281 = !DILocation(line: 318, column: 2, scope: !18)
!282 = !DILocalVariable(name: "_12_size", scope: !18, file: !1, line: 318, type: !9)
!283 = !DILocalVariable(name: "_12_has_ownership", scope: !18, file: !1, line: 319, type: !14)
!284 = !DILocation(line: 319, column: 2, scope: !18)
!285 = !DILocalVariable(name: "_13", scope: !18, file: !1, line: 320, type: !13)
!286 = !DILocation(line: 320, column: 2, scope: !18)
!287 = !DILocalVariable(name: "_13_size", scope: !18, file: !1, line: 320, type: !9)
!288 = !DILocalVariable(name: "_13_has_ownership", scope: !18, file: !1, line: 321, type: !14)
!289 = !DILocation(line: 321, column: 2, scope: !18)
!290 = !DILocalVariable(name: "_14", scope: !18, file: !1, line: 322, type: !9)
!291 = !DILocation(line: 322, column: 12, scope: !18)
!292 = !DILocalVariable(name: "_15", scope: !18, file: !1, line: 323, type: !9)
!293 = !DILocation(line: 323, column: 12, scope: !18)
!294 = !DILocalVariable(name: "_16", scope: !18, file: !1, line: 324, type: !9)
!295 = !DILocation(line: 324, column: 12, scope: !18)
!296 = !DILocalVariable(name: "_17", scope: !18, file: !1, line: 325, type: !9)
!297 = !DILocation(line: 325, column: 12, scope: !18)
!298 = !DILocalVariable(name: "_18", scope: !18, file: !1, line: 326, type: !9)
!299 = !DILocation(line: 326, column: 12, scope: !18)
!300 = !DILocalVariable(name: "_19", scope: !18, file: !1, line: 327, type: !9)
!301 = !DILocation(line: 327, column: 12, scope: !18)
!302 = !DILocalVariable(name: "_20", scope: !18, file: !1, line: 328, type: !9)
!303 = !DILocation(line: 328, column: 12, scope: !18)
!304 = !DILocalVariable(name: "_21", scope: !18, file: !1, line: 329, type: !9)
!305 = !DILocation(line: 329, column: 12, scope: !18)
!306 = !DILocalVariable(name: "_22", scope: !18, file: !1, line: 330, type: !9)
!307 = !DILocation(line: 330, column: 12, scope: !18)
!308 = !DILocalVariable(name: "_23", scope: !18, file: !1, line: 331, type: !9)
!309 = !DILocation(line: 331, column: 12, scope: !18)
!310 = !DILocalVariable(name: "_24", scope: !18, file: !1, line: 332, type: !9)
!311 = !DILocation(line: 332, column: 12, scope: !18)
!312 = !DILocalVariable(name: "_27", scope: !18, file: !1, line: 334, type: !13)
!313 = !DILocation(line: 334, column: 2, scope: !18)
!314 = !DILocalVariable(name: "_27_size", scope: !18, file: !1, line: 334, type: !9)
!315 = !DILocalVariable(name: "_27_has_ownership", scope: !18, file: !1, line: 335, type: !14)
!316 = !DILocation(line: 335, column: 2, scope: !18)
!317 = !DILocation(line: 338, column: 2, scope: !18)
!318 = !DILocation(line: 343, column: 6, scope: !18)
!319 = !DILocation(line: 345, column: 2, scope: !18)
!320 = !DILocalVariable(name: "_8", scope: !18, file: !1, line: 312, type: !13)
!321 = !DILocation(line: 312, column: 13, scope: !18)
!322 = !DILocalVariable(name: "max", scope: !18, file: !1, line: 303, type: !13)
!323 = !DILocation(line: 303, column: 13, scope: !18)
!324 = !DILocation(line: 349, column: 9, scope: !325)
!325 = distinct !DILexicalBlock(scope: !18, file: !1, line: 349, column: 5)
!326 = !DILocation(line: 349, column: 5, scope: !18)
!327 = !DILocation(line: 351, column: 6, scope: !18)
!328 = !DILocation(line: 354, column: 8, scope: !18)
!329 = !DILocation(line: 365, column: 8, scope: !18)
!330 = !DILocation(line: 383, column: 7, scope: !331)
!331 = distinct !DILexicalBlock(scope: !332, file: !1, line: 383, column: 6)
!332 = distinct !DILexicalBlock(scope: !18, file: !1, line: 381, column: 13)
!333 = !DILocation(line: 383, column: 6, scope: !332)
!334 = !DILocation(line: 391, column: 8, scope: !335)
!335 = distinct !DILexicalBlock(scope: !336, file: !1, line: 391, column: 7)
!336 = distinct !DILexicalBlock(scope: !332, file: !1, line: 389, column: 14)
!337 = !DILocation(line: 391, column: 7, scope: !336)
!338 = !DILocation(line: 405, column: 9, scope: !336)
!339 = !DILocation(line: 393, column: 9, scope: !336)
!340 = !DILocation(line: 395, column: 11, scope: !336)
!341 = !DILocation(line: 397, column: 8, scope: !336)
!342 = !DILocation(line: 399, column: 11, scope: !336)
!343 = !DILocation(line: 416, column: 8, scope: !332)
!344 = !DILocation(line: 428, column: 2, scope: !18)
!345 = !DILocation(line: 429, column: 9, scope: !18)
!346 = !DILocation(line: 429, column: 15, scope: !18)
!347 = !DILocation(line: 429, column: 22, scope: !18)
!348 = !DILocation(line: 429, column: 28, scope: !18)
!349 = !DILocation(line: 429, column: 35, scope: !18)
!350 = !DILocation(line: 429, column: 41, scope: !18)
!351 = !DILocation(line: 429, column: 48, scope: !18)
!352 = !DILocation(line: 432, column: 2, scope: !18)
!353 = !DILocation(line: 436, column: 2, scope: !18)
!354 = !DILocation(line: 440, column: 2, scope: !18)
!355 = !DILocation(line: 440, column: 2, scope: !356)
!356 = !DILexicalBlockFile(scope: !357, file: !1, discriminator: 1)
!357 = distinct !DILexicalBlock(scope: !358, file: !1, line: 440, column: 2)
!358 = distinct !DILexicalBlock(scope: !18, file: !1, line: 440, column: 2)
!359 = !DILocation(line: 441, column: 2, scope: !360)
!360 = !DILexicalBlockFile(scope: !361, file: !1, discriminator: 1)
!361 = distinct !DILexicalBlock(scope: !362, file: !1, line: 441, column: 2)
!362 = distinct !DILexicalBlock(scope: !18, file: !1, line: 441, column: 2)
!363 = !DILocation(line: 442, column: 2, scope: !364)
!364 = !DILexicalBlockFile(scope: !365, file: !1, discriminator: 1)
!365 = distinct !DILexicalBlock(scope: !366, file: !1, line: 442, column: 2)
!366 = distinct !DILexicalBlock(scope: !18, file: !1, line: 442, column: 2)
!367 = !DILocation(line: 446, column: 2, scope: !368)
!368 = !DILexicalBlockFile(scope: !369, file: !1, discriminator: 1)
!369 = distinct !DILexicalBlock(scope: !370, file: !1, line: 446, column: 2)
!370 = distinct !DILexicalBlock(scope: !18, file: !1, line: 446, column: 2)
!371 = !DILocation(line: 447, column: 2, scope: !18)
