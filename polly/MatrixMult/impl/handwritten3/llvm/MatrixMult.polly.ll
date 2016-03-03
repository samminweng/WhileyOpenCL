; ModuleID = 'MatrixMult.preopt.ll'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@X = common global [2048 x [2048 x i32]] zeroinitializer, align 16
@Y = common global [2048 x [2048 x i32]] zeroinitializer, align 16
@stdout = external global %struct._IO_FILE*, align 8
@.str = private unnamed_addr constant [4 x i8] c"%d \00", align 1
@Z = common global [2048 x [2048 x i32]] zeroinitializer, align 16
@.str.2 = private unnamed_addr constant [46 x i8] c"Pass %d X %d matrix test case (C[%d][%d]=%d)\0A\00", align 1

; Function Attrs: norecurse nounwind uwtable
define void @init() #0 {
entry:
  br label %polly.loop_preheader2

polly.exiting:                                    ; preds = %polly.loop_exit3
  ret void

polly.loop_exit3:                                 ; preds = %polly.loop_exit9
  %polly.indvar_next = add nuw nsw i64 %polly.indvar, 1
  %exitcond22 = icmp eq i64 %polly.indvar_next, 64
  br i1 %exitcond22, label %polly.exiting, label %polly.loop_preheader2

polly.loop_exit9:                                 ; preds = %vector.body
  %polly.indvar_next5 = add nuw nsw i64 %polly.indvar4, 1
  %exitcond21 = icmp eq i64 %polly.indvar_next5, 64
  br i1 %exitcond21, label %polly.loop_exit3, label %polly.loop_preheader8

polly.loop_preheader2:                            ; preds = %polly.loop_exit3, %entry
  %polly.indvar = phi i64 [ 0, %entry ], [ %polly.indvar_next, %polly.loop_exit3 ]
  %0 = shl nsw i64 %polly.indvar, 5
  br label %polly.loop_preheader8

polly.loop_preheader8:                            ; preds = %polly.loop_exit9, %polly.loop_preheader2
  %polly.indvar4 = phi i64 [ 0, %polly.loop_preheader2 ], [ %polly.indvar_next5, %polly.loop_exit9 ]
  %1 = shl nsw i64 %polly.indvar4, 5
  %2 = or i64 %1, 4
  %3 = or i64 %1, 8
  %4 = or i64 %1, 12
  %5 = or i64 %1, 16
  %6 = or i64 %1, 20
  %7 = or i64 %1, 24
  %8 = or i64 %1, 28
  br label %polly.loop_preheader14

polly.loop_preheader14:                           ; preds = %vector.body, %polly.loop_preheader8
  %polly.indvar10 = phi i64 [ 0, %polly.loop_preheader8 ], [ %polly.indvar_next11, %vector.body ]
  %9 = add nuw nsw i64 %polly.indvar10, %0
  br label %vector.body

vector.body:                                      ; preds = %polly.loop_preheader14
  %10 = getelementptr [2048 x [2048 x i32]], [2048 x [2048 x i32]]* @X, i64 0, i64 %9, i64 %1
  %11 = bitcast i32* %10 to <4 x i32>*
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* %11, align 16, !alias.scope !1, !noalias !3
  %12 = getelementptr [2048 x [2048 x i32]], [2048 x [2048 x i32]]* @Y, i64 0, i64 %9, i64 %1
  %13 = bitcast i32* %12 to <4 x i32>*
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* %13, align 16, !alias.scope !4, !noalias !5
  %14 = getelementptr [2048 x [2048 x i32]], [2048 x [2048 x i32]]* @X, i64 0, i64 %9, i64 %2
  %15 = bitcast i32* %14 to <4 x i32>*
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* %15, align 16, !alias.scope !1, !noalias !3
  %16 = getelementptr [2048 x [2048 x i32]], [2048 x [2048 x i32]]* @Y, i64 0, i64 %9, i64 %2
  %17 = bitcast i32* %16 to <4 x i32>*
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* %17, align 16, !alias.scope !4, !noalias !5
  %18 = getelementptr [2048 x [2048 x i32]], [2048 x [2048 x i32]]* @X, i64 0, i64 %9, i64 %3
  %19 = bitcast i32* %18 to <4 x i32>*
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* %19, align 16, !alias.scope !1, !noalias !3
  %20 = getelementptr [2048 x [2048 x i32]], [2048 x [2048 x i32]]* @Y, i64 0, i64 %9, i64 %3
  %21 = bitcast i32* %20 to <4 x i32>*
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* %21, align 16, !alias.scope !4, !noalias !5
  %22 = getelementptr [2048 x [2048 x i32]], [2048 x [2048 x i32]]* @X, i64 0, i64 %9, i64 %4
  %23 = bitcast i32* %22 to <4 x i32>*
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* %23, align 16, !alias.scope !1, !noalias !3
  %24 = getelementptr [2048 x [2048 x i32]], [2048 x [2048 x i32]]* @Y, i64 0, i64 %9, i64 %4
  %25 = bitcast i32* %24 to <4 x i32>*
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* %25, align 16, !alias.scope !4, !noalias !5
  %26 = getelementptr [2048 x [2048 x i32]], [2048 x [2048 x i32]]* @X, i64 0, i64 %9, i64 %5
  %27 = bitcast i32* %26 to <4 x i32>*
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* %27, align 16, !alias.scope !1, !noalias !3
  %28 = getelementptr [2048 x [2048 x i32]], [2048 x [2048 x i32]]* @Y, i64 0, i64 %9, i64 %5
  %29 = bitcast i32* %28 to <4 x i32>*
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* %29, align 16, !alias.scope !4, !noalias !5
  %30 = getelementptr [2048 x [2048 x i32]], [2048 x [2048 x i32]]* @X, i64 0, i64 %9, i64 %6
  %31 = bitcast i32* %30 to <4 x i32>*
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* %31, align 16, !alias.scope !1, !noalias !3
  %32 = getelementptr [2048 x [2048 x i32]], [2048 x [2048 x i32]]* @Y, i64 0, i64 %9, i64 %6
  %33 = bitcast i32* %32 to <4 x i32>*
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* %33, align 16, !alias.scope !4, !noalias !5
  %34 = getelementptr [2048 x [2048 x i32]], [2048 x [2048 x i32]]* @X, i64 0, i64 %9, i64 %7
  %35 = bitcast i32* %34 to <4 x i32>*
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* %35, align 16, !alias.scope !1, !noalias !3
  %36 = getelementptr [2048 x [2048 x i32]], [2048 x [2048 x i32]]* @Y, i64 0, i64 %9, i64 %7
  %37 = bitcast i32* %36 to <4 x i32>*
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* %37, align 16, !alias.scope !4, !noalias !5
  %38 = getelementptr [2048 x [2048 x i32]], [2048 x [2048 x i32]]* @X, i64 0, i64 %9, i64 %8
  %39 = bitcast i32* %38 to <4 x i32>*
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* %39, align 16, !alias.scope !1, !noalias !3
  %40 = getelementptr [2048 x [2048 x i32]], [2048 x [2048 x i32]]* @Y, i64 0, i64 %9, i64 %8
  %41 = bitcast i32* %40 to <4 x i32>*
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* %41, align 16, !alias.scope !4, !noalias !5
  %polly.indvar_next11 = add nuw nsw i64 %polly.indvar10, 1
  %exitcond20 = icmp eq i64 %polly.indvar_next11, 32
  br i1 %exitcond20, label %polly.loop_exit9, label %polly.loop_preheader14
}

; Function Attrs: nounwind uwtable
define noalias i32* @transpose(i32** noalias nocapture readnone %y, i32 %index) #1 {
entry:
  %call = tail call noalias i8* @malloc(i64 8192) #5
  %0 = bitcast i8* %call to i32*
  %1 = icmp ult i32 %index, 2048
  %2 = sext i32 %index to i64
  br i1 %1, label %polly.loop_preheader, label %for.cond1.preheader.preheader

for.cond1.preheader.preheader:                    ; preds = %entry
  br label %for.cond1.preheader

for.cond1.preheader:                              ; preds = %for.cond1.preheader.preheader, %for.inc10
  %indvars.iv5 = phi i64 [ %indvars.iv.next6, %for.inc10 ], [ 0, %for.cond1.preheader.preheader ]
  %3 = shl i64 %indvars.iv5, 6
  br label %for.body3

for.body3:                                        ; preds = %for.body3, %for.cond1.preheader
  %indvars.iv = phi i64 [ 0, %for.cond1.preheader ], [ %indvars.iv.next.3, %for.body3 ]
  %4 = add nuw nsw i64 %indvars.iv, %3
  %arrayidx5 = getelementptr inbounds [2048 x [2048 x i32]], [2048 x [2048 x i32]]* @Y, i64 0, i64 %4, i64 %2
  %5 = load i32, i32* %arrayidx5, align 4
  %arrayidx9 = getelementptr inbounds i32, i32* %0, i64 %4
  store i32 %5, i32* %arrayidx9, align 4
  %indvars.iv.next = or i64 %indvars.iv, 1
  %6 = add nuw nsw i64 %indvars.iv.next, %3
  %arrayidx5.1 = getelementptr inbounds [2048 x [2048 x i32]], [2048 x [2048 x i32]]* @Y, i64 0, i64 %6, i64 %2
  %7 = load i32, i32* %arrayidx5.1, align 4
  %arrayidx9.1 = getelementptr inbounds i32, i32* %0, i64 %6
  store i32 %7, i32* %arrayidx9.1, align 4
  %indvars.iv.next.1 = or i64 %indvars.iv, 2
  %8 = add nuw nsw i64 %indvars.iv.next.1, %3
  %arrayidx5.2 = getelementptr inbounds [2048 x [2048 x i32]], [2048 x [2048 x i32]]* @Y, i64 0, i64 %8, i64 %2
  %9 = load i32, i32* %arrayidx5.2, align 4
  %arrayidx9.2 = getelementptr inbounds i32, i32* %0, i64 %8
  store i32 %9, i32* %arrayidx9.2, align 4
  %indvars.iv.next.2 = or i64 %indvars.iv, 3
  %10 = add nuw nsw i64 %indvars.iv.next.2, %3
  %arrayidx5.3 = getelementptr inbounds [2048 x [2048 x i32]], [2048 x [2048 x i32]]* @Y, i64 0, i64 %10, i64 %2
  %11 = load i32, i32* %arrayidx5.3, align 4
  %arrayidx9.3 = getelementptr inbounds i32, i32* %0, i64 %10
  store i32 %11, i32* %arrayidx9.3, align 4
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  %exitcond.3 = icmp eq i64 %indvars.iv.next.3, 64
  br i1 %exitcond.3, label %for.inc10, label %for.body3

for.inc10:                                        ; preds = %for.body3
  %indvars.iv.next6 = add nuw nsw i64 %indvars.iv5, 1
  %exitcond9 = icmp eq i64 %indvars.iv.next6, 32
  br i1 %exitcond9, label %for.end12.loopexit25, label %for.cond1.preheader

for.end12.loopexit:                               ; preds = %polly.loop_exit9.1
  br label %for.end12

for.end12.loopexit25:                             ; preds = %for.inc10
  br label %for.end12

for.end12:                                        ; preds = %for.end12.loopexit25, %for.end12.loopexit
  ret i32* %0

polly.loop_preheader:                             ; preds = %entry
  %scevgep = getelementptr [2048 x [2048 x i32]], [2048 x [2048 x i32]]* @Y, i64 0, i64 0, i64 %2
  br label %polly.loop_preheader8

polly.loop_exit9:                                 ; preds = %polly.loop_header7
  %polly.indvar_next5 = add nuw nsw i64 %polly.indvar4, 1
  %exitcond21 = icmp eq i64 %polly.indvar_next5, 32
  br i1 %exitcond21, label %polly.loop_preheader8.1.preheader, label %polly.loop_preheader8

polly.loop_preheader8.1.preheader:                ; preds = %polly.loop_exit9
  br label %polly.loop_preheader8.1

polly.loop_header7:                               ; preds = %polly.loop_header7, %polly.loop_preheader8
  %polly.indvar10 = phi i64 [ 0, %polly.loop_preheader8 ], [ %polly.indvar_next11.3, %polly.loop_header7 ]
  %12 = shl i64 %polly.indvar10, 11
  %scevgep14 = getelementptr i32, i32* %scevgep13, i64 %12
  %_p_scalar_ = load i32, i32* %scevgep14, align 4, !alias.scope !6, !noalias !8
  %13 = shl i64 %polly.indvar10, 2
  %scevgep16 = getelementptr i8, i8* %scevgep15, i64 %13
  %scevgep1617 = bitcast i8* %scevgep16 to i32*
  store i32 %_p_scalar_, i32* %scevgep1617, align 4, !alias.scope !9, !noalias !10
  %polly.indvar_next11 = or i64 %polly.indvar10, 1
  %14 = shl i64 %polly.indvar_next11, 11
  %scevgep14.127 = getelementptr i32, i32* %scevgep13, i64 %14
  %_p_scalar_.128 = load i32, i32* %scevgep14.127, align 4, !alias.scope !6, !noalias !8
  %15 = shl i64 %polly.indvar_next11, 2
  %scevgep16.129 = getelementptr i8, i8* %scevgep15, i64 %15
  %scevgep1617.130 = bitcast i8* %scevgep16.129 to i32*
  store i32 %_p_scalar_.128, i32* %scevgep1617.130, align 4, !alias.scope !9, !noalias !10
  %polly.indvar_next11.131 = or i64 %polly.indvar10, 2
  %16 = shl i64 %polly.indvar_next11.131, 11
  %scevgep14.2 = getelementptr i32, i32* %scevgep13, i64 %16
  %_p_scalar_.2 = load i32, i32* %scevgep14.2, align 4, !alias.scope !6, !noalias !8
  %17 = shl i64 %polly.indvar_next11.131, 2
  %scevgep16.2 = getelementptr i8, i8* %scevgep15, i64 %17
  %scevgep1617.2 = bitcast i8* %scevgep16.2 to i32*
  store i32 %_p_scalar_.2, i32* %scevgep1617.2, align 4, !alias.scope !9, !noalias !10
  %polly.indvar_next11.2 = or i64 %polly.indvar10, 3
  %18 = shl i64 %polly.indvar_next11.2, 11
  %scevgep14.3 = getelementptr i32, i32* %scevgep13, i64 %18
  %_p_scalar_.3 = load i32, i32* %scevgep14.3, align 4, !alias.scope !6, !noalias !8
  %19 = shl i64 %polly.indvar_next11.2, 2
  %scevgep16.3 = getelementptr i8, i8* %scevgep15, i64 %19
  %scevgep1617.3 = bitcast i8* %scevgep16.3 to i32*
  store i32 %_p_scalar_.3, i32* %scevgep1617.3, align 4, !alias.scope !9, !noalias !10
  %polly.indvar_next11.3 = add nsw i64 %polly.indvar10, 4
  %exitcond20.3 = icmp eq i64 %polly.indvar_next11.3, 32
  br i1 %exitcond20.3, label %polly.loop_exit9, label %polly.loop_header7

polly.loop_preheader8:                            ; preds = %polly.loop_exit9, %polly.loop_preheader
  %polly.indvar4 = phi i64 [ 0, %polly.loop_preheader ], [ %polly.indvar_next5, %polly.loop_exit9 ]
  %20 = shl i64 %polly.indvar4, 17
  %scevgep13 = getelementptr i32, i32* %scevgep, i64 %20
  %21 = shl i64 %polly.indvar4, 8
  %scevgep15 = getelementptr i8, i8* %call, i64 %21
  br label %polly.loop_header7

polly.loop_preheader8.1:                          ; preds = %polly.loop_preheader8.1.preheader, %polly.loop_exit9.1
  %polly.indvar4.1 = phi i64 [ %polly.indvar_next5.1, %polly.loop_exit9.1 ], [ 0, %polly.loop_preheader8.1.preheader ]
  %22 = shl i64 %polly.indvar4.1, 17
  %scevgep13.1 = getelementptr i32, i32* %scevgep, i64 %22
  %23 = shl i64 %polly.indvar4.1, 8
  %scevgep15.1 = getelementptr i8, i8* %call, i64 %23
  br label %polly.loop_header7.1

polly.loop_header7.1:                             ; preds = %polly.loop_header7.1, %polly.loop_preheader8.1
  %polly.indvar10.1 = phi i64 [ 0, %polly.loop_preheader8.1 ], [ %polly.indvar_next11.1.3, %polly.loop_header7.1 ]
  %24 = add nuw nsw i64 %polly.indvar10.1, 32
  %25 = shl i64 %24, 11
  %scevgep14.1 = getelementptr i32, i32* %scevgep13.1, i64 %25
  %_p_scalar_.1 = load i32, i32* %scevgep14.1, align 4, !alias.scope !6, !noalias !8
  %26 = shl i64 %24, 2
  %scevgep16.1 = getelementptr i8, i8* %scevgep15.1, i64 %26
  %scevgep1617.1 = bitcast i8* %scevgep16.1 to i32*
  store i32 %_p_scalar_.1, i32* %scevgep1617.1, align 4, !alias.scope !9, !noalias !10
  %27 = add nsw i64 %polly.indvar10.1, 33
  %28 = shl i64 %27, 11
  %scevgep14.1.1 = getelementptr i32, i32* %scevgep13.1, i64 %28
  %_p_scalar_.1.1 = load i32, i32* %scevgep14.1.1, align 4, !alias.scope !6, !noalias !8
  %29 = shl i64 %27, 2
  %scevgep16.1.1 = getelementptr i8, i8* %scevgep15.1, i64 %29
  %scevgep1617.1.1 = bitcast i8* %scevgep16.1.1 to i32*
  store i32 %_p_scalar_.1.1, i32* %scevgep1617.1.1, align 4, !alias.scope !9, !noalias !10
  %30 = add nsw i64 %polly.indvar10.1, 34
  %31 = shl i64 %30, 11
  %scevgep14.1.2 = getelementptr i32, i32* %scevgep13.1, i64 %31
  %_p_scalar_.1.2 = load i32, i32* %scevgep14.1.2, align 4, !alias.scope !6, !noalias !8
  %32 = shl i64 %30, 2
  %scevgep16.1.2 = getelementptr i8, i8* %scevgep15.1, i64 %32
  %scevgep1617.1.2 = bitcast i8* %scevgep16.1.2 to i32*
  store i32 %_p_scalar_.1.2, i32* %scevgep1617.1.2, align 4, !alias.scope !9, !noalias !10
  %33 = add nsw i64 %polly.indvar10.1, 35
  %34 = shl i64 %33, 11
  %scevgep14.1.3 = getelementptr i32, i32* %scevgep13.1, i64 %34
  %_p_scalar_.1.3 = load i32, i32* %scevgep14.1.3, align 4, !alias.scope !6, !noalias !8
  %35 = shl i64 %33, 2
  %scevgep16.1.3 = getelementptr i8, i8* %scevgep15.1, i64 %35
  %scevgep1617.1.3 = bitcast i8* %scevgep16.1.3 to i32*
  store i32 %_p_scalar_.1.3, i32* %scevgep1617.1.3, align 4, !alias.scope !9, !noalias !10
  %polly.indvar_next11.1.3 = add nsw i64 %polly.indvar10.1, 4
  %exitcond20.1.3 = icmp eq i64 %polly.indvar_next11.1.3, 32
  br i1 %exitcond20.1.3, label %polly.loop_exit9.1, label %polly.loop_header7.1

polly.loop_exit9.1:                               ; preds = %polly.loop_header7.1
  %polly.indvar_next5.1 = add nuw nsw i64 %polly.indvar4.1, 1
  %exitcond21.1 = icmp eq i64 %polly.indvar_next5.1, 32
  br i1 %exitcond21.1, label %for.end12.loopexit, label %polly.loop_preheader8.1
}

; Function Attrs: nounwind
declare noalias i8* @malloc(i64) #2

; Function Attrs: norecurse nounwind readonly uwtable
define i32 @dot(i32* noalias nocapture readonly %a, i32* noalias nocapture readonly %b) #3 {
entry:
  %sum = alloca [64 x i32], align 16
  br label %polly.loop_preheader2

polly.stmt.for.inc22.preheader:                   ; preds = %vector.body
  %scevgep18 = getelementptr [64 x i32], [64 x i32]* %sum, i64 0, i64 0
  %_p_scalar_19 = load i32, i32* %scevgep18, align 16, !alias.scope !11, !noalias !13
  %scevgep18.1 = getelementptr [64 x i32], [64 x i32]* %sum, i64 0, i64 1
  %_p_scalar_19.1 = load i32, i32* %scevgep18.1, align 4, !alias.scope !11, !noalias !13
  %p_add21.1 = add nsw i32 %_p_scalar_19.1, %_p_scalar_19
  %scevgep18.2 = getelementptr [64 x i32], [64 x i32]* %sum, i64 0, i64 2
  %_p_scalar_19.2 = load i32, i32* %scevgep18.2, align 8, !alias.scope !11, !noalias !13
  %p_add21.2 = add nsw i32 %_p_scalar_19.2, %p_add21.1
  %scevgep18.3 = getelementptr [64 x i32], [64 x i32]* %sum, i64 0, i64 3
  %_p_scalar_19.3 = load i32, i32* %scevgep18.3, align 4, !alias.scope !11, !noalias !13
  %p_add21.3 = add nsw i32 %_p_scalar_19.3, %p_add21.2
  %scevgep18.4 = getelementptr [64 x i32], [64 x i32]* %sum, i64 0, i64 4
  %_p_scalar_19.4 = load i32, i32* %scevgep18.4, align 16, !alias.scope !11, !noalias !13
  %p_add21.4 = add nsw i32 %_p_scalar_19.4, %p_add21.3
  %scevgep18.5 = getelementptr [64 x i32], [64 x i32]* %sum, i64 0, i64 5
  %_p_scalar_19.5 = load i32, i32* %scevgep18.5, align 4, !alias.scope !11, !noalias !13
  %p_add21.5 = add nsw i32 %_p_scalar_19.5, %p_add21.4
  %scevgep18.6 = getelementptr [64 x i32], [64 x i32]* %sum, i64 0, i64 6
  %_p_scalar_19.6 = load i32, i32* %scevgep18.6, align 8, !alias.scope !11, !noalias !13
  %p_add21.6 = add nsw i32 %_p_scalar_19.6, %p_add21.5
  %scevgep18.7 = getelementptr [64 x i32], [64 x i32]* %sum, i64 0, i64 7
  %_p_scalar_19.7 = load i32, i32* %scevgep18.7, align 4, !alias.scope !11, !noalias !13
  %p_add21.7 = add nsw i32 %_p_scalar_19.7, %p_add21.6
  %scevgep18.8 = getelementptr [64 x i32], [64 x i32]* %sum, i64 0, i64 8
  %_p_scalar_19.8 = load i32, i32* %scevgep18.8, align 16, !alias.scope !11, !noalias !13
  %p_add21.8 = add nsw i32 %_p_scalar_19.8, %p_add21.7
  %scevgep18.9 = getelementptr [64 x i32], [64 x i32]* %sum, i64 0, i64 9
  %_p_scalar_19.9 = load i32, i32* %scevgep18.9, align 4, !alias.scope !11, !noalias !13
  %p_add21.9 = add nsw i32 %_p_scalar_19.9, %p_add21.8
  %scevgep18.10 = getelementptr [64 x i32], [64 x i32]* %sum, i64 0, i64 10
  %_p_scalar_19.10 = load i32, i32* %scevgep18.10, align 8, !alias.scope !11, !noalias !13
  %p_add21.10 = add nsw i32 %_p_scalar_19.10, %p_add21.9
  %scevgep18.11 = getelementptr [64 x i32], [64 x i32]* %sum, i64 0, i64 11
  %_p_scalar_19.11 = load i32, i32* %scevgep18.11, align 4, !alias.scope !11, !noalias !13
  %p_add21.11 = add nsw i32 %_p_scalar_19.11, %p_add21.10
  %scevgep18.12 = getelementptr [64 x i32], [64 x i32]* %sum, i64 0, i64 12
  %_p_scalar_19.12 = load i32, i32* %scevgep18.12, align 16, !alias.scope !11, !noalias !13
  %p_add21.12 = add nsw i32 %_p_scalar_19.12, %p_add21.11
  %scevgep18.13 = getelementptr [64 x i32], [64 x i32]* %sum, i64 0, i64 13
  %_p_scalar_19.13 = load i32, i32* %scevgep18.13, align 4, !alias.scope !11, !noalias !13
  %p_add21.13 = add nsw i32 %_p_scalar_19.13, %p_add21.12
  %scevgep18.14 = getelementptr [64 x i32], [64 x i32]* %sum, i64 0, i64 14
  %_p_scalar_19.14 = load i32, i32* %scevgep18.14, align 8, !alias.scope !11, !noalias !13
  %p_add21.14 = add nsw i32 %_p_scalar_19.14, %p_add21.13
  %scevgep18.15 = getelementptr [64 x i32], [64 x i32]* %sum, i64 0, i64 15
  %_p_scalar_19.15 = load i32, i32* %scevgep18.15, align 4, !alias.scope !11, !noalias !13
  %p_add21.15 = add nsw i32 %_p_scalar_19.15, %p_add21.14
  %scevgep18.16 = getelementptr [64 x i32], [64 x i32]* %sum, i64 0, i64 16
  %_p_scalar_19.16 = load i32, i32* %scevgep18.16, align 16, !alias.scope !11, !noalias !13
  %p_add21.16 = add nsw i32 %_p_scalar_19.16, %p_add21.15
  %scevgep18.17 = getelementptr [64 x i32], [64 x i32]* %sum, i64 0, i64 17
  %_p_scalar_19.17 = load i32, i32* %scevgep18.17, align 4, !alias.scope !11, !noalias !13
  %p_add21.17 = add nsw i32 %_p_scalar_19.17, %p_add21.16
  %scevgep18.18 = getelementptr [64 x i32], [64 x i32]* %sum, i64 0, i64 18
  %_p_scalar_19.18 = load i32, i32* %scevgep18.18, align 8, !alias.scope !11, !noalias !13
  %p_add21.18 = add nsw i32 %_p_scalar_19.18, %p_add21.17
  %scevgep18.19 = getelementptr [64 x i32], [64 x i32]* %sum, i64 0, i64 19
  %_p_scalar_19.19 = load i32, i32* %scevgep18.19, align 4, !alias.scope !11, !noalias !13
  %p_add21.19 = add nsw i32 %_p_scalar_19.19, %p_add21.18
  %scevgep18.20 = getelementptr [64 x i32], [64 x i32]* %sum, i64 0, i64 20
  %_p_scalar_19.20 = load i32, i32* %scevgep18.20, align 16, !alias.scope !11, !noalias !13
  %p_add21.20 = add nsw i32 %_p_scalar_19.20, %p_add21.19
  %scevgep18.21 = getelementptr [64 x i32], [64 x i32]* %sum, i64 0, i64 21
  %_p_scalar_19.21 = load i32, i32* %scevgep18.21, align 4, !alias.scope !11, !noalias !13
  %p_add21.21 = add nsw i32 %_p_scalar_19.21, %p_add21.20
  %scevgep18.22 = getelementptr [64 x i32], [64 x i32]* %sum, i64 0, i64 22
  %_p_scalar_19.22 = load i32, i32* %scevgep18.22, align 8, !alias.scope !11, !noalias !13
  %p_add21.22 = add nsw i32 %_p_scalar_19.22, %p_add21.21
  %scevgep18.23 = getelementptr [64 x i32], [64 x i32]* %sum, i64 0, i64 23
  %_p_scalar_19.23 = load i32, i32* %scevgep18.23, align 4, !alias.scope !11, !noalias !13
  %p_add21.23 = add nsw i32 %_p_scalar_19.23, %p_add21.22
  %scevgep18.24 = getelementptr [64 x i32], [64 x i32]* %sum, i64 0, i64 24
  %_p_scalar_19.24 = load i32, i32* %scevgep18.24, align 16, !alias.scope !11, !noalias !13
  %p_add21.24 = add nsw i32 %_p_scalar_19.24, %p_add21.23
  %scevgep18.25 = getelementptr [64 x i32], [64 x i32]* %sum, i64 0, i64 25
  %_p_scalar_19.25 = load i32, i32* %scevgep18.25, align 4, !alias.scope !11, !noalias !13
  %p_add21.25 = add nsw i32 %_p_scalar_19.25, %p_add21.24
  %scevgep18.26 = getelementptr [64 x i32], [64 x i32]* %sum, i64 0, i64 26
  %_p_scalar_19.26 = load i32, i32* %scevgep18.26, align 8, !alias.scope !11, !noalias !13
  %p_add21.26 = add nsw i32 %_p_scalar_19.26, %p_add21.25
  %scevgep18.27 = getelementptr [64 x i32], [64 x i32]* %sum, i64 0, i64 27
  %_p_scalar_19.27 = load i32, i32* %scevgep18.27, align 4, !alias.scope !11, !noalias !13
  %p_add21.27 = add nsw i32 %_p_scalar_19.27, %p_add21.26
  %scevgep18.28 = getelementptr [64 x i32], [64 x i32]* %sum, i64 0, i64 28
  %_p_scalar_19.28 = load i32, i32* %scevgep18.28, align 16, !alias.scope !11, !noalias !13
  %p_add21.28 = add nsw i32 %_p_scalar_19.28, %p_add21.27
  %scevgep18.29 = getelementptr [64 x i32], [64 x i32]* %sum, i64 0, i64 29
  %_p_scalar_19.29 = load i32, i32* %scevgep18.29, align 4, !alias.scope !11, !noalias !13
  %p_add21.29 = add nsw i32 %_p_scalar_19.29, %p_add21.28
  %scevgep18.30 = getelementptr [64 x i32], [64 x i32]* %sum, i64 0, i64 30
  %_p_scalar_19.30 = load i32, i32* %scevgep18.30, align 8, !alias.scope !11, !noalias !13
  %p_add21.30 = add nsw i32 %_p_scalar_19.30, %p_add21.29
  %scevgep18.31 = getelementptr [64 x i32], [64 x i32]* %sum, i64 0, i64 31
  %_p_scalar_19.31 = load i32, i32* %scevgep18.31, align 4, !alias.scope !11, !noalias !13
  %p_add21.31 = add nsw i32 %_p_scalar_19.31, %p_add21.30
  ret i32 %p_add21.31

polly.loop_preheader2:                            ; preds = %vector.body, %entry
  %polly.indvar = phi i64 [ 0, %entry ], [ %polly.indvar_next, %vector.body ]
  %0 = shl i64 %polly.indvar, 6
  %scevgep = getelementptr i32, i32* %a, i64 %0
  %scevgep8 = getelementptr i32, i32* %b, i64 %0
  br label %vector.body

vector.body:                                      ; preds = %polly.loop_preheader2
  %1 = bitcast i32* %scevgep to <4 x i32>*
  %wide.load = load <4 x i32>, <4 x i32>* %1, align 4, !alias.scope !16, !noalias !20
  %2 = bitcast i32* %scevgep8 to <4 x i32>*
  %wide.load21 = load <4 x i32>, <4 x i32>* %2, align 4, !alias.scope !19, !noalias !21
  %3 = mul nsw <4 x i32> %wide.load21, %wide.load
  %4 = getelementptr i32, i32* %scevgep, i64 4
  %5 = bitcast i32* %4 to <4 x i32>*
  %wide.load.1 = load <4 x i32>, <4 x i32>* %5, align 4, !alias.scope !16, !noalias !20
  %6 = getelementptr i32, i32* %scevgep8, i64 4
  %7 = bitcast i32* %6 to <4 x i32>*
  %wide.load21.1 = load <4 x i32>, <4 x i32>* %7, align 4, !alias.scope !19, !noalias !21
  %8 = mul nsw <4 x i32> %wide.load21.1, %wide.load.1
  %9 = add nsw <4 x i32> %8, %3
  %10 = getelementptr i32, i32* %scevgep, i64 8
  %11 = bitcast i32* %10 to <4 x i32>*
  %wide.load.2 = load <4 x i32>, <4 x i32>* %11, align 4, !alias.scope !16, !noalias !20
  %12 = getelementptr i32, i32* %scevgep8, i64 8
  %13 = bitcast i32* %12 to <4 x i32>*
  %wide.load21.2 = load <4 x i32>, <4 x i32>* %13, align 4, !alias.scope !19, !noalias !21
  %14 = mul nsw <4 x i32> %wide.load21.2, %wide.load.2
  %15 = add nsw <4 x i32> %14, %9
  %16 = getelementptr i32, i32* %scevgep, i64 12
  %17 = bitcast i32* %16 to <4 x i32>*
  %wide.load.3 = load <4 x i32>, <4 x i32>* %17, align 4, !alias.scope !16, !noalias !20
  %18 = getelementptr i32, i32* %scevgep8, i64 12
  %19 = bitcast i32* %18 to <4 x i32>*
  %wide.load21.3 = load <4 x i32>, <4 x i32>* %19, align 4, !alias.scope !19, !noalias !21
  %20 = mul nsw <4 x i32> %wide.load21.3, %wide.load.3
  %21 = add nsw <4 x i32> %20, %15
  %22 = getelementptr i32, i32* %scevgep, i64 16
  %23 = bitcast i32* %22 to <4 x i32>*
  %wide.load.4 = load <4 x i32>, <4 x i32>* %23, align 4, !alias.scope !16, !noalias !20
  %24 = getelementptr i32, i32* %scevgep8, i64 16
  %25 = bitcast i32* %24 to <4 x i32>*
  %wide.load21.4 = load <4 x i32>, <4 x i32>* %25, align 4, !alias.scope !19, !noalias !21
  %26 = mul nsw <4 x i32> %wide.load21.4, %wide.load.4
  %27 = add nsw <4 x i32> %26, %21
  %28 = getelementptr i32, i32* %scevgep, i64 20
  %29 = bitcast i32* %28 to <4 x i32>*
  %wide.load.5 = load <4 x i32>, <4 x i32>* %29, align 4, !alias.scope !16, !noalias !20
  %30 = getelementptr i32, i32* %scevgep8, i64 20
  %31 = bitcast i32* %30 to <4 x i32>*
  %wide.load21.5 = load <4 x i32>, <4 x i32>* %31, align 4, !alias.scope !19, !noalias !21
  %32 = mul nsw <4 x i32> %wide.load21.5, %wide.load.5
  %33 = add nsw <4 x i32> %32, %27
  %34 = getelementptr i32, i32* %scevgep, i64 24
  %35 = bitcast i32* %34 to <4 x i32>*
  %wide.load.6 = load <4 x i32>, <4 x i32>* %35, align 4, !alias.scope !16, !noalias !20
  %36 = getelementptr i32, i32* %scevgep8, i64 24
  %37 = bitcast i32* %36 to <4 x i32>*
  %wide.load21.6 = load <4 x i32>, <4 x i32>* %37, align 4, !alias.scope !19, !noalias !21
  %38 = mul nsw <4 x i32> %wide.load21.6, %wide.load.6
  %39 = add nsw <4 x i32> %38, %33
  %40 = getelementptr i32, i32* %scevgep, i64 28
  %41 = bitcast i32* %40 to <4 x i32>*
  %wide.load.7 = load <4 x i32>, <4 x i32>* %41, align 4, !alias.scope !16, !noalias !20
  %42 = getelementptr i32, i32* %scevgep8, i64 28
  %43 = bitcast i32* %42 to <4 x i32>*
  %wide.load21.7 = load <4 x i32>, <4 x i32>* %43, align 4, !alias.scope !19, !noalias !21
  %44 = mul nsw <4 x i32> %wide.load21.7, %wide.load.7
  %45 = add nsw <4 x i32> %44, %39
  %46 = getelementptr i32, i32* %scevgep, i64 32
  %47 = bitcast i32* %46 to <4 x i32>*
  %wide.load.8 = load <4 x i32>, <4 x i32>* %47, align 4, !alias.scope !16, !noalias !20
  %48 = getelementptr i32, i32* %scevgep8, i64 32
  %49 = bitcast i32* %48 to <4 x i32>*
  %wide.load21.8 = load <4 x i32>, <4 x i32>* %49, align 4, !alias.scope !19, !noalias !21
  %50 = mul nsw <4 x i32> %wide.load21.8, %wide.load.8
  %51 = add nsw <4 x i32> %50, %45
  %52 = getelementptr i32, i32* %scevgep, i64 36
  %53 = bitcast i32* %52 to <4 x i32>*
  %wide.load.9 = load <4 x i32>, <4 x i32>* %53, align 4, !alias.scope !16, !noalias !20
  %54 = getelementptr i32, i32* %scevgep8, i64 36
  %55 = bitcast i32* %54 to <4 x i32>*
  %wide.load21.9 = load <4 x i32>, <4 x i32>* %55, align 4, !alias.scope !19, !noalias !21
  %56 = mul nsw <4 x i32> %wide.load21.9, %wide.load.9
  %57 = add nsw <4 x i32> %56, %51
  %58 = getelementptr i32, i32* %scevgep, i64 40
  %59 = bitcast i32* %58 to <4 x i32>*
  %wide.load.10 = load <4 x i32>, <4 x i32>* %59, align 4, !alias.scope !16, !noalias !20
  %60 = getelementptr i32, i32* %scevgep8, i64 40
  %61 = bitcast i32* %60 to <4 x i32>*
  %wide.load21.10 = load <4 x i32>, <4 x i32>* %61, align 4, !alias.scope !19, !noalias !21
  %62 = mul nsw <4 x i32> %wide.load21.10, %wide.load.10
  %63 = add nsw <4 x i32> %62, %57
  %64 = getelementptr i32, i32* %scevgep, i64 44
  %65 = bitcast i32* %64 to <4 x i32>*
  %wide.load.11 = load <4 x i32>, <4 x i32>* %65, align 4, !alias.scope !16, !noalias !20
  %66 = getelementptr i32, i32* %scevgep8, i64 44
  %67 = bitcast i32* %66 to <4 x i32>*
  %wide.load21.11 = load <4 x i32>, <4 x i32>* %67, align 4, !alias.scope !19, !noalias !21
  %68 = mul nsw <4 x i32> %wide.load21.11, %wide.load.11
  %69 = add nsw <4 x i32> %68, %63
  %70 = getelementptr i32, i32* %scevgep, i64 48
  %71 = bitcast i32* %70 to <4 x i32>*
  %wide.load.12 = load <4 x i32>, <4 x i32>* %71, align 4, !alias.scope !16, !noalias !20
  %72 = getelementptr i32, i32* %scevgep8, i64 48
  %73 = bitcast i32* %72 to <4 x i32>*
  %wide.load21.12 = load <4 x i32>, <4 x i32>* %73, align 4, !alias.scope !19, !noalias !21
  %74 = mul nsw <4 x i32> %wide.load21.12, %wide.load.12
  %75 = add nsw <4 x i32> %74, %69
  %76 = getelementptr i32, i32* %scevgep, i64 52
  %77 = bitcast i32* %76 to <4 x i32>*
  %wide.load.13 = load <4 x i32>, <4 x i32>* %77, align 4, !alias.scope !16, !noalias !20
  %78 = getelementptr i32, i32* %scevgep8, i64 52
  %79 = bitcast i32* %78 to <4 x i32>*
  %wide.load21.13 = load <4 x i32>, <4 x i32>* %79, align 4, !alias.scope !19, !noalias !21
  %80 = mul nsw <4 x i32> %wide.load21.13, %wide.load.13
  %81 = add nsw <4 x i32> %80, %75
  %82 = getelementptr i32, i32* %scevgep, i64 56
  %83 = bitcast i32* %82 to <4 x i32>*
  %wide.load.14 = load <4 x i32>, <4 x i32>* %83, align 4, !alias.scope !16, !noalias !20
  %84 = getelementptr i32, i32* %scevgep8, i64 56
  %85 = bitcast i32* %84 to <4 x i32>*
  %wide.load21.14 = load <4 x i32>, <4 x i32>* %85, align 4, !alias.scope !19, !noalias !21
  %86 = mul nsw <4 x i32> %wide.load21.14, %wide.load.14
  %87 = add nsw <4 x i32> %86, %81
  %88 = getelementptr i32, i32* %scevgep, i64 60
  %89 = bitcast i32* %88 to <4 x i32>*
  %wide.load.15 = load <4 x i32>, <4 x i32>* %89, align 4, !alias.scope !16, !noalias !20
  %90 = getelementptr i32, i32* %scevgep8, i64 60
  %91 = bitcast i32* %90 to <4 x i32>*
  %wide.load21.15 = load <4 x i32>, <4 x i32>* %91, align 4, !alias.scope !19, !noalias !21
  %92 = mul nsw <4 x i32> %wide.load21.15, %wide.load.15
  %93 = add nsw <4 x i32> %92, %87
  %rdx.shuf = shufflevector <4 x i32> %93, <4 x i32> undef, <4 x i32> <i32 2, i32 3, i32 undef, i32 undef>
  %bin.rdx = add <4 x i32> %93, %rdx.shuf
  %rdx.shuf22 = shufflevector <4 x i32> %bin.rdx, <4 x i32> undef, <4 x i32> <i32 1, i32 undef, i32 undef, i32 undef>
  %bin.rdx23 = add <4 x i32> %bin.rdx, %rdx.shuf22
  %94 = extractelement <4 x i32> %bin.rdx23, i32 0
  %scevgep11 = getelementptr [64 x i32], [64 x i32]* %sum, i64 0, i64 %polly.indvar
  store i32 %94, i32* %scevgep11, align 4, !alias.scope !11, !noalias !13
  %polly.indvar_next = add nuw nsw i64 %polly.indvar, 1
  %exitcond20 = icmp eq i64 %polly.indvar_next, 32
  br i1 %exitcond20, label %polly.stmt.for.inc22.preheader, label %polly.loop_preheader2
}

; Function Attrs: nounwind uwtable
define void @print_array() #4 {
entry:
  br label %for.cond1.preheader

for.cond1.preheader:                              ; preds = %for.end, %entry
  %indvars.iv6 = phi i64 [ 0, %entry ], [ %indvars.iv.next7, %for.end ]
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 8
  br label %for.body3

for.body3:                                        ; preds = %for.inc, %for.cond1.preheader
  %indvars.iv = phi i64 [ 0, %for.cond1.preheader ], [ %indvars.iv.next, %for.inc ]
  %1 = phi %struct._IO_FILE* [ %0, %for.cond1.preheader ], [ %5, %for.inc ]
  %arrayidx5 = getelementptr inbounds [2048 x [2048 x i32]], [2048 x [2048 x i32]]* @Z, i64 0, i64 %indvars.iv6, i64 %indvars.iv
  %2 = load i32, i32* %arrayidx5, align 4
  %call = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %1, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str, i64 0, i64 0), i32 %2) #5
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
  %exitcond = icmp eq i64 %indvars.iv.next, 2048
  br i1 %exitcond, label %for.end, label %for.body3

for.end:                                          ; preds = %for.inc
  %.lcssa = phi %struct._IO_FILE* [ %5, %for.inc ]
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %.lcssa)
  %indvars.iv.next7 = add nuw nsw i64 %indvars.iv6, 1
  %exitcond8 = icmp eq i64 %indvars.iv.next7, 2048
  br i1 %exitcond8, label %for.end11, label %for.cond1.preheader

for.end11:                                        ; preds = %for.end
  ret void
}

; Function Attrs: nounwind
declare i32 @fprintf(%struct._IO_FILE* nocapture, i8* nocapture readonly, ...) #2

; Function Attrs: nounwind uwtable
define i32 @main() #4 {
entry:
  br label %polly.loop_preheader2.i

polly.loop_exit3.i:                               ; preds = %polly.loop_exit9.i
  %polly.indvar_next.i = add nuw nsw i64 %polly.indvar.i, 1
  %exitcond22.i = icmp eq i64 %polly.indvar_next.i, 64
  br i1 %exitcond22.i, label %for.body.preheader, label %polly.loop_preheader2.i

for.body.preheader:                               ; preds = %polly.loop_exit3.i
  br label %for.body

polly.loop_exit9.i:                               ; preds = %vector.body
  %polly.indvar_next5.i = add nuw nsw i64 %polly.indvar4.i, 1
  %exitcond21.i = icmp eq i64 %polly.indvar_next5.i, 64
  br i1 %exitcond21.i, label %polly.loop_exit3.i, label %polly.loop_preheader8.i

polly.loop_preheader2.i:                          ; preds = %polly.loop_exit3.i, %entry
  %polly.indvar.i = phi i64 [ 0, %entry ], [ %polly.indvar_next.i, %polly.loop_exit3.i ]
  %0 = shl nsw i64 %polly.indvar.i, 5
  br label %polly.loop_preheader8.i

polly.loop_preheader8.i:                          ; preds = %polly.loop_preheader2.i, %polly.loop_exit9.i
  %polly.indvar4.i = phi i64 [ 0, %polly.loop_preheader2.i ], [ %polly.indvar_next5.i, %polly.loop_exit9.i ]
  %1 = shl nsw i64 %polly.indvar4.i, 5
  %2 = or i64 %1, 4
  %3 = or i64 %1, 8
  %4 = or i64 %1, 12
  %5 = or i64 %1, 16
  %6 = or i64 %1, 20
  %7 = or i64 %1, 24
  %8 = or i64 %1, 28
  br label %polly.loop_preheader14.i

polly.loop_preheader14.i:                         ; preds = %polly.loop_preheader8.i, %vector.body
  %polly.indvar10.i = phi i64 [ 0, %polly.loop_preheader8.i ], [ %polly.indvar_next11.i, %vector.body ]
  %9 = add nuw nsw i64 %polly.indvar10.i, %0
  br label %vector.body

vector.body:                                      ; preds = %polly.loop_preheader14.i
  %10 = getelementptr [2048 x [2048 x i32]], [2048 x [2048 x i32]]* @X, i64 0, i64 %9, i64 %1
  %11 = bitcast i32* %10 to <4 x i32>*
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* %11, align 16, !alias.scope !22, !noalias !24
  %12 = getelementptr [2048 x [2048 x i32]], [2048 x [2048 x i32]]* @Y, i64 0, i64 %9, i64 %1
  %13 = bitcast i32* %12 to <4 x i32>*
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* %13, align 16, !alias.scope !25, !noalias !26
  %14 = getelementptr [2048 x [2048 x i32]], [2048 x [2048 x i32]]* @X, i64 0, i64 %9, i64 %2
  %15 = bitcast i32* %14 to <4 x i32>*
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* %15, align 16, !alias.scope !22, !noalias !24
  %16 = getelementptr [2048 x [2048 x i32]], [2048 x [2048 x i32]]* @Y, i64 0, i64 %9, i64 %2
  %17 = bitcast i32* %16 to <4 x i32>*
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* %17, align 16, !alias.scope !25, !noalias !26
  %18 = getelementptr [2048 x [2048 x i32]], [2048 x [2048 x i32]]* @X, i64 0, i64 %9, i64 %3
  %19 = bitcast i32* %18 to <4 x i32>*
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* %19, align 16, !alias.scope !22, !noalias !24
  %20 = getelementptr [2048 x [2048 x i32]], [2048 x [2048 x i32]]* @Y, i64 0, i64 %9, i64 %3
  %21 = bitcast i32* %20 to <4 x i32>*
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* %21, align 16, !alias.scope !25, !noalias !26
  %22 = getelementptr [2048 x [2048 x i32]], [2048 x [2048 x i32]]* @X, i64 0, i64 %9, i64 %4
  %23 = bitcast i32* %22 to <4 x i32>*
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* %23, align 16, !alias.scope !22, !noalias !24
  %24 = getelementptr [2048 x [2048 x i32]], [2048 x [2048 x i32]]* @Y, i64 0, i64 %9, i64 %4
  %25 = bitcast i32* %24 to <4 x i32>*
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* %25, align 16, !alias.scope !25, !noalias !26
  %26 = getelementptr [2048 x [2048 x i32]], [2048 x [2048 x i32]]* @X, i64 0, i64 %9, i64 %5
  %27 = bitcast i32* %26 to <4 x i32>*
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* %27, align 16, !alias.scope !22, !noalias !24
  %28 = getelementptr [2048 x [2048 x i32]], [2048 x [2048 x i32]]* @Y, i64 0, i64 %9, i64 %5
  %29 = bitcast i32* %28 to <4 x i32>*
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* %29, align 16, !alias.scope !25, !noalias !26
  %30 = getelementptr [2048 x [2048 x i32]], [2048 x [2048 x i32]]* @X, i64 0, i64 %9, i64 %6
  %31 = bitcast i32* %30 to <4 x i32>*
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* %31, align 16, !alias.scope !22, !noalias !24
  %32 = getelementptr [2048 x [2048 x i32]], [2048 x [2048 x i32]]* @Y, i64 0, i64 %9, i64 %6
  %33 = bitcast i32* %32 to <4 x i32>*
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* %33, align 16, !alias.scope !25, !noalias !26
  %34 = getelementptr [2048 x [2048 x i32]], [2048 x [2048 x i32]]* @X, i64 0, i64 %9, i64 %7
  %35 = bitcast i32* %34 to <4 x i32>*
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* %35, align 16, !alias.scope !22, !noalias !24
  %36 = getelementptr [2048 x [2048 x i32]], [2048 x [2048 x i32]]* @Y, i64 0, i64 %9, i64 %7
  %37 = bitcast i32* %36 to <4 x i32>*
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* %37, align 16, !alias.scope !25, !noalias !26
  %38 = getelementptr [2048 x [2048 x i32]], [2048 x [2048 x i32]]* @X, i64 0, i64 %9, i64 %8
  %39 = bitcast i32* %38 to <4 x i32>*
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* %39, align 16, !alias.scope !22, !noalias !24
  %40 = getelementptr [2048 x [2048 x i32]], [2048 x [2048 x i32]]* @Y, i64 0, i64 %9, i64 %8
  %41 = bitcast i32* %40 to <4 x i32>*
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* %41, align 16, !alias.scope !25, !noalias !26
  %polly.indvar_next11.i = add nuw nsw i64 %polly.indvar10.i, 1
  %exitcond20.i = icmp eq i64 %polly.indvar_next11.i, 32
  br i1 %exitcond20.i, label %polly.loop_exit9.i, label %polly.loop_preheader14.i

for.body:                                         ; preds = %for.body.preheader, %for.inc10
  %indvars.iv3 = phi i64 [ %indvars.iv.next4, %for.inc10 ], [ 0, %for.body.preheader ]
  %42 = trunc i64 %indvars.iv3 to i32
  %call.i = tail call noalias i8* @malloc(i64 8192) #5
  %43 = bitcast i8* %call.i to i32*
  %44 = icmp ult i32 %42, 2048
  %sext = shl i64 %indvars.iv3, 32
  %45 = ashr exact i64 %sext, 32
  br i1 %44, label %polly.loop_preheader.i, label %for.cond1.preheader.i.preheader

for.cond1.preheader.i.preheader:                  ; preds = %for.body
  br label %for.cond1.preheader.i

for.cond1.preheader.i:                            ; preds = %for.cond1.preheader.i.preheader, %for.inc10.i
  %indvars.iv5.i = phi i64 [ %indvars.iv.next6.i, %for.inc10.i ], [ 0, %for.cond1.preheader.i.preheader ]
  %46 = shl i64 %indvars.iv5.i, 6
  br label %for.body3.i

for.body3.i:                                      ; preds = %for.body3.i, %for.cond1.preheader.i
  %indvars.iv.i = phi i64 [ 0, %for.cond1.preheader.i ], [ %indvars.iv.next.i.3, %for.body3.i ]
  %47 = add nuw nsw i64 %indvars.iv.i, %46
  %arrayidx5.i = getelementptr inbounds [2048 x [2048 x i32]], [2048 x [2048 x i32]]* @Y, i64 0, i64 %47, i64 %45
  %48 = load i32, i32* %arrayidx5.i, align 4
  %arrayidx9.i = getelementptr inbounds i32, i32* %43, i64 %47
  store i32 %48, i32* %arrayidx9.i, align 4
  %indvars.iv.next.i = or i64 %indvars.iv.i, 1
  %49 = add nuw nsw i64 %indvars.iv.next.i, %46
  %arrayidx5.i.1 = getelementptr inbounds [2048 x [2048 x i32]], [2048 x [2048 x i32]]* @Y, i64 0, i64 %49, i64 %45
  %50 = load i32, i32* %arrayidx5.i.1, align 4
  %arrayidx9.i.1 = getelementptr inbounds i32, i32* %43, i64 %49
  store i32 %50, i32* %arrayidx9.i.1, align 4
  %indvars.iv.next.i.1 = or i64 %indvars.iv.i, 2
  %51 = add nuw nsw i64 %indvars.iv.next.i.1, %46
  %arrayidx5.i.2 = getelementptr inbounds [2048 x [2048 x i32]], [2048 x [2048 x i32]]* @Y, i64 0, i64 %51, i64 %45
  %52 = load i32, i32* %arrayidx5.i.2, align 4
  %arrayidx9.i.2 = getelementptr inbounds i32, i32* %43, i64 %51
  store i32 %52, i32* %arrayidx9.i.2, align 4
  %indvars.iv.next.i.2 = or i64 %indvars.iv.i, 3
  %53 = add nuw nsw i64 %indvars.iv.next.i.2, %46
  %arrayidx5.i.3 = getelementptr inbounds [2048 x [2048 x i32]], [2048 x [2048 x i32]]* @Y, i64 0, i64 %53, i64 %45
  %54 = load i32, i32* %arrayidx5.i.3, align 4
  %arrayidx9.i.3 = getelementptr inbounds i32, i32* %43, i64 %53
  store i32 %54, i32* %arrayidx9.i.3, align 4
  %indvars.iv.next.i.3 = add nsw i64 %indvars.iv.i, 4
  %exitcond.i1.3 = icmp eq i64 %indvars.iv.next.i.3, 64
  br i1 %exitcond.i1.3, label %for.inc10.i, label %for.body3.i

for.inc10.i:                                      ; preds = %for.body3.i
  %indvars.iv.next6.i = add nuw nsw i64 %indvars.iv5.i, 1
  %exitcond9.i = icmp eq i64 %indvars.iv.next6.i, 32
  br i1 %exitcond9.i, label %for.body3.preheader.loopexit17, label %for.cond1.preheader.i

polly.loop_preheader.i:                           ; preds = %for.body
  %scevgep.i2 = getelementptr [2048 x [2048 x i32]], [2048 x [2048 x i32]]* @Y, i64 0, i64 0, i64 %45
  br label %polly.loop_preheader8.i10

polly.loop_exit9.i5:                              ; preds = %polly.loop_header7.i
  %polly.indvar_next5.i3 = add nuw nsw i64 %polly.indvar4.i9, 1
  %exitcond21.i4 = icmp eq i64 %polly.indvar_next5.i3, 32
  br i1 %exitcond21.i4, label %polly.loop_preheader8.1.i.preheader, label %polly.loop_preheader8.i10

polly.loop_preheader8.1.i.preheader:              ; preds = %polly.loop_exit9.i5
  br label %polly.loop_preheader8.1.i

polly.loop_header7.i:                             ; preds = %polly.loop_header7.i, %polly.loop_preheader8.i10
  %polly.indvar10.i6 = phi i64 [ 0, %polly.loop_preheader8.i10 ], [ %polly.indvar_next11.i7.3, %polly.loop_header7.i ]
  %55 = shl i64 %polly.indvar10.i6, 11
  %scevgep14.i = getelementptr i32, i32* %scevgep13.i, i64 %55
  %_p_scalar_.i = load i32, i32* %scevgep14.i, align 4, !alias.scope !27, !noalias !29
  %56 = shl i64 %polly.indvar10.i6, 2
  %scevgep16.i = getelementptr i8, i8* %scevgep15.i, i64 %56
  %scevgep1617.i = bitcast i8* %scevgep16.i to i32*
  store i32 %_p_scalar_.i, i32* %scevgep1617.i, align 4, !alias.scope !30, !noalias !31
  %polly.indvar_next11.i7 = or i64 %polly.indvar10.i6, 1
  %57 = shl i64 %polly.indvar_next11.i7, 11
  %scevgep14.i.1 = getelementptr i32, i32* %scevgep13.i, i64 %57
  %_p_scalar_.i.1 = load i32, i32* %scevgep14.i.1, align 4, !alias.scope !27, !noalias !29
  %58 = shl i64 %polly.indvar_next11.i7, 2
  %scevgep16.i.1 = getelementptr i8, i8* %scevgep15.i, i64 %58
  %scevgep1617.i.1 = bitcast i8* %scevgep16.i.1 to i32*
  store i32 %_p_scalar_.i.1, i32* %scevgep1617.i.1, align 4, !alias.scope !30, !noalias !31
  %polly.indvar_next11.i7.1 = or i64 %polly.indvar10.i6, 2
  %59 = shl i64 %polly.indvar_next11.i7.1, 11
  %scevgep14.i.2 = getelementptr i32, i32* %scevgep13.i, i64 %59
  %_p_scalar_.i.2 = load i32, i32* %scevgep14.i.2, align 4, !alias.scope !27, !noalias !29
  %60 = shl i64 %polly.indvar_next11.i7.1, 2
  %scevgep16.i.2 = getelementptr i8, i8* %scevgep15.i, i64 %60
  %scevgep1617.i.2 = bitcast i8* %scevgep16.i.2 to i32*
  store i32 %_p_scalar_.i.2, i32* %scevgep1617.i.2, align 4, !alias.scope !30, !noalias !31
  %polly.indvar_next11.i7.2 = or i64 %polly.indvar10.i6, 3
  %61 = shl i64 %polly.indvar_next11.i7.2, 11
  %scevgep14.i.3 = getelementptr i32, i32* %scevgep13.i, i64 %61
  %_p_scalar_.i.3 = load i32, i32* %scevgep14.i.3, align 4, !alias.scope !27, !noalias !29
  %62 = shl i64 %polly.indvar_next11.i7.2, 2
  %scevgep16.i.3 = getelementptr i8, i8* %scevgep15.i, i64 %62
  %scevgep1617.i.3 = bitcast i8* %scevgep16.i.3 to i32*
  store i32 %_p_scalar_.i.3, i32* %scevgep1617.i.3, align 4, !alias.scope !30, !noalias !31
  %polly.indvar_next11.i7.3 = add nsw i64 %polly.indvar10.i6, 4
  %exitcond20.i8.3 = icmp eq i64 %polly.indvar_next11.i7.3, 32
  br i1 %exitcond20.i8.3, label %polly.loop_exit9.i5, label %polly.loop_header7.i

polly.loop_preheader8.i10:                        ; preds = %polly.loop_exit9.i5, %polly.loop_preheader.i
  %polly.indvar4.i9 = phi i64 [ 0, %polly.loop_preheader.i ], [ %polly.indvar_next5.i3, %polly.loop_exit9.i5 ]
  %63 = shl i64 %polly.indvar4.i9, 17
  %scevgep13.i = getelementptr i32, i32* %scevgep.i2, i64 %63
  %64 = shl i64 %polly.indvar4.i9, 8
  %scevgep15.i = getelementptr i8, i8* %call.i, i64 %64
  br label %polly.loop_header7.i

polly.loop_preheader8.1.i:                        ; preds = %polly.loop_preheader8.1.i.preheader, %polly.loop_exit9.1.i
  %polly.indvar4.1.i = phi i64 [ %polly.indvar_next5.1.i, %polly.loop_exit9.1.i ], [ 0, %polly.loop_preheader8.1.i.preheader ]
  %65 = shl i64 %polly.indvar4.1.i, 17
  %scevgep13.1.i = getelementptr i32, i32* %scevgep.i2, i64 %65
  %66 = shl i64 %polly.indvar4.1.i, 8
  %scevgep15.1.i = getelementptr i8, i8* %call.i, i64 %66
  br label %polly.loop_header7.1.i

polly.loop_header7.1.i:                           ; preds = %polly.loop_header7.1.i, %polly.loop_preheader8.1.i
  %polly.indvar10.1.i = phi i64 [ 0, %polly.loop_preheader8.1.i ], [ %polly.indvar_next11.1.i.3, %polly.loop_header7.1.i ]
  %67 = add nuw nsw i64 %polly.indvar10.1.i, 32
  %68 = shl i64 %67, 11
  %scevgep14.1.i = getelementptr i32, i32* %scevgep13.1.i, i64 %68
  %_p_scalar_.1.i = load i32, i32* %scevgep14.1.i, align 4, !alias.scope !27, !noalias !29
  %69 = shl i64 %67, 2
  %scevgep16.1.i = getelementptr i8, i8* %scevgep15.1.i, i64 %69
  %scevgep1617.1.i = bitcast i8* %scevgep16.1.i to i32*
  store i32 %_p_scalar_.1.i, i32* %scevgep1617.1.i, align 4, !alias.scope !30, !noalias !31
  %70 = add nsw i64 %polly.indvar10.1.i, 33
  %71 = shl i64 %70, 11
  %scevgep14.1.i.1 = getelementptr i32, i32* %scevgep13.1.i, i64 %71
  %_p_scalar_.1.i.1 = load i32, i32* %scevgep14.1.i.1, align 4, !alias.scope !27, !noalias !29
  %72 = shl i64 %70, 2
  %scevgep16.1.i.1 = getelementptr i8, i8* %scevgep15.1.i, i64 %72
  %scevgep1617.1.i.1 = bitcast i8* %scevgep16.1.i.1 to i32*
  store i32 %_p_scalar_.1.i.1, i32* %scevgep1617.1.i.1, align 4, !alias.scope !30, !noalias !31
  %73 = add nsw i64 %polly.indvar10.1.i, 34
  %74 = shl i64 %73, 11
  %scevgep14.1.i.2 = getelementptr i32, i32* %scevgep13.1.i, i64 %74
  %_p_scalar_.1.i.2 = load i32, i32* %scevgep14.1.i.2, align 4, !alias.scope !27, !noalias !29
  %75 = shl i64 %73, 2
  %scevgep16.1.i.2 = getelementptr i8, i8* %scevgep15.1.i, i64 %75
  %scevgep1617.1.i.2 = bitcast i8* %scevgep16.1.i.2 to i32*
  store i32 %_p_scalar_.1.i.2, i32* %scevgep1617.1.i.2, align 4, !alias.scope !30, !noalias !31
  %76 = add nsw i64 %polly.indvar10.1.i, 35
  %77 = shl i64 %76, 11
  %scevgep14.1.i.3 = getelementptr i32, i32* %scevgep13.1.i, i64 %77
  %_p_scalar_.1.i.3 = load i32, i32* %scevgep14.1.i.3, align 4, !alias.scope !27, !noalias !29
  %78 = shl i64 %76, 2
  %scevgep16.1.i.3 = getelementptr i8, i8* %scevgep15.1.i, i64 %78
  %scevgep1617.1.i.3 = bitcast i8* %scevgep16.1.i.3 to i32*
  store i32 %_p_scalar_.1.i.3, i32* %scevgep1617.1.i.3, align 4, !alias.scope !30, !noalias !31
  %polly.indvar_next11.1.i.3 = add nsw i64 %polly.indvar10.1.i, 4
  %exitcond20.1.i.3 = icmp eq i64 %polly.indvar_next11.1.i.3, 32
  br i1 %exitcond20.1.i.3, label %polly.loop_exit9.1.i, label %polly.loop_header7.1.i

polly.loop_exit9.1.i:                             ; preds = %polly.loop_header7.1.i
  %polly.indvar_next5.1.i = add nuw nsw i64 %polly.indvar4.1.i, 1
  %exitcond21.1.i = icmp eq i64 %polly.indvar_next5.1.i, 32
  br i1 %exitcond21.1.i, label %for.body3.preheader.loopexit, label %polly.loop_preheader8.1.i

for.body3.preheader.loopexit:                     ; preds = %polly.loop_exit9.1.i
  br label %for.body3.preheader

for.body3.preheader.loopexit17:                   ; preds = %for.inc10.i
  br label %for.body3.preheader

for.body3.preheader:                              ; preds = %for.body3.preheader.loopexit17, %for.body3.preheader.loopexit
  br label %for.body3

for.body3:                                        ; preds = %for.body3.preheader, %for.body3
  %indvars.iv = phi i64 [ %indvars.iv.next, %for.body3 ], [ 0, %for.body3.preheader ]
  %arraydecay = getelementptr inbounds [2048 x [2048 x i32]], [2048 x [2048 x i32]]* @X, i64 0, i64 %indvars.iv, i64 0
  %call7 = tail call i32 @dot(i32* %arraydecay, i32* %43)
  %arrayidx9 = getelementptr inbounds [2048 x [2048 x i32]], [2048 x [2048 x i32]]* @Z, i64 0, i64 %indvars.iv, i64 %indvars.iv3
  store i32 %call7, i32* %arrayidx9, align 4
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 2048
  br i1 %exitcond, label %for.inc10, label %for.body3

for.inc10:                                        ; preds = %for.body3
  %indvars.iv.next4 = add nuw nsw i64 %indvars.iv3, 1
  %exitcond5 = icmp eq i64 %indvars.iv.next4, 2048
  br i1 %exitcond5, label %for.end12, label %for.body

for.end12:                                        ; preds = %for.inc10
  %79 = load i32, i32* getelementptr inbounds ([2048 x [2048 x i32]], [2048 x [2048 x i32]]* @Z, i64 0, i64 2047, i64 2047), align 4
  %call13 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([46 x i8], [46 x i8]* @.str.2, i64 0, i64 0), i32 2048, i32 2048, i32 2047, i32 2047, i32 %79) #5
  ret i32 0
}

; Function Attrs: nounwind
declare i32 @printf(i8* nocapture readonly, ...) #2

; Function Attrs: nounwind
declare i32 @fputc(i32, %struct._IO_FILE* nocapture) #5

attributes #0 = { norecurse nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "polly-optimized" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "polly-optimized" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { norecurse nounwind readonly uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "polly-optimized" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 3.9.0 (http://llvm.org/git/clang.git e177b4a63ca92c5fec010986944530688e104074) (http://llvm.org/git/llvm.git fcd97ccb03712372fe95f1732638de5ed3fcabe8)"}
!1 = distinct !{!1, !2, !"polly.alias.scope.X"}
!2 = distinct !{!2, !"polly.alias.scope.domain"}
!3 = !{!4}
!4 = distinct !{!4, !2, !"polly.alias.scope.Y"}
!5 = !{!1}
!6 = distinct !{!6, !7, !"polly.alias.scope.Y"}
!7 = distinct !{!7, !"polly.alias.scope.domain"}
!8 = !{!9}
!9 = distinct !{!9, !7, !"polly.alias.scope.call"}
!10 = !{!6}
!11 = distinct !{!11, !12, !"polly.alias.scope.sum"}
!12 = distinct !{!12, !"polly.alias.scope.domain"}
!13 = !{!14, !15, !16, !17, !18, !19}
!14 = distinct !{!14, !12, !"polly.alias.scope.add9.lcssa"}
!15 = distinct !{!15, !12, !"polly.alias.scope.tmp.04"}
!16 = distinct !{!16, !12, !"polly.alias.scope.a"}
!17 = distinct !{!17, !12, !"polly.alias.scope.add21"}
!18 = distinct !{!18, !12, !"polly.alias.scope.total.02"}
!19 = distinct !{!19, !12, !"polly.alias.scope.b"}
!20 = !{!14, !15, !17, !18, !11, !19}
!21 = !{!14, !15, !16, !17, !18, !11}
!22 = distinct !{!22, !23, !"polly.alias.scope.X"}
!23 = distinct !{!23, !"polly.alias.scope.domain"}
!24 = !{!25}
!25 = distinct !{!25, !23, !"polly.alias.scope.Y"}
!26 = !{!22}
!27 = distinct !{!27, !28, !"polly.alias.scope.Y"}
!28 = distinct !{!28, !"polly.alias.scope.domain"}
!29 = !{!30}
!30 = distinct !{!30, !28, !"polly.alias.scope.call"}
!31 = !{!27}
