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
  br label %polly.loop_preheader2

polly.exiting:                                    ; preds = %vector.body
  %p_add14.lcssa = phi i32 [ %p_add14, %vector.body ]
  ret i32 %p_add14.lcssa

polly.loop_preheader2:                            ; preds = %vector.body, %entry
  %total.04.phiops.0 = phi i32 [ 0, %entry ], [ %p_add14, %vector.body ]
  %polly.indvar = phi i64 [ 0, %entry ], [ %polly.indvar_next, %vector.body ]
  %0 = shl i64 %polly.indvar, 6
  %scevgep = getelementptr i32, i32* %a, i64 %0
  %scevgep8 = getelementptr i32, i32* %b, i64 %0
  br label %vector.body

vector.body:                                      ; preds = %polly.loop_preheader2
  %1 = bitcast i32* %scevgep to <4 x i32>*
  %wide.load = load <4 x i32>, <4 x i32>* %1, align 4, !alias.scope !11, !noalias !13
  %2 = bitcast i32* %scevgep8 to <4 x i32>*
  %wide.load12 = load <4 x i32>, <4 x i32>* %2, align 4, !alias.scope !17, !noalias !19
  %3 = mul nsw <4 x i32> %wide.load12, %wide.load
  %4 = getelementptr i32, i32* %scevgep, i64 4
  %5 = bitcast i32* %4 to <4 x i32>*
  %wide.load.1 = load <4 x i32>, <4 x i32>* %5, align 4, !alias.scope !11, !noalias !13
  %6 = getelementptr i32, i32* %scevgep8, i64 4
  %7 = bitcast i32* %6 to <4 x i32>*
  %wide.load12.1 = load <4 x i32>, <4 x i32>* %7, align 4, !alias.scope !17, !noalias !19
  %8 = mul nsw <4 x i32> %wide.load12.1, %wide.load.1
  %9 = add nsw <4 x i32> %8, %3
  %10 = getelementptr i32, i32* %scevgep, i64 8
  %11 = bitcast i32* %10 to <4 x i32>*
  %wide.load.2 = load <4 x i32>, <4 x i32>* %11, align 4, !alias.scope !11, !noalias !13
  %12 = getelementptr i32, i32* %scevgep8, i64 8
  %13 = bitcast i32* %12 to <4 x i32>*
  %wide.load12.2 = load <4 x i32>, <4 x i32>* %13, align 4, !alias.scope !17, !noalias !19
  %14 = mul nsw <4 x i32> %wide.load12.2, %wide.load.2
  %15 = add nsw <4 x i32> %14, %9
  %16 = getelementptr i32, i32* %scevgep, i64 12
  %17 = bitcast i32* %16 to <4 x i32>*
  %wide.load.3 = load <4 x i32>, <4 x i32>* %17, align 4, !alias.scope !11, !noalias !13
  %18 = getelementptr i32, i32* %scevgep8, i64 12
  %19 = bitcast i32* %18 to <4 x i32>*
  %wide.load12.3 = load <4 x i32>, <4 x i32>* %19, align 4, !alias.scope !17, !noalias !19
  %20 = mul nsw <4 x i32> %wide.load12.3, %wide.load.3
  %21 = add nsw <4 x i32> %20, %15
  %22 = getelementptr i32, i32* %scevgep, i64 16
  %23 = bitcast i32* %22 to <4 x i32>*
  %wide.load.4 = load <4 x i32>, <4 x i32>* %23, align 4, !alias.scope !11, !noalias !13
  %24 = getelementptr i32, i32* %scevgep8, i64 16
  %25 = bitcast i32* %24 to <4 x i32>*
  %wide.load12.4 = load <4 x i32>, <4 x i32>* %25, align 4, !alias.scope !17, !noalias !19
  %26 = mul nsw <4 x i32> %wide.load12.4, %wide.load.4
  %27 = add nsw <4 x i32> %26, %21
  %28 = getelementptr i32, i32* %scevgep, i64 20
  %29 = bitcast i32* %28 to <4 x i32>*
  %wide.load.5 = load <4 x i32>, <4 x i32>* %29, align 4, !alias.scope !11, !noalias !13
  %30 = getelementptr i32, i32* %scevgep8, i64 20
  %31 = bitcast i32* %30 to <4 x i32>*
  %wide.load12.5 = load <4 x i32>, <4 x i32>* %31, align 4, !alias.scope !17, !noalias !19
  %32 = mul nsw <4 x i32> %wide.load12.5, %wide.load.5
  %33 = add nsw <4 x i32> %32, %27
  %34 = getelementptr i32, i32* %scevgep, i64 24
  %35 = bitcast i32* %34 to <4 x i32>*
  %wide.load.6 = load <4 x i32>, <4 x i32>* %35, align 4, !alias.scope !11, !noalias !13
  %36 = getelementptr i32, i32* %scevgep8, i64 24
  %37 = bitcast i32* %36 to <4 x i32>*
  %wide.load12.6 = load <4 x i32>, <4 x i32>* %37, align 4, !alias.scope !17, !noalias !19
  %38 = mul nsw <4 x i32> %wide.load12.6, %wide.load.6
  %39 = add nsw <4 x i32> %38, %33
  %40 = getelementptr i32, i32* %scevgep, i64 28
  %41 = bitcast i32* %40 to <4 x i32>*
  %wide.load.7 = load <4 x i32>, <4 x i32>* %41, align 4, !alias.scope !11, !noalias !13
  %42 = getelementptr i32, i32* %scevgep8, i64 28
  %43 = bitcast i32* %42 to <4 x i32>*
  %wide.load12.7 = load <4 x i32>, <4 x i32>* %43, align 4, !alias.scope !17, !noalias !19
  %44 = mul nsw <4 x i32> %wide.load12.7, %wide.load.7
  %45 = add nsw <4 x i32> %44, %39
  %46 = getelementptr i32, i32* %scevgep, i64 32
  %47 = bitcast i32* %46 to <4 x i32>*
  %wide.load.8 = load <4 x i32>, <4 x i32>* %47, align 4, !alias.scope !11, !noalias !13
  %48 = getelementptr i32, i32* %scevgep8, i64 32
  %49 = bitcast i32* %48 to <4 x i32>*
  %wide.load12.8 = load <4 x i32>, <4 x i32>* %49, align 4, !alias.scope !17, !noalias !19
  %50 = mul nsw <4 x i32> %wide.load12.8, %wide.load.8
  %51 = add nsw <4 x i32> %50, %45
  %52 = getelementptr i32, i32* %scevgep, i64 36
  %53 = bitcast i32* %52 to <4 x i32>*
  %wide.load.9 = load <4 x i32>, <4 x i32>* %53, align 4, !alias.scope !11, !noalias !13
  %54 = getelementptr i32, i32* %scevgep8, i64 36
  %55 = bitcast i32* %54 to <4 x i32>*
  %wide.load12.9 = load <4 x i32>, <4 x i32>* %55, align 4, !alias.scope !17, !noalias !19
  %56 = mul nsw <4 x i32> %wide.load12.9, %wide.load.9
  %57 = add nsw <4 x i32> %56, %51
  %58 = getelementptr i32, i32* %scevgep, i64 40
  %59 = bitcast i32* %58 to <4 x i32>*
  %wide.load.10 = load <4 x i32>, <4 x i32>* %59, align 4, !alias.scope !11, !noalias !13
  %60 = getelementptr i32, i32* %scevgep8, i64 40
  %61 = bitcast i32* %60 to <4 x i32>*
  %wide.load12.10 = load <4 x i32>, <4 x i32>* %61, align 4, !alias.scope !17, !noalias !19
  %62 = mul nsw <4 x i32> %wide.load12.10, %wide.load.10
  %63 = add nsw <4 x i32> %62, %57
  %64 = getelementptr i32, i32* %scevgep, i64 44
  %65 = bitcast i32* %64 to <4 x i32>*
  %wide.load.11 = load <4 x i32>, <4 x i32>* %65, align 4, !alias.scope !11, !noalias !13
  %66 = getelementptr i32, i32* %scevgep8, i64 44
  %67 = bitcast i32* %66 to <4 x i32>*
  %wide.load12.11 = load <4 x i32>, <4 x i32>* %67, align 4, !alias.scope !17, !noalias !19
  %68 = mul nsw <4 x i32> %wide.load12.11, %wide.load.11
  %69 = add nsw <4 x i32> %68, %63
  %70 = getelementptr i32, i32* %scevgep, i64 48
  %71 = bitcast i32* %70 to <4 x i32>*
  %wide.load.12 = load <4 x i32>, <4 x i32>* %71, align 4, !alias.scope !11, !noalias !13
  %72 = getelementptr i32, i32* %scevgep8, i64 48
  %73 = bitcast i32* %72 to <4 x i32>*
  %wide.load12.12 = load <4 x i32>, <4 x i32>* %73, align 4, !alias.scope !17, !noalias !19
  %74 = mul nsw <4 x i32> %wide.load12.12, %wide.load.12
  %75 = add nsw <4 x i32> %74, %69
  %76 = getelementptr i32, i32* %scevgep, i64 52
  %77 = bitcast i32* %76 to <4 x i32>*
  %wide.load.13 = load <4 x i32>, <4 x i32>* %77, align 4, !alias.scope !11, !noalias !13
  %78 = getelementptr i32, i32* %scevgep8, i64 52
  %79 = bitcast i32* %78 to <4 x i32>*
  %wide.load12.13 = load <4 x i32>, <4 x i32>* %79, align 4, !alias.scope !17, !noalias !19
  %80 = mul nsw <4 x i32> %wide.load12.13, %wide.load.13
  %81 = add nsw <4 x i32> %80, %75
  %82 = getelementptr i32, i32* %scevgep, i64 56
  %83 = bitcast i32* %82 to <4 x i32>*
  %wide.load.14 = load <4 x i32>, <4 x i32>* %83, align 4, !alias.scope !11, !noalias !13
  %84 = getelementptr i32, i32* %scevgep8, i64 56
  %85 = bitcast i32* %84 to <4 x i32>*
  %wide.load12.14 = load <4 x i32>, <4 x i32>* %85, align 4, !alias.scope !17, !noalias !19
  %86 = mul nsw <4 x i32> %wide.load12.14, %wide.load.14
  %87 = add nsw <4 x i32> %86, %81
  %88 = getelementptr i32, i32* %scevgep, i64 60
  %89 = bitcast i32* %88 to <4 x i32>*
  %wide.load.15 = load <4 x i32>, <4 x i32>* %89, align 4, !alias.scope !11, !noalias !13
  %90 = getelementptr i32, i32* %scevgep8, i64 60
  %91 = bitcast i32* %90 to <4 x i32>*
  %wide.load12.15 = load <4 x i32>, <4 x i32>* %91, align 4, !alias.scope !17, !noalias !19
  %92 = mul nsw <4 x i32> %wide.load12.15, %wide.load.15
  %93 = add nsw <4 x i32> %92, %87
  %rdx.shuf = shufflevector <4 x i32> %93, <4 x i32> undef, <4 x i32> <i32 2, i32 3, i32 undef, i32 undef>
  %bin.rdx = add <4 x i32> %93, %rdx.shuf
  %rdx.shuf13 = shufflevector <4 x i32> %bin.rdx, <4 x i32> undef, <4 x i32> <i32 1, i32 undef, i32 undef, i32 undef>
  %bin.rdx14 = add <4 x i32> %bin.rdx, %rdx.shuf13
  %94 = extractelement <4 x i32> %bin.rdx14, i32 0
  %p_add14 = add nsw i32 %94, %total.04.phiops.0
  %polly.indvar_next = add nuw nsw i64 %polly.indvar, 1
  %exitcond11 = icmp eq i64 %polly.indvar_next, 32
  br i1 %exitcond11, label %polly.exiting, label %polly.loop_preheader2
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
define i32 @main() #1 {
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
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* %11, align 16, !alias.scope !20, !noalias !22
  %12 = getelementptr [2048 x [2048 x i32]], [2048 x [2048 x i32]]* @Y, i64 0, i64 %9, i64 %1
  %13 = bitcast i32* %12 to <4 x i32>*
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* %13, align 16, !alias.scope !23, !noalias !24
  %14 = getelementptr [2048 x [2048 x i32]], [2048 x [2048 x i32]]* @X, i64 0, i64 %9, i64 %2
  %15 = bitcast i32* %14 to <4 x i32>*
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* %15, align 16, !alias.scope !20, !noalias !22
  %16 = getelementptr [2048 x [2048 x i32]], [2048 x [2048 x i32]]* @Y, i64 0, i64 %9, i64 %2
  %17 = bitcast i32* %16 to <4 x i32>*
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* %17, align 16, !alias.scope !23, !noalias !24
  %18 = getelementptr [2048 x [2048 x i32]], [2048 x [2048 x i32]]* @X, i64 0, i64 %9, i64 %3
  %19 = bitcast i32* %18 to <4 x i32>*
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* %19, align 16, !alias.scope !20, !noalias !22
  %20 = getelementptr [2048 x [2048 x i32]], [2048 x [2048 x i32]]* @Y, i64 0, i64 %9, i64 %3
  %21 = bitcast i32* %20 to <4 x i32>*
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* %21, align 16, !alias.scope !23, !noalias !24
  %22 = getelementptr [2048 x [2048 x i32]], [2048 x [2048 x i32]]* @X, i64 0, i64 %9, i64 %4
  %23 = bitcast i32* %22 to <4 x i32>*
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* %23, align 16, !alias.scope !20, !noalias !22
  %24 = getelementptr [2048 x [2048 x i32]], [2048 x [2048 x i32]]* @Y, i64 0, i64 %9, i64 %4
  %25 = bitcast i32* %24 to <4 x i32>*
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* %25, align 16, !alias.scope !23, !noalias !24
  %26 = getelementptr [2048 x [2048 x i32]], [2048 x [2048 x i32]]* @X, i64 0, i64 %9, i64 %5
  %27 = bitcast i32* %26 to <4 x i32>*
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* %27, align 16, !alias.scope !20, !noalias !22
  %28 = getelementptr [2048 x [2048 x i32]], [2048 x [2048 x i32]]* @Y, i64 0, i64 %9, i64 %5
  %29 = bitcast i32* %28 to <4 x i32>*
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* %29, align 16, !alias.scope !23, !noalias !24
  %30 = getelementptr [2048 x [2048 x i32]], [2048 x [2048 x i32]]* @X, i64 0, i64 %9, i64 %6
  %31 = bitcast i32* %30 to <4 x i32>*
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* %31, align 16, !alias.scope !20, !noalias !22
  %32 = getelementptr [2048 x [2048 x i32]], [2048 x [2048 x i32]]* @Y, i64 0, i64 %9, i64 %6
  %33 = bitcast i32* %32 to <4 x i32>*
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* %33, align 16, !alias.scope !23, !noalias !24
  %34 = getelementptr [2048 x [2048 x i32]], [2048 x [2048 x i32]]* @X, i64 0, i64 %9, i64 %7
  %35 = bitcast i32* %34 to <4 x i32>*
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* %35, align 16, !alias.scope !20, !noalias !22
  %36 = getelementptr [2048 x [2048 x i32]], [2048 x [2048 x i32]]* @Y, i64 0, i64 %9, i64 %7
  %37 = bitcast i32* %36 to <4 x i32>*
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* %37, align 16, !alias.scope !23, !noalias !24
  %38 = getelementptr [2048 x [2048 x i32]], [2048 x [2048 x i32]]* @X, i64 0, i64 %9, i64 %8
  %39 = bitcast i32* %38 to <4 x i32>*
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* %39, align 16, !alias.scope !20, !noalias !22
  %40 = getelementptr [2048 x [2048 x i32]], [2048 x [2048 x i32]]* @Y, i64 0, i64 %9, i64 %8
  %41 = bitcast i32* %40 to <4 x i32>*
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* %41, align 16, !alias.scope !23, !noalias !24
  %polly.indvar_next11.i = add nuw nsw i64 %polly.indvar10.i, 1
  %exitcond20.i = icmp eq i64 %polly.indvar_next11.i, 32
  br i1 %exitcond20.i, label %polly.loop_exit9.i, label %polly.loop_preheader14.i

for.body:                                         ; preds = %for.body.preheader, %for.end17
  %indvars.iv8 = phi i64 [ %indvars.iv.next9, %for.end17 ], [ 0, %for.body.preheader ]
  %42 = trunc i64 %indvars.iv8 to i32
  %call.i = tail call noalias i8* @malloc(i64 8192) #5
  %43 = bitcast i8* %call.i to i32*
  %44 = icmp ult i32 %42, 2048
  %sext = shl i64 %indvars.iv8, 32
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
  %exitcond.i19.3 = icmp eq i64 %indvars.iv.next.i.3, 64
  br i1 %exitcond.i19.3, label %for.inc10.i, label %for.body3.i

for.inc10.i:                                      ; preds = %for.body3.i
  %indvars.iv.next6.i = add nuw nsw i64 %indvars.iv5.i, 1
  %exitcond9.i = icmp eq i64 %indvars.iv.next6.i, 32
  br i1 %exitcond9.i, label %transpose.exit.loopexit87, label %for.cond1.preheader.i

polly.loop_preheader.i:                           ; preds = %for.body
  %scevgep.i20 = getelementptr [2048 x [2048 x i32]], [2048 x [2048 x i32]]* @Y, i64 0, i64 0, i64 %45
  br label %polly.loop_preheader8.i28

polly.loop_exit9.i23:                             ; preds = %polly.loop_header7.i
  %polly.indvar_next5.i21 = add nuw nsw i64 %polly.indvar4.i27, 1
  %exitcond21.i22 = icmp eq i64 %polly.indvar_next5.i21, 32
  br i1 %exitcond21.i22, label %polly.loop_preheader8.1.i.preheader, label %polly.loop_preheader8.i28

polly.loop_preheader8.1.i.preheader:              ; preds = %polly.loop_exit9.i23
  br label %polly.loop_preheader8.1.i

polly.loop_header7.i:                             ; preds = %polly.loop_header7.i, %polly.loop_preheader8.i28
  %polly.indvar10.i24 = phi i64 [ 0, %polly.loop_preheader8.i28 ], [ %polly.indvar_next11.i25.3, %polly.loop_header7.i ]
  %55 = shl i64 %polly.indvar10.i24, 11
  %scevgep14.i = getelementptr i32, i32* %scevgep13.i, i64 %55
  %_p_scalar_.i = load i32, i32* %scevgep14.i, align 4, !alias.scope !25, !noalias !27
  %56 = shl i64 %polly.indvar10.i24, 2
  %scevgep16.i = getelementptr i8, i8* %scevgep15.i, i64 %56
  %scevgep1617.i = bitcast i8* %scevgep16.i to i32*
  store i32 %_p_scalar_.i, i32* %scevgep1617.i, align 4, !alias.scope !28, !noalias !29
  %polly.indvar_next11.i25 = or i64 %polly.indvar10.i24, 1
  %57 = shl i64 %polly.indvar_next11.i25, 11
  %scevgep14.i.1 = getelementptr i32, i32* %scevgep13.i, i64 %57
  %_p_scalar_.i.1 = load i32, i32* %scevgep14.i.1, align 4, !alias.scope !25, !noalias !27
  %58 = shl i64 %polly.indvar_next11.i25, 2
  %scevgep16.i.1 = getelementptr i8, i8* %scevgep15.i, i64 %58
  %scevgep1617.i.1 = bitcast i8* %scevgep16.i.1 to i32*
  store i32 %_p_scalar_.i.1, i32* %scevgep1617.i.1, align 4, !alias.scope !28, !noalias !29
  %polly.indvar_next11.i25.1 = or i64 %polly.indvar10.i24, 2
  %59 = shl i64 %polly.indvar_next11.i25.1, 11
  %scevgep14.i.2 = getelementptr i32, i32* %scevgep13.i, i64 %59
  %_p_scalar_.i.2 = load i32, i32* %scevgep14.i.2, align 4, !alias.scope !25, !noalias !27
  %60 = shl i64 %polly.indvar_next11.i25.1, 2
  %scevgep16.i.2 = getelementptr i8, i8* %scevgep15.i, i64 %60
  %scevgep1617.i.2 = bitcast i8* %scevgep16.i.2 to i32*
  store i32 %_p_scalar_.i.2, i32* %scevgep1617.i.2, align 4, !alias.scope !28, !noalias !29
  %polly.indvar_next11.i25.2 = or i64 %polly.indvar10.i24, 3
  %61 = shl i64 %polly.indvar_next11.i25.2, 11
  %scevgep14.i.3 = getelementptr i32, i32* %scevgep13.i, i64 %61
  %_p_scalar_.i.3 = load i32, i32* %scevgep14.i.3, align 4, !alias.scope !25, !noalias !27
  %62 = shl i64 %polly.indvar_next11.i25.2, 2
  %scevgep16.i.3 = getelementptr i8, i8* %scevgep15.i, i64 %62
  %scevgep1617.i.3 = bitcast i8* %scevgep16.i.3 to i32*
  store i32 %_p_scalar_.i.3, i32* %scevgep1617.i.3, align 4, !alias.scope !28, !noalias !29
  %polly.indvar_next11.i25.3 = add nsw i64 %polly.indvar10.i24, 4
  %exitcond20.i26.3 = icmp eq i64 %polly.indvar_next11.i25.3, 32
  br i1 %exitcond20.i26.3, label %polly.loop_exit9.i23, label %polly.loop_header7.i

polly.loop_preheader8.i28:                        ; preds = %polly.loop_exit9.i23, %polly.loop_preheader.i
  %polly.indvar4.i27 = phi i64 [ 0, %polly.loop_preheader.i ], [ %polly.indvar_next5.i21, %polly.loop_exit9.i23 ]
  %63 = shl i64 %polly.indvar4.i27, 17
  %scevgep13.i = getelementptr i32, i32* %scevgep.i20, i64 %63
  %64 = shl i64 %polly.indvar4.i27, 8
  %scevgep15.i = getelementptr i8, i8* %call.i, i64 %64
  br label %polly.loop_header7.i

polly.loop_preheader8.1.i:                        ; preds = %polly.loop_preheader8.1.i.preheader, %polly.loop_exit9.1.i
  %polly.indvar4.1.i = phi i64 [ %polly.indvar_next5.1.i, %polly.loop_exit9.1.i ], [ 0, %polly.loop_preheader8.1.i.preheader ]
  %65 = shl i64 %polly.indvar4.1.i, 17
  %scevgep13.1.i = getelementptr i32, i32* %scevgep.i20, i64 %65
  %66 = shl i64 %polly.indvar4.1.i, 8
  %scevgep15.1.i = getelementptr i8, i8* %call.i, i64 %66
  br label %polly.loop_header7.1.i

polly.loop_header7.1.i:                           ; preds = %polly.loop_header7.1.i, %polly.loop_preheader8.1.i
  %polly.indvar10.1.i = phi i64 [ 0, %polly.loop_preheader8.1.i ], [ %polly.indvar_next11.1.i.3, %polly.loop_header7.1.i ]
  %67 = add nuw nsw i64 %polly.indvar10.1.i, 32
  %68 = shl i64 %67, 11
  %scevgep14.1.i = getelementptr i32, i32* %scevgep13.1.i, i64 %68
  %_p_scalar_.1.i = load i32, i32* %scevgep14.1.i, align 4, !alias.scope !25, !noalias !27
  %69 = shl i64 %67, 2
  %scevgep16.1.i = getelementptr i8, i8* %scevgep15.1.i, i64 %69
  %scevgep1617.1.i = bitcast i8* %scevgep16.1.i to i32*
  store i32 %_p_scalar_.1.i, i32* %scevgep1617.1.i, align 4, !alias.scope !28, !noalias !29
  %70 = add nsw i64 %polly.indvar10.1.i, 33
  %71 = shl i64 %70, 11
  %scevgep14.1.i.1 = getelementptr i32, i32* %scevgep13.1.i, i64 %71
  %_p_scalar_.1.i.1 = load i32, i32* %scevgep14.1.i.1, align 4, !alias.scope !25, !noalias !27
  %72 = shl i64 %70, 2
  %scevgep16.1.i.1 = getelementptr i8, i8* %scevgep15.1.i, i64 %72
  %scevgep1617.1.i.1 = bitcast i8* %scevgep16.1.i.1 to i32*
  store i32 %_p_scalar_.1.i.1, i32* %scevgep1617.1.i.1, align 4, !alias.scope !28, !noalias !29
  %73 = add nsw i64 %polly.indvar10.1.i, 34
  %74 = shl i64 %73, 11
  %scevgep14.1.i.2 = getelementptr i32, i32* %scevgep13.1.i, i64 %74
  %_p_scalar_.1.i.2 = load i32, i32* %scevgep14.1.i.2, align 4, !alias.scope !25, !noalias !27
  %75 = shl i64 %73, 2
  %scevgep16.1.i.2 = getelementptr i8, i8* %scevgep15.1.i, i64 %75
  %scevgep1617.1.i.2 = bitcast i8* %scevgep16.1.i.2 to i32*
  store i32 %_p_scalar_.1.i.2, i32* %scevgep1617.1.i.2, align 4, !alias.scope !28, !noalias !29
  %76 = add nsw i64 %polly.indvar10.1.i, 35
  %77 = shl i64 %76, 11
  %scevgep14.1.i.3 = getelementptr i32, i32* %scevgep13.1.i, i64 %77
  %_p_scalar_.1.i.3 = load i32, i32* %scevgep14.1.i.3, align 4, !alias.scope !25, !noalias !27
  %78 = shl i64 %76, 2
  %scevgep16.1.i.3 = getelementptr i8, i8* %scevgep15.1.i, i64 %78
  %scevgep1617.1.i.3 = bitcast i8* %scevgep16.1.i.3 to i32*
  store i32 %_p_scalar_.1.i.3, i32* %scevgep1617.1.i.3, align 4, !alias.scope !28, !noalias !29
  %polly.indvar_next11.1.i.3 = add nsw i64 %polly.indvar10.1.i, 4
  %exitcond20.1.i.3 = icmp eq i64 %polly.indvar_next11.1.i.3, 32
  br i1 %exitcond20.1.i.3, label %polly.loop_exit9.1.i, label %polly.loop_header7.1.i

polly.loop_exit9.1.i:                             ; preds = %polly.loop_header7.1.i
  %polly.indvar_next5.1.i = add nuw nsw i64 %polly.indvar4.1.i, 1
  %exitcond21.1.i = icmp eq i64 %polly.indvar_next5.1.i, 32
  br i1 %exitcond21.1.i, label %transpose.exit.loopexit, label %polly.loop_preheader8.1.i

transpose.exit.loopexit:                          ; preds = %polly.loop_exit9.1.i
  br label %transpose.exit

transpose.exit.loopexit87:                        ; preds = %for.inc10.i
  br label %transpose.exit

transpose.exit:                                   ; preds = %transpose.exit.loopexit87, %transpose.exit.loopexit
  %polly.access.call = getelementptr i8, i8* %call.i, i64 8192
  %79 = bitcast i8* %polly.access.call to i32*
  %polly.access.Z = getelementptr [2048 x [2048 x i32]], [2048 x [2048 x i32]]* @Z, i64 0, i64 0, i64 %indvars.iv8
  %80 = icmp ule i32* %79, %polly.access.Z
  %polly.access.add.Z1 = add nuw nsw i64 %indvars.iv8, 4192257
  %polly.access.Z2 = getelementptr [2048 x [2048 x i32]], [2048 x [2048 x i32]]* @Z, i64 0, i64 0, i64 %polly.access.add.Z1
  %81 = icmp ule i32* %polly.access.Z2, %43
  %82 = or i1 %81, %80
  %83 = icmp uge i32* %polly.access.Z, getelementptr inbounds ([2048 x [2048 x i32]], [2048 x [2048 x i32]]* @X, i64 1, i64 0, i64 0)
  %84 = icmp ule i32* %polly.access.Z2, getelementptr inbounds ([2048 x [2048 x i32]], [2048 x [2048 x i32]]* @X, i64 0, i64 0, i64 0)
  %85 = or i1 %83, %84
  %86 = and i1 %85, %82
  br i1 %86, label %vector.ph45.preheader, label %vector.ph65.preheader

vector.ph65.preheader:                            ; preds = %transpose.exit
  br label %vector.ph65

vector.ph45.preheader:                            ; preds = %transpose.exit
  br label %vector.ph45

vector.ph65:                                      ; preds = %vector.ph65.preheader, %middle.block62
  %indvars.iv5 = phi i64 [ %indvars.iv.next6, %middle.block62 ], [ 0, %vector.ph65.preheader ]
  br label %vector.body61

vector.body61:                                    ; preds = %vector.body61, %vector.ph65
  %index66 = phi i64 [ 0, %vector.ph65 ], [ %index.next67.1, %vector.body61 ]
  %vec.phi74 = phi <4 x i32> [ zeroinitializer, %vector.ph65 ], [ %109, %vector.body61 ]
  %vec.phi75 = phi <4 x i32> [ zeroinitializer, %vector.ph65 ], [ %110, %vector.body61 ]
  %87 = getelementptr inbounds [2048 x [2048 x i32]], [2048 x [2048 x i32]]* @X, i64 0, i64 %indvars.iv5, i64 %index66
  %88 = bitcast i32* %87 to <4 x i32>*
  %wide.load76 = load <4 x i32>, <4 x i32>* %88, align 16
  %89 = getelementptr i32, i32* %87, i64 4
  %90 = bitcast i32* %89 to <4 x i32>*
  %wide.load77 = load <4 x i32>, <4 x i32>* %90, align 16
  %91 = getelementptr inbounds i32, i32* %43, i64 %index66
  %92 = bitcast i32* %91 to <4 x i32>*
  %wide.load78 = load <4 x i32>, <4 x i32>* %92, align 4
  %93 = getelementptr i32, i32* %91, i64 4
  %94 = bitcast i32* %93 to <4 x i32>*
  %wide.load79 = load <4 x i32>, <4 x i32>* %94, align 4
  %95 = mul nsw <4 x i32> %wide.load78, %wide.load76
  %96 = mul nsw <4 x i32> %wide.load79, %wide.load77
  %97 = add nsw <4 x i32> %95, %vec.phi74
  %98 = add nsw <4 x i32> %96, %vec.phi75
  %index.next67 = or i64 %index66, 8
  %99 = getelementptr inbounds [2048 x [2048 x i32]], [2048 x [2048 x i32]]* @X, i64 0, i64 %indvars.iv5, i64 %index.next67
  %100 = bitcast i32* %99 to <4 x i32>*
  %wide.load76.1 = load <4 x i32>, <4 x i32>* %100, align 16
  %101 = getelementptr i32, i32* %99, i64 4
  %102 = bitcast i32* %101 to <4 x i32>*
  %wide.load77.1 = load <4 x i32>, <4 x i32>* %102, align 16
  %103 = getelementptr inbounds i32, i32* %43, i64 %index.next67
  %104 = bitcast i32* %103 to <4 x i32>*
  %wide.load78.1 = load <4 x i32>, <4 x i32>* %104, align 4
  %105 = getelementptr i32, i32* %103, i64 4
  %106 = bitcast i32* %105 to <4 x i32>*
  %wide.load79.1 = load <4 x i32>, <4 x i32>* %106, align 4
  %107 = mul nsw <4 x i32> %wide.load78.1, %wide.load76.1
  %108 = mul nsw <4 x i32> %wide.load79.1, %wide.load77.1
  %109 = add nsw <4 x i32> %107, %97
  %110 = add nsw <4 x i32> %108, %98
  %index.next67.1 = add nsw i64 %index66, 16
  %111 = icmp eq i64 %index.next67.1, 2048
  br i1 %111, label %middle.block62, label %vector.body61, !llvm.loop !30

middle.block62:                                   ; preds = %vector.body61
  %.lcssa91 = phi <4 x i32> [ %110, %vector.body61 ]
  %.lcssa = phi <4 x i32> [ %109, %vector.body61 ]
  %bin.rdx80 = add <4 x i32> %.lcssa91, %.lcssa
  %rdx.shuf81 = shufflevector <4 x i32> %bin.rdx80, <4 x i32> undef, <4 x i32> <i32 2, i32 3, i32 undef, i32 undef>
  %bin.rdx82 = add <4 x i32> %bin.rdx80, %rdx.shuf81
  %rdx.shuf83 = shufflevector <4 x i32> %bin.rdx82, <4 x i32> undef, <4 x i32> <i32 1, i32 undef, i32 undef, i32 undef>
  %bin.rdx84 = add <4 x i32> %bin.rdx82, %rdx.shuf83
  %112 = extractelement <4 x i32> %bin.rdx84, i32 0
  %arrayidx14 = getelementptr inbounds [2048 x [2048 x i32]], [2048 x [2048 x i32]]* @Z, i64 0, i64 %indvars.iv5, i64 %indvars.iv8
  store i32 %112, i32* %arrayidx14, align 4
  %indvars.iv.next6 = add nuw nsw i64 %indvars.iv5, 1
  %exitcond7 = icmp eq i64 %indvars.iv.next6, 2048
  br i1 %exitcond7, label %for.end17.loopexit86, label %vector.ph65

for.end17.loopexit:                               ; preds = %middle.block42
  br label %for.end17

for.end17.loopexit86:                             ; preds = %middle.block62
  br label %for.end17

for.end17:                                        ; preds = %for.end17.loopexit86, %for.end17.loopexit
  tail call void @free(i8* nonnull %call.i) #5
  %indvars.iv.next9 = add nuw nsw i64 %indvars.iv8, 1
  %exitcond10 = icmp eq i64 %indvars.iv.next9, 2048
  br i1 %exitcond10, label %for.end20, label %for.body

for.end20:                                        ; preds = %for.end17
  %113 = load i32, i32* getelementptr inbounds ([2048 x [2048 x i32]], [2048 x [2048 x i32]]* @Z, i64 0, i64 2047, i64 2047), align 4
  %call21 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([46 x i8], [46 x i8]* @.str.2, i64 0, i64 0), i32 2048, i32 2048, i32 2047, i32 2047, i32 %113) #5
  ret i32 0

vector.ph45:                                      ; preds = %vector.ph45.preheader, %middle.block42
  %polly.indvar = phi i64 [ %polly.indvar_next, %middle.block42 ], [ 0, %vector.ph45.preheader ]
  br label %vector.body41

vector.body41:                                    ; preds = %vector.body41, %vector.ph45
  %index46 = phi i64 [ 0, %vector.ph45 ], [ %index.next47.1, %vector.body41 ]
  %vec.phi = phi <4 x i32> [ zeroinitializer, %vector.ph45 ], [ %136, %vector.body41 ]
  %vec.phi50 = phi <4 x i32> [ zeroinitializer, %vector.ph45 ], [ %137, %vector.body41 ]
  %114 = getelementptr [2048 x [2048 x i32]], [2048 x [2048 x i32]]* @X, i64 0, i64 %polly.indvar, i64 %index46
  %115 = bitcast i32* %114 to <4 x i32>*
  %wide.load = load <4 x i32>, <4 x i32>* %115, align 16, !alias.scope !33, !noalias !35
  %116 = getelementptr i32, i32* %114, i64 4
  %117 = bitcast i32* %116 to <4 x i32>*
  %wide.load55 = load <4 x i32>, <4 x i32>* %117, align 16, !alias.scope !33, !noalias !35
  %118 = getelementptr i32, i32* %43, i64 %index46
  %119 = bitcast i32* %118 to <4 x i32>*
  %wide.load56 = load <4 x i32>, <4 x i32>* %119, align 4, !alias.scope !38, !noalias !40
  %120 = getelementptr i32, i32* %118, i64 4
  %121 = bitcast i32* %120 to <4 x i32>*
  %wide.load57 = load <4 x i32>, <4 x i32>* %121, align 4, !alias.scope !38, !noalias !40
  %122 = mul nsw <4 x i32> %wide.load56, %wide.load
  %123 = mul nsw <4 x i32> %wide.load57, %wide.load55
  %124 = add nsw <4 x i32> %122, %vec.phi
  %125 = add nsw <4 x i32> %123, %vec.phi50
  %index.next47 = or i64 %index46, 8
  %126 = getelementptr [2048 x [2048 x i32]], [2048 x [2048 x i32]]* @X, i64 0, i64 %polly.indvar, i64 %index.next47
  %127 = bitcast i32* %126 to <4 x i32>*
  %wide.load.1 = load <4 x i32>, <4 x i32>* %127, align 16, !alias.scope !33, !noalias !35
  %128 = getelementptr i32, i32* %126, i64 4
  %129 = bitcast i32* %128 to <4 x i32>*
  %wide.load55.1 = load <4 x i32>, <4 x i32>* %129, align 16, !alias.scope !33, !noalias !35
  %130 = getelementptr i32, i32* %43, i64 %index.next47
  %131 = bitcast i32* %130 to <4 x i32>*
  %wide.load56.1 = load <4 x i32>, <4 x i32>* %131, align 4, !alias.scope !38, !noalias !40
  %132 = getelementptr i32, i32* %130, i64 4
  %133 = bitcast i32* %132 to <4 x i32>*
  %wide.load57.1 = load <4 x i32>, <4 x i32>* %133, align 4, !alias.scope !38, !noalias !40
  %134 = mul nsw <4 x i32> %wide.load56.1, %wide.load.1
  %135 = mul nsw <4 x i32> %wide.load57.1, %wide.load55.1
  %136 = add nsw <4 x i32> %134, %124
  %137 = add nsw <4 x i32> %135, %125
  %index.next47.1 = add nsw i64 %index46, 16
  %138 = icmp eq i64 %index.next47.1, 2048
  br i1 %138, label %middle.block42, label %vector.body41, !llvm.loop !41

middle.block42:                                   ; preds = %vector.body41
  %.lcssa93 = phi <4 x i32> [ %137, %vector.body41 ]
  %.lcssa92 = phi <4 x i32> [ %136, %vector.body41 ]
  %bin.rdx = add <4 x i32> %.lcssa93, %.lcssa92
  %rdx.shuf = shufflevector <4 x i32> %bin.rdx, <4 x i32> undef, <4 x i32> <i32 2, i32 3, i32 undef, i32 undef>
  %bin.rdx58 = add <4 x i32> %bin.rdx, %rdx.shuf
  %rdx.shuf59 = shufflevector <4 x i32> %bin.rdx58, <4 x i32> undef, <4 x i32> <i32 1, i32 undef, i32 undef, i32 undef>
  %bin.rdx60 = add <4 x i32> %bin.rdx58, %rdx.shuf59
  %139 = extractelement <4 x i32> %bin.rdx60, i32 0
  %140 = shl i64 %polly.indvar, 11
  %scevgep18 = getelementptr i32, i32* %polly.access.Z, i64 %140
  store i32 %139, i32* %scevgep18, align 4, !alias.scope !39, !noalias !42
  %polly.indvar_next = add nuw nsw i64 %polly.indvar, 1
  %exitcond34 = icmp eq i64 %polly.indvar_next, 2048
  br i1 %exitcond34, label %for.end17.loopexit, label %vector.ph45
}

; Function Attrs: nounwind
declare void @free(i8* nocapture) #2

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
!11 = distinct !{!11, !12, !"polly.alias.scope.a"}
!12 = distinct !{!12, !"polly.alias.scope.domain"}
!13 = !{!14, !15, !16, !17, !18}
!14 = distinct !{!14, !12, !"polly.alias.scope.total.04"}
!15 = distinct !{!15, !12, !"polly.alias.scope.tmp.02"}
!16 = distinct !{!16, !12, !"polly.alias.scope.add14"}
!17 = distinct !{!17, !12, !"polly.alias.scope.b"}
!18 = distinct !{!18, !12, !"polly.alias.scope.add9.lcssa"}
!19 = !{!14, !15, !11, !16, !18}
!20 = distinct !{!20, !21, !"polly.alias.scope.X"}
!21 = distinct !{!21, !"polly.alias.scope.domain"}
!22 = !{!23}
!23 = distinct !{!23, !21, !"polly.alias.scope.Y"}
!24 = !{!20}
!25 = distinct !{!25, !26, !"polly.alias.scope.Y"}
!26 = distinct !{!26, !"polly.alias.scope.domain"}
!27 = !{!28}
!28 = distinct !{!28, !26, !"polly.alias.scope.call"}
!29 = !{!25}
!30 = distinct !{!30, !31, !32}
!31 = !{!"llvm.loop.vectorize.width", i32 1}
!32 = !{!"llvm.loop.interleave.count", i32 1}
!33 = distinct !{!33, !34, !"polly.alias.scope.X"}
!34 = distinct !{!34, !"polly.alias.scope.domain"}
!35 = !{!36, !37, !38, !39}
!36 = distinct !{!36, !34, !"polly.alias.scope.add.lcssa"}
!37 = distinct !{!37, !34, !"polly.alias.scope.sum.02"}
!38 = distinct !{!38, !34, !"polly.alias.scope.call"}
!39 = distinct !{!39, !34, !"polly.alias.scope.Z"}
!40 = !{!36, !37, !39, !33}
!41 = distinct !{!41, !31, !32}
!42 = !{!36, !37, !38, !33}
