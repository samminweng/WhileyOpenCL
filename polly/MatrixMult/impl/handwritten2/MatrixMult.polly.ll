; ModuleID = 'MatrixMult.preopt.ll'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [46 x i8] c"Pass %d X %d matrix test case (C[%d][%d]=%d)\0A\00", align 1

; Function Attrs: nounwind uwtable
define noalias i32* @init_array(i32 %value) #0 {
entry:
  %call = tail call noalias i8* @malloc(i64 4194304) #4
  br label %polly.loop_preheader2

polly.exiting:                                    ; preds = %polly.loop_exit3
  %0 = bitcast i8* %call to i32*
  ret i32* %0

polly.loop_exit3:                                 ; preds = %polly.loop_exit9
  %polly.indvar_next = add nuw nsw i64 %polly.indvar, 1
  %exitcond22 = icmp eq i64 %polly.indvar_next, 32
  br i1 %exitcond22, label %polly.exiting, label %polly.loop_preheader2

polly.loop_exit9:                                 ; preds = %polly.loop_exit15
  %polly.indvar_next5 = add nuw nsw i64 %polly.indvar4, 1
  %exitcond21 = icmp eq i64 %polly.indvar_next5, 32
  br i1 %exitcond21, label %polly.loop_exit3, label %polly.loop_preheader8

polly.loop_preheader2:                            ; preds = %polly.loop_exit3, %entry
  %polly.indvar = phi i64 [ 0, %entry ], [ %polly.indvar_next, %polly.loop_exit3 ]
  %1 = shl i64 %polly.indvar, 5
  br label %polly.loop_preheader8

polly.loop_exit15:                                ; preds = %polly.stmt.for.body3
  %polly.indvar_next11 = add nuw nsw i64 %polly.indvar10, 1
  %exitcond20 = icmp eq i64 %polly.indvar_next11, 32
  br i1 %exitcond20, label %polly.loop_exit9, label %polly.loop_preheader14

polly.loop_preheader8:                            ; preds = %polly.loop_exit9, %polly.loop_preheader2
  %polly.indvar4 = phi i64 [ 0, %polly.loop_preheader2 ], [ %polly.indvar_next5, %polly.loop_exit9 ]
  %2 = shl i64 %polly.indvar4, 5
  br label %polly.loop_preheader14

polly.stmt.for.body3:                             ; preds = %polly.stmt.for.body3, %polly.loop_preheader14
  %polly.indvar16 = phi i64 [ 0, %polly.loop_preheader14 ], [ %polly.indvar_next17.3, %polly.stmt.for.body3 ]
  %3 = add nuw nsw i64 %polly.indvar16, %2
  %4 = shl i64 %3, 2
  %5 = add nuw nsw i64 %4, %16
  %scevgep = getelementptr i8, i8* %call, i64 %5
  %scevgep19 = bitcast i8* %scevgep to i32*
  store i32 %value, i32* %scevgep19, align 4, !alias.scope !1, !noalias !3
  %polly.indvar_next17 = or i64 %polly.indvar16, 1
  %6 = add nuw nsw i64 %polly.indvar_next17, %2
  %7 = shl i64 %6, 2
  %8 = add nuw nsw i64 %7, %16
  %scevgep.1 = getelementptr i8, i8* %call, i64 %8
  %scevgep19.1 = bitcast i8* %scevgep.1 to i32*
  store i32 %value, i32* %scevgep19.1, align 4, !alias.scope !1, !noalias !3
  %polly.indvar_next17.1 = or i64 %polly.indvar16, 2
  %9 = add nuw nsw i64 %polly.indvar_next17.1, %2
  %10 = shl i64 %9, 2
  %11 = add nuw nsw i64 %10, %16
  %scevgep.2 = getelementptr i8, i8* %call, i64 %11
  %scevgep19.2 = bitcast i8* %scevgep.2 to i32*
  store i32 %value, i32* %scevgep19.2, align 4, !alias.scope !1, !noalias !3
  %polly.indvar_next17.2 = or i64 %polly.indvar16, 3
  %12 = add nuw nsw i64 %polly.indvar_next17.2, %2
  %13 = shl i64 %12, 2
  %14 = add nuw nsw i64 %13, %16
  %scevgep.3 = getelementptr i8, i8* %call, i64 %14
  %scevgep19.3 = bitcast i8* %scevgep.3 to i32*
  store i32 %value, i32* %scevgep19.3, align 4, !alias.scope !1, !noalias !3
  %polly.indvar_next17.3 = add nsw i64 %polly.indvar16, 4
  %exitcond.3 = icmp eq i64 %polly.indvar_next17.3, 32
  br i1 %exitcond.3, label %polly.loop_exit15, label %polly.stmt.for.body3

polly.loop_preheader14:                           ; preds = %polly.loop_exit15, %polly.loop_preheader8
  %polly.indvar10 = phi i64 [ 0, %polly.loop_preheader8 ], [ %polly.indvar_next11, %polly.loop_exit15 ]
  %15 = add nuw nsw i64 %polly.indvar10, %1
  %16 = shl i64 %15, 12
  br label %polly.stmt.for.body3
}

; Function Attrs: nounwind
declare noalias i8* @malloc(i64) #1

; Function Attrs: nounwind uwtable
define noalias i32* @matrix_multiply(i32* noalias nocapture readonly %A, i32* noalias nocapture readonly %B) #0 {
entry:
  %call = tail call noalias i8* @malloc(i64 4194304) #4
  br label %polly.loop_preheader2

polly.exiting:                                    ; preds = %polly.loop_exit28
  ret i32* %0

polly.loop_exit3:                                 ; preds = %polly.loop_preheader14
  %polly.indvar_next = add nuw nsw i64 %polly.indvar, 1
  %exitcond71 = icmp eq i64 %polly.indvar_next, 32
  br i1 %exitcond71, label %polly.loop_preheader27.preheader, label %polly.loop_preheader2

polly.loop_preheader27.preheader:                 ; preds = %polly.loop_exit3
  %0 = bitcast i8* %call to i32*
  br label %polly.loop_preheader27

polly.loop_preheader2:                            ; preds = %polly.loop_exit3, %entry
  %polly.indvar = phi i64 [ 0, %entry ], [ %polly.indvar_next, %polly.loop_exit3 ]
  %1 = shl i64 %polly.indvar, 17
  br label %polly.loop_preheader8

polly.loop_preheader8:                            ; preds = %polly.loop_preheader14, %polly.loop_preheader2
  %polly.indvar4 = phi i64 [ 0, %polly.loop_preheader2 ], [ %polly.indvar_next5, %polly.loop_preheader14 ]
  %2 = shl i64 %polly.indvar4, 7
  %3 = add i64 %1, %2
  br label %polly.loop_preheader14

polly.loop_preheader14:                           ; preds = %polly.loop_preheader8
  %scevgep72 = getelementptr i8, i8* %call, i64 %3
  call void @llvm.memset.p0i8.i64(i8* %scevgep72, i8 0, i64 128, i32 4, i1 false)
  %4 = add i64 %3, 4096
  %scevgep72.1 = getelementptr i8, i8* %call, i64 %4
  call void @llvm.memset.p0i8.i64(i8* %scevgep72.1, i8 0, i64 128, i32 4, i1 false)
  %5 = add i64 %3, 8192
  %scevgep72.2 = getelementptr i8, i8* %call, i64 %5
  call void @llvm.memset.p0i8.i64(i8* %scevgep72.2, i8 0, i64 128, i32 4, i1 false)
  %6 = add i64 %3, 12288
  %scevgep72.3 = getelementptr i8, i8* %call, i64 %6
  call void @llvm.memset.p0i8.i64(i8* %scevgep72.3, i8 0, i64 128, i32 4, i1 false)
  %7 = add i64 %3, 16384
  %scevgep72.4 = getelementptr i8, i8* %call, i64 %7
  call void @llvm.memset.p0i8.i64(i8* %scevgep72.4, i8 0, i64 128, i32 4, i1 false)
  %8 = add i64 %3, 20480
  %scevgep72.5 = getelementptr i8, i8* %call, i64 %8
  call void @llvm.memset.p0i8.i64(i8* %scevgep72.5, i8 0, i64 128, i32 4, i1 false)
  %9 = add i64 %3, 24576
  %scevgep72.6 = getelementptr i8, i8* %call, i64 %9
  call void @llvm.memset.p0i8.i64(i8* %scevgep72.6, i8 0, i64 128, i32 4, i1 false)
  %10 = add i64 %3, 28672
  %scevgep72.7 = getelementptr i8, i8* %call, i64 %10
  call void @llvm.memset.p0i8.i64(i8* %scevgep72.7, i8 0, i64 128, i32 4, i1 false)
  %11 = add i64 %3, 32768
  %scevgep72.8 = getelementptr i8, i8* %call, i64 %11
  call void @llvm.memset.p0i8.i64(i8* %scevgep72.8, i8 0, i64 128, i32 4, i1 false)
  %12 = add i64 %3, 36864
  %scevgep72.9 = getelementptr i8, i8* %call, i64 %12
  call void @llvm.memset.p0i8.i64(i8* %scevgep72.9, i8 0, i64 128, i32 4, i1 false)
  %13 = add i64 %3, 40960
  %scevgep72.10 = getelementptr i8, i8* %call, i64 %13
  call void @llvm.memset.p0i8.i64(i8* %scevgep72.10, i8 0, i64 128, i32 4, i1 false)
  %14 = add i64 %3, 45056
  %scevgep72.11 = getelementptr i8, i8* %call, i64 %14
  call void @llvm.memset.p0i8.i64(i8* %scevgep72.11, i8 0, i64 128, i32 4, i1 false)
  %15 = add i64 %3, 49152
  %scevgep72.12 = getelementptr i8, i8* %call, i64 %15
  call void @llvm.memset.p0i8.i64(i8* %scevgep72.12, i8 0, i64 128, i32 4, i1 false)
  %16 = add i64 %3, 53248
  %scevgep72.13 = getelementptr i8, i8* %call, i64 %16
  call void @llvm.memset.p0i8.i64(i8* %scevgep72.13, i8 0, i64 128, i32 4, i1 false)
  %17 = add i64 %3, 57344
  %scevgep72.14 = getelementptr i8, i8* %call, i64 %17
  call void @llvm.memset.p0i8.i64(i8* %scevgep72.14, i8 0, i64 128, i32 4, i1 false)
  %18 = add i64 %3, 61440
  %scevgep72.15 = getelementptr i8, i8* %call, i64 %18
  call void @llvm.memset.p0i8.i64(i8* %scevgep72.15, i8 0, i64 128, i32 4, i1 false)
  %19 = add i64 %3, 65536
  %scevgep72.16 = getelementptr i8, i8* %call, i64 %19
  call void @llvm.memset.p0i8.i64(i8* %scevgep72.16, i8 0, i64 128, i32 4, i1 false)
  %20 = add i64 %3, 69632
  %scevgep72.17 = getelementptr i8, i8* %call, i64 %20
  call void @llvm.memset.p0i8.i64(i8* %scevgep72.17, i8 0, i64 128, i32 4, i1 false)
  %21 = add i64 %3, 73728
  %scevgep72.18 = getelementptr i8, i8* %call, i64 %21
  call void @llvm.memset.p0i8.i64(i8* %scevgep72.18, i8 0, i64 128, i32 4, i1 false)
  %22 = add i64 %3, 77824
  %scevgep72.19 = getelementptr i8, i8* %call, i64 %22
  call void @llvm.memset.p0i8.i64(i8* %scevgep72.19, i8 0, i64 128, i32 4, i1 false)
  %23 = add i64 %3, 81920
  %scevgep72.20 = getelementptr i8, i8* %call, i64 %23
  call void @llvm.memset.p0i8.i64(i8* %scevgep72.20, i8 0, i64 128, i32 4, i1 false)
  %24 = add i64 %3, 86016
  %scevgep72.21 = getelementptr i8, i8* %call, i64 %24
  call void @llvm.memset.p0i8.i64(i8* %scevgep72.21, i8 0, i64 128, i32 4, i1 false)
  %25 = add i64 %3, 90112
  %scevgep72.22 = getelementptr i8, i8* %call, i64 %25
  call void @llvm.memset.p0i8.i64(i8* %scevgep72.22, i8 0, i64 128, i32 4, i1 false)
  %26 = add i64 %3, 94208
  %scevgep72.23 = getelementptr i8, i8* %call, i64 %26
  call void @llvm.memset.p0i8.i64(i8* %scevgep72.23, i8 0, i64 128, i32 4, i1 false)
  %27 = add i64 %3, 98304
  %scevgep72.24 = getelementptr i8, i8* %call, i64 %27
  call void @llvm.memset.p0i8.i64(i8* %scevgep72.24, i8 0, i64 128, i32 4, i1 false)
  %28 = add i64 %3, 102400
  %scevgep72.25 = getelementptr i8, i8* %call, i64 %28
  call void @llvm.memset.p0i8.i64(i8* %scevgep72.25, i8 0, i64 128, i32 4, i1 false)
  %29 = add i64 %3, 106496
  %scevgep72.26 = getelementptr i8, i8* %call, i64 %29
  call void @llvm.memset.p0i8.i64(i8* %scevgep72.26, i8 0, i64 128, i32 4, i1 false)
  %30 = add i64 %3, 110592
  %scevgep72.27 = getelementptr i8, i8* %call, i64 %30
  call void @llvm.memset.p0i8.i64(i8* %scevgep72.27, i8 0, i64 128, i32 4, i1 false)
  %31 = add i64 %3, 114688
  %scevgep72.28 = getelementptr i8, i8* %call, i64 %31
  call void @llvm.memset.p0i8.i64(i8* %scevgep72.28, i8 0, i64 128, i32 4, i1 false)
  %32 = add i64 %3, 118784
  %scevgep72.29 = getelementptr i8, i8* %call, i64 %32
  call void @llvm.memset.p0i8.i64(i8* %scevgep72.29, i8 0, i64 128, i32 4, i1 false)
  %33 = add i64 %3, 122880
  %scevgep72.30 = getelementptr i8, i8* %call, i64 %33
  call void @llvm.memset.p0i8.i64(i8* %scevgep72.30, i8 0, i64 128, i32 4, i1 false)
  %34 = add i64 %3, 126976
  %scevgep72.31 = getelementptr i8, i8* %call, i64 %34
  call void @llvm.memset.p0i8.i64(i8* %scevgep72.31, i8 0, i64 128, i32 4, i1 false)
  %polly.indvar_next5 = add nuw nsw i64 %polly.indvar4, 1
  %exitcond70 = icmp eq i64 %polly.indvar_next5, 32
  br i1 %exitcond70, label %polly.loop_exit3, label %polly.loop_preheader8

polly.loop_exit28:                                ; preds = %polly.loop_exit34
  %polly.indvar_next24 = add nuw nsw i64 %polly.indvar23, 1
  %exitcond67 = icmp eq i64 %polly.indvar_next24, 32
  br i1 %exitcond67, label %polly.exiting, label %polly.loop_preheader27

polly.loop_exit34:                                ; preds = %polly.loop_exit40
  %polly.indvar_next30 = add nuw nsw i64 %polly.indvar29, 1
  %exitcond66 = icmp eq i64 %polly.indvar_next30, 32
  br i1 %exitcond66, label %polly.loop_exit28, label %polly.loop_preheader33

polly.loop_preheader27:                           ; preds = %polly.loop_exit28, %polly.loop_preheader27.preheader
  %polly.indvar23 = phi i64 [ %polly.indvar_next24, %polly.loop_exit28 ], [ 0, %polly.loop_preheader27.preheader ]
  %35 = shl nsw i64 %polly.indvar23, 5
  br label %polly.loop_preheader33

polly.loop_exit40:                                ; preds = %polly.loop_exit46
  %polly.indvar_next36 = add nuw nsw i64 %polly.indvar35, 1
  %exitcond65 = icmp eq i64 %polly.indvar_next36, 32
  br i1 %exitcond65, label %polly.loop_exit34, label %polly.loop_preheader39

polly.loop_preheader33:                           ; preds = %polly.loop_exit34, %polly.loop_preheader27
  %polly.indvar29 = phi i64 [ 0, %polly.loop_preheader27 ], [ %polly.indvar_next30, %polly.loop_exit34 ]
  %36 = shl nsw i64 %polly.indvar29, 5
  br label %polly.loop_preheader39

polly.loop_exit46:                                ; preds = %polly.loop_exit52
  %polly.indvar_next42 = add nuw nsw i64 %polly.indvar41, 1
  %exitcond64 = icmp eq i64 %polly.indvar_next42, 32
  br i1 %exitcond64, label %polly.loop_exit40, label %polly.loop_preheader45

polly.loop_preheader39:                           ; preds = %polly.loop_exit40, %polly.loop_preheader33
  %polly.indvar35 = phi i64 [ 0, %polly.loop_preheader33 ], [ %polly.indvar_next36, %polly.loop_exit40 ]
  %37 = shl nsw i64 %polly.indvar35, 5
  br label %polly.loop_preheader45

polly.loop_exit52:                                ; preds = %polly.loop_header50
  %p_add20.1.lcssa = phi i32 [ %p_add20.1, %polly.loop_header50 ]
  store i32 %p_add20.1.lcssa, i32* %scevgep5657, align 4, !alias.scope !4, !noalias !6
  %polly.indvar_next48 = add nuw nsw i64 %polly.indvar47, 1
  %exitcond63 = icmp eq i64 %polly.indvar_next48, 32
  br i1 %exitcond63, label %polly.loop_exit46, label %polly.loop_preheader51

polly.loop_preheader45:                           ; preds = %polly.loop_exit46, %polly.loop_preheader39
  %polly.indvar41 = phi i64 [ 0, %polly.loop_preheader39 ], [ %polly.indvar_next42, %polly.loop_exit46 ]
  %38 = add nuw nsw i64 %polly.indvar41, %35
  %39 = shl i64 %38, 12
  %40 = shl i64 %38, 10
  br label %polly.loop_preheader51

polly.loop_header50:                              ; preds = %polly.loop_header50, %polly.loop_preheader51
  %p_add2062 = phi i32 [ %scevgep5657.promoted, %polly.loop_preheader51 ], [ %p_add20.1, %polly.loop_header50 ]
  %polly.indvar53 = phi i64 [ 0, %polly.loop_preheader51 ], [ %polly.indvar_next54.1, %polly.loop_header50 ]
  %41 = add nuw nsw i64 %polly.indvar53, %37
  %42 = add nuw nsw i64 %41, %40
  %scevgep58 = getelementptr i32, i32* %A, i64 %42
  %_p_scalar_59 = load i32, i32* %scevgep58, align 4, !alias.scope !7, !noalias !9
  %43 = shl i64 %41, 10
  %44 = add nuw nsw i64 %43, %49
  %scevgep60 = getelementptr i32, i32* %B, i64 %44
  %_p_scalar_61 = load i32, i32* %scevgep60, align 4, !alias.scope !8, !noalias !10
  %p_mul19 = mul nsw i32 %_p_scalar_61, %_p_scalar_59
  %p_add20 = add nsw i32 %p_mul19, %p_add2062
  %polly.indvar_next54 = or i64 %polly.indvar53, 1
  %45 = add nuw nsw i64 %polly.indvar_next54, %37
  %46 = add nuw nsw i64 %45, %40
  %scevgep58.1 = getelementptr i32, i32* %A, i64 %46
  %_p_scalar_59.1 = load i32, i32* %scevgep58.1, align 4, !alias.scope !7, !noalias !9
  %47 = shl i64 %45, 10
  %48 = add nuw nsw i64 %47, %49
  %scevgep60.1 = getelementptr i32, i32* %B, i64 %48
  %_p_scalar_61.1 = load i32, i32* %scevgep60.1, align 4, !alias.scope !8, !noalias !10
  %p_mul19.1 = mul nsw i32 %_p_scalar_61.1, %_p_scalar_59.1
  %p_add20.1 = add nsw i32 %p_mul19.1, %p_add20
  %polly.indvar_next54.1 = add nsw i64 %polly.indvar53, 2
  %exitcond.1 = icmp eq i64 %polly.indvar_next54.1, 32
  br i1 %exitcond.1, label %polly.loop_exit52, label %polly.loop_header50

polly.loop_preheader51:                           ; preds = %polly.loop_exit52, %polly.loop_preheader45
  %polly.indvar47 = phi i64 [ 0, %polly.loop_preheader45 ], [ %polly.indvar_next48, %polly.loop_exit52 ]
  %49 = add nuw nsw i64 %polly.indvar47, %36
  %50 = shl i64 %49, 2
  %51 = add nuw nsw i64 %50, %39
  %scevgep56 = getelementptr i8, i8* %call, i64 %51
  %scevgep5657 = bitcast i8* %scevgep56 to i32*
  %scevgep5657.promoted = load i32, i32* %scevgep5657, align 4, !alias.scope !4, !noalias !6
  br label %polly.loop_header50
}

; Function Attrs: nounwind uwtable
define i32 @main(i32 %argc, i8** nocapture readnone %args) #2 {
entry:
  %call.i = tail call noalias i8* @malloc(i64 4194304) #4
  br label %polly.loop_preheader2.i

polly.loop_exit3.i:                               ; preds = %polly.loop_exit9.i
  %polly.indvar_next.i = add nuw nsw i64 %polly.indvar.i, 1
  %exitcond22.i = icmp eq i64 %polly.indvar_next.i, 32
  br i1 %exitcond22.i, label %init_array.exit, label %polly.loop_preheader2.i

polly.loop_exit9.i:                               ; preds = %polly.loop_exit15.i
  %polly.indvar_next5.i = add nuw nsw i64 %polly.indvar4.i, 1
  %exitcond21.i = icmp eq i64 %polly.indvar_next5.i, 32
  br i1 %exitcond21.i, label %polly.loop_exit3.i, label %polly.loop_preheader8.i

polly.loop_preheader2.i:                          ; preds = %polly.loop_exit3.i, %entry
  %polly.indvar.i = phi i64 [ 0, %entry ], [ %polly.indvar_next.i, %polly.loop_exit3.i ]
  %0 = shl i64 %polly.indvar.i, 5
  br label %polly.loop_preheader8.i

polly.loop_exit15.i:                              ; preds = %polly.stmt.for.body3.i
  %polly.indvar_next11.i = add nuw nsw i64 %polly.indvar10.i, 1
  %exitcond20.i = icmp eq i64 %polly.indvar_next11.i, 32
  br i1 %exitcond20.i, label %polly.loop_exit9.i, label %polly.loop_preheader14.i

polly.loop_preheader8.i:                          ; preds = %polly.loop_preheader2.i, %polly.loop_exit9.i
  %polly.indvar4.i = phi i64 [ 0, %polly.loop_preheader2.i ], [ %polly.indvar_next5.i, %polly.loop_exit9.i ]
  %1 = shl i64 %polly.indvar4.i, 5
  br label %polly.loop_preheader14.i

polly.stmt.for.body3.i:                           ; preds = %polly.stmt.for.body3.i, %polly.loop_preheader14.i
  %polly.indvar16.i = phi i64 [ 0, %polly.loop_preheader14.i ], [ %polly.indvar_next17.i.3, %polly.stmt.for.body3.i ]
  %2 = add nuw nsw i64 %polly.indvar16.i, %1
  %3 = shl i64 %2, 2
  %4 = add nuw nsw i64 %3, %15
  %scevgep.i = getelementptr i8, i8* %call.i, i64 %4
  %scevgep19.i = bitcast i8* %scevgep.i to i32*
  store i32 1, i32* %scevgep19.i, align 4, !alias.scope !11, !noalias !3
  %polly.indvar_next17.i = or i64 %polly.indvar16.i, 1
  %5 = add nuw nsw i64 %polly.indvar_next17.i, %1
  %6 = shl i64 %5, 2
  %7 = add nuw nsw i64 %6, %15
  %scevgep.i.1 = getelementptr i8, i8* %call.i, i64 %7
  %scevgep19.i.1 = bitcast i8* %scevgep.i.1 to i32*
  store i32 1, i32* %scevgep19.i.1, align 4, !alias.scope !11, !noalias !3
  %polly.indvar_next17.i.1 = or i64 %polly.indvar16.i, 2
  %8 = add nuw nsw i64 %polly.indvar_next17.i.1, %1
  %9 = shl i64 %8, 2
  %10 = add nuw nsw i64 %9, %15
  %scevgep.i.2 = getelementptr i8, i8* %call.i, i64 %10
  %scevgep19.i.2 = bitcast i8* %scevgep.i.2 to i32*
  store i32 1, i32* %scevgep19.i.2, align 4, !alias.scope !11, !noalias !3
  %polly.indvar_next17.i.2 = or i64 %polly.indvar16.i, 3
  %11 = add nuw nsw i64 %polly.indvar_next17.i.2, %1
  %12 = shl i64 %11, 2
  %13 = add nuw nsw i64 %12, %15
  %scevgep.i.3 = getelementptr i8, i8* %call.i, i64 %13
  %scevgep19.i.3 = bitcast i8* %scevgep.i.3 to i32*
  store i32 1, i32* %scevgep19.i.3, align 4, !alias.scope !11, !noalias !3
  %polly.indvar_next17.i.3 = add nsw i64 %polly.indvar16.i, 4
  %exitcond.i.3 = icmp eq i64 %polly.indvar_next17.i.3, 32
  br i1 %exitcond.i.3, label %polly.loop_exit15.i, label %polly.stmt.for.body3.i

polly.loop_preheader14.i:                         ; preds = %polly.loop_preheader8.i, %polly.loop_exit15.i
  %polly.indvar10.i = phi i64 [ 0, %polly.loop_preheader8.i ], [ %polly.indvar_next11.i, %polly.loop_exit15.i ]
  %14 = add nuw nsw i64 %polly.indvar10.i, %0
  %15 = shl i64 %14, 12
  br label %polly.stmt.for.body3.i

init_array.exit:                                  ; preds = %polly.loop_exit3.i
  %call.i1 = tail call noalias i8* @malloc(i64 4194304) #4
  br label %polly.loop_preheader2.i9

polly.loop_exit3.i4:                              ; preds = %polly.loop_exit9.i7
  %polly.indvar_next.i2 = add nuw nsw i64 %polly.indvar.i8, 1
  %exitcond22.i3 = icmp eq i64 %polly.indvar_next.i2, 32
  br i1 %exitcond22.i3, label %init_array.exit23, label %polly.loop_preheader2.i9

polly.loop_exit9.i7:                              ; preds = %polly.loop_exit15.i12
  %polly.indvar_next5.i5 = add nuw nsw i64 %polly.indvar4.i13, 1
  %exitcond21.i6 = icmp eq i64 %polly.indvar_next5.i5, 32
  br i1 %exitcond21.i6, label %polly.loop_exit3.i4, label %polly.loop_preheader8.i14

polly.loop_preheader2.i9:                         ; preds = %polly.loop_exit3.i4, %init_array.exit
  %polly.indvar.i8 = phi i64 [ 0, %init_array.exit ], [ %polly.indvar_next.i2, %polly.loop_exit3.i4 ]
  %16 = shl i64 %polly.indvar.i8, 5
  br label %polly.loop_preheader8.i14

polly.loop_exit15.i12:                            ; preds = %polly.stmt.for.body3.i20
  %polly.indvar_next11.i10 = add nuw nsw i64 %polly.indvar10.i21, 1
  %exitcond20.i11 = icmp eq i64 %polly.indvar_next11.i10, 32
  br i1 %exitcond20.i11, label %polly.loop_exit9.i7, label %polly.loop_preheader14.i22

polly.loop_preheader8.i14:                        ; preds = %polly.loop_preheader2.i9, %polly.loop_exit9.i7
  %polly.indvar4.i13 = phi i64 [ 0, %polly.loop_preheader2.i9 ], [ %polly.indvar_next5.i5, %polly.loop_exit9.i7 ]
  %17 = shl i64 %polly.indvar4.i13, 5
  br label %polly.loop_preheader14.i22

polly.stmt.for.body3.i20:                         ; preds = %polly.stmt.for.body3.i20, %polly.loop_preheader14.i22
  %polly.indvar16.i15 = phi i64 [ 0, %polly.loop_preheader14.i22 ], [ %polly.indvar_next17.i18.3, %polly.stmt.for.body3.i20 ]
  %18 = add nuw nsw i64 %polly.indvar16.i15, %17
  %19 = shl i64 %18, 2
  %20 = add nuw nsw i64 %19, %31
  %scevgep.i16 = getelementptr i8, i8* %call.i1, i64 %20
  %scevgep19.i17 = bitcast i8* %scevgep.i16 to i32*
  store i32 1, i32* %scevgep19.i17, align 4, !alias.scope !13, !noalias !3
  %polly.indvar_next17.i18 = or i64 %polly.indvar16.i15, 1
  %21 = add nuw nsw i64 %polly.indvar_next17.i18, %17
  %22 = shl i64 %21, 2
  %23 = add nuw nsw i64 %22, %31
  %scevgep.i16.1 = getelementptr i8, i8* %call.i1, i64 %23
  %scevgep19.i17.1 = bitcast i8* %scevgep.i16.1 to i32*
  store i32 1, i32* %scevgep19.i17.1, align 4, !alias.scope !13, !noalias !3
  %polly.indvar_next17.i18.1 = or i64 %polly.indvar16.i15, 2
  %24 = add nuw nsw i64 %polly.indvar_next17.i18.1, %17
  %25 = shl i64 %24, 2
  %26 = add nuw nsw i64 %25, %31
  %scevgep.i16.2 = getelementptr i8, i8* %call.i1, i64 %26
  %scevgep19.i17.2 = bitcast i8* %scevgep.i16.2 to i32*
  store i32 1, i32* %scevgep19.i17.2, align 4, !alias.scope !13, !noalias !3
  %polly.indvar_next17.i18.2 = or i64 %polly.indvar16.i15, 3
  %27 = add nuw nsw i64 %polly.indvar_next17.i18.2, %17
  %28 = shl i64 %27, 2
  %29 = add nuw nsw i64 %28, %31
  %scevgep.i16.3 = getelementptr i8, i8* %call.i1, i64 %29
  %scevgep19.i17.3 = bitcast i8* %scevgep.i16.3 to i32*
  store i32 1, i32* %scevgep19.i17.3, align 4, !alias.scope !13, !noalias !3
  %polly.indvar_next17.i18.3 = add nsw i64 %polly.indvar16.i15, 4
  %exitcond.i19.3 = icmp eq i64 %polly.indvar_next17.i18.3, 32
  br i1 %exitcond.i19.3, label %polly.loop_exit15.i12, label %polly.stmt.for.body3.i20

polly.loop_preheader14.i22:                       ; preds = %polly.loop_preheader8.i14, %polly.loop_exit15.i12
  %polly.indvar10.i21 = phi i64 [ 0, %polly.loop_preheader8.i14 ], [ %polly.indvar_next11.i10, %polly.loop_exit15.i12 ]
  %30 = add nuw nsw i64 %polly.indvar10.i21, %16
  %31 = shl i64 %30, 12
  br label %polly.stmt.for.body3.i20

init_array.exit23:                                ; preds = %polly.loop_exit3.i4
  %32 = bitcast i8* %call.i to i32*
  %33 = bitcast i8* %call.i1 to i32*
  %call2 = tail call i32* @matrix_multiply(i32* %32, i32* %33)
  %arrayidx = getelementptr inbounds i32, i32* %call2, i64 1048575
  %34 = load i32, i32* %arrayidx, align 4
  %call3 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([46 x i8], [46 x i8]* @.str, i64 0, i64 0), i32 1024, i32 1024, i32 1023, i32 1023, i32 %34) #4
  ret i32 0
}

; Function Attrs: nounwind
declare i32 @printf(i8* nocapture readonly, ...) #1

; Function Attrs: argmemonly nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture, i8, i64, i32, i1) #3

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "polly-optimized" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { argmemonly nounwind }
attributes #4 = { nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 3.9.0 (http://llvm.org/git/clang.git c43284c4913e075fc10ac6dea2961788a660f09d) (http://llvm.org/git/llvm.git 7f53bedefce9ad990a1906fed303e104ff621783)"}
!1 = distinct !{!1, !2, !"polly.alias.scope.call"}
!2 = distinct !{!2, !"polly.alias.scope.domain"}
!3 = !{}
!4 = distinct !{!4, !5, !"polly.alias.scope.call"}
!5 = distinct !{!5, !"polly.alias.scope.domain"}
!6 = !{!7, !8}
!7 = distinct !{!7, !5, !"polly.alias.scope.A"}
!8 = distinct !{!8, !5, !"polly.alias.scope.B"}
!9 = !{!4, !8}
!10 = !{!7, !4}
!11 = distinct !{!11, !12, !"polly.alias.scope.call"}
!12 = distinct !{!12, !"polly.alias.scope.domain"}
!13 = distinct !{!13, !14, !"polly.alias.scope.call"}
!14 = distinct !{!14, !"polly.alias.scope.domain"}
