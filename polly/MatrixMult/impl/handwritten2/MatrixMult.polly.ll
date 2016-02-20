; ModuleID = 'MatrixMult.preopt.ll'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.Matrix = type { i32*, i32, i32 }

@.str = private unnamed_addr constant [46 x i8] c"Pass %d X %d matrix test case (C[%d][%d]=%d)\0A\00", align 1

; Function Attrs: nounwind uwtable
define noalias %struct.Matrix* @init(i32 %value) #0 {
entry:
  %call = tail call noalias i8* @malloc(i64 4194304) #4
  br label %polly.loop_preheader2

polly.exiting:                                    ; preds = %polly.loop_exit3
  %call7 = tail call noalias i8* @malloc(i64 16) #4
  %0 = bitcast i8* %call7 to %struct.Matrix*
  %1 = bitcast i8* %call7 to i8**
  store i8* %call, i8** %1, align 8
  ret %struct.Matrix* %0

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
  %2 = shl i64 %polly.indvar, 5
  br label %polly.loop_preheader8

polly.loop_exit15:                                ; preds = %polly.stmt.for.body3
  %polly.indvar_next11 = add nuw nsw i64 %polly.indvar10, 1
  %exitcond20 = icmp eq i64 %polly.indvar_next11, 32
  br i1 %exitcond20, label %polly.loop_exit9, label %polly.loop_preheader14

polly.loop_preheader8:                            ; preds = %polly.loop_exit9, %polly.loop_preheader2
  %polly.indvar4 = phi i64 [ 0, %polly.loop_preheader2 ], [ %polly.indvar_next5, %polly.loop_exit9 ]
  %3 = shl i64 %polly.indvar4, 5
  br label %polly.loop_preheader14

polly.stmt.for.body3:                             ; preds = %polly.stmt.for.body3, %polly.loop_preheader14
  %polly.indvar16 = phi i64 [ 0, %polly.loop_preheader14 ], [ %polly.indvar_next17.3, %polly.stmt.for.body3 ]
  %4 = add nuw nsw i64 %polly.indvar16, %3
  %5 = shl i64 %4, 2
  %6 = add nuw nsw i64 %5, %17
  %scevgep = getelementptr i8, i8* %call, i64 %6
  %scevgep19 = bitcast i8* %scevgep to i32*
  store i32 %value, i32* %scevgep19, align 4, !alias.scope !1, !noalias !3
  %polly.indvar_next17 = or i64 %polly.indvar16, 1
  %7 = add nuw nsw i64 %polly.indvar_next17, %3
  %8 = shl i64 %7, 2
  %9 = add nuw nsw i64 %8, %17
  %scevgep.1 = getelementptr i8, i8* %call, i64 %9
  %scevgep19.1 = bitcast i8* %scevgep.1 to i32*
  store i32 %value, i32* %scevgep19.1, align 4, !alias.scope !1, !noalias !3
  %polly.indvar_next17.1 = or i64 %polly.indvar16, 2
  %10 = add nuw nsw i64 %polly.indvar_next17.1, %3
  %11 = shl i64 %10, 2
  %12 = add nuw nsw i64 %11, %17
  %scevgep.2 = getelementptr i8, i8* %call, i64 %12
  %scevgep19.2 = bitcast i8* %scevgep.2 to i32*
  store i32 %value, i32* %scevgep19.2, align 4, !alias.scope !1, !noalias !3
  %polly.indvar_next17.2 = or i64 %polly.indvar16, 3
  %13 = add nuw nsw i64 %polly.indvar_next17.2, %3
  %14 = shl i64 %13, 2
  %15 = add nuw nsw i64 %14, %17
  %scevgep.3 = getelementptr i8, i8* %call, i64 %15
  %scevgep19.3 = bitcast i8* %scevgep.3 to i32*
  store i32 %value, i32* %scevgep19.3, align 4, !alias.scope !1, !noalias !3
  %polly.indvar_next17.3 = add nsw i64 %polly.indvar16, 4
  %exitcond.3 = icmp eq i64 %polly.indvar_next17.3, 32
  br i1 %exitcond.3, label %polly.loop_exit15, label %polly.stmt.for.body3

polly.loop_preheader14:                           ; preds = %polly.loop_exit15, %polly.loop_preheader8
  %polly.indvar10 = phi i64 [ 0, %polly.loop_preheader8 ], [ %polly.indvar_next11, %polly.loop_exit15 ]
  %16 = add nuw nsw i64 %polly.indvar10, %2
  %17 = shl i64 %16, 12
  br label %polly.stmt.for.body3
}

; Function Attrs: nounwind
declare noalias i8* @malloc(i64) #1

; Function Attrs: nounwind uwtable
define noalias %struct.Matrix* @matrix_multiply(%struct.Matrix* noalias nocapture readonly %A, %struct.Matrix* noalias nocapture readonly %B) #0 {
entry:
  %call = tail call noalias i8* @malloc(i64 4194304) #4
  %0 = bitcast i8* %call to i32*
  %data = getelementptr inbounds %struct.Matrix, %struct.Matrix* %A, i64 0, i32 0
  %1 = load i32*, i32** %data, align 8
  %data1 = getelementptr inbounds %struct.Matrix, %struct.Matrix* %B, i64 0, i32 0
  %2 = load i32*, i32** %data1, align 8
  %polly.access. = getelementptr i32, i32* %1, i64 1048576
  %3 = icmp ule i32* %polly.access., %0
  %polly.access.call2 = getelementptr i8, i8* %call, i64 4194304
  %4 = bitcast i8* %polly.access.call2 to i32*
  %5 = icmp ule i32* %4, %1
  %6 = or i1 %3, %5
  %polly.access.4 = getelementptr i32, i32* %2, i64 1048576
  %7 = icmp ule i32* %polly.access.4, %0
  %8 = icmp ule i32* %4, %2
  %9 = or i1 %8, %7
  %10 = and i1 %6, %9
  br i1 %10, label %polly.loop_preheader11.preheader, label %for.cond2.preheader.preheader

for.cond2.preheader.preheader:                    ; preds = %entry
  br label %for.cond2.preheader

polly.loop_preheader11.preheader:                 ; preds = %entry
  br label %polly.loop_preheader11

for.cond2.preheader:                              ; preds = %for.cond2.preheader.preheader, %for.inc29
  %indvars.iv13 = phi i64 [ %indvars.iv.next14, %for.inc29 ], [ 0, %for.cond2.preheader.preheader ]
  %11 = shl i64 %indvars.iv13, 10
  br label %for.body4

for.body4:                                        ; preds = %for.inc26, %for.cond2.preheader
  %indvars.iv7 = phi i64 [ 0, %for.cond2.preheader ], [ %indvars.iv.next8, %for.inc26 ]
  %12 = add nuw nsw i64 %indvars.iv7, %11
  %arrayidx = getelementptr inbounds i32, i32* %0, i64 %12
  store i32 0, i32* %arrayidx, align 4
  br label %for.body7

for.body7:                                        ; preds = %for.body7, %for.body4
  %13 = phi i32 [ 0, %for.body4 ], [ %add21.1, %for.body7 ]
  %indvars.iv = phi i64 [ 0, %for.body4 ], [ %indvars.iv.next.1, %for.body7 ]
  %14 = add nuw nsw i64 %indvars.iv, %11
  %arrayidx15 = getelementptr inbounds i32, i32* %1, i64 %14
  %15 = load i32, i32* %arrayidx15, align 4
  %16 = shl i64 %indvars.iv, 10
  %17 = add nuw nsw i64 %16, %indvars.iv7
  %arrayidx19 = getelementptr inbounds i32, i32* %2, i64 %17
  %18 = load i32, i32* %arrayidx19, align 4
  %mul20 = mul nsw i32 %18, %15
  %add21 = add nsw i32 %mul20, %13
  store i32 %add21, i32* %arrayidx, align 4
  %indvars.iv.next = or i64 %indvars.iv, 1
  %19 = add nuw nsw i64 %indvars.iv.next, %11
  %arrayidx15.1 = getelementptr inbounds i32, i32* %1, i64 %19
  %20 = load i32, i32* %arrayidx15.1, align 4
  %21 = shl i64 %indvars.iv.next, 10
  %22 = add nuw nsw i64 %21, %indvars.iv7
  %arrayidx19.1 = getelementptr inbounds i32, i32* %2, i64 %22
  %23 = load i32, i32* %arrayidx19.1, align 4
  %mul20.1 = mul nsw i32 %23, %20
  %add21.1 = add nsw i32 %mul20.1, %add21
  store i32 %add21.1, i32* %arrayidx, align 4
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 1024
  br i1 %exitcond.1, label %for.inc26, label %for.body7

for.inc26:                                        ; preds = %for.body7
  %indvars.iv.next8 = add nuw nsw i64 %indvars.iv7, 1
  %exitcond12 = icmp eq i64 %indvars.iv.next8, 1024
  br i1 %exitcond12, label %for.inc29, label %for.body4

for.inc29:                                        ; preds = %for.inc26
  %indvars.iv.next14 = add nuw nsw i64 %indvars.iv13, 1
  %exitcond19 = icmp eq i64 %indvars.iv.next14, 1024
  br i1 %exitcond19, label %for.end31.loopexit87, label %for.cond2.preheader

for.end31.loopexit:                               ; preds = %polly.loop_exit37
  br label %for.end31

for.end31.loopexit87:                             ; preds = %for.inc29
  br label %for.end31

for.end31:                                        ; preds = %for.end31.loopexit87, %for.end31.loopexit
  %call32 = tail call noalias i8* @malloc(i64 16) #4
  %24 = bitcast i8* %call32 to %struct.Matrix*
  %25 = bitcast i8* %call32 to i8**
  store i8* %call, i8** %25, align 8
  ret %struct.Matrix* %24

polly.loop_exit12:                                ; preds = %polly.loop_preheader23
  %polly.indvar_next = add nuw nsw i64 %polly.indvar, 1
  %exitcond83 = icmp eq i64 %polly.indvar_next, 32
  br i1 %exitcond83, label %polly.loop_preheader36.preheader, label %polly.loop_preheader11

polly.loop_preheader36.preheader:                 ; preds = %polly.loop_exit12
  br label %polly.loop_preheader36

polly.loop_preheader11:                           ; preds = %polly.loop_preheader11.preheader, %polly.loop_exit12
  %polly.indvar = phi i64 [ %polly.indvar_next, %polly.loop_exit12 ], [ 0, %polly.loop_preheader11.preheader ]
  %26 = shl i64 %polly.indvar, 17
  br label %polly.loop_preheader17

polly.loop_preheader17:                           ; preds = %polly.loop_preheader23, %polly.loop_preheader11
  %polly.indvar13 = phi i64 [ 0, %polly.loop_preheader11 ], [ %polly.indvar_next14, %polly.loop_preheader23 ]
  %27 = shl i64 %polly.indvar13, 7
  %28 = add i64 %26, %27
  br label %polly.loop_preheader23

polly.loop_preheader23:                           ; preds = %polly.loop_preheader17
  %scevgep84 = getelementptr i8, i8* %call, i64 %28
  call void @llvm.memset.p0i8.i64(i8* %scevgep84, i8 0, i64 128, i32 4, i1 false)
  %29 = add i64 %28, 4096
  %scevgep84.1 = getelementptr i8, i8* %call, i64 %29
  call void @llvm.memset.p0i8.i64(i8* %scevgep84.1, i8 0, i64 128, i32 4, i1 false)
  %30 = add i64 %28, 8192
  %scevgep84.2 = getelementptr i8, i8* %call, i64 %30
  call void @llvm.memset.p0i8.i64(i8* %scevgep84.2, i8 0, i64 128, i32 4, i1 false)
  %31 = add i64 %28, 12288
  %scevgep84.3 = getelementptr i8, i8* %call, i64 %31
  call void @llvm.memset.p0i8.i64(i8* %scevgep84.3, i8 0, i64 128, i32 4, i1 false)
  %32 = add i64 %28, 16384
  %scevgep84.4 = getelementptr i8, i8* %call, i64 %32
  call void @llvm.memset.p0i8.i64(i8* %scevgep84.4, i8 0, i64 128, i32 4, i1 false)
  %33 = add i64 %28, 20480
  %scevgep84.5 = getelementptr i8, i8* %call, i64 %33
  call void @llvm.memset.p0i8.i64(i8* %scevgep84.5, i8 0, i64 128, i32 4, i1 false)
  %34 = add i64 %28, 24576
  %scevgep84.6 = getelementptr i8, i8* %call, i64 %34
  call void @llvm.memset.p0i8.i64(i8* %scevgep84.6, i8 0, i64 128, i32 4, i1 false)
  %35 = add i64 %28, 28672
  %scevgep84.7 = getelementptr i8, i8* %call, i64 %35
  call void @llvm.memset.p0i8.i64(i8* %scevgep84.7, i8 0, i64 128, i32 4, i1 false)
  %36 = add i64 %28, 32768
  %scevgep84.8 = getelementptr i8, i8* %call, i64 %36
  call void @llvm.memset.p0i8.i64(i8* %scevgep84.8, i8 0, i64 128, i32 4, i1 false)
  %37 = add i64 %28, 36864
  %scevgep84.9 = getelementptr i8, i8* %call, i64 %37
  call void @llvm.memset.p0i8.i64(i8* %scevgep84.9, i8 0, i64 128, i32 4, i1 false)
  %38 = add i64 %28, 40960
  %scevgep84.10 = getelementptr i8, i8* %call, i64 %38
  call void @llvm.memset.p0i8.i64(i8* %scevgep84.10, i8 0, i64 128, i32 4, i1 false)
  %39 = add i64 %28, 45056
  %scevgep84.11 = getelementptr i8, i8* %call, i64 %39
  call void @llvm.memset.p0i8.i64(i8* %scevgep84.11, i8 0, i64 128, i32 4, i1 false)
  %40 = add i64 %28, 49152
  %scevgep84.12 = getelementptr i8, i8* %call, i64 %40
  call void @llvm.memset.p0i8.i64(i8* %scevgep84.12, i8 0, i64 128, i32 4, i1 false)
  %41 = add i64 %28, 53248
  %scevgep84.13 = getelementptr i8, i8* %call, i64 %41
  call void @llvm.memset.p0i8.i64(i8* %scevgep84.13, i8 0, i64 128, i32 4, i1 false)
  %42 = add i64 %28, 57344
  %scevgep84.14 = getelementptr i8, i8* %call, i64 %42
  call void @llvm.memset.p0i8.i64(i8* %scevgep84.14, i8 0, i64 128, i32 4, i1 false)
  %43 = add i64 %28, 61440
  %scevgep84.15 = getelementptr i8, i8* %call, i64 %43
  call void @llvm.memset.p0i8.i64(i8* %scevgep84.15, i8 0, i64 128, i32 4, i1 false)
  %44 = add i64 %28, 65536
  %scevgep84.16 = getelementptr i8, i8* %call, i64 %44
  call void @llvm.memset.p0i8.i64(i8* %scevgep84.16, i8 0, i64 128, i32 4, i1 false)
  %45 = add i64 %28, 69632
  %scevgep84.17 = getelementptr i8, i8* %call, i64 %45
  call void @llvm.memset.p0i8.i64(i8* %scevgep84.17, i8 0, i64 128, i32 4, i1 false)
  %46 = add i64 %28, 73728
  %scevgep84.18 = getelementptr i8, i8* %call, i64 %46
  call void @llvm.memset.p0i8.i64(i8* %scevgep84.18, i8 0, i64 128, i32 4, i1 false)
  %47 = add i64 %28, 77824
  %scevgep84.19 = getelementptr i8, i8* %call, i64 %47
  call void @llvm.memset.p0i8.i64(i8* %scevgep84.19, i8 0, i64 128, i32 4, i1 false)
  %48 = add i64 %28, 81920
  %scevgep84.20 = getelementptr i8, i8* %call, i64 %48
  call void @llvm.memset.p0i8.i64(i8* %scevgep84.20, i8 0, i64 128, i32 4, i1 false)
  %49 = add i64 %28, 86016
  %scevgep84.21 = getelementptr i8, i8* %call, i64 %49
  call void @llvm.memset.p0i8.i64(i8* %scevgep84.21, i8 0, i64 128, i32 4, i1 false)
  %50 = add i64 %28, 90112
  %scevgep84.22 = getelementptr i8, i8* %call, i64 %50
  call void @llvm.memset.p0i8.i64(i8* %scevgep84.22, i8 0, i64 128, i32 4, i1 false)
  %51 = add i64 %28, 94208
  %scevgep84.23 = getelementptr i8, i8* %call, i64 %51
  call void @llvm.memset.p0i8.i64(i8* %scevgep84.23, i8 0, i64 128, i32 4, i1 false)
  %52 = add i64 %28, 98304
  %scevgep84.24 = getelementptr i8, i8* %call, i64 %52
  call void @llvm.memset.p0i8.i64(i8* %scevgep84.24, i8 0, i64 128, i32 4, i1 false)
  %53 = add i64 %28, 102400
  %scevgep84.25 = getelementptr i8, i8* %call, i64 %53
  call void @llvm.memset.p0i8.i64(i8* %scevgep84.25, i8 0, i64 128, i32 4, i1 false)
  %54 = add i64 %28, 106496
  %scevgep84.26 = getelementptr i8, i8* %call, i64 %54
  call void @llvm.memset.p0i8.i64(i8* %scevgep84.26, i8 0, i64 128, i32 4, i1 false)
  %55 = add i64 %28, 110592
  %scevgep84.27 = getelementptr i8, i8* %call, i64 %55
  call void @llvm.memset.p0i8.i64(i8* %scevgep84.27, i8 0, i64 128, i32 4, i1 false)
  %56 = add i64 %28, 114688
  %scevgep84.28 = getelementptr i8, i8* %call, i64 %56
  call void @llvm.memset.p0i8.i64(i8* %scevgep84.28, i8 0, i64 128, i32 4, i1 false)
  %57 = add i64 %28, 118784
  %scevgep84.29 = getelementptr i8, i8* %call, i64 %57
  call void @llvm.memset.p0i8.i64(i8* %scevgep84.29, i8 0, i64 128, i32 4, i1 false)
  %58 = add i64 %28, 122880
  %scevgep84.30 = getelementptr i8, i8* %call, i64 %58
  call void @llvm.memset.p0i8.i64(i8* %scevgep84.30, i8 0, i64 128, i32 4, i1 false)
  %59 = add i64 %28, 126976
  %scevgep84.31 = getelementptr i8, i8* %call, i64 %59
  call void @llvm.memset.p0i8.i64(i8* %scevgep84.31, i8 0, i64 128, i32 4, i1 false)
  %polly.indvar_next14 = add nuw nsw i64 %polly.indvar13, 1
  %exitcond82 = icmp eq i64 %polly.indvar_next14, 32
  br i1 %exitcond82, label %polly.loop_exit12, label %polly.loop_preheader17

polly.loop_exit37:                                ; preds = %polly.loop_exit43
  %polly.indvar_next33 = add nuw nsw i64 %polly.indvar32, 1
  %exitcond79 = icmp eq i64 %polly.indvar_next33, 32
  br i1 %exitcond79, label %for.end31.loopexit, label %polly.loop_preheader36

polly.loop_exit43:                                ; preds = %polly.loop_exit49
  %polly.indvar_next39 = add nuw nsw i64 %polly.indvar38, 1
  %exitcond78 = icmp eq i64 %polly.indvar_next39, 32
  br i1 %exitcond78, label %polly.loop_exit37, label %polly.loop_preheader42

polly.loop_preheader36:                           ; preds = %polly.loop_preheader36.preheader, %polly.loop_exit37
  %polly.indvar32 = phi i64 [ %polly.indvar_next33, %polly.loop_exit37 ], [ 0, %polly.loop_preheader36.preheader ]
  %60 = shl nsw i64 %polly.indvar32, 5
  br label %polly.loop_preheader42

polly.loop_exit49:                                ; preds = %polly.loop_exit55
  %polly.indvar_next45 = add nuw nsw i64 %polly.indvar44, 1
  %exitcond77 = icmp eq i64 %polly.indvar_next45, 32
  br i1 %exitcond77, label %polly.loop_exit43, label %polly.loop_preheader48

polly.loop_preheader42:                           ; preds = %polly.loop_exit43, %polly.loop_preheader36
  %polly.indvar38 = phi i64 [ 0, %polly.loop_preheader36 ], [ %polly.indvar_next39, %polly.loop_exit43 ]
  %61 = shl nsw i64 %polly.indvar38, 5
  br label %polly.loop_preheader48

polly.loop_exit55:                                ; preds = %polly.loop_exit61
  %polly.indvar_next51 = add nuw nsw i64 %polly.indvar50, 1
  %exitcond76 = icmp eq i64 %polly.indvar_next51, 32
  br i1 %exitcond76, label %polly.loop_exit49, label %polly.loop_preheader54

polly.loop_preheader48:                           ; preds = %polly.loop_exit49, %polly.loop_preheader42
  %polly.indvar44 = phi i64 [ 0, %polly.loop_preheader42 ], [ %polly.indvar_next45, %polly.loop_exit49 ]
  %62 = shl nsw i64 %polly.indvar44, 5
  br label %polly.loop_preheader54

polly.loop_exit61:                                ; preds = %polly.loop_header59
  %p_add21.1.lcssa = phi i32 [ %p_add21.1, %polly.loop_header59 ]
  store i32 %p_add21.1.lcssa, i32* %scevgep6566, align 4, !alias.scope !4, !noalias !6
  %polly.indvar_next57 = add nuw nsw i64 %polly.indvar56, 1
  %exitcond75 = icmp eq i64 %polly.indvar_next57, 32
  br i1 %exitcond75, label %polly.loop_exit55, label %polly.loop_preheader60

polly.loop_preheader54:                           ; preds = %polly.loop_exit55, %polly.loop_preheader48
  %polly.indvar50 = phi i64 [ 0, %polly.loop_preheader48 ], [ %polly.indvar_next51, %polly.loop_exit55 ]
  %63 = add nuw nsw i64 %polly.indvar50, %60
  %64 = shl i64 %63, 12
  %65 = shl i64 %63, 10
  br label %polly.loop_preheader60

polly.loop_header59:                              ; preds = %polly.loop_header59, %polly.loop_preheader60
  %p_add2172 = phi i32 [ %scevgep6566.promoted, %polly.loop_preheader60 ], [ %p_add21.1, %polly.loop_header59 ]
  %polly.indvar62 = phi i64 [ 0, %polly.loop_preheader60 ], [ %polly.indvar_next63.1, %polly.loop_header59 ]
  %66 = add nuw nsw i64 %polly.indvar62, %62
  %67 = add nuw nsw i64 %66, %65
  %scevgep67 = getelementptr i32, i32* %1, i64 %67
  %_p_scalar_68 = load i32, i32* %scevgep67, align 4, !alias.scope !8, !noalias !9
  %68 = shl i64 %66, 10
  %69 = add nuw nsw i64 %68, %74
  %scevgep69 = getelementptr i32, i32* %2, i64 %69
  %_p_scalar_70 = load i32, i32* %scevgep69, align 4, !alias.scope !7, !noalias !10
  %p_mul20 = mul nsw i32 %_p_scalar_70, %_p_scalar_68
  %p_add21 = add nsw i32 %p_mul20, %p_add2172
  %polly.indvar_next63 = or i64 %polly.indvar62, 1
  %70 = add nuw nsw i64 %polly.indvar_next63, %62
  %71 = add nuw nsw i64 %70, %65
  %scevgep67.1 = getelementptr i32, i32* %1, i64 %71
  %_p_scalar_68.1 = load i32, i32* %scevgep67.1, align 4, !alias.scope !8, !noalias !9
  %72 = shl i64 %70, 10
  %73 = add nuw nsw i64 %72, %74
  %scevgep69.1 = getelementptr i32, i32* %2, i64 %73
  %_p_scalar_70.1 = load i32, i32* %scevgep69.1, align 4, !alias.scope !7, !noalias !10
  %p_mul20.1 = mul nsw i32 %_p_scalar_70.1, %_p_scalar_68.1
  %p_add21.1 = add nsw i32 %p_mul20.1, %p_add21
  %polly.indvar_next63.1 = add nsw i64 %polly.indvar62, 2
  %exitcond74.1 = icmp eq i64 %polly.indvar_next63.1, 32
  br i1 %exitcond74.1, label %polly.loop_exit61, label %polly.loop_header59

polly.loop_preheader60:                           ; preds = %polly.loop_exit61, %polly.loop_preheader54
  %polly.indvar56 = phi i64 [ 0, %polly.loop_preheader54 ], [ %polly.indvar_next57, %polly.loop_exit61 ]
  %74 = add nuw nsw i64 %polly.indvar56, %61
  %75 = shl i64 %74, 2
  %76 = add nuw nsw i64 %75, %64
  %scevgep65 = getelementptr i8, i8* %call, i64 %76
  %scevgep6566 = bitcast i8* %scevgep65 to i32*
  %scevgep6566.promoted = load i32, i32* %scevgep6566, align 4, !alias.scope !4, !noalias !6
  br label %polly.loop_header59
}

; Function Attrs: nounwind uwtable
define i32 @main(i32 %argc, i8** nocapture readnone %args) #2 {
entry:
  %call.i = tail call noalias i8* @malloc(i64 4194304) #4
  br label %polly.loop_preheader2.i

polly.loop_exit3.i:                               ; preds = %polly.loop_exit9.i
  %polly.indvar_next.i = add nuw nsw i64 %polly.indvar.i, 1
  %exitcond22.i = icmp eq i64 %polly.indvar_next.i, 32
  br i1 %exitcond22.i, label %init.exit, label %polly.loop_preheader2.i

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

init.exit:                                        ; preds = %polly.loop_exit3.i
  %call7.i = tail call noalias i8* @malloc(i64 16) #4
  %16 = bitcast i8* %call7.i to i8**
  store i8* %call.i, i8** %16, align 8
  %call.i1 = tail call noalias i8* @malloc(i64 4194304) #4
  br label %polly.loop_preheader2.i10

polly.loop_exit3.i5:                              ; preds = %polly.loop_exit9.i8
  %polly.indvar_next.i3 = add nuw nsw i64 %polly.indvar.i9, 1
  %exitcond22.i4 = icmp eq i64 %polly.indvar_next.i3, 32
  br i1 %exitcond22.i4, label %init.exit24, label %polly.loop_preheader2.i10

polly.loop_exit9.i8:                              ; preds = %polly.loop_exit15.i13
  %polly.indvar_next5.i6 = add nuw nsw i64 %polly.indvar4.i14, 1
  %exitcond21.i7 = icmp eq i64 %polly.indvar_next5.i6, 32
  br i1 %exitcond21.i7, label %polly.loop_exit3.i5, label %polly.loop_preheader8.i15

polly.loop_preheader2.i10:                        ; preds = %polly.loop_exit3.i5, %init.exit
  %polly.indvar.i9 = phi i64 [ 0, %init.exit ], [ %polly.indvar_next.i3, %polly.loop_exit3.i5 ]
  %17 = shl i64 %polly.indvar.i9, 5
  br label %polly.loop_preheader8.i15

polly.loop_exit15.i13:                            ; preds = %polly.stmt.for.body3.i21
  %polly.indvar_next11.i11 = add nuw nsw i64 %polly.indvar10.i22, 1
  %exitcond20.i12 = icmp eq i64 %polly.indvar_next11.i11, 32
  br i1 %exitcond20.i12, label %polly.loop_exit9.i8, label %polly.loop_preheader14.i23

polly.loop_preheader8.i15:                        ; preds = %polly.loop_preheader2.i10, %polly.loop_exit9.i8
  %polly.indvar4.i14 = phi i64 [ 0, %polly.loop_preheader2.i10 ], [ %polly.indvar_next5.i6, %polly.loop_exit9.i8 ]
  %18 = shl i64 %polly.indvar4.i14, 5
  br label %polly.loop_preheader14.i23

polly.stmt.for.body3.i21:                         ; preds = %polly.stmt.for.body3.i21, %polly.loop_preheader14.i23
  %polly.indvar16.i16 = phi i64 [ 0, %polly.loop_preheader14.i23 ], [ %polly.indvar_next17.i19.3, %polly.stmt.for.body3.i21 ]
  %19 = add nuw nsw i64 %polly.indvar16.i16, %18
  %20 = shl i64 %19, 2
  %21 = add nuw nsw i64 %20, %32
  %scevgep.i17 = getelementptr i8, i8* %call.i1, i64 %21
  %scevgep19.i18 = bitcast i8* %scevgep.i17 to i32*
  store i32 1, i32* %scevgep19.i18, align 4, !alias.scope !13, !noalias !3
  %polly.indvar_next17.i19 = or i64 %polly.indvar16.i16, 1
  %22 = add nuw nsw i64 %polly.indvar_next17.i19, %18
  %23 = shl i64 %22, 2
  %24 = add nuw nsw i64 %23, %32
  %scevgep.i17.1 = getelementptr i8, i8* %call.i1, i64 %24
  %scevgep19.i18.1 = bitcast i8* %scevgep.i17.1 to i32*
  store i32 1, i32* %scevgep19.i18.1, align 4, !alias.scope !13, !noalias !3
  %polly.indvar_next17.i19.1 = or i64 %polly.indvar16.i16, 2
  %25 = add nuw nsw i64 %polly.indvar_next17.i19.1, %18
  %26 = shl i64 %25, 2
  %27 = add nuw nsw i64 %26, %32
  %scevgep.i17.2 = getelementptr i8, i8* %call.i1, i64 %27
  %scevgep19.i18.2 = bitcast i8* %scevgep.i17.2 to i32*
  store i32 1, i32* %scevgep19.i18.2, align 4, !alias.scope !13, !noalias !3
  %polly.indvar_next17.i19.2 = or i64 %polly.indvar16.i16, 3
  %28 = add nuw nsw i64 %polly.indvar_next17.i19.2, %18
  %29 = shl i64 %28, 2
  %30 = add nuw nsw i64 %29, %32
  %scevgep.i17.3 = getelementptr i8, i8* %call.i1, i64 %30
  %scevgep19.i18.3 = bitcast i8* %scevgep.i17.3 to i32*
  store i32 1, i32* %scevgep19.i18.3, align 4, !alias.scope !13, !noalias !3
  %polly.indvar_next17.i19.3 = add nsw i64 %polly.indvar16.i16, 4
  %exitcond.i20.3 = icmp eq i64 %polly.indvar_next17.i19.3, 32
  br i1 %exitcond.i20.3, label %polly.loop_exit15.i13, label %polly.stmt.for.body3.i21

polly.loop_preheader14.i23:                       ; preds = %polly.loop_preheader8.i15, %polly.loop_exit15.i13
  %polly.indvar10.i22 = phi i64 [ 0, %polly.loop_preheader8.i15 ], [ %polly.indvar_next11.i11, %polly.loop_exit15.i13 ]
  %31 = add nuw nsw i64 %polly.indvar10.i22, %17
  %32 = shl i64 %31, 12
  br label %polly.stmt.for.body3.i21

init.exit24:                                      ; preds = %polly.loop_exit3.i5
  %33 = bitcast i8* %call7.i to %struct.Matrix*
  %call7.i2 = tail call noalias i8* @malloc(i64 16) #4
  %34 = bitcast i8* %call7.i2 to %struct.Matrix*
  %35 = bitcast i8* %call7.i2 to i8**
  store i8* %call.i1, i8** %35, align 8
  %call2 = tail call %struct.Matrix* @matrix_multiply(%struct.Matrix* %33, %struct.Matrix* %34)
  %data = getelementptr inbounds %struct.Matrix, %struct.Matrix* %call2, i64 0, i32 0
  %36 = load i32*, i32** %data, align 8
  %arrayidx = getelementptr inbounds i32, i32* %36, i64 1048575
  %37 = load i32, i32* %arrayidx, align 4
  %call3 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([46 x i8], [46 x i8]* @.str, i64 0, i64 0), i32 1024, i32 1024, i32 1023, i32 1023, i32 %37) #4
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
!7 = distinct !{!7, !5, !"polly.alias.scope."}
!8 = distinct !{!8, !5, !"polly.alias.scope."}
!9 = !{!4, !7}
!10 = !{!4, !8}
!11 = distinct !{!11, !12, !"polly.alias.scope.call"}
!12 = distinct !{!12, !"polly.alias.scope.domain"}
!13 = distinct !{!13, !14, !"polly.alias.scope.call"}
!14 = distinct !{!14, !"polly.alias.scope.domain"}
