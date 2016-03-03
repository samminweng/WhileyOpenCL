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

; Function Attrs: norecurse nounwind uwtable
define void @init() #0 {
entry:
  br label %polly.loop_preheader2

polly.exiting:                                    ; preds = %polly.loop_exit3
  ret void

polly.loop_exit3:                                 ; preds = %polly.loop_exit9
  %polly.indvar_next = add nuw nsw i64 %polly.indvar, 1
  %exitcond22 = icmp eq i64 %polly.indvar_next, 32
  br i1 %exitcond22, label %polly.exiting, label %polly.loop_preheader2

polly.loop_exit9:                                 ; preds = %vector.body
  %polly.indvar_next5 = add nuw nsw i64 %polly.indvar4, 1
  %exitcond21 = icmp eq i64 %polly.indvar_next5, 32
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
  %10 = getelementptr [1024 x [1024 x i32]], [1024 x [1024 x i32]]* @X, i64 0, i64 %9, i64 %1
  %11 = bitcast i32* %10 to <4 x i32>*
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* %11, align 16, !alias.scope !1, !noalias !3
  %12 = getelementptr [1024 x [1024 x i32]], [1024 x [1024 x i32]]* @Y, i64 0, i64 %9, i64 %1
  %13 = bitcast i32* %12 to <4 x i32>*
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* %13, align 16, !alias.scope !4, !noalias !5
  %14 = getelementptr [1024 x [1024 x i32]], [1024 x [1024 x i32]]* @X, i64 0, i64 %9, i64 %2
  %15 = bitcast i32* %14 to <4 x i32>*
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* %15, align 16, !alias.scope !1, !noalias !3
  %16 = getelementptr [1024 x [1024 x i32]], [1024 x [1024 x i32]]* @Y, i64 0, i64 %9, i64 %2
  %17 = bitcast i32* %16 to <4 x i32>*
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* %17, align 16, !alias.scope !4, !noalias !5
  %18 = getelementptr [1024 x [1024 x i32]], [1024 x [1024 x i32]]* @X, i64 0, i64 %9, i64 %3
  %19 = bitcast i32* %18 to <4 x i32>*
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* %19, align 16, !alias.scope !1, !noalias !3
  %20 = getelementptr [1024 x [1024 x i32]], [1024 x [1024 x i32]]* @Y, i64 0, i64 %9, i64 %3
  %21 = bitcast i32* %20 to <4 x i32>*
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* %21, align 16, !alias.scope !4, !noalias !5
  %22 = getelementptr [1024 x [1024 x i32]], [1024 x [1024 x i32]]* @X, i64 0, i64 %9, i64 %4
  %23 = bitcast i32* %22 to <4 x i32>*
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* %23, align 16, !alias.scope !1, !noalias !3
  %24 = getelementptr [1024 x [1024 x i32]], [1024 x [1024 x i32]]* @Y, i64 0, i64 %9, i64 %4
  %25 = bitcast i32* %24 to <4 x i32>*
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* %25, align 16, !alias.scope !4, !noalias !5
  %26 = getelementptr [1024 x [1024 x i32]], [1024 x [1024 x i32]]* @X, i64 0, i64 %9, i64 %5
  %27 = bitcast i32* %26 to <4 x i32>*
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* %27, align 16, !alias.scope !1, !noalias !3
  %28 = getelementptr [1024 x [1024 x i32]], [1024 x [1024 x i32]]* @Y, i64 0, i64 %9, i64 %5
  %29 = bitcast i32* %28 to <4 x i32>*
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* %29, align 16, !alias.scope !4, !noalias !5
  %30 = getelementptr [1024 x [1024 x i32]], [1024 x [1024 x i32]]* @X, i64 0, i64 %9, i64 %6
  %31 = bitcast i32* %30 to <4 x i32>*
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* %31, align 16, !alias.scope !1, !noalias !3
  %32 = getelementptr [1024 x [1024 x i32]], [1024 x [1024 x i32]]* @Y, i64 0, i64 %9, i64 %6
  %33 = bitcast i32* %32 to <4 x i32>*
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* %33, align 16, !alias.scope !4, !noalias !5
  %34 = getelementptr [1024 x [1024 x i32]], [1024 x [1024 x i32]]* @X, i64 0, i64 %9, i64 %7
  %35 = bitcast i32* %34 to <4 x i32>*
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* %35, align 16, !alias.scope !1, !noalias !3
  %36 = getelementptr [1024 x [1024 x i32]], [1024 x [1024 x i32]]* @Y, i64 0, i64 %9, i64 %7
  %37 = bitcast i32* %36 to <4 x i32>*
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* %37, align 16, !alias.scope !4, !noalias !5
  %38 = getelementptr [1024 x [1024 x i32]], [1024 x [1024 x i32]]* @X, i64 0, i64 %9, i64 %8
  %39 = bitcast i32* %38 to <4 x i32>*
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* %39, align 16, !alias.scope !1, !noalias !3
  %40 = getelementptr [1024 x [1024 x i32]], [1024 x [1024 x i32]]* @Y, i64 0, i64 %9, i64 %8
  %41 = bitcast i32* %40 to <4 x i32>*
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* %41, align 16, !alias.scope !4, !noalias !5
  %polly.indvar_next11 = add nuw nsw i64 %polly.indvar10, 1
  %exitcond20 = icmp eq i64 %polly.indvar_next11, 32
  br i1 %exitcond20, label %polly.loop_exit9, label %polly.loop_preheader14
}

; Function Attrs: nounwind uwtable
define noalias i32* @transpose(i32** noalias nocapture readnone %y, i32 %index) #1 {
entry:
  %call = tail call noalias i8* @malloc(i64 4096) #5
  %0 = bitcast i8* %call to i32*
  %1 = icmp ult i32 %index, 1024
  %2 = sext i32 %index to i64
  br i1 %1, label %polly.loop_preheader, label %for.body.preheader

for.body.preheader:                               ; preds = %entry
  br label %for.body

for.body:                                         ; preds = %for.body, %for.body.preheader
  %indvars.iv = phi i64 [ 0, %for.body.preheader ], [ %indvars.iv.next.3, %for.body ]
  %arrayidx2 = getelementptr inbounds [1024 x [1024 x i32]], [1024 x [1024 x i32]]* @Y, i64 0, i64 %indvars.iv, i64 %2
  %3 = load i32, i32* %arrayidx2, align 4
  %arrayidx4 = getelementptr inbounds i32, i32* %0, i64 %indvars.iv
  store i32 %3, i32* %arrayidx4, align 4
  %indvars.iv.next = or i64 %indvars.iv, 1
  %arrayidx2.1 = getelementptr inbounds [1024 x [1024 x i32]], [1024 x [1024 x i32]]* @Y, i64 0, i64 %indvars.iv.next, i64 %2
  %4 = load i32, i32* %arrayidx2.1, align 4
  %arrayidx4.1 = getelementptr inbounds i32, i32* %0, i64 %indvars.iv.next
  store i32 %4, i32* %arrayidx4.1, align 4
  %indvars.iv.next.1 = or i64 %indvars.iv, 2
  %arrayidx2.2 = getelementptr inbounds [1024 x [1024 x i32]], [1024 x [1024 x i32]]* @Y, i64 0, i64 %indvars.iv.next.1, i64 %2
  %5 = load i32, i32* %arrayidx2.2, align 4
  %arrayidx4.2 = getelementptr inbounds i32, i32* %0, i64 %indvars.iv.next.1
  store i32 %5, i32* %arrayidx4.2, align 4
  %indvars.iv.next.2 = or i64 %indvars.iv, 3
  %arrayidx2.3 = getelementptr inbounds [1024 x [1024 x i32]], [1024 x [1024 x i32]]* @Y, i64 0, i64 %indvars.iv.next.2, i64 %2
  %6 = load i32, i32* %arrayidx2.3, align 4
  %arrayidx4.3 = getelementptr inbounds i32, i32* %0, i64 %indvars.iv.next.2
  store i32 %6, i32* %arrayidx4.3, align 4
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  %exitcond.3 = icmp eq i64 %indvars.iv.next.3, 1024
  br i1 %exitcond.3, label %for.end.loopexit9, label %for.body

for.end.loopexit:                                 ; preds = %polly.stmt.for.body
  br label %for.end

for.end.loopexit9:                                ; preds = %for.body
  br label %for.end

for.end:                                          ; preds = %for.end.loopexit9, %for.end.loopexit
  ret i32* %0

polly.stmt.for.body:                              ; preds = %polly.stmt.for.body, %polly.loop_preheader
  %polly.indvar = phi i64 [ 0, %polly.loop_preheader ], [ %polly.indvar_next.3, %polly.stmt.for.body ]
  %7 = shl i64 %polly.indvar, 10
  %scevgep1 = getelementptr i32, i32* %scevgep, i64 %7
  %_p_scalar_ = load i32, i32* %scevgep1, align 4, !alias.scope !6, !noalias !8
  %8 = shl i64 %polly.indvar, 2
  %scevgep2 = getelementptr i8, i8* %call, i64 %8
  %scevgep23 = bitcast i8* %scevgep2 to i32*
  store i32 %_p_scalar_, i32* %scevgep23, align 4, !alias.scope !9, !noalias !10
  %polly.indvar_next = or i64 %polly.indvar, 1
  %9 = shl i64 %polly.indvar_next, 10
  %scevgep1.1 = getelementptr i32, i32* %scevgep, i64 %9
  %_p_scalar_.1 = load i32, i32* %scevgep1.1, align 4, !alias.scope !6, !noalias !8
  %10 = shl i64 %polly.indvar_next, 2
  %scevgep2.1 = getelementptr i8, i8* %call, i64 %10
  %scevgep23.1 = bitcast i8* %scevgep2.1 to i32*
  store i32 %_p_scalar_.1, i32* %scevgep23.1, align 4, !alias.scope !9, !noalias !10
  %polly.indvar_next.1 = or i64 %polly.indvar, 2
  %11 = shl i64 %polly.indvar_next.1, 10
  %scevgep1.2 = getelementptr i32, i32* %scevgep, i64 %11
  %_p_scalar_.2 = load i32, i32* %scevgep1.2, align 4, !alias.scope !6, !noalias !8
  %12 = shl i64 %polly.indvar_next.1, 2
  %scevgep2.2 = getelementptr i8, i8* %call, i64 %12
  %scevgep23.2 = bitcast i8* %scevgep2.2 to i32*
  store i32 %_p_scalar_.2, i32* %scevgep23.2, align 4, !alias.scope !9, !noalias !10
  %polly.indvar_next.2 = or i64 %polly.indvar, 3
  %13 = shl i64 %polly.indvar_next.2, 10
  %scevgep1.3 = getelementptr i32, i32* %scevgep, i64 %13
  %_p_scalar_.3 = load i32, i32* %scevgep1.3, align 4, !alias.scope !6, !noalias !8
  %14 = shl i64 %polly.indvar_next.2, 2
  %scevgep2.3 = getelementptr i8, i8* %call, i64 %14
  %scevgep23.3 = bitcast i8* %scevgep2.3 to i32*
  store i32 %_p_scalar_.3, i32* %scevgep23.3, align 4, !alias.scope !9, !noalias !10
  %polly.indvar_next.3 = add nsw i64 %polly.indvar, 4
  %exitcond6.3 = icmp eq i64 %polly.indvar_next.3, 1024
  br i1 %exitcond6.3, label %for.end.loopexit, label %polly.stmt.for.body

polly.loop_preheader:                             ; preds = %entry
  %scevgep = getelementptr [1024 x [1024 x i32]], [1024 x [1024 x i32]]* @Y, i64 0, i64 0, i64 %2
  br label %polly.stmt.for.body
}

; Function Attrs: nounwind
declare noalias i8* @malloc(i64) #2

; Function Attrs: norecurse nounwind readonly uwtable
define i32 @dot(i32* noalias nocapture readonly %a, i32* noalias nocapture readonly %b) #3 {
entry:
  br label %polly.loop_preheader2

polly.exiting:                                    ; preds = %vector.body
  %.lcssa = phi i32 [ %96, %vector.body ]
  ret i32 %.lcssa

polly.loop_preheader2:                            ; preds = %vector.body, %entry
  %sum.03.phiops.0 = phi i32 [ 0, %entry ], [ %96, %vector.body ]
  %polly.indvar = phi i64 [ 0, %entry ], [ %polly.indvar_next, %vector.body ]
  %0 = shl i64 %polly.indvar, 6
  %scevgep = getelementptr i32, i32* %a, i64 %0
  %scevgep8 = getelementptr i32, i32* %b, i64 %0
  br label %vector.body

vector.body:                                      ; preds = %polly.loop_preheader2
  %1 = insertelement <4 x i32> <i32 undef, i32 0, i32 0, i32 0>, i32 %sum.03.phiops.0, i32 0
  %2 = bitcast i32* %scevgep to <4 x i32>*
  %wide.load = load <4 x i32>, <4 x i32>* %2, align 4, !alias.scope !11, !noalias !13
  %3 = bitcast i32* %scevgep8 to <4 x i32>*
  %wide.load12 = load <4 x i32>, <4 x i32>* %3, align 4, !alias.scope !16, !noalias !18
  %4 = mul nsw <4 x i32> %wide.load12, %wide.load
  %5 = add nsw <4 x i32> %4, %1
  %6 = getelementptr i32, i32* %scevgep, i64 4
  %7 = bitcast i32* %6 to <4 x i32>*
  %wide.load.1 = load <4 x i32>, <4 x i32>* %7, align 4, !alias.scope !11, !noalias !13
  %8 = getelementptr i32, i32* %scevgep8, i64 4
  %9 = bitcast i32* %8 to <4 x i32>*
  %wide.load12.1 = load <4 x i32>, <4 x i32>* %9, align 4, !alias.scope !16, !noalias !18
  %10 = mul nsw <4 x i32> %wide.load12.1, %wide.load.1
  %11 = add nsw <4 x i32> %10, %5
  %12 = getelementptr i32, i32* %scevgep, i64 8
  %13 = bitcast i32* %12 to <4 x i32>*
  %wide.load.2 = load <4 x i32>, <4 x i32>* %13, align 4, !alias.scope !11, !noalias !13
  %14 = getelementptr i32, i32* %scevgep8, i64 8
  %15 = bitcast i32* %14 to <4 x i32>*
  %wide.load12.2 = load <4 x i32>, <4 x i32>* %15, align 4, !alias.scope !16, !noalias !18
  %16 = mul nsw <4 x i32> %wide.load12.2, %wide.load.2
  %17 = add nsw <4 x i32> %16, %11
  %18 = getelementptr i32, i32* %scevgep, i64 12
  %19 = bitcast i32* %18 to <4 x i32>*
  %wide.load.3 = load <4 x i32>, <4 x i32>* %19, align 4, !alias.scope !11, !noalias !13
  %20 = getelementptr i32, i32* %scevgep8, i64 12
  %21 = bitcast i32* %20 to <4 x i32>*
  %wide.load12.3 = load <4 x i32>, <4 x i32>* %21, align 4, !alias.scope !16, !noalias !18
  %22 = mul nsw <4 x i32> %wide.load12.3, %wide.load.3
  %23 = add nsw <4 x i32> %22, %17
  %24 = getelementptr i32, i32* %scevgep, i64 16
  %25 = bitcast i32* %24 to <4 x i32>*
  %wide.load.4 = load <4 x i32>, <4 x i32>* %25, align 4, !alias.scope !11, !noalias !13
  %26 = getelementptr i32, i32* %scevgep8, i64 16
  %27 = bitcast i32* %26 to <4 x i32>*
  %wide.load12.4 = load <4 x i32>, <4 x i32>* %27, align 4, !alias.scope !16, !noalias !18
  %28 = mul nsw <4 x i32> %wide.load12.4, %wide.load.4
  %29 = add nsw <4 x i32> %28, %23
  %30 = getelementptr i32, i32* %scevgep, i64 20
  %31 = bitcast i32* %30 to <4 x i32>*
  %wide.load.5 = load <4 x i32>, <4 x i32>* %31, align 4, !alias.scope !11, !noalias !13
  %32 = getelementptr i32, i32* %scevgep8, i64 20
  %33 = bitcast i32* %32 to <4 x i32>*
  %wide.load12.5 = load <4 x i32>, <4 x i32>* %33, align 4, !alias.scope !16, !noalias !18
  %34 = mul nsw <4 x i32> %wide.load12.5, %wide.load.5
  %35 = add nsw <4 x i32> %34, %29
  %36 = getelementptr i32, i32* %scevgep, i64 24
  %37 = bitcast i32* %36 to <4 x i32>*
  %wide.load.6 = load <4 x i32>, <4 x i32>* %37, align 4, !alias.scope !11, !noalias !13
  %38 = getelementptr i32, i32* %scevgep8, i64 24
  %39 = bitcast i32* %38 to <4 x i32>*
  %wide.load12.6 = load <4 x i32>, <4 x i32>* %39, align 4, !alias.scope !16, !noalias !18
  %40 = mul nsw <4 x i32> %wide.load12.6, %wide.load.6
  %41 = add nsw <4 x i32> %40, %35
  %42 = getelementptr i32, i32* %scevgep, i64 28
  %43 = bitcast i32* %42 to <4 x i32>*
  %wide.load.7 = load <4 x i32>, <4 x i32>* %43, align 4, !alias.scope !11, !noalias !13
  %44 = getelementptr i32, i32* %scevgep8, i64 28
  %45 = bitcast i32* %44 to <4 x i32>*
  %wide.load12.7 = load <4 x i32>, <4 x i32>* %45, align 4, !alias.scope !16, !noalias !18
  %46 = mul nsw <4 x i32> %wide.load12.7, %wide.load.7
  %47 = add nsw <4 x i32> %46, %41
  %48 = getelementptr i32, i32* %scevgep, i64 32
  %49 = bitcast i32* %48 to <4 x i32>*
  %wide.load.8 = load <4 x i32>, <4 x i32>* %49, align 4, !alias.scope !11, !noalias !13
  %50 = getelementptr i32, i32* %scevgep8, i64 32
  %51 = bitcast i32* %50 to <4 x i32>*
  %wide.load12.8 = load <4 x i32>, <4 x i32>* %51, align 4, !alias.scope !16, !noalias !18
  %52 = mul nsw <4 x i32> %wide.load12.8, %wide.load.8
  %53 = add nsw <4 x i32> %52, %47
  %54 = getelementptr i32, i32* %scevgep, i64 36
  %55 = bitcast i32* %54 to <4 x i32>*
  %wide.load.9 = load <4 x i32>, <4 x i32>* %55, align 4, !alias.scope !11, !noalias !13
  %56 = getelementptr i32, i32* %scevgep8, i64 36
  %57 = bitcast i32* %56 to <4 x i32>*
  %wide.load12.9 = load <4 x i32>, <4 x i32>* %57, align 4, !alias.scope !16, !noalias !18
  %58 = mul nsw <4 x i32> %wide.load12.9, %wide.load.9
  %59 = add nsw <4 x i32> %58, %53
  %60 = getelementptr i32, i32* %scevgep, i64 40
  %61 = bitcast i32* %60 to <4 x i32>*
  %wide.load.10 = load <4 x i32>, <4 x i32>* %61, align 4, !alias.scope !11, !noalias !13
  %62 = getelementptr i32, i32* %scevgep8, i64 40
  %63 = bitcast i32* %62 to <4 x i32>*
  %wide.load12.10 = load <4 x i32>, <4 x i32>* %63, align 4, !alias.scope !16, !noalias !18
  %64 = mul nsw <4 x i32> %wide.load12.10, %wide.load.10
  %65 = add nsw <4 x i32> %64, %59
  %66 = getelementptr i32, i32* %scevgep, i64 44
  %67 = bitcast i32* %66 to <4 x i32>*
  %wide.load.11 = load <4 x i32>, <4 x i32>* %67, align 4, !alias.scope !11, !noalias !13
  %68 = getelementptr i32, i32* %scevgep8, i64 44
  %69 = bitcast i32* %68 to <4 x i32>*
  %wide.load12.11 = load <4 x i32>, <4 x i32>* %69, align 4, !alias.scope !16, !noalias !18
  %70 = mul nsw <4 x i32> %wide.load12.11, %wide.load.11
  %71 = add nsw <4 x i32> %70, %65
  %72 = getelementptr i32, i32* %scevgep, i64 48
  %73 = bitcast i32* %72 to <4 x i32>*
  %wide.load.12 = load <4 x i32>, <4 x i32>* %73, align 4, !alias.scope !11, !noalias !13
  %74 = getelementptr i32, i32* %scevgep8, i64 48
  %75 = bitcast i32* %74 to <4 x i32>*
  %wide.load12.12 = load <4 x i32>, <4 x i32>* %75, align 4, !alias.scope !16, !noalias !18
  %76 = mul nsw <4 x i32> %wide.load12.12, %wide.load.12
  %77 = add nsw <4 x i32> %76, %71
  %78 = getelementptr i32, i32* %scevgep, i64 52
  %79 = bitcast i32* %78 to <4 x i32>*
  %wide.load.13 = load <4 x i32>, <4 x i32>* %79, align 4, !alias.scope !11, !noalias !13
  %80 = getelementptr i32, i32* %scevgep8, i64 52
  %81 = bitcast i32* %80 to <4 x i32>*
  %wide.load12.13 = load <4 x i32>, <4 x i32>* %81, align 4, !alias.scope !16, !noalias !18
  %82 = mul nsw <4 x i32> %wide.load12.13, %wide.load.13
  %83 = add nsw <4 x i32> %82, %77
  %84 = getelementptr i32, i32* %scevgep, i64 56
  %85 = bitcast i32* %84 to <4 x i32>*
  %wide.load.14 = load <4 x i32>, <4 x i32>* %85, align 4, !alias.scope !11, !noalias !13
  %86 = getelementptr i32, i32* %scevgep8, i64 56
  %87 = bitcast i32* %86 to <4 x i32>*
  %wide.load12.14 = load <4 x i32>, <4 x i32>* %87, align 4, !alias.scope !16, !noalias !18
  %88 = mul nsw <4 x i32> %wide.load12.14, %wide.load.14
  %89 = add nsw <4 x i32> %88, %83
  %90 = getelementptr i32, i32* %scevgep, i64 60
  %91 = bitcast i32* %90 to <4 x i32>*
  %wide.load.15 = load <4 x i32>, <4 x i32>* %91, align 4, !alias.scope !11, !noalias !13
  %92 = getelementptr i32, i32* %scevgep8, i64 60
  %93 = bitcast i32* %92 to <4 x i32>*
  %wide.load12.15 = load <4 x i32>, <4 x i32>* %93, align 4, !alias.scope !16, !noalias !18
  %94 = mul nsw <4 x i32> %wide.load12.15, %wide.load.15
  %95 = add nsw <4 x i32> %94, %89
  %rdx.shuf = shufflevector <4 x i32> %95, <4 x i32> undef, <4 x i32> <i32 2, i32 3, i32 undef, i32 undef>
  %bin.rdx = add <4 x i32> %95, %rdx.shuf
  %rdx.shuf13 = shufflevector <4 x i32> %bin.rdx, <4 x i32> undef, <4 x i32> <i32 1, i32 undef, i32 undef, i32 undef>
  %bin.rdx14 = add <4 x i32> %bin.rdx, %rdx.shuf13
  %96 = extractelement <4 x i32> %bin.rdx14, i32 0
  %polly.indvar_next = add nuw nsw i64 %polly.indvar, 1
  %exitcond11 = icmp eq i64 %polly.indvar_next, 16
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
  %arrayidx5 = getelementptr inbounds [1024 x [1024 x i32]], [1024 x [1024 x i32]]* @Z, i64 0, i64 %indvars.iv6, i64 %indvars.iv
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
declare i32 @fprintf(%struct._IO_FILE* nocapture, i8* nocapture readonly, ...) #2

; Function Attrs: nounwind uwtable
define i32 @main() #1 {
entry:
  %y_t = alloca [1024 x i32], align 16
  br label %polly.loop_preheader2.i

polly.loop_exit3.i:                               ; preds = %polly.loop_exit9.i
  %polly.indvar_next.i = add nuw nsw i64 %polly.indvar.i, 1
  %exitcond22.i = icmp eq i64 %polly.indvar_next.i, 32
  br i1 %exitcond22.i, label %polly.loop_preheader.preheader, label %polly.loop_preheader2.i

polly.loop_preheader.preheader:                   ; preds = %polly.loop_exit3.i
  br label %polly.loop_preheader

polly.loop_exit9.i:                               ; preds = %vector.body
  %polly.indvar_next5.i = add nuw nsw i64 %polly.indvar4.i, 1
  %exitcond21.i = icmp eq i64 %polly.indvar_next5.i, 32
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
  %10 = getelementptr [1024 x [1024 x i32]], [1024 x [1024 x i32]]* @X, i64 0, i64 %9, i64 %1
  %11 = bitcast i32* %10 to <4 x i32>*
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* %11, align 16, !alias.scope !19, !noalias !21
  %12 = getelementptr [1024 x [1024 x i32]], [1024 x [1024 x i32]]* @Y, i64 0, i64 %9, i64 %1
  %13 = bitcast i32* %12 to <4 x i32>*
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* %13, align 16, !alias.scope !22, !noalias !23
  %14 = getelementptr [1024 x [1024 x i32]], [1024 x [1024 x i32]]* @X, i64 0, i64 %9, i64 %2
  %15 = bitcast i32* %14 to <4 x i32>*
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* %15, align 16, !alias.scope !19, !noalias !21
  %16 = getelementptr [1024 x [1024 x i32]], [1024 x [1024 x i32]]* @Y, i64 0, i64 %9, i64 %2
  %17 = bitcast i32* %16 to <4 x i32>*
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* %17, align 16, !alias.scope !22, !noalias !23
  %18 = getelementptr [1024 x [1024 x i32]], [1024 x [1024 x i32]]* @X, i64 0, i64 %9, i64 %3
  %19 = bitcast i32* %18 to <4 x i32>*
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* %19, align 16, !alias.scope !19, !noalias !21
  %20 = getelementptr [1024 x [1024 x i32]], [1024 x [1024 x i32]]* @Y, i64 0, i64 %9, i64 %3
  %21 = bitcast i32* %20 to <4 x i32>*
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* %21, align 16, !alias.scope !22, !noalias !23
  %22 = getelementptr [1024 x [1024 x i32]], [1024 x [1024 x i32]]* @X, i64 0, i64 %9, i64 %4
  %23 = bitcast i32* %22 to <4 x i32>*
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* %23, align 16, !alias.scope !19, !noalias !21
  %24 = getelementptr [1024 x [1024 x i32]], [1024 x [1024 x i32]]* @Y, i64 0, i64 %9, i64 %4
  %25 = bitcast i32* %24 to <4 x i32>*
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* %25, align 16, !alias.scope !22, !noalias !23
  %26 = getelementptr [1024 x [1024 x i32]], [1024 x [1024 x i32]]* @X, i64 0, i64 %9, i64 %5
  %27 = bitcast i32* %26 to <4 x i32>*
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* %27, align 16, !alias.scope !19, !noalias !21
  %28 = getelementptr [1024 x [1024 x i32]], [1024 x [1024 x i32]]* @Y, i64 0, i64 %9, i64 %5
  %29 = bitcast i32* %28 to <4 x i32>*
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* %29, align 16, !alias.scope !22, !noalias !23
  %30 = getelementptr [1024 x [1024 x i32]], [1024 x [1024 x i32]]* @X, i64 0, i64 %9, i64 %6
  %31 = bitcast i32* %30 to <4 x i32>*
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* %31, align 16, !alias.scope !19, !noalias !21
  %32 = getelementptr [1024 x [1024 x i32]], [1024 x [1024 x i32]]* @Y, i64 0, i64 %9, i64 %6
  %33 = bitcast i32* %32 to <4 x i32>*
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* %33, align 16, !alias.scope !22, !noalias !23
  %34 = getelementptr [1024 x [1024 x i32]], [1024 x [1024 x i32]]* @X, i64 0, i64 %9, i64 %7
  %35 = bitcast i32* %34 to <4 x i32>*
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* %35, align 16, !alias.scope !19, !noalias !21
  %36 = getelementptr [1024 x [1024 x i32]], [1024 x [1024 x i32]]* @Y, i64 0, i64 %9, i64 %7
  %37 = bitcast i32* %36 to <4 x i32>*
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* %37, align 16, !alias.scope !22, !noalias !23
  %38 = getelementptr [1024 x [1024 x i32]], [1024 x [1024 x i32]]* @X, i64 0, i64 %9, i64 %8
  %39 = bitcast i32* %38 to <4 x i32>*
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* %39, align 16, !alias.scope !19, !noalias !21
  %40 = getelementptr [1024 x [1024 x i32]], [1024 x [1024 x i32]]* @Y, i64 0, i64 %9, i64 %8
  %41 = bitcast i32* %40 to <4 x i32>*
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* %41, align 16, !alias.scope !22, !noalias !23
  %polly.indvar_next11.i = add nuw nsw i64 %polly.indvar10.i, 1
  %exitcond20.i = icmp eq i64 %polly.indvar_next11.i, 32
  br i1 %exitcond20.i, label %polly.loop_exit9.i, label %polly.loop_preheader14.i

for.body10:                                       ; preds = %for.body10.preheader, %dot.exit
  %indvars.iv4 = phi i64 [ %indvars.iv.next5, %dot.exit ], [ 0, %for.body10.preheader ]
  br label %polly.loop_preheader2.i9

polly.loop_preheader2.i9:                         ; preds = %vector.body12, %for.body10
  %sum.03.phiops.0.i = phi i32 [ 0, %for.body10 ], [ %138, %vector.body12 ]
  %polly.indvar.i7 = phi i64 [ 0, %for.body10 ], [ %polly.indvar_next.i3, %vector.body12 ]
  %42 = shl i64 %polly.indvar.i7, 6
  %scevgep.i8 = getelementptr [1024 x [1024 x i32]], [1024 x [1024 x i32]]* @X, i64 0, i64 %indvars.iv4, i64 %42
  %scevgep8.i = getelementptr [1024 x i32], [1024 x i32]* %y_t, i64 0, i64 %42
  br label %vector.body12

vector.body12:                                    ; preds = %polly.loop_preheader2.i9
  %43 = insertelement <4 x i32> <i32 undef, i32 0, i32 0, i32 0>, i32 %sum.03.phiops.0.i, i32 0
  %44 = bitcast i32* %scevgep.i8 to <4 x i32>*
  %wide.load = load <4 x i32>, <4 x i32>* %44, align 16, !alias.scope !24, !noalias !29
  %45 = bitcast i32* %scevgep8.i to <4 x i32>*
  %wide.load24 = load <4 x i32>, <4 x i32>* %45, align 16, !alias.scope !35, !noalias !36
  %46 = mul nsw <4 x i32> %wide.load24, %wide.load
  %47 = add nsw <4 x i32> %46, %43
  %48 = getelementptr i32, i32* %scevgep.i8, i64 4
  %49 = bitcast i32* %48 to <4 x i32>*
  %wide.load.1 = load <4 x i32>, <4 x i32>* %49, align 16, !alias.scope !24, !noalias !29
  %50 = getelementptr i32, i32* %scevgep8.i, i64 4
  %51 = bitcast i32* %50 to <4 x i32>*
  %wide.load24.1 = load <4 x i32>, <4 x i32>* %51, align 16, !alias.scope !35, !noalias !36
  %52 = mul nsw <4 x i32> %wide.load24.1, %wide.load.1
  %53 = add nsw <4 x i32> %52, %47
  %54 = getelementptr i32, i32* %scevgep.i8, i64 8
  %55 = bitcast i32* %54 to <4 x i32>*
  %wide.load.2 = load <4 x i32>, <4 x i32>* %55, align 16, !alias.scope !24, !noalias !29
  %56 = getelementptr i32, i32* %scevgep8.i, i64 8
  %57 = bitcast i32* %56 to <4 x i32>*
  %wide.load24.2 = load <4 x i32>, <4 x i32>* %57, align 16, !alias.scope !35, !noalias !36
  %58 = mul nsw <4 x i32> %wide.load24.2, %wide.load.2
  %59 = add nsw <4 x i32> %58, %53
  %60 = getelementptr i32, i32* %scevgep.i8, i64 12
  %61 = bitcast i32* %60 to <4 x i32>*
  %wide.load.3 = load <4 x i32>, <4 x i32>* %61, align 16, !alias.scope !24, !noalias !29
  %62 = getelementptr i32, i32* %scevgep8.i, i64 12
  %63 = bitcast i32* %62 to <4 x i32>*
  %wide.load24.3 = load <4 x i32>, <4 x i32>* %63, align 16, !alias.scope !35, !noalias !36
  %64 = mul nsw <4 x i32> %wide.load24.3, %wide.load.3
  %65 = add nsw <4 x i32> %64, %59
  %66 = getelementptr i32, i32* %scevgep.i8, i64 16
  %67 = bitcast i32* %66 to <4 x i32>*
  %wide.load.4 = load <4 x i32>, <4 x i32>* %67, align 16, !alias.scope !24, !noalias !29
  %68 = getelementptr i32, i32* %scevgep8.i, i64 16
  %69 = bitcast i32* %68 to <4 x i32>*
  %wide.load24.4 = load <4 x i32>, <4 x i32>* %69, align 16, !alias.scope !35, !noalias !36
  %70 = mul nsw <4 x i32> %wide.load24.4, %wide.load.4
  %71 = add nsw <4 x i32> %70, %65
  %72 = getelementptr i32, i32* %scevgep.i8, i64 20
  %73 = bitcast i32* %72 to <4 x i32>*
  %wide.load.5 = load <4 x i32>, <4 x i32>* %73, align 16, !alias.scope !24, !noalias !29
  %74 = getelementptr i32, i32* %scevgep8.i, i64 20
  %75 = bitcast i32* %74 to <4 x i32>*
  %wide.load24.5 = load <4 x i32>, <4 x i32>* %75, align 16, !alias.scope !35, !noalias !36
  %76 = mul nsw <4 x i32> %wide.load24.5, %wide.load.5
  %77 = add nsw <4 x i32> %76, %71
  %78 = getelementptr i32, i32* %scevgep.i8, i64 24
  %79 = bitcast i32* %78 to <4 x i32>*
  %wide.load.6 = load <4 x i32>, <4 x i32>* %79, align 16, !alias.scope !24, !noalias !29
  %80 = getelementptr i32, i32* %scevgep8.i, i64 24
  %81 = bitcast i32* %80 to <4 x i32>*
  %wide.load24.6 = load <4 x i32>, <4 x i32>* %81, align 16, !alias.scope !35, !noalias !36
  %82 = mul nsw <4 x i32> %wide.load24.6, %wide.load.6
  %83 = add nsw <4 x i32> %82, %77
  %84 = getelementptr i32, i32* %scevgep.i8, i64 28
  %85 = bitcast i32* %84 to <4 x i32>*
  %wide.load.7 = load <4 x i32>, <4 x i32>* %85, align 16, !alias.scope !24, !noalias !29
  %86 = getelementptr i32, i32* %scevgep8.i, i64 28
  %87 = bitcast i32* %86 to <4 x i32>*
  %wide.load24.7 = load <4 x i32>, <4 x i32>* %87, align 16, !alias.scope !35, !noalias !36
  %88 = mul nsw <4 x i32> %wide.load24.7, %wide.load.7
  %89 = add nsw <4 x i32> %88, %83
  %90 = getelementptr i32, i32* %scevgep.i8, i64 32
  %91 = bitcast i32* %90 to <4 x i32>*
  %wide.load.8 = load <4 x i32>, <4 x i32>* %91, align 16, !alias.scope !24, !noalias !29
  %92 = getelementptr i32, i32* %scevgep8.i, i64 32
  %93 = bitcast i32* %92 to <4 x i32>*
  %wide.load24.8 = load <4 x i32>, <4 x i32>* %93, align 16, !alias.scope !35, !noalias !36
  %94 = mul nsw <4 x i32> %wide.load24.8, %wide.load.8
  %95 = add nsw <4 x i32> %94, %89
  %96 = getelementptr i32, i32* %scevgep.i8, i64 36
  %97 = bitcast i32* %96 to <4 x i32>*
  %wide.load.9 = load <4 x i32>, <4 x i32>* %97, align 16, !alias.scope !24, !noalias !29
  %98 = getelementptr i32, i32* %scevgep8.i, i64 36
  %99 = bitcast i32* %98 to <4 x i32>*
  %wide.load24.9 = load <4 x i32>, <4 x i32>* %99, align 16, !alias.scope !35, !noalias !36
  %100 = mul nsw <4 x i32> %wide.load24.9, %wide.load.9
  %101 = add nsw <4 x i32> %100, %95
  %102 = getelementptr i32, i32* %scevgep.i8, i64 40
  %103 = bitcast i32* %102 to <4 x i32>*
  %wide.load.10 = load <4 x i32>, <4 x i32>* %103, align 16, !alias.scope !24, !noalias !29
  %104 = getelementptr i32, i32* %scevgep8.i, i64 40
  %105 = bitcast i32* %104 to <4 x i32>*
  %wide.load24.10 = load <4 x i32>, <4 x i32>* %105, align 16, !alias.scope !35, !noalias !36
  %106 = mul nsw <4 x i32> %wide.load24.10, %wide.load.10
  %107 = add nsw <4 x i32> %106, %101
  %108 = getelementptr i32, i32* %scevgep.i8, i64 44
  %109 = bitcast i32* %108 to <4 x i32>*
  %wide.load.11 = load <4 x i32>, <4 x i32>* %109, align 16, !alias.scope !24, !noalias !29
  %110 = getelementptr i32, i32* %scevgep8.i, i64 44
  %111 = bitcast i32* %110 to <4 x i32>*
  %wide.load24.11 = load <4 x i32>, <4 x i32>* %111, align 16, !alias.scope !35, !noalias !36
  %112 = mul nsw <4 x i32> %wide.load24.11, %wide.load.11
  %113 = add nsw <4 x i32> %112, %107
  %114 = getelementptr i32, i32* %scevgep.i8, i64 48
  %115 = bitcast i32* %114 to <4 x i32>*
  %wide.load.12 = load <4 x i32>, <4 x i32>* %115, align 16, !alias.scope !24, !noalias !29
  %116 = getelementptr i32, i32* %scevgep8.i, i64 48
  %117 = bitcast i32* %116 to <4 x i32>*
  %wide.load24.12 = load <4 x i32>, <4 x i32>* %117, align 16, !alias.scope !35, !noalias !36
  %118 = mul nsw <4 x i32> %wide.load24.12, %wide.load.12
  %119 = add nsw <4 x i32> %118, %113
  %120 = getelementptr i32, i32* %scevgep.i8, i64 52
  %121 = bitcast i32* %120 to <4 x i32>*
  %wide.load.13 = load <4 x i32>, <4 x i32>* %121, align 16, !alias.scope !24, !noalias !29
  %122 = getelementptr i32, i32* %scevgep8.i, i64 52
  %123 = bitcast i32* %122 to <4 x i32>*
  %wide.load24.13 = load <4 x i32>, <4 x i32>* %123, align 16, !alias.scope !35, !noalias !36
  %124 = mul nsw <4 x i32> %wide.load24.13, %wide.load.13
  %125 = add nsw <4 x i32> %124, %119
  %126 = getelementptr i32, i32* %scevgep.i8, i64 56
  %127 = bitcast i32* %126 to <4 x i32>*
  %wide.load.14 = load <4 x i32>, <4 x i32>* %127, align 16, !alias.scope !24, !noalias !29
  %128 = getelementptr i32, i32* %scevgep8.i, i64 56
  %129 = bitcast i32* %128 to <4 x i32>*
  %wide.load24.14 = load <4 x i32>, <4 x i32>* %129, align 16, !alias.scope !35, !noalias !36
  %130 = mul nsw <4 x i32> %wide.load24.14, %wide.load.14
  %131 = add nsw <4 x i32> %130, %125
  %132 = getelementptr i32, i32* %scevgep.i8, i64 60
  %133 = bitcast i32* %132 to <4 x i32>*
  %wide.load.15 = load <4 x i32>, <4 x i32>* %133, align 16, !alias.scope !24, !noalias !29
  %134 = getelementptr i32, i32* %scevgep8.i, i64 60
  %135 = bitcast i32* %134 to <4 x i32>*
  %wide.load24.15 = load <4 x i32>, <4 x i32>* %135, align 16, !alias.scope !35, !noalias !36
  %136 = mul nsw <4 x i32> %wide.load24.15, %wide.load.15
  %137 = add nsw <4 x i32> %136, %131
  %rdx.shuf = shufflevector <4 x i32> %137, <4 x i32> undef, <4 x i32> <i32 2, i32 3, i32 undef, i32 undef>
  %bin.rdx = add <4 x i32> %137, %rdx.shuf
  %rdx.shuf25 = shufflevector <4 x i32> %bin.rdx, <4 x i32> undef, <4 x i32> <i32 1, i32 undef, i32 undef, i32 undef>
  %bin.rdx26 = add <4 x i32> %bin.rdx, %rdx.shuf25
  %138 = extractelement <4 x i32> %bin.rdx26, i32 0
  %polly.indvar_next.i3 = add nuw nsw i64 %polly.indvar.i7, 1
  %exitcond11.i = icmp eq i64 %polly.indvar_next.i3, 16
  br i1 %exitcond11.i, label %dot.exit, label %polly.loop_preheader2.i9

dot.exit:                                         ; preds = %vector.body12
  %.lcssa = phi i32 [ %138, %vector.body12 ]
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
  %139 = load i32, i32* getelementptr inbounds ([1024 x [1024 x i32]], [1024 x [1024 x i32]]* @Z, i64 0, i64 1023, i64 1023), align 4
  %call25 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([46 x i8], [46 x i8]* @.str.2, i64 0, i64 0), i32 1024, i32 1024, i32 1023, i32 1023, i32 %139) #5
  ret i32 0

polly.stmt.for.body3:                             ; preds = %polly.stmt.for.body3, %polly.loop_preheader
  %polly.indvar = phi i64 [ 0, %polly.loop_preheader ], [ %polly.indvar_next.3, %polly.stmt.for.body3 ]
  %140 = shl i64 %polly.indvar, 10
  %scevgep1 = getelementptr i32, i32* %scevgep, i64 %140
  %_p_scalar_ = load i32, i32* %scevgep1, align 4, !alias.scope !37, !noalias !39
  %scevgep2 = getelementptr [1024 x i32], [1024 x i32]* %y_t, i64 0, i64 %polly.indvar
  store i32 %_p_scalar_, i32* %scevgep2, align 16, !alias.scope !40, !noalias !41
  %polly.indvar_next = or i64 %polly.indvar, 1
  %141 = shl i64 %polly.indvar_next, 10
  %scevgep1.1 = getelementptr i32, i32* %scevgep, i64 %141
  %_p_scalar_.1 = load i32, i32* %scevgep1.1, align 4, !alias.scope !37, !noalias !39
  %scevgep2.1 = getelementptr [1024 x i32], [1024 x i32]* %y_t, i64 0, i64 %polly.indvar_next
  store i32 %_p_scalar_.1, i32* %scevgep2.1, align 4, !alias.scope !40, !noalias !41
  %polly.indvar_next.1 = or i64 %polly.indvar, 2
  %142 = shl i64 %polly.indvar_next.1, 10
  %scevgep1.2 = getelementptr i32, i32* %scevgep, i64 %142
  %_p_scalar_.2 = load i32, i32* %scevgep1.2, align 4, !alias.scope !37, !noalias !39
  %scevgep2.2 = getelementptr [1024 x i32], [1024 x i32]* %y_t, i64 0, i64 %polly.indvar_next.1
  store i32 %_p_scalar_.2, i32* %scevgep2.2, align 8, !alias.scope !40, !noalias !41
  %polly.indvar_next.2 = or i64 %polly.indvar, 3
  %143 = shl i64 %polly.indvar_next.2, 10
  %scevgep1.3 = getelementptr i32, i32* %scevgep, i64 %143
  %_p_scalar_.3 = load i32, i32* %scevgep1.3, align 4, !alias.scope !37, !noalias !39
  %scevgep2.3 = getelementptr [1024 x i32], [1024 x i32]* %y_t, i64 0, i64 %polly.indvar_next.2
  store i32 %_p_scalar_.3, i32* %scevgep2.3, align 4, !alias.scope !40, !noalias !41
  %polly.indvar_next.3 = add nsw i64 %polly.indvar, 4
  %exitcond.3 = icmp eq i64 %polly.indvar_next.3, 1024
  br i1 %exitcond.3, label %for.body10.preheader, label %polly.stmt.for.body3

for.body10.preheader:                             ; preds = %polly.stmt.for.body3
  br label %for.body10

polly.loop_preheader:                             ; preds = %polly.loop_preheader.preheader, %for.inc22
  %indvars.iv7 = phi i64 [ %indvars.iv.next8, %for.inc22 ], [ 0, %polly.loop_preheader.preheader ]
  %scevgep = getelementptr [1024 x [1024 x i32]], [1024 x [1024 x i32]]* @Y, i64 0, i64 0, i64 %indvars.iv7
  br label %polly.stmt.for.body3
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
!11 = distinct !{!11, !12, !"polly.alias.scope.a"}
!12 = distinct !{!12, !"polly.alias.scope.domain"}
!13 = !{!14, !15, !16, !17}
!14 = distinct !{!14, !12, !"polly.alias.scope.sum.03"}
!15 = distinct !{!15, !12, !"polly.alias.scope.sum.12"}
!16 = distinct !{!16, !12, !"polly.alias.scope.b"}
!17 = distinct !{!17, !12, !"polly.alias.scope.add9.lcssa"}
!18 = !{!14, !15, !11, !17}
!19 = distinct !{!19, !20, !"polly.alias.scope.X"}
!20 = distinct !{!20, !"polly.alias.scope.domain"}
!21 = !{!22}
!22 = distinct !{!22, !20, !"polly.alias.scope.Y"}
!23 = !{!19}
!24 = !{!25, !26, !"polly.alias.scope.a", !27}
!25 = distinct !{!25, !26, !"polly.alias.scope.a"}
!26 = distinct !{!26, !"polly.alias.scope.domain"}
!27 = distinct !{!27, !28, !"dot: %a"}
!28 = distinct !{!28, !"dot"}
!29 = !{!30, !31, !32, !33, !34}
!30 = distinct !{!30, !26, !"polly.alias.scope.sum.03"}
!31 = distinct !{!31, !26, !"polly.alias.scope.sum.12"}
!32 = distinct !{!32, !26, !"polly.alias.scope.b"}
!33 = distinct !{!33, !26, !"polly.alias.scope.add9.lcssa"}
!34 = distinct !{!34, !28, !"dot: %b"}
!35 = !{!32, !26, !"polly.alias.scope.b", !34}
!36 = !{!30, !31, !25, !33, !27}
!37 = distinct !{!37, !38, !"polly.alias.scope.Y"}
!38 = distinct !{!38, !"polly.alias.scope.domain"}
!39 = !{!40}
!40 = distinct !{!40, !38, !"polly.alias.scope.y_t"}
!41 = !{!37}
