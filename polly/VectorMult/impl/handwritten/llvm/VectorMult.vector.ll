; ModuleID = 'VectorMult.preopt.ll'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [34 x i8] c"fail to multiply two unit vectors\00", align 1
@.str.1 = private unnamed_addr constant [1 x i8] zeroinitializer, align 1
@.str.2 = private unnamed_addr constant [100 x i8] c"Pass the %'lld vector multiplication test case with local vector size = %d\0AThe Dot Product = %'lld\0A\00", align 1

; Function Attrs: nounwind uwtable
define i32 @main(i32 %argc, i8** nocapture readnone %args) #0 !dbg !8 {
entry:
  %p_add45.4.s2a = alloca i64
  %total.02.phiops.0.phiops = alloca i64
  %p_add30.3.lcssa.phiops = alloca i32
  %tmp.04.phiops.0.phiops = alloca i32
  tail call void @llvm.dbg.value(metadata i32 %argc, i64 0, metadata !17, metadata !18), !dbg !19
  tail call void @llvm.dbg.value(metadata i8** %args, i64 0, metadata !20, metadata !18), !dbg !21
  %call = tail call noalias i8* @malloc(i64 41943040) #4, !dbg !22
  %call1 = tail call noalias i8* @malloc(i64 41943040) #4, !dbg !23
  %call2 = tail call noalias i8* @malloc(i64 40960) #4, !dbg !24
  tail call void @llvm.dbg.value(metadata i32* undef, i64 0, metadata !25, metadata !18), !dbg !26
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !27, metadata !18), !dbg !28
  br label %polly.split_new_and_old

if.then:                                          ; preds = %polly.exiting
  %call51 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([34 x i8], [34 x i8]* @.str, i64 0, i64 0)) #4, !dbg !29
  tail call void @exit(i32 -2) #5, !dbg !32
  unreachable, !dbg !32

if.end:                                           ; preds = %polly.exiting
  %call52 = tail call i8* @setlocale(i32 6, i8* getelementptr inbounds ([1 x i8], [1 x i8]* @.str.1, i64 0, i64 0)) #4, !dbg !33
  %call53 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([100 x i8], [100 x i8]* @.str.2, i64 0, i64 0), i64 10485760, i32 1024, i64 10485760) #4, !dbg !34
  ret i32 0, !dbg !35

polly.merge_new_and_old:                          ; preds = %polly.exiting65, %polly.stmt.for.inc46
  %p_add45.4.merge = phi i64 [ %p_add45.4.final_reload, %polly.exiting65 ], [ %p_add45.4, %polly.stmt.for.inc46 ]
  br label %polly.exiting, !dbg !36

polly.exiting:                                    ; preds = %polly.merge_new_and_old
  %p_add45.4.lcssa = phi i64 [ %p_add45.4.merge, %polly.merge_new_and_old ]
  %cmp49 = icmp eq i64 %p_add45.4.lcssa, 10485760, !dbg !36
  br i1 %cmp49, label %if.end, label %if.then, !dbg !37

polly.loop_exit3:                                 ; preds = %polly.loop_exit9
  %polly.indvar_next = add nuw nsw i64 %polly.indvar, 1
  %exitcond64 = icmp eq i64 %polly.indvar_next, 320
  br i1 %exitcond64, label %polly.loop_preheader35.preheader, label %polly.loop_preheader2, !llvm.loop !38

polly.loop_preheader35.preheader:                 ; preds = %polly.loop_exit3
  br label %polly.loop_preheader35

polly.loop_exit9:                                 ; preds = %polly.loop_exit15
  %polly.indvar_next5 = add nuw nsw i64 %polly.indvar4, 1
  %exitcond63 = icmp eq i64 %polly.indvar_next5, 32
  br i1 %exitcond63, label %polly.loop_exit3, label %polly.loop_preheader8

polly.split_new_and_old:                          ; preds = %entry
  br i1 true, label %polly.start, label %polly.loop_preheader2

polly.loop_preheader2:                            ; preds = %polly.split_new_and_old, %polly.loop_exit3
  %polly.indvar = phi i64 [ %polly.indvar_next, %polly.loop_exit3 ], [ 0, %polly.split_new_and_old ]
  %0 = shl i64 %polly.indvar, 5
  br label %polly.loop_preheader8

polly.loop_exit15:                                ; preds = %polly.loop_preheader20
  %polly.indvar_next11 = add nuw nsw i64 %polly.indvar10, 1
  %exitcond62 = icmp eq i64 %polly.indvar_next11, 32
  br i1 %exitcond62, label %polly.loop_exit9, label %polly.loop_preheader14

polly.loop_preheader8:                            ; preds = %polly.loop_exit9, %polly.loop_preheader2
  %polly.indvar4 = phi i64 [ 0, %polly.loop_preheader2 ], [ %polly.indvar_next5, %polly.loop_exit9 ]
  %1 = shl i64 %polly.indvar4, 5
  br label %polly.loop_preheader14

polly.loop_preheader14:                           ; preds = %polly.loop_exit15, %polly.loop_preheader8
  %polly.indvar10 = phi i64 [ 0, %polly.loop_preheader8 ], [ %polly.indvar_next11, %polly.loop_exit15 ]
  %2 = add nuw nsw i64 %polly.indvar10, %0
  %3 = shl i64 %2, 12
  br label %polly.loop_preheader20

polly.loop_preheader20:                           ; preds = %polly.loop_preheader20, %polly.loop_preheader14
  %polly.indvar16 = phi i64 [ 0, %polly.loop_preheader14 ], [ %polly.indvar_next17, %polly.loop_preheader20 ]
  %4 = shl i64 %polly.indvar16, 2
  %5 = add nuw nsw i64 %4, %1
  %6 = shl i64 %5, 2
  %7 = add nuw nsw i64 %6, %3
  %scevgep = getelementptr i8, i8* %call, i64 %7
  %scevgep25 = bitcast i8* %scevgep to i32*
  store i32 1, i32* %scevgep25, align 4, !alias.scope !39, !noalias !41, !llvm.mem.parallel_loop_access !48
  %scevgep26 = getelementptr i8, i8* %call1, i64 %7
  %scevgep2627 = bitcast i8* %scevgep26 to i32*
  store i32 1, i32* %scevgep2627, align 4, !alias.scope !44, !noalias !50, !llvm.mem.parallel_loop_access !48
  %8 = shl i64 %5, 2
  %9 = or i64 %8, 4
  %10 = add nuw nsw i64 %9, %3
  %scevgep.1 = getelementptr i8, i8* %call, i64 %10
  %scevgep25.1 = bitcast i8* %scevgep.1 to i32*
  store i32 1, i32* %scevgep25.1, align 4, !alias.scope !39, !noalias !41, !llvm.mem.parallel_loop_access !48
  %scevgep26.1 = getelementptr i8, i8* %call1, i64 %10
  %scevgep2627.1 = bitcast i8* %scevgep26.1 to i32*
  store i32 1, i32* %scevgep2627.1, align 4, !alias.scope !44, !noalias !50, !llvm.mem.parallel_loop_access !48
  %11 = shl i64 %5, 2
  %12 = or i64 %11, 8
  %13 = add nuw nsw i64 %12, %3
  %scevgep.2 = getelementptr i8, i8* %call, i64 %13
  %scevgep25.2 = bitcast i8* %scevgep.2 to i32*
  store i32 1, i32* %scevgep25.2, align 4, !alias.scope !39, !noalias !41, !llvm.mem.parallel_loop_access !48
  %scevgep26.2 = getelementptr i8, i8* %call1, i64 %13
  %scevgep2627.2 = bitcast i8* %scevgep26.2 to i32*
  store i32 1, i32* %scevgep2627.2, align 4, !alias.scope !44, !noalias !50, !llvm.mem.parallel_loop_access !48
  %14 = shl i64 %5, 2
  %15 = or i64 %14, 12
  %16 = add nuw nsw i64 %15, %3
  %scevgep.3 = getelementptr i8, i8* %call, i64 %16
  %scevgep25.3 = bitcast i8* %scevgep.3 to i32*
  store i32 1, i32* %scevgep25.3, align 4, !alias.scope !39, !noalias !41, !llvm.mem.parallel_loop_access !48
  %scevgep26.3 = getelementptr i8, i8* %call1, i64 %16
  %scevgep2627.3 = bitcast i8* %scevgep26.3 to i32*
  store i32 1, i32* %scevgep2627.3, align 4, !alias.scope !44, !noalias !50, !llvm.mem.parallel_loop_access !48
  %polly.indvar_next17 = add nuw nsw i64 %polly.indvar16, 1
  %exitcond61 = icmp eq i64 %polly.indvar_next17, 8
  br i1 %exitcond61, label %polly.loop_exit15, label %polly.loop_preheader20

polly.stmt.for.end33:                             ; preds = %polly.stmt.for.inc31
  %p_add30.3.lcssa = phi i32 [ %p_add30.3, %polly.stmt.for.inc31 ]
  %17 = shl i64 %polly.indvar31, 2
  %scevgep47 = getelementptr i8, i8* %call2, i64 %17
  %scevgep4748 = bitcast i8* %scevgep47 to i32*
  store i32 %p_add30.3.lcssa, i32* %scevgep4748, align 4, !alias.scope !43, !noalias !51
  %polly.indvar_next32 = add nuw nsw i64 %polly.indvar31, 1
  %exitcond59 = icmp eq i64 %polly.indvar_next32, 10240
  br i1 %exitcond59, label %polly.stmt.for.inc46.preheader, label %polly.loop_preheader35

polly.stmt.for.inc46.preheader:                   ; preds = %polly.stmt.for.end33
  br label %polly.stmt.for.inc46

polly.stmt.for.inc31:                             ; preds = %polly.stmt.for.inc31, %polly.loop_preheader35
  %tmp.04.phiops.0 = phi i32 [ 0, %polly.loop_preheader35 ], [ %p_add30.3, %polly.stmt.for.inc31 ]
  %polly.indvar37 = phi i64 [ 0, %polly.loop_preheader35 ], [ %polly.indvar_next38.3, %polly.stmt.for.inc31 ]
  %18 = shl i64 %polly.indvar37, 2
  %scevgep41 = getelementptr i8, i8* %scevgep40, i64 %18
  %scevgep4142 = bitcast i8* %scevgep41 to i32*
  %_p_scalar_ = load i32, i32* %scevgep4142, align 4, !alias.scope !39, !noalias !41
  %scevgep44 = getelementptr i8, i8* %scevgep43, i64 %18
  %scevgep4445 = bitcast i8* %scevgep44 to i32*
  %_p_scalar_46 = load i32, i32* %scevgep4445, align 4, !alias.scope !44, !noalias !50
  %p_mul29 = mul nsw i32 %_p_scalar_46, %_p_scalar_, !dbg !52
  %p_add30 = add nsw i32 %p_mul29, %tmp.04.phiops.0, !dbg !59
  %polly.indvar_next38 = shl i64 %polly.indvar37, 2
  %19 = or i64 %polly.indvar_next38, 4
  %scevgep41.1 = getelementptr i8, i8* %scevgep40, i64 %19
  %scevgep4142.1 = bitcast i8* %scevgep41.1 to i32*
  %_p_scalar_.1 = load i32, i32* %scevgep4142.1, align 4, !alias.scope !39, !noalias !41
  %scevgep44.1 = getelementptr i8, i8* %scevgep43, i64 %19
  %scevgep4445.1 = bitcast i8* %scevgep44.1 to i32*
  %_p_scalar_46.1 = load i32, i32* %scevgep4445.1, align 4, !alias.scope !44, !noalias !50
  %p_mul29.1 = mul nsw i32 %_p_scalar_46.1, %_p_scalar_.1, !dbg !52
  %p_add30.1 = add nsw i32 %p_mul29.1, %p_add30, !dbg !59
  %polly.indvar_next38.1 = shl i64 %polly.indvar37, 2
  %20 = or i64 %polly.indvar_next38.1, 8
  %scevgep41.2 = getelementptr i8, i8* %scevgep40, i64 %20
  %scevgep4142.2 = bitcast i8* %scevgep41.2 to i32*
  %_p_scalar_.2 = load i32, i32* %scevgep4142.2, align 4, !alias.scope !39, !noalias !41
  %scevgep44.2 = getelementptr i8, i8* %scevgep43, i64 %20
  %scevgep4445.2 = bitcast i8* %scevgep44.2 to i32*
  %_p_scalar_46.2 = load i32, i32* %scevgep4445.2, align 4, !alias.scope !44, !noalias !50
  %p_mul29.2 = mul nsw i32 %_p_scalar_46.2, %_p_scalar_.2, !dbg !52
  %p_add30.2 = add nsw i32 %p_mul29.2, %p_add30.1, !dbg !59
  %polly.indvar_next38.2 = shl i64 %polly.indvar37, 2
  %21 = or i64 %polly.indvar_next38.2, 12
  %scevgep41.3 = getelementptr i8, i8* %scevgep40, i64 %21
  %scevgep4142.3 = bitcast i8* %scevgep41.3 to i32*
  %_p_scalar_.3 = load i32, i32* %scevgep4142.3, align 4, !alias.scope !39, !noalias !41
  %scevgep44.3 = getelementptr i8, i8* %scevgep43, i64 %21
  %scevgep4445.3 = bitcast i8* %scevgep44.3 to i32*
  %_p_scalar_46.3 = load i32, i32* %scevgep4445.3, align 4, !alias.scope !44, !noalias !50
  %p_mul29.3 = mul nsw i32 %_p_scalar_46.3, %_p_scalar_.3, !dbg !52
  %p_add30.3 = add nsw i32 %p_mul29.3, %p_add30.2, !dbg !59
  %polly.indvar_next38.3 = add nsw i64 %polly.indvar37, 4
  %exitcond58.3 = icmp eq i64 %polly.indvar_next38.3, 1024
  br i1 %exitcond58.3, label %polly.stmt.for.end33, label %polly.stmt.for.inc31

polly.loop_preheader35:                           ; preds = %polly.loop_preheader35.preheader, %polly.stmt.for.end33
  %polly.indvar31 = phi i64 [ %polly.indvar_next32, %polly.stmt.for.end33 ], [ 0, %polly.loop_preheader35.preheader ]
  %22 = shl i64 %polly.indvar31, 12
  %scevgep40 = getelementptr i8, i8* %call, i64 %22
  %scevgep43 = getelementptr i8, i8* %call1, i64 %22
  br label %polly.stmt.for.inc31

polly.stmt.for.inc46:                             ; preds = %polly.stmt.for.inc46, %polly.stmt.for.inc46.preheader
  %total.02.phiops.0 = phi i64 [ 0, %polly.stmt.for.inc46.preheader ], [ %p_add45.4, %polly.stmt.for.inc46 ]
  %polly.indvar52 = phi i64 [ 0, %polly.stmt.for.inc46.preheader ], [ %polly.indvar_next53.4, %polly.stmt.for.inc46 ]
  %23 = shl i64 %polly.indvar52, 2
  %scevgep55 = getelementptr i8, i8* %call2, i64 %23
  %scevgep5556 = bitcast i8* %scevgep55 to i32*
  %_p_scalar_57 = load i32, i32* %scevgep5556, align 4, !alias.scope !43, !noalias !51
  %p_conv44 = sext i32 %_p_scalar_57 to i64, !dbg !60
  %p_add45 = add nsw i64 %p_conv44, %total.02.phiops.0, !dbg !64
  %polly.indvar_next53 = shl i64 %polly.indvar52, 2
  %24 = add i64 %polly.indvar_next53, 4
  %scevgep55.1 = getelementptr i8, i8* %call2, i64 %24
  %scevgep5556.1 = bitcast i8* %scevgep55.1 to i32*
  %_p_scalar_57.1 = load i32, i32* %scevgep5556.1, align 4, !alias.scope !43, !noalias !51
  %p_conv44.1 = sext i32 %_p_scalar_57.1 to i64, !dbg !60
  %p_add45.1 = add nsw i64 %p_conv44.1, %p_add45, !dbg !64
  %polly.indvar_next53.1 = shl i64 %polly.indvar52, 2
  %25 = add i64 %polly.indvar_next53.1, 8
  %scevgep55.2 = getelementptr i8, i8* %call2, i64 %25
  %scevgep5556.2 = bitcast i8* %scevgep55.2 to i32*
  %_p_scalar_57.2 = load i32, i32* %scevgep5556.2, align 4, !alias.scope !43, !noalias !51
  %p_conv44.2 = sext i32 %_p_scalar_57.2 to i64, !dbg !60
  %p_add45.2 = add nsw i64 %p_conv44.2, %p_add45.1, !dbg !64
  %polly.indvar_next53.2 = shl i64 %polly.indvar52, 2
  %26 = add i64 %polly.indvar_next53.2, 12
  %scevgep55.3 = getelementptr i8, i8* %call2, i64 %26
  %scevgep5556.3 = bitcast i8* %scevgep55.3 to i32*
  %_p_scalar_57.3 = load i32, i32* %scevgep5556.3, align 4, !alias.scope !43, !noalias !51
  %p_conv44.3 = sext i32 %_p_scalar_57.3 to i64, !dbg !60
  %p_add45.3 = add nsw i64 %p_conv44.3, %p_add45.2, !dbg !64
  %polly.indvar_next53.3 = shl i64 %polly.indvar52, 2
  %27 = add i64 %polly.indvar_next53.3, 16
  %scevgep55.4 = getelementptr i8, i8* %call2, i64 %27
  %scevgep5556.4 = bitcast i8* %scevgep55.4 to i32*
  %_p_scalar_57.4 = load i32, i32* %scevgep5556.4, align 4, !alias.scope !43, !noalias !51
  %p_conv44.4 = sext i32 %_p_scalar_57.4 to i64, !dbg !60
  %p_add45.4 = add nsw i64 %p_conv44.4, %p_add45.3, !dbg !64
  %polly.indvar_next53.4 = add nsw i64 %polly.indvar52, 5
  %exitcond.4 = icmp eq i64 %polly.indvar_next53.4, 10240
  br i1 %exitcond.4, label %polly.merge_new_and_old, label %polly.stmt.for.inc46

polly.start:                                      ; preds = %polly.split_new_and_old
  br label %polly.loop_preheader

polly.loop_exit:                                  ; preds = %polly.loop_exit70
  br label %polly.loop_preheader133

polly.loop_exit134:                               ; preds = %polly.stmt.polly.stmt.for.end33
  br label %polly.stmt.polly.stmt.for.inc46.preheader

polly.stmt.polly.stmt.for.inc46.preheader:        ; preds = %polly.loop_exit134
  store i64 0, i64* %total.02.phiops.0.phiops
  br label %polly.loop_preheader177

polly.loop_exit178:                               ; preds = %polly.stmt.polly.stmt.for.inc46
  br label %polly.exiting65

polly.exiting65:                                  ; preds = %polly.loop_exit178
  %p_add45.4.final_reload = load i64, i64* %p_add45.4.s2a
  br label %polly.merge_new_and_old

polly.loop_header:                                ; preds = %polly.loop_exit70, %polly.loop_preheader
  %polly.indvar66 = phi i64 [ 0, %polly.loop_preheader ], [ %polly.indvar_next67, %polly.loop_exit70 ]
  br label %polly.loop_preheader69

polly.loop_exit70:                                ; preds = %polly.loop_exit76
  %polly.indvar_next67 = add nsw i64 %polly.indvar66, 1
  %polly.loop_cond = icmp sle i64 %polly.indvar66, 318
  br i1 %polly.loop_cond, label %polly.loop_header, label %polly.loop_exit, !llvm.loop !65

polly.loop_preheader:                             ; preds = %polly.start
  %scevgep96 = getelementptr i8, i8* %call, i64 4
  %scevgep102 = getelementptr i8, i8* %call1, i64 4
  %scevgep108 = getelementptr i8, i8* %call, i64 8
  %scevgep114 = getelementptr i8, i8* %call1, i64 8
  %scevgep120 = getelementptr i8, i8* %call, i64 12
  %scevgep126 = getelementptr i8, i8* %call1, i64 12
  br label %polly.loop_header

polly.loop_header68:                              ; preds = %polly.loop_exit76, %polly.loop_preheader69
  %polly.indvar71 = phi i64 [ 0, %polly.loop_preheader69 ], [ %polly.indvar_next72, %polly.loop_exit76 ]
  br label %polly.loop_preheader75

polly.loop_exit76:                                ; preds = %polly.loop_exit82
  %polly.indvar_next72 = add nsw i64 %polly.indvar71, 1
  %polly.loop_cond73 = icmp sle i64 %polly.indvar71, 30
  br i1 %polly.loop_cond73, label %polly.loop_header68, label %polly.loop_exit70

polly.loop_preheader69:                           ; preds = %polly.loop_header
  %28 = shl i64 %polly.indvar66, 17
  %scevgep86 = getelementptr i8, i8* %call, i64 %28
  %scevgep91 = getelementptr i8, i8* %call1, i64 %28
  %scevgep97 = getelementptr i8, i8* %scevgep96, i64 %28
  %scevgep103 = getelementptr i8, i8* %scevgep102, i64 %28
  %scevgep109 = getelementptr i8, i8* %scevgep108, i64 %28
  %scevgep115 = getelementptr i8, i8* %scevgep114, i64 %28
  %29 = shl i64 %polly.indvar66, 17
  %scevgep121 = getelementptr i8, i8* %scevgep120, i64 %29
  %scevgep127 = getelementptr i8, i8* %scevgep126, i64 %29
  br label %polly.loop_header68

polly.loop_header74:                              ; preds = %polly.loop_exit82, %polly.loop_preheader75
  %polly.indvar77 = phi i64 [ 0, %polly.loop_preheader75 ], [ %polly.indvar_next78, %polly.loop_exit82 ]
  br label %polly.loop_preheader81

polly.loop_exit82:                                ; preds = %polly.stmt.polly.loop_preheader20
  %polly.indvar_next78 = add nsw i64 %polly.indvar77, 1
  %polly.loop_cond79 = icmp sle i64 %polly.indvar77, 30
  br i1 %polly.loop_cond79, label %polly.loop_header74, label %polly.loop_exit76

polly.loop_preheader75:                           ; preds = %polly.loop_header68
  %30 = shl i64 %polly.indvar71, 7
  %scevgep87 = getelementptr i8, i8* %scevgep86, i64 %30
  %scevgep92 = getelementptr i8, i8* %scevgep91, i64 %30
  %scevgep98 = getelementptr i8, i8* %scevgep97, i64 %30
  %scevgep104 = getelementptr i8, i8* %scevgep103, i64 %30
  %scevgep110 = getelementptr i8, i8* %scevgep109, i64 %30
  %scevgep116 = getelementptr i8, i8* %scevgep115, i64 %30
  %31 = shl i64 %polly.indvar71, 7
  %scevgep122 = getelementptr i8, i8* %scevgep121, i64 %31
  %scevgep128 = getelementptr i8, i8* %scevgep127, i64 %31
  br label %polly.loop_header74

polly.loop_header80:                              ; preds = %polly.stmt.polly.loop_preheader20, %polly.loop_preheader81
  %polly.indvar83 = phi i64 [ 0, %polly.loop_preheader81 ], [ %polly.indvar_next84, %polly.stmt.polly.loop_preheader20 ]
  br label %polly.stmt.polly.loop_preheader20

polly.stmt.polly.loop_preheader20:                ; preds = %polly.loop_header80
  %32 = shl i64 %polly.indvar83, 4
  %scevgep89 = getelementptr i8, i8* %scevgep88, i64 %32
  %scevgep8990 = bitcast i8* %scevgep89 to i32*
  store i32 1, i32* %scevgep8990, align 4, !alias.scope !66, !noalias !68, !llvm.mem.parallel_loop_access !65
  %scevgep94 = getelementptr i8, i8* %scevgep93, i64 %32
  %scevgep9495 = bitcast i8* %scevgep94 to i32*
  store i32 1, i32* %scevgep9495, align 4, !alias.scope !71, !noalias !75, !llvm.mem.parallel_loop_access !65
  %33 = shl i64 %polly.indvar83, 4
  %scevgep100 = getelementptr i8, i8* %scevgep99, i64 %33
  %scevgep100101 = bitcast i8* %scevgep100 to i32*
  store i32 1, i32* %scevgep100101, align 4, !alias.scope !66, !noalias !68, !llvm.mem.parallel_loop_access !65
  %scevgep106 = getelementptr i8, i8* %scevgep105, i64 %33
  %scevgep106107 = bitcast i8* %scevgep106 to i32*
  store i32 1, i32* %scevgep106107, align 4, !alias.scope !71, !noalias !75, !llvm.mem.parallel_loop_access !65
  %34 = shl i64 %polly.indvar83, 4
  %scevgep112 = getelementptr i8, i8* %scevgep111, i64 %34
  %scevgep112113 = bitcast i8* %scevgep112 to i32*
  store i32 1, i32* %scevgep112113, align 4, !alias.scope !66, !noalias !68, !llvm.mem.parallel_loop_access !65
  %scevgep118 = getelementptr i8, i8* %scevgep117, i64 %34
  %scevgep118119 = bitcast i8* %scevgep118 to i32*
  store i32 1, i32* %scevgep118119, align 4, !alias.scope !71, !noalias !75, !llvm.mem.parallel_loop_access !65
  %35 = shl i64 %polly.indvar83, 4
  %scevgep124 = getelementptr i8, i8* %scevgep123, i64 %35
  %scevgep124125 = bitcast i8* %scevgep124 to i32*
  store i32 1, i32* %scevgep124125, align 4, !alias.scope !66, !noalias !68, !llvm.mem.parallel_loop_access !65
  %scevgep130 = getelementptr i8, i8* %scevgep129, i64 %35
  %scevgep130131 = bitcast i8* %scevgep130 to i32*
  store i32 1, i32* %scevgep130131, align 4, !alias.scope !71, !noalias !75, !llvm.mem.parallel_loop_access !65
  %36 = add i64 %polly.indvar83, 1
  %p_exitcond61 = icmp eq i64 %36, 8
  %polly.indvar_next84 = add nsw i64 %polly.indvar83, 1
  %polly.loop_cond85 = icmp sle i64 %polly.indvar83, 6
  br i1 %polly.loop_cond85, label %polly.loop_header80, label %polly.loop_exit82

polly.loop_preheader81:                           ; preds = %polly.loop_header74
  %37 = shl i64 %polly.indvar77, 12
  %scevgep88 = getelementptr i8, i8* %scevgep87, i64 %37
  %scevgep93 = getelementptr i8, i8* %scevgep92, i64 %37
  %scevgep99 = getelementptr i8, i8* %scevgep98, i64 %37
  %scevgep105 = getelementptr i8, i8* %scevgep104, i64 %37
  %scevgep111 = getelementptr i8, i8* %scevgep110, i64 %37
  %scevgep117 = getelementptr i8, i8* %scevgep116, i64 %37
  %38 = shl i64 %polly.indvar77, 12
  %scevgep123 = getelementptr i8, i8* %scevgep122, i64 %38
  %scevgep129 = getelementptr i8, i8* %scevgep128, i64 %38
  br label %polly.loop_header80

polly.loop_header132:                             ; preds = %polly.stmt.polly.stmt.for.end33, %polly.loop_preheader133
  %polly.indvar135 = phi i64 [ 0, %polly.loop_preheader133 ], [ %polly.indvar_next136, %polly.stmt.polly.stmt.for.end33 ]
  br label %polly.stmt.polly.loop_preheader35

polly.stmt.polly.loop_preheader35:                ; preds = %polly.loop_header132
  store i32 0, i32* %tmp.04.phiops.0.phiops
  br label %polly.loop_preheader139

polly.loop_exit140:                               ; preds = %polly.stmt.polly.stmt.for.inc31
  br label %polly.stmt.polly.stmt.for.end33

polly.stmt.polly.stmt.for.end33:                  ; preds = %polly.loop_exit140
  %p_add30.3.lcssa.phiops.reload = load i32, i32* %p_add30.3.lcssa.phiops
  %39 = shl i64 %polly.indvar135, 2
  %scevgep174 = getelementptr i8, i8* %call2, i64 %39
  %scevgep174175 = bitcast i8* %scevgep174 to i32*
  store i32 %p_add30.3.lcssa.phiops.reload, i32* %scevgep174175, align 4, !alias.scope !70, !noalias !76
  %40 = add i64 %polly.indvar135, 1
  %p_exitcond59 = icmp eq i64 %40, 10240
  %polly.indvar_next136 = add nsw i64 %polly.indvar135, 1
  %polly.loop_cond137 = icmp sle i64 %polly.indvar135, 10238
  br i1 %polly.loop_cond137, label %polly.loop_header132, label %polly.loop_exit134

polly.loop_preheader133:                          ; preds = %polly.loop_exit
  %scevgep150 = getelementptr i8, i8* %call, i64 4
  %scevgep154 = getelementptr i8, i8* %call1, i64 4
  %scevgep158 = getelementptr i8, i8* %call, i64 8
  %scevgep162 = getelementptr i8, i8* %call1, i64 8
  %scevgep166 = getelementptr i8, i8* %call, i64 12
  %scevgep170 = getelementptr i8, i8* %call1, i64 12
  br label %polly.loop_header132

polly.loop_header138:                             ; preds = %polly.stmt.polly.stmt.for.inc31, %polly.loop_preheader139
  %polly.indvar141 = phi i64 [ 0, %polly.loop_preheader139 ], [ %polly.indvar_next142, %polly.stmt.polly.stmt.for.inc31 ]
  br label %polly.stmt.polly.stmt.for.inc31

polly.stmt.polly.stmt.for.inc31:                  ; preds = %polly.loop_header138
  %tmp.04.phiops.0.phiops.reload = load i32, i32* %tmp.04.phiops.0.phiops
  %41 = shl i64 %polly.indvar141, 4
  %scevgep145 = getelementptr i8, i8* %scevgep144, i64 %41
  %scevgep145146 = bitcast i8* %scevgep145 to i32*
  %_p_scalar__p_scalar_ = load i32, i32* %scevgep145146, align 4, !alias.scope !66, !noalias !68
  %scevgep148 = getelementptr i8, i8* %scevgep147, i64 %41
  %scevgep148149 = bitcast i8* %scevgep148 to i32*
  %_p_scalar_46_p_scalar_ = load i32, i32* %scevgep148149, align 4, !alias.scope !71, !noalias !75
  %p_p_mul29 = mul nsw i32 %_p_scalar_46_p_scalar_, %_p_scalar__p_scalar_, !dbg !52
  %p_p_add30 = add nsw i32 %p_p_mul29, %tmp.04.phiops.0.phiops.reload, !dbg !59
  %42 = shl i64 %polly.indvar141, 4
  %scevgep152 = getelementptr i8, i8* %scevgep151, i64 %42
  %scevgep152153 = bitcast i8* %scevgep152 to i32*
  %_p_scalar_.1_p_scalar_ = load i32, i32* %scevgep152153, align 4, !alias.scope !66, !noalias !68
  %scevgep156 = getelementptr i8, i8* %scevgep155, i64 %42
  %scevgep156157 = bitcast i8* %scevgep156 to i32*
  %_p_scalar_46.1_p_scalar_ = load i32, i32* %scevgep156157, align 4, !alias.scope !71, !noalias !75
  %p_p_mul29.1 = mul nsw i32 %_p_scalar_46.1_p_scalar_, %_p_scalar_.1_p_scalar_, !dbg !52
  %p_p_add30.1 = add nsw i32 %p_p_mul29.1, %p_p_add30, !dbg !59
  %43 = shl i64 %polly.indvar141, 4
  %scevgep160 = getelementptr i8, i8* %scevgep159, i64 %43
  %scevgep160161 = bitcast i8* %scevgep160 to i32*
  %_p_scalar_.2_p_scalar_ = load i32, i32* %scevgep160161, align 4, !alias.scope !66, !noalias !68
  %scevgep164 = getelementptr i8, i8* %scevgep163, i64 %43
  %scevgep164165 = bitcast i8* %scevgep164 to i32*
  %_p_scalar_46.2_p_scalar_ = load i32, i32* %scevgep164165, align 4, !alias.scope !71, !noalias !75
  %p_p_mul29.2 = mul nsw i32 %_p_scalar_46.2_p_scalar_, %_p_scalar_.2_p_scalar_, !dbg !52
  %p_p_add30.2 = add nsw i32 %p_p_mul29.2, %p_p_add30.1, !dbg !59
  %44 = shl i64 %polly.indvar141, 4
  %scevgep168 = getelementptr i8, i8* %scevgep167, i64 %44
  %scevgep168169 = bitcast i8* %scevgep168 to i32*
  %_p_scalar_.3_p_scalar_ = load i32, i32* %scevgep168169, align 4, !alias.scope !66, !noalias !68
  %scevgep172 = getelementptr i8, i8* %scevgep171, i64 %44
  %scevgep172173 = bitcast i8* %scevgep172 to i32*
  %_p_scalar_46.3_p_scalar_ = load i32, i32* %scevgep172173, align 4, !alias.scope !71, !noalias !75
  %p_p_mul29.3 = mul nsw i32 %_p_scalar_46.3_p_scalar_, %_p_scalar_.3_p_scalar_, !dbg !52
  %p_p_add30.3 = add nsw i32 %p_p_mul29.3, %p_p_add30.2, !dbg !59
  %45 = shl i64 %polly.indvar141, 2
  %46 = add i64 %45, 4
  %p_exitcond58.3 = icmp eq i64 %46, 1024
  store i32 %p_p_add30.3, i32* %tmp.04.phiops.0.phiops
  store i32 %p_p_add30.3, i32* %p_add30.3.lcssa.phiops
  %polly.indvar_next142 = add nsw i64 %polly.indvar141, 1
  %polly.loop_cond143 = icmp sle i64 %polly.indvar141, 254
  br i1 %polly.loop_cond143, label %polly.loop_header138, label %polly.loop_exit140

polly.loop_preheader139:                          ; preds = %polly.stmt.polly.loop_preheader35
  %47 = shl i64 %polly.indvar135, 12
  %scevgep144 = getelementptr i8, i8* %call, i64 %47
  %scevgep147 = getelementptr i8, i8* %call1, i64 %47
  %scevgep151 = getelementptr i8, i8* %scevgep150, i64 %47
  %scevgep155 = getelementptr i8, i8* %scevgep154, i64 %47
  %scevgep159 = getelementptr i8, i8* %scevgep158, i64 %47
  %scevgep163 = getelementptr i8, i8* %scevgep162, i64 %47
  %48 = shl i64 %polly.indvar135, 12
  %scevgep167 = getelementptr i8, i8* %scevgep166, i64 %48
  %scevgep171 = getelementptr i8, i8* %scevgep170, i64 %48
  br label %polly.loop_header138

polly.loop_header176:                             ; preds = %polly.stmt.polly.stmt.for.inc46, %polly.loop_preheader177
  %polly.indvar179 = phi i64 [ 0, %polly.loop_preheader177 ], [ %polly.indvar_next180, %polly.stmt.polly.stmt.for.inc46 ]
  br label %polly.stmt.polly.stmt.for.inc46

polly.stmt.polly.stmt.for.inc46:                  ; preds = %polly.loop_header176
  %total.02.phiops.0.phiops.reload = load i64, i64* %total.02.phiops.0.phiops
  %49 = mul i64 %polly.indvar179, 20
  %scevgep182 = getelementptr i8, i8* %call2, i64 %49
  %scevgep182183 = bitcast i8* %scevgep182 to i32*
  %_p_scalar_57_p_scalar_ = load i32, i32* %scevgep182183, align 4, !alias.scope !70, !noalias !76
  %p_p_conv44 = sext i32 %_p_scalar_57_p_scalar_ to i64, !dbg !60
  %p_p_add45 = add nsw i64 %p_p_conv44, %total.02.phiops.0.phiops.reload, !dbg !64
  %scevgep185 = getelementptr i8, i8* %scevgep184, i64 %49
  %scevgep185186 = bitcast i8* %scevgep185 to i32*
  %_p_scalar_57.1_p_scalar_ = load i32, i32* %scevgep185186, align 4, !alias.scope !70, !noalias !76
  %p_p_conv44.1 = sext i32 %_p_scalar_57.1_p_scalar_ to i64, !dbg !60
  %p_p_add45.1 = add nsw i64 %p_p_conv44.1, %p_p_add45, !dbg !64
  %50 = mul i64 %polly.indvar179, 20
  %scevgep188 = getelementptr i8, i8* %scevgep187, i64 %50
  %scevgep188189 = bitcast i8* %scevgep188 to i32*
  %_p_scalar_57.2_p_scalar_ = load i32, i32* %scevgep188189, align 4, !alias.scope !70, !noalias !76
  %p_p_conv44.2 = sext i32 %_p_scalar_57.2_p_scalar_ to i64, !dbg !60
  %p_p_add45.2 = add nsw i64 %p_p_conv44.2, %p_p_add45.1, !dbg !64
  %scevgep191 = getelementptr i8, i8* %scevgep190, i64 %50
  %scevgep191192 = bitcast i8* %scevgep191 to i32*
  %_p_scalar_57.3_p_scalar_ = load i32, i32* %scevgep191192, align 4, !alias.scope !70, !noalias !76
  %p_p_conv44.3 = sext i32 %_p_scalar_57.3_p_scalar_ to i64, !dbg !60
  %p_p_add45.3 = add nsw i64 %p_p_conv44.3, %p_p_add45.2, !dbg !64
  %51 = mul i64 %polly.indvar179, 20
  %scevgep194 = getelementptr i8, i8* %scevgep193, i64 %51
  %scevgep194195 = bitcast i8* %scevgep194 to i32*
  %_p_scalar_57.4_p_scalar_ = load i32, i32* %scevgep194195, align 4, !alias.scope !70, !noalias !76
  %p_p_conv44.4 = sext i32 %_p_scalar_57.4_p_scalar_ to i64, !dbg !60
  %p_p_add45.4 = add nsw i64 %p_p_conv44.4, %p_p_add45.3, !dbg !64
  %52 = mul i64 %polly.indvar179, 5
  %53 = add i64 %52, 5
  %p_exitcond.4 = icmp eq i64 %53, 10240
  store i64 %p_p_add45.4, i64* %total.02.phiops.0.phiops
  store i64 %p_p_add45.4, i64* %p_add45.4.s2a
  %polly.indvar_next180 = add nsw i64 %polly.indvar179, 1
  %polly.loop_cond181 = icmp sle i64 %polly.indvar179, 2046
  br i1 %polly.loop_cond181, label %polly.loop_header176, label %polly.loop_exit178

polly.loop_preheader177:                          ; preds = %polly.stmt.polly.stmt.for.inc46.preheader
  %scevgep184 = getelementptr i8, i8* %call2, i64 4
  %scevgep187 = getelementptr i8, i8* %call2, i64 8
  %scevgep190 = getelementptr i8, i8* %call2, i64 12
  %scevgep193 = getelementptr i8, i8* %call2, i64 16
  br label %polly.loop_header176
}

; Function Attrs: nounwind
declare noalias i8* @malloc(i64) #1

; Function Attrs: nounwind
declare i32 @printf(i8* nocapture readonly, ...) #1

; Function Attrs: noreturn nounwind
declare void @exit(i32) #2

; Function Attrs: nounwind
declare i8* @setlocale(i32, i8*) #1

; Function Attrs: nounwind readnone
declare void @llvm.dbg.value(metadata, i64, metadata, metadata) #3

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "polly-optimized" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noreturn nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind readnone }
attributes #4 = { nounwind }
attributes #5 = { noreturn nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!14, !15}
!llvm.ident = !{!16}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 3.9.0 (http://llvm.org/git/clang.git e177b4a63ca92c5fec010986944530688e104074) (http://llvm.org/git/llvm.git fcd97ccb03712372fe95f1732638de5ed3fcabe8)", isOptimized: false, runtimeVersion: 0, emissionKind: 1, enums: !2, retainedTypes: !3, subprograms: !7)
!1 = !DIFile(filename: "VectorMult.c", directory: "/home/sam/workspace/WhileyOpenCL/polly/VectorMult/impl/handwritten")
!2 = !{}
!3 = !{!4, !6}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64, align: 64)
!5 = !DIBasicType(name: "int", size: 32, align: 32, encoding: DW_ATE_signed)
!6 = !DIBasicType(name: "long long int", size: 64, align: 64, encoding: DW_ATE_signed)
!7 = !{!8}
!8 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 8, type: !9, isLocal: false, isDefinition: true, scopeLine: 8, flags: DIFlagPrototyped, isOptimized: false, variables: !2)
!9 = !DISubroutineType(types: !10)
!10 = !{!5, !5, !11}
!11 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !12, size: 64, align: 64)
!12 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !13, size: 64, align: 64)
!13 = !DIBasicType(name: "char", size: 8, align: 8, encoding: DW_ATE_signed_char)
!14 = !{i32 2, !"Dwarf Version", i32 4}
!15 = !{i32 2, !"Debug Info Version", i32 3}
!16 = !{!"clang version 3.9.0 (http://llvm.org/git/clang.git e177b4a63ca92c5fec010986944530688e104074) (http://llvm.org/git/llvm.git fcd97ccb03712372fe95f1732638de5ed3fcabe8)"}
!17 = !DILocalVariable(name: "argc", arg: 1, scope: !8, file: !1, line: 8, type: !5)
!18 = !DIExpression()
!19 = !DILocation(line: 8, column: 14, scope: !8)
!20 = !DILocalVariable(name: "args", arg: 2, scope: !8, file: !1, line: 8, type: !11)
!21 = !DILocation(line: 8, column: 27, scope: !8)
!22 = !DILocation(line: 12, column: 18, scope: !8)
!23 = !DILocation(line: 13, column: 18, scope: !8)
!24 = !DILocation(line: 14, column: 20, scope: !8)
!25 = !DILocalVariable(name: "sum", scope: !8, file: !1, line: 14, type: !4)
!26 = !DILocation(line: 14, column: 7, scope: !8)
!27 = !DILocalVariable(name: "r", scope: !8, file: !1, line: 11, type: !6)
!28 = !DILocation(line: 11, column: 12, scope: !8)
!29 = !DILocation(line: 41, column: 3, scope: !30)
!30 = distinct !DILexicalBlock(scope: !31, file: !1, line: 40, column: 19)
!31 = distinct !DILexicalBlock(scope: !8, file: !1, line: 40, column: 5)
!32 = !DILocation(line: 42, column: 3, scope: !30)
!33 = !DILocation(line: 46, column: 2, scope: !8)
!34 = !DILocation(line: 47, column: 2, scope: !8)
!35 = !DILocation(line: 49, column: 2, scope: !8)
!36 = !DILocation(line: 40, column: 11, scope: !31)
!37 = !DILocation(line: 40, column: 5, scope: !8)
!38 = distinct !{!38}
!39 = distinct !{!39, !40, !"polly.alias.scope.call"}
!40 = distinct !{!40, !"polly.alias.scope.domain"}
!41 = !{!42, !43, !44, !45, !46, !47}
!42 = distinct !{!42, !40, !"polly.alias.scope.add45"}
!43 = distinct !{!43, !40, !"polly.alias.scope.call2"}
!44 = distinct !{!44, !40, !"polly.alias.scope.call1"}
!45 = distinct !{!45, !40, !"polly.alias.scope.total.02"}
!46 = distinct !{!46, !40, !"polly.alias.scope.tmp.04"}
!47 = distinct !{!47, !40, !"polly.alias.scope.add30.lcssa"}
!48 = !{!38, !49}
!49 = distinct !{!49}
!50 = !{!42, !43, !39, !45, !46, !47}
!51 = !{!42, !39, !44, !45, !46, !47}
!52 = !DILocation(line: 29, column: 23, scope: !53)
!53 = distinct !DILexicalBlock(scope: !54, file: !1, line: 27, column: 21)
!54 = distinct !DILexicalBlock(scope: !55, file: !1, line: 27, column: 3)
!55 = distinct !DILexicalBlock(scope: !56, file: !1, line: 27, column: 3)
!56 = distinct !DILexicalBlock(scope: !57, file: !1, line: 25, column: 18)
!57 = distinct !DILexicalBlock(scope: !58, file: !1, line: 25, column: 2)
!58 = distinct !DILexicalBlock(scope: !8, file: !1, line: 25, column: 2)
!59 = !DILocation(line: 29, column: 13, scope: !53)
!60 = !DILocation(line: 36, column: 19, scope: !61)
!61 = distinct !DILexicalBlock(scope: !62, file: !1, line: 35, column: 18)
!62 = distinct !DILexicalBlock(scope: !63, file: !1, line: 35, column: 2)
!63 = distinct !DILexicalBlock(scope: !8, file: !1, line: 35, column: 2)
!64 = !DILocation(line: 36, column: 17, scope: !61)
!65 = distinct !{!65}
!66 = distinct !{!66, !67, !"polly.alias.scope.call"}
!67 = distinct !{!67, !"polly.alias.scope.domain"}
!68 = !{!69, !70, !71, !72, !73, !74}
!69 = distinct !{!69, !67, !"polly.alias.scope.total.02.phiops.0"}
!70 = distinct !{!70, !67, !"polly.alias.scope.call2"}
!71 = distinct !{!71, !67, !"polly.alias.scope.call1"}
!72 = distinct !{!72, !67, !"polly.alias.scope.p_add30.3.lcssa"}
!73 = distinct !{!73, !67, !"polly.alias.scope.tmp.04.phiops.0"}
!74 = distinct !{!74, !67, !"polly.alias.scope.p_add45.4"}
!75 = !{!69, !70, !66, !72, !73, !74}
!76 = !{!69, !66, !71, !72, !73, !74}
