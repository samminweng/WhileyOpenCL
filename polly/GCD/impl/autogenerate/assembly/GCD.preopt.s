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
define i64 @gcd(i64 %a, i64 %b) #0 !dbg !4 {
entry:
  %retval = alloca i64, align 8
  %a.addr = alloca i64, align 8
  %b.addr = alloca i64, align 8
  %_2 = alloca i64, align 8
  %_3 = alloca i64, align 8
  %_4 = alloca i64, align 8
  %_5 = alloca i64, align 8
  %_6 = alloca i64, align 8
  %_7 = alloca i64, align 8
  store i64 %a, i64* %a.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %a.addr, metadata !25, metadata !26), !dbg !27
  store i64 %b, i64* %b.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %b.addr, metadata !28, metadata !26), !dbg !29
  call void @llvm.dbg.declare(metadata i64* %_2, metadata !30, metadata !26), !dbg !31
  store i64 0, i64* %_2, align 8, !dbg !31
  call void @llvm.dbg.declare(metadata i64* %_3, metadata !32, metadata !26), !dbg !33
  store i64 0, i64* %_3, align 8, !dbg !33
  call void @llvm.dbg.declare(metadata i64* %_4, metadata !34, metadata !26), !dbg !35
  store i64 0, i64* %_4, align 8, !dbg !35
  call void @llvm.dbg.declare(metadata i64* %_5, metadata !36, metadata !26), !dbg !37
  store i64 0, i64* %_5, align 8, !dbg !37
  call void @llvm.dbg.declare(metadata i64* %_6, metadata !38, metadata !26), !dbg !39
  store i64 0, i64* %_6, align 8, !dbg !39
  call void @llvm.dbg.declare(metadata i64* %_7, metadata !40, metadata !26), !dbg !41
  store i64 0, i64* %_7, align 8, !dbg !41
  store i64 0, i64* %_3, align 8, !dbg !42
  %0 = load i64, i64* %a.addr, align 8, !dbg !43
  %1 = load i64, i64* %_3, align 8, !dbg !45
  %cmp = icmp ne i64 %0, %1, !dbg !46
  br i1 %cmp, label %if.then, label %if.end, !dbg !47

if.then:                                          ; preds = %entry
  br label %blklab1, !dbg !48

if.end:                                           ; preds = %entry
  %2 = load i64, i64* %b.addr, align 8, !dbg !51
  store i64 %2, i64* %retval, align 8, !dbg !52
  br label %return, !dbg !52

blklab1:                                          ; preds = %if.then
  br label %while.body, !dbg !53

while.body:                                       ; preds = %blklab1, %blklab3
  store i64 0, i64* %_4, align 8, !dbg !54
  %3 = load i64, i64* %a.addr, align 8, !dbg !57
  %4 = load i64, i64* %_4, align 8, !dbg !59
  %cmp1 = icmp sge i64 %3, %4, !dbg !60
  br i1 %cmp1, label %if.then2, label %if.end3, !dbg !61

if.then2:                                         ; preds = %while.body
  br label %blklab4, !dbg !62

if.end3:                                          ; preds = %while.body
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !dbg !65
  %call = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %5, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str, i32 0, i32 0)), !dbg !66
  call void @exit(i32 -1) #5, !dbg !67
  unreachable, !dbg !67

blklab4:                                          ; preds = %if.then2
  store i64 0, i64* %_5, align 8, !dbg !68
  %6 = load i64, i64* %b.addr, align 8, !dbg !69
  %7 = load i64, i64* %_5, align 8, !dbg !71
  %cmp4 = icmp eq i64 %6, %7, !dbg !72
  br i1 %cmp4, label %if.then5, label %if.end6, !dbg !73

if.then5:                                         ; preds = %blklab4
  br label %blklab2, !dbg !74

if.end6:                                          ; preds = %blklab4
  %8 = load i64, i64* %a.addr, align 8, !dbg !77
  %9 = load i64, i64* %b.addr, align 8, !dbg !79
  %cmp7 = icmp sle i64 %8, %9, !dbg !80
  br i1 %cmp7, label %if.then8, label %if.end9, !dbg !81

if.then8:                                         ; preds = %if.end6
  br label %blklab5, !dbg !82

if.end9:                                          ; preds = %if.end6
  %10 = load i64, i64* %a.addr, align 8, !dbg !85
  %11 = load i64, i64* %b.addr, align 8, !dbg !86
  %sub = sub nsw i64 %10, %11, !dbg !87
  store i64 %sub, i64* %_6, align 8, !dbg !88
  %12 = load i64, i64* %_6, align 8, !dbg !89
  store i64 %12, i64* %a.addr, align 8, !dbg !90
  br label %blklab6, !dbg !91

blklab5:                                          ; preds = %if.then8
  %13 = load i64, i64* %b.addr, align 8, !dbg !92
  %14 = load i64, i64* %a.addr, align 8, !dbg !93
  %sub10 = sub nsw i64 %13, %14, !dbg !94
  store i64 %sub10, i64* %_7, align 8, !dbg !95
  %15 = load i64, i64* %_7, align 8, !dbg !96
  store i64 %15, i64* %b.addr, align 8, !dbg !97
  br label %blklab6, !dbg !98

blklab6:                                          ; preds = %blklab5, %if.end9
  br label %blklab3, !dbg !99

blklab3:                                          ; preds = %blklab6
  br label %while.body, !dbg !101

blklab2:                                          ; preds = %if.then5
  %16 = load i64, i64* %a.addr, align 8, !dbg !103
  store i64 %16, i64* %retval, align 8, !dbg !104
  br label %return, !dbg !104

return:                                           ; preds = %blklab2, %if.end
  %17 = load i64, i64* %retval, align 8, !dbg !105
  ret i64 %17, !dbg !105
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) #2

; Function Attrs: noreturn nounwind
declare void @exit(i32) #3

; Function Attrs: nounwind uwtable
define i64* @gcd_array(i64* %data, i64 %data_size, i64 %n) #0 !dbg !8 {
entry:
  %data.addr = alloca i64*, align 8
  %data_size.addr = alloca i64, align 8
  %n.addr = alloca i64, align 8
  %_2 = alloca i64*, align 8
  %_2_size = alloca i64, align 8
  %gcds = alloca i64*, align 8
  %gcds_size = alloca i64, align 8
  %sum = alloca i64, align 8
  %i = alloca i64, align 8
  %j = alloca i64, align 8
  %a = alloca i64, align 8
  %b = alloca i64, align 8
  %_9 = alloca i64, align 8
  %_10 = alloca i64, align 8
  %_11 = alloca i64*, align 8
  %_11_size = alloca i64, align 8
  %_12 = alloca i64, align 8
  %_13 = alloca i64, align 8
  %_14 = alloca i64, align 8
  %_15 = alloca i64, align 8
  %_16 = alloca i64, align 8
  %_17 = alloca i64, align 8
  %_18 = alloca i64, align 8
  %_19 = alloca i64, align 8
  %_20 = alloca i64, align 8
  %_21 = alloca i64, align 8
  %_22 = alloca i64, align 8
  %_23 = alloca i64, align 8
  %_24 = alloca i64, align 8
  %_25 = alloca i64, align 8
  %_26 = alloca i64, align 8
  %_27 = alloca i64, align 8
  %_28 = alloca i64, align 8
  %_29 = alloca i64, align 8
  %_30 = alloca i64, align 8
  %_31 = alloca i64, align 8
  %_32 = alloca i64, align 8
  %_33 = alloca i64, align 8
  %_34 = alloca i64, align 8
  %_35 = alloca i64, align 8
  %_36 = alloca i64, align 8
  %_37 = alloca i64, align 8
  store i64* %data, i64** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i64** %data.addr, metadata !106, metadata !26), !dbg !107
  store i64 %data_size, i64* %data_size.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %data_size.addr, metadata !108, metadata !26), !dbg !107
  store i64 %n, i64* %n.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %n.addr, metadata !109, metadata !26), !dbg !110
  call void @llvm.dbg.declare(metadata i64** %_2, metadata !111, metadata !26), !dbg !112
  store i64* null, i64** %_2, align 8, !dbg !112
  call void @llvm.dbg.declare(metadata i64* %_2_size, metadata !113, metadata !26), !dbg !112
  store i64 0, i64* %_2_size, align 8, !dbg !112
  call void @llvm.dbg.declare(metadata i64** %gcds, metadata !114, metadata !26), !dbg !115
  store i64* null, i64** %gcds, align 8, !dbg !115
  call void @llvm.dbg.declare(metadata i64* %gcds_size, metadata !116, metadata !26), !dbg !115
  store i64 0, i64* %gcds_size, align 8, !dbg !115
  call void @llvm.dbg.declare(metadata i64* %sum, metadata !117, metadata !26), !dbg !118
  store i64 0, i64* %sum, align 8, !dbg !118
  call void @llvm.dbg.declare(metadata i64* %i, metadata !119, metadata !26), !dbg !120
  store i64 0, i64* %i, align 8, !dbg !120
  call void @llvm.dbg.declare(metadata i64* %j, metadata !121, metadata !26), !dbg !122
  store i64 0, i64* %j, align 8, !dbg !122
  call void @llvm.dbg.declare(metadata i64* %a, metadata !123, metadata !26), !dbg !124
  store i64 0, i64* %a, align 8, !dbg !124
  call void @llvm.dbg.declare(metadata i64* %b, metadata !125, metadata !26), !dbg !126
  store i64 0, i64* %b, align 8, !dbg !126
  call void @llvm.dbg.declare(metadata i64* %_9, metadata !127, metadata !26), !dbg !128
  store i64 0, i64* %_9, align 8, !dbg !128
  call void @llvm.dbg.declare(metadata i64* %_10, metadata !129, metadata !26), !dbg !130
  store i64 0, i64* %_10, align 8, !dbg !130
  call void @llvm.dbg.declare(metadata i64** %_11, metadata !131, metadata !26), !dbg !132
  store i64* null, i64** %_11, align 8, !dbg !132
  call void @llvm.dbg.declare(metadata i64* %_11_size, metadata !133, metadata !26), !dbg !132
  store i64 0, i64* %_11_size, align 8, !dbg !132
  call void @llvm.dbg.declare(metadata i64* %_12, metadata !134, metadata !26), !dbg !135
  store i64 0, i64* %_12, align 8, !dbg !135
  call void @llvm.dbg.declare(metadata i64* %_13, metadata !136, metadata !26), !dbg !137
  store i64 0, i64* %_13, align 8, !dbg !137
  call void @llvm.dbg.declare(metadata i64* %_14, metadata !138, metadata !26), !dbg !139
  store i64 0, i64* %_14, align 8, !dbg !139
  call void @llvm.dbg.declare(metadata i64* %_15, metadata !140, metadata !26), !dbg !141
  store i64 0, i64* %_15, align 8, !dbg !141
  call void @llvm.dbg.declare(metadata i64* %_16, metadata !142, metadata !26), !dbg !143
  store i64 0, i64* %_16, align 8, !dbg !143
  call void @llvm.dbg.declare(metadata i64* %_17, metadata !144, metadata !26), !dbg !145
  store i64 0, i64* %_17, align 8, !dbg !145
  call void @llvm.dbg.declare(metadata i64* %_18, metadata !146, metadata !26), !dbg !147
  store i64 0, i64* %_18, align 8, !dbg !147
  call void @llvm.dbg.declare(metadata i64* %_19, metadata !148, metadata !26), !dbg !149
  store i64 0, i64* %_19, align 8, !dbg !149
  call void @llvm.dbg.declare(metadata i64* %_20, metadata !150, metadata !26), !dbg !151
  store i64 0, i64* %_20, align 8, !dbg !151
  call void @llvm.dbg.declare(metadata i64* %_21, metadata !152, metadata !26), !dbg !153
  store i64 0, i64* %_21, align 8, !dbg !153
  call void @llvm.dbg.declare(metadata i64* %_22, metadata !154, metadata !26), !dbg !155
  store i64 0, i64* %_22, align 8, !dbg !155
  call void @llvm.dbg.declare(metadata i64* %_23, metadata !156, metadata !26), !dbg !157
  store i64 0, i64* %_23, align 8, !dbg !157
  call void @llvm.dbg.declare(metadata i64* %_24, metadata !158, metadata !26), !dbg !159
  store i64 0, i64* %_24, align 8, !dbg !159
  call void @llvm.dbg.declare(metadata i64* %_25, metadata !160, metadata !26), !dbg !161
  store i64 0, i64* %_25, align 8, !dbg !161
  call void @llvm.dbg.declare(metadata i64* %_26, metadata !162, metadata !26), !dbg !163
  store i64 0, i64* %_26, align 8, !dbg !163
  call void @llvm.dbg.declare(metadata i64* %_27, metadata !164, metadata !26), !dbg !165
  store i64 0, i64* %_27, align 8, !dbg !165
  call void @llvm.dbg.declare(metadata i64* %_28, metadata !166, metadata !26), !dbg !167
  store i64 0, i64* %_28, align 8, !dbg !167
  call void @llvm.dbg.declare(metadata i64* %_29, metadata !168, metadata !26), !dbg !169
  store i64 0, i64* %_29, align 8, !dbg !169
  call void @llvm.dbg.declare(metadata i64* %_30, metadata !170, metadata !26), !dbg !171
  store i64 0, i64* %_30, align 8, !dbg !171
  call void @llvm.dbg.declare(metadata i64* %_31, metadata !172, metadata !26), !dbg !173
  store i64 0, i64* %_31, align 8, !dbg !173
  call void @llvm.dbg.declare(metadata i64* %_32, metadata !174, metadata !26), !dbg !175
  store i64 0, i64* %_32, align 8, !dbg !175
  call void @llvm.dbg.declare(metadata i64* %_33, metadata !176, metadata !26), !dbg !177
  store i64 0, i64* %_33, align 8, !dbg !177
  call void @llvm.dbg.declare(metadata i64* %_34, metadata !178, metadata !26), !dbg !179
  store i64 0, i64* %_34, align 8, !dbg !179
  call void @llvm.dbg.declare(metadata i64* %_35, metadata !180, metadata !26), !dbg !181
  store i64 0, i64* %_35, align 8, !dbg !181
  call void @llvm.dbg.declare(metadata i64* %_36, metadata !182, metadata !26), !dbg !183
  store i64 0, i64* %_36, align 8, !dbg !183
  call void @llvm.dbg.declare(metadata i64* %_37, metadata !184, metadata !26), !dbg !185
  store i64 0, i64* %_37, align 8, !dbg !185
  store i64 0, i64* %_9, align 8, !dbg !186
  %0 = load i64, i64* %n.addr, align 8, !dbg !187
  %1 = load i64, i64* %n.addr, align 8, !dbg !188
  %mul = mul nsw i64 %0, %1, !dbg !189
  store i64 %mul, i64* %_10, align 8, !dbg !190
  %2 = load i64, i64* %_10, align 8, !dbg !191
  store i64 %2, i64* %_11_size, align 8, !dbg !191
  %3 = load i64, i64* %_9, align 8, !dbg !191
  %conv = trunc i64 %3 to i32, !dbg !191
  %4 = load i64, i64* %_11_size, align 8, !dbg !191
  %conv1 = trunc i64 %4 to i32, !dbg !191
  %call = call i64* @gen1DArray(i32 %conv, i32 %conv1), !dbg !191
  store i64* %call, i64** %_11, align 8, !dbg !191
  %5 = load i64, i64* %_11_size, align 8, !dbg !192
  store i64 %5, i64* %gcds_size, align 8, !dbg !192
  %6 = load i64*, i64** %_11, align 8, !dbg !192
  store i64* %6, i64** %gcds, align 8, !dbg !192
  store i64 0, i64* %_12, align 8, !dbg !193
  %7 = load i64, i64* %_12, align 8, !dbg !194
  store i64 %7, i64* %sum, align 8, !dbg !195
  store i64 0, i64* %_13, align 8, !dbg !196
  %8 = load i64, i64* %_13, align 8, !dbg !197
  store i64 %8, i64* %i, align 8, !dbg !198
  br label %while.body, !dbg !199

while.body:                                       ; preds = %entry, %blklab8
  %9 = load i64, i64* %i, align 8, !dbg !200
  %10 = load i64, i64* %n.addr, align 8, !dbg !203
  %cmp = icmp sge i64 %9, %10, !dbg !204
  br i1 %cmp, label %if.then, label %if.end, !dbg !205

if.then:                                          ; preds = %while.body
  br label %blklab7, !dbg !206

if.end:                                           ; preds = %while.body
  store i64 0, i64* %_14, align 8, !dbg !209
  %11 = load i64, i64* %_14, align 8, !dbg !210
  store i64 %11, i64* %j, align 8, !dbg !211
  br label %while.body4, !dbg !212

while.body4:                                      ; preds = %if.end, %blklab10
  %12 = load i64, i64* %j, align 8, !dbg !213
  %13 = load i64, i64* %n.addr, align 8, !dbg !216
  %cmp5 = icmp sge i64 %12, %13, !dbg !217
  br i1 %cmp5, label %if.then7, label %if.end8, !dbg !218

if.then7:                                         ; preds = %while.body4
  br label %blklab9, !dbg !219

if.end8:                                          ; preds = %while.body4
  %14 = load i64, i64* %i, align 8, !dbg !222
  %15 = load i64*, i64** %data.addr, align 8, !dbg !223
  %arrayidx = getelementptr inbounds i64, i64* %15, i64 %14, !dbg !223
  %16 = load i64, i64* %arrayidx, align 8, !dbg !223
  store i64 %16, i64* %_15, align 8, !dbg !224
  %17 = load i64, i64* %_15, align 8, !dbg !225
  store i64 %17, i64* %a, align 8, !dbg !226
  %18 = load i64, i64* %j, align 8, !dbg !227
  %19 = load i64*, i64** %data.addr, align 8, !dbg !228
  %arrayidx9 = getelementptr inbounds i64, i64* %19, i64 %18, !dbg !228
  %20 = load i64, i64* %arrayidx9, align 8, !dbg !228
  store i64 %20, i64* %_16, align 8, !dbg !229
  %21 = load i64, i64* %_16, align 8, !dbg !230
  store i64 %21, i64* %b, align 8, !dbg !231
  store i64 0, i64* %_17, align 8, !dbg !232
  %22 = load i64, i64* %a, align 8, !dbg !233
  %23 = load i64, i64* %_17, align 8, !dbg !235
  %cmp10 = icmp ne i64 %22, %23, !dbg !236
  br i1 %cmp10, label %if.then12, label %if.end13, !dbg !237

if.then12:                                        ; preds = %if.end8
  br label %blklab11, !dbg !238

if.end13:                                         ; preds = %if.end8
  %24 = load i64, i64* %i, align 8, !dbg !241
  %25 = load i64, i64* %n.addr, align 8, !dbg !242
  %mul14 = mul nsw i64 %24, %25, !dbg !243
  store i64 %mul14, i64* %_18, align 8, !dbg !244
  %26 = load i64, i64* %_18, align 8, !dbg !245
  %27 = load i64, i64* %j, align 8, !dbg !246
  %add = add nsw i64 %26, %27, !dbg !247
  store i64 %add, i64* %_19, align 8, !dbg !248
  %28 = load i64, i64* %_19, align 8, !dbg !249
  %29 = load i64*, i64** %gcds, align 8, !dbg !250
  %arrayidx15 = getelementptr inbounds i64, i64* %29, i64 %28, !dbg !250
  %30 = load i64, i64* %arrayidx15, align 8, !dbg !250
  store i64 %30, i64* %_20, align 8, !dbg !251
  %31 = load i64, i64* %_20, align 8, !dbg !252
  %32 = load i64, i64* %b, align 8, !dbg !253
  %add16 = add nsw i64 %31, %32, !dbg !254
  store i64 %add16, i64* %_21, align 8, !dbg !255
  %33 = load i64, i64* %i, align 8, !dbg !256
  %34 = load i64, i64* %n.addr, align 8, !dbg !257
  %mul17 = mul nsw i64 %33, %34, !dbg !258
  store i64 %mul17, i64* %_22, align 8, !dbg !259
  %35 = load i64, i64* %_22, align 8, !dbg !260
  %36 = load i64, i64* %j, align 8, !dbg !261
  %add18 = add nsw i64 %35, %36, !dbg !262
  store i64 %add18, i64* %_23, align 8, !dbg !263
  %37 = load i64, i64* %_21, align 8, !dbg !264
  %38 = load i64, i64* %_23, align 8, !dbg !265
  %39 = load i64*, i64** %gcds, align 8, !dbg !266
  %arrayidx19 = getelementptr inbounds i64, i64* %39, i64 %38, !dbg !266
  store i64 %37, i64* %arrayidx19, align 8, !dbg !267
  br label %blklab12, !dbg !268

blklab11:                                         ; preds = %if.then12
  br label %while.body21, !dbg !269

while.body21:                                     ; preds = %blklab11, %blklab14
  store i64 0, i64* %_24, align 8, !dbg !270
  %40 = load i64, i64* %a, align 8, !dbg !273
  %41 = load i64, i64* %_24, align 8, !dbg !275
  %cmp22 = icmp sge i64 %40, %41, !dbg !276
  br i1 %cmp22, label %if.then24, label %if.end25, !dbg !277

if.then24:                                        ; preds = %while.body21
  br label %blklab15, !dbg !278

if.end25:                                         ; preds = %while.body21
  %42 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !dbg !281
  %call26 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %42, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str, i32 0, i32 0)), !dbg !282
  call void @exit(i32 -1) #5, !dbg !283
  unreachable, !dbg !283

blklab15:                                         ; preds = %if.then24
  store i64 0, i64* %_25, align 8, !dbg !284
  %43 = load i64, i64* %b, align 8, !dbg !285
  %44 = load i64, i64* %_25, align 8, !dbg !287
  %cmp27 = icmp eq i64 %43, %44, !dbg !288
  br i1 %cmp27, label %if.then29, label %if.end30, !dbg !289

if.then29:                                        ; preds = %blklab15
  br label %blklab13, !dbg !290

if.end30:                                         ; preds = %blklab15
  %45 = load i64, i64* %a, align 8, !dbg !293
  %46 = load i64, i64* %b, align 8, !dbg !295
  %cmp31 = icmp sle i64 %45, %46, !dbg !296
  br i1 %cmp31, label %if.then33, label %if.end34, !dbg !297

if.then33:                                        ; preds = %if.end30
  br label %blklab16, !dbg !298

if.end34:                                         ; preds = %if.end30
  %47 = load i64, i64* %a, align 8, !dbg !301
  %48 = load i64, i64* %b, align 8, !dbg !302
  %sub = sub nsw i64 %47, %48, !dbg !303
  store i64 %sub, i64* %_26, align 8, !dbg !304
  %49 = load i64, i64* %_26, align 8, !dbg !305
  store i64 %49, i64* %a, align 8, !dbg !306
  br label %blklab17, !dbg !307

blklab16:                                         ; preds = %if.then33
  %50 = load i64, i64* %b, align 8, !dbg !308
  %51 = load i64, i64* %a, align 8, !dbg !309
  %sub35 = sub nsw i64 %50, %51, !dbg !310
  store i64 %sub35, i64* %_27, align 8, !dbg !311
  %52 = load i64, i64* %_27, align 8, !dbg !312
  store i64 %52, i64* %b, align 8, !dbg !313
  br label %blklab17, !dbg !314

blklab17:                                         ; preds = %blklab16, %if.end34
  br label %blklab14, !dbg !315

blklab14:                                         ; preds = %blklab17
  br label %while.body21, !dbg !317

blklab13:                                         ; preds = %if.then29
  %53 = load i64, i64* %i, align 8, !dbg !319
  %54 = load i64, i64* %n.addr, align 8, !dbg !320
  %mul36 = mul nsw i64 %53, %54, !dbg !321
  store i64 %mul36, i64* %_28, align 8, !dbg !322
  %55 = load i64, i64* %_28, align 8, !dbg !323
  %56 = load i64, i64* %j, align 8, !dbg !324
  %add37 = add nsw i64 %55, %56, !dbg !325
  store i64 %add37, i64* %_29, align 8, !dbg !326
  %57 = load i64, i64* %_29, align 8, !dbg !327
  %58 = load i64*, i64** %gcds, align 8, !dbg !328
  %arrayidx38 = getelementptr inbounds i64, i64* %58, i64 %57, !dbg !328
  %59 = load i64, i64* %arrayidx38, align 8, !dbg !328
  store i64 %59, i64* %_30, align 8, !dbg !329
  %60 = load i64, i64* %_30, align 8, !dbg !330
  %61 = load i64, i64* %a, align 8, !dbg !331
  %add39 = add nsw i64 %60, %61, !dbg !332
  store i64 %add39, i64* %_31, align 8, !dbg !333
  %62 = load i64, i64* %i, align 8, !dbg !334
  %63 = load i64, i64* %n.addr, align 8, !dbg !335
  %mul40 = mul nsw i64 %62, %63, !dbg !336
  store i64 %mul40, i64* %_32, align 8, !dbg !337
  %64 = load i64, i64* %_32, align 8, !dbg !338
  %65 = load i64, i64* %j, align 8, !dbg !339
  %add41 = add nsw i64 %64, %65, !dbg !340
  store i64 %add41, i64* %_33, align 8, !dbg !341
  %66 = load i64, i64* %_31, align 8, !dbg !342
  %67 = load i64, i64* %_33, align 8, !dbg !343
  %68 = load i64*, i64** %gcds, align 8, !dbg !344
  %arrayidx42 = getelementptr inbounds i64, i64* %68, i64 %67, !dbg !344
  store i64 %66, i64* %arrayidx42, align 8, !dbg !345
  br label %blklab12, !dbg !344

blklab12:                                         ; preds = %blklab13, %if.end13
  store i64 1, i64* %_34, align 8, !dbg !346
  %69 = load i64, i64* %j, align 8, !dbg !347
  %70 = load i64, i64* %_34, align 8, !dbg !348
  %add43 = add nsw i64 %69, %70, !dbg !349
  store i64 %add43, i64* %_35, align 8, !dbg !350
  %71 = load i64, i64* %_35, align 8, !dbg !351
  store i64 %71, i64* %j, align 8, !dbg !352
  br label %blklab10, !dbg !353

blklab10:                                         ; preds = %blklab12
  br label %while.body4, !dbg !354

blklab9:                                          ; preds = %if.then7
  store i64 1, i64* %_36, align 8, !dbg !356
  %72 = load i64, i64* %i, align 8, !dbg !357
  %73 = load i64, i64* %_36, align 8, !dbg !358
  %add44 = add nsw i64 %72, %73, !dbg !359
  store i64 %add44, i64* %_37, align 8, !dbg !360
  %74 = load i64, i64* %_37, align 8, !dbg !361
  store i64 %74, i64* %i, align 8, !dbg !362
  br label %blklab8, !dbg !363

blklab8:                                          ; preds = %blklab9
  br label %while.body, !dbg !364

blklab7:                                          ; preds = %if.then
  %75 = load i64*, i64** %gcds, align 8, !dbg !366
  ret i64* %75, !dbg !367
}

declare i64* @gen1DArray(i32, i32) #2

; Function Attrs: nounwind uwtable
define i64* @init(i64 %n) #0 !dbg !12 {
entry:
  %n.addr = alloca i64, align 8
  %_1 = alloca i64*, align 8
  %_1_size = alloca i64, align 8
  %data = alloca i64*, align 8
  %data_size = alloca i64, align 8
  %i = alloca i64, align 8
  %_4 = alloca i64, align 8
  %_5 = alloca i64*, align 8
  %_5_size = alloca i64, align 8
  %_6 = alloca i64, align 8
  %_7 = alloca i64, align 8
  %_8 = alloca i64, align 8
  %_9 = alloca i64, align 8
  %_10 = alloca i64, align 8
  store i64 %n, i64* %n.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %n.addr, metadata !368, metadata !26), !dbg !369
  call void @llvm.dbg.declare(metadata i64** %_1, metadata !370, metadata !26), !dbg !371
  store i64* null, i64** %_1, align 8, !dbg !371
  call void @llvm.dbg.declare(metadata i64* %_1_size, metadata !372, metadata !26), !dbg !371
  store i64 0, i64* %_1_size, align 8, !dbg !371
  call void @llvm.dbg.declare(metadata i64** %data, metadata !373, metadata !26), !dbg !374
  store i64* null, i64** %data, align 8, !dbg !374
  call void @llvm.dbg.declare(metadata i64* %data_size, metadata !375, metadata !26), !dbg !374
  store i64 0, i64* %data_size, align 8, !dbg !374
  call void @llvm.dbg.declare(metadata i64* %i, metadata !376, metadata !26), !dbg !377
  store i64 0, i64* %i, align 8, !dbg !377
  call void @llvm.dbg.declare(metadata i64* %_4, metadata !378, metadata !26), !dbg !379
  store i64 0, i64* %_4, align 8, !dbg !379
  call void @llvm.dbg.declare(metadata i64** %_5, metadata !380, metadata !26), !dbg !381
  store i64* null, i64** %_5, align 8, !dbg !381
  call void @llvm.dbg.declare(metadata i64* %_5_size, metadata !382, metadata !26), !dbg !381
  store i64 0, i64* %_5_size, align 8, !dbg !381
  call void @llvm.dbg.declare(metadata i64* %_6, metadata !383, metadata !26), !dbg !384
  store i64 0, i64* %_6, align 8, !dbg !384
  call void @llvm.dbg.declare(metadata i64* %_7, metadata !385, metadata !26), !dbg !386
  store i64 0, i64* %_7, align 8, !dbg !386
  call void @llvm.dbg.declare(metadata i64* %_8, metadata !387, metadata !26), !dbg !388
  store i64 0, i64* %_8, align 8, !dbg !388
  call void @llvm.dbg.declare(metadata i64* %_9, metadata !389, metadata !26), !dbg !390
  store i64 0, i64* %_9, align 8, !dbg !390
  call void @llvm.dbg.declare(metadata i64* %_10, metadata !391, metadata !26), !dbg !392
  store i64 0, i64* %_10, align 8, !dbg !392
  store i64 0, i64* %_4, align 8, !dbg !393
  %0 = load i64, i64* %n.addr, align 8, !dbg !394
  store i64 %0, i64* %_5_size, align 8, !dbg !394
  %1 = load i64, i64* %_4, align 8, !dbg !394
  %conv = trunc i64 %1 to i32, !dbg !394
  %2 = load i64, i64* %_5_size, align 8, !dbg !394
  %conv1 = trunc i64 %2 to i32, !dbg !394
  %call = call i64* @gen1DArray(i32 %conv, i32 %conv1), !dbg !394
  store i64* %call, i64** %_5, align 8, !dbg !394
  %3 = load i64, i64* %_5_size, align 8, !dbg !395
  store i64 %3, i64* %data_size, align 8, !dbg !395
  %4 = load i64*, i64** %_5, align 8, !dbg !395
  store i64* %4, i64** %data, align 8, !dbg !395
  store i64 0, i64* %_6, align 8, !dbg !396
  %5 = load i64, i64* %_6, align 8, !dbg !397
  store i64 %5, i64* %i, align 8, !dbg !398
  br label %while.body, !dbg !399

while.body:                                       ; preds = %entry, %blklab19
  %6 = load i64, i64* %i, align 8, !dbg !400
  %7 = load i64, i64* %n.addr, align 8, !dbg !403
  %cmp = icmp sge i64 %6, %7, !dbg !404
  br i1 %cmp, label %if.then, label %if.end, !dbg !405

if.then:                                          ; preds = %while.body
  br label %blklab18, !dbg !406

if.end:                                           ; preds = %while.body
  %8 = load i64, i64* %i, align 8, !dbg !409
  %9 = load i64*, i64** %data, align 8, !dbg !410
  %arrayidx = getelementptr inbounds i64, i64* %9, i64 %8, !dbg !410
  %10 = load i64, i64* %arrayidx, align 8, !dbg !410
  store i64 %10, i64* %_7, align 8, !dbg !411
  %11 = load i64, i64* %_7, align 8, !dbg !412
  %12 = load i64, i64* %i, align 8, !dbg !413
  %add = add nsw i64 %11, %12, !dbg !414
  store i64 %add, i64* %_8, align 8, !dbg !415
  %13 = load i64, i64* %_8, align 8, !dbg !416
  %14 = load i64, i64* %i, align 8, !dbg !417
  %15 = load i64*, i64** %data, align 8, !dbg !418
  %arrayidx3 = getelementptr inbounds i64, i64* %15, i64 %14, !dbg !418
  store i64 %13, i64* %arrayidx3, align 8, !dbg !419
  store i64 1, i64* %_9, align 8, !dbg !420
  %16 = load i64, i64* %i, align 8, !dbg !421
  %17 = load i64, i64* %_9, align 8, !dbg !422
  %add4 = add nsw i64 %16, %17, !dbg !423
  store i64 %add4, i64* %_10, align 8, !dbg !424
  %18 = load i64, i64* %_10, align 8, !dbg !425
  store i64 %18, i64* %i, align 8, !dbg !426
  br label %blklab19, !dbg !427

blklab19:                                         ; preds = %if.end
  br label %while.body, !dbg !428

blklab18:                                         ; preds = %if.then
  %19 = load i64*, i64** %data, align 8, !dbg !430
  ret i64* %19, !dbg !431
}

; Function Attrs: nounwind uwtable
define i32 @main(i32 %argc, i8** %args) #0 !dbg !15 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %args.addr = alloca i8**, align 8
  %n = alloca i64, align 8
  %data = alloca i64*, align 8
  %data_size = alloca i64, align 8
  %gcds = alloca i64*, align 8
  %gcds_size = alloca i64, align 8
  %sum = alloca i64, align 8
  %i = alloca i64, align 8
  %j = alloca i64, align 8
  %_7 = alloca i64, align 8
  %_8 = alloca i64*, align 8
  %_8_size = alloca i64, align 8
  %_9 = alloca i64*, align 8
  %_9_size = alloca i64, align 8
  %_10 = alloca i64, align 8
  %_11 = alloca i64, align 8
  %_12 = alloca i64, align 8
  %_13 = alloca i64, align 8
  %_14 = alloca i64, align 8
  %_15 = alloca i64, align 8
  %_16 = alloca i64, align 8
  %_17 = alloca i64, align 8
  %_18 = alloca i64, align 8
  %_19 = alloca i64, align 8
  %_20 = alloca i64, align 8
  %_21 = alloca i8*, align 8
  %_23 = alloca i64*, align 8
  %_23_size = alloca i64, align 8
  %_24 = alloca i8*, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !432, metadata !26), !dbg !433
  store i8** %args, i8*** %args.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %args.addr, metadata !434, metadata !26), !dbg !435
  call void @llvm.dbg.declare(metadata i64* %n, metadata !436, metadata !26), !dbg !437
  store i64 0, i64* %n, align 8, !dbg !437
  call void @llvm.dbg.declare(metadata i64** %data, metadata !438, metadata !26), !dbg !439
  store i64* null, i64** %data, align 8, !dbg !439
  call void @llvm.dbg.declare(metadata i64* %data_size, metadata !440, metadata !26), !dbg !439
  store i64 0, i64* %data_size, align 8, !dbg !439
  call void @llvm.dbg.declare(metadata i64** %gcds, metadata !441, metadata !26), !dbg !442
  store i64* null, i64** %gcds, align 8, !dbg !442
  call void @llvm.dbg.declare(metadata i64* %gcds_size, metadata !443, metadata !26), !dbg !442
  store i64 0, i64* %gcds_size, align 8, !dbg !442
  call void @llvm.dbg.declare(metadata i64* %sum, metadata !444, metadata !26), !dbg !445
  store i64 0, i64* %sum, align 8, !dbg !445
  call void @llvm.dbg.declare(metadata i64* %i, metadata !446, metadata !26), !dbg !447
  store i64 0, i64* %i, align 8, !dbg !447
  call void @llvm.dbg.declare(metadata i64* %j, metadata !448, metadata !26), !dbg !449
  store i64 0, i64* %j, align 8, !dbg !449
  call void @llvm.dbg.declare(metadata i64* %_7, metadata !450, metadata !26), !dbg !451
  store i64 0, i64* %_7, align 8, !dbg !451
  call void @llvm.dbg.declare(metadata i64** %_8, metadata !452, metadata !26), !dbg !453
  store i64* null, i64** %_8, align 8, !dbg !453
  call void @llvm.dbg.declare(metadata i64* %_8_size, metadata !454, metadata !26), !dbg !453
  store i64 0, i64* %_8_size, align 8, !dbg !453
  call void @llvm.dbg.declare(metadata i64** %_9, metadata !455, metadata !26), !dbg !456
  store i64* null, i64** %_9, align 8, !dbg !456
  call void @llvm.dbg.declare(metadata i64* %_9_size, metadata !457, metadata !26), !dbg !456
  store i64 0, i64* %_9_size, align 8, !dbg !456
  call void @llvm.dbg.declare(metadata i64* %_10, metadata !458, metadata !26), !dbg !459
  store i64 0, i64* %_10, align 8, !dbg !459
  call void @llvm.dbg.declare(metadata i64* %_11, metadata !460, metadata !26), !dbg !461
  store i64 0, i64* %_11, align 8, !dbg !461
  call void @llvm.dbg.declare(metadata i64* %_12, metadata !462, metadata !26), !dbg !463
  store i64 0, i64* %_12, align 8, !dbg !463
  call void @llvm.dbg.declare(metadata i64* %_13, metadata !464, metadata !26), !dbg !465
  store i64 0, i64* %_13, align 8, !dbg !465
  call void @llvm.dbg.declare(metadata i64* %_14, metadata !466, metadata !26), !dbg !467
  store i64 0, i64* %_14, align 8, !dbg !467
  call void @llvm.dbg.declare(metadata i64* %_15, metadata !468, metadata !26), !dbg !469
  store i64 0, i64* %_15, align 8, !dbg !469
  call void @llvm.dbg.declare(metadata i64* %_16, metadata !470, metadata !26), !dbg !471
  store i64 0, i64* %_16, align 8, !dbg !471
  call void @llvm.dbg.declare(metadata i64* %_17, metadata !472, metadata !26), !dbg !473
  store i64 0, i64* %_17, align 8, !dbg !473
  call void @llvm.dbg.declare(metadata i64* %_18, metadata !474, metadata !26), !dbg !475
  store i64 0, i64* %_18, align 8, !dbg !475
  call void @llvm.dbg.declare(metadata i64* %_19, metadata !476, metadata !26), !dbg !477
  store i64 0, i64* %_19, align 8, !dbg !477
  call void @llvm.dbg.declare(metadata i64* %_20, metadata !478, metadata !26), !dbg !479
  store i64 0, i64* %_20, align 8, !dbg !479
  call void @llvm.dbg.declare(metadata i8** %_21, metadata !480, metadata !26), !dbg !482
  call void @llvm.dbg.declare(metadata i64** %_23, metadata !483, metadata !26), !dbg !484
  store i64* null, i64** %_23, align 8, !dbg !484
  call void @llvm.dbg.declare(metadata i64* %_23_size, metadata !485, metadata !26), !dbg !484
  store i64 0, i64* %_23_size, align 8, !dbg !484
  call void @llvm.dbg.declare(metadata i8** %_24, metadata !486, metadata !26), !dbg !487
  store i64 1000, i64* %_7, align 8, !dbg !488
  %0 = load i64, i64* %_7, align 8, !dbg !489
  store i64 %0, i64* %n, align 8, !dbg !490
  %1 = load i64, i64* %n, align 8, !dbg !491
  %call = call i64* @init(i64 %1), !dbg !492
  store i64* %call, i64** %_8, align 8, !dbg !493
  %2 = load i64, i64* %_8_size, align 8, !dbg !494
  store i64 %2, i64* %data_size, align 8, !dbg !494
  %3 = load i64*, i64** %_8, align 8, !dbg !494
  store i64* %3, i64** %data, align 8, !dbg !494
  %4 = load i64, i64* %data_size, align 8, !dbg !495
  store i64 %4, i64* %_9_size, align 8, !dbg !495
  %5 = load i64*, i64** %data, align 8, !dbg !496
  %6 = load i64, i64* %data_size, align 8, !dbg !496
  %7 = load i64, i64* %n, align 8, !dbg !497
  %call1 = call i64* @gcd_array(i64* %5, i64 %6, i64 %7), !dbg !498
  store i64* %call1, i64** %_9, align 8, !dbg !499
  %8 = load i64, i64* %_9_size, align 8, !dbg !500
  store i64 %8, i64* %gcds_size, align 8, !dbg !500
  %9 = load i64*, i64** %_9, align 8, !dbg !500
  store i64* %9, i64** %gcds, align 8, !dbg !500
  store i64 0, i64* %_10, align 8, !dbg !501
  %10 = load i64, i64* %_10, align 8, !dbg !502
  store i64 %10, i64* %sum, align 8, !dbg !503
  store i64 0, i64* %_11, align 8, !dbg !504
  %11 = load i64, i64* %_11, align 8, !dbg !505
  store i64 %11, i64* %i, align 8, !dbg !506
  br label %while.body, !dbg !507

while.body:                                       ; preds = %entry, %blklab21
  %12 = load i64, i64* %i, align 8, !dbg !508
  %13 = load i64, i64* %n, align 8, !dbg !511
  %cmp = icmp sge i64 %12, %13, !dbg !512
  br i1 %cmp, label %if.then, label %if.end, !dbg !513

if.then:                                          ; preds = %while.body
  br label %blklab20, !dbg !514

if.end:                                           ; preds = %while.body
  store i64 0, i64* %_12, align 8, !dbg !517
  %14 = load i64, i64* %_12, align 8, !dbg !518
  store i64 %14, i64* %j, align 8, !dbg !519
  br label %while.body3, !dbg !520

while.body3:                                      ; preds = %if.end, %blklab23
  %15 = load i64, i64* %j, align 8, !dbg !521
  %16 = load i64, i64* %n, align 8, !dbg !524
  %cmp4 = icmp sge i64 %15, %16, !dbg !525
  br i1 %cmp4, label %if.then5, label %if.end6, !dbg !526

if.then5:                                         ; preds = %while.body3
  br label %blklab22, !dbg !527

if.end6:                                          ; preds = %while.body3
  %17 = load i64, i64* %i, align 8, !dbg !530
  %18 = load i64, i64* %n, align 8, !dbg !531
  %mul = mul nsw i64 %17, %18, !dbg !532
  store i64 %mul, i64* %_13, align 8, !dbg !533
  %19 = load i64, i64* %_13, align 8, !dbg !534
  %20 = load i64, i64* %j, align 8, !dbg !535
  %add = add nsw i64 %19, %20, !dbg !536
  store i64 %add, i64* %_14, align 8, !dbg !537
  %21 = load i64, i64* %_14, align 8, !dbg !538
  %22 = load i64*, i64** %gcds, align 8, !dbg !539
  %arrayidx = getelementptr inbounds i64, i64* %22, i64 %21, !dbg !539
  %23 = load i64, i64* %arrayidx, align 8, !dbg !539
  store i64 %23, i64* %_15, align 8, !dbg !540
  %24 = load i64, i64* %sum, align 8, !dbg !541
  %25 = load i64, i64* %_15, align 8, !dbg !542
  %add7 = add nsw i64 %24, %25, !dbg !543
  store i64 %add7, i64* %_16, align 8, !dbg !544
  %26 = load i64, i64* %_16, align 8, !dbg !545
  store i64 %26, i64* %sum, align 8, !dbg !546
  store i64 1, i64* %_17, align 8, !dbg !547
  %27 = load i64, i64* %j, align 8, !dbg !548
  %28 = load i64, i64* %_17, align 8, !dbg !549
  %add8 = add nsw i64 %27, %28, !dbg !550
  store i64 %add8, i64* %_18, align 8, !dbg !551
  %29 = load i64, i64* %_18, align 8, !dbg !552
  store i64 %29, i64* %j, align 8, !dbg !553
  br label %blklab23, !dbg !554

blklab23:                                         ; preds = %if.end6
  br label %while.body3, !dbg !555

blklab22:                                         ; preds = %if.then5
  store i64 1, i64* %_19, align 8, !dbg !557
  %30 = load i64, i64* %i, align 8, !dbg !558
  %31 = load i64, i64* %_19, align 8, !dbg !559
  %add9 = add nsw i64 %30, %31, !dbg !560
  store i64 %add9, i64* %_20, align 8, !dbg !561
  %32 = load i64, i64* %_20, align 8, !dbg !562
  store i64 %32, i64* %i, align 8, !dbg !563
  br label %blklab21, !dbg !564

blklab21:                                         ; preds = %blklab22
  br label %while.body, !dbg !565

blklab20:                                         ; preds = %if.then
  store i64 4, i64* %_23_size, align 8, !dbg !567
  %call10 = call noalias i8* @malloc(i64 32) #6, !dbg !567
  %33 = bitcast i8* %call10 to i64*, !dbg !567
  store i64* %33, i64** %_23, align 8, !dbg !567
  %34 = load i64*, i64** %_23, align 8, !dbg !568
  %arrayidx11 = getelementptr inbounds i64, i64* %34, i64 0, !dbg !568
  store i64 83, i64* %arrayidx11, align 8, !dbg !569
  %35 = load i64*, i64** %_23, align 8, !dbg !570
  %arrayidx12 = getelementptr inbounds i64, i64* %35, i64 1, !dbg !570
  store i64 85, i64* %arrayidx12, align 8, !dbg !571
  %36 = load i64*, i64** %_23, align 8, !dbg !572
  %arrayidx13 = getelementptr inbounds i64, i64* %36, i64 2, !dbg !572
  store i64 77, i64* %arrayidx13, align 8, !dbg !573
  %37 = load i64*, i64** %_23, align 8, !dbg !574
  %arrayidx14 = getelementptr inbounds i64, i64* %37, i64 3, !dbg !574
  store i64 58, i64* %arrayidx14, align 8, !dbg !575
  %38 = load i64*, i64** %_23, align 8, !dbg !576
  %39 = load i64, i64* %_23_size, align 8, !dbg !576
  call void @printf_s(i64* %38, i64 %39), !dbg !577
  %40 = load i64, i64* %sum, align 8, !dbg !578
  %call15 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.1, i32 0, i32 0), i64 %40), !dbg !579
  call void @exit(i32 0) #5, !dbg !580
  unreachable, !dbg !580

return:                                           ; No predecessors!
  %41 = load i32, i32* %retval, align 4, !dbg !581
  ret i32 %41, !dbg !581
}

; Function Attrs: nounwind
declare noalias i8* @malloc(i64) #4

declare void @printf_s(i64*, i64) #2

declare i32 @printf(i8*, ...) #2

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone }
attributes #2 = { "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { noreturn nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { noreturn nounwind }
attributes #6 = { nounwind }

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
!25 = !DILocalVariable(name: "a", arg: 1, scope: !4, file: !1, line: 2, type: !7)
!26 = !DIExpression()
!27 = !DILocation(line: 2, column: 25, scope: !4)
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
!42 = !DILocation(line: 10, column: 5, scope: !4)
!43 = !DILocation(line: 12, column: 5, scope: !44)
!44 = distinct !DILexicalBlock(scope: !4, file: !1, line: 12, column: 5)
!45 = !DILocation(line: 12, column: 8, scope: !44)
!46 = !DILocation(line: 12, column: 6, scope: !44)
!47 = !DILocation(line: 12, column: 5, scope: !4)
!48 = !DILocation(line: 12, column: 12, scope: !49)
!49 = !DILexicalBlockFile(scope: !50, file: !1, discriminator: 1)
!50 = distinct !DILexicalBlock(scope: !44, file: !1, line: 12, column: 11)
!51 = !DILocation(line: 14, column: 9, scope: !4)
!52 = !DILocation(line: 14, column: 2, scope: !4)
!53 = !DILocation(line: 18, column: 2, scope: !4)
!54 = !DILocation(line: 22, column: 7, scope: !55)
!55 = distinct !DILexicalBlock(scope: !56, file: !1, line: 20, column: 3)
!56 = distinct !DILexicalBlock(scope: !4, file: !1, line: 18, column: 13)
!57 = !DILocation(line: 24, column: 7, scope: !58)
!58 = distinct !DILexicalBlock(scope: !55, file: !1, line: 24, column: 7)
!59 = !DILocation(line: 24, column: 10, scope: !58)
!60 = !DILocation(line: 24, column: 8, scope: !58)
!61 = !DILocation(line: 24, column: 7, scope: !55)
!62 = !DILocation(line: 24, column: 14, scope: !63)
!63 = !DILexicalBlockFile(scope: !64, file: !1, discriminator: 1)
!64 = distinct !DILexicalBlock(scope: !58, file: !1, line: 24, column: 13)
!65 = !DILocation(line: 26, column: 12, scope: !55)
!66 = !DILocation(line: 26, column: 4, scope: !55)
!67 = !DILocation(line: 27, column: 4, scope: !55)
!68 = !DILocation(line: 33, column: 6, scope: !56)
!69 = !DILocation(line: 35, column: 6, scope: !70)
!70 = distinct !DILexicalBlock(scope: !56, file: !1, line: 35, column: 6)
!71 = !DILocation(line: 35, column: 9, scope: !70)
!72 = !DILocation(line: 35, column: 7, scope: !70)
!73 = !DILocation(line: 35, column: 6, scope: !56)
!74 = !DILocation(line: 35, column: 13, scope: !75)
!75 = !DILexicalBlockFile(scope: !76, file: !1, discriminator: 1)
!76 = distinct !DILexicalBlock(scope: !70, file: !1, line: 35, column: 12)
!77 = !DILocation(line: 37, column: 6, scope: !78)
!78 = distinct !DILexicalBlock(scope: !56, file: !1, line: 37, column: 6)
!79 = !DILocation(line: 37, column: 9, scope: !78)
!80 = !DILocation(line: 37, column: 7, scope: !78)
!81 = !DILocation(line: 37, column: 6, scope: !56)
!82 = !DILocation(line: 37, column: 12, scope: !83)
!83 = !DILexicalBlockFile(scope: !84, file: !1, discriminator: 1)
!84 = distinct !DILexicalBlock(scope: !78, file: !1, line: 37, column: 11)
!85 = !DILocation(line: 39, column: 6, scope: !56)
!86 = !DILocation(line: 39, column: 8, scope: !56)
!87 = !DILocation(line: 39, column: 7, scope: !56)
!88 = !DILocation(line: 39, column: 5, scope: !56)
!89 = !DILocation(line: 41, column: 7, scope: !56)
!90 = !DILocation(line: 41, column: 5, scope: !56)
!91 = !DILocation(line: 43, column: 3, scope: !56)
!92 = !DILocation(line: 47, column: 6, scope: !56)
!93 = !DILocation(line: 47, column: 8, scope: !56)
!94 = !DILocation(line: 47, column: 7, scope: !56)
!95 = !DILocation(line: 47, column: 5, scope: !56)
!96 = !DILocation(line: 49, column: 7, scope: !56)
!97 = !DILocation(line: 49, column: 5, scope: !56)
!98 = !DILocation(line: 49, column: 3, scope: !56)
!99 = !DILocation(line: 49, column: 3, scope: !100)
!100 = !DILexicalBlockFile(scope: !56, file: !1, discriminator: 1)
!101 = !DILocation(line: 18, column: 2, scope: !102)
!102 = !DILexicalBlockFile(scope: !4, file: !1, discriminator: 1)
!103 = !DILocation(line: 58, column: 9, scope: !4)
!104 = !DILocation(line: 58, column: 2, scope: !4)
!105 = !DILocation(line: 60, column: 1, scope: !4)
!106 = !DILocalVariable(name: "data", arg: 1, scope: !8, file: !1, line: 62, type: !11)
!107 = !DILocation(line: 62, column: 22, scope: !8)
!108 = !DILocalVariable(name: "data_size", arg: 2, scope: !8, file: !1, line: 62, type: !7)
!109 = !DILocalVariable(name: "n", arg: 3, scope: !8, file: !1, line: 62, type: !7)
!110 = !DILocation(line: 62, column: 59, scope: !8)
!111 = !DILocalVariable(name: "_2", scope: !8, file: !1, line: 63, type: !11)
!112 = !DILocation(line: 63, column: 2, scope: !8)
!113 = !DILocalVariable(name: "_2_size", scope: !8, file: !1, line: 63, type: !7)
!114 = !DILocalVariable(name: "gcds", scope: !8, file: !1, line: 64, type: !11)
!115 = !DILocation(line: 64, column: 2, scope: !8)
!116 = !DILocalVariable(name: "gcds_size", scope: !8, file: !1, line: 64, type: !7)
!117 = !DILocalVariable(name: "sum", scope: !8, file: !1, line: 65, type: !7)
!118 = !DILocation(line: 65, column: 12, scope: !8)
!119 = !DILocalVariable(name: "i", scope: !8, file: !1, line: 66, type: !7)
!120 = !DILocation(line: 66, column: 12, scope: !8)
!121 = !DILocalVariable(name: "j", scope: !8, file: !1, line: 67, type: !7)
!122 = !DILocation(line: 67, column: 12, scope: !8)
!123 = !DILocalVariable(name: "a", scope: !8, file: !1, line: 68, type: !7)
!124 = !DILocation(line: 68, column: 12, scope: !8)
!125 = !DILocalVariable(name: "b", scope: !8, file: !1, line: 69, type: !7)
!126 = !DILocation(line: 69, column: 12, scope: !8)
!127 = !DILocalVariable(name: "_9", scope: !8, file: !1, line: 70, type: !7)
!128 = !DILocation(line: 70, column: 12, scope: !8)
!129 = !DILocalVariable(name: "_10", scope: !8, file: !1, line: 71, type: !7)
!130 = !DILocation(line: 71, column: 12, scope: !8)
!131 = !DILocalVariable(name: "_11", scope: !8, file: !1, line: 72, type: !11)
!132 = !DILocation(line: 72, column: 2, scope: !8)
!133 = !DILocalVariable(name: "_11_size", scope: !8, file: !1, line: 72, type: !7)
!134 = !DILocalVariable(name: "_12", scope: !8, file: !1, line: 73, type: !7)
!135 = !DILocation(line: 73, column: 12, scope: !8)
!136 = !DILocalVariable(name: "_13", scope: !8, file: !1, line: 74, type: !7)
!137 = !DILocation(line: 74, column: 12, scope: !8)
!138 = !DILocalVariable(name: "_14", scope: !8, file: !1, line: 75, type: !7)
!139 = !DILocation(line: 75, column: 12, scope: !8)
!140 = !DILocalVariable(name: "_15", scope: !8, file: !1, line: 76, type: !7)
!141 = !DILocation(line: 76, column: 12, scope: !8)
!142 = !DILocalVariable(name: "_16", scope: !8, file: !1, line: 77, type: !7)
!143 = !DILocation(line: 77, column: 12, scope: !8)
!144 = !DILocalVariable(name: "_17", scope: !8, file: !1, line: 78, type: !7)
!145 = !DILocation(line: 78, column: 12, scope: !8)
!146 = !DILocalVariable(name: "_18", scope: !8, file: !1, line: 79, type: !7)
!147 = !DILocation(line: 79, column: 12, scope: !8)
!148 = !DILocalVariable(name: "_19", scope: !8, file: !1, line: 80, type: !7)
!149 = !DILocation(line: 80, column: 12, scope: !8)
!150 = !DILocalVariable(name: "_20", scope: !8, file: !1, line: 81, type: !7)
!151 = !DILocation(line: 81, column: 12, scope: !8)
!152 = !DILocalVariable(name: "_21", scope: !8, file: !1, line: 82, type: !7)
!153 = !DILocation(line: 82, column: 12, scope: !8)
!154 = !DILocalVariable(name: "_22", scope: !8, file: !1, line: 83, type: !7)
!155 = !DILocation(line: 83, column: 12, scope: !8)
!156 = !DILocalVariable(name: "_23", scope: !8, file: !1, line: 84, type: !7)
!157 = !DILocation(line: 84, column: 12, scope: !8)
!158 = !DILocalVariable(name: "_24", scope: !8, file: !1, line: 85, type: !7)
!159 = !DILocation(line: 85, column: 12, scope: !8)
!160 = !DILocalVariable(name: "_25", scope: !8, file: !1, line: 86, type: !7)
!161 = !DILocation(line: 86, column: 12, scope: !8)
!162 = !DILocalVariable(name: "_26", scope: !8, file: !1, line: 87, type: !7)
!163 = !DILocation(line: 87, column: 12, scope: !8)
!164 = !DILocalVariable(name: "_27", scope: !8, file: !1, line: 88, type: !7)
!165 = !DILocation(line: 88, column: 12, scope: !8)
!166 = !DILocalVariable(name: "_28", scope: !8, file: !1, line: 89, type: !7)
!167 = !DILocation(line: 89, column: 12, scope: !8)
!168 = !DILocalVariable(name: "_29", scope: !8, file: !1, line: 90, type: !7)
!169 = !DILocation(line: 90, column: 12, scope: !8)
!170 = !DILocalVariable(name: "_30", scope: !8, file: !1, line: 91, type: !7)
!171 = !DILocation(line: 91, column: 12, scope: !8)
!172 = !DILocalVariable(name: "_31", scope: !8, file: !1, line: 92, type: !7)
!173 = !DILocation(line: 92, column: 12, scope: !8)
!174 = !DILocalVariable(name: "_32", scope: !8, file: !1, line: 93, type: !7)
!175 = !DILocation(line: 93, column: 12, scope: !8)
!176 = !DILocalVariable(name: "_33", scope: !8, file: !1, line: 94, type: !7)
!177 = !DILocation(line: 94, column: 12, scope: !8)
!178 = !DILocalVariable(name: "_34", scope: !8, file: !1, line: 95, type: !7)
!179 = !DILocation(line: 95, column: 12, scope: !8)
!180 = !DILocalVariable(name: "_35", scope: !8, file: !1, line: 96, type: !7)
!181 = !DILocation(line: 96, column: 12, scope: !8)
!182 = !DILocalVariable(name: "_36", scope: !8, file: !1, line: 97, type: !7)
!183 = !DILocation(line: 97, column: 12, scope: !8)
!184 = !DILocalVariable(name: "_37", scope: !8, file: !1, line: 98, type: !7)
!185 = !DILocation(line: 98, column: 12, scope: !8)
!186 = !DILocation(line: 100, column: 5, scope: !8)
!187 = !DILocation(line: 102, column: 6, scope: !8)
!188 = !DILocation(line: 102, column: 8, scope: !8)
!189 = !DILocation(line: 102, column: 7, scope: !8)
!190 = !DILocation(line: 102, column: 5, scope: !8)
!191 = !DILocation(line: 104, column: 2, scope: !8)
!192 = !DILocation(line: 106, column: 2, scope: !8)
!193 = !DILocation(line: 108, column: 6, scope: !8)
!194 = !DILocation(line: 110, column: 8, scope: !8)
!195 = !DILocation(line: 110, column: 6, scope: !8)
!196 = !DILocation(line: 112, column: 6, scope: !8)
!197 = !DILocation(line: 114, column: 6, scope: !8)
!198 = !DILocation(line: 114, column: 4, scope: !8)
!199 = !DILocation(line: 116, column: 2, scope: !8)
!200 = !DILocation(line: 118, column: 6, scope: !201)
!201 = distinct !DILexicalBlock(scope: !202, file: !1, line: 118, column: 6)
!202 = distinct !DILexicalBlock(scope: !8, file: !1, line: 116, column: 13)
!203 = !DILocation(line: 118, column: 9, scope: !201)
!204 = !DILocation(line: 118, column: 7, scope: !201)
!205 = !DILocation(line: 118, column: 6, scope: !202)
!206 = !DILocation(line: 118, column: 12, scope: !207)
!207 = !DILexicalBlockFile(scope: !208, file: !1, discriminator: 1)
!208 = distinct !DILexicalBlock(scope: !201, file: !1, line: 118, column: 11)
!209 = !DILocation(line: 120, column: 7, scope: !202)
!210 = !DILocation(line: 122, column: 7, scope: !202)
!211 = !DILocation(line: 122, column: 5, scope: !202)
!212 = !DILocation(line: 124, column: 3, scope: !202)
!213 = !DILocation(line: 126, column: 7, scope: !214)
!214 = distinct !DILexicalBlock(scope: !215, file: !1, line: 126, column: 7)
!215 = distinct !DILexicalBlock(scope: !202, file: !1, line: 124, column: 14)
!216 = !DILocation(line: 126, column: 10, scope: !214)
!217 = !DILocation(line: 126, column: 8, scope: !214)
!218 = !DILocation(line: 126, column: 7, scope: !215)
!219 = !DILocation(line: 126, column: 13, scope: !220)
!220 = !DILexicalBlockFile(scope: !221, file: !1, discriminator: 1)
!221 = distinct !DILexicalBlock(scope: !214, file: !1, line: 126, column: 12)
!222 = !DILocation(line: 128, column: 13, scope: !215)
!223 = !DILocation(line: 128, column: 8, scope: !215)
!224 = !DILocation(line: 128, column: 7, scope: !215)
!225 = !DILocation(line: 130, column: 8, scope: !215)
!226 = !DILocation(line: 130, column: 6, scope: !215)
!227 = !DILocation(line: 132, column: 13, scope: !215)
!228 = !DILocation(line: 132, column: 8, scope: !215)
!229 = !DILocation(line: 132, column: 7, scope: !215)
!230 = !DILocation(line: 134, column: 8, scope: !215)
!231 = !DILocation(line: 134, column: 6, scope: !215)
!232 = !DILocation(line: 136, column: 8, scope: !215)
!233 = !DILocation(line: 138, column: 7, scope: !234)
!234 = distinct !DILexicalBlock(scope: !215, file: !1, line: 138, column: 7)
!235 = !DILocation(line: 138, column: 10, scope: !234)
!236 = !DILocation(line: 138, column: 8, scope: !234)
!237 = !DILocation(line: 138, column: 7, scope: !215)
!238 = !DILocation(line: 138, column: 15, scope: !239)
!239 = !DILexicalBlockFile(scope: !240, file: !1, discriminator: 1)
!240 = distinct !DILexicalBlock(scope: !234, file: !1, line: 138, column: 14)
!241 = !DILocation(line: 140, column: 8, scope: !215)
!242 = !DILocation(line: 140, column: 10, scope: !215)
!243 = !DILocation(line: 140, column: 9, scope: !215)
!244 = !DILocation(line: 140, column: 7, scope: !215)
!245 = !DILocation(line: 142, column: 8, scope: !215)
!246 = !DILocation(line: 142, column: 12, scope: !215)
!247 = !DILocation(line: 142, column: 11, scope: !215)
!248 = !DILocation(line: 142, column: 7, scope: !215)
!249 = !DILocation(line: 144, column: 13, scope: !215)
!250 = !DILocation(line: 144, column: 8, scope: !215)
!251 = !DILocation(line: 144, column: 7, scope: !215)
!252 = !DILocation(line: 146, column: 8, scope: !215)
!253 = !DILocation(line: 146, column: 12, scope: !215)
!254 = !DILocation(line: 146, column: 11, scope: !215)
!255 = !DILocation(line: 146, column: 7, scope: !215)
!256 = !DILocation(line: 148, column: 8, scope: !215)
!257 = !DILocation(line: 148, column: 10, scope: !215)
!258 = !DILocation(line: 148, column: 9, scope: !215)
!259 = !DILocation(line: 148, column: 7, scope: !215)
!260 = !DILocation(line: 150, column: 8, scope: !215)
!261 = !DILocation(line: 150, column: 12, scope: !215)
!262 = !DILocation(line: 150, column: 11, scope: !215)
!263 = !DILocation(line: 150, column: 7, scope: !215)
!264 = !DILocation(line: 152, column: 16, scope: !215)
!265 = !DILocation(line: 152, column: 9, scope: !215)
!266 = !DILocation(line: 152, column: 4, scope: !215)
!267 = !DILocation(line: 152, column: 14, scope: !215)
!268 = !DILocation(line: 154, column: 4, scope: !215)
!269 = !DILocation(line: 158, column: 4, scope: !215)
!270 = !DILocation(line: 162, column: 10, scope: !271)
!271 = distinct !DILexicalBlock(scope: !272, file: !1, line: 160, column: 5)
!272 = distinct !DILexicalBlock(scope: !215, file: !1, line: 158, column: 15)
!273 = !DILocation(line: 164, column: 9, scope: !274)
!274 = distinct !DILexicalBlock(scope: !271, file: !1, line: 164, column: 9)
!275 = !DILocation(line: 164, column: 12, scope: !274)
!276 = !DILocation(line: 164, column: 10, scope: !274)
!277 = !DILocation(line: 164, column: 9, scope: !271)
!278 = !DILocation(line: 164, column: 17, scope: !279)
!279 = !DILexicalBlockFile(scope: !280, file: !1, discriminator: 1)
!280 = distinct !DILexicalBlock(scope: !274, file: !1, line: 164, column: 16)
!281 = !DILocation(line: 166, column: 14, scope: !271)
!282 = !DILocation(line: 166, column: 6, scope: !271)
!283 = !DILocation(line: 167, column: 6, scope: !271)
!284 = !DILocation(line: 173, column: 9, scope: !272)
!285 = !DILocation(line: 175, column: 8, scope: !286)
!286 = distinct !DILexicalBlock(scope: !272, file: !1, line: 175, column: 8)
!287 = !DILocation(line: 175, column: 11, scope: !286)
!288 = !DILocation(line: 175, column: 9, scope: !286)
!289 = !DILocation(line: 175, column: 8, scope: !272)
!290 = !DILocation(line: 175, column: 16, scope: !291)
!291 = !DILexicalBlockFile(scope: !292, file: !1, discriminator: 1)
!292 = distinct !DILexicalBlock(scope: !286, file: !1, line: 175, column: 15)
!293 = !DILocation(line: 177, column: 8, scope: !294)
!294 = distinct !DILexicalBlock(scope: !272, file: !1, line: 177, column: 8)
!295 = !DILocation(line: 177, column: 11, scope: !294)
!296 = !DILocation(line: 177, column: 9, scope: !294)
!297 = !DILocation(line: 177, column: 8, scope: !272)
!298 = !DILocation(line: 177, column: 14, scope: !299)
!299 = !DILexicalBlockFile(scope: !300, file: !1, discriminator: 1)
!300 = distinct !DILexicalBlock(scope: !294, file: !1, line: 177, column: 13)
!301 = !DILocation(line: 179, column: 9, scope: !272)
!302 = !DILocation(line: 179, column: 11, scope: !272)
!303 = !DILocation(line: 179, column: 10, scope: !272)
!304 = !DILocation(line: 179, column: 8, scope: !272)
!305 = !DILocation(line: 181, column: 9, scope: !272)
!306 = !DILocation(line: 181, column: 7, scope: !272)
!307 = !DILocation(line: 183, column: 5, scope: !272)
!308 = !DILocation(line: 187, column: 9, scope: !272)
!309 = !DILocation(line: 187, column: 11, scope: !272)
!310 = !DILocation(line: 187, column: 10, scope: !272)
!311 = !DILocation(line: 187, column: 8, scope: !272)
!312 = !DILocation(line: 189, column: 9, scope: !272)
!313 = !DILocation(line: 189, column: 7, scope: !272)
!314 = !DILocation(line: 189, column: 5, scope: !272)
!315 = !DILocation(line: 189, column: 5, scope: !316)
!316 = !DILexicalBlockFile(scope: !272, file: !1, discriminator: 1)
!317 = !DILocation(line: 158, column: 4, scope: !318)
!318 = !DILexicalBlockFile(scope: !215, file: !1, discriminator: 1)
!319 = !DILocation(line: 198, column: 8, scope: !215)
!320 = !DILocation(line: 198, column: 10, scope: !215)
!321 = !DILocation(line: 198, column: 9, scope: !215)
!322 = !DILocation(line: 198, column: 7, scope: !215)
!323 = !DILocation(line: 200, column: 8, scope: !215)
!324 = !DILocation(line: 200, column: 12, scope: !215)
!325 = !DILocation(line: 200, column: 11, scope: !215)
!326 = !DILocation(line: 200, column: 7, scope: !215)
!327 = !DILocation(line: 202, column: 13, scope: !215)
!328 = !DILocation(line: 202, column: 8, scope: !215)
!329 = !DILocation(line: 202, column: 7, scope: !215)
!330 = !DILocation(line: 204, column: 8, scope: !215)
!331 = !DILocation(line: 204, column: 12, scope: !215)
!332 = !DILocation(line: 204, column: 11, scope: !215)
!333 = !DILocation(line: 204, column: 7, scope: !215)
!334 = !DILocation(line: 206, column: 8, scope: !215)
!335 = !DILocation(line: 206, column: 10, scope: !215)
!336 = !DILocation(line: 206, column: 9, scope: !215)
!337 = !DILocation(line: 206, column: 7, scope: !215)
!338 = !DILocation(line: 208, column: 8, scope: !215)
!339 = !DILocation(line: 208, column: 12, scope: !215)
!340 = !DILocation(line: 208, column: 11, scope: !215)
!341 = !DILocation(line: 208, column: 7, scope: !215)
!342 = !DILocation(line: 210, column: 16, scope: !215)
!343 = !DILocation(line: 210, column: 9, scope: !215)
!344 = !DILocation(line: 210, column: 4, scope: !215)
!345 = !DILocation(line: 210, column: 14, scope: !215)
!346 = !DILocation(line: 214, column: 8, scope: !215)
!347 = !DILocation(line: 216, column: 8, scope: !215)
!348 = !DILocation(line: 216, column: 10, scope: !215)
!349 = !DILocation(line: 216, column: 9, scope: !215)
!350 = !DILocation(line: 216, column: 7, scope: !215)
!351 = !DILocation(line: 218, column: 8, scope: !215)
!352 = !DILocation(line: 218, column: 6, scope: !215)
!353 = !DILocation(line: 218, column: 4, scope: !215)
!354 = !DILocation(line: 124, column: 3, scope: !355)
!355 = !DILexicalBlockFile(scope: !202, file: !1, discriminator: 1)
!356 = !DILocation(line: 225, column: 7, scope: !202)
!357 = !DILocation(line: 227, column: 7, scope: !202)
!358 = !DILocation(line: 227, column: 9, scope: !202)
!359 = !DILocation(line: 227, column: 8, scope: !202)
!360 = !DILocation(line: 227, column: 6, scope: !202)
!361 = !DILocation(line: 229, column: 7, scope: !202)
!362 = !DILocation(line: 229, column: 5, scope: !202)
!363 = !DILocation(line: 229, column: 3, scope: !202)
!364 = !DILocation(line: 116, column: 2, scope: !365)
!365 = !DILexicalBlockFile(scope: !8, file: !1, discriminator: 1)
!366 = !DILocation(line: 236, column: 9, scope: !8)
!367 = !DILocation(line: 236, column: 2, scope: !8)
!368 = !DILocalVariable(name: "n", arg: 1, scope: !12, file: !1, line: 240, type: !7)
!369 = !DILocation(line: 240, column: 27, scope: !12)
!370 = !DILocalVariable(name: "_1", scope: !12, file: !1, line: 241, type: !11)
!371 = !DILocation(line: 241, column: 2, scope: !12)
!372 = !DILocalVariable(name: "_1_size", scope: !12, file: !1, line: 241, type: !7)
!373 = !DILocalVariable(name: "data", scope: !12, file: !1, line: 242, type: !11)
!374 = !DILocation(line: 242, column: 2, scope: !12)
!375 = !DILocalVariable(name: "data_size", scope: !12, file: !1, line: 242, type: !7)
!376 = !DILocalVariable(name: "i", scope: !12, file: !1, line: 243, type: !7)
!377 = !DILocation(line: 243, column: 12, scope: !12)
!378 = !DILocalVariable(name: "_4", scope: !12, file: !1, line: 244, type: !7)
!379 = !DILocation(line: 244, column: 12, scope: !12)
!380 = !DILocalVariable(name: "_5", scope: !12, file: !1, line: 245, type: !11)
!381 = !DILocation(line: 245, column: 2, scope: !12)
!382 = !DILocalVariable(name: "_5_size", scope: !12, file: !1, line: 245, type: !7)
!383 = !DILocalVariable(name: "_6", scope: !12, file: !1, line: 246, type: !7)
!384 = !DILocation(line: 246, column: 12, scope: !12)
!385 = !DILocalVariable(name: "_7", scope: !12, file: !1, line: 247, type: !7)
!386 = !DILocation(line: 247, column: 12, scope: !12)
!387 = !DILocalVariable(name: "_8", scope: !12, file: !1, line: 248, type: !7)
!388 = !DILocation(line: 248, column: 12, scope: !12)
!389 = !DILocalVariable(name: "_9", scope: !12, file: !1, line: 249, type: !7)
!390 = !DILocation(line: 249, column: 12, scope: !12)
!391 = !DILocalVariable(name: "_10", scope: !12, file: !1, line: 250, type: !7)
!392 = !DILocation(line: 250, column: 12, scope: !12)
!393 = !DILocation(line: 252, column: 5, scope: !12)
!394 = !DILocation(line: 254, column: 2, scope: !12)
!395 = !DILocation(line: 256, column: 2, scope: !12)
!396 = !DILocation(line: 258, column: 5, scope: !12)
!397 = !DILocation(line: 260, column: 6, scope: !12)
!398 = !DILocation(line: 260, column: 4, scope: !12)
!399 = !DILocation(line: 262, column: 2, scope: !12)
!400 = !DILocation(line: 264, column: 6, scope: !401)
!401 = distinct !DILexicalBlock(scope: !402, file: !1, line: 264, column: 6)
!402 = distinct !DILexicalBlock(scope: !12, file: !1, line: 262, column: 13)
!403 = !DILocation(line: 264, column: 9, scope: !401)
!404 = !DILocation(line: 264, column: 7, scope: !401)
!405 = !DILocation(line: 264, column: 6, scope: !402)
!406 = !DILocation(line: 264, column: 12, scope: !407)
!407 = !DILexicalBlockFile(scope: !408, file: !1, discriminator: 1)
!408 = distinct !DILexicalBlock(scope: !401, file: !1, line: 264, column: 11)
!409 = !DILocation(line: 266, column: 11, scope: !402)
!410 = !DILocation(line: 266, column: 6, scope: !402)
!411 = !DILocation(line: 266, column: 5, scope: !402)
!412 = !DILocation(line: 268, column: 6, scope: !402)
!413 = !DILocation(line: 268, column: 9, scope: !402)
!414 = !DILocation(line: 268, column: 8, scope: !402)
!415 = !DILocation(line: 268, column: 5, scope: !402)
!416 = !DILocation(line: 270, column: 13, scope: !402)
!417 = !DILocation(line: 270, column: 8, scope: !402)
!418 = !DILocation(line: 270, column: 3, scope: !402)
!419 = !DILocation(line: 270, column: 11, scope: !402)
!420 = !DILocation(line: 272, column: 6, scope: !402)
!421 = !DILocation(line: 274, column: 7, scope: !402)
!422 = !DILocation(line: 274, column: 9, scope: !402)
!423 = !DILocation(line: 274, column: 8, scope: !402)
!424 = !DILocation(line: 274, column: 6, scope: !402)
!425 = !DILocation(line: 276, column: 7, scope: !402)
!426 = !DILocation(line: 276, column: 5, scope: !402)
!427 = !DILocation(line: 276, column: 3, scope: !402)
!428 = !DILocation(line: 262, column: 2, scope: !429)
!429 = !DILexicalBlockFile(scope: !12, file: !1, discriminator: 1)
!430 = !DILocation(line: 283, column: 9, scope: !12)
!431 = !DILocation(line: 283, column: 2, scope: !12)
!432 = !DILocalVariable(name: "argc", arg: 1, scope: !15, file: !1, line: 287, type: !18)
!433 = !DILocation(line: 287, column: 14, scope: !15)
!434 = !DILocalVariable(name: "args", arg: 2, scope: !15, file: !1, line: 287, type: !19)
!435 = !DILocation(line: 287, column: 27, scope: !15)
!436 = !DILocalVariable(name: "n", scope: !15, file: !1, line: 288, type: !7)
!437 = !DILocation(line: 288, column: 12, scope: !15)
!438 = !DILocalVariable(name: "data", scope: !15, file: !1, line: 289, type: !11)
!439 = !DILocation(line: 289, column: 2, scope: !15)
!440 = !DILocalVariable(name: "data_size", scope: !15, file: !1, line: 289, type: !7)
!441 = !DILocalVariable(name: "gcds", scope: !15, file: !1, line: 290, type: !11)
!442 = !DILocation(line: 290, column: 2, scope: !15)
!443 = !DILocalVariable(name: "gcds_size", scope: !15, file: !1, line: 290, type: !7)
!444 = !DILocalVariable(name: "sum", scope: !15, file: !1, line: 291, type: !7)
!445 = !DILocation(line: 291, column: 12, scope: !15)
!446 = !DILocalVariable(name: "i", scope: !15, file: !1, line: 292, type: !7)
!447 = !DILocation(line: 292, column: 12, scope: !15)
!448 = !DILocalVariable(name: "j", scope: !15, file: !1, line: 293, type: !7)
!449 = !DILocation(line: 293, column: 12, scope: !15)
!450 = !DILocalVariable(name: "_7", scope: !15, file: !1, line: 294, type: !7)
!451 = !DILocation(line: 294, column: 12, scope: !15)
!452 = !DILocalVariable(name: "_8", scope: !15, file: !1, line: 295, type: !11)
!453 = !DILocation(line: 295, column: 2, scope: !15)
!454 = !DILocalVariable(name: "_8_size", scope: !15, file: !1, line: 295, type: !7)
!455 = !DILocalVariable(name: "_9", scope: !15, file: !1, line: 296, type: !11)
!456 = !DILocation(line: 296, column: 2, scope: !15)
!457 = !DILocalVariable(name: "_9_size", scope: !15, file: !1, line: 296, type: !7)
!458 = !DILocalVariable(name: "_10", scope: !15, file: !1, line: 297, type: !7)
!459 = !DILocation(line: 297, column: 12, scope: !15)
!460 = !DILocalVariable(name: "_11", scope: !15, file: !1, line: 298, type: !7)
!461 = !DILocation(line: 298, column: 12, scope: !15)
!462 = !DILocalVariable(name: "_12", scope: !15, file: !1, line: 299, type: !7)
!463 = !DILocation(line: 299, column: 12, scope: !15)
!464 = !DILocalVariable(name: "_13", scope: !15, file: !1, line: 300, type: !7)
!465 = !DILocation(line: 300, column: 12, scope: !15)
!466 = !DILocalVariable(name: "_14", scope: !15, file: !1, line: 301, type: !7)
!467 = !DILocation(line: 301, column: 12, scope: !15)
!468 = !DILocalVariable(name: "_15", scope: !15, file: !1, line: 302, type: !7)
!469 = !DILocation(line: 302, column: 12, scope: !15)
!470 = !DILocalVariable(name: "_16", scope: !15, file: !1, line: 303, type: !7)
!471 = !DILocation(line: 303, column: 12, scope: !15)
!472 = !DILocalVariable(name: "_17", scope: !15, file: !1, line: 304, type: !7)
!473 = !DILocation(line: 304, column: 12, scope: !15)
!474 = !DILocalVariable(name: "_18", scope: !15, file: !1, line: 305, type: !7)
!475 = !DILocation(line: 305, column: 12, scope: !15)
!476 = !DILocalVariable(name: "_19", scope: !15, file: !1, line: 306, type: !7)
!477 = !DILocation(line: 306, column: 12, scope: !15)
!478 = !DILocalVariable(name: "_20", scope: !15, file: !1, line: 307, type: !7)
!479 = !DILocation(line: 307, column: 12, scope: !15)
!480 = !DILocalVariable(name: "_21", scope: !15, file: !1, line: 308, type: !481)
!481 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64, align: 64)
!482 = !DILocation(line: 308, column: 8, scope: !15)
!483 = !DILocalVariable(name: "_23", scope: !15, file: !1, line: 309, type: !11)
!484 = !DILocation(line: 309, column: 2, scope: !15)
!485 = !DILocalVariable(name: "_23_size", scope: !15, file: !1, line: 309, type: !7)
!486 = !DILocalVariable(name: "_24", scope: !15, file: !1, line: 310, type: !481)
!487 = !DILocation(line: 310, column: 8, scope: !15)
!488 = !DILocation(line: 312, column: 5, scope: !15)
!489 = !DILocation(line: 314, column: 6, scope: !15)
!490 = !DILocation(line: 314, column: 4, scope: !15)
!491 = !DILocation(line: 316, column: 12, scope: !15)
!492 = !DILocation(line: 316, column: 7, scope: !15)
!493 = !DILocation(line: 316, column: 5, scope: !15)
!494 = !DILocation(line: 318, column: 2, scope: !15)
!495 = !DILocation(line: 320, column: 2, scope: !15)
!496 = !DILocation(line: 321, column: 17, scope: !15)
!497 = !DILocation(line: 321, column: 39, scope: !15)
!498 = !DILocation(line: 321, column: 7, scope: !15)
!499 = !DILocation(line: 321, column: 5, scope: !15)
!500 = !DILocation(line: 323, column: 2, scope: !15)
!501 = !DILocation(line: 325, column: 6, scope: !15)
!502 = !DILocation(line: 327, column: 8, scope: !15)
!503 = !DILocation(line: 327, column: 6, scope: !15)
!504 = !DILocation(line: 329, column: 6, scope: !15)
!505 = !DILocation(line: 331, column: 6, scope: !15)
!506 = !DILocation(line: 331, column: 4, scope: !15)
!507 = !DILocation(line: 333, column: 2, scope: !15)
!508 = !DILocation(line: 335, column: 6, scope: !509)
!509 = distinct !DILexicalBlock(scope: !510, file: !1, line: 335, column: 6)
!510 = distinct !DILexicalBlock(scope: !15, file: !1, line: 333, column: 13)
!511 = !DILocation(line: 335, column: 9, scope: !509)
!512 = !DILocation(line: 335, column: 7, scope: !509)
!513 = !DILocation(line: 335, column: 6, scope: !510)
!514 = !DILocation(line: 335, column: 12, scope: !515)
!515 = !DILexicalBlockFile(scope: !516, file: !1, discriminator: 1)
!516 = distinct !DILexicalBlock(scope: !509, file: !1, line: 335, column: 11)
!517 = !DILocation(line: 337, column: 7, scope: !510)
!518 = !DILocation(line: 339, column: 7, scope: !510)
!519 = !DILocation(line: 339, column: 5, scope: !510)
!520 = !DILocation(line: 341, column: 3, scope: !510)
!521 = !DILocation(line: 343, column: 7, scope: !522)
!522 = distinct !DILexicalBlock(scope: !523, file: !1, line: 343, column: 7)
!523 = distinct !DILexicalBlock(scope: !510, file: !1, line: 341, column: 14)
!524 = !DILocation(line: 343, column: 10, scope: !522)
!525 = !DILocation(line: 343, column: 8, scope: !522)
!526 = !DILocation(line: 343, column: 7, scope: !523)
!527 = !DILocation(line: 343, column: 13, scope: !528)
!528 = !DILexicalBlockFile(scope: !529, file: !1, discriminator: 1)
!529 = distinct !DILexicalBlock(scope: !522, file: !1, line: 343, column: 12)
!530 = !DILocation(line: 345, column: 8, scope: !523)
!531 = !DILocation(line: 345, column: 10, scope: !523)
!532 = !DILocation(line: 345, column: 9, scope: !523)
!533 = !DILocation(line: 345, column: 7, scope: !523)
!534 = !DILocation(line: 347, column: 8, scope: !523)
!535 = !DILocation(line: 347, column: 12, scope: !523)
!536 = !DILocation(line: 347, column: 11, scope: !523)
!537 = !DILocation(line: 347, column: 7, scope: !523)
!538 = !DILocation(line: 349, column: 13, scope: !523)
!539 = !DILocation(line: 349, column: 8, scope: !523)
!540 = !DILocation(line: 349, column: 7, scope: !523)
!541 = !DILocation(line: 351, column: 8, scope: !523)
!542 = !DILocation(line: 351, column: 12, scope: !523)
!543 = !DILocation(line: 351, column: 11, scope: !523)
!544 = !DILocation(line: 351, column: 7, scope: !523)
!545 = !DILocation(line: 353, column: 10, scope: !523)
!546 = !DILocation(line: 353, column: 8, scope: !523)
!547 = !DILocation(line: 355, column: 8, scope: !523)
!548 = !DILocation(line: 357, column: 8, scope: !523)
!549 = !DILocation(line: 357, column: 10, scope: !523)
!550 = !DILocation(line: 357, column: 9, scope: !523)
!551 = !DILocation(line: 357, column: 7, scope: !523)
!552 = !DILocation(line: 359, column: 8, scope: !523)
!553 = !DILocation(line: 359, column: 6, scope: !523)
!554 = !DILocation(line: 359, column: 4, scope: !523)
!555 = !DILocation(line: 341, column: 3, scope: !556)
!556 = !DILexicalBlockFile(scope: !510, file: !1, discriminator: 1)
!557 = !DILocation(line: 366, column: 7, scope: !510)
!558 = !DILocation(line: 368, column: 7, scope: !510)
!559 = !DILocation(line: 368, column: 9, scope: !510)
!560 = !DILocation(line: 368, column: 8, scope: !510)
!561 = !DILocation(line: 368, column: 6, scope: !510)
!562 = !DILocation(line: 370, column: 7, scope: !510)
!563 = !DILocation(line: 370, column: 5, scope: !510)
!564 = !DILocation(line: 370, column: 3, scope: !510)
!565 = !DILocation(line: 333, column: 2, scope: !566)
!566 = !DILexicalBlockFile(scope: !15, file: !1, discriminator: 1)
!567 = !DILocation(line: 379, column: 2, scope: !15)
!568 = !DILocation(line: 380, column: 2, scope: !15)
!569 = !DILocation(line: 380, column: 9, scope: !15)
!570 = !DILocation(line: 380, column: 15, scope: !15)
!571 = !DILocation(line: 380, column: 22, scope: !15)
!572 = !DILocation(line: 380, column: 28, scope: !15)
!573 = !DILocation(line: 380, column: 35, scope: !15)
!574 = !DILocation(line: 380, column: 41, scope: !15)
!575 = !DILocation(line: 380, column: 48, scope: !15)
!576 = !DILocation(line: 382, column: 11, scope: !15)
!577 = !DILocation(line: 382, column: 2, scope: !15)
!578 = !DILocation(line: 386, column: 19, scope: !15)
!579 = !DILocation(line: 386, column: 2, scope: !15)
!580 = !DILocation(line: 388, column: 2, scope: !15)
!581 = !DILocation(line: 389, column: 1, scope: !15)
