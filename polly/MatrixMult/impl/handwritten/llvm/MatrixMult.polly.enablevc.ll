; ModuleID = 'MatrixMult.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@R = common global [2000 x [2000 x i32]] zeroinitializer, align 16
@A = common global [2000 x [2000 x i32]] zeroinitializer, align 16
@B = common global [2000 x [2000 x i32]] zeroinitializer, align 16
@C = common global [2000 x [2000 x i32]] zeroinitializer, align 16
@.str = private unnamed_addr constant [32 x i8] c"Pass %d X %d matrix test case \0A\00", align 1
@.str.1 = private unnamed_addr constant [47 x i8] c"A[%d][%d] = %d, B[%d][%d] =%d, C[%d][%d] =%d \0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define void @init() #0 !dbg !6 {
entry:
  %call = tail call i64 @time(i64* null) #5, !dbg !32
  %conv = trunc i64 %call to i32, !dbg !33
  tail call void @srand(i32 %conv) #5, !dbg !34
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !10, metadata !36), !dbg !37
  br label %for.cond2.preheader, !dbg !38

for.cond2.preheader:                              ; preds = %for.inc9, %entry
  %indvars.iv70 = phi i64 [ 0, %entry ], [ %indvars.iv.next71, %for.inc9 ]
  br label %for.body5, !dbg !42

for.body5:                                        ; preds = %for.body5, %for.cond2.preheader
  %indvars.iv67 = phi i64 [ 0, %for.cond2.preheader ], [ %indvars.iv.next68, %for.body5 ]
  %call6 = tail call i32 @rand() #5, !dbg !47
  %rem = srem i32 %call6, 10, !dbg !49
  %arrayidx8 = getelementptr inbounds [2000 x [2000 x i32]], [2000 x [2000 x i32]]* @R, i64 0, i64 %indvars.iv70, i64 %indvars.iv67, !dbg !50
  store i32 %rem, i32* %arrayidx8, align 4, !dbg !51, !tbaa !52
  %indvars.iv.next68 = add nuw nsw i64 %indvars.iv67, 1, !dbg !42
  %exitcond69 = icmp eq i64 %indvars.iv.next68, 2000, !dbg !42
  br i1 %exitcond69, label %for.inc9, label %for.body5, !dbg !42

for.inc9:                                         ; preds = %for.body5
  %indvars.iv.next71 = add nuw nsw i64 %indvars.iv70, 1, !dbg !38
  %exitcond72 = icmp eq i64 %indvars.iv.next71, 2000, !dbg !38
  br i1 %exitcond72, label %polly.loop_preheader74.preheader, label %for.cond2.preheader, !dbg !38

polly.loop_preheader74.preheader:                 ; preds = %for.inc9
  br label %polly.loop_preheader74

polly.exiting:                                    ; preds = %polly.loop_exit75
  ret void, !dbg !56

polly.loop_exit75:                                ; preds = %polly.loop_exit81
  %polly.indvar_next = add nuw nsw i64 %polly.indvar, 1
  %exitcond108 = icmp eq i64 %polly.indvar_next, 63
  br i1 %exitcond108, label %polly.exiting, label %polly.loop_preheader74, !llvm.loop !57

polly.loop_header73:                              ; preds = %polly.loop_exit81, %polly.loop_preheader74
  %polly.indvar76 = phi i64 [ 0, %polly.loop_preheader74 ], [ %polly.indvar_next77, %polly.loop_exit81 ]
  %0 = shl i64 %polly.indvar76, 5
  %1 = mul nsw i64 %polly.indvar76, -8
  %2 = add nsw i64 %1, 499
  %3 = icmp sgt i64 %2, 7
  %4 = select i1 %3, i64 7, i64 %2
  %polly.adjust_ub90 = add i64 %4, -1
  br label %polly.loop_header79

polly.loop_exit81:                                ; preds = %polly.loop_exit87
  %polly.indvar_next77 = add nuw nsw i64 %polly.indvar76, 1
  %exitcond = icmp eq i64 %polly.indvar_next77, 63
  br i1 %exitcond, label %polly.loop_exit75, label %polly.loop_header73

polly.loop_preheader74:                           ; preds = %polly.loop_preheader74.preheader, %polly.loop_exit75
  %polly.indvar = phi i64 [ %polly.indvar_next, %polly.loop_exit75 ], [ 0, %polly.loop_preheader74.preheader ]
  %5 = shl i64 %polly.indvar, 5
  %6 = mul nsw i64 %polly.indvar, -32
  %7 = add nsw i64 %6, 1999
  %8 = icmp sgt i64 %7, 31
  %9 = select i1 %8, i64 31, i64 %7
  %polly.adjust_ub = add i64 %9, -1
  br label %polly.loop_header73

polly.loop_header79:                              ; preds = %polly.loop_exit87, %polly.loop_header73
  %polly.indvar82 = phi i64 [ 0, %polly.loop_header73 ], [ %polly.indvar_next83, %polly.loop_exit87 ]
  %10 = add nuw nsw i64 %5, %polly.indvar82
  br label %polly.loop_preheader93

polly.loop_exit87:                                ; preds = %polly.loop_preheader93
  %polly.indvar_next83 = add nuw nsw i64 %polly.indvar82, 1
  %polly.loop_cond84 = icmp sgt i64 %polly.indvar82, %polly.adjust_ub
  br i1 %polly.loop_cond84, label %polly.loop_exit81, label %polly.loop_header79

polly.loop_preheader93:                           ; preds = %polly.loop_header79, %polly.loop_preheader93
  %polly.indvar88 = phi i64 [ 0, %polly.loop_header79 ], [ %polly.indvar_next89, %polly.loop_preheader93 ]
  %11 = shl i64 %polly.indvar88, 2
  %12 = add nuw nsw i64 %0, %11
  %scevgep104 = getelementptr [2000 x [2000 x i32]], [2000 x [2000 x i32]]* @B, i64 0, i64 %10, i64 %12
  %scevgep104105 = bitcast i32* %scevgep104 to i8*
  %scevgep106 = getelementptr [2000 x [2000 x i32]], [2000 x [2000 x i32]]* @R, i64 0, i64 %10, i64 %12
  %scevgep106107 = bitcast i32* %scevgep106 to i8*
  %scevgep100 = getelementptr [2000 x [2000 x i32]], [2000 x [2000 x i32]]* @A, i64 0, i64 %10, i64 %12
  %scevgep100101 = bitcast i32* %scevgep100 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %scevgep100101, i8* %scevgep106107, i64 16, i32 16, i1 false)
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %scevgep104105, i8* %scevgep106107, i64 16, i32 16, i1 false)
  %polly.indvar_next89 = add nuw nsw i64 %polly.indvar88, 1
  %polly.loop_cond91 = icmp sgt i64 %polly.indvar88, %polly.adjust_ub90
  br i1 %polly.loop_cond91, label %polly.loop_exit87, label %polly.loop_preheader93
}

; Function Attrs: nounwind
declare void @srand(i32) #1

; Function Attrs: nounwind
declare i64 @time(i64*) #1

; Function Attrs: nounwind
declare i32 @rand() #1

; Function Attrs: noinline nounwind uwtable
define void @mat_mult() #0 !dbg !13 {
entry:
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !15, metadata !36), !dbg !58
  br label %polly.loop_preheader56

polly.exiting:                                    ; preds = %polly.loop_exit88
  ret void, !dbg !59

polly.loop_exit57:                                ; preds = %polly.loop_exit63
  %polly.indvar_next = add nuw nsw i64 %polly.indvar, 1
  %exitcond140 = icmp eq i64 %polly.indvar_next, 63
  br i1 %exitcond140, label %polly.loop_preheader87.preheader, label %polly.loop_preheader56, !llvm.loop !60

polly.loop_preheader87.preheader:                 ; preds = %polly.loop_exit57
  br label %polly.loop_preheader87

polly.loop_header55:                              ; preds = %polly.loop_exit63, %polly.loop_preheader56
  %polly.indvar58 = phi i64 [ 0, %polly.loop_preheader56 ], [ %polly.indvar_next59, %polly.loop_exit63 ]
  %0 = shl i64 %polly.indvar58, 5
  %1 = shl i64 %polly.indvar58, 3
  %2 = add nuw nsw i64 %1, -500
  %3 = icmp sgt i64 %2, -8
  %smax = select i1 %3, i64 %2, i64 -8
  %4 = mul i64 %smax, -16
  br label %polly.loop_header61

polly.loop_exit63:                                ; preds = %polly.loop_header61
  %polly.indvar_next59 = add nuw nsw i64 %polly.indvar58, 1
  %exitcond139 = icmp eq i64 %polly.indvar_next59, 63
  br i1 %exitcond139, label %polly.loop_exit57, label %polly.loop_header55

polly.loop_preheader56:                           ; preds = %polly.loop_exit57, %entry
  %polly.indvar = phi i64 [ 0, %entry ], [ %polly.indvar_next, %polly.loop_exit57 ]
  %5 = shl i64 %polly.indvar, 5
  %6 = mul nsw i64 %polly.indvar, -32
  %7 = add nsw i64 %6, 1999
  %8 = icmp sgt i64 %7, 31
  %9 = select i1 %8, i64 31, i64 %7
  %polly.adjust_ub = add i64 %9, -1
  br label %polly.loop_header55

polly.loop_header61:                              ; preds = %polly.loop_header61, %polly.loop_header55
  %polly.indvar64 = phi i64 [ 0, %polly.loop_header55 ], [ %polly.indvar_next65, %polly.loop_header61 ]
  %10 = add nuw nsw i64 %5, %polly.indvar64
  %scevgep = getelementptr [2000 x [2000 x i32]], [2000 x [2000 x i32]]* @C, i64 0, i64 %10, i64 %0
  %scevgep138 = bitcast i32* %scevgep to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep138, i8 0, i64 %4, i32 16, i1 false)
  %polly.indvar_next65 = add nuw nsw i64 %polly.indvar64, 1
  %polly.loop_cond66 = icmp sgt i64 %polly.indvar64, %polly.adjust_ub
  br i1 %polly.loop_cond66, label %polly.loop_exit63, label %polly.loop_header61

polly.loop_exit88:                                ; preds = %polly.loop_exit94
  %polly.indvar_next84 = add nuw nsw i64 %polly.indvar83, 1
  %exitcond134 = icmp eq i64 %polly.indvar_next84, 63
  br i1 %exitcond134, label %polly.exiting, label %polly.loop_preheader87, !llvm.loop !61

polly.loop_exit94:                                ; preds = %polly.loop_exit100
  %polly.indvar_next90 = add nuw nsw i64 %polly.indvar89, 1
  %exitcond133 = icmp eq i64 %polly.indvar_next90, 63
  br i1 %exitcond133, label %polly.loop_exit88, label %polly.loop_preheader93

polly.loop_preheader87:                           ; preds = %polly.loop_preheader87.preheader, %polly.loop_exit88
  %polly.indvar83 = phi i64 [ %polly.indvar_next84, %polly.loop_exit88 ], [ 0, %polly.loop_preheader87.preheader ]
  %11 = mul nsw i64 %polly.indvar83, -32
  %12 = add nsw i64 %11, 1999
  %13 = icmp sgt i64 %12, 31
  %14 = select i1 %13, i64 31, i64 %12
  %15 = shl nsw i64 %polly.indvar83, 5
  %polly.adjust_ub103 = add i64 %14, -1
  br label %polly.loop_preheader93

polly.loop_header92:                              ; preds = %polly.loop_exit100, %polly.loop_preheader93
  %polly.indvar95 = phi i64 [ 0, %polly.loop_preheader93 ], [ %polly.indvar_next96, %polly.loop_exit100 ]
  %16 = mul nsw i64 %polly.indvar95, -8
  %17 = add nsw i64 %16, 499
  %18 = icmp sgt i64 %17, 7
  %19 = select i1 %18, i64 7, i64 %17
  %20 = shl i64 %polly.indvar95, 5
  %polly.adjust_ub117 = add i64 %19, -1
  br label %polly.loop_header98

polly.loop_exit100:                               ; preds = %polly.loop_exit107
  %polly.indvar_next96 = add nuw nsw i64 %polly.indvar95, 1
  %exitcond = icmp eq i64 %polly.indvar_next96, 63
  br i1 %exitcond, label %polly.loop_exit94, label %polly.loop_header92

polly.loop_preheader93:                           ; preds = %polly.loop_exit94, %polly.loop_preheader87
  %polly.indvar89 = phi i64 [ 0, %polly.loop_preheader87 ], [ %polly.indvar_next90, %polly.loop_exit94 ]
  %21 = mul nsw i64 %polly.indvar89, -32
  %22 = add nsw i64 %21, 1999
  %23 = icmp sgt i64 %22, 31
  %24 = select i1 %23, i64 31, i64 %22
  %25 = shl nsw i64 %polly.indvar89, 5
  %polly.adjust_ub110 = add i64 %24, -1
  br label %polly.loop_header92

polly.loop_header98:                              ; preds = %polly.loop_exit107, %polly.loop_header92
  %polly.indvar101 = phi i64 [ 0, %polly.loop_header92 ], [ %polly.indvar_next102, %polly.loop_exit107 ]
  %26 = add nuw nsw i64 %polly.indvar101, %15
  br label %polly.loop_header105

polly.loop_exit107:                               ; preds = %polly.loop_exit114
  %polly.indvar_next102 = add nuw nsw i64 %polly.indvar101, 1
  %polly.loop_cond104 = icmp sgt i64 %polly.indvar101, %polly.adjust_ub103
  br i1 %polly.loop_cond104, label %polly.loop_exit100, label %polly.loop_header98

polly.loop_header105:                             ; preds = %polly.loop_exit114, %polly.loop_header98
  %polly.indvar108 = phi i64 [ 0, %polly.loop_header98 ], [ %polly.indvar_next109, %polly.loop_exit114 ]
  %27 = add nuw nsw i64 %polly.indvar108, %25
  %scevgep125 = getelementptr [2000 x [2000 x i32]], [2000 x [2000 x i32]]* @C, i64 0, i64 %26, i64 %27
  %scevgep125.promoted131 = load i32, i32* %scevgep125, align 4, !alias.scope !62, !noalias !64
  br label %polly.loop_preheader120

polly.loop_exit114:                               ; preds = %polly.loop_preheader120
  %p_add.3.lcssa = phi i32 [ %p_add.3, %polly.loop_preheader120 ]
  store i32 %p_add.3.lcssa, i32* %scevgep125, align 4, !alias.scope !62, !noalias !64
  %polly.indvar_next109 = add nuw nsw i64 %polly.indvar108, 1
  %polly.loop_cond111 = icmp sgt i64 %polly.indvar108, %polly.adjust_ub110
  br i1 %polly.loop_cond111, label %polly.loop_exit107, label %polly.loop_header105

polly.loop_preheader120:                          ; preds = %polly.loop_header105, %polly.loop_preheader120
  %p_add.lcssa132 = phi i32 [ %scevgep125.promoted131, %polly.loop_header105 ], [ %p_add.3, %polly.loop_preheader120 ]
  %polly.indvar115 = phi i64 [ 0, %polly.loop_header105 ], [ %polly.indvar_next116, %polly.loop_preheader120 ]
  %28 = shl i64 %polly.indvar115, 2
  %29 = add nuw nsw i64 %28, %20
  %scevgep126 = getelementptr [2000 x [2000 x i32]], [2000 x [2000 x i32]]* @A, i64 0, i64 %26, i64 %29
  %_p_scalar_127 = load i32, i32* %scevgep126, align 16, !alias.scope !66, !noalias !67, !llvm.mem.parallel_loop_access !68
  %scevgep128 = getelementptr [2000 x [2000 x i32]], [2000 x [2000 x i32]]* @B, i64 0, i64 %29, i64 %27
  %_p_scalar_129 = load i32, i32* %scevgep128, align 4, !alias.scope !65, !noalias !70, !llvm.mem.parallel_loop_access !68
  %p_mul = mul nsw i32 %_p_scalar_129, %_p_scalar_127, !dbg !71
  %p_add = add nsw i32 %p_mul, %p_add.lcssa132, !dbg !80
  %30 = or i64 %29, 1
  %scevgep126.1 = getelementptr [2000 x [2000 x i32]], [2000 x [2000 x i32]]* @A, i64 0, i64 %26, i64 %30
  %_p_scalar_127.1 = load i32, i32* %scevgep126.1, align 4, !alias.scope !66, !noalias !67, !llvm.mem.parallel_loop_access !68
  %scevgep128.1 = getelementptr [2000 x [2000 x i32]], [2000 x [2000 x i32]]* @B, i64 0, i64 %30, i64 %27
  %_p_scalar_129.1 = load i32, i32* %scevgep128.1, align 4, !alias.scope !65, !noalias !70, !llvm.mem.parallel_loop_access !68
  %p_mul.1 = mul nsw i32 %_p_scalar_129.1, %_p_scalar_127.1, !dbg !71
  %p_add.1 = add nsw i32 %p_mul.1, %p_add, !dbg !80
  %31 = or i64 %29, 2
  %scevgep126.2 = getelementptr [2000 x [2000 x i32]], [2000 x [2000 x i32]]* @A, i64 0, i64 %26, i64 %31
  %_p_scalar_127.2 = load i32, i32* %scevgep126.2, align 8, !alias.scope !66, !noalias !67, !llvm.mem.parallel_loop_access !68
  %scevgep128.2 = getelementptr [2000 x [2000 x i32]], [2000 x [2000 x i32]]* @B, i64 0, i64 %31, i64 %27
  %_p_scalar_129.2 = load i32, i32* %scevgep128.2, align 4, !alias.scope !65, !noalias !70, !llvm.mem.parallel_loop_access !68
  %p_mul.2 = mul nsw i32 %_p_scalar_129.2, %_p_scalar_127.2, !dbg !71
  %p_add.2 = add nsw i32 %p_mul.2, %p_add.1, !dbg !80
  %32 = or i64 %29, 3
  %scevgep126.3 = getelementptr [2000 x [2000 x i32]], [2000 x [2000 x i32]]* @A, i64 0, i64 %26, i64 %32
  %_p_scalar_127.3 = load i32, i32* %scevgep126.3, align 4, !alias.scope !66, !noalias !67, !llvm.mem.parallel_loop_access !68
  %scevgep128.3 = getelementptr [2000 x [2000 x i32]], [2000 x [2000 x i32]]* @B, i64 0, i64 %32, i64 %27
  %_p_scalar_129.3 = load i32, i32* %scevgep128.3, align 4, !alias.scope !65, !noalias !70, !llvm.mem.parallel_loop_access !68
  %p_mul.3 = mul nsw i32 %_p_scalar_129.3, %_p_scalar_127.3, !dbg !71
  %p_add.3 = add nsw i32 %p_mul.3, %p_add.2, !dbg !80
  %polly.indvar_next116 = add nuw nsw i64 %polly.indvar115, 1
  %polly.loop_cond118 = icmp sgt i64 %polly.indvar115, %polly.adjust_ub117
  br i1 %polly.loop_cond118, label %polly.loop_exit114, label %polly.loop_preheader120
}

; Function Attrs: nounwind uwtable
define i32 @main() #2 !dbg !18 {
entry:
  tail call void @init(), !dbg !81
  tail call void @mat_mult(), !dbg !82
  %call = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i64 0, i64 0), i32 2000, i32 2000), !dbg !83
  %0 = load i32, i32* getelementptr inbounds ([2000 x [2000 x i32]], [2000 x [2000 x i32]]* @A, i64 0, i64 1999, i64 1999), align 4, !dbg !84, !tbaa !52
  %1 = load i32, i32* getelementptr inbounds ([2000 x [2000 x i32]], [2000 x [2000 x i32]]* @B, i64 0, i64 1999, i64 1999), align 4, !dbg !85, !tbaa !52
  %2 = load i32, i32* getelementptr inbounds ([2000 x [2000 x i32]], [2000 x [2000 x i32]]* @C, i64 0, i64 1999, i64 1999), align 4, !dbg !86, !tbaa !52
  %call1 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([47 x i8], [47 x i8]* @.str.1, i64 0, i64 0), i32 1999, i32 1999, i32 %0, i32 1999, i32 1999, i32 %1, i32 1999, i32 1999, i32 %2), !dbg !87
  ret i32 0, !dbg !88
}

; Function Attrs: nounwind
declare i32 @printf(i8* nocapture readonly, ...) #1

; Function Attrs: nounwind readnone
declare void @llvm.dbg.value(metadata, i64, metadata, metadata) #3

; Function Attrs: argmemonly nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture readonly, i64, i32, i1) #4

; Function Attrs: argmemonly nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture, i8, i64, i32, i1) #4

attributes #0 = { noinline nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "polly-optimized" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind readnone }
attributes #4 = { argmemonly nounwind }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!29, !30}
!llvm.ident = !{!31}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 3.9.0 (http://llvm.org/git/clang.git e177b4a63ca92c5fec010986944530688e104074) (http://llvm.org/git/llvm.git fcd97ccb03712372fe95f1732638de5ed3fcabe8)", isOptimized: true, runtimeVersion: 0, emissionKind: 1, enums: !2, retainedTypes: !3, subprograms: !5, globals: !21)
!1 = !DIFile(filename: "MatrixMult.c", directory: "/home/sam/workspace/WhileyOpenCL/polly/MatrixMult/impl/handwritten")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, align: 32, encoding: DW_ATE_unsigned)
!5 = !{!6, !13, !18}
!6 = distinct !DISubprogram(name: "init", scope: !1, file: !1, line: 12, type: !7, isLocal: false, isDefinition: true, scopeLine: 12, isOptimized: true, variables: !9)
!7 = !DISubroutineType(types: !8)
!8 = !{null}
!9 = !{!10, !12}
!10 = !DILocalVariable(name: "i", scope: !6, file: !1, line: 13, type: !11)
!11 = !DIBasicType(name: "int", size: 32, align: 32, encoding: DW_ATE_signed)
!12 = !DILocalVariable(name: "j", scope: !6, file: !1, line: 14, type: !11)
!13 = distinct !DISubprogram(name: "mat_mult", scope: !1, file: !1, line: 35, type: !7, isLocal: false, isDefinition: true, scopeLine: 35, isOptimized: true, variables: !14)
!14 = !{!15, !16, !17}
!15 = !DILocalVariable(name: "i", scope: !13, file: !1, line: 36, type: !11)
!16 = !DILocalVariable(name: "j", scope: !13, file: !1, line: 36, type: !11)
!17 = !DILocalVariable(name: "k", scope: !13, file: !1, line: 36, type: !11)
!18 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 59, type: !19, isLocal: false, isDefinition: true, scopeLine: 60, isOptimized: true, variables: !2)
!19 = !DISubroutineType(types: !20)
!20 = !{!11}
!21 = !{!22, !26, !27, !28}
!22 = !DIGlobalVariable(name: "A", scope: !0, file: !1, line: 7, type: !23, isLocal: false, isDefinition: true, variable: [2000 x [2000 x i32]]* @A)
!23 = !DICompositeType(tag: DW_TAG_array_type, baseType: !11, size: 128000000, align: 32, elements: !24)
!24 = !{!25, !25}
!25 = !DISubrange(count: 2000)
!26 = !DIGlobalVariable(name: "B", scope: !0, file: !1, line: 8, type: !23, isLocal: false, isDefinition: true, variable: [2000 x [2000 x i32]]* @B)
!27 = !DIGlobalVariable(name: "C", scope: !0, file: !1, line: 9, type: !23, isLocal: false, isDefinition: true, variable: [2000 x [2000 x i32]]* @C)
!28 = !DIGlobalVariable(name: "R", scope: !0, file: !1, line: 10, type: !23, isLocal: false, isDefinition: true, variable: [2000 x [2000 x i32]]* @R)
!29 = !{i32 2, !"Dwarf Version", i32 4}
!30 = !{i32 2, !"Debug Info Version", i32 3}
!31 = !{!"clang version 3.9.0 (http://llvm.org/git/clang.git e177b4a63ca92c5fec010986944530688e104074) (http://llvm.org/git/llvm.git fcd97ccb03712372fe95f1732638de5ed3fcabe8)"}
!32 = !DILocation(line: 17, column: 22, scope: !6)
!33 = !DILocation(line: 17, column: 11, scope: !6)
!34 = !DILocation(line: 17, column: 5, scope: !35)
!35 = !DILexicalBlockFile(scope: !6, file: !1, discriminator: 1)
!36 = !DIExpression()
!37 = !DILocation(line: 13, column: 9, scope: !6)
!38 = !DILocation(line: 18, column: 5, scope: !39)
!39 = !DILexicalBlockFile(scope: !40, file: !1, discriminator: 1)
!40 = distinct !DILexicalBlock(scope: !41, file: !1, line: 18, column: 5)
!41 = distinct !DILexicalBlock(scope: !6, file: !1, line: 18, column: 5)
!42 = !DILocation(line: 19, column: 9, scope: !43)
!43 = !DILexicalBlockFile(scope: !44, file: !1, discriminator: 1)
!44 = distinct !DILexicalBlock(scope: !45, file: !1, line: 19, column: 9)
!45 = distinct !DILexicalBlock(scope: !46, file: !1, line: 19, column: 9)
!46 = distinct !DILexicalBlock(scope: !40, file: !1, line: 18, column: 25)
!47 = !DILocation(line: 21, column: 23, scope: !48)
!48 = distinct !DILexicalBlock(scope: !44, file: !1, line: 19, column: 29)
!49 = !DILocation(line: 21, column: 29, scope: !48)
!50 = !DILocation(line: 21, column: 13, scope: !48)
!51 = !DILocation(line: 21, column: 21, scope: !48)
!52 = !{!53, !53, i64 0}
!53 = !{!"int", !54, i64 0}
!54 = !{!"omnipotent char", !55, i64 0}
!55 = !{!"Simple C/C++ TBAA"}
!56 = !DILocation(line: 33, column: 1, scope: !6)
!57 = distinct !{!57}
!58 = !DILocation(line: 36, column: 9, scope: !13)
!59 = !DILocation(line: 44, column: 1, scope: !13)
!60 = distinct !{!60}
!61 = distinct !{!61}
!62 = distinct !{!62, !63, !"polly.alias.scope.C"}
!63 = distinct !{!63, !"polly.alias.scope.domain"}
!64 = !{!65, !66}
!65 = distinct !{!65, !63, !"polly.alias.scope.B"}
!66 = distinct !{!66, !63, !"polly.alias.scope.A"}
!67 = !{!65, !62}
!68 = !{!61, !69}
!69 = distinct !{!69}
!70 = !{!66, !62}
!71 = !DILocation(line: 41, column: 45, scope: !72)
!72 = distinct !DILexicalBlock(scope: !73, file: !1, line: 40, column: 13)
!73 = distinct !DILexicalBlock(scope: !74, file: !1, line: 40, column: 13)
!74 = distinct !DILexicalBlock(scope: !75, file: !1, line: 38, column: 29)
!75 = distinct !DILexicalBlock(scope: !76, file: !1, line: 38, column: 9)
!76 = distinct !DILexicalBlock(scope: !77, file: !1, line: 38, column: 9)
!77 = distinct !DILexicalBlock(scope: !78, file: !1, line: 37, column: 25)
!78 = distinct !DILexicalBlock(scope: !79, file: !1, line: 37, column: 5)
!79 = distinct !DILexicalBlock(scope: !13, file: !1, line: 37, column: 5)
!80 = !DILocation(line: 41, column: 35, scope: !72)
!81 = !DILocation(line: 61, column: 5, scope: !18)
!82 = !DILocation(line: 62, column: 5, scope: !18)
!83 = !DILocation(line: 64, column: 5, scope: !18)
!84 = !DILocation(line: 66, column: 19, scope: !18)
!85 = !DILocation(line: 67, column: 19, scope: !18)
!86 = !DILocation(line: 68, column: 19, scope: !18)
!87 = !DILocation(line: 65, column: 5, scope: !18)
!88 = !DILocation(line: 69, column: 5, scope: !18)
