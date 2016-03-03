; ModuleID = 'MatrixMult.preopt.ll'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@X = common global [1024 x [1024 x i32]] zeroinitializer, align 16
@Y = common global [1024 x [1024 x i32]] zeroinitializer, align 16
@stdout = external global %struct._IO_FILE*, align 8
@.str = private unnamed_addr constant [4 x i8] c"%d \00", align 1
@Z = common global [1024 x [1024 x i32]] zeroinitializer, align 16
@.str.2 = private unnamed_addr constant [46 x i8] c"Pass %d X %d matrix test case (C[%d][%d]=%d)\0A\00", align 1

; Function Attrs: nounwind uwtable
define void @init() #0 {
entry:
  %polly.par.userContext = alloca {}, align 8
  %0 = bitcast {}* %polly.par.userContext to i8*
  call void @llvm.lifetime.start(i64 0, i8* %0)
  call void @GOMP_parallel_loop_runtime_start(void (i8*)* nonnull @init_polly_subfn, i8* %0, i32 0, i64 0, i64 32, i64 1) #4
  call void @init_polly_subfn(i8* %0) #4
  call void @GOMP_parallel_end() #4
  call void @llvm.lifetime.end(i64 8, i8* %0)
  ret void
}

; Function Attrs: nounwind uwtable
define noalias i32* @transpose(i32** noalias nocapture readnone %y, i32 %index) #0 {
entry:
  %call = tail call noalias i8* @malloc(i64 4096) #4
  %0 = bitcast i8* %call to i32*
  %1 = icmp ult i32 %index, 1024
  %2 = sext i32 %index to i64
  br i1 %1, label %polly.loop_preheader, label %for.body.preheader

for.body.preheader:                               ; preds = %entry
  br label %polly.split_new_and_old

polly.split_new_and_old:                          ; preds = %for.body.preheader
  %3 = sext i32 %index to i64
  %4 = icmp sge i64 %3, 0
  %5 = sext i32 %index to i64
  %6 = icmp sle i64 %5, 1023
  %7 = and i1 %4, %6
  br i1 %7, label %polly.start, label %for.body

for.body:                                         ; preds = %polly.split_new_and_old, %for.body
  %indvars.iv = phi i64 [ %indvars.iv.next.3, %for.body ], [ 0, %polly.split_new_and_old ]
  %arrayidx2 = getelementptr inbounds [1024 x [1024 x i32]], [1024 x [1024 x i32]]* @Y, i64 0, i64 %indvars.iv, i64 %2
  %8 = load i32, i32* %arrayidx2, align 4
  %arrayidx4 = getelementptr inbounds i32, i32* %0, i64 %indvars.iv
  store i32 %8, i32* %arrayidx4, align 4
  %indvars.iv.next = or i64 %indvars.iv, 1
  %arrayidx2.1 = getelementptr inbounds [1024 x [1024 x i32]], [1024 x [1024 x i32]]* @Y, i64 0, i64 %indvars.iv.next, i64 %2
  %9 = load i32, i32* %arrayidx2.1, align 4
  %arrayidx4.1 = getelementptr inbounds i32, i32* %0, i64 %indvars.iv.next
  store i32 %9, i32* %arrayidx4.1, align 4
  %indvars.iv.next.1 = or i64 %indvars.iv, 2
  %arrayidx2.2 = getelementptr inbounds [1024 x [1024 x i32]], [1024 x [1024 x i32]]* @Y, i64 0, i64 %indvars.iv.next.1, i64 %2
  %10 = load i32, i32* %arrayidx2.2, align 4
  %arrayidx4.2 = getelementptr inbounds i32, i32* %0, i64 %indvars.iv.next.1
  store i32 %10, i32* %arrayidx4.2, align 4
  %indvars.iv.next.2 = or i64 %indvars.iv, 3
  %arrayidx2.3 = getelementptr inbounds [1024 x [1024 x i32]], [1024 x [1024 x i32]]* @Y, i64 0, i64 %indvars.iv.next.2, i64 %2
  %11 = load i32, i32* %arrayidx2.3, align 4
  %arrayidx4.3 = getelementptr inbounds i32, i32* %0, i64 %indvars.iv.next.2
  store i32 %11, i32* %arrayidx4.3, align 4
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  %exitcond.3 = icmp eq i64 %indvars.iv.next.3, 1024
  br i1 %exitcond.3, label %for.end.loopexit9, label %for.body

for.end.loopexit:                                 ; preds = %polly.stmt.for.body
  br label %polly.merge_new_and_old39

for.end.loopexit9:                                ; preds = %for.body
  br label %polly.merge_new_and_old

polly.merge_new_and_old:                          ; preds = %polly.exiting, %for.end.loopexit9
  br label %for.end

polly.merge_new_and_old39:                        ; preds = %polly.exiting41, %for.end.loopexit
  br label %for.end

for.end:                                          ; preds = %polly.merge_new_and_old39, %polly.merge_new_and_old
  ret i32* %0

polly.split_new_and_old38:                        ; preds = %polly.loop_preheader
  br i1 true, label %polly.start40, label %polly.stmt.for.body

polly.stmt.for.body:                              ; preds = %polly.split_new_and_old38, %polly.stmt.for.body
  %polly.indvar = phi i64 [ %polly.indvar_next.3, %polly.stmt.for.body ], [ 0, %polly.split_new_and_old38 ]
  %12 = shl i64 %polly.indvar, 10
  %scevgep1 = getelementptr i32, i32* %scevgep, i64 %12
  %_p_scalar_ = load i32, i32* %scevgep1, align 4, !alias.scope !1, !noalias !3, !llvm.mem.parallel_loop_access !5
  %13 = shl i64 %polly.indvar, 2
  %scevgep2 = getelementptr i8, i8* %call, i64 %13
  %scevgep23 = bitcast i8* %scevgep2 to i32*
  store i32 %_p_scalar_, i32* %scevgep23, align 4, !alias.scope !4, !noalias !6, !llvm.mem.parallel_loop_access !5
  %polly.indvar_next = or i64 %polly.indvar, 1
  %14 = shl i64 %polly.indvar_next, 10
  %scevgep1.1 = getelementptr i32, i32* %scevgep, i64 %14
  %_p_scalar_.1 = load i32, i32* %scevgep1.1, align 4, !alias.scope !1, !noalias !3, !llvm.mem.parallel_loop_access !5
  %15 = shl i64 %polly.indvar_next, 2
  %scevgep2.1 = getelementptr i8, i8* %call, i64 %15
  %scevgep23.1 = bitcast i8* %scevgep2.1 to i32*
  store i32 %_p_scalar_.1, i32* %scevgep23.1, align 4, !alias.scope !4, !noalias !6, !llvm.mem.parallel_loop_access !5
  %polly.indvar_next.1 = or i64 %polly.indvar, 2
  %16 = shl i64 %polly.indvar_next.1, 10
  %scevgep1.2 = getelementptr i32, i32* %scevgep, i64 %16
  %_p_scalar_.2 = load i32, i32* %scevgep1.2, align 4, !alias.scope !1, !noalias !3, !llvm.mem.parallel_loop_access !5
  %17 = shl i64 %polly.indvar_next.1, 2
  %scevgep2.2 = getelementptr i8, i8* %call, i64 %17
  %scevgep23.2 = bitcast i8* %scevgep2.2 to i32*
  store i32 %_p_scalar_.2, i32* %scevgep23.2, align 4, !alias.scope !4, !noalias !6, !llvm.mem.parallel_loop_access !5
  %polly.indvar_next.2 = or i64 %polly.indvar, 3
  %18 = shl i64 %polly.indvar_next.2, 10
  %scevgep1.3 = getelementptr i32, i32* %scevgep, i64 %18
  %_p_scalar_.3 = load i32, i32* %scevgep1.3, align 4, !alias.scope !1, !noalias !3, !llvm.mem.parallel_loop_access !5
  %19 = shl i64 %polly.indvar_next.2, 2
  %scevgep2.3 = getelementptr i8, i8* %call, i64 %19
  %scevgep23.3 = bitcast i8* %scevgep2.3 to i32*
  store i32 %_p_scalar_.3, i32* %scevgep23.3, align 4, !alias.scope !4, !noalias !6, !llvm.mem.parallel_loop_access !5
  %polly.indvar_next.3 = add nsw i64 %polly.indvar, 4
  %exitcond6.3 = icmp eq i64 %polly.indvar_next.3, 1024
  br i1 %exitcond6.3, label %for.end.loopexit, label %polly.stmt.for.body, !llvm.loop !5

polly.loop_preheader:                             ; preds = %entry
  %scevgep = getelementptr [1024 x [1024 x i32]], [1024 x [1024 x i32]]* @Y, i64 0, i64 0, i64 %2
  br label %polly.split_new_and_old38

polly.start:                                      ; preds = %polly.split_new_and_old
  br label %polly.loop_preheader10

polly.loop_exit:                                  ; preds = %polly.stmt.for.body13
  br label %polly.exiting

polly.exiting:                                    ; preds = %polly.loop_exit
  br label %polly.merge_new_and_old

polly.loop_header:                                ; preds = %polly.stmt.for.body13, %polly.loop_preheader10
  %polly.indvar11 = phi i64 [ 0, %polly.loop_preheader10 ], [ %polly.indvar_next12, %polly.stmt.for.body13 ]
  br label %polly.stmt.for.body13

polly.stmt.for.body13:                            ; preds = %polly.loop_header
  %20 = shl i64 %polly.indvar11, 12
  %scevgep15 = getelementptr i32, i32* %scevgep14, i64 %20
  %_p_scalar_16 = load i32, i32* %scevgep15, align 4, !alias.scope !7, !noalias !9, !llvm.mem.parallel_loop_access !11
  %21 = shl i64 %polly.indvar11, 4
  %scevgep17 = getelementptr i8, i8* %call, i64 %21
  %scevgep1718 = bitcast i8* %scevgep17 to i32*
  store i32 %_p_scalar_16, i32* %scevgep1718, align 4, !alias.scope !10, !noalias !12, !llvm.mem.parallel_loop_access !11
  %22 = shl i64 %polly.indvar11, 12
  %scevgep20 = getelementptr i32, i32* %scevgep19, i64 %22
  %_p_scalar_21 = load i32, i32* %scevgep20, align 4, !alias.scope !7, !noalias !9, !llvm.mem.parallel_loop_access !11
  %23 = shl i64 %polly.indvar11, 4
  %scevgep24 = getelementptr i8, i8* %scevgep22, i64 %23
  %scevgep2425 = bitcast i8* %scevgep24 to i32*
  store i32 %_p_scalar_21, i32* %scevgep2425, align 4, !alias.scope !10, !noalias !12, !llvm.mem.parallel_loop_access !11
  %24 = shl i64 %polly.indvar11, 12
  %scevgep27 = getelementptr i32, i32* %scevgep26, i64 %24
  %_p_scalar_28 = load i32, i32* %scevgep27, align 4, !alias.scope !7, !noalias !9, !llvm.mem.parallel_loop_access !11
  %25 = shl i64 %polly.indvar11, 4
  %scevgep30 = getelementptr i8, i8* %scevgep29, i64 %25
  %scevgep3031 = bitcast i8* %scevgep30 to i32*
  store i32 %_p_scalar_28, i32* %scevgep3031, align 4, !alias.scope !10, !noalias !12, !llvm.mem.parallel_loop_access !11
  %26 = shl i64 %polly.indvar11, 12
  %scevgep33 = getelementptr i32, i32* %scevgep32, i64 %26
  %_p_scalar_34 = load i32, i32* %scevgep33, align 4, !alias.scope !7, !noalias !9, !llvm.mem.parallel_loop_access !11
  %27 = shl i64 %polly.indvar11, 4
  %scevgep36 = getelementptr i8, i8* %scevgep35, i64 %27
  %scevgep3637 = bitcast i8* %scevgep36 to i32*
  store i32 %_p_scalar_34, i32* %scevgep3637, align 4, !alias.scope !10, !noalias !12, !llvm.mem.parallel_loop_access !11
  %28 = shl i64 %polly.indvar11, 2
  %29 = add i64 %28, 4
  %p_exitcond.3 = icmp eq i64 %29, 1024
  %polly.indvar_next12 = add nsw i64 %polly.indvar11, 1
  %polly.loop_cond = icmp sle i64 %polly.indvar11, 254
  br i1 %polly.loop_cond, label %polly.loop_header, label %polly.loop_exit, !llvm.loop !11

polly.loop_preheader10:                           ; preds = %polly.start
  %scevgep14 = getelementptr [1024 x [1024 x i32]], [1024 x [1024 x i32]]* @Y, i64 0, i64 0, i64 %2
  %scevgep19 = getelementptr [1024 x [1024 x i32]], [1024 x [1024 x i32]]* @Y, i64 0, i64 1, i64 %2
  %scevgep22 = getelementptr i8, i8* %call, i64 4
  %scevgep26 = getelementptr [1024 x [1024 x i32]], [1024 x [1024 x i32]]* @Y, i64 0, i64 2, i64 %2
  %scevgep29 = getelementptr i8, i8* %call, i64 8
  %scevgep32 = getelementptr [1024 x [1024 x i32]], [1024 x [1024 x i32]]* @Y, i64 0, i64 3, i64 %2
  %scevgep35 = getelementptr i8, i8* %call, i64 12
  br label %polly.loop_header

polly.start40:                                    ; preds = %polly.split_new_and_old38
  br label %polly.loop_preheader43

polly.loop_exit44:                                ; preds = %polly.stmt.polly.stmt.for.body
  br label %polly.exiting41

polly.exiting41:                                  ; preds = %polly.loop_exit44
  br label %polly.merge_new_and_old39

polly.loop_header42:                              ; preds = %polly.stmt.polly.stmt.for.body, %polly.loop_preheader43
  %polly.indvar45 = phi i64 [ 0, %polly.loop_preheader43 ], [ %polly.indvar_next46, %polly.stmt.polly.stmt.for.body ]
  br label %polly.stmt.polly.stmt.for.body

polly.stmt.polly.stmt.for.body:                   ; preds = %polly.loop_header42
  %30 = shl i64 %polly.indvar45, 12
  %scevgep49 = getelementptr i32, i32* %scevgep48, i64 %30
  %_p_scalar__p_scalar_ = load i32, i32* %scevgep49, align 4, !alias.scope !13, !noalias !15, !llvm.mem.parallel_loop_access !17
  %31 = shl i64 %polly.indvar45, 4
  %scevgep50 = getelementptr i8, i8* %call, i64 %31
  %scevgep5051 = bitcast i8* %scevgep50 to i32*
  store i32 %_p_scalar__p_scalar_, i32* %scevgep5051, align 4, !alias.scope !16, !noalias !18, !llvm.mem.parallel_loop_access !17
  %32 = shl i64 %polly.indvar45, 12
  %scevgep53 = getelementptr i32, i32* %scevgep52, i64 %32
  %_p_scalar_.1_p_scalar_ = load i32, i32* %scevgep53, align 4, !alias.scope !13, !noalias !15, !llvm.mem.parallel_loop_access !17
  %33 = shl i64 %polly.indvar45, 4
  %scevgep55 = getelementptr i8, i8* %scevgep54, i64 %33
  %scevgep5556 = bitcast i8* %scevgep55 to i32*
  store i32 %_p_scalar_.1_p_scalar_, i32* %scevgep5556, align 4, !alias.scope !16, !noalias !18, !llvm.mem.parallel_loop_access !17
  %34 = shl i64 %polly.indvar45, 12
  %scevgep58 = getelementptr i32, i32* %scevgep57, i64 %34
  %_p_scalar_.2_p_scalar_ = load i32, i32* %scevgep58, align 4, !alias.scope !13, !noalias !15, !llvm.mem.parallel_loop_access !17
  %35 = shl i64 %polly.indvar45, 4
  %scevgep60 = getelementptr i8, i8* %scevgep59, i64 %35
  %scevgep6061 = bitcast i8* %scevgep60 to i32*
  store i32 %_p_scalar_.2_p_scalar_, i32* %scevgep6061, align 4, !alias.scope !16, !noalias !18, !llvm.mem.parallel_loop_access !17
  %36 = shl i64 %polly.indvar45, 12
  %scevgep63 = getelementptr i32, i32* %scevgep62, i64 %36
  %_p_scalar_.3_p_scalar_ = load i32, i32* %scevgep63, align 4, !alias.scope !13, !noalias !15, !llvm.mem.parallel_loop_access !17
  %37 = shl i64 %polly.indvar45, 4
  %scevgep65 = getelementptr i8, i8* %scevgep64, i64 %37
  %scevgep6566 = bitcast i8* %scevgep65 to i32*
  store i32 %_p_scalar_.3_p_scalar_, i32* %scevgep6566, align 4, !alias.scope !16, !noalias !18, !llvm.mem.parallel_loop_access !17
  %38 = shl i64 %polly.indvar45, 2
  %39 = add i64 %38, 4
  %p_exitcond6.3 = icmp eq i64 %39, 1024
  %polly.indvar_next46 = add nsw i64 %polly.indvar45, 1
  %polly.loop_cond47 = icmp sle i64 %polly.indvar45, 254
  br i1 %polly.loop_cond47, label %polly.loop_header42, label %polly.loop_exit44, !llvm.loop !17

polly.loop_preheader43:                           ; preds = %polly.start40
  %scevgep48 = getelementptr [1024 x [1024 x i32]], [1024 x [1024 x i32]]* @Y, i64 0, i64 0, i64 %2
  %scevgep52 = getelementptr [1024 x [1024 x i32]], [1024 x [1024 x i32]]* @Y, i64 0, i64 1, i64 %2
  %scevgep54 = getelementptr i8, i8* %call, i64 4
  %scevgep57 = getelementptr [1024 x [1024 x i32]], [1024 x [1024 x i32]]* @Y, i64 0, i64 2, i64 %2
  %scevgep59 = getelementptr i8, i8* %call, i64 8
  %scevgep62 = getelementptr [1024 x [1024 x i32]], [1024 x [1024 x i32]]* @Y, i64 0, i64 3, i64 %2
  %scevgep64 = getelementptr i8, i8* %call, i64 12
  br label %polly.loop_header42
}

; Function Attrs: nounwind
declare noalias i8* @malloc(i64) #1

; Function Attrs: norecurse nounwind readonly uwtable
define i32 @dot(i32* noalias nocapture readonly %a, i32* noalias nocapture readonly %b) #2 {
entry:
  %.s2a = alloca i32
  %sum.03.phiops.0.s2a = alloca i32
  %sum.03.phiops.0.phiops = alloca i32
  br label %polly.split_new_and_old

polly.merge_new_and_old:                          ; preds = %polly.exiting16, %vector.body
  %.merge = phi i32 [ %.final_reload, %polly.exiting16 ], [ %96, %vector.body ]
  br label %polly.exiting

polly.exiting:                                    ; preds = %polly.merge_new_and_old
  %.lcssa = phi i32 [ %.merge, %polly.merge_new_and_old ]
  ret i32 %.lcssa

polly.split_new_and_old:                          ; preds = %entry
  br i1 true, label %polly.start, label %polly.loop_preheader2

polly.loop_preheader2:                            ; preds = %polly.split_new_and_old, %vector.body
  %sum.03.phiops.0 = phi i32 [ %96, %vector.body ], [ 0, %polly.split_new_and_old ]
  %polly.indvar = phi i64 [ %polly.indvar_next, %vector.body ], [ 0, %polly.split_new_and_old ]
  %0 = shl i64 %polly.indvar, 6
  %scevgep = getelementptr i32, i32* %a, i64 %0
  %scevgep8 = getelementptr i32, i32* %b, i64 %0
  br label %vector.body

vector.body:                                      ; preds = %polly.loop_preheader2
  %1 = insertelement <4 x i32> <i32 undef, i32 0, i32 0, i32 0>, i32 %sum.03.phiops.0, i32 0
  %2 = bitcast i32* %scevgep to <4 x i32>*
  %wide.load = load <4 x i32>, <4 x i32>* %2, align 4, !alias.scope !19, !noalias !21
  %3 = bitcast i32* %scevgep8 to <4 x i32>*
  %wide.load12 = load <4 x i32>, <4 x i32>* %3, align 4, !alias.scope !24, !noalias !26
  %4 = mul nsw <4 x i32> %wide.load12, %wide.load
  %5 = add nsw <4 x i32> %4, %1
  %6 = getelementptr i32, i32* %scevgep, i64 4
  %7 = bitcast i32* %6 to <4 x i32>*
  %wide.load.1 = load <4 x i32>, <4 x i32>* %7, align 4, !alias.scope !19, !noalias !21
  %8 = getelementptr i32, i32* %scevgep8, i64 4
  %9 = bitcast i32* %8 to <4 x i32>*
  %wide.load12.1 = load <4 x i32>, <4 x i32>* %9, align 4, !alias.scope !24, !noalias !26
  %10 = mul nsw <4 x i32> %wide.load12.1, %wide.load.1
  %11 = add nsw <4 x i32> %10, %5
  %12 = getelementptr i32, i32* %scevgep, i64 8
  %13 = bitcast i32* %12 to <4 x i32>*
  %wide.load.2 = load <4 x i32>, <4 x i32>* %13, align 4, !alias.scope !19, !noalias !21
  %14 = getelementptr i32, i32* %scevgep8, i64 8
  %15 = bitcast i32* %14 to <4 x i32>*
  %wide.load12.2 = load <4 x i32>, <4 x i32>* %15, align 4, !alias.scope !24, !noalias !26
  %16 = mul nsw <4 x i32> %wide.load12.2, %wide.load.2
  %17 = add nsw <4 x i32> %16, %11
  %18 = getelementptr i32, i32* %scevgep, i64 12
  %19 = bitcast i32* %18 to <4 x i32>*
  %wide.load.3 = load <4 x i32>, <4 x i32>* %19, align 4, !alias.scope !19, !noalias !21
  %20 = getelementptr i32, i32* %scevgep8, i64 12
  %21 = bitcast i32* %20 to <4 x i32>*
  %wide.load12.3 = load <4 x i32>, <4 x i32>* %21, align 4, !alias.scope !24, !noalias !26
  %22 = mul nsw <4 x i32> %wide.load12.3, %wide.load.3
  %23 = add nsw <4 x i32> %22, %17
  %24 = getelementptr i32, i32* %scevgep, i64 16
  %25 = bitcast i32* %24 to <4 x i32>*
  %wide.load.4 = load <4 x i32>, <4 x i32>* %25, align 4, !alias.scope !19, !noalias !21
  %26 = getelementptr i32, i32* %scevgep8, i64 16
  %27 = bitcast i32* %26 to <4 x i32>*
  %wide.load12.4 = load <4 x i32>, <4 x i32>* %27, align 4, !alias.scope !24, !noalias !26
  %28 = mul nsw <4 x i32> %wide.load12.4, %wide.load.4
  %29 = add nsw <4 x i32> %28, %23
  %30 = getelementptr i32, i32* %scevgep, i64 20
  %31 = bitcast i32* %30 to <4 x i32>*
  %wide.load.5 = load <4 x i32>, <4 x i32>* %31, align 4, !alias.scope !19, !noalias !21
  %32 = getelementptr i32, i32* %scevgep8, i64 20
  %33 = bitcast i32* %32 to <4 x i32>*
  %wide.load12.5 = load <4 x i32>, <4 x i32>* %33, align 4, !alias.scope !24, !noalias !26
  %34 = mul nsw <4 x i32> %wide.load12.5, %wide.load.5
  %35 = add nsw <4 x i32> %34, %29
  %36 = getelementptr i32, i32* %scevgep, i64 24
  %37 = bitcast i32* %36 to <4 x i32>*
  %wide.load.6 = load <4 x i32>, <4 x i32>* %37, align 4, !alias.scope !19, !noalias !21
  %38 = getelementptr i32, i32* %scevgep8, i64 24
  %39 = bitcast i32* %38 to <4 x i32>*
  %wide.load12.6 = load <4 x i32>, <4 x i32>* %39, align 4, !alias.scope !24, !noalias !26
  %40 = mul nsw <4 x i32> %wide.load12.6, %wide.load.6
  %41 = add nsw <4 x i32> %40, %35
  %42 = getelementptr i32, i32* %scevgep, i64 28
  %43 = bitcast i32* %42 to <4 x i32>*
  %wide.load.7 = load <4 x i32>, <4 x i32>* %43, align 4, !alias.scope !19, !noalias !21
  %44 = getelementptr i32, i32* %scevgep8, i64 28
  %45 = bitcast i32* %44 to <4 x i32>*
  %wide.load12.7 = load <4 x i32>, <4 x i32>* %45, align 4, !alias.scope !24, !noalias !26
  %46 = mul nsw <4 x i32> %wide.load12.7, %wide.load.7
  %47 = add nsw <4 x i32> %46, %41
  %48 = getelementptr i32, i32* %scevgep, i64 32
  %49 = bitcast i32* %48 to <4 x i32>*
  %wide.load.8 = load <4 x i32>, <4 x i32>* %49, align 4, !alias.scope !19, !noalias !21
  %50 = getelementptr i32, i32* %scevgep8, i64 32
  %51 = bitcast i32* %50 to <4 x i32>*
  %wide.load12.8 = load <4 x i32>, <4 x i32>* %51, align 4, !alias.scope !24, !noalias !26
  %52 = mul nsw <4 x i32> %wide.load12.8, %wide.load.8
  %53 = add nsw <4 x i32> %52, %47
  %54 = getelementptr i32, i32* %scevgep, i64 36
  %55 = bitcast i32* %54 to <4 x i32>*
  %wide.load.9 = load <4 x i32>, <4 x i32>* %55, align 4, !alias.scope !19, !noalias !21
  %56 = getelementptr i32, i32* %scevgep8, i64 36
  %57 = bitcast i32* %56 to <4 x i32>*
  %wide.load12.9 = load <4 x i32>, <4 x i32>* %57, align 4, !alias.scope !24, !noalias !26
  %58 = mul nsw <4 x i32> %wide.load12.9, %wide.load.9
  %59 = add nsw <4 x i32> %58, %53
  %60 = getelementptr i32, i32* %scevgep, i64 40
  %61 = bitcast i32* %60 to <4 x i32>*
  %wide.load.10 = load <4 x i32>, <4 x i32>* %61, align 4, !alias.scope !19, !noalias !21
  %62 = getelementptr i32, i32* %scevgep8, i64 40
  %63 = bitcast i32* %62 to <4 x i32>*
  %wide.load12.10 = load <4 x i32>, <4 x i32>* %63, align 4, !alias.scope !24, !noalias !26
  %64 = mul nsw <4 x i32> %wide.load12.10, %wide.load.10
  %65 = add nsw <4 x i32> %64, %59
  %66 = getelementptr i32, i32* %scevgep, i64 44
  %67 = bitcast i32* %66 to <4 x i32>*
  %wide.load.11 = load <4 x i32>, <4 x i32>* %67, align 4, !alias.scope !19, !noalias !21
  %68 = getelementptr i32, i32* %scevgep8, i64 44
  %69 = bitcast i32* %68 to <4 x i32>*
  %wide.load12.11 = load <4 x i32>, <4 x i32>* %69, align 4, !alias.scope !24, !noalias !26
  %70 = mul nsw <4 x i32> %wide.load12.11, %wide.load.11
  %71 = add nsw <4 x i32> %70, %65
  %72 = getelementptr i32, i32* %scevgep, i64 48
  %73 = bitcast i32* %72 to <4 x i32>*
  %wide.load.12 = load <4 x i32>, <4 x i32>* %73, align 4, !alias.scope !19, !noalias !21
  %74 = getelementptr i32, i32* %scevgep8, i64 48
  %75 = bitcast i32* %74 to <4 x i32>*
  %wide.load12.12 = load <4 x i32>, <4 x i32>* %75, align 4, !alias.scope !24, !noalias !26
  %76 = mul nsw <4 x i32> %wide.load12.12, %wide.load.12
  %77 = add nsw <4 x i32> %76, %71
  %78 = getelementptr i32, i32* %scevgep, i64 52
  %79 = bitcast i32* %78 to <4 x i32>*
  %wide.load.13 = load <4 x i32>, <4 x i32>* %79, align 4, !alias.scope !19, !noalias !21
  %80 = getelementptr i32, i32* %scevgep8, i64 52
  %81 = bitcast i32* %80 to <4 x i32>*
  %wide.load12.13 = load <4 x i32>, <4 x i32>* %81, align 4, !alias.scope !24, !noalias !26
  %82 = mul nsw <4 x i32> %wide.load12.13, %wide.load.13
  %83 = add nsw <4 x i32> %82, %77
  %84 = getelementptr i32, i32* %scevgep, i64 56
  %85 = bitcast i32* %84 to <4 x i32>*
  %wide.load.14 = load <4 x i32>, <4 x i32>* %85, align 4, !alias.scope !19, !noalias !21
  %86 = getelementptr i32, i32* %scevgep8, i64 56
  %87 = bitcast i32* %86 to <4 x i32>*
  %wide.load12.14 = load <4 x i32>, <4 x i32>* %87, align 4, !alias.scope !24, !noalias !26
  %88 = mul nsw <4 x i32> %wide.load12.14, %wide.load.14
  %89 = add nsw <4 x i32> %88, %83
  %90 = getelementptr i32, i32* %scevgep, i64 60
  %91 = bitcast i32* %90 to <4 x i32>*
  %wide.load.15 = load <4 x i32>, <4 x i32>* %91, align 4, !alias.scope !19, !noalias !21
  %92 = getelementptr i32, i32* %scevgep8, i64 60
  %93 = bitcast i32* %92 to <4 x i32>*
  %wide.load12.15 = load <4 x i32>, <4 x i32>* %93, align 4, !alias.scope !24, !noalias !26
  %94 = mul nsw <4 x i32> %wide.load12.15, %wide.load.15
  %95 = add nsw <4 x i32> %94, %89
  %rdx.shuf = shufflevector <4 x i32> %95, <4 x i32> undef, <4 x i32> <i32 2, i32 3, i32 undef, i32 undef>
  %bin.rdx = add <4 x i32> %95, %rdx.shuf
  %rdx.shuf13 = shufflevector <4 x i32> %bin.rdx, <4 x i32> undef, <4 x i32> <i32 1, i32 undef, i32 undef, i32 undef>
  %bin.rdx14 = add <4 x i32> %bin.rdx, %rdx.shuf13
  %96 = extractelement <4 x i32> %bin.rdx14, i32 0
  %polly.indvar_next = add nuw nsw i64 %polly.indvar, 1
  %exitcond11 = icmp eq i64 %polly.indvar_next, 16
  br i1 %exitcond11, label %polly.merge_new_and_old, label %polly.loop_preheader2

polly.start:                                      ; preds = %polly.split_new_and_old
  store i32 0, i32* %sum.03.phiops.0.phiops
  br label %polly.loop_preheader

polly.loop_exit:                                  ; preds = %polly.stmt.vector.body
  br label %polly.exiting16

polly.exiting16:                                  ; preds = %polly.loop_exit
  %.final_reload = load i32, i32* %.s2a
  br label %polly.merge_new_and_old

polly.loop_header:                                ; preds = %polly.stmt.vector.body, %polly.loop_preheader
  %polly.indvar17 = phi i64 [ 0, %polly.loop_preheader ], [ %polly.indvar_next18, %polly.stmt.vector.body ]
  br label %polly.stmt.polly.loop_preheader2

polly.stmt.polly.loop_preheader2:                 ; preds = %polly.loop_header
  %sum.03.phiops.0.phiops.reload = load i32, i32* %sum.03.phiops.0.phiops
  store i32 %sum.03.phiops.0.phiops.reload, i32* %sum.03.phiops.0.s2a
  br label %polly.stmt.vector.body

polly.stmt.vector.body:                           ; preds = %polly.stmt.polly.loop_preheader2
  %sum.03.phiops.0.s2a.reload = load i32, i32* %sum.03.phiops.0.s2a
  %p_ = insertelement <4 x i32> <i32 undef, i32 0, i32 0, i32 0>, i32 %sum.03.phiops.0.s2a.reload, i32 0
  %97 = shl i64 %polly.indvar17, 6
  %scevgep19 = getelementptr i32, i32* %a, i64 %97
  %scevgep1920 = bitcast i32* %scevgep19 to <4 x i32>*
  %wide.load_p_scalar_ = load <4 x i32>, <4 x i32>* %scevgep1920, align 4, !alias.scope !27, !noalias !29
  %scevgep21 = getelementptr i32, i32* %b, i64 %97
  %scevgep2122 = bitcast i32* %scevgep21 to <4 x i32>*
  %wide.load12_p_scalar_ = load <4 x i32>, <4 x i32>* %scevgep2122, align 4, !alias.scope !30, !noalias !33
  %p_23 = mul nsw <4 x i32> %wide.load12_p_scalar_, %wide.load_p_scalar_
  %p_24 = add nsw <4 x i32> %p_23, %p_
  %98 = shl i64 %polly.indvar17, 6
  %scevgep26 = getelementptr i32, i32* %scevgep25, i64 %98
  %scevgep2627 = bitcast i32* %scevgep26 to <4 x i32>*
  %wide.load.1_p_scalar_ = load <4 x i32>, <4 x i32>* %scevgep2627, align 4, !alias.scope !27, !noalias !29
  %scevgep29 = getelementptr i32, i32* %scevgep28, i64 %98
  %scevgep2930 = bitcast i32* %scevgep29 to <4 x i32>*
  %wide.load12.1_p_scalar_ = load <4 x i32>, <4 x i32>* %scevgep2930, align 4, !alias.scope !30, !noalias !33
  %p_31 = mul nsw <4 x i32> %wide.load12.1_p_scalar_, %wide.load.1_p_scalar_
  %p_32 = add nsw <4 x i32> %p_31, %p_24
  %99 = shl i64 %polly.indvar17, 6
  %scevgep34 = getelementptr i32, i32* %scevgep33, i64 %99
  %scevgep3435 = bitcast i32* %scevgep34 to <4 x i32>*
  %wide.load.2_p_scalar_ = load <4 x i32>, <4 x i32>* %scevgep3435, align 4, !alias.scope !27, !noalias !29
  %scevgep37 = getelementptr i32, i32* %scevgep36, i64 %99
  %scevgep3738 = bitcast i32* %scevgep37 to <4 x i32>*
  %wide.load12.2_p_scalar_ = load <4 x i32>, <4 x i32>* %scevgep3738, align 4, !alias.scope !30, !noalias !33
  %p_39 = mul nsw <4 x i32> %wide.load12.2_p_scalar_, %wide.load.2_p_scalar_
  %p_40 = add nsw <4 x i32> %p_39, %p_32
  %100 = shl i64 %polly.indvar17, 6
  %scevgep42 = getelementptr i32, i32* %scevgep41, i64 %100
  %scevgep4243 = bitcast i32* %scevgep42 to <4 x i32>*
  %wide.load.3_p_scalar_ = load <4 x i32>, <4 x i32>* %scevgep4243, align 4, !alias.scope !27, !noalias !29
  %scevgep45 = getelementptr i32, i32* %scevgep44, i64 %100
  %scevgep4546 = bitcast i32* %scevgep45 to <4 x i32>*
  %wide.load12.3_p_scalar_ = load <4 x i32>, <4 x i32>* %scevgep4546, align 4, !alias.scope !30, !noalias !33
  %p_47 = mul nsw <4 x i32> %wide.load12.3_p_scalar_, %wide.load.3_p_scalar_
  %p_48 = add nsw <4 x i32> %p_47, %p_40
  %101 = shl i64 %polly.indvar17, 6
  %scevgep50 = getelementptr i32, i32* %scevgep49, i64 %101
  %scevgep5051 = bitcast i32* %scevgep50 to <4 x i32>*
  %wide.load.4_p_scalar_ = load <4 x i32>, <4 x i32>* %scevgep5051, align 4, !alias.scope !27, !noalias !29
  %scevgep53 = getelementptr i32, i32* %scevgep52, i64 %101
  %scevgep5354 = bitcast i32* %scevgep53 to <4 x i32>*
  %wide.load12.4_p_scalar_ = load <4 x i32>, <4 x i32>* %scevgep5354, align 4, !alias.scope !30, !noalias !33
  %p_55 = mul nsw <4 x i32> %wide.load12.4_p_scalar_, %wide.load.4_p_scalar_
  %p_56 = add nsw <4 x i32> %p_55, %p_48
  %102 = shl i64 %polly.indvar17, 6
  %scevgep58 = getelementptr i32, i32* %scevgep57, i64 %102
  %scevgep5859 = bitcast i32* %scevgep58 to <4 x i32>*
  %wide.load.5_p_scalar_ = load <4 x i32>, <4 x i32>* %scevgep5859, align 4, !alias.scope !27, !noalias !29
  %scevgep61 = getelementptr i32, i32* %scevgep60, i64 %102
  %scevgep6162 = bitcast i32* %scevgep61 to <4 x i32>*
  %wide.load12.5_p_scalar_ = load <4 x i32>, <4 x i32>* %scevgep6162, align 4, !alias.scope !30, !noalias !33
  %p_63 = mul nsw <4 x i32> %wide.load12.5_p_scalar_, %wide.load.5_p_scalar_
  %p_64 = add nsw <4 x i32> %p_63, %p_56
  %103 = shl i64 %polly.indvar17, 6
  %scevgep66 = getelementptr i32, i32* %scevgep65, i64 %103
  %scevgep6667 = bitcast i32* %scevgep66 to <4 x i32>*
  %wide.load.6_p_scalar_ = load <4 x i32>, <4 x i32>* %scevgep6667, align 4, !alias.scope !27, !noalias !29
  %scevgep69 = getelementptr i32, i32* %scevgep68, i64 %103
  %scevgep6970 = bitcast i32* %scevgep69 to <4 x i32>*
  %wide.load12.6_p_scalar_ = load <4 x i32>, <4 x i32>* %scevgep6970, align 4, !alias.scope !30, !noalias !33
  %p_71 = mul nsw <4 x i32> %wide.load12.6_p_scalar_, %wide.load.6_p_scalar_
  %p_72 = add nsw <4 x i32> %p_71, %p_64
  %104 = shl i64 %polly.indvar17, 6
  %scevgep74 = getelementptr i32, i32* %scevgep73, i64 %104
  %scevgep7475 = bitcast i32* %scevgep74 to <4 x i32>*
  %wide.load.7_p_scalar_ = load <4 x i32>, <4 x i32>* %scevgep7475, align 4, !alias.scope !27, !noalias !29
  %scevgep77 = getelementptr i32, i32* %scevgep76, i64 %104
  %scevgep7778 = bitcast i32* %scevgep77 to <4 x i32>*
  %wide.load12.7_p_scalar_ = load <4 x i32>, <4 x i32>* %scevgep7778, align 4, !alias.scope !30, !noalias !33
  %p_79 = mul nsw <4 x i32> %wide.load12.7_p_scalar_, %wide.load.7_p_scalar_
  %p_80 = add nsw <4 x i32> %p_79, %p_72
  %105 = shl i64 %polly.indvar17, 6
  %scevgep82 = getelementptr i32, i32* %scevgep81, i64 %105
  %scevgep8283 = bitcast i32* %scevgep82 to <4 x i32>*
  %wide.load.8_p_scalar_ = load <4 x i32>, <4 x i32>* %scevgep8283, align 4, !alias.scope !27, !noalias !29
  %scevgep85 = getelementptr i32, i32* %scevgep84, i64 %105
  %scevgep8586 = bitcast i32* %scevgep85 to <4 x i32>*
  %wide.load12.8_p_scalar_ = load <4 x i32>, <4 x i32>* %scevgep8586, align 4, !alias.scope !30, !noalias !33
  %p_87 = mul nsw <4 x i32> %wide.load12.8_p_scalar_, %wide.load.8_p_scalar_
  %p_88 = add nsw <4 x i32> %p_87, %p_80
  %106 = shl i64 %polly.indvar17, 6
  %scevgep90 = getelementptr i32, i32* %scevgep89, i64 %106
  %scevgep9091 = bitcast i32* %scevgep90 to <4 x i32>*
  %wide.load.9_p_scalar_ = load <4 x i32>, <4 x i32>* %scevgep9091, align 4, !alias.scope !27, !noalias !29
  %scevgep93 = getelementptr i32, i32* %scevgep92, i64 %106
  %scevgep9394 = bitcast i32* %scevgep93 to <4 x i32>*
  %wide.load12.9_p_scalar_ = load <4 x i32>, <4 x i32>* %scevgep9394, align 4, !alias.scope !30, !noalias !33
  %p_95 = mul nsw <4 x i32> %wide.load12.9_p_scalar_, %wide.load.9_p_scalar_
  %p_96 = add nsw <4 x i32> %p_95, %p_88
  %107 = shl i64 %polly.indvar17, 6
  %scevgep98 = getelementptr i32, i32* %scevgep97, i64 %107
  %scevgep9899 = bitcast i32* %scevgep98 to <4 x i32>*
  %wide.load.10_p_scalar_ = load <4 x i32>, <4 x i32>* %scevgep9899, align 4, !alias.scope !27, !noalias !29
  %scevgep101 = getelementptr i32, i32* %scevgep100, i64 %107
  %scevgep101102 = bitcast i32* %scevgep101 to <4 x i32>*
  %wide.load12.10_p_scalar_ = load <4 x i32>, <4 x i32>* %scevgep101102, align 4, !alias.scope !30, !noalias !33
  %p_103 = mul nsw <4 x i32> %wide.load12.10_p_scalar_, %wide.load.10_p_scalar_
  %p_104 = add nsw <4 x i32> %p_103, %p_96
  %108 = shl i64 %polly.indvar17, 6
  %scevgep106 = getelementptr i32, i32* %scevgep105, i64 %108
  %scevgep106107 = bitcast i32* %scevgep106 to <4 x i32>*
  %wide.load.11_p_scalar_ = load <4 x i32>, <4 x i32>* %scevgep106107, align 4, !alias.scope !27, !noalias !29
  %scevgep109 = getelementptr i32, i32* %scevgep108, i64 %108
  %scevgep109110 = bitcast i32* %scevgep109 to <4 x i32>*
  %wide.load12.11_p_scalar_ = load <4 x i32>, <4 x i32>* %scevgep109110, align 4, !alias.scope !30, !noalias !33
  %p_111 = mul nsw <4 x i32> %wide.load12.11_p_scalar_, %wide.load.11_p_scalar_
  %p_112 = add nsw <4 x i32> %p_111, %p_104
  %109 = shl i64 %polly.indvar17, 6
  %scevgep114 = getelementptr i32, i32* %scevgep113, i64 %109
  %scevgep114115 = bitcast i32* %scevgep114 to <4 x i32>*
  %wide.load.12_p_scalar_ = load <4 x i32>, <4 x i32>* %scevgep114115, align 4, !alias.scope !27, !noalias !29
  %scevgep117 = getelementptr i32, i32* %scevgep116, i64 %109
  %scevgep117118 = bitcast i32* %scevgep117 to <4 x i32>*
  %wide.load12.12_p_scalar_ = load <4 x i32>, <4 x i32>* %scevgep117118, align 4, !alias.scope !30, !noalias !33
  %p_119 = mul nsw <4 x i32> %wide.load12.12_p_scalar_, %wide.load.12_p_scalar_
  %p_120 = add nsw <4 x i32> %p_119, %p_112
  %110 = shl i64 %polly.indvar17, 6
  %scevgep122 = getelementptr i32, i32* %scevgep121, i64 %110
  %scevgep122123 = bitcast i32* %scevgep122 to <4 x i32>*
  %wide.load.13_p_scalar_ = load <4 x i32>, <4 x i32>* %scevgep122123, align 4, !alias.scope !27, !noalias !29
  %scevgep125 = getelementptr i32, i32* %scevgep124, i64 %110
  %scevgep125126 = bitcast i32* %scevgep125 to <4 x i32>*
  %wide.load12.13_p_scalar_ = load <4 x i32>, <4 x i32>* %scevgep125126, align 4, !alias.scope !30, !noalias !33
  %p_127 = mul nsw <4 x i32> %wide.load12.13_p_scalar_, %wide.load.13_p_scalar_
  %p_128 = add nsw <4 x i32> %p_127, %p_120
  %111 = shl i64 %polly.indvar17, 6
  %scevgep130 = getelementptr i32, i32* %scevgep129, i64 %111
  %scevgep130131 = bitcast i32* %scevgep130 to <4 x i32>*
  %wide.load.14_p_scalar_ = load <4 x i32>, <4 x i32>* %scevgep130131, align 4, !alias.scope !27, !noalias !29
  %scevgep133 = getelementptr i32, i32* %scevgep132, i64 %111
  %scevgep133134 = bitcast i32* %scevgep133 to <4 x i32>*
  %wide.load12.14_p_scalar_ = load <4 x i32>, <4 x i32>* %scevgep133134, align 4, !alias.scope !30, !noalias !33
  %p_135 = mul nsw <4 x i32> %wide.load12.14_p_scalar_, %wide.load.14_p_scalar_
  %p_136 = add nsw <4 x i32> %p_135, %p_128
  %112 = shl i64 %polly.indvar17, 6
  %scevgep138 = getelementptr i32, i32* %scevgep137, i64 %112
  %scevgep138139 = bitcast i32* %scevgep138 to <4 x i32>*
  %wide.load.15_p_scalar_ = load <4 x i32>, <4 x i32>* %scevgep138139, align 4, !alias.scope !27, !noalias !29
  %scevgep141 = getelementptr i32, i32* %scevgep140, i64 %112
  %scevgep141142 = bitcast i32* %scevgep141 to <4 x i32>*
  %wide.load12.15_p_scalar_ = load <4 x i32>, <4 x i32>* %scevgep141142, align 4, !alias.scope !30, !noalias !33
  %p_143 = mul nsw <4 x i32> %wide.load12.15_p_scalar_, %wide.load.15_p_scalar_
  %p_144 = add nsw <4 x i32> %p_143, %p_136
  %p_rdx.shuf = shufflevector <4 x i32> %p_144, <4 x i32> undef, <4 x i32> <i32 2, i32 3, i32 undef, i32 undef>
  %p_bin.rdx = add <4 x i32> %p_144, %p_rdx.shuf
  %p_rdx.shuf13 = shufflevector <4 x i32> %p_bin.rdx, <4 x i32> undef, <4 x i32> <i32 1, i32 undef, i32 undef, i32 undef>
  %p_bin.rdx14 = add <4 x i32> %p_bin.rdx, %p_rdx.shuf13
  %p_145 = extractelement <4 x i32> %p_bin.rdx14, i32 0
  %113 = add i64 %polly.indvar17, 1
  %p_exitcond11 = icmp eq i64 %113, 16
  store i32 %p_145, i32* %sum.03.phiops.0.phiops
  store i32 %p_145, i32* %.s2a
  %polly.indvar_next18 = add nsw i64 %polly.indvar17, 1
  %polly.loop_cond = icmp sle i64 %polly.indvar17, 14
  br i1 %polly.loop_cond, label %polly.loop_header, label %polly.loop_exit

polly.loop_preheader:                             ; preds = %polly.start
  %scevgep25 = getelementptr i32, i32* %a, i64 4
  %scevgep28 = getelementptr i32, i32* %b, i64 4
  %scevgep33 = getelementptr i32, i32* %a, i64 8
  %scevgep36 = getelementptr i32, i32* %b, i64 8
  %scevgep41 = getelementptr i32, i32* %a, i64 12
  %scevgep44 = getelementptr i32, i32* %b, i64 12
  %scevgep49 = getelementptr i32, i32* %a, i64 16
  %scevgep52 = getelementptr i32, i32* %b, i64 16
  %scevgep57 = getelementptr i32, i32* %a, i64 20
  %scevgep60 = getelementptr i32, i32* %b, i64 20
  %scevgep65 = getelementptr i32, i32* %a, i64 24
  %scevgep68 = getelementptr i32, i32* %b, i64 24
  %scevgep73 = getelementptr i32, i32* %a, i64 28
  %scevgep76 = getelementptr i32, i32* %b, i64 28
  %scevgep81 = getelementptr i32, i32* %a, i64 32
  %scevgep84 = getelementptr i32, i32* %b, i64 32
  %scevgep89 = getelementptr i32, i32* %a, i64 36
  %scevgep92 = getelementptr i32, i32* %b, i64 36
  %scevgep97 = getelementptr i32, i32* %a, i64 40
  %scevgep100 = getelementptr i32, i32* %b, i64 40
  %scevgep105 = getelementptr i32, i32* %a, i64 44
  %scevgep108 = getelementptr i32, i32* %b, i64 44
  %scevgep113 = getelementptr i32, i32* %a, i64 48
  %scevgep116 = getelementptr i32, i32* %b, i64 48
  %scevgep121 = getelementptr i32, i32* %a, i64 52
  %scevgep124 = getelementptr i32, i32* %b, i64 52
  %scevgep129 = getelementptr i32, i32* %a, i64 56
  %scevgep132 = getelementptr i32, i32* %b, i64 56
  %scevgep137 = getelementptr i32, i32* %a, i64 60
  %scevgep140 = getelementptr i32, i32* %b, i64 60
  br label %polly.loop_header
}

; Function Attrs: nounwind uwtable
define void @print_array() #3 {
entry:
  br label %for.cond1.preheader

for.cond1.preheader:                              ; preds = %for.end, %entry
  %indvars.iv6 = phi i64 [ 0, %entry ], [ %indvars.iv.next7, %for.end ]
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 8
  br label %for.body3

for.body3:                                        ; preds = %for.inc, %for.cond1.preheader
  %indvars.iv = phi i64 [ 0, %for.cond1.preheader ], [ %indvars.iv.next, %for.inc ]
  %1 = phi %struct._IO_FILE* [ %0, %for.cond1.preheader ], [ %5, %for.inc ]
  %arrayidx5 = getelementptr inbounds [1024 x [1024 x i32]], [1024 x [1024 x i32]]* @Z, i64 0, i64 %indvars.iv6, i64 %indvars.iv
  %2 = load i32, i32* %arrayidx5, align 4
  %call = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %1, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str, i64 0, i64 0), i32 %2) #4
  %3 = trunc i64 %indvars.iv to i32
  %rem = srem i32 %3, 80
  %cmp6 = icmp eq i32 %rem, 79
  br i1 %cmp6, label %if.then, label %for.inc

if.then:                                          ; preds = %for.body3
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 8
  %fputc3 = tail call i32 @fputc(i32 10, %struct._IO_FILE* %4)
  br label %for.inc

for.inc:                                          ; preds = %if.then, %for.body3
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 8
  %exitcond = icmp eq i64 %indvars.iv.next, 1024
  br i1 %exitcond, label %for.end, label %for.body3

for.end:                                          ; preds = %for.inc
  %.lcssa = phi %struct._IO_FILE* [ %5, %for.inc ]
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %.lcssa)
  %indvars.iv.next7 = add nuw nsw i64 %indvars.iv6, 1
  %exitcond8 = icmp eq i64 %indvars.iv.next7, 1024
  br i1 %exitcond8, label %for.end11, label %for.cond1.preheader

for.end11:                                        ; preds = %for.end
  ret void
}

; Function Attrs: nounwind
declare i32 @fprintf(%struct._IO_FILE* nocapture, i8* nocapture readonly, ...) #1

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
entry:
  %polly.par.userContext.i = alloca {}, align 8
  %y_t = alloca [1024 x i32], align 16
  %0 = bitcast {}* %polly.par.userContext.i to i8*
  call void @llvm.lifetime.start(i64 0, i8* %0) #4
  call void @GOMP_parallel_loop_runtime_start(void (i8*)* nonnull @init_polly_subfn, i8* %0, i32 0, i64 0, i64 32, i64 1) #4
  call void @init_polly_subfn(i8* %0) #4
  call void @GOMP_parallel_end() #4
  call void @llvm.lifetime.end(i64 8, i8* %0) #4
  br label %polly.loop_preheader

for.body10:                                       ; preds = %for.body10.preheader, %dot.exit
  %indvars.iv4 = phi i64 [ %indvars.iv.next5, %dot.exit ], [ 0, %for.body10.preheader ]
  br label %polly.loop_preheader2.i

polly.loop_preheader2.i:                          ; preds = %vector.body, %for.body10
  %sum.03.phiops.0.i = phi i32 [ 0, %for.body10 ], [ %97, %vector.body ]
  %polly.indvar.i = phi i64 [ 0, %for.body10 ], [ %polly.indvar_next.i, %vector.body ]
  %1 = shl i64 %polly.indvar.i, 6
  %scevgep.i = getelementptr [1024 x [1024 x i32]], [1024 x [1024 x i32]]* @X, i64 0, i64 %indvars.iv4, i64 %1
  %scevgep8.i = getelementptr [1024 x i32], [1024 x i32]* %y_t, i64 0, i64 %1
  br label %vector.body

vector.body:                                      ; preds = %polly.loop_preheader2.i
  %2 = insertelement <4 x i32> <i32 undef, i32 0, i32 0, i32 0>, i32 %sum.03.phiops.0.i, i32 0
  %3 = bitcast i32* %scevgep.i to <4 x i32>*
  %wide.load = load <4 x i32>, <4 x i32>* %3, align 16, !alias.scope !34, !noalias !39
  %4 = bitcast i32* %scevgep8.i to <4 x i32>*
  %wide.load3 = load <4 x i32>, <4 x i32>* %4, align 16, !alias.scope !45, !noalias !46
  %5 = mul nsw <4 x i32> %wide.load3, %wide.load
  %6 = add nsw <4 x i32> %5, %2
  %7 = getelementptr i32, i32* %scevgep.i, i64 4
  %8 = bitcast i32* %7 to <4 x i32>*
  %wide.load.1 = load <4 x i32>, <4 x i32>* %8, align 16, !alias.scope !34, !noalias !39
  %9 = getelementptr i32, i32* %scevgep8.i, i64 4
  %10 = bitcast i32* %9 to <4 x i32>*
  %wide.load3.1 = load <4 x i32>, <4 x i32>* %10, align 16, !alias.scope !45, !noalias !46
  %11 = mul nsw <4 x i32> %wide.load3.1, %wide.load.1
  %12 = add nsw <4 x i32> %11, %6
  %13 = getelementptr i32, i32* %scevgep.i, i64 8
  %14 = bitcast i32* %13 to <4 x i32>*
  %wide.load.2 = load <4 x i32>, <4 x i32>* %14, align 16, !alias.scope !34, !noalias !39
  %15 = getelementptr i32, i32* %scevgep8.i, i64 8
  %16 = bitcast i32* %15 to <4 x i32>*
  %wide.load3.2 = load <4 x i32>, <4 x i32>* %16, align 16, !alias.scope !45, !noalias !46
  %17 = mul nsw <4 x i32> %wide.load3.2, %wide.load.2
  %18 = add nsw <4 x i32> %17, %12
  %19 = getelementptr i32, i32* %scevgep.i, i64 12
  %20 = bitcast i32* %19 to <4 x i32>*
  %wide.load.3 = load <4 x i32>, <4 x i32>* %20, align 16, !alias.scope !34, !noalias !39
  %21 = getelementptr i32, i32* %scevgep8.i, i64 12
  %22 = bitcast i32* %21 to <4 x i32>*
  %wide.load3.3 = load <4 x i32>, <4 x i32>* %22, align 16, !alias.scope !45, !noalias !46
  %23 = mul nsw <4 x i32> %wide.load3.3, %wide.load.3
  %24 = add nsw <4 x i32> %23, %18
  %25 = getelementptr i32, i32* %scevgep.i, i64 16
  %26 = bitcast i32* %25 to <4 x i32>*
  %wide.load.4 = load <4 x i32>, <4 x i32>* %26, align 16, !alias.scope !34, !noalias !39
  %27 = getelementptr i32, i32* %scevgep8.i, i64 16
  %28 = bitcast i32* %27 to <4 x i32>*
  %wide.load3.4 = load <4 x i32>, <4 x i32>* %28, align 16, !alias.scope !45, !noalias !46
  %29 = mul nsw <4 x i32> %wide.load3.4, %wide.load.4
  %30 = add nsw <4 x i32> %29, %24
  %31 = getelementptr i32, i32* %scevgep.i, i64 20
  %32 = bitcast i32* %31 to <4 x i32>*
  %wide.load.5 = load <4 x i32>, <4 x i32>* %32, align 16, !alias.scope !34, !noalias !39
  %33 = getelementptr i32, i32* %scevgep8.i, i64 20
  %34 = bitcast i32* %33 to <4 x i32>*
  %wide.load3.5 = load <4 x i32>, <4 x i32>* %34, align 16, !alias.scope !45, !noalias !46
  %35 = mul nsw <4 x i32> %wide.load3.5, %wide.load.5
  %36 = add nsw <4 x i32> %35, %30
  %37 = getelementptr i32, i32* %scevgep.i, i64 24
  %38 = bitcast i32* %37 to <4 x i32>*
  %wide.load.6 = load <4 x i32>, <4 x i32>* %38, align 16, !alias.scope !34, !noalias !39
  %39 = getelementptr i32, i32* %scevgep8.i, i64 24
  %40 = bitcast i32* %39 to <4 x i32>*
  %wide.load3.6 = load <4 x i32>, <4 x i32>* %40, align 16, !alias.scope !45, !noalias !46
  %41 = mul nsw <4 x i32> %wide.load3.6, %wide.load.6
  %42 = add nsw <4 x i32> %41, %36
  %43 = getelementptr i32, i32* %scevgep.i, i64 28
  %44 = bitcast i32* %43 to <4 x i32>*
  %wide.load.7 = load <4 x i32>, <4 x i32>* %44, align 16, !alias.scope !34, !noalias !39
  %45 = getelementptr i32, i32* %scevgep8.i, i64 28
  %46 = bitcast i32* %45 to <4 x i32>*
  %wide.load3.7 = load <4 x i32>, <4 x i32>* %46, align 16, !alias.scope !45, !noalias !46
  %47 = mul nsw <4 x i32> %wide.load3.7, %wide.load.7
  %48 = add nsw <4 x i32> %47, %42
  %49 = getelementptr i32, i32* %scevgep.i, i64 32
  %50 = bitcast i32* %49 to <4 x i32>*
  %wide.load.8 = load <4 x i32>, <4 x i32>* %50, align 16, !alias.scope !34, !noalias !39
  %51 = getelementptr i32, i32* %scevgep8.i, i64 32
  %52 = bitcast i32* %51 to <4 x i32>*
  %wide.load3.8 = load <4 x i32>, <4 x i32>* %52, align 16, !alias.scope !45, !noalias !46
  %53 = mul nsw <4 x i32> %wide.load3.8, %wide.load.8
  %54 = add nsw <4 x i32> %53, %48
  %55 = getelementptr i32, i32* %scevgep.i, i64 36
  %56 = bitcast i32* %55 to <4 x i32>*
  %wide.load.9 = load <4 x i32>, <4 x i32>* %56, align 16, !alias.scope !34, !noalias !39
  %57 = getelementptr i32, i32* %scevgep8.i, i64 36
  %58 = bitcast i32* %57 to <4 x i32>*
  %wide.load3.9 = load <4 x i32>, <4 x i32>* %58, align 16, !alias.scope !45, !noalias !46
  %59 = mul nsw <4 x i32> %wide.load3.9, %wide.load.9
  %60 = add nsw <4 x i32> %59, %54
  %61 = getelementptr i32, i32* %scevgep.i, i64 40
  %62 = bitcast i32* %61 to <4 x i32>*
  %wide.load.10 = load <4 x i32>, <4 x i32>* %62, align 16, !alias.scope !34, !noalias !39
  %63 = getelementptr i32, i32* %scevgep8.i, i64 40
  %64 = bitcast i32* %63 to <4 x i32>*
  %wide.load3.10 = load <4 x i32>, <4 x i32>* %64, align 16, !alias.scope !45, !noalias !46
  %65 = mul nsw <4 x i32> %wide.load3.10, %wide.load.10
  %66 = add nsw <4 x i32> %65, %60
  %67 = getelementptr i32, i32* %scevgep.i, i64 44
  %68 = bitcast i32* %67 to <4 x i32>*
  %wide.load.11 = load <4 x i32>, <4 x i32>* %68, align 16, !alias.scope !34, !noalias !39
  %69 = getelementptr i32, i32* %scevgep8.i, i64 44
  %70 = bitcast i32* %69 to <4 x i32>*
  %wide.load3.11 = load <4 x i32>, <4 x i32>* %70, align 16, !alias.scope !45, !noalias !46
  %71 = mul nsw <4 x i32> %wide.load3.11, %wide.load.11
  %72 = add nsw <4 x i32> %71, %66
  %73 = getelementptr i32, i32* %scevgep.i, i64 48
  %74 = bitcast i32* %73 to <4 x i32>*
  %wide.load.12 = load <4 x i32>, <4 x i32>* %74, align 16, !alias.scope !34, !noalias !39
  %75 = getelementptr i32, i32* %scevgep8.i, i64 48
  %76 = bitcast i32* %75 to <4 x i32>*
  %wide.load3.12 = load <4 x i32>, <4 x i32>* %76, align 16, !alias.scope !45, !noalias !46
  %77 = mul nsw <4 x i32> %wide.load3.12, %wide.load.12
  %78 = add nsw <4 x i32> %77, %72
  %79 = getelementptr i32, i32* %scevgep.i, i64 52
  %80 = bitcast i32* %79 to <4 x i32>*
  %wide.load.13 = load <4 x i32>, <4 x i32>* %80, align 16, !alias.scope !34, !noalias !39
  %81 = getelementptr i32, i32* %scevgep8.i, i64 52
  %82 = bitcast i32* %81 to <4 x i32>*
  %wide.load3.13 = load <4 x i32>, <4 x i32>* %82, align 16, !alias.scope !45, !noalias !46
  %83 = mul nsw <4 x i32> %wide.load3.13, %wide.load.13
  %84 = add nsw <4 x i32> %83, %78
  %85 = getelementptr i32, i32* %scevgep.i, i64 56
  %86 = bitcast i32* %85 to <4 x i32>*
  %wide.load.14 = load <4 x i32>, <4 x i32>* %86, align 16, !alias.scope !34, !noalias !39
  %87 = getelementptr i32, i32* %scevgep8.i, i64 56
  %88 = bitcast i32* %87 to <4 x i32>*
  %wide.load3.14 = load <4 x i32>, <4 x i32>* %88, align 16, !alias.scope !45, !noalias !46
  %89 = mul nsw <4 x i32> %wide.load3.14, %wide.load.14
  %90 = add nsw <4 x i32> %89, %84
  %91 = getelementptr i32, i32* %scevgep.i, i64 60
  %92 = bitcast i32* %91 to <4 x i32>*
  %wide.load.15 = load <4 x i32>, <4 x i32>* %92, align 16, !alias.scope !34, !noalias !39
  %93 = getelementptr i32, i32* %scevgep8.i, i64 60
  %94 = bitcast i32* %93 to <4 x i32>*
  %wide.load3.15 = load <4 x i32>, <4 x i32>* %94, align 16, !alias.scope !45, !noalias !46
  %95 = mul nsw <4 x i32> %wide.load3.15, %wide.load.15
  %96 = add nsw <4 x i32> %95, %90
  %rdx.shuf = shufflevector <4 x i32> %96, <4 x i32> undef, <4 x i32> <i32 2, i32 3, i32 undef, i32 undef>
  %bin.rdx = add <4 x i32> %96, %rdx.shuf
  %rdx.shuf4 = shufflevector <4 x i32> %bin.rdx, <4 x i32> undef, <4 x i32> <i32 1, i32 undef, i32 undef, i32 undef>
  %bin.rdx5 = add <4 x i32> %bin.rdx, %rdx.shuf4
  %97 = extractelement <4 x i32> %bin.rdx5, i32 0
  %polly.indvar_next.i = add nuw nsw i64 %polly.indvar.i, 1
  %exitcond11.i = icmp eq i64 %polly.indvar_next.i, 16
  br i1 %exitcond11.i, label %dot.exit, label %polly.loop_preheader2.i

dot.exit:                                         ; preds = %vector.body
  %.lcssa = phi i32 [ %97, %vector.body ]
  %arrayidx18 = getelementptr inbounds [1024 x [1024 x i32]], [1024 x [1024 x i32]]* @Z, i64 0, i64 %indvars.iv4, i64 %indvars.iv7
  store i32 %.lcssa, i32* %arrayidx18, align 4
  %indvars.iv.next5 = add nuw nsw i64 %indvars.iv4, 1
  %exitcond6 = icmp eq i64 %indvars.iv.next5, 1024
  br i1 %exitcond6, label %for.inc22, label %for.body10

for.inc22:                                        ; preds = %dot.exit
  %indvars.iv.next8 = add nuw nsw i64 %indvars.iv7, 1
  %exitcond9 = icmp eq i64 %indvars.iv.next8, 1024
  br i1 %exitcond9, label %for.end24, label %polly.loop_preheader

for.end24:                                        ; preds = %for.inc22
  %98 = load i32, i32* getelementptr inbounds ([1024 x [1024 x i32]], [1024 x [1024 x i32]]* @Z, i64 0, i64 1023, i64 1023), align 4
  %call25 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([46 x i8], [46 x i8]* @.str.2, i64 0, i64 0), i32 1024, i32 1024, i32 1023, i32 1023, i32 %98) #4
  ret i32 0

polly.stmt.for.body3:                             ; preds = %polly.stmt.for.body3, %polly.loop_preheader
  %polly.indvar = phi i64 [ 0, %polly.loop_preheader ], [ %polly.indvar_next.3, %polly.stmt.for.body3 ]
  %99 = shl i64 %polly.indvar, 10
  %scevgep1 = getelementptr i32, i32* %scevgep, i64 %99
  %_p_scalar_ = load i32, i32* %scevgep1, align 4, !alias.scope !47, !noalias !49, !llvm.mem.parallel_loop_access !51
  %scevgep2 = getelementptr [1024 x i32], [1024 x i32]* %y_t, i64 0, i64 %polly.indvar
  store i32 %_p_scalar_, i32* %scevgep2, align 16, !alias.scope !50, !noalias !52, !llvm.mem.parallel_loop_access !51
  %polly.indvar_next = or i64 %polly.indvar, 1
  %100 = shl i64 %polly.indvar_next, 10
  %scevgep1.1 = getelementptr i32, i32* %scevgep, i64 %100
  %_p_scalar_.1 = load i32, i32* %scevgep1.1, align 4, !alias.scope !47, !noalias !49, !llvm.mem.parallel_loop_access !51
  %scevgep2.1 = getelementptr [1024 x i32], [1024 x i32]* %y_t, i64 0, i64 %polly.indvar_next
  store i32 %_p_scalar_.1, i32* %scevgep2.1, align 4, !alias.scope !50, !noalias !52, !llvm.mem.parallel_loop_access !51
  %polly.indvar_next.1 = or i64 %polly.indvar, 2
  %101 = shl i64 %polly.indvar_next.1, 10
  %scevgep1.2 = getelementptr i32, i32* %scevgep, i64 %101
  %_p_scalar_.2 = load i32, i32* %scevgep1.2, align 4, !alias.scope !47, !noalias !49, !llvm.mem.parallel_loop_access !51
  %scevgep2.2 = getelementptr [1024 x i32], [1024 x i32]* %y_t, i64 0, i64 %polly.indvar_next.1
  store i32 %_p_scalar_.2, i32* %scevgep2.2, align 8, !alias.scope !50, !noalias !52, !llvm.mem.parallel_loop_access !51
  %polly.indvar_next.2 = or i64 %polly.indvar, 3
  %102 = shl i64 %polly.indvar_next.2, 10
  %scevgep1.3 = getelementptr i32, i32* %scevgep, i64 %102
  %_p_scalar_.3 = load i32, i32* %scevgep1.3, align 4, !alias.scope !47, !noalias !49, !llvm.mem.parallel_loop_access !51
  %scevgep2.3 = getelementptr [1024 x i32], [1024 x i32]* %y_t, i64 0, i64 %polly.indvar_next.2
  store i32 %_p_scalar_.3, i32* %scevgep2.3, align 4, !alias.scope !50, !noalias !52, !llvm.mem.parallel_loop_access !51
  %polly.indvar_next.3 = add nsw i64 %polly.indvar, 4
  %exitcond.3 = icmp eq i64 %polly.indvar_next.3, 1024
  br i1 %exitcond.3, label %for.body10.preheader, label %polly.stmt.for.body3, !llvm.loop !51

for.body10.preheader:                             ; preds = %polly.stmt.for.body3
  br label %for.body10

polly.loop_preheader:                             ; preds = %entry, %for.inc22
  %indvars.iv7 = phi i64 [ 0, %entry ], [ %indvars.iv.next8, %for.inc22 ]
  %scevgep = getelementptr [1024 x [1024 x i32]], [1024 x [1024 x i32]]* @Y, i64 0, i64 0, i64 %indvars.iv7
  br label %polly.stmt.for.body3
}

; Function Attrs: nounwind
declare i32 @printf(i8* nocapture readonly, ...) #1

; Function Attrs: nounwind
declare i32 @fputc(i32, %struct._IO_FILE* nocapture) #4

; Function Attrs: argmemonly nounwind
declare void @llvm.lifetime.start(i64, i8* nocapture) #5

define internal void @init_polly_subfn(i8* nocapture readnone %polly.par.userContext) #6 {
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

polly.loop_exit4:                                 ; preds = %polly.loop_exit10
  %polly.indvar_next = add nsw i64 %polly.indvar, 1
  %polly.loop_cond = icmp sgt i64 %polly.indvar, %polly.adjust_ub
  br i1 %polly.loop_cond, label %polly.par.checkNext.loopexit, label %polly.loop_preheader3

polly.loop_exit10:                                ; preds = %vector.body
  %polly.indvar_next6 = add nuw nsw i64 %polly.indvar5, 1
  %exitcond22 = icmp eq i64 %polly.indvar_next6, 32
  br i1 %exitcond22, label %polly.loop_exit4, label %polly.loop_preheader9

polly.loop_preheader3:                            ; preds = %polly.par.loadIVBounds, %polly.loop_exit4
  %polly.indvar = phi i64 [ %polly.par.LB, %polly.par.loadIVBounds ], [ %polly.indvar_next, %polly.loop_exit4 ]
  %4 = shl nsw i64 %polly.indvar, 5
  br label %polly.loop_preheader9

polly.loop_preheader9:                            ; preds = %polly.loop_exit10, %polly.loop_preheader3
  %polly.indvar5 = phi i64 [ 0, %polly.loop_preheader3 ], [ %polly.indvar_next6, %polly.loop_exit10 ]
  %5 = shl nsw i64 %polly.indvar5, 5
  %6 = or i64 %5, 4
  %7 = or i64 %5, 8
  %8 = or i64 %5, 12
  %9 = or i64 %5, 16
  %10 = or i64 %5, 20
  %11 = or i64 %5, 24
  %12 = or i64 %5, 28
  br label %polly.loop_preheader15

polly.loop_preheader15:                           ; preds = %vector.body, %polly.loop_preheader9
  %polly.indvar11 = phi i64 [ 0, %polly.loop_preheader9 ], [ %polly.indvar_next12, %vector.body ]
  %13 = add nsw i64 %polly.indvar11, %4
  br label %vector.body

vector.body:                                      ; preds = %polly.loop_preheader15
  %14 = getelementptr [1024 x [1024 x i32]], [1024 x [1024 x i32]]* @X, i64 0, i64 %13, i64 %5
  %15 = bitcast i32* %14 to <4 x i32>*
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* %15, align 16, !alias.scope !53, !noalias !55
  %16 = getelementptr [1024 x [1024 x i32]], [1024 x [1024 x i32]]* @Y, i64 0, i64 %13, i64 %5
  %17 = bitcast i32* %16 to <4 x i32>*
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* %17, align 16, !alias.scope !56, !noalias !57
  %18 = getelementptr [1024 x [1024 x i32]], [1024 x [1024 x i32]]* @X, i64 0, i64 %13, i64 %6
  %19 = bitcast i32* %18 to <4 x i32>*
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* %19, align 16, !alias.scope !53, !noalias !55
  %20 = getelementptr [1024 x [1024 x i32]], [1024 x [1024 x i32]]* @Y, i64 0, i64 %13, i64 %6
  %21 = bitcast i32* %20 to <4 x i32>*
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* %21, align 16, !alias.scope !56, !noalias !57
  %22 = getelementptr [1024 x [1024 x i32]], [1024 x [1024 x i32]]* @X, i64 0, i64 %13, i64 %7
  %23 = bitcast i32* %22 to <4 x i32>*
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* %23, align 16, !alias.scope !53, !noalias !55
  %24 = getelementptr [1024 x [1024 x i32]], [1024 x [1024 x i32]]* @Y, i64 0, i64 %13, i64 %7
  %25 = bitcast i32* %24 to <4 x i32>*
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* %25, align 16, !alias.scope !56, !noalias !57
  %26 = getelementptr [1024 x [1024 x i32]], [1024 x [1024 x i32]]* @X, i64 0, i64 %13, i64 %8
  %27 = bitcast i32* %26 to <4 x i32>*
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* %27, align 16, !alias.scope !53, !noalias !55
  %28 = getelementptr [1024 x [1024 x i32]], [1024 x [1024 x i32]]* @Y, i64 0, i64 %13, i64 %8
  %29 = bitcast i32* %28 to <4 x i32>*
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* %29, align 16, !alias.scope !56, !noalias !57
  %30 = getelementptr [1024 x [1024 x i32]], [1024 x [1024 x i32]]* @X, i64 0, i64 %13, i64 %9
  %31 = bitcast i32* %30 to <4 x i32>*
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* %31, align 16, !alias.scope !53, !noalias !55
  %32 = getelementptr [1024 x [1024 x i32]], [1024 x [1024 x i32]]* @Y, i64 0, i64 %13, i64 %9
  %33 = bitcast i32* %32 to <4 x i32>*
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* %33, align 16, !alias.scope !56, !noalias !57
  %34 = getelementptr [1024 x [1024 x i32]], [1024 x [1024 x i32]]* @X, i64 0, i64 %13, i64 %10
  %35 = bitcast i32* %34 to <4 x i32>*
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* %35, align 16, !alias.scope !53, !noalias !55
  %36 = getelementptr [1024 x [1024 x i32]], [1024 x [1024 x i32]]* @Y, i64 0, i64 %13, i64 %10
  %37 = bitcast i32* %36 to <4 x i32>*
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* %37, align 16, !alias.scope !56, !noalias !57
  %38 = getelementptr [1024 x [1024 x i32]], [1024 x [1024 x i32]]* @X, i64 0, i64 %13, i64 %11
  %39 = bitcast i32* %38 to <4 x i32>*
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* %39, align 16, !alias.scope !53, !noalias !55
  %40 = getelementptr [1024 x [1024 x i32]], [1024 x [1024 x i32]]* @Y, i64 0, i64 %13, i64 %11
  %41 = bitcast i32* %40 to <4 x i32>*
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* %41, align 16, !alias.scope !56, !noalias !57
  %42 = getelementptr [1024 x [1024 x i32]], [1024 x [1024 x i32]]* @X, i64 0, i64 %13, i64 %12
  %43 = bitcast i32* %42 to <4 x i32>*
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* %43, align 16, !alias.scope !53, !noalias !55
  %44 = getelementptr [1024 x [1024 x i32]], [1024 x [1024 x i32]]* @Y, i64 0, i64 %13, i64 %12
  %45 = bitcast i32* %44 to <4 x i32>*
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* %45, align 16, !alias.scope !56, !noalias !57
  %polly.indvar_next12 = add nuw nsw i64 %polly.indvar11, 1
  %exitcond21 = icmp eq i64 %polly.indvar_next12, 32
  br i1 %exitcond21, label %polly.loop_exit10, label %polly.loop_preheader15
}

declare i8 @GOMP_loop_runtime_next(i64*, i64*)

declare void @GOMP_loop_end_nowait()

declare void @GOMP_parallel_loop_runtime_start(void (i8*)*, i8*, i32, i64, i64, i64)

declare void @GOMP_parallel_end()

; Function Attrs: argmemonly nounwind
declare void @llvm.lifetime.end(i64, i8* nocapture) #5

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "polly-optimized" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { norecurse nounwind readonly uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "polly-optimized" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }
attributes #5 = { argmemonly nounwind }
attributes #6 = { "polly.skip.fn" }

!llvm.ident = !{!0}

!0 = !{!"clang version 3.9.0 (http://llvm.org/git/clang.git e177b4a63ca92c5fec010986944530688e104074) (http://llvm.org/git/llvm.git fcd97ccb03712372fe95f1732638de5ed3fcabe8)"}
!1 = distinct !{!1, !2, !"polly.alias.scope.Y"}
!2 = distinct !{!2, !"polly.alias.scope.domain"}
!3 = !{!4}
!4 = distinct !{!4, !2, !"polly.alias.scope.call"}
!5 = distinct !{!5}
!6 = !{!1}
!7 = distinct !{!7, !8, !"polly.alias.scope.Y"}
!8 = distinct !{!8, !"polly.alias.scope.domain"}
!9 = !{!10}
!10 = distinct !{!10, !8, !"polly.alias.scope.call"}
!11 = distinct !{!11}
!12 = !{!7}
!13 = distinct !{!13, !14, !"polly.alias.scope.Y"}
!14 = distinct !{!14, !"polly.alias.scope.domain"}
!15 = !{!16}
!16 = distinct !{!16, !14, !"polly.alias.scope.call"}
!17 = distinct !{!17}
!18 = !{!13}
!19 = distinct !{!19, !20, !"polly.alias.scope.a"}
!20 = distinct !{!20, !"polly.alias.scope.domain"}
!21 = !{!22, !23, !24, !25}
!22 = distinct !{!22, !20, !"polly.alias.scope.sum.12"}
!23 = distinct !{!23, !20, !"polly.alias.scope.sum.03"}
!24 = distinct !{!24, !20, !"polly.alias.scope.b"}
!25 = distinct !{!25, !20, !"polly.alias.scope.add9.lcssa"}
!26 = !{!22, !23, !25, !19}
!27 = distinct !{!27, !28, !"polly.alias.scope.a"}
!28 = distinct !{!28, !"polly.alias.scope.domain"}
!29 = !{!30, !31, !32}
!30 = distinct !{!30, !28, !"polly.alias.scope.b"}
!31 = distinct !{!31, !28, !"polly.alias.scope.sum.03.phiops.0"}
!32 = distinct !{!32, !28, !"polly.alias.scope."}
!33 = !{!31, !27, !32}
!34 = !{!35, !36, !"polly.alias.scope.a", !37}
!35 = distinct !{!35, !36, !"polly.alias.scope.a"}
!36 = distinct !{!36, !"polly.alias.scope.domain"}
!37 = distinct !{!37, !38, !"dot: %a"}
!38 = distinct !{!38, !"dot"}
!39 = !{!40, !41, !42, !43, !44}
!40 = distinct !{!40, !36, !"polly.alias.scope.sum.12"}
!41 = distinct !{!41, !36, !"polly.alias.scope.sum.03"}
!42 = distinct !{!42, !36, !"polly.alias.scope.b"}
!43 = distinct !{!43, !36, !"polly.alias.scope.add9.lcssa"}
!44 = distinct !{!44, !38, !"dot: %b"}
!45 = !{!42, !36, !"polly.alias.scope.b", !44}
!46 = !{!40, !41, !43, !35, !37}
!47 = distinct !{!47, !48, !"polly.alias.scope.Y"}
!48 = distinct !{!48, !"polly.alias.scope.domain"}
!49 = !{!50}
!50 = distinct !{!50, !48, !"polly.alias.scope.y_t"}
!51 = distinct !{!51}
!52 = !{!47}
!53 = distinct !{!53, !54, !"polly.alias.scope.X"}
!54 = distinct !{!54, !"polly.alias.scope.domain"}
!55 = !{!56}
!56 = distinct !{!56, !54, !"polly.alias.scope.Y"}
!57 = !{!53}
