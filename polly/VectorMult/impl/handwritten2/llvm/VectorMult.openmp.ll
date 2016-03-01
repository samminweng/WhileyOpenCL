; ModuleID = 'VectorMult.preopt.ll'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@u = common global [1024 x i32] zeroinitializer, align 16
@v = common global [1024 x i32] zeroinitializer, align 16
@p = common global [1024 x i32] zeroinitializer, align 16
@sum = common global [67108864 x i32] zeroinitializer, align 16
@.str = private unnamed_addr constant [34 x i8] c"fail to multiply two unit vectors\00", align 1
@.str.1 = private unnamed_addr constant [1 x i8] zeroinitializer, align 1
@.str.2 = private unnamed_addr constant [100 x i8] c"Pass the %'lld vector multiplication test case with local vector size = %d\0AThe Dot Product = %'lld\0A\00", align 1

; Function Attrs: nounwind uwtable
define i32 @main(i32 %argc, i8** nocapture readnone %args) #0 {
entry:
  %.s2a44 = alloca <2 x i64>
  %.s2a = alloca <2 x i64>
  %vec.phi20.phiops = alloca <2 x i64>
  %vec.phi.phiops = alloca <2 x i64>
  %polly.par.userContext = alloca {}, align 8
  br label %polly.split_new_and_old47

polly.split_new_and_old47:                        ; preds = %entry
  br i1 true, label %polly.start49, label %vector.body

vector.body:                                      ; preds = %polly.split_new_and_old47, %vector.body
  %index = phi i64 [ %index.next.7, %vector.body ], [ 0, %polly.split_new_and_old47 ]
  %0 = getelementptr [67108864 x i32], [67108864 x i32]* @sum, i64 0, i64 %index
  %1 = bitcast i32* %0 to <4 x i32>*
  store <4 x i32> <i32 1024, i32 1024, i32 1024, i32 1024>, <4 x i32>* %1, align 16, !alias.scope !1, !noalias !3
  %2 = getelementptr i32, i32* %0, i64 4
  %3 = bitcast i32* %2 to <4 x i32>*
  store <4 x i32> <i32 1024, i32 1024, i32 1024, i32 1024>, <4 x i32>* %3, align 16, !alias.scope !1, !noalias !3
  %index.next = or i64 %index, 8
  %4 = getelementptr [67108864 x i32], [67108864 x i32]* @sum, i64 0, i64 %index.next
  %5 = bitcast i32* %4 to <4 x i32>*
  store <4 x i32> <i32 1024, i32 1024, i32 1024, i32 1024>, <4 x i32>* %5, align 16, !alias.scope !1, !noalias !3
  %6 = getelementptr i32, i32* %4, i64 4
  %7 = bitcast i32* %6 to <4 x i32>*
  store <4 x i32> <i32 1024, i32 1024, i32 1024, i32 1024>, <4 x i32>* %7, align 16, !alias.scope !1, !noalias !3
  %index.next.1 = or i64 %index, 16
  %8 = getelementptr [67108864 x i32], [67108864 x i32]* @sum, i64 0, i64 %index.next.1
  %9 = bitcast i32* %8 to <4 x i32>*
  store <4 x i32> <i32 1024, i32 1024, i32 1024, i32 1024>, <4 x i32>* %9, align 16, !alias.scope !1, !noalias !3
  %10 = getelementptr i32, i32* %8, i64 4
  %11 = bitcast i32* %10 to <4 x i32>*
  store <4 x i32> <i32 1024, i32 1024, i32 1024, i32 1024>, <4 x i32>* %11, align 16, !alias.scope !1, !noalias !3
  %index.next.2 = or i64 %index, 24
  %12 = getelementptr [67108864 x i32], [67108864 x i32]* @sum, i64 0, i64 %index.next.2
  %13 = bitcast i32* %12 to <4 x i32>*
  store <4 x i32> <i32 1024, i32 1024, i32 1024, i32 1024>, <4 x i32>* %13, align 16, !alias.scope !1, !noalias !3
  %14 = getelementptr i32, i32* %12, i64 4
  %15 = bitcast i32* %14 to <4 x i32>*
  store <4 x i32> <i32 1024, i32 1024, i32 1024, i32 1024>, <4 x i32>* %15, align 16, !alias.scope !1, !noalias !3
  %index.next.3 = or i64 %index, 32
  %16 = getelementptr [67108864 x i32], [67108864 x i32]* @sum, i64 0, i64 %index.next.3
  %17 = bitcast i32* %16 to <4 x i32>*
  store <4 x i32> <i32 1024, i32 1024, i32 1024, i32 1024>, <4 x i32>* %17, align 16, !alias.scope !1, !noalias !3
  %18 = getelementptr i32, i32* %16, i64 4
  %19 = bitcast i32* %18 to <4 x i32>*
  store <4 x i32> <i32 1024, i32 1024, i32 1024, i32 1024>, <4 x i32>* %19, align 16, !alias.scope !1, !noalias !3
  %index.next.4 = or i64 %index, 40
  %20 = getelementptr [67108864 x i32], [67108864 x i32]* @sum, i64 0, i64 %index.next.4
  %21 = bitcast i32* %20 to <4 x i32>*
  store <4 x i32> <i32 1024, i32 1024, i32 1024, i32 1024>, <4 x i32>* %21, align 16, !alias.scope !1, !noalias !3
  %22 = getelementptr i32, i32* %20, i64 4
  %23 = bitcast i32* %22 to <4 x i32>*
  store <4 x i32> <i32 1024, i32 1024, i32 1024, i32 1024>, <4 x i32>* %23, align 16, !alias.scope !1, !noalias !3
  %index.next.5 = or i64 %index, 48
  %24 = getelementptr [67108864 x i32], [67108864 x i32]* @sum, i64 0, i64 %index.next.5
  %25 = bitcast i32* %24 to <4 x i32>*
  store <4 x i32> <i32 1024, i32 1024, i32 1024, i32 1024>, <4 x i32>* %25, align 16, !alias.scope !1, !noalias !3
  %26 = getelementptr i32, i32* %24, i64 4
  %27 = bitcast i32* %26 to <4 x i32>*
  store <4 x i32> <i32 1024, i32 1024, i32 1024, i32 1024>, <4 x i32>* %27, align 16, !alias.scope !1, !noalias !3
  %index.next.6 = or i64 %index, 56
  %28 = getelementptr [67108864 x i32], [67108864 x i32]* @sum, i64 0, i64 %index.next.6
  %29 = bitcast i32* %28 to <4 x i32>*
  store <4 x i32> <i32 1024, i32 1024, i32 1024, i32 1024>, <4 x i32>* %29, align 16, !alias.scope !1, !noalias !3
  %30 = getelementptr i32, i32* %28, i64 4
  %31 = bitcast i32* %30 to <4 x i32>*
  store <4 x i32> <i32 1024, i32 1024, i32 1024, i32 1024>, <4 x i32>* %31, align 16, !alias.scope !1, !noalias !3
  %index.next.7 = add nsw i64 %index, 64
  %32 = icmp eq i64 %index.next.7, 67108864
  br i1 %32, label %polly.merge_new_and_old48, label %vector.body, !llvm.loop !9

if.then:                                          ; preds = %middle.block12
  %call = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([34 x i8], [34 x i8]* @.str, i64 0, i64 0)) #5
  tail call void @exit(i32 -2) #6
  unreachable

if.end:                                           ; preds = %middle.block12
  %call29 = tail call i8* @setlocale(i32 6, i8* getelementptr inbounds ([1 x i8], [1 x i8]* @.str.1, i64 0, i64 0)) #5
  %call30 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([100 x i8], [100 x i8]* @.str.2, i64 0, i64 0), i64 68719476736, i32 1024, i64 68719476736) #5
  ret i32 0

polly.merge_new_and_old48:                        ; preds = %polly.exiting50, %vector.body
  br label %polly.parallel.for

polly.parallel.for:                               ; preds = %polly.merge_new_and_old48
  %33 = bitcast {}* %polly.par.userContext to i8*
  call void @llvm.lifetime.start(i64 0, i8* %33)
  call void @GOMP_parallel_loop_runtime_start(void (i8*)* nonnull @main_polly_subfn, i8* %33, i32 0, i64 0, i64 32, i64 1) #5
  call void @main_polly_subfn(i8* %33) #5
  call void @GOMP_parallel_end() #5
  call void @llvm.lifetime.end(i64 8, i8* %33)
  br label %polly.split_new_and_old

polly.split_new_and_old:                          ; preds = %polly.parallel.for
  br i1 true, label %polly.start, label %vector.body11

vector.body11:                                    ; preds = %polly.split_new_and_old, %vector.body11
  %index16 = phi i64 [ %index.next17.1, %vector.body11 ], [ 0, %polly.split_new_and_old ]
  %vec.phi = phi <2 x i64> [ %48, %vector.body11 ], [ zeroinitializer, %polly.split_new_and_old ]
  %vec.phi20 = phi <2 x i64> [ %49, %vector.body11 ], [ zeroinitializer, %polly.split_new_and_old ]
  %34 = getelementptr [67108864 x i32], [67108864 x i32]* @sum, i64 0, i64 %index16
  %35 = bitcast i32* %34 to <2 x i32>*
  %wide.load = load <2 x i32>, <2 x i32>* %35, align 16, !alias.scope !1, !noalias !3
  %36 = getelementptr i32, i32* %34, i64 2
  %37 = bitcast i32* %36 to <2 x i32>*
  %wide.load25 = load <2 x i32>, <2 x i32>* %37, align 8, !alias.scope !1, !noalias !3
  %38 = sext <2 x i32> %wide.load to <2 x i64>
  %39 = sext <2 x i32> %wide.load25 to <2 x i64>
  %40 = add nsw <2 x i64> %38, %vec.phi
  %41 = add nsw <2 x i64> %39, %vec.phi20
  %index.next17 = or i64 %index16, 4
  %42 = getelementptr [67108864 x i32], [67108864 x i32]* @sum, i64 0, i64 %index.next17
  %43 = bitcast i32* %42 to <2 x i32>*
  %wide.load.1 = load <2 x i32>, <2 x i32>* %43, align 16, !alias.scope !1, !noalias !3
  %44 = getelementptr i32, i32* %42, i64 2
  %45 = bitcast i32* %44 to <2 x i32>*
  %wide.load25.1 = load <2 x i32>, <2 x i32>* %45, align 8, !alias.scope !1, !noalias !3
  %46 = sext <2 x i32> %wide.load.1 to <2 x i64>
  %47 = sext <2 x i32> %wide.load25.1 to <2 x i64>
  %48 = add nsw <2 x i64> %46, %40
  %49 = add nsw <2 x i64> %47, %41
  %index.next17.1 = add nsw i64 %index16, 8
  %50 = icmp eq i64 %index.next17.1, 67108864
  br i1 %50, label %polly.merge_new_and_old, label %vector.body11, !llvm.loop !12

polly.merge_new_and_old:                          ; preds = %polly.exiting, %vector.body11
  %.merge = phi <2 x i64> [ %.final_reload, %polly.exiting ], [ %48, %vector.body11 ]
  %.merge46 = phi <2 x i64> [ %.final_reload45, %polly.exiting ], [ %49, %vector.body11 ]
  br label %middle.block12

middle.block12:                                   ; preds = %polly.merge_new_and_old
  %.lcssa28 = phi <2 x i64> [ %.merge46, %polly.merge_new_and_old ]
  %.lcssa = phi <2 x i64> [ %.merge, %polly.merge_new_and_old ]
  %bin.rdx = add <2 x i64> %.lcssa28, %.lcssa
  %rdx.shuf = shufflevector <2 x i64> %bin.rdx, <2 x i64> undef, <2 x i32> <i32 1, i32 undef>
  %bin.rdx26 = add <2 x i64> %bin.rdx, %rdx.shuf
  %51 = extractelement <2 x i64> %bin.rdx26, i32 0
  %cmp27 = icmp eq i64 %51, 68719476736
  br i1 %cmp27, label %if.end, label %if.then

polly.start:                                      ; preds = %polly.split_new_and_old
  store <2 x i64> zeroinitializer, <2 x i64>* %vec.phi.phiops
  store <2 x i64> zeroinitializer, <2 x i64>* %vec.phi20.phiops
  br label %polly.loop_preheader

polly.loop_exit:                                  ; preds = %polly.stmt.vector.body11
  br label %polly.exiting

polly.exiting:                                    ; preds = %polly.loop_exit
  %.final_reload = load <2 x i64>, <2 x i64>* %.s2a
  %.final_reload45 = load <2 x i64>, <2 x i64>* %.s2a44
  br label %polly.merge_new_and_old

polly.loop_header:                                ; preds = %polly.stmt.vector.body11, %polly.loop_preheader
  %polly.indvar = phi i64 [ 0, %polly.loop_preheader ], [ %polly.indvar_next, %polly.stmt.vector.body11 ]
  br label %polly.stmt.vector.body11

polly.stmt.vector.body11:                         ; preds = %polly.loop_header
  %vec.phi.phiops.reload = load <2 x i64>, <2 x i64>* %vec.phi.phiops
  %vec.phi20.phiops.reload = load <2 x i64>, <2 x i64>* %vec.phi20.phiops
  %52 = shl i64 %polly.indvar, 3
  %scevgep = getelementptr [67108864 x i32], [67108864 x i32]* @sum, i64 0, i64 %52
  %scevgep29 = bitcast i32* %scevgep to <2 x i32>*
  %wide.load_p_scalar_ = load <2 x i32>, <2 x i32>* %scevgep29, align 16, !alias.scope !13, !noalias !15
  %scevgep30 = getelementptr i32, i32* getelementptr inbounds ([67108864 x i32], [67108864 x i32]* @sum, i64 0, i64 2), i64 %52
  %scevgep3031 = bitcast i32* %scevgep30 to <2 x i32>*
  %wide.load25_p_scalar_ = load <2 x i32>, <2 x i32>* %scevgep3031, align 8, !alias.scope !13, !noalias !15
  %p_ = sext <2 x i32> %wide.load_p_scalar_ to <2 x i64>
  %p_32 = sext <2 x i32> %wide.load25_p_scalar_ to <2 x i64>
  %p_33 = add nsw <2 x i64> %p_, %vec.phi.phiops.reload
  %p_34 = add nsw <2 x i64> %p_32, %vec.phi20.phiops.reload
  %53 = shl i64 %polly.indvar, 3
  %scevgep35 = getelementptr i32, i32* getelementptr inbounds ([67108864 x i32], [67108864 x i32]* @sum, i64 0, i64 4), i64 %53
  %scevgep3536 = bitcast i32* %scevgep35 to <2 x i32>*
  %wide.load.1_p_scalar_ = load <2 x i32>, <2 x i32>* %scevgep3536, align 16, !alias.scope !13, !noalias !15
  %scevgep37 = getelementptr i32, i32* getelementptr inbounds ([67108864 x i32], [67108864 x i32]* @sum, i64 0, i64 6), i64 %53
  %scevgep3738 = bitcast i32* %scevgep37 to <2 x i32>*
  %wide.load25.1_p_scalar_ = load <2 x i32>, <2 x i32>* %scevgep3738, align 8, !alias.scope !13, !noalias !15
  %p_39 = sext <2 x i32> %wide.load.1_p_scalar_ to <2 x i64>
  %p_40 = sext <2 x i32> %wide.load25.1_p_scalar_ to <2 x i64>
  %p_41 = add nsw <2 x i64> %p_39, %p_33
  %p_42 = add nsw <2 x i64> %p_40, %p_34
  %54 = shl i64 %polly.indvar, 3
  %55 = add i64 %54, 8
  %p_43 = icmp eq i64 %55, 67108864
  store <2 x i64> %p_41, <2 x i64>* %vec.phi.phiops
  store <2 x i64> %p_42, <2 x i64>* %vec.phi20.phiops
  store <2 x i64> %p_41, <2 x i64>* %.s2a
  store <2 x i64> %p_42, <2 x i64>* %.s2a44
  %polly.indvar_next = add nsw i64 %polly.indvar, 1
  %polly.loop_cond = icmp sle i64 %polly.indvar, 8388606
  br i1 %polly.loop_cond, label %polly.loop_header, label %polly.loop_exit

polly.loop_preheader:                             ; preds = %polly.start
  br label %polly.loop_header

polly.start49:                                    ; preds = %polly.split_new_and_old47
  br label %polly.loop_preheader52

polly.loop_exit53:                                ; preds = %polly.stmt.vector.body
  br label %polly.exiting50

polly.exiting50:                                  ; preds = %polly.loop_exit53
  br label %polly.merge_new_and_old48

polly.loop_header51:                              ; preds = %polly.stmt.vector.body, %polly.loop_preheader52
  %polly.indvar54 = phi i64 [ 0, %polly.loop_preheader52 ], [ %polly.indvar_next55, %polly.stmt.vector.body ]
  br label %polly.stmt.vector.body

polly.stmt.vector.body:                           ; preds = %polly.loop_header51
  %56 = shl i64 %polly.indvar54, 6
  %scevgep57 = getelementptr [67108864 x i32], [67108864 x i32]* @sum, i64 0, i64 %56
  %scevgep5758 = bitcast i32* %scevgep57 to <4 x i32>*
  store <4 x i32> <i32 1024, i32 1024, i32 1024, i32 1024>, <4 x i32>* %scevgep5758, align 16, !alias.scope !20, !noalias !22, !llvm.mem.parallel_loop_access !23
  %scevgep59 = getelementptr i32, i32* getelementptr inbounds ([67108864 x i32], [67108864 x i32]* @sum, i64 0, i64 4), i64 %56
  %scevgep5960 = bitcast i32* %scevgep59 to <4 x i32>*
  store <4 x i32> <i32 1024, i32 1024, i32 1024, i32 1024>, <4 x i32>* %scevgep5960, align 16, !alias.scope !20, !noalias !22, !llvm.mem.parallel_loop_access !23
  %57 = shl i64 %polly.indvar54, 6
  %scevgep61 = getelementptr i32, i32* getelementptr inbounds ([67108864 x i32], [67108864 x i32]* @sum, i64 0, i64 8), i64 %57
  %scevgep6162 = bitcast i32* %scevgep61 to <4 x i32>*
  store <4 x i32> <i32 1024, i32 1024, i32 1024, i32 1024>, <4 x i32>* %scevgep6162, align 16, !alias.scope !20, !noalias !22, !llvm.mem.parallel_loop_access !23
  %scevgep63 = getelementptr i32, i32* getelementptr inbounds ([67108864 x i32], [67108864 x i32]* @sum, i64 0, i64 12), i64 %57
  %scevgep6364 = bitcast i32* %scevgep63 to <4 x i32>*
  store <4 x i32> <i32 1024, i32 1024, i32 1024, i32 1024>, <4 x i32>* %scevgep6364, align 16, !alias.scope !20, !noalias !22, !llvm.mem.parallel_loop_access !23
  %58 = shl i64 %polly.indvar54, 6
  %scevgep65 = getelementptr i32, i32* getelementptr inbounds ([67108864 x i32], [67108864 x i32]* @sum, i64 0, i64 16), i64 %58
  %scevgep6566 = bitcast i32* %scevgep65 to <4 x i32>*
  store <4 x i32> <i32 1024, i32 1024, i32 1024, i32 1024>, <4 x i32>* %scevgep6566, align 16, !alias.scope !20, !noalias !22, !llvm.mem.parallel_loop_access !23
  %scevgep67 = getelementptr i32, i32* getelementptr inbounds ([67108864 x i32], [67108864 x i32]* @sum, i64 0, i64 20), i64 %58
  %scevgep6768 = bitcast i32* %scevgep67 to <4 x i32>*
  store <4 x i32> <i32 1024, i32 1024, i32 1024, i32 1024>, <4 x i32>* %scevgep6768, align 16, !alias.scope !20, !noalias !22, !llvm.mem.parallel_loop_access !23
  %59 = shl i64 %polly.indvar54, 6
  %scevgep69 = getelementptr i32, i32* getelementptr inbounds ([67108864 x i32], [67108864 x i32]* @sum, i64 0, i64 24), i64 %59
  %scevgep6970 = bitcast i32* %scevgep69 to <4 x i32>*
  store <4 x i32> <i32 1024, i32 1024, i32 1024, i32 1024>, <4 x i32>* %scevgep6970, align 16, !alias.scope !20, !noalias !22, !llvm.mem.parallel_loop_access !23
  %scevgep71 = getelementptr i32, i32* getelementptr inbounds ([67108864 x i32], [67108864 x i32]* @sum, i64 0, i64 28), i64 %59
  %scevgep7172 = bitcast i32* %scevgep71 to <4 x i32>*
  store <4 x i32> <i32 1024, i32 1024, i32 1024, i32 1024>, <4 x i32>* %scevgep7172, align 16, !alias.scope !20, !noalias !22, !llvm.mem.parallel_loop_access !23
  %60 = shl i64 %polly.indvar54, 6
  %scevgep73 = getelementptr i32, i32* getelementptr inbounds ([67108864 x i32], [67108864 x i32]* @sum, i64 0, i64 32), i64 %60
  %scevgep7374 = bitcast i32* %scevgep73 to <4 x i32>*
  store <4 x i32> <i32 1024, i32 1024, i32 1024, i32 1024>, <4 x i32>* %scevgep7374, align 16, !alias.scope !20, !noalias !22, !llvm.mem.parallel_loop_access !23
  %scevgep75 = getelementptr i32, i32* getelementptr inbounds ([67108864 x i32], [67108864 x i32]* @sum, i64 0, i64 36), i64 %60
  %scevgep7576 = bitcast i32* %scevgep75 to <4 x i32>*
  store <4 x i32> <i32 1024, i32 1024, i32 1024, i32 1024>, <4 x i32>* %scevgep7576, align 16, !alias.scope !20, !noalias !22, !llvm.mem.parallel_loop_access !23
  %61 = shl i64 %polly.indvar54, 6
  %scevgep77 = getelementptr i32, i32* getelementptr inbounds ([67108864 x i32], [67108864 x i32]* @sum, i64 0, i64 40), i64 %61
  %scevgep7778 = bitcast i32* %scevgep77 to <4 x i32>*
  store <4 x i32> <i32 1024, i32 1024, i32 1024, i32 1024>, <4 x i32>* %scevgep7778, align 16, !alias.scope !20, !noalias !22, !llvm.mem.parallel_loop_access !23
  %scevgep79 = getelementptr i32, i32* getelementptr inbounds ([67108864 x i32], [67108864 x i32]* @sum, i64 0, i64 44), i64 %61
  %scevgep7980 = bitcast i32* %scevgep79 to <4 x i32>*
  store <4 x i32> <i32 1024, i32 1024, i32 1024, i32 1024>, <4 x i32>* %scevgep7980, align 16, !alias.scope !20, !noalias !22, !llvm.mem.parallel_loop_access !23
  %62 = shl i64 %polly.indvar54, 6
  %scevgep81 = getelementptr i32, i32* getelementptr inbounds ([67108864 x i32], [67108864 x i32]* @sum, i64 0, i64 48), i64 %62
  %scevgep8182 = bitcast i32* %scevgep81 to <4 x i32>*
  store <4 x i32> <i32 1024, i32 1024, i32 1024, i32 1024>, <4 x i32>* %scevgep8182, align 16, !alias.scope !20, !noalias !22, !llvm.mem.parallel_loop_access !23
  %scevgep83 = getelementptr i32, i32* getelementptr inbounds ([67108864 x i32], [67108864 x i32]* @sum, i64 0, i64 52), i64 %62
  %scevgep8384 = bitcast i32* %scevgep83 to <4 x i32>*
  store <4 x i32> <i32 1024, i32 1024, i32 1024, i32 1024>, <4 x i32>* %scevgep8384, align 16, !alias.scope !20, !noalias !22, !llvm.mem.parallel_loop_access !23
  %63 = shl i64 %polly.indvar54, 6
  %scevgep85 = getelementptr i32, i32* getelementptr inbounds ([67108864 x i32], [67108864 x i32]* @sum, i64 0, i64 56), i64 %63
  %scevgep8586 = bitcast i32* %scevgep85 to <4 x i32>*
  store <4 x i32> <i32 1024, i32 1024, i32 1024, i32 1024>, <4 x i32>* %scevgep8586, align 16, !alias.scope !20, !noalias !22, !llvm.mem.parallel_loop_access !23
  %scevgep87 = getelementptr i32, i32* getelementptr inbounds ([67108864 x i32], [67108864 x i32]* @sum, i64 0, i64 60), i64 %63
  %scevgep8788 = bitcast i32* %scevgep87 to <4 x i32>*
  store <4 x i32> <i32 1024, i32 1024, i32 1024, i32 1024>, <4 x i32>* %scevgep8788, align 16, !alias.scope !20, !noalias !22, !llvm.mem.parallel_loop_access !23
  %64 = shl i64 %polly.indvar54, 6
  %65 = add i64 %64, 64
  %p_89 = icmp eq i64 %65, 67108864
  %polly.indvar_next55 = add nsw i64 %polly.indvar54, 1
  %polly.loop_cond56 = icmp sle i64 %polly.indvar54, 1048574
  br i1 %polly.loop_cond56, label %polly.loop_header51, label %polly.loop_exit53, !llvm.loop !23

polly.loop_preheader52:                           ; preds = %polly.start49
  br label %polly.loop_header51
}

; Function Attrs: nounwind
declare i32 @printf(i8* nocapture readonly, ...) #1

; Function Attrs: noreturn nounwind
declare void @exit(i32) #2

; Function Attrs: nounwind
declare i8* @setlocale(i32, i8*) #1

; Function Attrs: argmemonly nounwind
declare void @llvm.lifetime.start(i64, i8* nocapture) #3

define internal void @main_polly_subfn(i8* nocapture readnone %polly.par.userContext) #4 {
polly.par.setup:
  %polly.par.LBPtr = alloca i64, align 8
  %polly.par.UBPtr = alloca i64, align 8
  %0 = call i8 @GOMP_loop_runtime_next(i64* nonnull %polly.par.LBPtr, i64* nonnull %polly.par.UBPtr)
  %1 = icmp eq i8 %0, 0
  br i1 %1, label %polly.par.exit, label %polly.par.loadIVBounds.preheader

polly.par.loadIVBounds.preheader:                 ; preds = %polly.par.setup
  br label %polly.par.loadIVBounds

polly.par.exit.loopexit:                          ; preds = %polly.par.checkNext.loopexit
  br label %polly.par.exit

polly.par.exit:                                   ; preds = %polly.par.exit.loopexit, %polly.par.setup
  call void @GOMP_loop_end_nowait()
  ret void

polly.par.checkNext.loopexit:                     ; preds = %polly.loop_exit4
  %2 = call i8 @GOMP_loop_runtime_next(i64* nonnull %polly.par.LBPtr, i64* nonnull %polly.par.UBPtr)
  %3 = icmp eq i8 %2, 0
  br i1 %3, label %polly.par.exit.loopexit, label %polly.par.loadIVBounds

polly.par.loadIVBounds:                           ; preds = %polly.par.loadIVBounds.preheader, %polly.par.checkNext.loopexit
  %polly.par.UB = load i64, i64* %polly.par.UBPtr, align 8
  %polly.par.LB = load i64, i64* %polly.par.LBPtr, align 8
  %polly.adjust_ub = add i64 %polly.par.UB, -2
  br label %polly.loop_preheader3

polly.loop_exit4:                                 ; preds = %vector.body
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* %8, align 16, !alias.scope !5, !noalias !24
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* %9, align 16, !alias.scope !7, !noalias !25
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* %10, align 16, !alias.scope !8, !noalias !26
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* %15, align 16, !alias.scope !5, !noalias !24
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* %16, align 16, !alias.scope !7, !noalias !25
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* %17, align 16, !alias.scope !8, !noalias !26
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* %22, align 16, !alias.scope !5, !noalias !24
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* %23, align 16, !alias.scope !7, !noalias !25
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* %24, align 16, !alias.scope !8, !noalias !26
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* %29, align 16, !alias.scope !5, !noalias !24
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* %30, align 16, !alias.scope !7, !noalias !25
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* %31, align 16, !alias.scope !8, !noalias !26
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* %36, align 16, !alias.scope !5, !noalias !24
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* %37, align 16, !alias.scope !7, !noalias !25
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* %38, align 16, !alias.scope !8, !noalias !26
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* %43, align 16, !alias.scope !5, !noalias !24
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* %44, align 16, !alias.scope !7, !noalias !25
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* %45, align 16, !alias.scope !8, !noalias !26
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* %50, align 16, !alias.scope !5, !noalias !24
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* %51, align 16, !alias.scope !7, !noalias !25
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* %52, align 16, !alias.scope !8, !noalias !26
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* %57, align 16, !alias.scope !5, !noalias !24
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* %58, align 16, !alias.scope !7, !noalias !25
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* %59, align 16, !alias.scope !8, !noalias !26
  %polly.indvar_next = add nsw i64 %polly.indvar, 1
  %polly.loop_cond = icmp sgt i64 %polly.indvar, %polly.adjust_ub
  br i1 %polly.loop_cond, label %polly.par.checkNext.loopexit, label %polly.loop_preheader3

polly.loop_preheader3:                            ; preds = %polly.par.loadIVBounds, %polly.loop_exit4
  %polly.indvar = phi i64 [ %polly.par.LB, %polly.par.loadIVBounds ], [ %polly.indvar_next, %polly.loop_exit4 ]
  %4 = shl nsw i64 %polly.indvar, 5
  %5 = getelementptr [1024 x i32], [1024 x i32]* @v, i64 0, i64 %4
  %6 = getelementptr [1024 x i32], [1024 x i32]* @u, i64 0, i64 %4
  %7 = getelementptr [1024 x i32], [1024 x i32]* @p, i64 0, i64 %4
  %8 = bitcast i32* %6 to <4 x i32>*
  %9 = bitcast i32* %5 to <4 x i32>*
  %10 = bitcast i32* %7 to <4 x i32>*
  %11 = or i64 %4, 4
  %12 = getelementptr [1024 x i32], [1024 x i32]* @v, i64 0, i64 %11
  %13 = getelementptr [1024 x i32], [1024 x i32]* @u, i64 0, i64 %11
  %14 = getelementptr [1024 x i32], [1024 x i32]* @p, i64 0, i64 %11
  %15 = bitcast i32* %13 to <4 x i32>*
  %16 = bitcast i32* %12 to <4 x i32>*
  %17 = bitcast i32* %14 to <4 x i32>*
  %18 = or i64 %4, 8
  %19 = getelementptr [1024 x i32], [1024 x i32]* @v, i64 0, i64 %18
  %20 = getelementptr [1024 x i32], [1024 x i32]* @u, i64 0, i64 %18
  %21 = getelementptr [1024 x i32], [1024 x i32]* @p, i64 0, i64 %18
  %22 = bitcast i32* %20 to <4 x i32>*
  %23 = bitcast i32* %19 to <4 x i32>*
  %24 = bitcast i32* %21 to <4 x i32>*
  %25 = or i64 %4, 12
  %26 = getelementptr [1024 x i32], [1024 x i32]* @v, i64 0, i64 %25
  %27 = getelementptr [1024 x i32], [1024 x i32]* @u, i64 0, i64 %25
  %28 = getelementptr [1024 x i32], [1024 x i32]* @p, i64 0, i64 %25
  %29 = bitcast i32* %27 to <4 x i32>*
  %30 = bitcast i32* %26 to <4 x i32>*
  %31 = bitcast i32* %28 to <4 x i32>*
  %32 = or i64 %4, 16
  %33 = getelementptr [1024 x i32], [1024 x i32]* @v, i64 0, i64 %32
  %34 = getelementptr [1024 x i32], [1024 x i32]* @u, i64 0, i64 %32
  %35 = getelementptr [1024 x i32], [1024 x i32]* @p, i64 0, i64 %32
  %36 = bitcast i32* %34 to <4 x i32>*
  %37 = bitcast i32* %33 to <4 x i32>*
  %38 = bitcast i32* %35 to <4 x i32>*
  %39 = or i64 %4, 20
  %40 = getelementptr [1024 x i32], [1024 x i32]* @v, i64 0, i64 %39
  %41 = getelementptr [1024 x i32], [1024 x i32]* @u, i64 0, i64 %39
  %42 = getelementptr [1024 x i32], [1024 x i32]* @p, i64 0, i64 %39
  %43 = bitcast i32* %41 to <4 x i32>*
  %44 = bitcast i32* %40 to <4 x i32>*
  %45 = bitcast i32* %42 to <4 x i32>*
  %46 = or i64 %4, 24
  %47 = getelementptr [1024 x i32], [1024 x i32]* @v, i64 0, i64 %46
  %48 = getelementptr [1024 x i32], [1024 x i32]* @u, i64 0, i64 %46
  %49 = getelementptr [1024 x i32], [1024 x i32]* @p, i64 0, i64 %46
  %50 = bitcast i32* %48 to <4 x i32>*
  %51 = bitcast i32* %47 to <4 x i32>*
  %52 = bitcast i32* %49 to <4 x i32>*
  %53 = or i64 %4, 28
  %54 = getelementptr [1024 x i32], [1024 x i32]* @v, i64 0, i64 %53
  %55 = getelementptr [1024 x i32], [1024 x i32]* @u, i64 0, i64 %53
  %56 = getelementptr [1024 x i32], [1024 x i32]* @p, i64 0, i64 %53
  %57 = bitcast i32* %55 to <4 x i32>*
  %58 = bitcast i32* %54 to <4 x i32>*
  %59 = bitcast i32* %56 to <4 x i32>*
  br label %vector.ph

vector.ph:                                        ; preds = %vector.body, %polly.loop_preheader3
  %polly.indvar5 = phi i64 [ 0, %polly.loop_preheader3 ], [ %polly.indvar_next6, %vector.body ]
  br label %vector.body

vector.body:                                      ; preds = %vector.ph
  %polly.indvar_next6 = add nuw nsw i64 %polly.indvar5, 1
  %exitcond23 = icmp eq i64 %polly.indvar_next6, 2097152
  br i1 %exitcond23, label %polly.loop_exit4, label %vector.ph
}

declare i8 @GOMP_loop_runtime_next(i64*, i64*)

declare void @GOMP_loop_end_nowait()

declare void @GOMP_parallel_loop_runtime_start(void (i8*)*, i8*, i32, i64, i64, i64)

declare void @GOMP_parallel_end()

; Function Attrs: argmemonly nounwind
declare void @llvm.lifetime.end(i64, i8* nocapture) #3

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "polly-optimized" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noreturn nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { argmemonly nounwind }
attributes #4 = { "polly.skip.fn" }
attributes #5 = { nounwind }
attributes #6 = { noreturn nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 3.9.0 (http://llvm.org/git/clang.git e177b4a63ca92c5fec010986944530688e104074) (http://llvm.org/git/llvm.git fcd97ccb03712372fe95f1732638de5ed3fcabe8)"}
!1 = distinct !{!1, !2, !"polly.alias.scope.sum"}
!2 = distinct !{!2, !"polly.alias.scope.domain"}
!3 = !{!4, !5, !6, !7, !8}
!4 = distinct !{!4, !2, !"polly.alias.scope.add23"}
!5 = distinct !{!5, !2, !"polly.alias.scope.u"}
!6 = distinct !{!6, !2, !"polly.alias.scope.total.02"}
!7 = distinct !{!7, !2, !"polly.alias.scope.v"}
!8 = distinct !{!8, !2, !"polly.alias.scope.p"}
!9 = distinct !{!9, !10, !11}
!10 = !{!"llvm.loop.vectorize.width", i32 1}
!11 = !{!"llvm.loop.interleave.count", i32 1}
!12 = distinct !{!12, !10, !11}
!13 = distinct !{!13, !14, !"polly.alias.scope.sum"}
!14 = distinct !{!14, !"polly.alias.scope.domain"}
!15 = !{!16, !17, !18, !19}
!16 = distinct !{!16, !14, !"polly.alias.scope.vec.phi"}
!17 = distinct !{!17, !14, !"polly.alias.scope."}
!18 = distinct !{!18, !14, !"polly.alias.scope.vec.phi20"}
!19 = distinct !{!19, !14, !"polly.alias.scope."}
!20 = distinct !{!20, !21, !"polly.alias.scope.sum"}
!21 = distinct !{!21, !"polly.alias.scope.domain"}
!22 = !{}
!23 = distinct !{!23}
!24 = !{!1, !4, !6, !7, !8}
!25 = !{!1, !4, !5, !6, !8}
!26 = !{!1, !4, !5, !6, !7}
