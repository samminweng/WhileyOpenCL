; ModuleID = 'CoinGame.c'
source_filename = "CoinGame.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external global %struct._IO_FILE*, align 8
@.str = private unnamed_addr constant [5 x i8] c"fail\00", align 1
@.str.1 = private unnamed_addr constant [6 x i8] c"%lld\0A\00", align 1

; Function Attrs: nounwind uwtable
define i64* @init(i64 %n) #0 !dbg !6 {
entry:
  %n.addr = alloca i64, align 8
  %_1 = alloca i64*, align 8
  %_1_size = alloca i64, align 8
  %_1_has_ownership = alloca i8, align 1
  %coins = alloca i64*, align 8
  %coins_size = alloca i64, align 8
  %coins_has_ownership = alloca i8, align 1
  %i = alloca i64, align 8
  %_4 = alloca i64, align 8
  %_5 = alloca i64*, align 8
  %_5_size = alloca i64, align 8
  %_5_has_ownership = alloca i8, align 1
  %_6 = alloca i64, align 8
  %_7 = alloca i64, align 8
  %_8 = alloca i64, align 8
  %_9 = alloca i64, align 8
  %_10 = alloca i64, align 8
  store i64 %n, i64* %n.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %n.addr, metadata !28, metadata !29), !dbg !30
  call void @llvm.dbg.declare(metadata i64** %_1, metadata !31, metadata !29), !dbg !32
  store i64* null, i64** %_1, align 8, !dbg !32
  call void @llvm.dbg.declare(metadata i64* %_1_size, metadata !33, metadata !29), !dbg !32
  store i64 0, i64* %_1_size, align 8, !dbg !32
  call void @llvm.dbg.declare(metadata i8* %_1_has_ownership, metadata !34, metadata !29), !dbg !35
  store i8 0, i8* %_1_has_ownership, align 1, !dbg !35
  call void @llvm.dbg.declare(metadata i64** %coins, metadata !36, metadata !29), !dbg !37
  store i64* null, i64** %coins, align 8, !dbg !37
  call void @llvm.dbg.declare(metadata i64* %coins_size, metadata !38, metadata !29), !dbg !37
  store i64 0, i64* %coins_size, align 8, !dbg !37
  call void @llvm.dbg.declare(metadata i8* %coins_has_ownership, metadata !39, metadata !29), !dbg !40
  store i8 0, i8* %coins_has_ownership, align 1, !dbg !40
  call void @llvm.dbg.declare(metadata i64* %i, metadata !41, metadata !29), !dbg !42
  store i64 0, i64* %i, align 8, !dbg !42
  call void @llvm.dbg.declare(metadata i64* %_4, metadata !43, metadata !29), !dbg !44
  store i64 0, i64* %_4, align 8, !dbg !44
  call void @llvm.dbg.declare(metadata i64** %_5, metadata !45, metadata !29), !dbg !46
  store i64* null, i64** %_5, align 8, !dbg !46
  call void @llvm.dbg.declare(metadata i64* %_5_size, metadata !47, metadata !29), !dbg !46
  store i64 0, i64* %_5_size, align 8, !dbg !46
  call void @llvm.dbg.declare(metadata i8* %_5_has_ownership, metadata !48, metadata !29), !dbg !49
  store i8 0, i8* %_5_has_ownership, align 1, !dbg !49
  call void @llvm.dbg.declare(metadata i64* %_6, metadata !50, metadata !29), !dbg !51
  store i64 0, i64* %_6, align 8, !dbg !51
  call void @llvm.dbg.declare(metadata i64* %_7, metadata !52, metadata !29), !dbg !53
  store i64 0, i64* %_7, align 8, !dbg !53
  call void @llvm.dbg.declare(metadata i64* %_8, metadata !54, metadata !29), !dbg !55
  store i64 0, i64* %_8, align 8, !dbg !55
  call void @llvm.dbg.declare(metadata i64* %_9, metadata !56, metadata !29), !dbg !57
  store i64 0, i64* %_9, align 8, !dbg !57
  call void @llvm.dbg.declare(metadata i64* %_10, metadata !58, metadata !29), !dbg !59
  store i64 0, i64* %_10, align 8, !dbg !59
  store i64 0, i64* %_4, align 8, !dbg !60
  %0 = load i8, i8* %_5_has_ownership, align 1, !dbg !61
  %tobool = trunc i8 %0 to i1, !dbg !61
  br i1 %tobool, label %if.then, label %if.end, !dbg !63

if.then:                                          ; preds = %entry
  %1 = load i64*, i64** %_5, align 8, !dbg !64
  %2 = bitcast i64* %1 to i8*, !dbg !64
  call void @free(i8* %2) #5, !dbg !64
  store i8 0, i8* %_5_has_ownership, align 1, !dbg !64
  br label %if.end, !dbg !64

if.end:                                           ; preds = %if.then, %entry
  %3 = load i64, i64* %n.addr, align 8, !dbg !67
  store i64 %3, i64* %_5_size, align 8, !dbg !67
  %4 = load i64, i64* %_4, align 8, !dbg !67
  %conv = trunc i64 %4 to i32, !dbg !67
  %5 = load i64, i64* %_5_size, align 8, !dbg !67
  %conv1 = trunc i64 %5 to i32, !dbg !67
  %call = call i64* @gen1DArray(i32 %conv, i32 %conv1), !dbg !67
  store i64* %call, i64** %_5, align 8, !dbg !67
  store i8 1, i8* %_5_has_ownership, align 1, !dbg !68
  %6 = load i8, i8* %coins_has_ownership, align 1, !dbg !69
  %tobool2 = trunc i8 %6 to i1, !dbg !69
  br i1 %tobool2, label %if.then3, label %if.end4, !dbg !71

if.then3:                                         ; preds = %if.end
  %7 = load i64*, i64** %coins, align 8, !dbg !72
  %8 = bitcast i64* %7 to i8*, !dbg !72
  call void @free(i8* %8) #5, !dbg !72
  store i8 0, i8* %coins_has_ownership, align 1, !dbg !72
  br label %if.end4, !dbg !72

if.end4:                                          ; preds = %if.then3, %if.end
  %9 = load i64, i64* %_5_size, align 8, !dbg !75
  store i64 %9, i64* %coins_size, align 8, !dbg !75
  %10 = load i64*, i64** %_5, align 8, !dbg !75
  store i64* %10, i64** %coins, align 8, !dbg !75
  store i8 1, i8* %coins_has_ownership, align 1, !dbg !76
  store i8 0, i8* %_5_has_ownership, align 1, !dbg !77
  store i64 0, i64* %_6, align 8, !dbg !78
  %11 = load i64, i64* %_6, align 8, !dbg !79
  store i64 %11, i64* %i, align 8, !dbg !80
  br label %while.body, !dbg !81

while.body:                                       ; preds = %if.end4, %blklab1
  %12 = load i64, i64* %i, align 8, !dbg !82
  %13 = load i64, i64* %n.addr, align 8, !dbg !85
  %cmp = icmp sge i64 %12, %13, !dbg !86
  br i1 %cmp, label %if.then6, label %if.end7, !dbg !87

if.then6:                                         ; preds = %while.body
  br label %blklab0, !dbg !88

if.end7:                                          ; preds = %while.body
  %14 = load i64, i64* %i, align 8, !dbg !91
  %15 = load i64*, i64** %coins, align 8, !dbg !92
  %arrayidx = getelementptr inbounds i64, i64* %15, i64 %14, !dbg !92
  %16 = load i64, i64* %arrayidx, align 8, !dbg !92
  store i64 %16, i64* %_7, align 8, !dbg !93
  %17 = load i64, i64* %_7, align 8, !dbg !94
  %18 = load i64, i64* %i, align 8, !dbg !95
  %add = add nsw i64 %17, %18, !dbg !96
  store i64 %add, i64* %_8, align 8, !dbg !97
  %19 = load i64, i64* %_8, align 8, !dbg !98
  %20 = load i64, i64* %i, align 8, !dbg !99
  %21 = load i64*, i64** %coins, align 8, !dbg !100
  %arrayidx8 = getelementptr inbounds i64, i64* %21, i64 %20, !dbg !100
  store i64 %19, i64* %arrayidx8, align 8, !dbg !101
  store i64 1, i64* %_9, align 8, !dbg !102
  %22 = load i64, i64* %i, align 8, !dbg !103
  %23 = load i64, i64* %_9, align 8, !dbg !104
  %add9 = add nsw i64 %22, %23, !dbg !105
  store i64 %add9, i64* %_10, align 8, !dbg !106
  %24 = load i64, i64* %_10, align 8, !dbg !107
  store i64 %24, i64* %i, align 8, !dbg !108
  br label %blklab1, !dbg !109

blklab1:                                          ; preds = %if.end7
  br label %while.body, !dbg !110

blklab0:                                          ; preds = %if.then6
  %25 = load i8, i8* %_1_has_ownership, align 1, !dbg !112
  %tobool10 = trunc i8 %25 to i1, !dbg !112
  br i1 %tobool10, label %if.then11, label %if.end12, !dbg !114

if.then11:                                        ; preds = %blklab0
  %26 = load i64*, i64** %_1, align 8, !dbg !115
  %27 = bitcast i64* %26 to i8*, !dbg !115
  call void @free(i8* %27) #5, !dbg !115
  store i8 0, i8* %_1_has_ownership, align 1, !dbg !115
  br label %if.end12, !dbg !115

if.end12:                                         ; preds = %if.then11, %blklab0
  %28 = load i8, i8* %_5_has_ownership, align 1, !dbg !118
  %tobool13 = trunc i8 %28 to i1, !dbg !118
  br i1 %tobool13, label %if.then14, label %if.end15, !dbg !120

if.then14:                                        ; preds = %if.end12
  %29 = load i64*, i64** %_5, align 8, !dbg !121
  %30 = bitcast i64* %29 to i8*, !dbg !121
  call void @free(i8* %30) #5, !dbg !121
  store i8 0, i8* %_5_has_ownership, align 1, !dbg !121
  br label %if.end15, !dbg !121

if.end15:                                         ; preds = %if.then14, %if.end12
  %31 = load i64*, i64** %coins, align 8, !dbg !124
  ret i64* %31, !dbg !125
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare void @free(i8*) #2

declare i64* @gen1DArray(i32, i32) #3

; Function Attrs: nounwind uwtable
define i64 @getBobSum(i64 %sum_alice, i64* %coins, i64 %coins_size, i1 zeroext %coins_has_ownership, i64 %n) #0 !dbg !11 {
entry:
  %sum_alice.addr = alloca i64, align 8
  %coins.addr = alloca i64*, align 8
  %coins_size.addr = alloca i64, align 8
  %coins_has_ownership.addr = alloca i8, align 1
  %n.addr = alloca i64, align 8
  %_3 = alloca i64, align 8
  %i = alloca i64, align 8
  %sum = alloca i64, align 8
  %_6 = alloca i64, align 8
  %_7 = alloca i64, align 8
  %_8 = alloca i64, align 8
  %_9 = alloca i64, align 8
  %_10 = alloca i64, align 8
  %_11 = alloca i64, align 8
  %_12 = alloca i64, align 8
  store i64 %sum_alice, i64* %sum_alice.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %sum_alice.addr, metadata !126, metadata !29), !dbg !127
  store i64* %coins, i64** %coins.addr, align 8
  call void @llvm.dbg.declare(metadata i64** %coins.addr, metadata !128, metadata !29), !dbg !129
  store i64 %coins_size, i64* %coins_size.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %coins_size.addr, metadata !130, metadata !29), !dbg !129
  %frombool = zext i1 %coins_has_ownership to i8
  store i8 %frombool, i8* %coins_has_ownership.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %coins_has_ownership.addr, metadata !131, metadata !29), !dbg !132
  store i64 %n, i64* %n.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %n.addr, metadata !133, metadata !29), !dbg !134
  call void @llvm.dbg.declare(metadata i64* %_3, metadata !135, metadata !29), !dbg !136
  store i64 0, i64* %_3, align 8, !dbg !136
  call void @llvm.dbg.declare(metadata i64* %i, metadata !137, metadata !29), !dbg !138
  store i64 0, i64* %i, align 8, !dbg !138
  call void @llvm.dbg.declare(metadata i64* %sum, metadata !139, metadata !29), !dbg !140
  store i64 0, i64* %sum, align 8, !dbg !140
  call void @llvm.dbg.declare(metadata i64* %_6, metadata !141, metadata !29), !dbg !142
  store i64 0, i64* %_6, align 8, !dbg !142
  call void @llvm.dbg.declare(metadata i64* %_7, metadata !143, metadata !29), !dbg !144
  store i64 0, i64* %_7, align 8, !dbg !144
  call void @llvm.dbg.declare(metadata i64* %_8, metadata !145, metadata !29), !dbg !146
  store i64 0, i64* %_8, align 8, !dbg !146
  call void @llvm.dbg.declare(metadata i64* %_9, metadata !147, metadata !29), !dbg !148
  store i64 0, i64* %_9, align 8, !dbg !148
  call void @llvm.dbg.declare(metadata i64* %_10, metadata !149, metadata !29), !dbg !150
  store i64 0, i64* %_10, align 8, !dbg !150
  call void @llvm.dbg.declare(metadata i64* %_11, metadata !151, metadata !29), !dbg !152
  store i64 0, i64* %_11, align 8, !dbg !152
  call void @llvm.dbg.declare(metadata i64* %_12, metadata !153, metadata !29), !dbg !154
  store i64 0, i64* %_12, align 8, !dbg !154
  store i64 0, i64* %_6, align 8, !dbg !155
  %0 = load i64, i64* %_6, align 8, !dbg !156
  store i64 %0, i64* %i, align 8, !dbg !157
  store i64 0, i64* %_7, align 8, !dbg !158
  %1 = load i64, i64* %_7, align 8, !dbg !159
  store i64 %1, i64* %sum, align 8, !dbg !160
  br label %while.body, !dbg !161

while.body:                                       ; preds = %entry, %blklab3
  %2 = load i64, i64* %i, align 8, !dbg !162
  %3 = load i64, i64* %n.addr, align 8, !dbg !165
  %cmp = icmp sge i64 %2, %3, !dbg !166
  br i1 %cmp, label %if.then, label %if.end, !dbg !167

if.then:                                          ; preds = %while.body
  br label %blklab2, !dbg !168

if.end:                                           ; preds = %while.body
  %4 = load i64, i64* %i, align 8, !dbg !171
  %5 = load i64*, i64** %coins.addr, align 8, !dbg !172
  %arrayidx = getelementptr inbounds i64, i64* %5, i64 %4, !dbg !172
  %6 = load i64, i64* %arrayidx, align 8, !dbg !172
  store i64 %6, i64* %_8, align 8, !dbg !173
  %7 = load i64, i64* %sum, align 8, !dbg !174
  %8 = load i64, i64* %_8, align 8, !dbg !175
  %add = add nsw i64 %7, %8, !dbg !176
  store i64 %add, i64* %_9, align 8, !dbg !177
  %9 = load i64, i64* %_9, align 8, !dbg !178
  store i64 %9, i64* %sum, align 8, !dbg !179
  store i64 1, i64* %_10, align 8, !dbg !180
  %10 = load i64, i64* %i, align 8, !dbg !181
  %11 = load i64, i64* %_10, align 8, !dbg !182
  %add1 = add nsw i64 %10, %11, !dbg !183
  store i64 %add1, i64* %_11, align 8, !dbg !184
  %12 = load i64, i64* %_11, align 8, !dbg !185
  store i64 %12, i64* %i, align 8, !dbg !186
  br label %blklab3, !dbg !187

blklab3:                                          ; preds = %if.end
  br label %while.body, !dbg !188

blklab2:                                          ; preds = %if.then
  %13 = load i64, i64* %sum, align 8, !dbg !190
  %14 = load i64, i64* %sum_alice.addr, align 8, !dbg !191
  %sub = sub nsw i64 %13, %14, !dbg !192
  store i64 %sub, i64* %_12, align 8, !dbg !193
  %15 = load i8, i8* %coins_has_ownership.addr, align 1, !dbg !194
  %tobool = trunc i8 %15 to i1, !dbg !194
  br i1 %tobool, label %if.then2, label %if.end3, !dbg !196

if.then2:                                         ; preds = %blklab2
  %16 = load i64*, i64** %coins.addr, align 8, !dbg !197
  %17 = bitcast i64* %16 to i8*, !dbg !197
  call void @free(i8* %17) #5, !dbg !197
  store i8 0, i8* %coins_has_ownership.addr, align 1, !dbg !197
  br label %if.end3, !dbg !197

if.end3:                                          ; preds = %if.then2, %blklab2
  %18 = load i64, i64* %_12, align 8, !dbg !200
  ret i64 %18, !dbg !201
}

; Function Attrs: nounwind uwtable
define i64* @findMoves(i64* %coins, i64 %coins_size, i1 zeroext %coins_has_ownership, i64 %n) #0 !dbg !15 {
entry:
  %coins.addr = alloca i64*, align 8
  %coins_size.addr = alloca i64, align 8
  %coins_has_ownership.addr = alloca i8, align 1
  %n.addr = alloca i64, align 8
  %_2 = alloca i64*, align 8
  %_2_size = alloca i64, align 8
  %_2_has_ownership = alloca i8, align 1
  %moves = alloca i64*, align 8
  %moves_size = alloca i64, align 8
  %moves_has_ownership = alloca i8, align 1
  %s = alloca i64, align 8
  %j = alloca i64, align 8
  %i = alloca i64, align 8
  %y = alloca i64, align 8
  %x = alloca i64, align 8
  %z = alloca i64, align 8
  %_10 = alloca i64, align 8
  %_11 = alloca i64, align 8
  %_12 = alloca i64*, align 8
  %_12_size = alloca i64, align 8
  %_12_has_ownership = alloca i8, align 1
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
  %_38 = alloca i64, align 8
  %_39 = alloca i64, align 8
  %_40 = alloca i64, align 8
  %_41 = alloca i64, align 8
  %_42 = alloca i64, align 8
  %_43 = alloca i64, align 8
  %_44 = alloca i64, align 8
  %_45 = alloca i64, align 8
  %_46 = alloca i64, align 8
  %_47 = alloca i64, align 8
  %_48 = alloca i64, align 8
  %_49 = alloca i64, align 8
  %_50 = alloca i64, align 8
  %_51 = alloca i64, align 8
  %_52 = alloca i64, align 8
  %_53 = alloca i64, align 8
  %_54 = alloca i64, align 8
  %_55 = alloca i64, align 8
  %_56 = alloca i64, align 8
  %_57 = alloca i64, align 8
  %_58 = alloca i64, align 8
  %_59 = alloca i64, align 8
  %_60 = alloca i64, align 8
  %_61 = alloca i64, align 8
  %_62 = alloca i64, align 8
  store i64* %coins, i64** %coins.addr, align 8
  call void @llvm.dbg.declare(metadata i64** %coins.addr, metadata !202, metadata !29), !dbg !203
  store i64 %coins_size, i64* %coins_size.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %coins_size.addr, metadata !204, metadata !29), !dbg !203
  %frombool = zext i1 %coins_has_ownership to i8
  store i8 %frombool, i8* %coins_has_ownership.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %coins_has_ownership.addr, metadata !205, metadata !29), !dbg !206
  store i64 %n, i64* %n.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %n.addr, metadata !207, metadata !29), !dbg !208
  call void @llvm.dbg.declare(metadata i64** %_2, metadata !209, metadata !29), !dbg !210
  store i64* null, i64** %_2, align 8, !dbg !210
  call void @llvm.dbg.declare(metadata i64* %_2_size, metadata !211, metadata !29), !dbg !210
  store i64 0, i64* %_2_size, align 8, !dbg !210
  call void @llvm.dbg.declare(metadata i8* %_2_has_ownership, metadata !212, metadata !29), !dbg !213
  store i8 0, i8* %_2_has_ownership, align 1, !dbg !213
  call void @llvm.dbg.declare(metadata i64** %moves, metadata !214, metadata !29), !dbg !215
  store i64* null, i64** %moves, align 8, !dbg !215
  call void @llvm.dbg.declare(metadata i64* %moves_size, metadata !216, metadata !29), !dbg !215
  store i64 0, i64* %moves_size, align 8, !dbg !215
  call void @llvm.dbg.declare(metadata i8* %moves_has_ownership, metadata !217, metadata !29), !dbg !218
  store i8 0, i8* %moves_has_ownership, align 1, !dbg !218
  call void @llvm.dbg.declare(metadata i64* %s, metadata !219, metadata !29), !dbg !220
  store i64 0, i64* %s, align 8, !dbg !220
  call void @llvm.dbg.declare(metadata i64* %j, metadata !221, metadata !29), !dbg !222
  store i64 0, i64* %j, align 8, !dbg !222
  call void @llvm.dbg.declare(metadata i64* %i, metadata !223, metadata !29), !dbg !224
  store i64 0, i64* %i, align 8, !dbg !224
  call void @llvm.dbg.declare(metadata i64* %y, metadata !225, metadata !29), !dbg !226
  store i64 0, i64* %y, align 8, !dbg !226
  call void @llvm.dbg.declare(metadata i64* %x, metadata !227, metadata !29), !dbg !228
  store i64 0, i64* %x, align 8, !dbg !228
  call void @llvm.dbg.declare(metadata i64* %z, metadata !229, metadata !29), !dbg !230
  store i64 0, i64* %z, align 8, !dbg !230
  call void @llvm.dbg.declare(metadata i64* %_10, metadata !231, metadata !29), !dbg !232
  store i64 0, i64* %_10, align 8, !dbg !232
  call void @llvm.dbg.declare(metadata i64* %_11, metadata !233, metadata !29), !dbg !234
  store i64 0, i64* %_11, align 8, !dbg !234
  call void @llvm.dbg.declare(metadata i64** %_12, metadata !235, metadata !29), !dbg !236
  store i64* null, i64** %_12, align 8, !dbg !236
  call void @llvm.dbg.declare(metadata i64* %_12_size, metadata !237, metadata !29), !dbg !236
  store i64 0, i64* %_12_size, align 8, !dbg !236
  call void @llvm.dbg.declare(metadata i8* %_12_has_ownership, metadata !238, metadata !29), !dbg !239
  store i8 0, i8* %_12_has_ownership, align 1, !dbg !239
  call void @llvm.dbg.declare(metadata i64* %_13, metadata !240, metadata !29), !dbg !241
  store i64 0, i64* %_13, align 8, !dbg !241
  call void @llvm.dbg.declare(metadata i64* %_14, metadata !242, metadata !29), !dbg !243
  store i64 0, i64* %_14, align 8, !dbg !243
  call void @llvm.dbg.declare(metadata i64* %_15, metadata !244, metadata !29), !dbg !245
  store i64 0, i64* %_15, align 8, !dbg !245
  call void @llvm.dbg.declare(metadata i64* %_16, metadata !246, metadata !29), !dbg !247
  store i64 0, i64* %_16, align 8, !dbg !247
  call void @llvm.dbg.declare(metadata i64* %_17, metadata !248, metadata !29), !dbg !249
  store i64 0, i64* %_17, align 8, !dbg !249
  call void @llvm.dbg.declare(metadata i64* %_18, metadata !250, metadata !29), !dbg !251
  store i64 0, i64* %_18, align 8, !dbg !251
  call void @llvm.dbg.declare(metadata i64* %_19, metadata !252, metadata !29), !dbg !253
  store i64 0, i64* %_19, align 8, !dbg !253
  call void @llvm.dbg.declare(metadata i64* %_20, metadata !254, metadata !29), !dbg !255
  store i64 0, i64* %_20, align 8, !dbg !255
  call void @llvm.dbg.declare(metadata i64* %_21, metadata !256, metadata !29), !dbg !257
  store i64 0, i64* %_21, align 8, !dbg !257
  call void @llvm.dbg.declare(metadata i64* %_22, metadata !258, metadata !29), !dbg !259
  store i64 0, i64* %_22, align 8, !dbg !259
  call void @llvm.dbg.declare(metadata i64* %_23, metadata !260, metadata !29), !dbg !261
  store i64 0, i64* %_23, align 8, !dbg !261
  call void @llvm.dbg.declare(metadata i64* %_24, metadata !262, metadata !29), !dbg !263
  store i64 0, i64* %_24, align 8, !dbg !263
  call void @llvm.dbg.declare(metadata i64* %_25, metadata !264, metadata !29), !dbg !265
  store i64 0, i64* %_25, align 8, !dbg !265
  call void @llvm.dbg.declare(metadata i64* %_26, metadata !266, metadata !29), !dbg !267
  store i64 0, i64* %_26, align 8, !dbg !267
  call void @llvm.dbg.declare(metadata i64* %_27, metadata !268, metadata !29), !dbg !269
  store i64 0, i64* %_27, align 8, !dbg !269
  call void @llvm.dbg.declare(metadata i64* %_28, metadata !270, metadata !29), !dbg !271
  store i64 0, i64* %_28, align 8, !dbg !271
  call void @llvm.dbg.declare(metadata i64* %_29, metadata !272, metadata !29), !dbg !273
  store i64 0, i64* %_29, align 8, !dbg !273
  call void @llvm.dbg.declare(metadata i64* %_30, metadata !274, metadata !29), !dbg !275
  store i64 0, i64* %_30, align 8, !dbg !275
  call void @llvm.dbg.declare(metadata i64* %_31, metadata !276, metadata !29), !dbg !277
  store i64 0, i64* %_31, align 8, !dbg !277
  call void @llvm.dbg.declare(metadata i64* %_32, metadata !278, metadata !29), !dbg !279
  store i64 0, i64* %_32, align 8, !dbg !279
  call void @llvm.dbg.declare(metadata i64* %_33, metadata !280, metadata !29), !dbg !281
  store i64 0, i64* %_33, align 8, !dbg !281
  call void @llvm.dbg.declare(metadata i64* %_34, metadata !282, metadata !29), !dbg !283
  store i64 0, i64* %_34, align 8, !dbg !283
  call void @llvm.dbg.declare(metadata i64* %_35, metadata !284, metadata !29), !dbg !285
  store i64 0, i64* %_35, align 8, !dbg !285
  call void @llvm.dbg.declare(metadata i64* %_36, metadata !286, metadata !29), !dbg !287
  store i64 0, i64* %_36, align 8, !dbg !287
  call void @llvm.dbg.declare(metadata i64* %_37, metadata !288, metadata !29), !dbg !289
  store i64 0, i64* %_37, align 8, !dbg !289
  call void @llvm.dbg.declare(metadata i64* %_38, metadata !290, metadata !29), !dbg !291
  store i64 0, i64* %_38, align 8, !dbg !291
  call void @llvm.dbg.declare(metadata i64* %_39, metadata !292, metadata !29), !dbg !293
  store i64 0, i64* %_39, align 8, !dbg !293
  call void @llvm.dbg.declare(metadata i64* %_40, metadata !294, metadata !29), !dbg !295
  store i64 0, i64* %_40, align 8, !dbg !295
  call void @llvm.dbg.declare(metadata i64* %_41, metadata !296, metadata !29), !dbg !297
  store i64 0, i64* %_41, align 8, !dbg !297
  call void @llvm.dbg.declare(metadata i64* %_42, metadata !298, metadata !29), !dbg !299
  store i64 0, i64* %_42, align 8, !dbg !299
  call void @llvm.dbg.declare(metadata i64* %_43, metadata !300, metadata !29), !dbg !301
  store i64 0, i64* %_43, align 8, !dbg !301
  call void @llvm.dbg.declare(metadata i64* %_44, metadata !302, metadata !29), !dbg !303
  store i64 0, i64* %_44, align 8, !dbg !303
  call void @llvm.dbg.declare(metadata i64* %_45, metadata !304, metadata !29), !dbg !305
  store i64 0, i64* %_45, align 8, !dbg !305
  call void @llvm.dbg.declare(metadata i64* %_46, metadata !306, metadata !29), !dbg !307
  store i64 0, i64* %_46, align 8, !dbg !307
  call void @llvm.dbg.declare(metadata i64* %_47, metadata !308, metadata !29), !dbg !309
  store i64 0, i64* %_47, align 8, !dbg !309
  call void @llvm.dbg.declare(metadata i64* %_48, metadata !310, metadata !29), !dbg !311
  store i64 0, i64* %_48, align 8, !dbg !311
  call void @llvm.dbg.declare(metadata i64* %_49, metadata !312, metadata !29), !dbg !313
  store i64 0, i64* %_49, align 8, !dbg !313
  call void @llvm.dbg.declare(metadata i64* %_50, metadata !314, metadata !29), !dbg !315
  store i64 0, i64* %_50, align 8, !dbg !315
  call void @llvm.dbg.declare(metadata i64* %_51, metadata !316, metadata !29), !dbg !317
  store i64 0, i64* %_51, align 8, !dbg !317
  call void @llvm.dbg.declare(metadata i64* %_52, metadata !318, metadata !29), !dbg !319
  store i64 0, i64* %_52, align 8, !dbg !319
  call void @llvm.dbg.declare(metadata i64* %_53, metadata !320, metadata !29), !dbg !321
  store i64 0, i64* %_53, align 8, !dbg !321
  call void @llvm.dbg.declare(metadata i64* %_54, metadata !322, metadata !29), !dbg !323
  store i64 0, i64* %_54, align 8, !dbg !323
  call void @llvm.dbg.declare(metadata i64* %_55, metadata !324, metadata !29), !dbg !325
  store i64 0, i64* %_55, align 8, !dbg !325
  call void @llvm.dbg.declare(metadata i64* %_56, metadata !326, metadata !29), !dbg !327
  store i64 0, i64* %_56, align 8, !dbg !327
  call void @llvm.dbg.declare(metadata i64* %_57, metadata !328, metadata !29), !dbg !329
  store i64 0, i64* %_57, align 8, !dbg !329
  call void @llvm.dbg.declare(metadata i64* %_58, metadata !330, metadata !29), !dbg !331
  store i64 0, i64* %_58, align 8, !dbg !331
  call void @llvm.dbg.declare(metadata i64* %_59, metadata !332, metadata !29), !dbg !333
  store i64 0, i64* %_59, align 8, !dbg !333
  call void @llvm.dbg.declare(metadata i64* %_60, metadata !334, metadata !29), !dbg !335
  store i64 0, i64* %_60, align 8, !dbg !335
  call void @llvm.dbg.declare(metadata i64* %_61, metadata !336, metadata !29), !dbg !337
  store i64 0, i64* %_61, align 8, !dbg !337
  call void @llvm.dbg.declare(metadata i64* %_62, metadata !338, metadata !29), !dbg !339
  store i64 0, i64* %_62, align 8, !dbg !339
  store i64 0, i64* %_10, align 8, !dbg !340
  %0 = load i64, i64* %n.addr, align 8, !dbg !341
  %1 = load i64, i64* %n.addr, align 8, !dbg !342
  %mul = mul nsw i64 %0, %1, !dbg !343
  store i64 %mul, i64* %_11, align 8, !dbg !344
  %2 = load i8, i8* %_12_has_ownership, align 1, !dbg !345
  %tobool = trunc i8 %2 to i1, !dbg !345
  br i1 %tobool, label %if.then, label %if.end, !dbg !347

if.then:                                          ; preds = %entry
  %3 = load i64*, i64** %_12, align 8, !dbg !348
  %4 = bitcast i64* %3 to i8*, !dbg !348
  call void @free(i8* %4) #5, !dbg !348
  store i8 0, i8* %_12_has_ownership, align 1, !dbg !348
  br label %if.end, !dbg !348

if.end:                                           ; preds = %if.then, %entry
  %5 = load i64, i64* %_11, align 8, !dbg !351
  store i64 %5, i64* %_12_size, align 8, !dbg !351
  %6 = load i64, i64* %_10, align 8, !dbg !351
  %conv = trunc i64 %6 to i32, !dbg !351
  %7 = load i64, i64* %_12_size, align 8, !dbg !351
  %conv1 = trunc i64 %7 to i32, !dbg !351
  %call = call i64* @gen1DArray(i32 %conv, i32 %conv1), !dbg !351
  store i64* %call, i64** %_12, align 8, !dbg !351
  store i8 1, i8* %_12_has_ownership, align 1, !dbg !352
  %8 = load i8, i8* %moves_has_ownership, align 1, !dbg !353
  %tobool2 = trunc i8 %8 to i1, !dbg !353
  br i1 %tobool2, label %if.then3, label %if.end4, !dbg !355

if.then3:                                         ; preds = %if.end
  %9 = load i64*, i64** %moves, align 8, !dbg !356
  %10 = bitcast i64* %9 to i8*, !dbg !356
  call void @free(i8* %10) #5, !dbg !356
  store i8 0, i8* %moves_has_ownership, align 1, !dbg !356
  br label %if.end4, !dbg !356

if.end4:                                          ; preds = %if.then3, %if.end
  %11 = load i64, i64* %_12_size, align 8, !dbg !359
  store i64 %11, i64* %moves_size, align 8, !dbg !359
  %12 = load i64*, i64** %_12, align 8, !dbg !359
  store i64* %12, i64** %moves, align 8, !dbg !359
  store i8 1, i8* %moves_has_ownership, align 1, !dbg !360
  store i8 0, i8* %_12_has_ownership, align 1, !dbg !361
  store i64 0, i64* %_13, align 8, !dbg !362
  %13 = load i64, i64* %_13, align 8, !dbg !363
  store i64 %13, i64* %s, align 8, !dbg !364
  br label %while.body, !dbg !365

while.body:                                       ; preds = %if.end4, %blklab5
  %14 = load i64, i64* %s, align 8, !dbg !366
  %15 = load i64, i64* %n.addr, align 8, !dbg !369
  %cmp = icmp sge i64 %14, %15, !dbg !370
  br i1 %cmp, label %if.then6, label %if.end7, !dbg !371

if.then6:                                         ; preds = %while.body
  br label %blklab4, !dbg !372

if.end7:                                          ; preds = %while.body
  %16 = load i64, i64* %s, align 8, !dbg !375
  store i64 %16, i64* %j, align 8, !dbg !376
  store i64 0, i64* %_14, align 8, !dbg !377
  %17 = load i64, i64* %_14, align 8, !dbg !378
  store i64 %17, i64* %i, align 8, !dbg !379
  br label %while.body9, !dbg !380

while.body9:                                      ; preds = %if.end7, %blklab7
  %18 = load i64, i64* %j, align 8, !dbg !381
  %19 = load i64, i64* %n.addr, align 8, !dbg !384
  %cmp10 = icmp sge i64 %18, %19, !dbg !385
  br i1 %cmp10, label %if.then12, label %if.end13, !dbg !386

if.then12:                                        ; preds = %while.body9
  br label %blklab6, !dbg !387

if.end13:                                         ; preds = %while.body9
  store i64 0, i64* %_15, align 8, !dbg !390
  %20 = load i64, i64* %_15, align 8, !dbg !391
  store i64 %20, i64* %y, align 8, !dbg !392
  store i64 1, i64* %_16, align 8, !dbg !393
  %21 = load i64, i64* %i, align 8, !dbg !394
  %22 = load i64, i64* %_16, align 8, !dbg !395
  %add = add nsw i64 %21, %22, !dbg !396
  store i64 %add, i64* %_17, align 8, !dbg !397
  %23 = load i64, i64* %_17, align 8, !dbg !398
  %24 = load i64, i64* %n.addr, align 8, !dbg !400
  %cmp14 = icmp sge i64 %23, %24, !dbg !401
  br i1 %cmp14, label %if.then16, label %if.end17, !dbg !402

if.then16:                                        ; preds = %if.end13
  br label %blklab8, !dbg !403

if.end17:                                         ; preds = %if.end13
  store i64 1, i64* %_18, align 8, !dbg !406
  %25 = load i64, i64* %j, align 8, !dbg !407
  %26 = load i64, i64* %_18, align 8, !dbg !408
  %sub = sub nsw i64 %25, %26, !dbg !409
  store i64 %sub, i64* %_19, align 8, !dbg !410
  store i64 0, i64* %_20, align 8, !dbg !411
  %27 = load i64, i64* %_19, align 8, !dbg !412
  %28 = load i64, i64* %_20, align 8, !dbg !414
  %cmp18 = icmp slt i64 %27, %28, !dbg !415
  br i1 %cmp18, label %if.then20, label %if.end21, !dbg !416

if.then20:                                        ; preds = %if.end17
  br label %blklab8, !dbg !417

if.end21:                                         ; preds = %if.end17
  store i64 1, i64* %_21, align 8, !dbg !420
  %29 = load i64, i64* %i, align 8, !dbg !421
  %30 = load i64, i64* %_21, align 8, !dbg !422
  %add22 = add nsw i64 %29, %30, !dbg !423
  store i64 %add22, i64* %_22, align 8, !dbg !424
  %31 = load i64, i64* %_22, align 8, !dbg !425
  %32 = load i64, i64* %n.addr, align 8, !dbg !426
  %mul23 = mul nsw i64 %31, %32, !dbg !427
  store i64 %mul23, i64* %_23, align 8, !dbg !428
  %33 = load i64, i64* %_23, align 8, !dbg !429
  %34 = load i64, i64* %j, align 8, !dbg !430
  %add24 = add nsw i64 %33, %34, !dbg !431
  store i64 %add24, i64* %_24, align 8, !dbg !432
  store i64 1, i64* %_25, align 8, !dbg !433
  %35 = load i64, i64* %_24, align 8, !dbg !434
  %36 = load i64, i64* %_25, align 8, !dbg !435
  %sub25 = sub nsw i64 %35, %36, !dbg !436
  store i64 %sub25, i64* %_26, align 8, !dbg !437
  %37 = load i64, i64* %_26, align 8, !dbg !438
  %38 = load i64*, i64** %moves, align 8, !dbg !439
  %arrayidx = getelementptr inbounds i64, i64* %38, i64 %37, !dbg !439
  %39 = load i64, i64* %arrayidx, align 8, !dbg !439
  store i64 %39, i64* %_27, align 8, !dbg !440
  %40 = load i64, i64* %_27, align 8, !dbg !441
  store i64 %40, i64* %y, align 8, !dbg !442
  br label %blklab8, !dbg !443

blklab8:                                          ; preds = %if.end21, %if.then20, %if.then16
  store i64 0, i64* %_28, align 8, !dbg !444
  %41 = load i64, i64* %_28, align 8, !dbg !445
  store i64 %41, i64* %x, align 8, !dbg !446
  store i64 2, i64* %_29, align 8, !dbg !447
  %42 = load i64, i64* %i, align 8, !dbg !448
  %43 = load i64, i64* %_29, align 8, !dbg !449
  %add26 = add nsw i64 %42, %43, !dbg !450
  store i64 %add26, i64* %_30, align 8, !dbg !451
  %44 = load i64, i64* %_30, align 8, !dbg !452
  %45 = load i64, i64* %n.addr, align 8, !dbg !454
  %cmp27 = icmp sge i64 %44, %45, !dbg !455
  br i1 %cmp27, label %if.then29, label %if.end30, !dbg !456

if.then29:                                        ; preds = %blklab8
  br label %blklab9, !dbg !457

if.end30:                                         ; preds = %blklab8
  store i64 2, i64* %_31, align 8, !dbg !460
  %46 = load i64, i64* %i, align 8, !dbg !461
  %47 = load i64, i64* %_31, align 8, !dbg !462
  %add31 = add nsw i64 %46, %47, !dbg !463
  store i64 %add31, i64* %_32, align 8, !dbg !464
  %48 = load i64, i64* %_32, align 8, !dbg !465
  %49 = load i64, i64* %n.addr, align 8, !dbg !466
  %mul32 = mul nsw i64 %48, %49, !dbg !467
  store i64 %mul32, i64* %_33, align 8, !dbg !468
  %50 = load i64, i64* %_33, align 8, !dbg !469
  %51 = load i64, i64* %j, align 8, !dbg !470
  %add33 = add nsw i64 %50, %51, !dbg !471
  store i64 %add33, i64* %_34, align 8, !dbg !472
  %52 = load i64, i64* %_34, align 8, !dbg !473
  %53 = load i64*, i64** %moves, align 8, !dbg !474
  %arrayidx34 = getelementptr inbounds i64, i64* %53, i64 %52, !dbg !474
  %54 = load i64, i64* %arrayidx34, align 8, !dbg !474
  store i64 %54, i64* %_35, align 8, !dbg !475
  %55 = load i64, i64* %_35, align 8, !dbg !476
  store i64 %55, i64* %x, align 8, !dbg !477
  br label %blklab9, !dbg !478

blklab9:                                          ; preds = %if.end30, %if.then29
  store i64 0, i64* %_36, align 8, !dbg !479
  %56 = load i64, i64* %_36, align 8, !dbg !480
  store i64 %56, i64* %z, align 8, !dbg !481
  store i64 1, i64* %_37, align 8, !dbg !482
  %57 = load i64, i64* %j, align 8, !dbg !483
  %58 = load i64, i64* %_37, align 8, !dbg !484
  %sub35 = sub nsw i64 %57, %58, !dbg !485
  store i64 %sub35, i64* %_38, align 8, !dbg !486
  store i64 0, i64* %_39, align 8, !dbg !487
  %59 = load i64, i64* %_38, align 8, !dbg !488
  %60 = load i64, i64* %_39, align 8, !dbg !490
  %cmp36 = icmp sle i64 %59, %60, !dbg !491
  br i1 %cmp36, label %if.then38, label %if.end39, !dbg !492

if.then38:                                        ; preds = %blklab9
  br label %blklab10, !dbg !493

if.end39:                                         ; preds = %blklab9
  %61 = load i64, i64* %i, align 8, !dbg !496
  %62 = load i64, i64* %n.addr, align 8, !dbg !497
  %mul40 = mul nsw i64 %61, %62, !dbg !498
  store i64 %mul40, i64* %_40, align 8, !dbg !499
  %63 = load i64, i64* %_40, align 8, !dbg !500
  %64 = load i64, i64* %j, align 8, !dbg !501
  %add41 = add nsw i64 %63, %64, !dbg !502
  store i64 %add41, i64* %_41, align 8, !dbg !503
  store i64 2, i64* %_42, align 8, !dbg !504
  %65 = load i64, i64* %_41, align 8, !dbg !505
  %66 = load i64, i64* %_42, align 8, !dbg !506
  %sub42 = sub nsw i64 %65, %66, !dbg !507
  store i64 %sub42, i64* %_43, align 8, !dbg !508
  %67 = load i64, i64* %_43, align 8, !dbg !509
  %68 = load i64*, i64** %moves, align 8, !dbg !510
  %arrayidx43 = getelementptr inbounds i64, i64* %68, i64 %67, !dbg !510
  %69 = load i64, i64* %arrayidx43, align 8, !dbg !510
  store i64 %69, i64* %_44, align 8, !dbg !511
  %70 = load i64, i64* %_44, align 8, !dbg !512
  store i64 %70, i64* %z, align 8, !dbg !513
  br label %blklab10, !dbg !514

blklab10:                                         ; preds = %if.end39, %if.then38
  %71 = load i64, i64* %x, align 8, !dbg !515
  %72 = load i64, i64* %y, align 8, !dbg !517
  %cmp44 = icmp sle i64 %71, %72, !dbg !518
  br i1 %cmp44, label %if.then46, label %if.end47, !dbg !519

if.then46:                                        ; preds = %blklab10
  br label %blklab11, !dbg !520

if.end47:                                         ; preds = %blklab10
  %73 = load i64, i64* %y, align 8, !dbg !523
  store i64 %73, i64* %x, align 8, !dbg !524
  br label %blklab11, !dbg !525

blklab11:                                         ; preds = %if.end47, %if.then46
  %74 = load i64, i64* %z, align 8, !dbg !526
  %75 = load i64, i64* %y, align 8, !dbg !528
  %cmp48 = icmp sle i64 %74, %75, !dbg !529
  br i1 %cmp48, label %if.then50, label %if.end51, !dbg !530

if.then50:                                        ; preds = %blklab11
  br label %blklab12, !dbg !531

if.end51:                                         ; preds = %blklab11
  %76 = load i64, i64* %y, align 8, !dbg !534
  store i64 %76, i64* %z, align 8, !dbg !535
  br label %blklab12, !dbg !536

blklab12:                                         ; preds = %if.end51, %if.then50
  %77 = load i64, i64* %i, align 8, !dbg !537
  %78 = load i64*, i64** %coins.addr, align 8, !dbg !538
  %arrayidx52 = getelementptr inbounds i64, i64* %78, i64 %77, !dbg !538
  %79 = load i64, i64* %arrayidx52, align 8, !dbg !538
  store i64 %79, i64* %_45, align 8, !dbg !539
  %80 = load i64, i64* %_45, align 8, !dbg !540
  %81 = load i64, i64* %x, align 8, !dbg !541
  %add53 = add nsw i64 %80, %81, !dbg !542
  store i64 %add53, i64* %_46, align 8, !dbg !543
  %82 = load i64, i64* %j, align 8, !dbg !544
  %83 = load i64*, i64** %coins.addr, align 8, !dbg !545
  %arrayidx54 = getelementptr inbounds i64, i64* %83, i64 %82, !dbg !545
  %84 = load i64, i64* %arrayidx54, align 8, !dbg !545
  store i64 %84, i64* %_47, align 8, !dbg !546
  %85 = load i64, i64* %_47, align 8, !dbg !547
  %86 = load i64, i64* %z, align 8, !dbg !548
  %add55 = add nsw i64 %85, %86, !dbg !549
  store i64 %add55, i64* %_48, align 8, !dbg !550
  %87 = load i64, i64* %_46, align 8, !dbg !551
  %88 = load i64, i64* %_48, align 8, !dbg !553
  %cmp56 = icmp sle i64 %87, %88, !dbg !554
  br i1 %cmp56, label %if.then58, label %if.end59, !dbg !555

if.then58:                                        ; preds = %blklab12
  br label %blklab13, !dbg !556

if.end59:                                         ; preds = %blklab12
  %89 = load i64, i64* %i, align 8, !dbg !559
  %90 = load i64*, i64** %coins.addr, align 8, !dbg !560
  %arrayidx60 = getelementptr inbounds i64, i64* %90, i64 %89, !dbg !560
  %91 = load i64, i64* %arrayidx60, align 8, !dbg !560
  store i64 %91, i64* %_49, align 8, !dbg !561
  %92 = load i64, i64* %_49, align 8, !dbg !562
  %93 = load i64, i64* %x, align 8, !dbg !563
  %add61 = add nsw i64 %92, %93, !dbg !564
  store i64 %add61, i64* %_50, align 8, !dbg !565
  %94 = load i64, i64* %i, align 8, !dbg !566
  %95 = load i64, i64* %n.addr, align 8, !dbg !567
  %mul62 = mul nsw i64 %94, %95, !dbg !568
  store i64 %mul62, i64* %_51, align 8, !dbg !569
  %96 = load i64, i64* %_51, align 8, !dbg !570
  %97 = load i64, i64* %j, align 8, !dbg !571
  %add63 = add nsw i64 %96, %97, !dbg !572
  store i64 %add63, i64* %_52, align 8, !dbg !573
  %98 = load i64, i64* %_50, align 8, !dbg !574
  %99 = load i64, i64* %_52, align 8, !dbg !575
  %100 = load i64*, i64** %moves, align 8, !dbg !576
  %arrayidx64 = getelementptr inbounds i64, i64* %100, i64 %99, !dbg !576
  store i64 %98, i64* %arrayidx64, align 8, !dbg !577
  br label %blklab14, !dbg !578

blklab13:                                         ; preds = %if.then58
  %101 = load i64, i64* %j, align 8, !dbg !579
  %102 = load i64*, i64** %coins.addr, align 8, !dbg !580
  %arrayidx65 = getelementptr inbounds i64, i64* %102, i64 %101, !dbg !580
  %103 = load i64, i64* %arrayidx65, align 8, !dbg !580
  store i64 %103, i64* %_53, align 8, !dbg !581
  %104 = load i64, i64* %_53, align 8, !dbg !582
  %105 = load i64, i64* %z, align 8, !dbg !583
  %add66 = add nsw i64 %104, %105, !dbg !584
  store i64 %add66, i64* %_54, align 8, !dbg !585
  %106 = load i64, i64* %i, align 8, !dbg !586
  %107 = load i64, i64* %n.addr, align 8, !dbg !587
  %mul67 = mul nsw i64 %106, %107, !dbg !588
  store i64 %mul67, i64* %_55, align 8, !dbg !589
  %108 = load i64, i64* %_55, align 8, !dbg !590
  %109 = load i64, i64* %j, align 8, !dbg !591
  %add68 = add nsw i64 %108, %109, !dbg !592
  store i64 %add68, i64* %_56, align 8, !dbg !593
  %110 = load i64, i64* %_54, align 8, !dbg !594
  %111 = load i64, i64* %_56, align 8, !dbg !595
  %112 = load i64*, i64** %moves, align 8, !dbg !596
  %arrayidx69 = getelementptr inbounds i64, i64* %112, i64 %111, !dbg !596
  store i64 %110, i64* %arrayidx69, align 8, !dbg !597
  br label %blklab14, !dbg !596

blklab14:                                         ; preds = %blklab13, %if.end59
  store i64 1, i64* %_57, align 8, !dbg !598
  %113 = load i64, i64* %j, align 8, !dbg !599
  %114 = load i64, i64* %_57, align 8, !dbg !600
  %add70 = add nsw i64 %113, %114, !dbg !601
  store i64 %add70, i64* %_58, align 8, !dbg !602
  %115 = load i64, i64* %_58, align 8, !dbg !603
  store i64 %115, i64* %j, align 8, !dbg !604
  store i64 1, i64* %_59, align 8, !dbg !605
  %116 = load i64, i64* %i, align 8, !dbg !606
  %117 = load i64, i64* %_59, align 8, !dbg !607
  %add71 = add nsw i64 %116, %117, !dbg !608
  store i64 %add71, i64* %_60, align 8, !dbg !609
  %118 = load i64, i64* %_60, align 8, !dbg !610
  store i64 %118, i64* %i, align 8, !dbg !611
  br label %blklab7, !dbg !612

blklab7:                                          ; preds = %blklab14
  br label %while.body9, !dbg !613

blklab6:                                          ; preds = %if.then12
  store i64 1, i64* %_61, align 8, !dbg !615
  %119 = load i64, i64* %s, align 8, !dbg !616
  %120 = load i64, i64* %_61, align 8, !dbg !617
  %add72 = add nsw i64 %119, %120, !dbg !618
  store i64 %add72, i64* %_62, align 8, !dbg !619
  %121 = load i64, i64* %_62, align 8, !dbg !620
  store i64 %121, i64* %s, align 8, !dbg !621
  br label %blklab5, !dbg !622

blklab5:                                          ; preds = %blklab6
  br label %while.body, !dbg !623

blklab4:                                          ; preds = %if.then6
  %122 = load i8, i8* %coins_has_ownership.addr, align 1, !dbg !625
  %tobool73 = trunc i8 %122 to i1, !dbg !625
  br i1 %tobool73, label %if.then74, label %if.end75, !dbg !627

if.then74:                                        ; preds = %blklab4
  %123 = load i64*, i64** %coins.addr, align 8, !dbg !628
  %124 = bitcast i64* %123 to i8*, !dbg !628
  call void @free(i8* %124) #5, !dbg !628
  store i8 0, i8* %coins_has_ownership.addr, align 1, !dbg !628
  br label %if.end75, !dbg !628

if.end75:                                         ; preds = %if.then74, %blklab4
  %125 = load i8, i8* %_2_has_ownership, align 1, !dbg !631
  %tobool76 = trunc i8 %125 to i1, !dbg !631
  br i1 %tobool76, label %if.then77, label %if.end78, !dbg !633

if.then77:                                        ; preds = %if.end75
  %126 = load i64*, i64** %_2, align 8, !dbg !634
  %127 = bitcast i64* %126 to i8*, !dbg !634
  call void @free(i8* %127) #5, !dbg !634
  store i8 0, i8* %_2_has_ownership, align 1, !dbg !634
  br label %if.end78, !dbg !634

if.end78:                                         ; preds = %if.then77, %if.end75
  %128 = load i8, i8* %_12_has_ownership, align 1, !dbg !637
  %tobool79 = trunc i8 %128 to i1, !dbg !637
  br i1 %tobool79, label %if.then80, label %if.end81, !dbg !639

if.then80:                                        ; preds = %if.end78
  %129 = load i64*, i64** %_12, align 8, !dbg !640
  %130 = bitcast i64* %129 to i8*, !dbg !640
  call void @free(i8* %130) #5, !dbg !640
  store i8 0, i8* %_12_has_ownership, align 1, !dbg !640
  br label %if.end81, !dbg !640

if.end81:                                         ; preds = %if.then80, %if.end78
  %131 = load i64*, i64** %moves, align 8, !dbg !643
  ret i64* %131, !dbg !644
}

; Function Attrs: nounwind uwtable
define i32 @main(i32 %argc, i8** %args) #0 !dbg !18 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %args.addr = alloca i8**, align 8
  %max = alloca i64*, align 8
  %n = alloca i64, align 8
  %coins = alloca i64*, align 8
  %coins_size = alloca i64, align 8
  %coins_has_ownership = alloca i8, align 1
  %moves = alloca i64*, align 8
  %moves_size = alloca i64, align 8
  %moves_has_ownership = alloca i8, align 1
  %sum_alice = alloca i64, align 8
  %sum_bob = alloca i64, align 8
  %_7 = alloca i64*, align 8
  %_8 = alloca i64**, align 8
  %_8_size = alloca i64, align 8
  %_8_size_size = alloca i64, align 8
  %_8_has_ownership = alloca i8, align 1
  %_9 = alloca i64, align 8
  %_10 = alloca i64*, align 8
  %_10_size = alloca i64, align 8
  %_10_has_ownership = alloca i8, align 1
  %_11 = alloca i64*, align 8
  %_11_size = alloca i64, align 8
  %_11_has_ownership = alloca i8, align 1
  %_12 = alloca i64*, align 8
  %_12_size = alloca i64, align 8
  %_12_has_ownership = alloca i8, align 1
  %_13 = alloca i64, align 8
  %_14 = alloca i64, align 8
  %_15 = alloca i64, align 8
  %_16 = alloca i64, align 8
  %_17 = alloca i8*, align 8
  %_19 = alloca i64*, align 8
  %_19_size = alloca i64, align 8
  %_19_has_ownership = alloca i8, align 1
  %_20 = alloca i8*, align 8
  %_22 = alloca i8*, align 8
  %_24 = alloca i64*, align 8
  %_24_size = alloca i64, align 8
  %_24_has_ownership = alloca i8, align 1
  %_25 = alloca i8*, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !645, metadata !29), !dbg !646
  store i8** %args, i8*** %args.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %args.addr, metadata !647, metadata !29), !dbg !648
  call void @llvm.dbg.declare(metadata i64** %max, metadata !649, metadata !29), !dbg !650
  call void @llvm.dbg.declare(metadata i64* %n, metadata !651, metadata !29), !dbg !652
  store i64 0, i64* %n, align 8, !dbg !652
  call void @llvm.dbg.declare(metadata i64** %coins, metadata !653, metadata !29), !dbg !654
  store i64* null, i64** %coins, align 8, !dbg !654
  call void @llvm.dbg.declare(metadata i64* %coins_size, metadata !655, metadata !29), !dbg !654
  store i64 0, i64* %coins_size, align 8, !dbg !654
  call void @llvm.dbg.declare(metadata i8* %coins_has_ownership, metadata !656, metadata !29), !dbg !657
  store i8 0, i8* %coins_has_ownership, align 1, !dbg !657
  call void @llvm.dbg.declare(metadata i64** %moves, metadata !658, metadata !29), !dbg !659
  store i64* null, i64** %moves, align 8, !dbg !659
  call void @llvm.dbg.declare(metadata i64* %moves_size, metadata !660, metadata !29), !dbg !659
  store i64 0, i64* %moves_size, align 8, !dbg !659
  call void @llvm.dbg.declare(metadata i8* %moves_has_ownership, metadata !661, metadata !29), !dbg !662
  store i8 0, i8* %moves_has_ownership, align 1, !dbg !662
  call void @llvm.dbg.declare(metadata i64* %sum_alice, metadata !663, metadata !29), !dbg !664
  store i64 0, i64* %sum_alice, align 8, !dbg !664
  call void @llvm.dbg.declare(metadata i64* %sum_bob, metadata !665, metadata !29), !dbg !666
  store i64 0, i64* %sum_bob, align 8, !dbg !666
  call void @llvm.dbg.declare(metadata i64** %_7, metadata !667, metadata !29), !dbg !668
  call void @llvm.dbg.declare(metadata i64*** %_8, metadata !669, metadata !29), !dbg !671
  store i64** null, i64*** %_8, align 8, !dbg !671
  call void @llvm.dbg.declare(metadata i64* %_8_size, metadata !672, metadata !29), !dbg !671
  store i64 0, i64* %_8_size, align 8, !dbg !671
  call void @llvm.dbg.declare(metadata i64* %_8_size_size, metadata !673, metadata !29), !dbg !671
  store i64 0, i64* %_8_size_size, align 8, !dbg !671
  call void @llvm.dbg.declare(metadata i8* %_8_has_ownership, metadata !674, metadata !29), !dbg !675
  store i8 0, i8* %_8_has_ownership, align 1, !dbg !675
  call void @llvm.dbg.declare(metadata i64* %_9, metadata !676, metadata !29), !dbg !677
  store i64 0, i64* %_9, align 8, !dbg !677
  call void @llvm.dbg.declare(metadata i64** %_10, metadata !678, metadata !29), !dbg !679
  store i64* null, i64** %_10, align 8, !dbg !679
  call void @llvm.dbg.declare(metadata i64* %_10_size, metadata !680, metadata !29), !dbg !679
  store i64 0, i64* %_10_size, align 8, !dbg !679
  call void @llvm.dbg.declare(metadata i8* %_10_has_ownership, metadata !681, metadata !29), !dbg !682
  store i8 0, i8* %_10_has_ownership, align 1, !dbg !682
  call void @llvm.dbg.declare(metadata i64** %_11, metadata !683, metadata !29), !dbg !684
  store i64* null, i64** %_11, align 8, !dbg !684
  call void @llvm.dbg.declare(metadata i64* %_11_size, metadata !685, metadata !29), !dbg !684
  store i64 0, i64* %_11_size, align 8, !dbg !684
  call void @llvm.dbg.declare(metadata i8* %_11_has_ownership, metadata !686, metadata !29), !dbg !687
  store i8 0, i8* %_11_has_ownership, align 1, !dbg !687
  call void @llvm.dbg.declare(metadata i64** %_12, metadata !688, metadata !29), !dbg !689
  store i64* null, i64** %_12, align 8, !dbg !689
  call void @llvm.dbg.declare(metadata i64* %_12_size, metadata !690, metadata !29), !dbg !689
  store i64 0, i64* %_12_size, align 8, !dbg !689
  call void @llvm.dbg.declare(metadata i8* %_12_has_ownership, metadata !691, metadata !29), !dbg !692
  store i8 0, i8* %_12_has_ownership, align 1, !dbg !692
  call void @llvm.dbg.declare(metadata i64* %_13, metadata !693, metadata !29), !dbg !694
  store i64 0, i64* %_13, align 8, !dbg !694
  call void @llvm.dbg.declare(metadata i64* %_14, metadata !695, metadata !29), !dbg !696
  store i64 0, i64* %_14, align 8, !dbg !696
  call void @llvm.dbg.declare(metadata i64* %_15, metadata !697, metadata !29), !dbg !698
  store i64 0, i64* %_15, align 8, !dbg !698
  call void @llvm.dbg.declare(metadata i64* %_16, metadata !699, metadata !29), !dbg !700
  store i64 0, i64* %_16, align 8, !dbg !700
  call void @llvm.dbg.declare(metadata i8** %_17, metadata !701, metadata !29), !dbg !702
  call void @llvm.dbg.declare(metadata i64** %_19, metadata !703, metadata !29), !dbg !704
  store i64* null, i64** %_19, align 8, !dbg !704
  call void @llvm.dbg.declare(metadata i64* %_19_size, metadata !705, metadata !29), !dbg !704
  store i64 0, i64* %_19_size, align 8, !dbg !704
  call void @llvm.dbg.declare(metadata i8* %_19_has_ownership, metadata !706, metadata !29), !dbg !707
  store i8 0, i8* %_19_has_ownership, align 1, !dbg !707
  call void @llvm.dbg.declare(metadata i8** %_20, metadata !708, metadata !29), !dbg !709
  call void @llvm.dbg.declare(metadata i8** %_22, metadata !710, metadata !29), !dbg !711
  call void @llvm.dbg.declare(metadata i64** %_24, metadata !712, metadata !29), !dbg !713
  store i64* null, i64** %_24, align 8, !dbg !713
  call void @llvm.dbg.declare(metadata i64* %_24_size, metadata !714, metadata !29), !dbg !713
  store i64 0, i64* %_24_size, align 8, !dbg !713
  call void @llvm.dbg.declare(metadata i8* %_24_has_ownership, metadata !715, metadata !29), !dbg !716
  store i8 0, i8* %_24_has_ownership, align 1, !dbg !716
  call void @llvm.dbg.declare(metadata i8** %_25, metadata !717, metadata !29), !dbg !718
  %0 = load i32, i32* %argc.addr, align 4, !dbg !719
  %1 = load i8**, i8*** %args.addr, align 8, !dbg !719
  %call = call i64** @convertArgsToIntArray(i32 %0, i8** %1), !dbg !719
  store i64** %call, i64*** %_8, align 8, !dbg !719
  %2 = load i32, i32* %argc.addr, align 4, !dbg !719
  %sub = sub nsw i32 %2, 1, !dbg !719
  %conv = sext i32 %sub to i64, !dbg !719
  store i64 %conv, i64* %_8_size, align 8, !dbg !719
  store i8 1, i8* %_8_has_ownership, align 1, !dbg !720
  store i64 0, i64* %_9, align 8, !dbg !721
  %3 = load i64, i64* %_9, align 8, !dbg !722
  %4 = load i64**, i64*** %_8, align 8, !dbg !723
  %arrayidx = getelementptr inbounds i64*, i64** %4, i64 %3, !dbg !723
  %5 = load i64*, i64** %arrayidx, align 8, !dbg !723
  store i64* %5, i64** %_10, align 8, !dbg !724
  %6 = load i64*, i64** %_10, align 8, !dbg !725
  %call1 = call i64* @parseStringToInt(i64* %6), !dbg !725
  store i64* %call1, i64** %_7, align 8, !dbg !725
  %7 = load i64*, i64** %_7, align 8, !dbg !726
  store i64* %7, i64** %max, align 8, !dbg !727
  %8 = load i64*, i64** %max, align 8, !dbg !728
  %cmp = icmp eq i64* %8, null, !dbg !730
  br i1 %cmp, label %if.then, label %if.end, !dbg !731

if.then:                                          ; preds = %entry
  br label %blklab15, !dbg !732

if.end:                                           ; preds = %entry
  %9 = load i64*, i64** %max, align 8, !dbg !735
  %10 = load i64, i64* %9, align 8, !dbg !736
  store i64 %10, i64* %n, align 8, !dbg !737
  %11 = load i8, i8* %_11_has_ownership, align 1, !dbg !738
  %tobool = trunc i8 %11 to i1, !dbg !738
  br i1 %tobool, label %if.then3, label %if.end4, !dbg !740

if.then3:                                         ; preds = %if.end
  %12 = load i64*, i64** %_11, align 8, !dbg !741
  %13 = bitcast i64* %12 to i8*, !dbg !741
  call void @free(i8* %13) #5, !dbg !741
  store i8 0, i8* %_11_has_ownership, align 1, !dbg !741
  br label %if.end4, !dbg !741

if.end4:                                          ; preds = %if.then3, %if.end
  %14 = load i64, i64* %n, align 8, !dbg !744
  %call5 = call i64* @init(i64 %14), !dbg !745
  store i64* %call5, i64** %_11, align 8, !dbg !746
  store i8 1, i8* %_11_has_ownership, align 1, !dbg !747
  %15 = load i8, i8* %coins_has_ownership, align 1, !dbg !748
  %tobool6 = trunc i8 %15 to i1, !dbg !748
  br i1 %tobool6, label %if.then7, label %if.end8, !dbg !750

if.then7:                                         ; preds = %if.end4
  %16 = load i64*, i64** %coins, align 8, !dbg !751
  %17 = bitcast i64* %16 to i8*, !dbg !751
  call void @free(i8* %17) #5, !dbg !751
  store i8 0, i8* %coins_has_ownership, align 1, !dbg !751
  br label %if.end8, !dbg !751

if.end8:                                          ; preds = %if.then7, %if.end4
  %18 = load i64, i64* %_11_size, align 8, !dbg !754
  store i64 %18, i64* %coins_size, align 8, !dbg !754
  %19 = load i64*, i64** %_11, align 8, !dbg !754
  store i64* %19, i64** %coins, align 8, !dbg !754
  store i8 1, i8* %coins_has_ownership, align 1, !dbg !755
  store i8 0, i8* %_11_has_ownership, align 1, !dbg !756
  %20 = load i8, i8* %_12_has_ownership, align 1, !dbg !757
  %tobool9 = trunc i8 %20 to i1, !dbg !757
  br i1 %tobool9, label %if.then10, label %if.end11, !dbg !759

if.then10:                                        ; preds = %if.end8
  %21 = load i64*, i64** %_12, align 8, !dbg !760
  %22 = bitcast i64* %21 to i8*, !dbg !760
  call void @free(i8* %22) #5, !dbg !760
  store i8 0, i8* %_12_has_ownership, align 1, !dbg !760
  br label %if.end11, !dbg !760

if.end11:                                         ; preds = %if.then10, %if.end8
  store i8 1, i8* %coins_has_ownership, align 1, !dbg !763
  %23 = load i64, i64* %coins_size, align 8, !dbg !764
  store i64 %23, i64* %_12_size, align 8, !dbg !764
  %24 = load i64*, i64** %coins, align 8, !dbg !765
  %25 = load i64, i64* %coins_size, align 8, !dbg !765
  %26 = load i64, i64* %n, align 8, !dbg !766
  %call12 = call i64* @findMoves(i64* %24, i64 %25, i1 zeroext false, i64 %26), !dbg !767
  store i64* %call12, i64** %_12, align 8, !dbg !768
  store i8 1, i8* %_12_has_ownership, align 1, !dbg !769
  %27 = load i8, i8* %moves_has_ownership, align 1, !dbg !770
  %tobool13 = trunc i8 %27 to i1, !dbg !770
  br i1 %tobool13, label %if.then14, label %if.end15, !dbg !772

if.then14:                                        ; preds = %if.end11
  %28 = load i64*, i64** %moves, align 8, !dbg !773
  %29 = bitcast i64* %28 to i8*, !dbg !773
  call void @free(i8* %29) #5, !dbg !773
  store i8 0, i8* %moves_has_ownership, align 1, !dbg !773
  br label %if.end15, !dbg !773

if.end15:                                         ; preds = %if.then14, %if.end11
  %30 = load i64, i64* %_12_size, align 8, !dbg !776
  store i64 %30, i64* %moves_size, align 8, !dbg !776
  %31 = load i64*, i64** %_12, align 8, !dbg !776
  store i64* %31, i64** %moves, align 8, !dbg !776
  store i8 1, i8* %moves_has_ownership, align 1, !dbg !777
  store i8 0, i8* %_12_has_ownership, align 1, !dbg !778
  store i64 1, i64* %_13, align 8, !dbg !779
  %32 = load i64, i64* %n, align 8, !dbg !780
  %33 = load i64, i64* %_13, align 8, !dbg !781
  %sub16 = sub nsw i64 %32, %33, !dbg !782
  store i64 %sub16, i64* %_14, align 8, !dbg !783
  %34 = load i64, i64* %_14, align 8, !dbg !784
  %35 = load i64*, i64** %moves, align 8, !dbg !785
  %arrayidx17 = getelementptr inbounds i64, i64* %35, i64 %34, !dbg !785
  %36 = load i64, i64* %arrayidx17, align 8, !dbg !785
  store i64 %36, i64* %_15, align 8, !dbg !786
  %37 = load i64, i64* %_15, align 8, !dbg !787
  store i64 %37, i64* %sum_alice, align 8, !dbg !788
  store i8 1, i8* %coins_has_ownership, align 1, !dbg !789
  %38 = load i64, i64* %sum_alice, align 8, !dbg !790
  %39 = load i64*, i64** %coins, align 8, !dbg !791
  %40 = load i64, i64* %coins_size, align 8, !dbg !791
  %41 = load i64, i64* %n, align 8, !dbg !792
  %call18 = call i64 @getBobSum(i64 %38, i64* %39, i64 %40, i1 zeroext false, i64 %41), !dbg !793
  store i64 %call18, i64* %_16, align 8, !dbg !794
  %42 = load i64, i64* %_16, align 8, !dbg !795
  store i64 %42, i64* %sum_bob, align 8, !dbg !796
  %43 = load i64, i64* %sum_alice, align 8, !dbg !797
  %44 = load i64, i64* %sum_bob, align 8, !dbg !800
  %cmp19 = icmp sge i64 %43, %44, !dbg !801
  br i1 %cmp19, label %if.then21, label %if.end22, !dbg !802

if.then21:                                        ; preds = %if.end15
  br label %blklab16, !dbg !803

if.end22:                                         ; preds = %if.end15
  %45 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !dbg !806
  %call23 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %45, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str, i32 0, i32 0)), !dbg !807
  call void @exit(i32 -1) #6, !dbg !808
  unreachable, !dbg !808

blklab16:                                         ; preds = %if.then21
  %46 = load i8, i8* %_19_has_ownership, align 1, !dbg !809
  %tobool24 = trunc i8 %46 to i1, !dbg !809
  br i1 %tobool24, label %if.then25, label %if.end26, !dbg !811

if.then25:                                        ; preds = %blklab16
  %47 = load i64*, i64** %_19, align 8, !dbg !812
  %48 = bitcast i64* %47 to i8*, !dbg !812
  call void @free(i8* %48) #5, !dbg !812
  store i8 0, i8* %_19_has_ownership, align 1, !dbg !812
  br label %if.end26, !dbg !812

if.end26:                                         ; preds = %if.then25, %blklab16
  store i64 50, i64* %_19_size, align 8, !dbg !815
  %call27 = call noalias i8* @malloc(i64 400) #5, !dbg !815
  %49 = bitcast i8* %call27 to i64*, !dbg !815
  store i64* %49, i64** %_19, align 8, !dbg !815
  %50 = load i64*, i64** %_19, align 8, !dbg !816
  %arrayidx28 = getelementptr inbounds i64, i64* %50, i64 0, !dbg !816
  store i64 84, i64* %arrayidx28, align 8, !dbg !817
  %51 = load i64*, i64** %_19, align 8, !dbg !818
  %arrayidx29 = getelementptr inbounds i64, i64* %51, i64 1, !dbg !818
  store i64 104, i64* %arrayidx29, align 8, !dbg !819
  %52 = load i64*, i64** %_19, align 8, !dbg !820
  %arrayidx30 = getelementptr inbounds i64, i64* %52, i64 2, !dbg !820
  store i64 101, i64* %arrayidx30, align 8, !dbg !821
  %53 = load i64*, i64** %_19, align 8, !dbg !822
  %arrayidx31 = getelementptr inbounds i64, i64* %53, i64 3, !dbg !822
  store i64 32, i64* %arrayidx31, align 8, !dbg !823
  %54 = load i64*, i64** %_19, align 8, !dbg !824
  %arrayidx32 = getelementptr inbounds i64, i64* %54, i64 4, !dbg !824
  store i64 116, i64* %arrayidx32, align 8, !dbg !825
  %55 = load i64*, i64** %_19, align 8, !dbg !826
  %arrayidx33 = getelementptr inbounds i64, i64* %55, i64 5, !dbg !826
  store i64 111, i64* %arrayidx33, align 8, !dbg !827
  %56 = load i64*, i64** %_19, align 8, !dbg !828
  %arrayidx34 = getelementptr inbounds i64, i64* %56, i64 6, !dbg !828
  store i64 116, i64* %arrayidx34, align 8, !dbg !829
  %57 = load i64*, i64** %_19, align 8, !dbg !830
  %arrayidx35 = getelementptr inbounds i64, i64* %57, i64 7, !dbg !830
  store i64 97, i64* %arrayidx35, align 8, !dbg !831
  %58 = load i64*, i64** %_19, align 8, !dbg !832
  %arrayidx36 = getelementptr inbounds i64, i64* %58, i64 8, !dbg !832
  store i64 108, i64* %arrayidx36, align 8, !dbg !833
  %59 = load i64*, i64** %_19, align 8, !dbg !834
  %arrayidx37 = getelementptr inbounds i64, i64* %59, i64 9, !dbg !834
  store i64 32, i64* %arrayidx37, align 8, !dbg !835
  %60 = load i64*, i64** %_19, align 8, !dbg !836
  %arrayidx38 = getelementptr inbounds i64, i64* %60, i64 10, !dbg !836
  store i64 97, i64* %arrayidx38, align 8, !dbg !837
  %61 = load i64*, i64** %_19, align 8, !dbg !838
  %arrayidx39 = getelementptr inbounds i64, i64* %61, i64 11, !dbg !838
  store i64 109, i64* %arrayidx39, align 8, !dbg !839
  %62 = load i64*, i64** %_19, align 8, !dbg !840
  %arrayidx40 = getelementptr inbounds i64, i64* %62, i64 12, !dbg !840
  store i64 111, i64* %arrayidx40, align 8, !dbg !841
  %63 = load i64*, i64** %_19, align 8, !dbg !842
  %arrayidx41 = getelementptr inbounds i64, i64* %63, i64 13, !dbg !842
  store i64 117, i64* %arrayidx41, align 8, !dbg !843
  %64 = load i64*, i64** %_19, align 8, !dbg !844
  %arrayidx42 = getelementptr inbounds i64, i64* %64, i64 14, !dbg !844
  store i64 110, i64* %arrayidx42, align 8, !dbg !845
  %65 = load i64*, i64** %_19, align 8, !dbg !846
  %arrayidx43 = getelementptr inbounds i64, i64* %65, i64 15, !dbg !846
  store i64 116, i64* %arrayidx43, align 8, !dbg !847
  %66 = load i64*, i64** %_19, align 8, !dbg !848
  %arrayidx44 = getelementptr inbounds i64, i64* %66, i64 16, !dbg !848
  store i64 32, i64* %arrayidx44, align 8, !dbg !849
  %67 = load i64*, i64** %_19, align 8, !dbg !850
  %arrayidx45 = getelementptr inbounds i64, i64* %67, i64 17, !dbg !850
  store i64 111, i64* %arrayidx45, align 8, !dbg !851
  %68 = load i64*, i64** %_19, align 8, !dbg !852
  %arrayidx46 = getelementptr inbounds i64, i64* %68, i64 18, !dbg !852
  store i64 102, i64* %arrayidx46, align 8, !dbg !853
  %69 = load i64*, i64** %_19, align 8, !dbg !854
  %arrayidx47 = getelementptr inbounds i64, i64* %69, i64 19, !dbg !854
  store i64 32, i64* %arrayidx47, align 8, !dbg !855
  %70 = load i64*, i64** %_19, align 8, !dbg !856
  %arrayidx48 = getelementptr inbounds i64, i64* %70, i64 20, !dbg !856
  store i64 109, i64* %arrayidx48, align 8, !dbg !857
  %71 = load i64*, i64** %_19, align 8, !dbg !858
  %arrayidx49 = getelementptr inbounds i64, i64* %71, i64 21, !dbg !858
  store i64 111, i64* %arrayidx49, align 8, !dbg !859
  %72 = load i64*, i64** %_19, align 8, !dbg !860
  %arrayidx50 = getelementptr inbounds i64, i64* %72, i64 22, !dbg !860
  store i64 110, i64* %arrayidx50, align 8, !dbg !861
  %73 = load i64*, i64** %_19, align 8, !dbg !862
  %arrayidx51 = getelementptr inbounds i64, i64* %73, i64 23, !dbg !862
  store i64 101, i64* %arrayidx51, align 8, !dbg !863
  %74 = load i64*, i64** %_19, align 8, !dbg !864
  %arrayidx52 = getelementptr inbounds i64, i64* %74, i64 24, !dbg !864
  store i64 121, i64* %arrayidx52, align 8, !dbg !865
  %75 = load i64*, i64** %_19, align 8, !dbg !866
  %arrayidx53 = getelementptr inbounds i64, i64* %75, i64 25, !dbg !866
  store i64 32, i64* %arrayidx53, align 8, !dbg !867
  %76 = load i64*, i64** %_19, align 8, !dbg !868
  %arrayidx54 = getelementptr inbounds i64, i64* %76, i64 26, !dbg !868
  store i64 40, i64* %arrayidx54, align 8, !dbg !869
  %77 = load i64*, i64** %_19, align 8, !dbg !870
  %arrayidx55 = getelementptr inbounds i64, i64* %77, i64 27, !dbg !870
  store i64 109, i64* %arrayidx55, align 8, !dbg !871
  %78 = load i64*, i64** %_19, align 8, !dbg !872
  %arrayidx56 = getelementptr inbounds i64, i64* %78, i64 28, !dbg !872
  store i64 97, i64* %arrayidx56, align 8, !dbg !873
  %79 = load i64*, i64** %_19, align 8, !dbg !874
  %arrayidx57 = getelementptr inbounds i64, i64* %79, i64 29, !dbg !874
  store i64 120, i64* %arrayidx57, align 8, !dbg !875
  %80 = load i64*, i64** %_19, align 8, !dbg !876
  %arrayidx58 = getelementptr inbounds i64, i64* %80, i64 30, !dbg !876
  store i64 105, i64* %arrayidx58, align 8, !dbg !877
  %81 = load i64*, i64** %_19, align 8, !dbg !878
  %arrayidx59 = getelementptr inbounds i64, i64* %81, i64 31, !dbg !878
  store i64 109, i64* %arrayidx59, align 8, !dbg !879
  %82 = load i64*, i64** %_19, align 8, !dbg !880
  %arrayidx60 = getelementptr inbounds i64, i64* %82, i64 32, !dbg !880
  store i64 117, i64* %arrayidx60, align 8, !dbg !881
  %83 = load i64*, i64** %_19, align 8, !dbg !882
  %arrayidx61 = getelementptr inbounds i64, i64* %83, i64 33, !dbg !882
  store i64 109, i64* %arrayidx61, align 8, !dbg !883
  %84 = load i64*, i64** %_19, align 8, !dbg !884
  %arrayidx62 = getelementptr inbounds i64, i64* %84, i64 34, !dbg !884
  store i64 41, i64* %arrayidx62, align 8, !dbg !885
  %85 = load i64*, i64** %_19, align 8, !dbg !886
  %arrayidx63 = getelementptr inbounds i64, i64* %85, i64 35, !dbg !886
  store i64 32, i64* %arrayidx63, align 8, !dbg !887
  %86 = load i64*, i64** %_19, align 8, !dbg !888
  %arrayidx64 = getelementptr inbounds i64, i64* %86, i64 36, !dbg !888
  store i64 65, i64* %arrayidx64, align 8, !dbg !889
  %87 = load i64*, i64** %_19, align 8, !dbg !890
  %arrayidx65 = getelementptr inbounds i64, i64* %87, i64 37, !dbg !890
  store i64 108, i64* %arrayidx65, align 8, !dbg !891
  %88 = load i64*, i64** %_19, align 8, !dbg !892
  %arrayidx66 = getelementptr inbounds i64, i64* %88, i64 38, !dbg !892
  store i64 105, i64* %arrayidx66, align 8, !dbg !893
  %89 = load i64*, i64** %_19, align 8, !dbg !894
  %arrayidx67 = getelementptr inbounds i64, i64* %89, i64 39, !dbg !894
  store i64 99, i64* %arrayidx67, align 8, !dbg !895
  %90 = load i64*, i64** %_19, align 8, !dbg !896
  %arrayidx68 = getelementptr inbounds i64, i64* %90, i64 40, !dbg !896
  store i64 101, i64* %arrayidx68, align 8, !dbg !897
  %91 = load i64*, i64** %_19, align 8, !dbg !898
  %arrayidx69 = getelementptr inbounds i64, i64* %91, i64 41, !dbg !898
  store i64 32, i64* %arrayidx69, align 8, !dbg !899
  %92 = load i64*, i64** %_19, align 8, !dbg !900
  %arrayidx70 = getelementptr inbounds i64, i64* %92, i64 42, !dbg !900
  store i64 103, i64* %arrayidx70, align 8, !dbg !901
  %93 = load i64*, i64** %_19, align 8, !dbg !902
  %arrayidx71 = getelementptr inbounds i64, i64* %93, i64 43, !dbg !902
  store i64 101, i64* %arrayidx71, align 8, !dbg !903
  %94 = load i64*, i64** %_19, align 8, !dbg !904
  %arrayidx72 = getelementptr inbounds i64, i64* %94, i64 44, !dbg !904
  store i64 116, i64* %arrayidx72, align 8, !dbg !905
  %95 = load i64*, i64** %_19, align 8, !dbg !906
  %arrayidx73 = getelementptr inbounds i64, i64* %95, i64 45, !dbg !906
  store i64 115, i64* %arrayidx73, align 8, !dbg !907
  %96 = load i64*, i64** %_19, align 8, !dbg !908
  %arrayidx74 = getelementptr inbounds i64, i64* %96, i64 46, !dbg !908
  store i64 32, i64* %arrayidx74, align 8, !dbg !909
  %97 = load i64*, i64** %_19, align 8, !dbg !910
  %arrayidx75 = getelementptr inbounds i64, i64* %97, i64 47, !dbg !910
  store i64 105, i64* %arrayidx75, align 8, !dbg !911
  %98 = load i64*, i64** %_19, align 8, !dbg !912
  %arrayidx76 = getelementptr inbounds i64, i64* %98, i64 48, !dbg !912
  store i64 115, i64* %arrayidx76, align 8, !dbg !913
  %99 = load i64*, i64** %_19, align 8, !dbg !914
  %arrayidx77 = getelementptr inbounds i64, i64* %99, i64 49, !dbg !914
  store i64 32, i64* %arrayidx77, align 8, !dbg !915
  store i8 1, i8* %_19_has_ownership, align 1, !dbg !916
  %100 = load i64*, i64** %_19, align 8, !dbg !917
  %101 = load i64, i64* %_19_size, align 8, !dbg !917
  call void @printf_s(i64* %100, i64 %101), !dbg !918
  %102 = load i64, i64* %sum_alice, align 8, !dbg !919
  %call78 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.1, i32 0, i32 0), i64 %102), !dbg !920
  %103 = load i8, i8* %_24_has_ownership, align 1, !dbg !921
  %tobool79 = trunc i8 %103 to i1, !dbg !921
  br i1 %tobool79, label %if.then80, label %if.end81, !dbg !923

if.then80:                                        ; preds = %if.end26
  %104 = load i64*, i64** %_24, align 8, !dbg !924
  %105 = bitcast i64* %104 to i8*, !dbg !924
  call void @free(i8* %105) #5, !dbg !924
  store i8 0, i8* %_24_has_ownership, align 1, !dbg !924
  br label %if.end81, !dbg !924

if.end81:                                         ; preds = %if.then80, %if.end26
  store i64 48, i64* %_24_size, align 8, !dbg !927
  %call82 = call noalias i8* @malloc(i64 384) #5, !dbg !927
  %106 = bitcast i8* %call82 to i64*, !dbg !927
  store i64* %106, i64** %_24, align 8, !dbg !927
  %107 = load i64*, i64** %_24, align 8, !dbg !928
  %arrayidx83 = getelementptr inbounds i64, i64* %107, i64 0, !dbg !928
  store i64 84, i64* %arrayidx83, align 8, !dbg !929
  %108 = load i64*, i64** %_24, align 8, !dbg !930
  %arrayidx84 = getelementptr inbounds i64, i64* %108, i64 1, !dbg !930
  store i64 104, i64* %arrayidx84, align 8, !dbg !931
  %109 = load i64*, i64** %_24, align 8, !dbg !932
  %arrayidx85 = getelementptr inbounds i64, i64* %109, i64 2, !dbg !932
  store i64 101, i64* %arrayidx85, align 8, !dbg !933
  %110 = load i64*, i64** %_24, align 8, !dbg !934
  %arrayidx86 = getelementptr inbounds i64, i64* %110, i64 3, !dbg !934
  store i64 32, i64* %arrayidx86, align 8, !dbg !935
  %111 = load i64*, i64** %_24, align 8, !dbg !936
  %arrayidx87 = getelementptr inbounds i64, i64* %111, i64 4, !dbg !936
  store i64 116, i64* %arrayidx87, align 8, !dbg !937
  %112 = load i64*, i64** %_24, align 8, !dbg !938
  %arrayidx88 = getelementptr inbounds i64, i64* %112, i64 5, !dbg !938
  store i64 111, i64* %arrayidx88, align 8, !dbg !939
  %113 = load i64*, i64** %_24, align 8, !dbg !940
  %arrayidx89 = getelementptr inbounds i64, i64* %113, i64 6, !dbg !940
  store i64 116, i64* %arrayidx89, align 8, !dbg !941
  %114 = load i64*, i64** %_24, align 8, !dbg !942
  %arrayidx90 = getelementptr inbounds i64, i64* %114, i64 7, !dbg !942
  store i64 97, i64* %arrayidx90, align 8, !dbg !943
  %115 = load i64*, i64** %_24, align 8, !dbg !944
  %arrayidx91 = getelementptr inbounds i64, i64* %115, i64 8, !dbg !944
  store i64 108, i64* %arrayidx91, align 8, !dbg !945
  %116 = load i64*, i64** %_24, align 8, !dbg !946
  %arrayidx92 = getelementptr inbounds i64, i64* %116, i64 9, !dbg !946
  store i64 32, i64* %arrayidx92, align 8, !dbg !947
  %117 = load i64*, i64** %_24, align 8, !dbg !948
  %arrayidx93 = getelementptr inbounds i64, i64* %117, i64 10, !dbg !948
  store i64 97, i64* %arrayidx93, align 8, !dbg !949
  %118 = load i64*, i64** %_24, align 8, !dbg !950
  %arrayidx94 = getelementptr inbounds i64, i64* %118, i64 11, !dbg !950
  store i64 109, i64* %arrayidx94, align 8, !dbg !951
  %119 = load i64*, i64** %_24, align 8, !dbg !952
  %arrayidx95 = getelementptr inbounds i64, i64* %119, i64 12, !dbg !952
  store i64 111, i64* %arrayidx95, align 8, !dbg !953
  %120 = load i64*, i64** %_24, align 8, !dbg !954
  %arrayidx96 = getelementptr inbounds i64, i64* %120, i64 13, !dbg !954
  store i64 117, i64* %arrayidx96, align 8, !dbg !955
  %121 = load i64*, i64** %_24, align 8, !dbg !956
  %arrayidx97 = getelementptr inbounds i64, i64* %121, i64 14, !dbg !956
  store i64 110, i64* %arrayidx97, align 8, !dbg !957
  %122 = load i64*, i64** %_24, align 8, !dbg !958
  %arrayidx98 = getelementptr inbounds i64, i64* %122, i64 15, !dbg !958
  store i64 116, i64* %arrayidx98, align 8, !dbg !959
  %123 = load i64*, i64** %_24, align 8, !dbg !960
  %arrayidx99 = getelementptr inbounds i64, i64* %123, i64 16, !dbg !960
  store i64 32, i64* %arrayidx99, align 8, !dbg !961
  %124 = load i64*, i64** %_24, align 8, !dbg !962
  %arrayidx100 = getelementptr inbounds i64, i64* %124, i64 17, !dbg !962
  store i64 111, i64* %arrayidx100, align 8, !dbg !963
  %125 = load i64*, i64** %_24, align 8, !dbg !964
  %arrayidx101 = getelementptr inbounds i64, i64* %125, i64 18, !dbg !964
  store i64 102, i64* %arrayidx101, align 8, !dbg !965
  %126 = load i64*, i64** %_24, align 8, !dbg !966
  %arrayidx102 = getelementptr inbounds i64, i64* %126, i64 19, !dbg !966
  store i64 32, i64* %arrayidx102, align 8, !dbg !967
  %127 = load i64*, i64** %_24, align 8, !dbg !968
  %arrayidx103 = getelementptr inbounds i64, i64* %127, i64 20, !dbg !968
  store i64 109, i64* %arrayidx103, align 8, !dbg !969
  %128 = load i64*, i64** %_24, align 8, !dbg !970
  %arrayidx104 = getelementptr inbounds i64, i64* %128, i64 21, !dbg !970
  store i64 111, i64* %arrayidx104, align 8, !dbg !971
  %129 = load i64*, i64** %_24, align 8, !dbg !972
  %arrayidx105 = getelementptr inbounds i64, i64* %129, i64 22, !dbg !972
  store i64 110, i64* %arrayidx105, align 8, !dbg !973
  %130 = load i64*, i64** %_24, align 8, !dbg !974
  %arrayidx106 = getelementptr inbounds i64, i64* %130, i64 23, !dbg !974
  store i64 101, i64* %arrayidx106, align 8, !dbg !975
  %131 = load i64*, i64** %_24, align 8, !dbg !976
  %arrayidx107 = getelementptr inbounds i64, i64* %131, i64 24, !dbg !976
  store i64 121, i64* %arrayidx107, align 8, !dbg !977
  %132 = load i64*, i64** %_24, align 8, !dbg !978
  %arrayidx108 = getelementptr inbounds i64, i64* %132, i64 25, !dbg !978
  store i64 32, i64* %arrayidx108, align 8, !dbg !979
  %133 = load i64*, i64** %_24, align 8, !dbg !980
  %arrayidx109 = getelementptr inbounds i64, i64* %133, i64 26, !dbg !980
  store i64 40, i64* %arrayidx109, align 8, !dbg !981
  %134 = load i64*, i64** %_24, align 8, !dbg !982
  %arrayidx110 = getelementptr inbounds i64, i64* %134, i64 27, !dbg !982
  store i64 109, i64* %arrayidx110, align 8, !dbg !983
  %135 = load i64*, i64** %_24, align 8, !dbg !984
  %arrayidx111 = getelementptr inbounds i64, i64* %135, i64 28, !dbg !984
  store i64 97, i64* %arrayidx111, align 8, !dbg !985
  %136 = load i64*, i64** %_24, align 8, !dbg !986
  %arrayidx112 = getelementptr inbounds i64, i64* %136, i64 29, !dbg !986
  store i64 120, i64* %arrayidx112, align 8, !dbg !987
  %137 = load i64*, i64** %_24, align 8, !dbg !988
  %arrayidx113 = getelementptr inbounds i64, i64* %137, i64 30, !dbg !988
  store i64 105, i64* %arrayidx113, align 8, !dbg !989
  %138 = load i64*, i64** %_24, align 8, !dbg !990
  %arrayidx114 = getelementptr inbounds i64, i64* %138, i64 31, !dbg !990
  store i64 109, i64* %arrayidx114, align 8, !dbg !991
  %139 = load i64*, i64** %_24, align 8, !dbg !992
  %arrayidx115 = getelementptr inbounds i64, i64* %139, i64 32, !dbg !992
  store i64 117, i64* %arrayidx115, align 8, !dbg !993
  %140 = load i64*, i64** %_24, align 8, !dbg !994
  %arrayidx116 = getelementptr inbounds i64, i64* %140, i64 33, !dbg !994
  store i64 109, i64* %arrayidx116, align 8, !dbg !995
  %141 = load i64*, i64** %_24, align 8, !dbg !996
  %arrayidx117 = getelementptr inbounds i64, i64* %141, i64 34, !dbg !996
  store i64 41, i64* %arrayidx117, align 8, !dbg !997
  %142 = load i64*, i64** %_24, align 8, !dbg !998
  %arrayidx118 = getelementptr inbounds i64, i64* %142, i64 35, !dbg !998
  store i64 32, i64* %arrayidx118, align 8, !dbg !999
  %143 = load i64*, i64** %_24, align 8, !dbg !1000
  %arrayidx119 = getelementptr inbounds i64, i64* %143, i64 36, !dbg !1000
  store i64 66, i64* %arrayidx119, align 8, !dbg !1001
  %144 = load i64*, i64** %_24, align 8, !dbg !1002
  %arrayidx120 = getelementptr inbounds i64, i64* %144, i64 37, !dbg !1002
  store i64 111, i64* %arrayidx120, align 8, !dbg !1003
  %145 = load i64*, i64** %_24, align 8, !dbg !1004
  %arrayidx121 = getelementptr inbounds i64, i64* %145, i64 38, !dbg !1004
  store i64 98, i64* %arrayidx121, align 8, !dbg !1005
  %146 = load i64*, i64** %_24, align 8, !dbg !1006
  %arrayidx122 = getelementptr inbounds i64, i64* %146, i64 39, !dbg !1006
  store i64 32, i64* %arrayidx122, align 8, !dbg !1007
  %147 = load i64*, i64** %_24, align 8, !dbg !1008
  %arrayidx123 = getelementptr inbounds i64, i64* %147, i64 40, !dbg !1008
  store i64 103, i64* %arrayidx123, align 8, !dbg !1009
  %148 = load i64*, i64** %_24, align 8, !dbg !1010
  %arrayidx124 = getelementptr inbounds i64, i64* %148, i64 41, !dbg !1010
  store i64 101, i64* %arrayidx124, align 8, !dbg !1011
  %149 = load i64*, i64** %_24, align 8, !dbg !1012
  %arrayidx125 = getelementptr inbounds i64, i64* %149, i64 42, !dbg !1012
  store i64 116, i64* %arrayidx125, align 8, !dbg !1013
  %150 = load i64*, i64** %_24, align 8, !dbg !1014
  %arrayidx126 = getelementptr inbounds i64, i64* %150, i64 43, !dbg !1014
  store i64 115, i64* %arrayidx126, align 8, !dbg !1015
  %151 = load i64*, i64** %_24, align 8, !dbg !1016
  %arrayidx127 = getelementptr inbounds i64, i64* %151, i64 44, !dbg !1016
  store i64 32, i64* %arrayidx127, align 8, !dbg !1017
  %152 = load i64*, i64** %_24, align 8, !dbg !1018
  %arrayidx128 = getelementptr inbounds i64, i64* %152, i64 45, !dbg !1018
  store i64 105, i64* %arrayidx128, align 8, !dbg !1019
  %153 = load i64*, i64** %_24, align 8, !dbg !1020
  %arrayidx129 = getelementptr inbounds i64, i64* %153, i64 46, !dbg !1020
  store i64 115, i64* %arrayidx129, align 8, !dbg !1021
  %154 = load i64*, i64** %_24, align 8, !dbg !1022
  %arrayidx130 = getelementptr inbounds i64, i64* %154, i64 47, !dbg !1022
  store i64 32, i64* %arrayidx130, align 8, !dbg !1023
  store i8 1, i8* %_24_has_ownership, align 1, !dbg !1024
  %155 = load i64*, i64** %_24, align 8, !dbg !1025
  %156 = load i64, i64* %_24_size, align 8, !dbg !1025
  call void @printf_s(i64* %155, i64 %156), !dbg !1026
  %157 = load i64, i64* %sum_bob, align 8, !dbg !1027
  %call131 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.1, i32 0, i32 0), i64 %157), !dbg !1028
  br label %blklab15, !dbg !1028

blklab15:                                         ; preds = %if.end81, %if.then
  %158 = load i8, i8* %coins_has_ownership, align 1, !dbg !1029
  %tobool132 = trunc i8 %158 to i1, !dbg !1029
  br i1 %tobool132, label %if.then133, label %if.end134, !dbg !1031

if.then133:                                       ; preds = %blklab15
  %159 = load i64*, i64** %coins, align 8, !dbg !1032
  %160 = bitcast i64* %159 to i8*, !dbg !1032
  call void @free(i8* %160) #5, !dbg !1032
  store i8 0, i8* %coins_has_ownership, align 1, !dbg !1032
  br label %if.end134, !dbg !1032

if.end134:                                        ; preds = %if.then133, %blklab15
  %161 = load i8, i8* %moves_has_ownership, align 1, !dbg !1035
  %tobool135 = trunc i8 %161 to i1, !dbg !1035
  br i1 %tobool135, label %if.then136, label %if.end137, !dbg !1037

if.then136:                                       ; preds = %if.end134
  %162 = load i64*, i64** %moves, align 8, !dbg !1038
  %163 = bitcast i64* %162 to i8*, !dbg !1038
  call void @free(i8* %163) #5, !dbg !1038
  store i8 0, i8* %moves_has_ownership, align 1, !dbg !1038
  br label %if.end137, !dbg !1038

if.end137:                                        ; preds = %if.then136, %if.end134
  %164 = load i8, i8* %_8_has_ownership, align 1, !dbg !1041
  %tobool138 = trunc i8 %164 to i1, !dbg !1041
  br i1 %tobool138, label %if.then139, label %if.end140, !dbg !1043

if.then139:                                       ; preds = %if.end137
  %165 = load i64**, i64*** %_8, align 8, !dbg !1044
  %166 = load i64, i64* %_8_size, align 8, !dbg !1044
  call void @free2DArray(i64** %165, i64 %166), !dbg !1044
  store i8 0, i8* %_8_has_ownership, align 1, !dbg !1044
  br label %if.end140, !dbg !1044

if.end140:                                        ; preds = %if.then139, %if.end137
  %167 = load i8, i8* %_10_has_ownership, align 1, !dbg !1047
  %tobool141 = trunc i8 %167 to i1, !dbg !1047
  br i1 %tobool141, label %if.then142, label %if.end143, !dbg !1049

if.then142:                                       ; preds = %if.end140
  %168 = load i64*, i64** %_10, align 8, !dbg !1050
  %169 = bitcast i64* %168 to i8*, !dbg !1050
  call void @free(i8* %169) #5, !dbg !1050
  store i8 0, i8* %_10_has_ownership, align 1, !dbg !1050
  br label %if.end143, !dbg !1050

if.end143:                                        ; preds = %if.then142, %if.end140
  %170 = load i8, i8* %_11_has_ownership, align 1, !dbg !1053
  %tobool144 = trunc i8 %170 to i1, !dbg !1053
  br i1 %tobool144, label %if.then145, label %if.end146, !dbg !1055

if.then145:                                       ; preds = %if.end143
  %171 = load i64*, i64** %_11, align 8, !dbg !1056
  %172 = bitcast i64* %171 to i8*, !dbg !1056
  call void @free(i8* %172) #5, !dbg !1056
  store i8 0, i8* %_11_has_ownership, align 1, !dbg !1056
  br label %if.end146, !dbg !1056

if.end146:                                        ; preds = %if.then145, %if.end143
  %173 = load i8, i8* %_12_has_ownership, align 1, !dbg !1059
  %tobool147 = trunc i8 %173 to i1, !dbg !1059
  br i1 %tobool147, label %if.then148, label %if.end149, !dbg !1061

if.then148:                                       ; preds = %if.end146
  %174 = load i64*, i64** %_12, align 8, !dbg !1062
  %175 = bitcast i64* %174 to i8*, !dbg !1062
  call void @free(i8* %175) #5, !dbg !1062
  store i8 0, i8* %_12_has_ownership, align 1, !dbg !1062
  br label %if.end149, !dbg !1062

if.end149:                                        ; preds = %if.then148, %if.end146
  %176 = load i8, i8* %_19_has_ownership, align 1, !dbg !1065
  %tobool150 = trunc i8 %176 to i1, !dbg !1065
  br i1 %tobool150, label %if.then151, label %if.end152, !dbg !1067

if.then151:                                       ; preds = %if.end149
  %177 = load i64*, i64** %_19, align 8, !dbg !1068
  %178 = bitcast i64* %177 to i8*, !dbg !1068
  call void @free(i8* %178) #5, !dbg !1068
  store i8 0, i8* %_19_has_ownership, align 1, !dbg !1068
  br label %if.end152, !dbg !1068

if.end152:                                        ; preds = %if.then151, %if.end149
  %179 = load i8, i8* %_24_has_ownership, align 1, !dbg !1071
  %tobool153 = trunc i8 %179 to i1, !dbg !1071
  br i1 %tobool153, label %if.then154, label %if.end155, !dbg !1073

if.then154:                                       ; preds = %if.end152
  %180 = load i64*, i64** %_24, align 8, !dbg !1074
  %181 = bitcast i64* %180 to i8*, !dbg !1074
  call void @free(i8* %181) #5, !dbg !1074
  store i8 0, i8* %_24_has_ownership, align 1, !dbg !1074
  br label %if.end155, !dbg !1074

if.end155:                                        ; preds = %if.then154, %if.end152
  call void @exit(i32 0) #6, !dbg !1077
  unreachable, !dbg !1077

return:                                           ; No predecessors!
  %182 = load i32, i32* %retval, align 4, !dbg !1078
  ret i32 %182, !dbg !1078
}

declare i64** @convertArgsToIntArray(i32, i8**) #3

declare i64* @parseStringToInt(i64*) #3

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) #3

; Function Attrs: noreturn nounwind
declare void @exit(i32) #4

; Function Attrs: nounwind
declare noalias i8* @malloc(i64) #2

declare void @printf_s(i64*, i64) #3

declare i32 @printf(i8*, ...) #3

declare void @free2DArray(i64**, i64) #3

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone }
attributes #2 = { nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { noreturn nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { nounwind }
attributes #6 = { noreturn nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!25, !26}
!llvm.ident = !{!27}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 3.9.0 (http://llvm.org/git/clang.git cf7bc8edf8cccb1b5de656c403cb55ad44132e98) (http://llvm.org/git/llvm.git 22706dc4c03305692f494d0e42a6de1050d0ec62)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, subprograms: !5)
!1 = !DIFile(filename: "CoinGame.c", directory: "/home/sam/workspace/WhileyOpenCL/polly/CoinGame/impl/autogenerate")
!2 = !{}
!3 = !{!4}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64, align: 64)
!5 = !{!6, !11, !15, !18}
!6 = distinct !DISubprogram(name: "init", scope: !1, file: !1, line: 2, type: !7, isLocal: false, isDefinition: true, scopeLine: 2, flags: DIFlagPrototyped, isOptimized: false, variables: !2)
!7 = !DISubroutineType(types: !8)
!8 = !{!9, !10}
!9 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !10, size: 64, align: 64)
!10 = !DIBasicType(name: "long long int", size: 64, align: 64, encoding: DW_ATE_signed)
!11 = distinct !DISubprogram(name: "getBobSum", scope: !1, file: !1, line: 59, type: !12, isLocal: false, isDefinition: true, scopeLine: 59, flags: DIFlagPrototyped, isOptimized: false, variables: !2)
!12 = !DISubroutineType(types: !13)
!13 = !{!10, !10, !9, !10, !14, !10}
!14 = !DIBasicType(name: "_Bool", size: 8, align: 8, encoding: DW_ATE_boolean)
!15 = distinct !DISubprogram(name: "findMoves", scope: !1, file: !1, line: 107, type: !16, isLocal: false, isDefinition: true, scopeLine: 107, flags: DIFlagPrototyped, isOptimized: false, variables: !2)
!16 = !DISubroutineType(types: !17)
!17 = !{!9, !9, !10, !14, !10}
!18 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 373, type: !19, isLocal: false, isDefinition: true, scopeLine: 373, flags: DIFlagPrototyped, isOptimized: false, variables: !2)
!19 = !DISubroutineType(types: !20)
!20 = !{!21, !21, !22}
!21 = !DIBasicType(name: "int", size: 32, align: 32, encoding: DW_ATE_signed)
!22 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !23, size: 64, align: 64)
!23 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !24, size: 64, align: 64)
!24 = !DIBasicType(name: "char", size: 8, align: 8, encoding: DW_ATE_signed_char)
!25 = !{i32 2, !"Dwarf Version", i32 4}
!26 = !{i32 2, !"Debug Info Version", i32 3}
!27 = !{!"clang version 3.9.0 (http://llvm.org/git/clang.git cf7bc8edf8cccb1b5de656c403cb55ad44132e98) (http://llvm.org/git/llvm.git 22706dc4c03305692f494d0e42a6de1050d0ec62)"}
!28 = !DILocalVariable(name: "n", arg: 1, scope: !6, file: !1, line: 2, type: !10)
!29 = !DIExpression()
!30 = !DILocation(line: 2, column: 27, scope: !6)
!31 = !DILocalVariable(name: "_1", scope: !6, file: !1, line: 3, type: !9)
!32 = !DILocation(line: 3, column: 2, scope: !6)
!33 = !DILocalVariable(name: "_1_size", scope: !6, file: !1, line: 3, type: !10)
!34 = !DILocalVariable(name: "_1_has_ownership", scope: !6, file: !1, line: 4, type: !14)
!35 = !DILocation(line: 4, column: 2, scope: !6)
!36 = !DILocalVariable(name: "coins", scope: !6, file: !1, line: 5, type: !9)
!37 = !DILocation(line: 5, column: 2, scope: !6)
!38 = !DILocalVariable(name: "coins_size", scope: !6, file: !1, line: 5, type: !10)
!39 = !DILocalVariable(name: "coins_has_ownership", scope: !6, file: !1, line: 6, type: !14)
!40 = !DILocation(line: 6, column: 2, scope: !6)
!41 = !DILocalVariable(name: "i", scope: !6, file: !1, line: 7, type: !10)
!42 = !DILocation(line: 7, column: 12, scope: !6)
!43 = !DILocalVariable(name: "_4", scope: !6, file: !1, line: 8, type: !10)
!44 = !DILocation(line: 8, column: 12, scope: !6)
!45 = !DILocalVariable(name: "_5", scope: !6, file: !1, line: 9, type: !9)
!46 = !DILocation(line: 9, column: 2, scope: !6)
!47 = !DILocalVariable(name: "_5_size", scope: !6, file: !1, line: 9, type: !10)
!48 = !DILocalVariable(name: "_5_has_ownership", scope: !6, file: !1, line: 10, type: !14)
!49 = !DILocation(line: 10, column: 2, scope: !6)
!50 = !DILocalVariable(name: "_6", scope: !6, file: !1, line: 11, type: !10)
!51 = !DILocation(line: 11, column: 12, scope: !6)
!52 = !DILocalVariable(name: "_7", scope: !6, file: !1, line: 12, type: !10)
!53 = !DILocation(line: 12, column: 12, scope: !6)
!54 = !DILocalVariable(name: "_8", scope: !6, file: !1, line: 13, type: !10)
!55 = !DILocation(line: 13, column: 12, scope: !6)
!56 = !DILocalVariable(name: "_9", scope: !6, file: !1, line: 14, type: !10)
!57 = !DILocation(line: 14, column: 12, scope: !6)
!58 = !DILocalVariable(name: "_10", scope: !6, file: !1, line: 15, type: !10)
!59 = !DILocation(line: 15, column: 12, scope: !6)
!60 = !DILocation(line: 17, column: 5, scope: !6)
!61 = !DILocation(line: 19, column: 2, scope: !62)
!62 = distinct !DILexicalBlock(scope: !6, file: !1, line: 19, column: 2)
!63 = !DILocation(line: 19, column: 2, scope: !6)
!64 = !DILocation(line: 19, column: 2, scope: !65)
!65 = !DILexicalBlockFile(scope: !66, file: !1, discriminator: 1)
!66 = distinct !DILexicalBlock(scope: !62, file: !1, line: 19, column: 2)
!67 = !DILocation(line: 20, column: 2, scope: !6)
!68 = !DILocation(line: 21, column: 2, scope: !6)
!69 = !DILocation(line: 23, column: 2, scope: !70)
!70 = distinct !DILexicalBlock(scope: !6, file: !1, line: 23, column: 2)
!71 = !DILocation(line: 23, column: 2, scope: !6)
!72 = !DILocation(line: 23, column: 2, scope: !73)
!73 = !DILexicalBlockFile(scope: !74, file: !1, discriminator: 1)
!74 = distinct !DILexicalBlock(scope: !70, file: !1, line: 23, column: 2)
!75 = !DILocation(line: 24, column: 2, scope: !6)
!76 = !DILocation(line: 25, column: 2, scope: !6)
!77 = !DILocation(line: 26, column: 2, scope: !6)
!78 = !DILocation(line: 28, column: 5, scope: !6)
!79 = !DILocation(line: 30, column: 6, scope: !6)
!80 = !DILocation(line: 30, column: 4, scope: !6)
!81 = !DILocation(line: 32, column: 2, scope: !6)
!82 = !DILocation(line: 34, column: 6, scope: !83)
!83 = distinct !DILexicalBlock(scope: !84, file: !1, line: 34, column: 6)
!84 = distinct !DILexicalBlock(scope: !6, file: !1, line: 32, column: 13)
!85 = !DILocation(line: 34, column: 9, scope: !83)
!86 = !DILocation(line: 34, column: 7, scope: !83)
!87 = !DILocation(line: 34, column: 6, scope: !84)
!88 = !DILocation(line: 34, column: 12, scope: !89)
!89 = !DILexicalBlockFile(scope: !90, file: !1, discriminator: 1)
!90 = distinct !DILexicalBlock(scope: !83, file: !1, line: 34, column: 11)
!91 = !DILocation(line: 36, column: 12, scope: !84)
!92 = !DILocation(line: 36, column: 6, scope: !84)
!93 = !DILocation(line: 36, column: 5, scope: !84)
!94 = !DILocation(line: 38, column: 6, scope: !84)
!95 = !DILocation(line: 38, column: 9, scope: !84)
!96 = !DILocation(line: 38, column: 8, scope: !84)
!97 = !DILocation(line: 38, column: 5, scope: !84)
!98 = !DILocation(line: 40, column: 14, scope: !84)
!99 = !DILocation(line: 40, column: 9, scope: !84)
!100 = !DILocation(line: 40, column: 3, scope: !84)
!101 = !DILocation(line: 40, column: 12, scope: !84)
!102 = !DILocation(line: 42, column: 6, scope: !84)
!103 = !DILocation(line: 44, column: 7, scope: !84)
!104 = !DILocation(line: 44, column: 9, scope: !84)
!105 = !DILocation(line: 44, column: 8, scope: !84)
!106 = !DILocation(line: 44, column: 6, scope: !84)
!107 = !DILocation(line: 46, column: 7, scope: !84)
!108 = !DILocation(line: 46, column: 5, scope: !84)
!109 = !DILocation(line: 46, column: 3, scope: !84)
!110 = !DILocation(line: 32, column: 2, scope: !111)
!111 = !DILexicalBlockFile(scope: !6, file: !1, discriminator: 1)
!112 = !DILocation(line: 53, column: 2, scope: !113)
!113 = distinct !DILexicalBlock(scope: !6, file: !1, line: 53, column: 2)
!114 = !DILocation(line: 53, column: 2, scope: !6)
!115 = !DILocation(line: 53, column: 2, scope: !116)
!116 = !DILexicalBlockFile(scope: !117, file: !1, discriminator: 1)
!117 = distinct !DILexicalBlock(scope: !113, file: !1, line: 53, column: 2)
!118 = !DILocation(line: 54, column: 2, scope: !119)
!119 = distinct !DILexicalBlock(scope: !6, file: !1, line: 54, column: 2)
!120 = !DILocation(line: 54, column: 2, scope: !6)
!121 = !DILocation(line: 54, column: 2, scope: !122)
!122 = !DILexicalBlockFile(scope: !123, file: !1, discriminator: 1)
!123 = distinct !DILexicalBlock(scope: !119, file: !1, line: 54, column: 2)
!124 = !DILocation(line: 55, column: 9, scope: !6)
!125 = !DILocation(line: 55, column: 2, scope: !6)
!126 = !DILocalVariable(name: "sum_alice", arg: 1, scope: !11, file: !1, line: 59, type: !10)
!127 = !DILocation(line: 59, column: 31, scope: !11)
!128 = !DILocalVariable(name: "coins", arg: 2, scope: !11, file: !1, line: 59, type: !9)
!129 = !DILocation(line: 59, column: 42, scope: !11)
!130 = !DILocalVariable(name: "coins_size", arg: 3, scope: !11, file: !1, line: 59, type: !10)
!131 = !DILocalVariable(name: "coins_has_ownership", arg: 4, scope: !11, file: !1, line: 59, type: !14)
!132 = !DILocation(line: 59, column: 70, scope: !11)
!133 = !DILocalVariable(name: "n", arg: 5, scope: !11, file: !1, line: 59, type: !10)
!134 = !DILocation(line: 59, column: 110, scope: !11)
!135 = !DILocalVariable(name: "_3", scope: !11, file: !1, line: 60, type: !10)
!136 = !DILocation(line: 60, column: 12, scope: !11)
!137 = !DILocalVariable(name: "i", scope: !11, file: !1, line: 61, type: !10)
!138 = !DILocation(line: 61, column: 12, scope: !11)
!139 = !DILocalVariable(name: "sum", scope: !11, file: !1, line: 62, type: !10)
!140 = !DILocation(line: 62, column: 12, scope: !11)
!141 = !DILocalVariable(name: "_6", scope: !11, file: !1, line: 63, type: !10)
!142 = !DILocation(line: 63, column: 12, scope: !11)
!143 = !DILocalVariable(name: "_7", scope: !11, file: !1, line: 64, type: !10)
!144 = !DILocation(line: 64, column: 12, scope: !11)
!145 = !DILocalVariable(name: "_8", scope: !11, file: !1, line: 65, type: !10)
!146 = !DILocation(line: 65, column: 12, scope: !11)
!147 = !DILocalVariable(name: "_9", scope: !11, file: !1, line: 66, type: !10)
!148 = !DILocation(line: 66, column: 12, scope: !11)
!149 = !DILocalVariable(name: "_10", scope: !11, file: !1, line: 67, type: !10)
!150 = !DILocation(line: 67, column: 12, scope: !11)
!151 = !DILocalVariable(name: "_11", scope: !11, file: !1, line: 68, type: !10)
!152 = !DILocation(line: 68, column: 12, scope: !11)
!153 = !DILocalVariable(name: "_12", scope: !11, file: !1, line: 69, type: !10)
!154 = !DILocation(line: 69, column: 12, scope: !11)
!155 = !DILocation(line: 71, column: 5, scope: !11)
!156 = !DILocation(line: 73, column: 6, scope: !11)
!157 = !DILocation(line: 73, column: 4, scope: !11)
!158 = !DILocation(line: 75, column: 5, scope: !11)
!159 = !DILocation(line: 77, column: 8, scope: !11)
!160 = !DILocation(line: 77, column: 6, scope: !11)
!161 = !DILocation(line: 79, column: 2, scope: !11)
!162 = !DILocation(line: 81, column: 6, scope: !163)
!163 = distinct !DILexicalBlock(scope: !164, file: !1, line: 81, column: 6)
!164 = distinct !DILexicalBlock(scope: !11, file: !1, line: 79, column: 13)
!165 = !DILocation(line: 81, column: 9, scope: !163)
!166 = !DILocation(line: 81, column: 7, scope: !163)
!167 = !DILocation(line: 81, column: 6, scope: !164)
!168 = !DILocation(line: 81, column: 12, scope: !169)
!169 = !DILexicalBlockFile(scope: !170, file: !1, discriminator: 1)
!170 = distinct !DILexicalBlock(scope: !163, file: !1, line: 81, column: 11)
!171 = !DILocation(line: 83, column: 12, scope: !164)
!172 = !DILocation(line: 83, column: 6, scope: !164)
!173 = !DILocation(line: 83, column: 5, scope: !164)
!174 = !DILocation(line: 85, column: 6, scope: !164)
!175 = !DILocation(line: 85, column: 10, scope: !164)
!176 = !DILocation(line: 85, column: 9, scope: !164)
!177 = !DILocation(line: 85, column: 5, scope: !164)
!178 = !DILocation(line: 87, column: 9, scope: !164)
!179 = !DILocation(line: 87, column: 7, scope: !164)
!180 = !DILocation(line: 89, column: 7, scope: !164)
!181 = !DILocation(line: 91, column: 7, scope: !164)
!182 = !DILocation(line: 91, column: 9, scope: !164)
!183 = !DILocation(line: 91, column: 8, scope: !164)
!184 = !DILocation(line: 91, column: 6, scope: !164)
!185 = !DILocation(line: 93, column: 7, scope: !164)
!186 = !DILocation(line: 93, column: 5, scope: !164)
!187 = !DILocation(line: 93, column: 3, scope: !164)
!188 = !DILocation(line: 79, column: 2, scope: !189)
!189 = !DILexicalBlockFile(scope: !11, file: !1, discriminator: 1)
!190 = !DILocation(line: 100, column: 6, scope: !11)
!191 = !DILocation(line: 100, column: 10, scope: !11)
!192 = !DILocation(line: 100, column: 9, scope: !11)
!193 = !DILocation(line: 100, column: 5, scope: !11)
!194 = !DILocation(line: 102, column: 2, scope: !195)
!195 = distinct !DILexicalBlock(scope: !11, file: !1, line: 102, column: 2)
!196 = !DILocation(line: 102, column: 2, scope: !11)
!197 = !DILocation(line: 102, column: 2, scope: !198)
!198 = !DILexicalBlockFile(scope: !199, file: !1, discriminator: 1)
!199 = distinct !DILexicalBlock(scope: !195, file: !1, line: 102, column: 2)
!200 = !DILocation(line: 103, column: 9, scope: !11)
!201 = !DILocation(line: 103, column: 2, scope: !11)
!202 = !DILocalVariable(name: "coins", arg: 1, scope: !15, file: !1, line: 107, type: !9)
!203 = !DILocation(line: 107, column: 22, scope: !15)
!204 = !DILocalVariable(name: "coins_size", arg: 2, scope: !15, file: !1, line: 107, type: !10)
!205 = !DILocalVariable(name: "coins_has_ownership", arg: 3, scope: !15, file: !1, line: 107, type: !14)
!206 = !DILocation(line: 107, column: 50, scope: !15)
!207 = !DILocalVariable(name: "n", arg: 4, scope: !15, file: !1, line: 107, type: !10)
!208 = !DILocation(line: 107, column: 90, scope: !15)
!209 = !DILocalVariable(name: "_2", scope: !15, file: !1, line: 108, type: !9)
!210 = !DILocation(line: 108, column: 2, scope: !15)
!211 = !DILocalVariable(name: "_2_size", scope: !15, file: !1, line: 108, type: !10)
!212 = !DILocalVariable(name: "_2_has_ownership", scope: !15, file: !1, line: 109, type: !14)
!213 = !DILocation(line: 109, column: 2, scope: !15)
!214 = !DILocalVariable(name: "moves", scope: !15, file: !1, line: 110, type: !9)
!215 = !DILocation(line: 110, column: 2, scope: !15)
!216 = !DILocalVariable(name: "moves_size", scope: !15, file: !1, line: 110, type: !10)
!217 = !DILocalVariable(name: "moves_has_ownership", scope: !15, file: !1, line: 111, type: !14)
!218 = !DILocation(line: 111, column: 2, scope: !15)
!219 = !DILocalVariable(name: "s", scope: !15, file: !1, line: 112, type: !10)
!220 = !DILocation(line: 112, column: 12, scope: !15)
!221 = !DILocalVariable(name: "j", scope: !15, file: !1, line: 113, type: !10)
!222 = !DILocation(line: 113, column: 12, scope: !15)
!223 = !DILocalVariable(name: "i", scope: !15, file: !1, line: 114, type: !10)
!224 = !DILocation(line: 114, column: 12, scope: !15)
!225 = !DILocalVariable(name: "y", scope: !15, file: !1, line: 115, type: !10)
!226 = !DILocation(line: 115, column: 12, scope: !15)
!227 = !DILocalVariable(name: "x", scope: !15, file: !1, line: 116, type: !10)
!228 = !DILocation(line: 116, column: 12, scope: !15)
!229 = !DILocalVariable(name: "z", scope: !15, file: !1, line: 117, type: !10)
!230 = !DILocation(line: 117, column: 12, scope: !15)
!231 = !DILocalVariable(name: "_10", scope: !15, file: !1, line: 118, type: !10)
!232 = !DILocation(line: 118, column: 12, scope: !15)
!233 = !DILocalVariable(name: "_11", scope: !15, file: !1, line: 119, type: !10)
!234 = !DILocation(line: 119, column: 12, scope: !15)
!235 = !DILocalVariable(name: "_12", scope: !15, file: !1, line: 120, type: !9)
!236 = !DILocation(line: 120, column: 2, scope: !15)
!237 = !DILocalVariable(name: "_12_size", scope: !15, file: !1, line: 120, type: !10)
!238 = !DILocalVariable(name: "_12_has_ownership", scope: !15, file: !1, line: 121, type: !14)
!239 = !DILocation(line: 121, column: 2, scope: !15)
!240 = !DILocalVariable(name: "_13", scope: !15, file: !1, line: 122, type: !10)
!241 = !DILocation(line: 122, column: 12, scope: !15)
!242 = !DILocalVariable(name: "_14", scope: !15, file: !1, line: 123, type: !10)
!243 = !DILocation(line: 123, column: 12, scope: !15)
!244 = !DILocalVariable(name: "_15", scope: !15, file: !1, line: 124, type: !10)
!245 = !DILocation(line: 124, column: 12, scope: !15)
!246 = !DILocalVariable(name: "_16", scope: !15, file: !1, line: 125, type: !10)
!247 = !DILocation(line: 125, column: 12, scope: !15)
!248 = !DILocalVariable(name: "_17", scope: !15, file: !1, line: 126, type: !10)
!249 = !DILocation(line: 126, column: 12, scope: !15)
!250 = !DILocalVariable(name: "_18", scope: !15, file: !1, line: 127, type: !10)
!251 = !DILocation(line: 127, column: 12, scope: !15)
!252 = !DILocalVariable(name: "_19", scope: !15, file: !1, line: 128, type: !10)
!253 = !DILocation(line: 128, column: 12, scope: !15)
!254 = !DILocalVariable(name: "_20", scope: !15, file: !1, line: 129, type: !10)
!255 = !DILocation(line: 129, column: 12, scope: !15)
!256 = !DILocalVariable(name: "_21", scope: !15, file: !1, line: 130, type: !10)
!257 = !DILocation(line: 130, column: 12, scope: !15)
!258 = !DILocalVariable(name: "_22", scope: !15, file: !1, line: 131, type: !10)
!259 = !DILocation(line: 131, column: 12, scope: !15)
!260 = !DILocalVariable(name: "_23", scope: !15, file: !1, line: 132, type: !10)
!261 = !DILocation(line: 132, column: 12, scope: !15)
!262 = !DILocalVariable(name: "_24", scope: !15, file: !1, line: 133, type: !10)
!263 = !DILocation(line: 133, column: 12, scope: !15)
!264 = !DILocalVariable(name: "_25", scope: !15, file: !1, line: 134, type: !10)
!265 = !DILocation(line: 134, column: 12, scope: !15)
!266 = !DILocalVariable(name: "_26", scope: !15, file: !1, line: 135, type: !10)
!267 = !DILocation(line: 135, column: 12, scope: !15)
!268 = !DILocalVariable(name: "_27", scope: !15, file: !1, line: 136, type: !10)
!269 = !DILocation(line: 136, column: 12, scope: !15)
!270 = !DILocalVariable(name: "_28", scope: !15, file: !1, line: 137, type: !10)
!271 = !DILocation(line: 137, column: 12, scope: !15)
!272 = !DILocalVariable(name: "_29", scope: !15, file: !1, line: 138, type: !10)
!273 = !DILocation(line: 138, column: 12, scope: !15)
!274 = !DILocalVariable(name: "_30", scope: !15, file: !1, line: 139, type: !10)
!275 = !DILocation(line: 139, column: 12, scope: !15)
!276 = !DILocalVariable(name: "_31", scope: !15, file: !1, line: 140, type: !10)
!277 = !DILocation(line: 140, column: 12, scope: !15)
!278 = !DILocalVariable(name: "_32", scope: !15, file: !1, line: 141, type: !10)
!279 = !DILocation(line: 141, column: 12, scope: !15)
!280 = !DILocalVariable(name: "_33", scope: !15, file: !1, line: 142, type: !10)
!281 = !DILocation(line: 142, column: 12, scope: !15)
!282 = !DILocalVariable(name: "_34", scope: !15, file: !1, line: 143, type: !10)
!283 = !DILocation(line: 143, column: 12, scope: !15)
!284 = !DILocalVariable(name: "_35", scope: !15, file: !1, line: 144, type: !10)
!285 = !DILocation(line: 144, column: 12, scope: !15)
!286 = !DILocalVariable(name: "_36", scope: !15, file: !1, line: 145, type: !10)
!287 = !DILocation(line: 145, column: 12, scope: !15)
!288 = !DILocalVariable(name: "_37", scope: !15, file: !1, line: 146, type: !10)
!289 = !DILocation(line: 146, column: 12, scope: !15)
!290 = !DILocalVariable(name: "_38", scope: !15, file: !1, line: 147, type: !10)
!291 = !DILocation(line: 147, column: 12, scope: !15)
!292 = !DILocalVariable(name: "_39", scope: !15, file: !1, line: 148, type: !10)
!293 = !DILocation(line: 148, column: 12, scope: !15)
!294 = !DILocalVariable(name: "_40", scope: !15, file: !1, line: 149, type: !10)
!295 = !DILocation(line: 149, column: 12, scope: !15)
!296 = !DILocalVariable(name: "_41", scope: !15, file: !1, line: 150, type: !10)
!297 = !DILocation(line: 150, column: 12, scope: !15)
!298 = !DILocalVariable(name: "_42", scope: !15, file: !1, line: 151, type: !10)
!299 = !DILocation(line: 151, column: 12, scope: !15)
!300 = !DILocalVariable(name: "_43", scope: !15, file: !1, line: 152, type: !10)
!301 = !DILocation(line: 152, column: 12, scope: !15)
!302 = !DILocalVariable(name: "_44", scope: !15, file: !1, line: 153, type: !10)
!303 = !DILocation(line: 153, column: 12, scope: !15)
!304 = !DILocalVariable(name: "_45", scope: !15, file: !1, line: 154, type: !10)
!305 = !DILocation(line: 154, column: 12, scope: !15)
!306 = !DILocalVariable(name: "_46", scope: !15, file: !1, line: 155, type: !10)
!307 = !DILocation(line: 155, column: 12, scope: !15)
!308 = !DILocalVariable(name: "_47", scope: !15, file: !1, line: 156, type: !10)
!309 = !DILocation(line: 156, column: 12, scope: !15)
!310 = !DILocalVariable(name: "_48", scope: !15, file: !1, line: 157, type: !10)
!311 = !DILocation(line: 157, column: 12, scope: !15)
!312 = !DILocalVariable(name: "_49", scope: !15, file: !1, line: 158, type: !10)
!313 = !DILocation(line: 158, column: 12, scope: !15)
!314 = !DILocalVariable(name: "_50", scope: !15, file: !1, line: 159, type: !10)
!315 = !DILocation(line: 159, column: 12, scope: !15)
!316 = !DILocalVariable(name: "_51", scope: !15, file: !1, line: 160, type: !10)
!317 = !DILocation(line: 160, column: 12, scope: !15)
!318 = !DILocalVariable(name: "_52", scope: !15, file: !1, line: 161, type: !10)
!319 = !DILocation(line: 161, column: 12, scope: !15)
!320 = !DILocalVariable(name: "_53", scope: !15, file: !1, line: 162, type: !10)
!321 = !DILocation(line: 162, column: 12, scope: !15)
!322 = !DILocalVariable(name: "_54", scope: !15, file: !1, line: 163, type: !10)
!323 = !DILocation(line: 163, column: 12, scope: !15)
!324 = !DILocalVariable(name: "_55", scope: !15, file: !1, line: 164, type: !10)
!325 = !DILocation(line: 164, column: 12, scope: !15)
!326 = !DILocalVariable(name: "_56", scope: !15, file: !1, line: 165, type: !10)
!327 = !DILocation(line: 165, column: 12, scope: !15)
!328 = !DILocalVariable(name: "_57", scope: !15, file: !1, line: 166, type: !10)
!329 = !DILocation(line: 166, column: 12, scope: !15)
!330 = !DILocalVariable(name: "_58", scope: !15, file: !1, line: 167, type: !10)
!331 = !DILocation(line: 167, column: 12, scope: !15)
!332 = !DILocalVariable(name: "_59", scope: !15, file: !1, line: 168, type: !10)
!333 = !DILocation(line: 168, column: 12, scope: !15)
!334 = !DILocalVariable(name: "_60", scope: !15, file: !1, line: 169, type: !10)
!335 = !DILocation(line: 169, column: 12, scope: !15)
!336 = !DILocalVariable(name: "_61", scope: !15, file: !1, line: 170, type: !10)
!337 = !DILocation(line: 170, column: 12, scope: !15)
!338 = !DILocalVariable(name: "_62", scope: !15, file: !1, line: 171, type: !10)
!339 = !DILocation(line: 171, column: 12, scope: !15)
!340 = !DILocation(line: 173, column: 6, scope: !15)
!341 = !DILocation(line: 175, column: 6, scope: !15)
!342 = !DILocation(line: 175, column: 8, scope: !15)
!343 = !DILocation(line: 175, column: 7, scope: !15)
!344 = !DILocation(line: 175, column: 5, scope: !15)
!345 = !DILocation(line: 177, column: 2, scope: !346)
!346 = distinct !DILexicalBlock(scope: !15, file: !1, line: 177, column: 2)
!347 = !DILocation(line: 177, column: 2, scope: !15)
!348 = !DILocation(line: 177, column: 2, scope: !349)
!349 = !DILexicalBlockFile(scope: !350, file: !1, discriminator: 1)
!350 = distinct !DILexicalBlock(scope: !346, file: !1, line: 177, column: 2)
!351 = !DILocation(line: 178, column: 2, scope: !15)
!352 = !DILocation(line: 179, column: 2, scope: !15)
!353 = !DILocation(line: 181, column: 2, scope: !354)
!354 = distinct !DILexicalBlock(scope: !15, file: !1, line: 181, column: 2)
!355 = !DILocation(line: 181, column: 2, scope: !15)
!356 = !DILocation(line: 181, column: 2, scope: !357)
!357 = !DILexicalBlockFile(scope: !358, file: !1, discriminator: 1)
!358 = distinct !DILexicalBlock(scope: !354, file: !1, line: 181, column: 2)
!359 = !DILocation(line: 182, column: 2, scope: !15)
!360 = !DILocation(line: 183, column: 2, scope: !15)
!361 = !DILocation(line: 184, column: 2, scope: !15)
!362 = !DILocation(line: 186, column: 6, scope: !15)
!363 = !DILocation(line: 188, column: 6, scope: !15)
!364 = !DILocation(line: 188, column: 4, scope: !15)
!365 = !DILocation(line: 190, column: 2, scope: !15)
!366 = !DILocation(line: 192, column: 6, scope: !367)
!367 = distinct !DILexicalBlock(scope: !368, file: !1, line: 192, column: 6)
!368 = distinct !DILexicalBlock(scope: !15, file: !1, line: 190, column: 13)
!369 = !DILocation(line: 192, column: 9, scope: !367)
!370 = !DILocation(line: 192, column: 7, scope: !367)
!371 = !DILocation(line: 192, column: 6, scope: !368)
!372 = !DILocation(line: 192, column: 12, scope: !373)
!373 = !DILexicalBlockFile(scope: !374, file: !1, discriminator: 1)
!374 = distinct !DILexicalBlock(scope: !367, file: !1, line: 192, column: 11)
!375 = !DILocation(line: 194, column: 7, scope: !368)
!376 = !DILocation(line: 194, column: 5, scope: !368)
!377 = !DILocation(line: 196, column: 7, scope: !368)
!378 = !DILocation(line: 198, column: 7, scope: !368)
!379 = !DILocation(line: 198, column: 5, scope: !368)
!380 = !DILocation(line: 200, column: 3, scope: !368)
!381 = !DILocation(line: 202, column: 7, scope: !382)
!382 = distinct !DILexicalBlock(scope: !383, file: !1, line: 202, column: 7)
!383 = distinct !DILexicalBlock(scope: !368, file: !1, line: 200, column: 14)
!384 = !DILocation(line: 202, column: 10, scope: !382)
!385 = !DILocation(line: 202, column: 8, scope: !382)
!386 = !DILocation(line: 202, column: 7, scope: !383)
!387 = !DILocation(line: 202, column: 13, scope: !388)
!388 = !DILexicalBlockFile(scope: !389, file: !1, discriminator: 1)
!389 = distinct !DILexicalBlock(scope: !382, file: !1, line: 202, column: 12)
!390 = !DILocation(line: 204, column: 8, scope: !383)
!391 = !DILocation(line: 206, column: 8, scope: !383)
!392 = !DILocation(line: 206, column: 6, scope: !383)
!393 = !DILocation(line: 208, column: 8, scope: !383)
!394 = !DILocation(line: 210, column: 8, scope: !383)
!395 = !DILocation(line: 210, column: 10, scope: !383)
!396 = !DILocation(line: 210, column: 9, scope: !383)
!397 = !DILocation(line: 210, column: 7, scope: !383)
!398 = !DILocation(line: 212, column: 7, scope: !399)
!399 = distinct !DILexicalBlock(scope: !383, file: !1, line: 212, column: 7)
!400 = !DILocation(line: 212, column: 12, scope: !399)
!401 = !DILocation(line: 212, column: 10, scope: !399)
!402 = !DILocation(line: 212, column: 7, scope: !383)
!403 = !DILocation(line: 212, column: 15, scope: !404)
!404 = !DILexicalBlockFile(scope: !405, file: !1, discriminator: 1)
!405 = distinct !DILexicalBlock(scope: !399, file: !1, line: 212, column: 14)
!406 = !DILocation(line: 214, column: 8, scope: !383)
!407 = !DILocation(line: 216, column: 8, scope: !383)
!408 = !DILocation(line: 216, column: 10, scope: !383)
!409 = !DILocation(line: 216, column: 9, scope: !383)
!410 = !DILocation(line: 216, column: 7, scope: !383)
!411 = !DILocation(line: 218, column: 8, scope: !383)
!412 = !DILocation(line: 220, column: 7, scope: !413)
!413 = distinct !DILexicalBlock(scope: !383, file: !1, line: 220, column: 7)
!414 = !DILocation(line: 220, column: 11, scope: !413)
!415 = !DILocation(line: 220, column: 10, scope: !413)
!416 = !DILocation(line: 220, column: 7, scope: !383)
!417 = !DILocation(line: 220, column: 16, scope: !418)
!418 = !DILexicalBlockFile(scope: !419, file: !1, discriminator: 1)
!419 = distinct !DILexicalBlock(scope: !413, file: !1, line: 220, column: 15)
!420 = !DILocation(line: 222, column: 8, scope: !383)
!421 = !DILocation(line: 224, column: 8, scope: !383)
!422 = !DILocation(line: 224, column: 10, scope: !383)
!423 = !DILocation(line: 224, column: 9, scope: !383)
!424 = !DILocation(line: 224, column: 7, scope: !383)
!425 = !DILocation(line: 226, column: 8, scope: !383)
!426 = !DILocation(line: 226, column: 12, scope: !383)
!427 = !DILocation(line: 226, column: 11, scope: !383)
!428 = !DILocation(line: 226, column: 7, scope: !383)
!429 = !DILocation(line: 228, column: 8, scope: !383)
!430 = !DILocation(line: 228, column: 12, scope: !383)
!431 = !DILocation(line: 228, column: 11, scope: !383)
!432 = !DILocation(line: 228, column: 7, scope: !383)
!433 = !DILocation(line: 230, column: 8, scope: !383)
!434 = !DILocation(line: 232, column: 8, scope: !383)
!435 = !DILocation(line: 232, column: 12, scope: !383)
!436 = !DILocation(line: 232, column: 11, scope: !383)
!437 = !DILocation(line: 232, column: 7, scope: !383)
!438 = !DILocation(line: 234, column: 14, scope: !383)
!439 = !DILocation(line: 234, column: 8, scope: !383)
!440 = !DILocation(line: 234, column: 7, scope: !383)
!441 = !DILocation(line: 236, column: 8, scope: !383)
!442 = !DILocation(line: 236, column: 6, scope: !383)
!443 = !DILocation(line: 236, column: 4, scope: !383)
!444 = !DILocation(line: 240, column: 8, scope: !383)
!445 = !DILocation(line: 242, column: 8, scope: !383)
!446 = !DILocation(line: 242, column: 6, scope: !383)
!447 = !DILocation(line: 244, column: 8, scope: !383)
!448 = !DILocation(line: 246, column: 8, scope: !383)
!449 = !DILocation(line: 246, column: 10, scope: !383)
!450 = !DILocation(line: 246, column: 9, scope: !383)
!451 = !DILocation(line: 246, column: 7, scope: !383)
!452 = !DILocation(line: 248, column: 7, scope: !453)
!453 = distinct !DILexicalBlock(scope: !383, file: !1, line: 248, column: 7)
!454 = !DILocation(line: 248, column: 12, scope: !453)
!455 = !DILocation(line: 248, column: 10, scope: !453)
!456 = !DILocation(line: 248, column: 7, scope: !383)
!457 = !DILocation(line: 248, column: 15, scope: !458)
!458 = !DILexicalBlockFile(scope: !459, file: !1, discriminator: 1)
!459 = distinct !DILexicalBlock(scope: !453, file: !1, line: 248, column: 14)
!460 = !DILocation(line: 250, column: 8, scope: !383)
!461 = !DILocation(line: 252, column: 8, scope: !383)
!462 = !DILocation(line: 252, column: 10, scope: !383)
!463 = !DILocation(line: 252, column: 9, scope: !383)
!464 = !DILocation(line: 252, column: 7, scope: !383)
!465 = !DILocation(line: 254, column: 8, scope: !383)
!466 = !DILocation(line: 254, column: 12, scope: !383)
!467 = !DILocation(line: 254, column: 11, scope: !383)
!468 = !DILocation(line: 254, column: 7, scope: !383)
!469 = !DILocation(line: 256, column: 8, scope: !383)
!470 = !DILocation(line: 256, column: 12, scope: !383)
!471 = !DILocation(line: 256, column: 11, scope: !383)
!472 = !DILocation(line: 256, column: 7, scope: !383)
!473 = !DILocation(line: 258, column: 14, scope: !383)
!474 = !DILocation(line: 258, column: 8, scope: !383)
!475 = !DILocation(line: 258, column: 7, scope: !383)
!476 = !DILocation(line: 260, column: 8, scope: !383)
!477 = !DILocation(line: 260, column: 6, scope: !383)
!478 = !DILocation(line: 260, column: 4, scope: !383)
!479 = !DILocation(line: 264, column: 8, scope: !383)
!480 = !DILocation(line: 266, column: 8, scope: !383)
!481 = !DILocation(line: 266, column: 6, scope: !383)
!482 = !DILocation(line: 268, column: 8, scope: !383)
!483 = !DILocation(line: 270, column: 8, scope: !383)
!484 = !DILocation(line: 270, column: 10, scope: !383)
!485 = !DILocation(line: 270, column: 9, scope: !383)
!486 = !DILocation(line: 270, column: 7, scope: !383)
!487 = !DILocation(line: 272, column: 8, scope: !383)
!488 = !DILocation(line: 274, column: 7, scope: !489)
!489 = distinct !DILexicalBlock(scope: !383, file: !1, line: 274, column: 7)
!490 = !DILocation(line: 274, column: 12, scope: !489)
!491 = !DILocation(line: 274, column: 10, scope: !489)
!492 = !DILocation(line: 274, column: 7, scope: !383)
!493 = !DILocation(line: 274, column: 17, scope: !494)
!494 = !DILexicalBlockFile(scope: !495, file: !1, discriminator: 1)
!495 = distinct !DILexicalBlock(scope: !489, file: !1, line: 274, column: 16)
!496 = !DILocation(line: 276, column: 8, scope: !383)
!497 = !DILocation(line: 276, column: 10, scope: !383)
!498 = !DILocation(line: 276, column: 9, scope: !383)
!499 = !DILocation(line: 276, column: 7, scope: !383)
!500 = !DILocation(line: 278, column: 8, scope: !383)
!501 = !DILocation(line: 278, column: 12, scope: !383)
!502 = !DILocation(line: 278, column: 11, scope: !383)
!503 = !DILocation(line: 278, column: 7, scope: !383)
!504 = !DILocation(line: 280, column: 8, scope: !383)
!505 = !DILocation(line: 282, column: 8, scope: !383)
!506 = !DILocation(line: 282, column: 12, scope: !383)
!507 = !DILocation(line: 282, column: 11, scope: !383)
!508 = !DILocation(line: 282, column: 7, scope: !383)
!509 = !DILocation(line: 284, column: 14, scope: !383)
!510 = !DILocation(line: 284, column: 8, scope: !383)
!511 = !DILocation(line: 284, column: 7, scope: !383)
!512 = !DILocation(line: 286, column: 8, scope: !383)
!513 = !DILocation(line: 286, column: 6, scope: !383)
!514 = !DILocation(line: 286, column: 4, scope: !383)
!515 = !DILocation(line: 290, column: 7, scope: !516)
!516 = distinct !DILexicalBlock(scope: !383, file: !1, line: 290, column: 7)
!517 = !DILocation(line: 290, column: 10, scope: !516)
!518 = !DILocation(line: 290, column: 8, scope: !516)
!519 = !DILocation(line: 290, column: 7, scope: !383)
!520 = !DILocation(line: 290, column: 13, scope: !521)
!521 = !DILexicalBlockFile(scope: !522, file: !1, discriminator: 1)
!522 = distinct !DILexicalBlock(scope: !516, file: !1, line: 290, column: 12)
!523 = !DILocation(line: 292, column: 8, scope: !383)
!524 = !DILocation(line: 292, column: 6, scope: !383)
!525 = !DILocation(line: 292, column: 4, scope: !383)
!526 = !DILocation(line: 296, column: 7, scope: !527)
!527 = distinct !DILexicalBlock(scope: !383, file: !1, line: 296, column: 7)
!528 = !DILocation(line: 296, column: 10, scope: !527)
!529 = !DILocation(line: 296, column: 8, scope: !527)
!530 = !DILocation(line: 296, column: 7, scope: !383)
!531 = !DILocation(line: 296, column: 13, scope: !532)
!532 = !DILexicalBlockFile(scope: !533, file: !1, discriminator: 1)
!533 = distinct !DILexicalBlock(scope: !527, file: !1, line: 296, column: 12)
!534 = !DILocation(line: 298, column: 8, scope: !383)
!535 = !DILocation(line: 298, column: 6, scope: !383)
!536 = !DILocation(line: 298, column: 4, scope: !383)
!537 = !DILocation(line: 302, column: 14, scope: !383)
!538 = !DILocation(line: 302, column: 8, scope: !383)
!539 = !DILocation(line: 302, column: 7, scope: !383)
!540 = !DILocation(line: 304, column: 8, scope: !383)
!541 = !DILocation(line: 304, column: 12, scope: !383)
!542 = !DILocation(line: 304, column: 11, scope: !383)
!543 = !DILocation(line: 304, column: 7, scope: !383)
!544 = !DILocation(line: 306, column: 14, scope: !383)
!545 = !DILocation(line: 306, column: 8, scope: !383)
!546 = !DILocation(line: 306, column: 7, scope: !383)
!547 = !DILocation(line: 308, column: 8, scope: !383)
!548 = !DILocation(line: 308, column: 12, scope: !383)
!549 = !DILocation(line: 308, column: 11, scope: !383)
!550 = !DILocation(line: 308, column: 7, scope: !383)
!551 = !DILocation(line: 310, column: 7, scope: !552)
!552 = distinct !DILexicalBlock(scope: !383, file: !1, line: 310, column: 7)
!553 = !DILocation(line: 310, column: 12, scope: !552)
!554 = !DILocation(line: 310, column: 10, scope: !552)
!555 = !DILocation(line: 310, column: 7, scope: !383)
!556 = !DILocation(line: 310, column: 17, scope: !557)
!557 = !DILexicalBlockFile(scope: !558, file: !1, discriminator: 1)
!558 = distinct !DILexicalBlock(scope: !552, file: !1, line: 310, column: 16)
!559 = !DILocation(line: 312, column: 14, scope: !383)
!560 = !DILocation(line: 312, column: 8, scope: !383)
!561 = !DILocation(line: 312, column: 7, scope: !383)
!562 = !DILocation(line: 314, column: 8, scope: !383)
!563 = !DILocation(line: 314, column: 12, scope: !383)
!564 = !DILocation(line: 314, column: 11, scope: !383)
!565 = !DILocation(line: 314, column: 7, scope: !383)
!566 = !DILocation(line: 316, column: 8, scope: !383)
!567 = !DILocation(line: 316, column: 10, scope: !383)
!568 = !DILocation(line: 316, column: 9, scope: !383)
!569 = !DILocation(line: 316, column: 7, scope: !383)
!570 = !DILocation(line: 318, column: 8, scope: !383)
!571 = !DILocation(line: 318, column: 12, scope: !383)
!572 = !DILocation(line: 318, column: 11, scope: !383)
!573 = !DILocation(line: 318, column: 7, scope: !383)
!574 = !DILocation(line: 320, column: 17, scope: !383)
!575 = !DILocation(line: 320, column: 10, scope: !383)
!576 = !DILocation(line: 320, column: 4, scope: !383)
!577 = !DILocation(line: 320, column: 15, scope: !383)
!578 = !DILocation(line: 322, column: 4, scope: !383)
!579 = !DILocation(line: 326, column: 14, scope: !383)
!580 = !DILocation(line: 326, column: 8, scope: !383)
!581 = !DILocation(line: 326, column: 7, scope: !383)
!582 = !DILocation(line: 328, column: 8, scope: !383)
!583 = !DILocation(line: 328, column: 12, scope: !383)
!584 = !DILocation(line: 328, column: 11, scope: !383)
!585 = !DILocation(line: 328, column: 7, scope: !383)
!586 = !DILocation(line: 330, column: 8, scope: !383)
!587 = !DILocation(line: 330, column: 10, scope: !383)
!588 = !DILocation(line: 330, column: 9, scope: !383)
!589 = !DILocation(line: 330, column: 7, scope: !383)
!590 = !DILocation(line: 332, column: 8, scope: !383)
!591 = !DILocation(line: 332, column: 12, scope: !383)
!592 = !DILocation(line: 332, column: 11, scope: !383)
!593 = !DILocation(line: 332, column: 7, scope: !383)
!594 = !DILocation(line: 334, column: 17, scope: !383)
!595 = !DILocation(line: 334, column: 10, scope: !383)
!596 = !DILocation(line: 334, column: 4, scope: !383)
!597 = !DILocation(line: 334, column: 15, scope: !383)
!598 = !DILocation(line: 338, column: 8, scope: !383)
!599 = !DILocation(line: 340, column: 8, scope: !383)
!600 = !DILocation(line: 340, column: 10, scope: !383)
!601 = !DILocation(line: 340, column: 9, scope: !383)
!602 = !DILocation(line: 340, column: 7, scope: !383)
!603 = !DILocation(line: 342, column: 8, scope: !383)
!604 = !DILocation(line: 342, column: 6, scope: !383)
!605 = !DILocation(line: 344, column: 8, scope: !383)
!606 = !DILocation(line: 346, column: 8, scope: !383)
!607 = !DILocation(line: 346, column: 10, scope: !383)
!608 = !DILocation(line: 346, column: 9, scope: !383)
!609 = !DILocation(line: 346, column: 7, scope: !383)
!610 = !DILocation(line: 348, column: 8, scope: !383)
!611 = !DILocation(line: 348, column: 6, scope: !383)
!612 = !DILocation(line: 348, column: 4, scope: !383)
!613 = !DILocation(line: 200, column: 3, scope: !614)
!614 = !DILexicalBlockFile(scope: !368, file: !1, discriminator: 1)
!615 = !DILocation(line: 355, column: 7, scope: !368)
!616 = !DILocation(line: 357, column: 7, scope: !368)
!617 = !DILocation(line: 357, column: 9, scope: !368)
!618 = !DILocation(line: 357, column: 8, scope: !368)
!619 = !DILocation(line: 357, column: 6, scope: !368)
!620 = !DILocation(line: 359, column: 7, scope: !368)
!621 = !DILocation(line: 359, column: 5, scope: !368)
!622 = !DILocation(line: 359, column: 3, scope: !368)
!623 = !DILocation(line: 190, column: 2, scope: !624)
!624 = !DILexicalBlockFile(scope: !15, file: !1, discriminator: 1)
!625 = !DILocation(line: 366, column: 2, scope: !626)
!626 = distinct !DILexicalBlock(scope: !15, file: !1, line: 366, column: 2)
!627 = !DILocation(line: 366, column: 2, scope: !15)
!628 = !DILocation(line: 366, column: 2, scope: !629)
!629 = !DILexicalBlockFile(scope: !630, file: !1, discriminator: 1)
!630 = distinct !DILexicalBlock(scope: !626, file: !1, line: 366, column: 2)
!631 = !DILocation(line: 367, column: 2, scope: !632)
!632 = distinct !DILexicalBlock(scope: !15, file: !1, line: 367, column: 2)
!633 = !DILocation(line: 367, column: 2, scope: !15)
!634 = !DILocation(line: 367, column: 2, scope: !635)
!635 = !DILexicalBlockFile(scope: !636, file: !1, discriminator: 1)
!636 = distinct !DILexicalBlock(scope: !632, file: !1, line: 367, column: 2)
!637 = !DILocation(line: 368, column: 2, scope: !638)
!638 = distinct !DILexicalBlock(scope: !15, file: !1, line: 368, column: 2)
!639 = !DILocation(line: 368, column: 2, scope: !15)
!640 = !DILocation(line: 368, column: 2, scope: !641)
!641 = !DILexicalBlockFile(scope: !642, file: !1, discriminator: 1)
!642 = distinct !DILexicalBlock(scope: !638, file: !1, line: 368, column: 2)
!643 = !DILocation(line: 369, column: 9, scope: !15)
!644 = !DILocation(line: 369, column: 2, scope: !15)
!645 = !DILocalVariable(name: "argc", arg: 1, scope: !18, file: !1, line: 373, type: !21)
!646 = !DILocation(line: 373, column: 14, scope: !18)
!647 = !DILocalVariable(name: "args", arg: 2, scope: !18, file: !1, line: 373, type: !22)
!648 = !DILocation(line: 373, column: 27, scope: !18)
!649 = !DILocalVariable(name: "max", scope: !18, file: !1, line: 374, type: !9)
!650 = !DILocation(line: 374, column: 13, scope: !18)
!651 = !DILocalVariable(name: "n", scope: !18, file: !1, line: 375, type: !10)
!652 = !DILocation(line: 375, column: 12, scope: !18)
!653 = !DILocalVariable(name: "coins", scope: !18, file: !1, line: 376, type: !9)
!654 = !DILocation(line: 376, column: 2, scope: !18)
!655 = !DILocalVariable(name: "coins_size", scope: !18, file: !1, line: 376, type: !10)
!656 = !DILocalVariable(name: "coins_has_ownership", scope: !18, file: !1, line: 377, type: !14)
!657 = !DILocation(line: 377, column: 2, scope: !18)
!658 = !DILocalVariable(name: "moves", scope: !18, file: !1, line: 378, type: !9)
!659 = !DILocation(line: 378, column: 2, scope: !18)
!660 = !DILocalVariable(name: "moves_size", scope: !18, file: !1, line: 378, type: !10)
!661 = !DILocalVariable(name: "moves_has_ownership", scope: !18, file: !1, line: 379, type: !14)
!662 = !DILocation(line: 379, column: 2, scope: !18)
!663 = !DILocalVariable(name: "sum_alice", scope: !18, file: !1, line: 380, type: !10)
!664 = !DILocation(line: 380, column: 12, scope: !18)
!665 = !DILocalVariable(name: "sum_bob", scope: !18, file: !1, line: 381, type: !10)
!666 = !DILocation(line: 381, column: 12, scope: !18)
!667 = !DILocalVariable(name: "_7", scope: !18, file: !1, line: 382, type: !9)
!668 = !DILocation(line: 382, column: 13, scope: !18)
!669 = !DILocalVariable(name: "_8", scope: !18, file: !1, line: 383, type: !670)
!670 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !9, size: 64, align: 64)
!671 = !DILocation(line: 383, column: 2, scope: !18)
!672 = !DILocalVariable(name: "_8_size", scope: !18, file: !1, line: 383, type: !10)
!673 = !DILocalVariable(name: "_8_size_size", scope: !18, file: !1, line: 383, type: !10)
!674 = !DILocalVariable(name: "_8_has_ownership", scope: !18, file: !1, line: 384, type: !14)
!675 = !DILocation(line: 384, column: 2, scope: !18)
!676 = !DILocalVariable(name: "_9", scope: !18, file: !1, line: 385, type: !10)
!677 = !DILocation(line: 385, column: 12, scope: !18)
!678 = !DILocalVariable(name: "_10", scope: !18, file: !1, line: 386, type: !9)
!679 = !DILocation(line: 386, column: 2, scope: !18)
!680 = !DILocalVariable(name: "_10_size", scope: !18, file: !1, line: 386, type: !10)
!681 = !DILocalVariable(name: "_10_has_ownership", scope: !18, file: !1, line: 387, type: !14)
!682 = !DILocation(line: 387, column: 2, scope: !18)
!683 = !DILocalVariable(name: "_11", scope: !18, file: !1, line: 388, type: !9)
!684 = !DILocation(line: 388, column: 2, scope: !18)
!685 = !DILocalVariable(name: "_11_size", scope: !18, file: !1, line: 388, type: !10)
!686 = !DILocalVariable(name: "_11_has_ownership", scope: !18, file: !1, line: 389, type: !14)
!687 = !DILocation(line: 389, column: 2, scope: !18)
!688 = !DILocalVariable(name: "_12", scope: !18, file: !1, line: 390, type: !9)
!689 = !DILocation(line: 390, column: 2, scope: !18)
!690 = !DILocalVariable(name: "_12_size", scope: !18, file: !1, line: 390, type: !10)
!691 = !DILocalVariable(name: "_12_has_ownership", scope: !18, file: !1, line: 391, type: !14)
!692 = !DILocation(line: 391, column: 2, scope: !18)
!693 = !DILocalVariable(name: "_13", scope: !18, file: !1, line: 392, type: !10)
!694 = !DILocation(line: 392, column: 12, scope: !18)
!695 = !DILocalVariable(name: "_14", scope: !18, file: !1, line: 393, type: !10)
!696 = !DILocation(line: 393, column: 12, scope: !18)
!697 = !DILocalVariable(name: "_15", scope: !18, file: !1, line: 394, type: !10)
!698 = !DILocation(line: 394, column: 12, scope: !18)
!699 = !DILocalVariable(name: "_16", scope: !18, file: !1, line: 395, type: !10)
!700 = !DILocation(line: 395, column: 12, scope: !18)
!701 = !DILocalVariable(name: "_17", scope: !18, file: !1, line: 396, type: !4)
!702 = !DILocation(line: 396, column: 8, scope: !18)
!703 = !DILocalVariable(name: "_19", scope: !18, file: !1, line: 397, type: !9)
!704 = !DILocation(line: 397, column: 2, scope: !18)
!705 = !DILocalVariable(name: "_19_size", scope: !18, file: !1, line: 397, type: !10)
!706 = !DILocalVariable(name: "_19_has_ownership", scope: !18, file: !1, line: 398, type: !14)
!707 = !DILocation(line: 398, column: 2, scope: !18)
!708 = !DILocalVariable(name: "_20", scope: !18, file: !1, line: 399, type: !4)
!709 = !DILocation(line: 399, column: 8, scope: !18)
!710 = !DILocalVariable(name: "_22", scope: !18, file: !1, line: 400, type: !4)
!711 = !DILocation(line: 400, column: 8, scope: !18)
!712 = !DILocalVariable(name: "_24", scope: !18, file: !1, line: 401, type: !9)
!713 = !DILocation(line: 401, column: 2, scope: !18)
!714 = !DILocalVariable(name: "_24_size", scope: !18, file: !1, line: 401, type: !10)
!715 = !DILocalVariable(name: "_24_has_ownership", scope: !18, file: !1, line: 402, type: !14)
!716 = !DILocation(line: 402, column: 2, scope: !18)
!717 = !DILocalVariable(name: "_25", scope: !18, file: !1, line: 403, type: !4)
!718 = !DILocation(line: 403, column: 8, scope: !18)
!719 = !DILocation(line: 405, column: 2, scope: !18)
!720 = !DILocation(line: 406, column: 2, scope: !18)
!721 = !DILocation(line: 408, column: 5, scope: !18)
!722 = !DILocation(line: 410, column: 9, scope: !18)
!723 = !DILocation(line: 410, column: 6, scope: !18)
!724 = !DILocation(line: 410, column: 5, scope: !18)
!725 = !DILocation(line: 412, column: 2, scope: !18)
!726 = !DILocation(line: 414, column: 8, scope: !18)
!727 = !DILocation(line: 414, column: 6, scope: !18)
!728 = !DILocation(line: 416, column: 5, scope: !729)
!729 = distinct !DILexicalBlock(scope: !18, file: !1, line: 416, column: 5)
!730 = !DILocation(line: 416, column: 9, scope: !729)
!731 = !DILocation(line: 416, column: 5, scope: !18)
!732 = !DILocation(line: 416, column: 20, scope: !733)
!733 = !DILexicalBlockFile(scope: !734, file: !1, discriminator: 1)
!734 = distinct !DILexicalBlock(scope: !729, file: !1, line: 416, column: 18)
!735 = !DILocation(line: 418, column: 7, scope: !18)
!736 = !DILocation(line: 418, column: 6, scope: !18)
!737 = !DILocation(line: 418, column: 4, scope: !18)
!738 = !DILocation(line: 420, column: 2, scope: !739)
!739 = distinct !DILexicalBlock(scope: !18, file: !1, line: 420, column: 2)
!740 = !DILocation(line: 420, column: 2, scope: !18)
!741 = !DILocation(line: 420, column: 2, scope: !742)
!742 = !DILexicalBlockFile(scope: !743, file: !1, discriminator: 1)
!743 = distinct !DILexicalBlock(scope: !739, file: !1, line: 420, column: 2)
!744 = !DILocation(line: 421, column: 13, scope: !18)
!745 = !DILocation(line: 421, column: 8, scope: !18)
!746 = !DILocation(line: 421, column: 6, scope: !18)
!747 = !DILocation(line: 422, column: 2, scope: !18)
!748 = !DILocation(line: 424, column: 2, scope: !749)
!749 = distinct !DILexicalBlock(scope: !18, file: !1, line: 424, column: 2)
!750 = !DILocation(line: 424, column: 2, scope: !18)
!751 = !DILocation(line: 424, column: 2, scope: !752)
!752 = !DILexicalBlockFile(scope: !753, file: !1, discriminator: 1)
!753 = distinct !DILexicalBlock(scope: !749, file: !1, line: 424, column: 2)
!754 = !DILocation(line: 425, column: 2, scope: !18)
!755 = !DILocation(line: 426, column: 2, scope: !18)
!756 = !DILocation(line: 427, column: 2, scope: !18)
!757 = !DILocation(line: 429, column: 2, scope: !758)
!758 = distinct !DILexicalBlock(scope: !18, file: !1, line: 429, column: 2)
!759 = !DILocation(line: 429, column: 2, scope: !18)
!760 = !DILocation(line: 429, column: 2, scope: !761)
!761 = !DILexicalBlockFile(scope: !762, file: !1, discriminator: 1)
!762 = distinct !DILexicalBlock(scope: !758, file: !1, line: 429, column: 2)
!763 = !DILocation(line: 430, column: 2, scope: !18)
!764 = !DILocation(line: 431, column: 2, scope: !18)
!765 = !DILocation(line: 432, column: 18, scope: !18)
!766 = !DILocation(line: 432, column: 48, scope: !18)
!767 = !DILocation(line: 432, column: 8, scope: !18)
!768 = !DILocation(line: 432, column: 6, scope: !18)
!769 = !DILocation(line: 433, column: 2, scope: !18)
!770 = !DILocation(line: 435, column: 2, scope: !771)
!771 = distinct !DILexicalBlock(scope: !18, file: !1, line: 435, column: 2)
!772 = !DILocation(line: 435, column: 2, scope: !18)
!773 = !DILocation(line: 435, column: 2, scope: !774)
!774 = !DILexicalBlockFile(scope: !775, file: !1, discriminator: 1)
!775 = distinct !DILexicalBlock(scope: !771, file: !1, line: 435, column: 2)
!776 = !DILocation(line: 436, column: 2, scope: !18)
!777 = !DILocation(line: 437, column: 2, scope: !18)
!778 = !DILocation(line: 438, column: 2, scope: !18)
!779 = !DILocation(line: 440, column: 6, scope: !18)
!780 = !DILocation(line: 442, column: 6, scope: !18)
!781 = !DILocation(line: 442, column: 8, scope: !18)
!782 = !DILocation(line: 442, column: 7, scope: !18)
!783 = !DILocation(line: 442, column: 5, scope: !18)
!784 = !DILocation(line: 444, column: 12, scope: !18)
!785 = !DILocation(line: 444, column: 6, scope: !18)
!786 = !DILocation(line: 444, column: 5, scope: !18)
!787 = !DILocation(line: 446, column: 14, scope: !18)
!788 = !DILocation(line: 446, column: 12, scope: !18)
!789 = !DILocation(line: 448, column: 2, scope: !18)
!790 = !DILocation(line: 449, column: 18, scope: !18)
!791 = !DILocation(line: 449, column: 29, scope: !18)
!792 = !DILocation(line: 449, column: 59, scope: !18)
!793 = !DILocation(line: 449, column: 8, scope: !18)
!794 = !DILocation(line: 449, column: 6, scope: !18)
!795 = !DILocation(line: 451, column: 12, scope: !18)
!796 = !DILocation(line: 451, column: 10, scope: !18)
!797 = !DILocation(line: 455, column: 6, scope: !798)
!798 = distinct !DILexicalBlock(scope: !799, file: !1, line: 455, column: 6)
!799 = distinct !DILexicalBlock(scope: !18, file: !1, line: 453, column: 2)
!800 = !DILocation(line: 455, column: 17, scope: !798)
!801 = !DILocation(line: 455, column: 15, scope: !798)
!802 = !DILocation(line: 455, column: 6, scope: !799)
!803 = !DILocation(line: 455, column: 26, scope: !804)
!804 = !DILexicalBlockFile(scope: !805, file: !1, discriminator: 1)
!805 = distinct !DILexicalBlock(scope: !798, file: !1, line: 455, column: 25)
!806 = !DILocation(line: 457, column: 11, scope: !799)
!807 = !DILocation(line: 457, column: 3, scope: !799)
!808 = !DILocation(line: 458, column: 3, scope: !799)
!809 = !DILocation(line: 466, column: 2, scope: !810)
!810 = distinct !DILexicalBlock(scope: !18, file: !1, line: 466, column: 2)
!811 = !DILocation(line: 466, column: 2, scope: !18)
!812 = !DILocation(line: 466, column: 2, scope: !813)
!813 = !DILexicalBlockFile(scope: !814, file: !1, discriminator: 1)
!814 = distinct !DILexicalBlock(scope: !810, file: !1, line: 466, column: 2)
!815 = !DILocation(line: 467, column: 2, scope: !18)
!816 = !DILocation(line: 468, column: 2, scope: !18)
!817 = !DILocation(line: 468, column: 9, scope: !18)
!818 = !DILocation(line: 468, column: 15, scope: !18)
!819 = !DILocation(line: 468, column: 22, scope: !18)
!820 = !DILocation(line: 468, column: 29, scope: !18)
!821 = !DILocation(line: 468, column: 36, scope: !18)
!822 = !DILocation(line: 468, column: 43, scope: !18)
!823 = !DILocation(line: 468, column: 50, scope: !18)
!824 = !DILocation(line: 468, column: 56, scope: !18)
!825 = !DILocation(line: 468, column: 63, scope: !18)
!826 = !DILocation(line: 468, column: 70, scope: !18)
!827 = !DILocation(line: 468, column: 77, scope: !18)
!828 = !DILocation(line: 468, column: 84, scope: !18)
!829 = !DILocation(line: 468, column: 91, scope: !18)
!830 = !DILocation(line: 468, column: 98, scope: !18)
!831 = !DILocation(line: 468, column: 105, scope: !18)
!832 = !DILocation(line: 468, column: 111, scope: !18)
!833 = !DILocation(line: 468, column: 118, scope: !18)
!834 = !DILocation(line: 468, column: 125, scope: !18)
!835 = !DILocation(line: 468, column: 132, scope: !18)
!836 = !DILocation(line: 468, column: 138, scope: !18)
!837 = !DILocation(line: 468, column: 146, scope: !18)
!838 = !DILocation(line: 468, column: 152, scope: !18)
!839 = !DILocation(line: 468, column: 160, scope: !18)
!840 = !DILocation(line: 468, column: 167, scope: !18)
!841 = !DILocation(line: 468, column: 175, scope: !18)
!842 = !DILocation(line: 468, column: 182, scope: !18)
!843 = !DILocation(line: 468, column: 190, scope: !18)
!844 = !DILocation(line: 468, column: 197, scope: !18)
!845 = !DILocation(line: 468, column: 205, scope: !18)
!846 = !DILocation(line: 468, column: 212, scope: !18)
!847 = !DILocation(line: 468, column: 220, scope: !18)
!848 = !DILocation(line: 468, column: 227, scope: !18)
!849 = !DILocation(line: 468, column: 235, scope: !18)
!850 = !DILocation(line: 468, column: 241, scope: !18)
!851 = !DILocation(line: 468, column: 249, scope: !18)
!852 = !DILocation(line: 468, column: 256, scope: !18)
!853 = !DILocation(line: 468, column: 264, scope: !18)
!854 = !DILocation(line: 468, column: 271, scope: !18)
!855 = !DILocation(line: 468, column: 279, scope: !18)
!856 = !DILocation(line: 468, column: 285, scope: !18)
!857 = !DILocation(line: 468, column: 293, scope: !18)
!858 = !DILocation(line: 468, column: 300, scope: !18)
!859 = !DILocation(line: 468, column: 308, scope: !18)
!860 = !DILocation(line: 468, column: 315, scope: !18)
!861 = !DILocation(line: 468, column: 323, scope: !18)
!862 = !DILocation(line: 468, column: 330, scope: !18)
!863 = !DILocation(line: 468, column: 338, scope: !18)
!864 = !DILocation(line: 468, column: 345, scope: !18)
!865 = !DILocation(line: 468, column: 353, scope: !18)
!866 = !DILocation(line: 468, column: 360, scope: !18)
!867 = !DILocation(line: 468, column: 368, scope: !18)
!868 = !DILocation(line: 468, column: 374, scope: !18)
!869 = !DILocation(line: 468, column: 382, scope: !18)
!870 = !DILocation(line: 468, column: 388, scope: !18)
!871 = !DILocation(line: 468, column: 396, scope: !18)
!872 = !DILocation(line: 468, column: 403, scope: !18)
!873 = !DILocation(line: 468, column: 411, scope: !18)
!874 = !DILocation(line: 468, column: 417, scope: !18)
!875 = !DILocation(line: 468, column: 425, scope: !18)
!876 = !DILocation(line: 468, column: 432, scope: !18)
!877 = !DILocation(line: 468, column: 440, scope: !18)
!878 = !DILocation(line: 468, column: 447, scope: !18)
!879 = !DILocation(line: 468, column: 455, scope: !18)
!880 = !DILocation(line: 468, column: 462, scope: !18)
!881 = !DILocation(line: 468, column: 470, scope: !18)
!882 = !DILocation(line: 468, column: 477, scope: !18)
!883 = !DILocation(line: 468, column: 485, scope: !18)
!884 = !DILocation(line: 468, column: 492, scope: !18)
!885 = !DILocation(line: 468, column: 500, scope: !18)
!886 = !DILocation(line: 468, column: 506, scope: !18)
!887 = !DILocation(line: 468, column: 514, scope: !18)
!888 = !DILocation(line: 468, column: 520, scope: !18)
!889 = !DILocation(line: 468, column: 528, scope: !18)
!890 = !DILocation(line: 468, column: 534, scope: !18)
!891 = !DILocation(line: 468, column: 542, scope: !18)
!892 = !DILocation(line: 468, column: 549, scope: !18)
!893 = !DILocation(line: 468, column: 557, scope: !18)
!894 = !DILocation(line: 468, column: 564, scope: !18)
!895 = !DILocation(line: 468, column: 572, scope: !18)
!896 = !DILocation(line: 468, column: 578, scope: !18)
!897 = !DILocation(line: 468, column: 586, scope: !18)
!898 = !DILocation(line: 468, column: 593, scope: !18)
!899 = !DILocation(line: 468, column: 601, scope: !18)
!900 = !DILocation(line: 468, column: 607, scope: !18)
!901 = !DILocation(line: 468, column: 615, scope: !18)
!902 = !DILocation(line: 468, column: 622, scope: !18)
!903 = !DILocation(line: 468, column: 630, scope: !18)
!904 = !DILocation(line: 468, column: 637, scope: !18)
!905 = !DILocation(line: 468, column: 645, scope: !18)
!906 = !DILocation(line: 468, column: 652, scope: !18)
!907 = !DILocation(line: 468, column: 660, scope: !18)
!908 = !DILocation(line: 468, column: 667, scope: !18)
!909 = !DILocation(line: 468, column: 675, scope: !18)
!910 = !DILocation(line: 468, column: 681, scope: !18)
!911 = !DILocation(line: 468, column: 689, scope: !18)
!912 = !DILocation(line: 468, column: 696, scope: !18)
!913 = !DILocation(line: 468, column: 704, scope: !18)
!914 = !DILocation(line: 468, column: 711, scope: !18)
!915 = !DILocation(line: 468, column: 719, scope: !18)
!916 = !DILocation(line: 469, column: 2, scope: !18)
!917 = !DILocation(line: 471, column: 11, scope: !18)
!918 = !DILocation(line: 471, column: 2, scope: !18)
!919 = !DILocation(line: 475, column: 19, scope: !18)
!920 = !DILocation(line: 475, column: 2, scope: !18)
!921 = !DILocation(line: 479, column: 2, scope: !922)
!922 = distinct !DILexicalBlock(scope: !18, file: !1, line: 479, column: 2)
!923 = !DILocation(line: 479, column: 2, scope: !18)
!924 = !DILocation(line: 479, column: 2, scope: !925)
!925 = !DILexicalBlockFile(scope: !926, file: !1, discriminator: 1)
!926 = distinct !DILexicalBlock(scope: !922, file: !1, line: 479, column: 2)
!927 = !DILocation(line: 480, column: 2, scope: !18)
!928 = !DILocation(line: 481, column: 2, scope: !18)
!929 = !DILocation(line: 481, column: 9, scope: !18)
!930 = !DILocation(line: 481, column: 15, scope: !18)
!931 = !DILocation(line: 481, column: 22, scope: !18)
!932 = !DILocation(line: 481, column: 29, scope: !18)
!933 = !DILocation(line: 481, column: 36, scope: !18)
!934 = !DILocation(line: 481, column: 43, scope: !18)
!935 = !DILocation(line: 481, column: 50, scope: !18)
!936 = !DILocation(line: 481, column: 56, scope: !18)
!937 = !DILocation(line: 481, column: 63, scope: !18)
!938 = !DILocation(line: 481, column: 70, scope: !18)
!939 = !DILocation(line: 481, column: 77, scope: !18)
!940 = !DILocation(line: 481, column: 84, scope: !18)
!941 = !DILocation(line: 481, column: 91, scope: !18)
!942 = !DILocation(line: 481, column: 98, scope: !18)
!943 = !DILocation(line: 481, column: 105, scope: !18)
!944 = !DILocation(line: 481, column: 111, scope: !18)
!945 = !DILocation(line: 481, column: 118, scope: !18)
!946 = !DILocation(line: 481, column: 125, scope: !18)
!947 = !DILocation(line: 481, column: 132, scope: !18)
!948 = !DILocation(line: 481, column: 138, scope: !18)
!949 = !DILocation(line: 481, column: 146, scope: !18)
!950 = !DILocation(line: 481, column: 152, scope: !18)
!951 = !DILocation(line: 481, column: 160, scope: !18)
!952 = !DILocation(line: 481, column: 167, scope: !18)
!953 = !DILocation(line: 481, column: 175, scope: !18)
!954 = !DILocation(line: 481, column: 182, scope: !18)
!955 = !DILocation(line: 481, column: 190, scope: !18)
!956 = !DILocation(line: 481, column: 197, scope: !18)
!957 = !DILocation(line: 481, column: 205, scope: !18)
!958 = !DILocation(line: 481, column: 212, scope: !18)
!959 = !DILocation(line: 481, column: 220, scope: !18)
!960 = !DILocation(line: 481, column: 227, scope: !18)
!961 = !DILocation(line: 481, column: 235, scope: !18)
!962 = !DILocation(line: 481, column: 241, scope: !18)
!963 = !DILocation(line: 481, column: 249, scope: !18)
!964 = !DILocation(line: 481, column: 256, scope: !18)
!965 = !DILocation(line: 481, column: 264, scope: !18)
!966 = !DILocation(line: 481, column: 271, scope: !18)
!967 = !DILocation(line: 481, column: 279, scope: !18)
!968 = !DILocation(line: 481, column: 285, scope: !18)
!969 = !DILocation(line: 481, column: 293, scope: !18)
!970 = !DILocation(line: 481, column: 300, scope: !18)
!971 = !DILocation(line: 481, column: 308, scope: !18)
!972 = !DILocation(line: 481, column: 315, scope: !18)
!973 = !DILocation(line: 481, column: 323, scope: !18)
!974 = !DILocation(line: 481, column: 330, scope: !18)
!975 = !DILocation(line: 481, column: 338, scope: !18)
!976 = !DILocation(line: 481, column: 345, scope: !18)
!977 = !DILocation(line: 481, column: 353, scope: !18)
!978 = !DILocation(line: 481, column: 360, scope: !18)
!979 = !DILocation(line: 481, column: 368, scope: !18)
!980 = !DILocation(line: 481, column: 374, scope: !18)
!981 = !DILocation(line: 481, column: 382, scope: !18)
!982 = !DILocation(line: 481, column: 388, scope: !18)
!983 = !DILocation(line: 481, column: 396, scope: !18)
!984 = !DILocation(line: 481, column: 403, scope: !18)
!985 = !DILocation(line: 481, column: 411, scope: !18)
!986 = !DILocation(line: 481, column: 417, scope: !18)
!987 = !DILocation(line: 481, column: 425, scope: !18)
!988 = !DILocation(line: 481, column: 432, scope: !18)
!989 = !DILocation(line: 481, column: 440, scope: !18)
!990 = !DILocation(line: 481, column: 447, scope: !18)
!991 = !DILocation(line: 481, column: 455, scope: !18)
!992 = !DILocation(line: 481, column: 462, scope: !18)
!993 = !DILocation(line: 481, column: 470, scope: !18)
!994 = !DILocation(line: 481, column: 477, scope: !18)
!995 = !DILocation(line: 481, column: 485, scope: !18)
!996 = !DILocation(line: 481, column: 492, scope: !18)
!997 = !DILocation(line: 481, column: 500, scope: !18)
!998 = !DILocation(line: 481, column: 506, scope: !18)
!999 = !DILocation(line: 481, column: 514, scope: !18)
!1000 = !DILocation(line: 481, column: 520, scope: !18)
!1001 = !DILocation(line: 481, column: 528, scope: !18)
!1002 = !DILocation(line: 481, column: 534, scope: !18)
!1003 = !DILocation(line: 481, column: 542, scope: !18)
!1004 = !DILocation(line: 481, column: 549, scope: !18)
!1005 = !DILocation(line: 481, column: 557, scope: !18)
!1006 = !DILocation(line: 481, column: 563, scope: !18)
!1007 = !DILocation(line: 481, column: 571, scope: !18)
!1008 = !DILocation(line: 481, column: 577, scope: !18)
!1009 = !DILocation(line: 481, column: 585, scope: !18)
!1010 = !DILocation(line: 481, column: 592, scope: !18)
!1011 = !DILocation(line: 481, column: 600, scope: !18)
!1012 = !DILocation(line: 481, column: 607, scope: !18)
!1013 = !DILocation(line: 481, column: 615, scope: !18)
!1014 = !DILocation(line: 481, column: 622, scope: !18)
!1015 = !DILocation(line: 481, column: 630, scope: !18)
!1016 = !DILocation(line: 481, column: 637, scope: !18)
!1017 = !DILocation(line: 481, column: 645, scope: !18)
!1018 = !DILocation(line: 481, column: 651, scope: !18)
!1019 = !DILocation(line: 481, column: 659, scope: !18)
!1020 = !DILocation(line: 481, column: 666, scope: !18)
!1021 = !DILocation(line: 481, column: 674, scope: !18)
!1022 = !DILocation(line: 481, column: 681, scope: !18)
!1023 = !DILocation(line: 481, column: 689, scope: !18)
!1024 = !DILocation(line: 482, column: 2, scope: !18)
!1025 = !DILocation(line: 484, column: 11, scope: !18)
!1026 = !DILocation(line: 484, column: 2, scope: !18)
!1027 = !DILocation(line: 488, column: 19, scope: !18)
!1028 = !DILocation(line: 488, column: 2, scope: !18)
!1029 = !DILocation(line: 492, column: 2, scope: !1030)
!1030 = distinct !DILexicalBlock(scope: !18, file: !1, line: 492, column: 2)
!1031 = !DILocation(line: 492, column: 2, scope: !18)
!1032 = !DILocation(line: 492, column: 2, scope: !1033)
!1033 = !DILexicalBlockFile(scope: !1034, file: !1, discriminator: 1)
!1034 = distinct !DILexicalBlock(scope: !1030, file: !1, line: 492, column: 2)
!1035 = !DILocation(line: 493, column: 2, scope: !1036)
!1036 = distinct !DILexicalBlock(scope: !18, file: !1, line: 493, column: 2)
!1037 = !DILocation(line: 493, column: 2, scope: !18)
!1038 = !DILocation(line: 493, column: 2, scope: !1039)
!1039 = !DILexicalBlockFile(scope: !1040, file: !1, discriminator: 1)
!1040 = distinct !DILexicalBlock(scope: !1036, file: !1, line: 493, column: 2)
!1041 = !DILocation(line: 494, column: 2, scope: !1042)
!1042 = distinct !DILexicalBlock(scope: !18, file: !1, line: 494, column: 2)
!1043 = !DILocation(line: 494, column: 2, scope: !18)
!1044 = !DILocation(line: 494, column: 2, scope: !1045)
!1045 = !DILexicalBlockFile(scope: !1046, file: !1, discriminator: 1)
!1046 = distinct !DILexicalBlock(scope: !1042, file: !1, line: 494, column: 2)
!1047 = !DILocation(line: 495, column: 2, scope: !1048)
!1048 = distinct !DILexicalBlock(scope: !18, file: !1, line: 495, column: 2)
!1049 = !DILocation(line: 495, column: 2, scope: !18)
!1050 = !DILocation(line: 495, column: 2, scope: !1051)
!1051 = !DILexicalBlockFile(scope: !1052, file: !1, discriminator: 1)
!1052 = distinct !DILexicalBlock(scope: !1048, file: !1, line: 495, column: 2)
!1053 = !DILocation(line: 496, column: 2, scope: !1054)
!1054 = distinct !DILexicalBlock(scope: !18, file: !1, line: 496, column: 2)
!1055 = !DILocation(line: 496, column: 2, scope: !18)
!1056 = !DILocation(line: 496, column: 2, scope: !1057)
!1057 = !DILexicalBlockFile(scope: !1058, file: !1, discriminator: 1)
!1058 = distinct !DILexicalBlock(scope: !1054, file: !1, line: 496, column: 2)
!1059 = !DILocation(line: 497, column: 2, scope: !1060)
!1060 = distinct !DILexicalBlock(scope: !18, file: !1, line: 497, column: 2)
!1061 = !DILocation(line: 497, column: 2, scope: !18)
!1062 = !DILocation(line: 497, column: 2, scope: !1063)
!1063 = !DILexicalBlockFile(scope: !1064, file: !1, discriminator: 1)
!1064 = distinct !DILexicalBlock(scope: !1060, file: !1, line: 497, column: 2)
!1065 = !DILocation(line: 498, column: 2, scope: !1066)
!1066 = distinct !DILexicalBlock(scope: !18, file: !1, line: 498, column: 2)
!1067 = !DILocation(line: 498, column: 2, scope: !18)
!1068 = !DILocation(line: 498, column: 2, scope: !1069)
!1069 = !DILexicalBlockFile(scope: !1070, file: !1, discriminator: 1)
!1070 = distinct !DILexicalBlock(scope: !1066, file: !1, line: 498, column: 2)
!1071 = !DILocation(line: 499, column: 2, scope: !1072)
!1072 = distinct !DILexicalBlock(scope: !18, file: !1, line: 499, column: 2)
!1073 = !DILocation(line: 499, column: 2, scope: !18)
!1074 = !DILocation(line: 499, column: 2, scope: !1075)
!1075 = !DILexicalBlockFile(scope: !1076, file: !1, discriminator: 1)
!1076 = distinct !DILexicalBlock(scope: !1072, file: !1, line: 499, column: 2)
!1077 = !DILocation(line: 500, column: 2, scope: !18)
!1078 = !DILocation(line: 501, column: 1, scope: !18)
