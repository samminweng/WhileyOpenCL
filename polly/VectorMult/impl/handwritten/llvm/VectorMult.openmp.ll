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
  %polly.par.userContext = alloca { i8*, i8* }, align 8
  tail call void @llvm.dbg.value(metadata i32 %argc, i64 0, metadata !17, metadata !18), !dbg !19
  tail call void @llvm.dbg.value(metadata i8** %args, i64 0, metadata !20, metadata !18), !dbg !21
  %call = tail call noalias i8* @malloc(i64 41943040) #6, !dbg !22
  %call1 = tail call noalias i8* @malloc(i64 41943040) #6, !dbg !23
  %call2 = tail call noalias i8* @malloc(i64 40960) #6, !dbg !24
  tail call void @llvm.dbg.value(metadata i32* undef, i64 0, metadata !25, metadata !18), !dbg !26
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !27, metadata !18), !dbg !28
  %0 = bitcast { i8*, i8* }* %polly.par.userContext to i8*
  call void @llvm.lifetime.start(i64 16, i8* %0)
  %polly.subfn.storeaddr.call = getelementptr inbounds { i8*, i8* }, { i8*, i8* }* %polly.par.userContext, i64 0, i32 0
  store i8* %call, i8** %polly.subfn.storeaddr.call, align 8
  %polly.subfn.storeaddr.call1 = getelementptr inbounds { i8*, i8* }, { i8*, i8* }* %polly.par.userContext, i64 0, i32 1
  store i8* %call1, i8** %polly.subfn.storeaddr.call1, align 8
  call void @GOMP_parallel_loop_runtime_start(void (i8*)* nonnull @main_polly_subfn, i8* %0, i32 0, i64 0, i64 320, i64 1) #6
  call void @main_polly_subfn(i8* %0) #6
  call void @GOMP_parallel_end() #6
  call void @llvm.lifetime.end(i64 8, i8* %0)
  br label %polly.split_new_and_old

if.then:                                          ; preds = %polly.exiting
  %call51 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([34 x i8], [34 x i8]* @.str, i64 0, i64 0)) #6, !dbg !29
  tail call void @exit(i32 -2) #7, !dbg !32
  unreachable, !dbg !32

if.end:                                           ; preds = %polly.exiting
  %call52 = tail call i8* @setlocale(i32 6, i8* getelementptr inbounds ([1 x i8], [1 x i8]* @.str.1, i64 0, i64 0)) #6, !dbg !33
  %call53 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([100 x i8], [100 x i8]* @.str.2, i64 0, i64 0), i64 10485760, i32 1024, i64 10485760) #6, !dbg !34
  ret i32 0, !dbg !35

polly.merge_new_and_old:                          ; preds = %polly.exiting27, %polly.stmt.for.inc46
  %p_add45.4.merge = phi i64 [ %p_add45.4.final_reload, %polly.exiting27 ], [ %p_add45.4, %polly.stmt.for.inc46 ]
  br label %polly.exiting, !dbg !36

polly.exiting:                                    ; preds = %polly.merge_new_and_old
  %p_add45.4.lcssa = phi i64 [ %p_add45.4.merge, %polly.merge_new_and_old ]
  %cmp49 = icmp eq i64 %p_add45.4.lcssa, 10485760, !dbg !36
  br i1 %cmp49, label %if.end, label %if.then, !dbg !37

polly.stmt.for.end33:                             ; preds = %polly.stmt.for.inc31
  %p_add30.3.lcssa = phi i32 [ %p_add30.3, %polly.stmt.for.inc31 ]
  %1 = shl i64 %polly.indvar, 2
  %scevgep14 = getelementptr i8, i8* %call2, i64 %1
  %scevgep1415 = bitcast i8* %scevgep14 to i32*
  store i32 %p_add30.3.lcssa, i32* %scevgep1415, align 4, !alias.scope !38, !noalias !40
  %polly.indvar_next = add nuw nsw i64 %polly.indvar, 1
  %exitcond26 = icmp eq i64 %polly.indvar_next, 10240
  br i1 %exitcond26, label %polly.stmt.for.inc46.preheader, label %polly.loop_preheader3

polly.stmt.for.inc46.preheader:                   ; preds = %polly.stmt.for.end33
  br label %polly.stmt.for.inc46

polly.stmt.for.inc31:                             ; preds = %polly.stmt.for.inc31, %polly.loop_preheader3
  %tmp.04.phiops.0 = phi i32 [ 0, %polly.loop_preheader3 ], [ %p_add30.3, %polly.stmt.for.inc31 ]
  %polly.indvar5 = phi i64 [ 0, %polly.loop_preheader3 ], [ %polly.indvar_next6.3, %polly.stmt.for.inc31 ]
  %2 = shl i64 %polly.indvar5, 2
  %scevgep8 = getelementptr i8, i8* %scevgep, i64 %2
  %scevgep89 = bitcast i8* %scevgep8 to i32*
  %_p_scalar_ = load i32, i32* %scevgep89, align 4, !alias.scope !43, !noalias !47
  %scevgep11 = getelementptr i8, i8* %scevgep10, i64 %2
  %scevgep1112 = bitcast i8* %scevgep11 to i32*
  %_p_scalar_13 = load i32, i32* %scevgep1112, align 4, !alias.scope !45, !noalias !48
  %p_mul29 = mul nsw i32 %_p_scalar_13, %_p_scalar_, !dbg !49
  %p_add30 = add nsw i32 %p_mul29, %tmp.04.phiops.0, !dbg !56
  %polly.indvar_next6 = shl i64 %polly.indvar5, 2
  %3 = or i64 %polly.indvar_next6, 4
  %scevgep8.1 = getelementptr i8, i8* %scevgep, i64 %3
  %scevgep89.1 = bitcast i8* %scevgep8.1 to i32*
  %_p_scalar_.1 = load i32, i32* %scevgep89.1, align 4, !alias.scope !43, !noalias !47
  %scevgep11.1 = getelementptr i8, i8* %scevgep10, i64 %3
  %scevgep1112.1 = bitcast i8* %scevgep11.1 to i32*
  %_p_scalar_13.1 = load i32, i32* %scevgep1112.1, align 4, !alias.scope !45, !noalias !48
  %p_mul29.1 = mul nsw i32 %_p_scalar_13.1, %_p_scalar_.1, !dbg !49
  %p_add30.1 = add nsw i32 %p_mul29.1, %p_add30, !dbg !56
  %polly.indvar_next6.1 = shl i64 %polly.indvar5, 2
  %4 = or i64 %polly.indvar_next6.1, 8
  %scevgep8.2 = getelementptr i8, i8* %scevgep, i64 %4
  %scevgep89.2 = bitcast i8* %scevgep8.2 to i32*
  %_p_scalar_.2 = load i32, i32* %scevgep89.2, align 4, !alias.scope !43, !noalias !47
  %scevgep11.2 = getelementptr i8, i8* %scevgep10, i64 %4
  %scevgep1112.2 = bitcast i8* %scevgep11.2 to i32*
  %_p_scalar_13.2 = load i32, i32* %scevgep1112.2, align 4, !alias.scope !45, !noalias !48
  %p_mul29.2 = mul nsw i32 %_p_scalar_13.2, %_p_scalar_.2, !dbg !49
  %p_add30.2 = add nsw i32 %p_mul29.2, %p_add30.1, !dbg !56
  %polly.indvar_next6.2 = shl i64 %polly.indvar5, 2
  %5 = or i64 %polly.indvar_next6.2, 12
  %scevgep8.3 = getelementptr i8, i8* %scevgep, i64 %5
  %scevgep89.3 = bitcast i8* %scevgep8.3 to i32*
  %_p_scalar_.3 = load i32, i32* %scevgep89.3, align 4, !alias.scope !43, !noalias !47
  %scevgep11.3 = getelementptr i8, i8* %scevgep10, i64 %5
  %scevgep1112.3 = bitcast i8* %scevgep11.3 to i32*
  %_p_scalar_13.3 = load i32, i32* %scevgep1112.3, align 4, !alias.scope !45, !noalias !48
  %p_mul29.3 = mul nsw i32 %_p_scalar_13.3, %_p_scalar_.3, !dbg !49
  %p_add30.3 = add nsw i32 %p_mul29.3, %p_add30.2, !dbg !56
  %polly.indvar_next6.3 = add nsw i64 %polly.indvar5, 4
  %exitcond25.3 = icmp eq i64 %polly.indvar_next6.3, 1024
  br i1 %exitcond25.3, label %polly.stmt.for.end33, label %polly.stmt.for.inc31

polly.split_new_and_old:                          ; preds = %entry
  br i1 true, label %polly.start, label %polly.loop_preheader3

polly.loop_preheader3:                            ; preds = %polly.split_new_and_old, %polly.stmt.for.end33
  %polly.indvar = phi i64 [ %polly.indvar_next, %polly.stmt.for.end33 ], [ 0, %polly.split_new_and_old ]
  %6 = shl i64 %polly.indvar, 12
  %scevgep = getelementptr i8, i8* %call, i64 %6
  %scevgep10 = getelementptr i8, i8* %call1, i64 %6
  br label %polly.stmt.for.inc31

polly.stmt.for.inc46:                             ; preds = %polly.stmt.for.inc46, %polly.stmt.for.inc46.preheader
  %total.02.phiops.0 = phi i64 [ 0, %polly.stmt.for.inc46.preheader ], [ %p_add45.4, %polly.stmt.for.inc46 ]
  %polly.indvar19 = phi i64 [ 0, %polly.stmt.for.inc46.preheader ], [ %polly.indvar_next20.4, %polly.stmt.for.inc46 ]
  %7 = shl i64 %polly.indvar19, 2
  %scevgep22 = getelementptr i8, i8* %call2, i64 %7
  %scevgep2223 = bitcast i8* %scevgep22 to i32*
  %_p_scalar_24 = load i32, i32* %scevgep2223, align 4, !alias.scope !38, !noalias !40
  %p_conv44 = sext i32 %_p_scalar_24 to i64, !dbg !57
  %p_add45 = add nsw i64 %p_conv44, %total.02.phiops.0, !dbg !61
  %polly.indvar_next20 = shl i64 %polly.indvar19, 2
  %8 = add i64 %polly.indvar_next20, 4
  %scevgep22.1 = getelementptr i8, i8* %call2, i64 %8
  %scevgep2223.1 = bitcast i8* %scevgep22.1 to i32*
  %_p_scalar_24.1 = load i32, i32* %scevgep2223.1, align 4, !alias.scope !38, !noalias !40
  %p_conv44.1 = sext i32 %_p_scalar_24.1 to i64, !dbg !57
  %p_add45.1 = add nsw i64 %p_conv44.1, %p_add45, !dbg !61
  %polly.indvar_next20.1 = shl i64 %polly.indvar19, 2
  %9 = add i64 %polly.indvar_next20.1, 8
  %scevgep22.2 = getelementptr i8, i8* %call2, i64 %9
  %scevgep2223.2 = bitcast i8* %scevgep22.2 to i32*
  %_p_scalar_24.2 = load i32, i32* %scevgep2223.2, align 4, !alias.scope !38, !noalias !40
  %p_conv44.2 = sext i32 %_p_scalar_24.2 to i64, !dbg !57
  %p_add45.2 = add nsw i64 %p_conv44.2, %p_add45.1, !dbg !61
  %polly.indvar_next20.2 = shl i64 %polly.indvar19, 2
  %10 = add i64 %polly.indvar_next20.2, 12
  %scevgep22.3 = getelementptr i8, i8* %call2, i64 %10
  %scevgep2223.3 = bitcast i8* %scevgep22.3 to i32*
  %_p_scalar_24.3 = load i32, i32* %scevgep2223.3, align 4, !alias.scope !38, !noalias !40
  %p_conv44.3 = sext i32 %_p_scalar_24.3 to i64, !dbg !57
  %p_add45.3 = add nsw i64 %p_conv44.3, %p_add45.2, !dbg !61
  %polly.indvar_next20.3 = shl i64 %polly.indvar19, 2
  %11 = add i64 %polly.indvar_next20.3, 16
  %scevgep22.4 = getelementptr i8, i8* %call2, i64 %11
  %scevgep2223.4 = bitcast i8* %scevgep22.4 to i32*
  %_p_scalar_24.4 = load i32, i32* %scevgep2223.4, align 4, !alias.scope !38, !noalias !40
  %p_conv44.4 = sext i32 %_p_scalar_24.4 to i64, !dbg !57
  %p_add45.4 = add nsw i64 %p_conv44.4, %p_add45.3, !dbg !61
  %polly.indvar_next20.4 = add nsw i64 %polly.indvar19, 5
  %exitcond.4 = icmp eq i64 %polly.indvar_next20.4, 10240
  br i1 %exitcond.4, label %polly.merge_new_and_old, label %polly.stmt.for.inc46

polly.start:                                      ; preds = %polly.split_new_and_old
  br label %polly.loop_preheader

polly.loop_exit:                                  ; preds = %polly.stmt.polly.stmt.for.end33
  br label %polly.stmt.polly.stmt.for.inc46.preheader

polly.stmt.polly.stmt.for.inc46.preheader:        ; preds = %polly.loop_exit
  store i64 0, i64* %total.02.phiops.0.phiops
  br label %polly.loop_preheader69

polly.loop_exit70:                                ; preds = %polly.stmt.polly.stmt.for.inc46
  br label %polly.exiting27

polly.exiting27:                                  ; preds = %polly.loop_exit70
  %p_add45.4.final_reload = load i64, i64* %p_add45.4.s2a
  br label %polly.merge_new_and_old

polly.loop_header:                                ; preds = %polly.stmt.polly.stmt.for.end33, %polly.loop_preheader
  %polly.indvar28 = phi i64 [ 0, %polly.loop_preheader ], [ %polly.indvar_next29, %polly.stmt.polly.stmt.for.end33 ]
  br label %polly.stmt.polly.loop_preheader3

polly.stmt.polly.loop_preheader3:                 ; preds = %polly.loop_header
  store i32 0, i32* %tmp.04.phiops.0.phiops
  br label %polly.loop_preheader31

polly.loop_exit32:                                ; preds = %polly.stmt.polly.stmt.for.inc31
  br label %polly.stmt.polly.stmt.for.end33

polly.stmt.polly.stmt.for.end33:                  ; preds = %polly.loop_exit32
  %p_add30.3.lcssa.phiops.reload = load i32, i32* %p_add30.3.lcssa.phiops
  %12 = shl i64 %polly.indvar28, 2
  %scevgep66 = getelementptr i8, i8* %call2, i64 %12
  %scevgep6667 = bitcast i8* %scevgep66 to i32*
  store i32 %p_add30.3.lcssa.phiops.reload, i32* %scevgep6667, align 4, !alias.scope !62, !noalias !64
  %13 = add i64 %polly.indvar28, 1
  %p_exitcond26 = icmp eq i64 %13, 10240
  %polly.indvar_next29 = add nsw i64 %polly.indvar28, 1
  %polly.loop_cond = icmp sle i64 %polly.indvar28, 10238
  br i1 %polly.loop_cond, label %polly.loop_header, label %polly.loop_exit

polly.loop_preheader:                             ; preds = %polly.start
  %scevgep42 = getelementptr i8, i8* %call, i64 4
  %scevgep46 = getelementptr i8, i8* %call1, i64 4
  %scevgep50 = getelementptr i8, i8* %call, i64 8
  %scevgep54 = getelementptr i8, i8* %call1, i64 8
  %scevgep58 = getelementptr i8, i8* %call, i64 12
  %scevgep62 = getelementptr i8, i8* %call1, i64 12
  br label %polly.loop_header

polly.loop_header30:                              ; preds = %polly.stmt.polly.stmt.for.inc31, %polly.loop_preheader31
  %polly.indvar33 = phi i64 [ 0, %polly.loop_preheader31 ], [ %polly.indvar_next34, %polly.stmt.polly.stmt.for.inc31 ]
  br label %polly.stmt.polly.stmt.for.inc31

polly.stmt.polly.stmt.for.inc31:                  ; preds = %polly.loop_header30
  %tmp.04.phiops.0.phiops.reload = load i32, i32* %tmp.04.phiops.0.phiops
  %14 = shl i64 %polly.indvar33, 4
  %scevgep37 = getelementptr i8, i8* %scevgep36, i64 %14
  %scevgep3738 = bitcast i8* %scevgep37 to i32*
  %_p_scalar__p_scalar_ = load i32, i32* %scevgep3738, align 4, !alias.scope !66, !noalias !71
  %scevgep40 = getelementptr i8, i8* %scevgep39, i64 %14
  %scevgep4041 = bitcast i8* %scevgep40 to i32*
  %_p_scalar_13_p_scalar_ = load i32, i32* %scevgep4041, align 4, !alias.scope !70, !noalias !72
  %p_p_mul29 = mul nsw i32 %_p_scalar_13_p_scalar_, %_p_scalar__p_scalar_, !dbg !49
  %p_p_add30 = add nsw i32 %p_p_mul29, %tmp.04.phiops.0.phiops.reload, !dbg !56
  %15 = shl i64 %polly.indvar33, 4
  %scevgep44 = getelementptr i8, i8* %scevgep43, i64 %15
  %scevgep4445 = bitcast i8* %scevgep44 to i32*
  %_p_scalar_.1_p_scalar_ = load i32, i32* %scevgep4445, align 4, !alias.scope !66, !noalias !71
  %scevgep48 = getelementptr i8, i8* %scevgep47, i64 %15
  %scevgep4849 = bitcast i8* %scevgep48 to i32*
  %_p_scalar_13.1_p_scalar_ = load i32, i32* %scevgep4849, align 4, !alias.scope !70, !noalias !72
  %p_p_mul29.1 = mul nsw i32 %_p_scalar_13.1_p_scalar_, %_p_scalar_.1_p_scalar_, !dbg !49
  %p_p_add30.1 = add nsw i32 %p_p_mul29.1, %p_p_add30, !dbg !56
  %16 = shl i64 %polly.indvar33, 4
  %scevgep52 = getelementptr i8, i8* %scevgep51, i64 %16
  %scevgep5253 = bitcast i8* %scevgep52 to i32*
  %_p_scalar_.2_p_scalar_ = load i32, i32* %scevgep5253, align 4, !alias.scope !66, !noalias !71
  %scevgep56 = getelementptr i8, i8* %scevgep55, i64 %16
  %scevgep5657 = bitcast i8* %scevgep56 to i32*
  %_p_scalar_13.2_p_scalar_ = load i32, i32* %scevgep5657, align 4, !alias.scope !70, !noalias !72
  %p_p_mul29.2 = mul nsw i32 %_p_scalar_13.2_p_scalar_, %_p_scalar_.2_p_scalar_, !dbg !49
  %p_p_add30.2 = add nsw i32 %p_p_mul29.2, %p_p_add30.1, !dbg !56
  %17 = shl i64 %polly.indvar33, 4
  %scevgep60 = getelementptr i8, i8* %scevgep59, i64 %17
  %scevgep6061 = bitcast i8* %scevgep60 to i32*
  %_p_scalar_.3_p_scalar_ = load i32, i32* %scevgep6061, align 4, !alias.scope !66, !noalias !71
  %scevgep64 = getelementptr i8, i8* %scevgep63, i64 %17
  %scevgep6465 = bitcast i8* %scevgep64 to i32*
  %_p_scalar_13.3_p_scalar_ = load i32, i32* %scevgep6465, align 4, !alias.scope !70, !noalias !72
  %p_p_mul29.3 = mul nsw i32 %_p_scalar_13.3_p_scalar_, %_p_scalar_.3_p_scalar_, !dbg !49
  %p_p_add30.3 = add nsw i32 %p_p_mul29.3, %p_p_add30.2, !dbg !56
  %18 = shl i64 %polly.indvar33, 2
  %19 = add i64 %18, 4
  %p_exitcond25.3 = icmp eq i64 %19, 1024
  store i32 %p_p_add30.3, i32* %tmp.04.phiops.0.phiops
  store i32 %p_p_add30.3, i32* %p_add30.3.lcssa.phiops
  %polly.indvar_next34 = add nsw i64 %polly.indvar33, 1
  %polly.loop_cond35 = icmp sle i64 %polly.indvar33, 254
  br i1 %polly.loop_cond35, label %polly.loop_header30, label %polly.loop_exit32

polly.loop_preheader31:                           ; preds = %polly.stmt.polly.loop_preheader3
  %20 = shl i64 %polly.indvar28, 12
  %scevgep36 = getelementptr i8, i8* %call, i64 %20
  %scevgep39 = getelementptr i8, i8* %call1, i64 %20
  %scevgep43 = getelementptr i8, i8* %scevgep42, i64 %20
  %scevgep47 = getelementptr i8, i8* %scevgep46, i64 %20
  %scevgep51 = getelementptr i8, i8* %scevgep50, i64 %20
  %scevgep55 = getelementptr i8, i8* %scevgep54, i64 %20
  %21 = shl i64 %polly.indvar28, 12
  %scevgep59 = getelementptr i8, i8* %scevgep58, i64 %21
  %scevgep63 = getelementptr i8, i8* %scevgep62, i64 %21
  br label %polly.loop_header30

polly.loop_header68:                              ; preds = %polly.stmt.polly.stmt.for.inc46, %polly.loop_preheader69
  %polly.indvar71 = phi i64 [ 0, %polly.loop_preheader69 ], [ %polly.indvar_next72, %polly.stmt.polly.stmt.for.inc46 ]
  br label %polly.stmt.polly.stmt.for.inc46

polly.stmt.polly.stmt.for.inc46:                  ; preds = %polly.loop_header68
  %total.02.phiops.0.phiops.reload = load i64, i64* %total.02.phiops.0.phiops
  %22 = mul i64 %polly.indvar71, 20
  %scevgep74 = getelementptr i8, i8* %call2, i64 %22
  %scevgep7475 = bitcast i8* %scevgep74 to i32*
  %_p_scalar_24_p_scalar_ = load i32, i32* %scevgep7475, align 4, !alias.scope !62, !noalias !64
  %p_p_conv44 = sext i32 %_p_scalar_24_p_scalar_ to i64, !dbg !57
  %p_p_add45 = add nsw i64 %p_p_conv44, %total.02.phiops.0.phiops.reload, !dbg !61
  %scevgep77 = getelementptr i8, i8* %scevgep76, i64 %22
  %scevgep7778 = bitcast i8* %scevgep77 to i32*
  %_p_scalar_24.1_p_scalar_ = load i32, i32* %scevgep7778, align 4, !alias.scope !62, !noalias !64
  %p_p_conv44.1 = sext i32 %_p_scalar_24.1_p_scalar_ to i64, !dbg !57
  %p_p_add45.1 = add nsw i64 %p_p_conv44.1, %p_p_add45, !dbg !61
  %23 = mul i64 %polly.indvar71, 20
  %scevgep80 = getelementptr i8, i8* %scevgep79, i64 %23
  %scevgep8081 = bitcast i8* %scevgep80 to i32*
  %_p_scalar_24.2_p_scalar_ = load i32, i32* %scevgep8081, align 4, !alias.scope !62, !noalias !64
  %p_p_conv44.2 = sext i32 %_p_scalar_24.2_p_scalar_ to i64, !dbg !57
  %p_p_add45.2 = add nsw i64 %p_p_conv44.2, %p_p_add45.1, !dbg !61
  %scevgep83 = getelementptr i8, i8* %scevgep82, i64 %23
  %scevgep8384 = bitcast i8* %scevgep83 to i32*
  %_p_scalar_24.3_p_scalar_ = load i32, i32* %scevgep8384, align 4, !alias.scope !62, !noalias !64
  %p_p_conv44.3 = sext i32 %_p_scalar_24.3_p_scalar_ to i64, !dbg !57
  %p_p_add45.3 = add nsw i64 %p_p_conv44.3, %p_p_add45.2, !dbg !61
  %24 = mul i64 %polly.indvar71, 20
  %scevgep86 = getelementptr i8, i8* %scevgep85, i64 %24
  %scevgep8687 = bitcast i8* %scevgep86 to i32*
  %_p_scalar_24.4_p_scalar_ = load i32, i32* %scevgep8687, align 4, !alias.scope !62, !noalias !64
  %p_p_conv44.4 = sext i32 %_p_scalar_24.4_p_scalar_ to i64, !dbg !57
  %p_p_add45.4 = add nsw i64 %p_p_conv44.4, %p_p_add45.3, !dbg !61
  %25 = mul i64 %polly.indvar71, 5
  %26 = add i64 %25, 5
  %p_exitcond.4 = icmp eq i64 %26, 10240
  store i64 %p_p_add45.4, i64* %total.02.phiops.0.phiops
  store i64 %p_p_add45.4, i64* %p_add45.4.s2a
  %polly.indvar_next72 = add nsw i64 %polly.indvar71, 1
  %polly.loop_cond73 = icmp sle i64 %polly.indvar71, 2046
  br i1 %polly.loop_cond73, label %polly.loop_header68, label %polly.loop_exit70

polly.loop_preheader69:                           ; preds = %polly.stmt.polly.stmt.for.inc46.preheader
  %scevgep76 = getelementptr i8, i8* %call2, i64 4
  %scevgep79 = getelementptr i8, i8* %call2, i64 8
  %scevgep82 = getelementptr i8, i8* %call2, i64 12
  %scevgep85 = getelementptr i8, i8* %call2, i64 16
  br label %polly.loop_header68
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

; Function Attrs: argmemonly nounwind
declare void @llvm.lifetime.start(i64, i8* nocapture) #4

define internal void @main_polly_subfn(i8* nocapture readonly %polly.par.userContext) #5 {
polly.par.setup:
  %polly.par.LBPtr = alloca i64, align 8
  %polly.par.UBPtr = alloca i64, align 8
  %0 = bitcast i8* %polly.par.userContext to i8**
  %polly.subfunc.arg.call = load i8*, i8** %0, align 8
  %1 = getelementptr inbounds i8, i8* %polly.par.userContext, i64 8
  %2 = bitcast i8* %1 to i8**
  %polly.subfunc.arg.call1 = load i8*, i8** %2, align 8
  %3 = call i8 @GOMP_loop_runtime_next(i64* nonnull %polly.par.LBPtr, i64* nonnull %polly.par.UBPtr)
  %4 = icmp eq i8 %3, 0
  br i1 %4, label %polly.par.exit, label %polly.par.loadIVBounds.preheader

polly.par.loadIVBounds.preheader:                 ; preds = %polly.par.setup
  br label %polly.par.loadIVBounds

polly.par.exit.loopexit:                          ; preds = %polly.par.checkNext.loopexit
  br label %polly.par.exit

polly.par.exit:                                   ; preds = %polly.par.exit.loopexit, %polly.par.setup
  call void @GOMP_loop_end_nowait()
  ret void

polly.par.checkNext.loopexit:                     ; preds = %polly.loop_exit4
  %5 = call i8 @GOMP_loop_runtime_next(i64* nonnull %polly.par.LBPtr, i64* nonnull %polly.par.UBPtr)
  %6 = icmp eq i8 %5, 0
  br i1 %6, label %polly.par.exit.loopexit, label %polly.par.loadIVBounds

polly.par.loadIVBounds:                           ; preds = %polly.par.loadIVBounds.preheader, %polly.par.checkNext.loopexit
  %polly.par.UB = load i64, i64* %polly.par.UBPtr, align 8
  %polly.par.LB = load i64, i64* %polly.par.LBPtr, align 8
  %polly.adjust_ub = add i64 %polly.par.UB, -2
  br label %polly.loop_preheader3

polly.loop_exit4:                                 ; preds = %polly.loop_exit10
  %polly.indvar_next = add nsw i64 %polly.indvar, 1
  %polly.loop_cond = icmp sgt i64 %polly.indvar, %polly.adjust_ub
  br i1 %polly.loop_cond, label %polly.par.checkNext.loopexit, label %polly.loop_preheader3

polly.loop_exit10:                                ; preds = %polly.loop_exit16
  %polly.indvar_next6 = add nuw nsw i64 %polly.indvar5, 1
  %exitcond24 = icmp eq i64 %polly.indvar_next6, 32
  br i1 %exitcond24, label %polly.loop_exit4, label %polly.loop_preheader9

polly.loop_preheader3:                            ; preds = %polly.par.loadIVBounds, %polly.loop_exit4
  %polly.indvar = phi i64 [ %polly.par.LB, %polly.par.loadIVBounds ], [ %polly.indvar_next, %polly.loop_exit4 ]
  %7 = shl i64 %polly.indvar, 5
  br label %polly.loop_preheader9

polly.loop_exit16:                                ; preds = %polly.stmt.for.body5
  %polly.indvar_next12 = add nuw nsw i64 %polly.indvar11, 1
  %exitcond23 = icmp eq i64 %polly.indvar_next12, 32
  br i1 %exitcond23, label %polly.loop_exit10, label %polly.loop_preheader15

polly.loop_preheader9:                            ; preds = %polly.loop_exit10, %polly.loop_preheader3
  %polly.indvar5 = phi i64 [ 0, %polly.loop_preheader3 ], [ %polly.indvar_next6, %polly.loop_exit10 ]
  %8 = shl i64 %polly.indvar5, 5
  br label %polly.loop_preheader15

polly.stmt.for.body5:                             ; preds = %polly.stmt.for.body5, %polly.loop_preheader15
  %polly.indvar17 = phi i64 [ 0, %polly.loop_preheader15 ], [ %polly.indvar_next18, %polly.stmt.for.body5 ]
  %9 = add nuw nsw i64 %polly.indvar17, %8
  %10 = shl i64 %9, 2
  %11 = add i64 %10, %13
  %scevgep = getelementptr i8, i8* %polly.subfunc.arg.call, i64 %11
  %scevgep20 = bitcast i8* %scevgep to i32*
  store i32 1, i32* %scevgep20, align 4, !alias.scope !43, !noalias !47, !llvm.mem.parallel_loop_access !73
  %scevgep21 = getelementptr i8, i8* %polly.subfunc.arg.call1, i64 %11
  %scevgep2122 = bitcast i8* %scevgep21 to i32*
  store i32 1, i32* %scevgep2122, align 4, !alias.scope !45, !noalias !48, !llvm.mem.parallel_loop_access !73
  %polly.indvar_next18 = add nuw nsw i64 %polly.indvar17, 1
  %exitcond = icmp eq i64 %polly.indvar_next18, 32
  br i1 %exitcond, label %polly.loop_exit16, label %polly.stmt.for.body5, !llvm.loop !73

polly.loop_preheader15:                           ; preds = %polly.loop_exit16, %polly.loop_preheader9
  %polly.indvar11 = phi i64 [ 0, %polly.loop_preheader9 ], [ %polly.indvar_next12, %polly.loop_exit16 ]
  %12 = add nsw i64 %polly.indvar11, %7
  %13 = shl i64 %12, 12
  br label %polly.stmt.for.body5
}

declare i8 @GOMP_loop_runtime_next(i64*, i64*)

declare void @GOMP_loop_end_nowait()

declare void @GOMP_parallel_loop_runtime_start(void (i8*)*, i8*, i32, i64, i64, i64)

declare void @GOMP_parallel_end()

; Function Attrs: argmemonly nounwind
declare void @llvm.lifetime.end(i64, i8* nocapture) #4

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "polly-optimized" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noreturn nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind readnone }
attributes #4 = { argmemonly nounwind }
attributes #5 = { "polly.skip.fn" }
attributes #6 = { nounwind }
attributes #7 = { noreturn nounwind }

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
!38 = distinct !{!38, !39, !"polly.alias.scope.call2"}
!39 = distinct !{!39, !"polly.alias.scope.domain"}
!40 = !{!41, !42, !43, !44, !45, !46}
!41 = distinct !{!41, !39, !"polly.alias.scope.total.02"}
!42 = distinct !{!42, !39, !"polly.alias.scope.tmp.04"}
!43 = distinct !{!43, !39, !"polly.alias.scope.call"}
!44 = distinct !{!44, !39, !"polly.alias.scope.add30.lcssa"}
!45 = distinct !{!45, !39, !"polly.alias.scope.call1"}
!46 = distinct !{!46, !39, !"polly.alias.scope.add45"}
!47 = !{!41, !42, !44, !38, !45, !46}
!48 = !{!41, !42, !43, !44, !38, !46}
!49 = !DILocation(line: 29, column: 23, scope: !50)
!50 = distinct !DILexicalBlock(scope: !51, file: !1, line: 27, column: 21)
!51 = distinct !DILexicalBlock(scope: !52, file: !1, line: 27, column: 3)
!52 = distinct !DILexicalBlock(scope: !53, file: !1, line: 27, column: 3)
!53 = distinct !DILexicalBlock(scope: !54, file: !1, line: 25, column: 18)
!54 = distinct !DILexicalBlock(scope: !55, file: !1, line: 25, column: 2)
!55 = distinct !DILexicalBlock(scope: !8, file: !1, line: 25, column: 2)
!56 = !DILocation(line: 29, column: 13, scope: !50)
!57 = !DILocation(line: 36, column: 19, scope: !58)
!58 = distinct !DILexicalBlock(scope: !59, file: !1, line: 35, column: 18)
!59 = distinct !DILexicalBlock(scope: !60, file: !1, line: 35, column: 2)
!60 = distinct !DILexicalBlock(scope: !8, file: !1, line: 35, column: 2)
!61 = !DILocation(line: 36, column: 17, scope: !58)
!62 = distinct !{!62, !63, !"polly.alias.scope.call2"}
!63 = distinct !{!63, !"polly.alias.scope.domain"}
!64 = !{!65, !66, !67, !68, !69, !70}
!65 = distinct !{!65, !63, !"polly.alias.scope.total.02.phiops.0"}
!66 = distinct !{!66, !63, !"polly.alias.scope.call"}
!67 = distinct !{!67, !63, !"polly.alias.scope.tmp.04.phiops.0"}
!68 = distinct !{!68, !63, !"polly.alias.scope.p_add30.3.lcssa"}
!69 = distinct !{!69, !63, !"polly.alias.scope.p_add45.4"}
!70 = distinct !{!70, !63, !"polly.alias.scope.call1"}
!71 = !{!65, !67, !62, !68, !69, !70}
!72 = !{!65, !66, !67, !62, !68, !69}
!73 = distinct !{!73}
