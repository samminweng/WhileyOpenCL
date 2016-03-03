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

; Function Attrs: nounwind uwtable
define void @init() #0 {
entry:
  %polly.par.userContext = alloca {}, align 8
  %0 = bitcast {}* %polly.par.userContext to i8*
  call void @llvm.lifetime.start(i64 0, i8* %0)
  call void @GOMP_parallel_loop_runtime_start(void (i8*)* nonnull @init_polly_subfn, i8* %0, i32 0, i64 0, i64 64, i64 1) #4
  call void @init_polly_subfn(i8* %0) #4
  call void @GOMP_parallel_end() #4
  call void @llvm.lifetime.end(i64 8, i8* %0)
  ret void
}

; Function Attrs: nounwind uwtable
define i32* @transpose(i32** noalias nocapture readnone %y, i32 %index) #0 {
entry:
  %polly.par.userContext3 = alloca { i32, i8* }
  %polly.par.userContext = alloca { i32, i8* }, align 8
  %call = tail call noalias i8* @malloc(i64 8192) #4
  %0 = bitcast i8* %call to i32*
  %1 = icmp ult i32 %index, 2048
  br i1 %1, label %polly.parallel.for, label %for.cond1.preheader.preheader

for.cond1.preheader.preheader:                    ; preds = %entry
  %idxprom = sext i32 %index to i64
  br label %polly.split_new_and_old

polly.split_new_and_old:                          ; preds = %for.cond1.preheader.preheader
  %2 = sext i32 %index to i64
  %3 = icmp sge i64 %2, 0
  %4 = sext i32 %index to i64
  %5 = icmp sle i64 %4, 2047
  %6 = and i1 %3, %5
  br i1 %6, label %polly.start, label %for.cond1.preheader

for.cond1.preheader:                              ; preds = %polly.split_new_and_old, %for.inc10
  %indvars.iv5 = phi i64 [ %indvars.iv.next6, %for.inc10 ], [ 0, %polly.split_new_and_old ]
  %7 = shl i64 %indvars.iv5, 6
  br label %for.body3

for.body3:                                        ; preds = %for.body3, %for.cond1.preheader
  %indvars.iv = phi i64 [ 0, %for.cond1.preheader ], [ %indvars.iv.next.3, %for.body3 ]
  %8 = add nuw nsw i64 %indvars.iv, %7
  %arrayidx5 = getelementptr inbounds [2048 x [2048 x i32]], [2048 x [2048 x i32]]* @Y, i64 0, i64 %8, i64 %idxprom
  %9 = load i32, i32* %arrayidx5, align 4
  %arrayidx9 = getelementptr inbounds i32, i32* %0, i64 %8
  store i32 %9, i32* %arrayidx9, align 4
  %indvars.iv.next = or i64 %indvars.iv, 1
  %10 = add nuw nsw i64 %indvars.iv.next, %7
  %arrayidx5.1 = getelementptr inbounds [2048 x [2048 x i32]], [2048 x [2048 x i32]]* @Y, i64 0, i64 %10, i64 %idxprom
  %11 = load i32, i32* %arrayidx5.1, align 4
  %arrayidx9.1 = getelementptr inbounds i32, i32* %0, i64 %10
  store i32 %11, i32* %arrayidx9.1, align 4
  %indvars.iv.next.1 = or i64 %indvars.iv, 2
  %12 = add nuw nsw i64 %indvars.iv.next.1, %7
  %arrayidx5.2 = getelementptr inbounds [2048 x [2048 x i32]], [2048 x [2048 x i32]]* @Y, i64 0, i64 %12, i64 %idxprom
  %13 = load i32, i32* %arrayidx5.2, align 4
  %arrayidx9.2 = getelementptr inbounds i32, i32* %0, i64 %12
  store i32 %13, i32* %arrayidx9.2, align 4
  %indvars.iv.next.2 = or i64 %indvars.iv, 3
  %14 = add nuw nsw i64 %indvars.iv.next.2, %7
  %arrayidx5.3 = getelementptr inbounds [2048 x [2048 x i32]], [2048 x [2048 x i32]]* @Y, i64 0, i64 %14, i64 %idxprom
  %15 = load i32, i32* %arrayidx5.3, align 4
  %arrayidx9.3 = getelementptr inbounds i32, i32* %0, i64 %14
  store i32 %15, i32* %arrayidx9.3, align 4
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  %exitcond.3 = icmp eq i64 %indvars.iv.next.3, 64
  br i1 %exitcond.3, label %for.inc10, label %for.body3

for.inc10:                                        ; preds = %for.body3
  %indvars.iv.next6 = add nuw nsw i64 %indvars.iv5, 1
  %exitcond9 = icmp eq i64 %indvars.iv.next6, 32
  br i1 %exitcond9, label %for.end12.loopexit, label %for.cond1.preheader

for.end12.loopexit:                               ; preds = %for.inc10
  br label %polly.merge_new_and_old

polly.merge_new_and_old:                          ; preds = %polly.exiting, %for.end12.loopexit
  br label %for.end12

for.end12:                                        ; preds = %polly.merge_new_and_old, %polly.parallel.for
  ret i32* %0

polly.parallel.for:                               ; preds = %entry
  %16 = bitcast { i32, i8* }* %polly.par.userContext to i8*
  call void @llvm.lifetime.start(i64 16, i8* %16)
  %polly.subfn.storeaddr.index = getelementptr inbounds { i32, i8* }, { i32, i8* }* %polly.par.userContext, i64 0, i32 0
  store i32 %index, i32* %polly.subfn.storeaddr.index, align 8
  %polly.subfn.storeaddr.call = getelementptr inbounds { i32, i8* }, { i32, i8* }* %polly.par.userContext, i64 0, i32 1
  store i8* %call, i8** %polly.subfn.storeaddr.call, align 8
  call void @GOMP_parallel_loop_runtime_start(void (i8*)* nonnull @transpose_polly_subfn, i8* %16, i32 0, i64 0, i64 2, i64 1) #4
  call void @transpose_polly_subfn(i8* %16) #4
  call void @GOMP_parallel_end() #4
  call void @llvm.lifetime.end(i64 8, i8* %16)
  br label %for.end12

polly.start:                                      ; preds = %polly.split_new_and_old
  br label %polly.parallel.for2

polly.parallel.for2:                              ; preds = %polly.start
  %17 = bitcast { i32, i8* }* %polly.par.userContext3 to i8*
  call void @llvm.lifetime.start(i64 16, i8* %17)
  %polly.subfn.storeaddr.index4 = getelementptr inbounds { i32, i8* }, { i32, i8* }* %polly.par.userContext3, i32 0, i32 0
  store i32 %index, i32* %polly.subfn.storeaddr.index4
  %polly.subfn.storeaddr.call5 = getelementptr inbounds { i32, i8* }, { i32, i8* }* %polly.par.userContext3, i32 0, i32 1
  store i8* %call, i8** %polly.subfn.storeaddr.call5
  %polly.par.userContext6 = bitcast { i32, i8* }* %polly.par.userContext3 to i8*
  call void @GOMP_parallel_loop_runtime_start(void (i8*)* @transpose_polly_subfn_1, i8* %polly.par.userContext6, i32 0, i64 0, i64 32, i64 1)
  call void @transpose_polly_subfn_1(i8* %polly.par.userContext6)
  call void @GOMP_parallel_end()
  %18 = bitcast { i32, i8* }* %polly.par.userContext3 to i8*
  call void @llvm.lifetime.end(i64 8, i8* %18)
  br label %polly.exiting

polly.exiting:                                    ; preds = %polly.parallel.for2
  br label %polly.merge_new_and_old
}

; Function Attrs: nounwind
declare noalias i8* @malloc(i64) #1

; Function Attrs: norecurse nounwind readonly uwtable
define i32 @dot(i32* noalias nocapture readonly %a, i32* noalias nocapture readonly %b) #2 {
entry:
  %sum = alloca [64 x i32], align 16
  br label %polly.split_new_and_old

polly.merge_new_and_old:                          ; preds = %polly.exiting, %vector.body
  br label %polly.stmt.for.inc22.preheader

polly.stmt.for.inc22.preheader:                   ; preds = %polly.merge_new_and_old
  %scevgep18 = getelementptr [64 x i32], [64 x i32]* %sum, i64 0, i64 0
  %_p_scalar_19 = load i32, i32* %scevgep18, align 16, !alias.scope !1, !noalias !3
  %scevgep18.1 = getelementptr [64 x i32], [64 x i32]* %sum, i64 0, i64 1
  %_p_scalar_19.1 = load i32, i32* %scevgep18.1, align 4, !alias.scope !1, !noalias !3
  %p_add21.1 = add nsw i32 %_p_scalar_19.1, %_p_scalar_19
  %scevgep18.2 = getelementptr [64 x i32], [64 x i32]* %sum, i64 0, i64 2
  %_p_scalar_19.2 = load i32, i32* %scevgep18.2, align 8, !alias.scope !1, !noalias !3
  %p_add21.2 = add nsw i32 %_p_scalar_19.2, %p_add21.1
  %scevgep18.3 = getelementptr [64 x i32], [64 x i32]* %sum, i64 0, i64 3
  %_p_scalar_19.3 = load i32, i32* %scevgep18.3, align 4, !alias.scope !1, !noalias !3
  %p_add21.3 = add nsw i32 %_p_scalar_19.3, %p_add21.2
  %scevgep18.4 = getelementptr [64 x i32], [64 x i32]* %sum, i64 0, i64 4
  %_p_scalar_19.4 = load i32, i32* %scevgep18.4, align 16, !alias.scope !1, !noalias !3
  %p_add21.4 = add nsw i32 %_p_scalar_19.4, %p_add21.3
  %scevgep18.5 = getelementptr [64 x i32], [64 x i32]* %sum, i64 0, i64 5
  %_p_scalar_19.5 = load i32, i32* %scevgep18.5, align 4, !alias.scope !1, !noalias !3
  %p_add21.5 = add nsw i32 %_p_scalar_19.5, %p_add21.4
  %scevgep18.6 = getelementptr [64 x i32], [64 x i32]* %sum, i64 0, i64 6
  %_p_scalar_19.6 = load i32, i32* %scevgep18.6, align 8, !alias.scope !1, !noalias !3
  %p_add21.6 = add nsw i32 %_p_scalar_19.6, %p_add21.5
  %scevgep18.7 = getelementptr [64 x i32], [64 x i32]* %sum, i64 0, i64 7
  %_p_scalar_19.7 = load i32, i32* %scevgep18.7, align 4, !alias.scope !1, !noalias !3
  %p_add21.7 = add nsw i32 %_p_scalar_19.7, %p_add21.6
  %scevgep18.8 = getelementptr [64 x i32], [64 x i32]* %sum, i64 0, i64 8
  %_p_scalar_19.8 = load i32, i32* %scevgep18.8, align 16, !alias.scope !1, !noalias !3
  %p_add21.8 = add nsw i32 %_p_scalar_19.8, %p_add21.7
  %scevgep18.9 = getelementptr [64 x i32], [64 x i32]* %sum, i64 0, i64 9
  %_p_scalar_19.9 = load i32, i32* %scevgep18.9, align 4, !alias.scope !1, !noalias !3
  %p_add21.9 = add nsw i32 %_p_scalar_19.9, %p_add21.8
  %scevgep18.10 = getelementptr [64 x i32], [64 x i32]* %sum, i64 0, i64 10
  %_p_scalar_19.10 = load i32, i32* %scevgep18.10, align 8, !alias.scope !1, !noalias !3
  %p_add21.10 = add nsw i32 %_p_scalar_19.10, %p_add21.9
  %scevgep18.11 = getelementptr [64 x i32], [64 x i32]* %sum, i64 0, i64 11
  %_p_scalar_19.11 = load i32, i32* %scevgep18.11, align 4, !alias.scope !1, !noalias !3
  %p_add21.11 = add nsw i32 %_p_scalar_19.11, %p_add21.10
  %scevgep18.12 = getelementptr [64 x i32], [64 x i32]* %sum, i64 0, i64 12
  %_p_scalar_19.12 = load i32, i32* %scevgep18.12, align 16, !alias.scope !1, !noalias !3
  %p_add21.12 = add nsw i32 %_p_scalar_19.12, %p_add21.11
  %scevgep18.13 = getelementptr [64 x i32], [64 x i32]* %sum, i64 0, i64 13
  %_p_scalar_19.13 = load i32, i32* %scevgep18.13, align 4, !alias.scope !1, !noalias !3
  %p_add21.13 = add nsw i32 %_p_scalar_19.13, %p_add21.12
  %scevgep18.14 = getelementptr [64 x i32], [64 x i32]* %sum, i64 0, i64 14
  %_p_scalar_19.14 = load i32, i32* %scevgep18.14, align 8, !alias.scope !1, !noalias !3
  %p_add21.14 = add nsw i32 %_p_scalar_19.14, %p_add21.13
  %scevgep18.15 = getelementptr [64 x i32], [64 x i32]* %sum, i64 0, i64 15
  %_p_scalar_19.15 = load i32, i32* %scevgep18.15, align 4, !alias.scope !1, !noalias !3
  %p_add21.15 = add nsw i32 %_p_scalar_19.15, %p_add21.14
  %scevgep18.16 = getelementptr [64 x i32], [64 x i32]* %sum, i64 0, i64 16
  %_p_scalar_19.16 = load i32, i32* %scevgep18.16, align 16, !alias.scope !1, !noalias !3
  %p_add21.16 = add nsw i32 %_p_scalar_19.16, %p_add21.15
  %scevgep18.17 = getelementptr [64 x i32], [64 x i32]* %sum, i64 0, i64 17
  %_p_scalar_19.17 = load i32, i32* %scevgep18.17, align 4, !alias.scope !1, !noalias !3
  %p_add21.17 = add nsw i32 %_p_scalar_19.17, %p_add21.16
  %scevgep18.18 = getelementptr [64 x i32], [64 x i32]* %sum, i64 0, i64 18
  %_p_scalar_19.18 = load i32, i32* %scevgep18.18, align 8, !alias.scope !1, !noalias !3
  %p_add21.18 = add nsw i32 %_p_scalar_19.18, %p_add21.17
  %scevgep18.19 = getelementptr [64 x i32], [64 x i32]* %sum, i64 0, i64 19
  %_p_scalar_19.19 = load i32, i32* %scevgep18.19, align 4, !alias.scope !1, !noalias !3
  %p_add21.19 = add nsw i32 %_p_scalar_19.19, %p_add21.18
  %scevgep18.20 = getelementptr [64 x i32], [64 x i32]* %sum, i64 0, i64 20
  %_p_scalar_19.20 = load i32, i32* %scevgep18.20, align 16, !alias.scope !1, !noalias !3
  %p_add21.20 = add nsw i32 %_p_scalar_19.20, %p_add21.19
  %scevgep18.21 = getelementptr [64 x i32], [64 x i32]* %sum, i64 0, i64 21
  %_p_scalar_19.21 = load i32, i32* %scevgep18.21, align 4, !alias.scope !1, !noalias !3
  %p_add21.21 = add nsw i32 %_p_scalar_19.21, %p_add21.20
  %scevgep18.22 = getelementptr [64 x i32], [64 x i32]* %sum, i64 0, i64 22
  %_p_scalar_19.22 = load i32, i32* %scevgep18.22, align 8, !alias.scope !1, !noalias !3
  %p_add21.22 = add nsw i32 %_p_scalar_19.22, %p_add21.21
  %scevgep18.23 = getelementptr [64 x i32], [64 x i32]* %sum, i64 0, i64 23
  %_p_scalar_19.23 = load i32, i32* %scevgep18.23, align 4, !alias.scope !1, !noalias !3
  %p_add21.23 = add nsw i32 %_p_scalar_19.23, %p_add21.22
  %scevgep18.24 = getelementptr [64 x i32], [64 x i32]* %sum, i64 0, i64 24
  %_p_scalar_19.24 = load i32, i32* %scevgep18.24, align 16, !alias.scope !1, !noalias !3
  %p_add21.24 = add nsw i32 %_p_scalar_19.24, %p_add21.23
  %scevgep18.25 = getelementptr [64 x i32], [64 x i32]* %sum, i64 0, i64 25
  %_p_scalar_19.25 = load i32, i32* %scevgep18.25, align 4, !alias.scope !1, !noalias !3
  %p_add21.25 = add nsw i32 %_p_scalar_19.25, %p_add21.24
  %scevgep18.26 = getelementptr [64 x i32], [64 x i32]* %sum, i64 0, i64 26
  %_p_scalar_19.26 = load i32, i32* %scevgep18.26, align 8, !alias.scope !1, !noalias !3
  %p_add21.26 = add nsw i32 %_p_scalar_19.26, %p_add21.25
  %scevgep18.27 = getelementptr [64 x i32], [64 x i32]* %sum, i64 0, i64 27
  %_p_scalar_19.27 = load i32, i32* %scevgep18.27, align 4, !alias.scope !1, !noalias !3
  %p_add21.27 = add nsw i32 %_p_scalar_19.27, %p_add21.26
  %scevgep18.28 = getelementptr [64 x i32], [64 x i32]* %sum, i64 0, i64 28
  %_p_scalar_19.28 = load i32, i32* %scevgep18.28, align 16, !alias.scope !1, !noalias !3
  %p_add21.28 = add nsw i32 %_p_scalar_19.28, %p_add21.27
  %scevgep18.29 = getelementptr [64 x i32], [64 x i32]* %sum, i64 0, i64 29
  %_p_scalar_19.29 = load i32, i32* %scevgep18.29, align 4, !alias.scope !1, !noalias !3
  %p_add21.29 = add nsw i32 %_p_scalar_19.29, %p_add21.28
  %scevgep18.30 = getelementptr [64 x i32], [64 x i32]* %sum, i64 0, i64 30
  %_p_scalar_19.30 = load i32, i32* %scevgep18.30, align 8, !alias.scope !1, !noalias !3
  %p_add21.30 = add nsw i32 %_p_scalar_19.30, %p_add21.29
  %scevgep18.31 = getelementptr [64 x i32], [64 x i32]* %sum, i64 0, i64 31
  %_p_scalar_19.31 = load i32, i32* %scevgep18.31, align 4, !alias.scope !1, !noalias !3
  %p_add21.31 = add nsw i32 %_p_scalar_19.31, %p_add21.30
  ret i32 %p_add21.31

polly.split_new_and_old:                          ; preds = %entry
  br i1 true, label %polly.start, label %polly.loop_preheader2

polly.loop_preheader2:                            ; preds = %polly.split_new_and_old, %vector.body
  %polly.indvar = phi i64 [ %polly.indvar_next, %vector.body ], [ 0, %polly.split_new_and_old ]
  %0 = shl i64 %polly.indvar, 6
  %scevgep = getelementptr i32, i32* %a, i64 %0
  %scevgep8 = getelementptr i32, i32* %b, i64 %0
  br label %vector.body

vector.body:                                      ; preds = %polly.loop_preheader2
  %1 = bitcast i32* %scevgep to <4 x i32>*
  %wide.load = load <4 x i32>, <4 x i32>* %1, align 4, !alias.scope !6, !noalias !10
  %2 = bitcast i32* %scevgep8 to <4 x i32>*
  %wide.load21 = load <4 x i32>, <4 x i32>* %2, align 4, !alias.scope !7, !noalias !11
  %3 = mul nsw <4 x i32> %wide.load21, %wide.load
  %4 = getelementptr i32, i32* %scevgep, i64 4
  %5 = bitcast i32* %4 to <4 x i32>*
  %wide.load.1 = load <4 x i32>, <4 x i32>* %5, align 4, !alias.scope !6, !noalias !10
  %6 = getelementptr i32, i32* %scevgep8, i64 4
  %7 = bitcast i32* %6 to <4 x i32>*
  %wide.load21.1 = load <4 x i32>, <4 x i32>* %7, align 4, !alias.scope !7, !noalias !11
  %8 = mul nsw <4 x i32> %wide.load21.1, %wide.load.1
  %9 = add nsw <4 x i32> %8, %3
  %10 = getelementptr i32, i32* %scevgep, i64 8
  %11 = bitcast i32* %10 to <4 x i32>*
  %wide.load.2 = load <4 x i32>, <4 x i32>* %11, align 4, !alias.scope !6, !noalias !10
  %12 = getelementptr i32, i32* %scevgep8, i64 8
  %13 = bitcast i32* %12 to <4 x i32>*
  %wide.load21.2 = load <4 x i32>, <4 x i32>* %13, align 4, !alias.scope !7, !noalias !11
  %14 = mul nsw <4 x i32> %wide.load21.2, %wide.load.2
  %15 = add nsw <4 x i32> %14, %9
  %16 = getelementptr i32, i32* %scevgep, i64 12
  %17 = bitcast i32* %16 to <4 x i32>*
  %wide.load.3 = load <4 x i32>, <4 x i32>* %17, align 4, !alias.scope !6, !noalias !10
  %18 = getelementptr i32, i32* %scevgep8, i64 12
  %19 = bitcast i32* %18 to <4 x i32>*
  %wide.load21.3 = load <4 x i32>, <4 x i32>* %19, align 4, !alias.scope !7, !noalias !11
  %20 = mul nsw <4 x i32> %wide.load21.3, %wide.load.3
  %21 = add nsw <4 x i32> %20, %15
  %22 = getelementptr i32, i32* %scevgep, i64 16
  %23 = bitcast i32* %22 to <4 x i32>*
  %wide.load.4 = load <4 x i32>, <4 x i32>* %23, align 4, !alias.scope !6, !noalias !10
  %24 = getelementptr i32, i32* %scevgep8, i64 16
  %25 = bitcast i32* %24 to <4 x i32>*
  %wide.load21.4 = load <4 x i32>, <4 x i32>* %25, align 4, !alias.scope !7, !noalias !11
  %26 = mul nsw <4 x i32> %wide.load21.4, %wide.load.4
  %27 = add nsw <4 x i32> %26, %21
  %28 = getelementptr i32, i32* %scevgep, i64 20
  %29 = bitcast i32* %28 to <4 x i32>*
  %wide.load.5 = load <4 x i32>, <4 x i32>* %29, align 4, !alias.scope !6, !noalias !10
  %30 = getelementptr i32, i32* %scevgep8, i64 20
  %31 = bitcast i32* %30 to <4 x i32>*
  %wide.load21.5 = load <4 x i32>, <4 x i32>* %31, align 4, !alias.scope !7, !noalias !11
  %32 = mul nsw <4 x i32> %wide.load21.5, %wide.load.5
  %33 = add nsw <4 x i32> %32, %27
  %34 = getelementptr i32, i32* %scevgep, i64 24
  %35 = bitcast i32* %34 to <4 x i32>*
  %wide.load.6 = load <4 x i32>, <4 x i32>* %35, align 4, !alias.scope !6, !noalias !10
  %36 = getelementptr i32, i32* %scevgep8, i64 24
  %37 = bitcast i32* %36 to <4 x i32>*
  %wide.load21.6 = load <4 x i32>, <4 x i32>* %37, align 4, !alias.scope !7, !noalias !11
  %38 = mul nsw <4 x i32> %wide.load21.6, %wide.load.6
  %39 = add nsw <4 x i32> %38, %33
  %40 = getelementptr i32, i32* %scevgep, i64 28
  %41 = bitcast i32* %40 to <4 x i32>*
  %wide.load.7 = load <4 x i32>, <4 x i32>* %41, align 4, !alias.scope !6, !noalias !10
  %42 = getelementptr i32, i32* %scevgep8, i64 28
  %43 = bitcast i32* %42 to <4 x i32>*
  %wide.load21.7 = load <4 x i32>, <4 x i32>* %43, align 4, !alias.scope !7, !noalias !11
  %44 = mul nsw <4 x i32> %wide.load21.7, %wide.load.7
  %45 = add nsw <4 x i32> %44, %39
  %46 = getelementptr i32, i32* %scevgep, i64 32
  %47 = bitcast i32* %46 to <4 x i32>*
  %wide.load.8 = load <4 x i32>, <4 x i32>* %47, align 4, !alias.scope !6, !noalias !10
  %48 = getelementptr i32, i32* %scevgep8, i64 32
  %49 = bitcast i32* %48 to <4 x i32>*
  %wide.load21.8 = load <4 x i32>, <4 x i32>* %49, align 4, !alias.scope !7, !noalias !11
  %50 = mul nsw <4 x i32> %wide.load21.8, %wide.load.8
  %51 = add nsw <4 x i32> %50, %45
  %52 = getelementptr i32, i32* %scevgep, i64 36
  %53 = bitcast i32* %52 to <4 x i32>*
  %wide.load.9 = load <4 x i32>, <4 x i32>* %53, align 4, !alias.scope !6, !noalias !10
  %54 = getelementptr i32, i32* %scevgep8, i64 36
  %55 = bitcast i32* %54 to <4 x i32>*
  %wide.load21.9 = load <4 x i32>, <4 x i32>* %55, align 4, !alias.scope !7, !noalias !11
  %56 = mul nsw <4 x i32> %wide.load21.9, %wide.load.9
  %57 = add nsw <4 x i32> %56, %51
  %58 = getelementptr i32, i32* %scevgep, i64 40
  %59 = bitcast i32* %58 to <4 x i32>*
  %wide.load.10 = load <4 x i32>, <4 x i32>* %59, align 4, !alias.scope !6, !noalias !10
  %60 = getelementptr i32, i32* %scevgep8, i64 40
  %61 = bitcast i32* %60 to <4 x i32>*
  %wide.load21.10 = load <4 x i32>, <4 x i32>* %61, align 4, !alias.scope !7, !noalias !11
  %62 = mul nsw <4 x i32> %wide.load21.10, %wide.load.10
  %63 = add nsw <4 x i32> %62, %57
  %64 = getelementptr i32, i32* %scevgep, i64 44
  %65 = bitcast i32* %64 to <4 x i32>*
  %wide.load.11 = load <4 x i32>, <4 x i32>* %65, align 4, !alias.scope !6, !noalias !10
  %66 = getelementptr i32, i32* %scevgep8, i64 44
  %67 = bitcast i32* %66 to <4 x i32>*
  %wide.load21.11 = load <4 x i32>, <4 x i32>* %67, align 4, !alias.scope !7, !noalias !11
  %68 = mul nsw <4 x i32> %wide.load21.11, %wide.load.11
  %69 = add nsw <4 x i32> %68, %63
  %70 = getelementptr i32, i32* %scevgep, i64 48
  %71 = bitcast i32* %70 to <4 x i32>*
  %wide.load.12 = load <4 x i32>, <4 x i32>* %71, align 4, !alias.scope !6, !noalias !10
  %72 = getelementptr i32, i32* %scevgep8, i64 48
  %73 = bitcast i32* %72 to <4 x i32>*
  %wide.load21.12 = load <4 x i32>, <4 x i32>* %73, align 4, !alias.scope !7, !noalias !11
  %74 = mul nsw <4 x i32> %wide.load21.12, %wide.load.12
  %75 = add nsw <4 x i32> %74, %69
  %76 = getelementptr i32, i32* %scevgep, i64 52
  %77 = bitcast i32* %76 to <4 x i32>*
  %wide.load.13 = load <4 x i32>, <4 x i32>* %77, align 4, !alias.scope !6, !noalias !10
  %78 = getelementptr i32, i32* %scevgep8, i64 52
  %79 = bitcast i32* %78 to <4 x i32>*
  %wide.load21.13 = load <4 x i32>, <4 x i32>* %79, align 4, !alias.scope !7, !noalias !11
  %80 = mul nsw <4 x i32> %wide.load21.13, %wide.load.13
  %81 = add nsw <4 x i32> %80, %75
  %82 = getelementptr i32, i32* %scevgep, i64 56
  %83 = bitcast i32* %82 to <4 x i32>*
  %wide.load.14 = load <4 x i32>, <4 x i32>* %83, align 4, !alias.scope !6, !noalias !10
  %84 = getelementptr i32, i32* %scevgep8, i64 56
  %85 = bitcast i32* %84 to <4 x i32>*
  %wide.load21.14 = load <4 x i32>, <4 x i32>* %85, align 4, !alias.scope !7, !noalias !11
  %86 = mul nsw <4 x i32> %wide.load21.14, %wide.load.14
  %87 = add nsw <4 x i32> %86, %81
  %88 = getelementptr i32, i32* %scevgep, i64 60
  %89 = bitcast i32* %88 to <4 x i32>*
  %wide.load.15 = load <4 x i32>, <4 x i32>* %89, align 4, !alias.scope !6, !noalias !10
  %90 = getelementptr i32, i32* %scevgep8, i64 60
  %91 = bitcast i32* %90 to <4 x i32>*
  %wide.load21.15 = load <4 x i32>, <4 x i32>* %91, align 4, !alias.scope !7, !noalias !11
  %92 = mul nsw <4 x i32> %wide.load21.15, %wide.load.15
  %93 = add nsw <4 x i32> %92, %87
  %rdx.shuf = shufflevector <4 x i32> %93, <4 x i32> undef, <4 x i32> <i32 2, i32 3, i32 undef, i32 undef>
  %bin.rdx = add <4 x i32> %93, %rdx.shuf
  %rdx.shuf22 = shufflevector <4 x i32> %bin.rdx, <4 x i32> undef, <4 x i32> <i32 1, i32 undef, i32 undef, i32 undef>
  %bin.rdx23 = add <4 x i32> %bin.rdx, %rdx.shuf22
  %94 = extractelement <4 x i32> %bin.rdx23, i32 0
  %scevgep11 = getelementptr [64 x i32], [64 x i32]* %sum, i64 0, i64 %polly.indvar
  store i32 %94, i32* %scevgep11, align 4, !alias.scope !1, !noalias !3
  %polly.indvar_next = add nuw nsw i64 %polly.indvar, 1
  %exitcond20 = icmp eq i64 %polly.indvar_next, 32
  br i1 %exitcond20, label %polly.merge_new_and_old, label %polly.loop_preheader2

polly.start:                                      ; preds = %polly.split_new_and_old
  br label %polly.loop_preheader

polly.loop_exit:                                  ; preds = %polly.stmt.vector.body
  br label %polly.exiting

polly.exiting:                                    ; preds = %polly.loop_exit
  br label %polly.merge_new_and_old

polly.loop_header:                                ; preds = %polly.stmt.vector.body, %polly.loop_preheader
  %polly.indvar24 = phi i64 [ 0, %polly.loop_preheader ], [ %polly.indvar_next25, %polly.stmt.vector.body ]
  br label %polly.stmt.vector.body

polly.stmt.vector.body:                           ; preds = %polly.loop_header
  %95 = shl i64 %polly.indvar24, 6
  %scevgep26 = getelementptr i32, i32* %a, i64 %95
  %scevgep2627 = bitcast i32* %scevgep26 to <4 x i32>*
  %wide.load_p_scalar_ = load <4 x i32>, <4 x i32>* %scevgep2627, align 4, !alias.scope !12, !noalias !14, !llvm.mem.parallel_loop_access !17
  %scevgep28 = getelementptr i32, i32* %b, i64 %95
  %scevgep2829 = bitcast i32* %scevgep28 to <4 x i32>*
  %wide.load21_p_scalar_ = load <4 x i32>, <4 x i32>* %scevgep2829, align 4, !alias.scope !15, !noalias !18, !llvm.mem.parallel_loop_access !17
  %p_ = mul nsw <4 x i32> %wide.load21_p_scalar_, %wide.load_p_scalar_
  %96 = shl i64 %polly.indvar24, 6
  %scevgep31 = getelementptr i32, i32* %scevgep30, i64 %96
  %scevgep3132 = bitcast i32* %scevgep31 to <4 x i32>*
  %wide.load.1_p_scalar_ = load <4 x i32>, <4 x i32>* %scevgep3132, align 4, !alias.scope !12, !noalias !14, !llvm.mem.parallel_loop_access !17
  %scevgep34 = getelementptr i32, i32* %scevgep33, i64 %96
  %scevgep3435 = bitcast i32* %scevgep34 to <4 x i32>*
  %wide.load21.1_p_scalar_ = load <4 x i32>, <4 x i32>* %scevgep3435, align 4, !alias.scope !15, !noalias !18, !llvm.mem.parallel_loop_access !17
  %p_36 = mul nsw <4 x i32> %wide.load21.1_p_scalar_, %wide.load.1_p_scalar_
  %p_37 = add nsw <4 x i32> %p_36, %p_
  %97 = shl i64 %polly.indvar24, 6
  %scevgep39 = getelementptr i32, i32* %scevgep38, i64 %97
  %scevgep3940 = bitcast i32* %scevgep39 to <4 x i32>*
  %wide.load.2_p_scalar_ = load <4 x i32>, <4 x i32>* %scevgep3940, align 4, !alias.scope !12, !noalias !14, !llvm.mem.parallel_loop_access !17
  %scevgep42 = getelementptr i32, i32* %scevgep41, i64 %97
  %scevgep4243 = bitcast i32* %scevgep42 to <4 x i32>*
  %wide.load21.2_p_scalar_ = load <4 x i32>, <4 x i32>* %scevgep4243, align 4, !alias.scope !15, !noalias !18, !llvm.mem.parallel_loop_access !17
  %p_44 = mul nsw <4 x i32> %wide.load21.2_p_scalar_, %wide.load.2_p_scalar_
  %p_45 = add nsw <4 x i32> %p_44, %p_37
  %98 = shl i64 %polly.indvar24, 6
  %scevgep47 = getelementptr i32, i32* %scevgep46, i64 %98
  %scevgep4748 = bitcast i32* %scevgep47 to <4 x i32>*
  %wide.load.3_p_scalar_ = load <4 x i32>, <4 x i32>* %scevgep4748, align 4, !alias.scope !12, !noalias !14, !llvm.mem.parallel_loop_access !17
  %scevgep50 = getelementptr i32, i32* %scevgep49, i64 %98
  %scevgep5051 = bitcast i32* %scevgep50 to <4 x i32>*
  %wide.load21.3_p_scalar_ = load <4 x i32>, <4 x i32>* %scevgep5051, align 4, !alias.scope !15, !noalias !18, !llvm.mem.parallel_loop_access !17
  %p_52 = mul nsw <4 x i32> %wide.load21.3_p_scalar_, %wide.load.3_p_scalar_
  %p_53 = add nsw <4 x i32> %p_52, %p_45
  %99 = shl i64 %polly.indvar24, 6
  %scevgep55 = getelementptr i32, i32* %scevgep54, i64 %99
  %scevgep5556 = bitcast i32* %scevgep55 to <4 x i32>*
  %wide.load.4_p_scalar_ = load <4 x i32>, <4 x i32>* %scevgep5556, align 4, !alias.scope !12, !noalias !14, !llvm.mem.parallel_loop_access !17
  %scevgep58 = getelementptr i32, i32* %scevgep57, i64 %99
  %scevgep5859 = bitcast i32* %scevgep58 to <4 x i32>*
  %wide.load21.4_p_scalar_ = load <4 x i32>, <4 x i32>* %scevgep5859, align 4, !alias.scope !15, !noalias !18, !llvm.mem.parallel_loop_access !17
  %p_60 = mul nsw <4 x i32> %wide.load21.4_p_scalar_, %wide.load.4_p_scalar_
  %p_61 = add nsw <4 x i32> %p_60, %p_53
  %100 = shl i64 %polly.indvar24, 6
  %scevgep63 = getelementptr i32, i32* %scevgep62, i64 %100
  %scevgep6364 = bitcast i32* %scevgep63 to <4 x i32>*
  %wide.load.5_p_scalar_ = load <4 x i32>, <4 x i32>* %scevgep6364, align 4, !alias.scope !12, !noalias !14, !llvm.mem.parallel_loop_access !17
  %scevgep66 = getelementptr i32, i32* %scevgep65, i64 %100
  %scevgep6667 = bitcast i32* %scevgep66 to <4 x i32>*
  %wide.load21.5_p_scalar_ = load <4 x i32>, <4 x i32>* %scevgep6667, align 4, !alias.scope !15, !noalias !18, !llvm.mem.parallel_loop_access !17
  %p_68 = mul nsw <4 x i32> %wide.load21.5_p_scalar_, %wide.load.5_p_scalar_
  %p_69 = add nsw <4 x i32> %p_68, %p_61
  %101 = shl i64 %polly.indvar24, 6
  %scevgep71 = getelementptr i32, i32* %scevgep70, i64 %101
  %scevgep7172 = bitcast i32* %scevgep71 to <4 x i32>*
  %wide.load.6_p_scalar_ = load <4 x i32>, <4 x i32>* %scevgep7172, align 4, !alias.scope !12, !noalias !14, !llvm.mem.parallel_loop_access !17
  %scevgep74 = getelementptr i32, i32* %scevgep73, i64 %101
  %scevgep7475 = bitcast i32* %scevgep74 to <4 x i32>*
  %wide.load21.6_p_scalar_ = load <4 x i32>, <4 x i32>* %scevgep7475, align 4, !alias.scope !15, !noalias !18, !llvm.mem.parallel_loop_access !17
  %p_76 = mul nsw <4 x i32> %wide.load21.6_p_scalar_, %wide.load.6_p_scalar_
  %p_77 = add nsw <4 x i32> %p_76, %p_69
  %102 = shl i64 %polly.indvar24, 6
  %scevgep79 = getelementptr i32, i32* %scevgep78, i64 %102
  %scevgep7980 = bitcast i32* %scevgep79 to <4 x i32>*
  %wide.load.7_p_scalar_ = load <4 x i32>, <4 x i32>* %scevgep7980, align 4, !alias.scope !12, !noalias !14, !llvm.mem.parallel_loop_access !17
  %scevgep82 = getelementptr i32, i32* %scevgep81, i64 %102
  %scevgep8283 = bitcast i32* %scevgep82 to <4 x i32>*
  %wide.load21.7_p_scalar_ = load <4 x i32>, <4 x i32>* %scevgep8283, align 4, !alias.scope !15, !noalias !18, !llvm.mem.parallel_loop_access !17
  %p_84 = mul nsw <4 x i32> %wide.load21.7_p_scalar_, %wide.load.7_p_scalar_
  %p_85 = add nsw <4 x i32> %p_84, %p_77
  %103 = shl i64 %polly.indvar24, 6
  %scevgep87 = getelementptr i32, i32* %scevgep86, i64 %103
  %scevgep8788 = bitcast i32* %scevgep87 to <4 x i32>*
  %wide.load.8_p_scalar_ = load <4 x i32>, <4 x i32>* %scevgep8788, align 4, !alias.scope !12, !noalias !14, !llvm.mem.parallel_loop_access !17
  %scevgep90 = getelementptr i32, i32* %scevgep89, i64 %103
  %scevgep9091 = bitcast i32* %scevgep90 to <4 x i32>*
  %wide.load21.8_p_scalar_ = load <4 x i32>, <4 x i32>* %scevgep9091, align 4, !alias.scope !15, !noalias !18, !llvm.mem.parallel_loop_access !17
  %p_92 = mul nsw <4 x i32> %wide.load21.8_p_scalar_, %wide.load.8_p_scalar_
  %p_93 = add nsw <4 x i32> %p_92, %p_85
  %104 = shl i64 %polly.indvar24, 6
  %scevgep95 = getelementptr i32, i32* %scevgep94, i64 %104
  %scevgep9596 = bitcast i32* %scevgep95 to <4 x i32>*
  %wide.load.9_p_scalar_ = load <4 x i32>, <4 x i32>* %scevgep9596, align 4, !alias.scope !12, !noalias !14, !llvm.mem.parallel_loop_access !17
  %scevgep98 = getelementptr i32, i32* %scevgep97, i64 %104
  %scevgep9899 = bitcast i32* %scevgep98 to <4 x i32>*
  %wide.load21.9_p_scalar_ = load <4 x i32>, <4 x i32>* %scevgep9899, align 4, !alias.scope !15, !noalias !18, !llvm.mem.parallel_loop_access !17
  %p_100 = mul nsw <4 x i32> %wide.load21.9_p_scalar_, %wide.load.9_p_scalar_
  %p_101 = add nsw <4 x i32> %p_100, %p_93
  %105 = shl i64 %polly.indvar24, 6
  %scevgep103 = getelementptr i32, i32* %scevgep102, i64 %105
  %scevgep103104 = bitcast i32* %scevgep103 to <4 x i32>*
  %wide.load.10_p_scalar_ = load <4 x i32>, <4 x i32>* %scevgep103104, align 4, !alias.scope !12, !noalias !14, !llvm.mem.parallel_loop_access !17
  %scevgep106 = getelementptr i32, i32* %scevgep105, i64 %105
  %scevgep106107 = bitcast i32* %scevgep106 to <4 x i32>*
  %wide.load21.10_p_scalar_ = load <4 x i32>, <4 x i32>* %scevgep106107, align 4, !alias.scope !15, !noalias !18, !llvm.mem.parallel_loop_access !17
  %p_108 = mul nsw <4 x i32> %wide.load21.10_p_scalar_, %wide.load.10_p_scalar_
  %p_109 = add nsw <4 x i32> %p_108, %p_101
  %106 = shl i64 %polly.indvar24, 6
  %scevgep111 = getelementptr i32, i32* %scevgep110, i64 %106
  %scevgep111112 = bitcast i32* %scevgep111 to <4 x i32>*
  %wide.load.11_p_scalar_ = load <4 x i32>, <4 x i32>* %scevgep111112, align 4, !alias.scope !12, !noalias !14, !llvm.mem.parallel_loop_access !17
  %scevgep114 = getelementptr i32, i32* %scevgep113, i64 %106
  %scevgep114115 = bitcast i32* %scevgep114 to <4 x i32>*
  %wide.load21.11_p_scalar_ = load <4 x i32>, <4 x i32>* %scevgep114115, align 4, !alias.scope !15, !noalias !18, !llvm.mem.parallel_loop_access !17
  %p_116 = mul nsw <4 x i32> %wide.load21.11_p_scalar_, %wide.load.11_p_scalar_
  %p_117 = add nsw <4 x i32> %p_116, %p_109
  %107 = shl i64 %polly.indvar24, 6
  %scevgep119 = getelementptr i32, i32* %scevgep118, i64 %107
  %scevgep119120 = bitcast i32* %scevgep119 to <4 x i32>*
  %wide.load.12_p_scalar_ = load <4 x i32>, <4 x i32>* %scevgep119120, align 4, !alias.scope !12, !noalias !14, !llvm.mem.parallel_loop_access !17
  %scevgep122 = getelementptr i32, i32* %scevgep121, i64 %107
  %scevgep122123 = bitcast i32* %scevgep122 to <4 x i32>*
  %wide.load21.12_p_scalar_ = load <4 x i32>, <4 x i32>* %scevgep122123, align 4, !alias.scope !15, !noalias !18, !llvm.mem.parallel_loop_access !17
  %p_124 = mul nsw <4 x i32> %wide.load21.12_p_scalar_, %wide.load.12_p_scalar_
  %p_125 = add nsw <4 x i32> %p_124, %p_117
  %108 = shl i64 %polly.indvar24, 6
  %scevgep127 = getelementptr i32, i32* %scevgep126, i64 %108
  %scevgep127128 = bitcast i32* %scevgep127 to <4 x i32>*
  %wide.load.13_p_scalar_ = load <4 x i32>, <4 x i32>* %scevgep127128, align 4, !alias.scope !12, !noalias !14, !llvm.mem.parallel_loop_access !17
  %scevgep130 = getelementptr i32, i32* %scevgep129, i64 %108
  %scevgep130131 = bitcast i32* %scevgep130 to <4 x i32>*
  %wide.load21.13_p_scalar_ = load <4 x i32>, <4 x i32>* %scevgep130131, align 4, !alias.scope !15, !noalias !18, !llvm.mem.parallel_loop_access !17
  %p_132 = mul nsw <4 x i32> %wide.load21.13_p_scalar_, %wide.load.13_p_scalar_
  %p_133 = add nsw <4 x i32> %p_132, %p_125
  %109 = shl i64 %polly.indvar24, 6
  %scevgep135 = getelementptr i32, i32* %scevgep134, i64 %109
  %scevgep135136 = bitcast i32* %scevgep135 to <4 x i32>*
  %wide.load.14_p_scalar_ = load <4 x i32>, <4 x i32>* %scevgep135136, align 4, !alias.scope !12, !noalias !14, !llvm.mem.parallel_loop_access !17
  %scevgep138 = getelementptr i32, i32* %scevgep137, i64 %109
  %scevgep138139 = bitcast i32* %scevgep138 to <4 x i32>*
  %wide.load21.14_p_scalar_ = load <4 x i32>, <4 x i32>* %scevgep138139, align 4, !alias.scope !15, !noalias !18, !llvm.mem.parallel_loop_access !17
  %p_140 = mul nsw <4 x i32> %wide.load21.14_p_scalar_, %wide.load.14_p_scalar_
  %p_141 = add nsw <4 x i32> %p_140, %p_133
  %110 = shl i64 %polly.indvar24, 6
  %scevgep143 = getelementptr i32, i32* %scevgep142, i64 %110
  %scevgep143144 = bitcast i32* %scevgep143 to <4 x i32>*
  %wide.load.15_p_scalar_ = load <4 x i32>, <4 x i32>* %scevgep143144, align 4, !alias.scope !12, !noalias !14, !llvm.mem.parallel_loop_access !17
  %scevgep146 = getelementptr i32, i32* %scevgep145, i64 %110
  %scevgep146147 = bitcast i32* %scevgep146 to <4 x i32>*
  %wide.load21.15_p_scalar_ = load <4 x i32>, <4 x i32>* %scevgep146147, align 4, !alias.scope !15, !noalias !18, !llvm.mem.parallel_loop_access !17
  %p_148 = mul nsw <4 x i32> %wide.load21.15_p_scalar_, %wide.load.15_p_scalar_
  %p_149 = add nsw <4 x i32> %p_148, %p_141
  %p_rdx.shuf = shufflevector <4 x i32> %p_149, <4 x i32> undef, <4 x i32> <i32 2, i32 3, i32 undef, i32 undef>
  %p_bin.rdx = add <4 x i32> %p_149, %p_rdx.shuf
  %p_rdx.shuf22 = shufflevector <4 x i32> %p_bin.rdx, <4 x i32> undef, <4 x i32> <i32 1, i32 undef, i32 undef, i32 undef>
  %p_bin.rdx23 = add <4 x i32> %p_bin.rdx, %p_rdx.shuf22
  %p_150 = extractelement <4 x i32> %p_bin.rdx23, i32 0
  %scevgep151 = getelementptr [64 x i32], [64 x i32]* %sum, i64 0, i64 %polly.indvar24
  store i32 %p_150, i32* %scevgep151, align 4, !alias.scope !16, !noalias !19, !llvm.mem.parallel_loop_access !17
  %111 = add i64 %polly.indvar24, 1
  %p_exitcond20 = icmp eq i64 %111, 32
  %polly.indvar_next25 = add nsw i64 %polly.indvar24, 1
  %polly.loop_cond = icmp sle i64 %polly.indvar24, 30
  br i1 %polly.loop_cond, label %polly.loop_header, label %polly.loop_exit, !llvm.loop !17

polly.loop_preheader:                             ; preds = %polly.start
  %scevgep30 = getelementptr i32, i32* %a, i64 4
  %scevgep33 = getelementptr i32, i32* %b, i64 4
  %scevgep38 = getelementptr i32, i32* %a, i64 8
  %scevgep41 = getelementptr i32, i32* %b, i64 8
  %scevgep46 = getelementptr i32, i32* %a, i64 12
  %scevgep49 = getelementptr i32, i32* %b, i64 12
  %scevgep54 = getelementptr i32, i32* %a, i64 16
  %scevgep57 = getelementptr i32, i32* %b, i64 16
  %scevgep62 = getelementptr i32, i32* %a, i64 20
  %scevgep65 = getelementptr i32, i32* %b, i64 20
  %scevgep70 = getelementptr i32, i32* %a, i64 24
  %scevgep73 = getelementptr i32, i32* %b, i64 24
  %scevgep78 = getelementptr i32, i32* %a, i64 28
  %scevgep81 = getelementptr i32, i32* %b, i64 28
  %scevgep86 = getelementptr i32, i32* %a, i64 32
  %scevgep89 = getelementptr i32, i32* %b, i64 32
  %scevgep94 = getelementptr i32, i32* %a, i64 36
  %scevgep97 = getelementptr i32, i32* %b, i64 36
  %scevgep102 = getelementptr i32, i32* %a, i64 40
  %scevgep105 = getelementptr i32, i32* %b, i64 40
  %scevgep110 = getelementptr i32, i32* %a, i64 44
  %scevgep113 = getelementptr i32, i32* %b, i64 44
  %scevgep118 = getelementptr i32, i32* %a, i64 48
  %scevgep121 = getelementptr i32, i32* %b, i64 48
  %scevgep126 = getelementptr i32, i32* %a, i64 52
  %scevgep129 = getelementptr i32, i32* %b, i64 52
  %scevgep134 = getelementptr i32, i32* %a, i64 56
  %scevgep137 = getelementptr i32, i32* %b, i64 56
  %scevgep142 = getelementptr i32, i32* %a, i64 60
  %scevgep145 = getelementptr i32, i32* %b, i64 60
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
  %arrayidx5 = getelementptr inbounds [2048 x [2048 x i32]], [2048 x [2048 x i32]]* @Z, i64 0, i64 %indvars.iv6, i64 %indvars.iv
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
declare i32 @fprintf(%struct._IO_FILE* nocapture, i8* nocapture readonly, ...) #1

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
entry:
  %polly.par.userContext = alloca { i64, i64, i8* }
  %polly.par.userContext.i = alloca {}, align 8
  %polly.par.userContext.i1 = alloca { i32, i8* }, align 8
  %0 = bitcast {}* %polly.par.userContext.i to i8*
  call void @llvm.lifetime.start(i64 0, i8* %0) #4
  call void @GOMP_parallel_loop_runtime_start(void (i8*)* nonnull @init_polly_subfn, i8* %0, i32 0, i64 0, i64 64, i64 1) #4
  call void @init_polly_subfn(i8* %0) #4
  call void @GOMP_parallel_end() #4
  call void @llvm.lifetime.end(i64 8, i8* %0) #4
  %1 = bitcast { i32, i8* }* %polly.par.userContext.i1 to i8*
  %polly.subfn.storeaddr.index.i = getelementptr inbounds { i32, i8* }, { i32, i8* }* %polly.par.userContext.i1, i64 0, i32 0
  %polly.subfn.storeaddr.call.i = getelementptr inbounds { i32, i8* }, { i32, i8* }* %polly.par.userContext.i1, i64 0, i32 1
  br label %for.body

for.body:                                         ; preds = %for.inc10, %entry
  %indvars.iv3 = phi i64 [ 0, %entry ], [ %indvars.iv.next4, %for.inc10 ]
  %2 = shl i64 %indvars.iv3, 0
  %3 = add i64 %2, 0
  %4 = trunc i64 %indvars.iv3 to i32
  %call.i = tail call noalias i8* @malloc(i64 8192) #4
  %5 = bitcast i8* %call.i to i32*
  %6 = icmp ult i32 %4, 2048
  br i1 %6, label %polly.parallel.for.i, label %for.cond1.preheader.preheader.i

for.cond1.preheader.preheader.i:                  ; preds = %for.body
  %sext = shl i64 %indvars.iv3, 32
  %idxprom.i = ashr exact i64 %sext, 32
  br label %polly.split_new_and_old

polly.split_new_and_old:                          ; preds = %for.cond1.preheader.preheader.i
  br i1 true, label %polly.start, label %for.cond1.preheader.i

for.cond1.preheader.i:                            ; preds = %polly.split_new_and_old, %for.inc10.i
  %indvars.iv5.i = phi i64 [ %indvars.iv.next6.i, %for.inc10.i ], [ 0, %polly.split_new_and_old ]
  %7 = shl i64 %indvars.iv5.i, 6
  br label %for.body3.i

for.body3.i:                                      ; preds = %for.body3.i, %for.cond1.preheader.i
  %indvars.iv.i = phi i64 [ 0, %for.cond1.preheader.i ], [ %indvars.iv.next.i.3, %for.body3.i ]
  %8 = add nuw nsw i64 %indvars.iv.i, %7
  %arrayidx5.i = getelementptr inbounds [2048 x [2048 x i32]], [2048 x [2048 x i32]]* @Y, i64 0, i64 %8, i64 %idxprom.i
  %9 = load i32, i32* %arrayidx5.i, align 4
  %arrayidx9.i = getelementptr inbounds i32, i32* %5, i64 %8
  store i32 %9, i32* %arrayidx9.i, align 4
  %indvars.iv.next.i = or i64 %indvars.iv.i, 1
  %10 = add nuw nsw i64 %indvars.iv.next.i, %7
  %arrayidx5.i.1 = getelementptr inbounds [2048 x [2048 x i32]], [2048 x [2048 x i32]]* @Y, i64 0, i64 %10, i64 %idxprom.i
  %11 = load i32, i32* %arrayidx5.i.1, align 4
  %arrayidx9.i.1 = getelementptr inbounds i32, i32* %5, i64 %10
  store i32 %11, i32* %arrayidx9.i.1, align 4
  %indvars.iv.next.i.1 = or i64 %indvars.iv.i, 2
  %12 = add nuw nsw i64 %indvars.iv.next.i.1, %7
  %arrayidx5.i.2 = getelementptr inbounds [2048 x [2048 x i32]], [2048 x [2048 x i32]]* @Y, i64 0, i64 %12, i64 %idxprom.i
  %13 = load i32, i32* %arrayidx5.i.2, align 4
  %arrayidx9.i.2 = getelementptr inbounds i32, i32* %5, i64 %12
  store i32 %13, i32* %arrayidx9.i.2, align 4
  %indvars.iv.next.i.2 = or i64 %indvars.iv.i, 3
  %14 = add nuw nsw i64 %indvars.iv.next.i.2, %7
  %arrayidx5.i.3 = getelementptr inbounds [2048 x [2048 x i32]], [2048 x [2048 x i32]]* @Y, i64 0, i64 %14, i64 %idxprom.i
  %15 = load i32, i32* %arrayidx5.i.3, align 4
  %arrayidx9.i.3 = getelementptr inbounds i32, i32* %5, i64 %14
  store i32 %15, i32* %arrayidx9.i.3, align 4
  %indvars.iv.next.i.3 = add nsw i64 %indvars.iv.i, 4
  %exitcond.i.3 = icmp eq i64 %indvars.iv.next.i.3, 64
  br i1 %exitcond.i.3, label %for.inc10.i, label %for.body3.i

for.inc10.i:                                      ; preds = %for.body3.i
  %indvars.iv.next6.i = add nuw nsw i64 %indvars.iv5.i, 1
  %exitcond9.i = icmp eq i64 %indvars.iv.next6.i, 32
  br i1 %exitcond9.i, label %for.body3.preheader.loopexit, label %for.cond1.preheader.i

polly.parallel.for.i:                             ; preds = %for.body
  call void @llvm.lifetime.start(i64 16, i8* %1) #4
  store i32 %4, i32* %polly.subfn.storeaddr.index.i, align 8
  store i8* %call.i, i8** %polly.subfn.storeaddr.call.i, align 8
  call void @GOMP_parallel_loop_runtime_start(void (i8*)* nonnull @transpose_polly_subfn, i8* %1, i32 0, i64 0, i64 2, i64 1) #4
  call void @transpose_polly_subfn(i8* %1) #4
  call void @GOMP_parallel_end() #4
  call void @llvm.lifetime.end(i64 8, i8* %1) #4
  br label %for.body3.preheader

for.body3.preheader.loopexit:                     ; preds = %for.inc10.i
  br label %polly.merge_new_and_old

polly.merge_new_and_old:                          ; preds = %polly.exiting, %for.body3.preheader.loopexit
  br label %for.body3.preheader

for.body3.preheader:                              ; preds = %polly.merge_new_and_old, %polly.parallel.for.i
  br label %for.body3

for.body3:                                        ; preds = %for.body3.preheader, %for.body3
  %indvars.iv = phi i64 [ %indvars.iv.next, %for.body3 ], [ 0, %for.body3.preheader ]
  %arraydecay = getelementptr inbounds [2048 x [2048 x i32]], [2048 x [2048 x i32]]* @X, i64 0, i64 %indvars.iv, i64 0
  %call7 = tail call i32 @dot(i32* %arraydecay, i32* %5)
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
  %16 = load i32, i32* getelementptr inbounds ([2048 x [2048 x i32]], [2048 x [2048 x i32]]* @Z, i64 0, i64 2047, i64 2047), align 4
  %call13 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([46 x i8], [46 x i8]* @.str.2, i64 0, i64 0), i32 2048, i32 2048, i32 2047, i32 2047, i32 %16) #4
  ret i32 0

polly.start:                                      ; preds = %polly.split_new_and_old
  br label %polly.parallel.for

polly.parallel.for:                               ; preds = %polly.start
  %17 = bitcast { i64, i64, i8* }* %polly.par.userContext to i8*
  call void @llvm.lifetime.start(i64 24, i8* %17)
  %polly.subfn.storeaddr.indvars.iv3 = getelementptr inbounds { i64, i64, i8* }, { i64, i64, i8* }* %polly.par.userContext, i32 0, i32 0
  store i64 %indvars.iv3, i64* %polly.subfn.storeaddr.indvars.iv3
  %polly.subfn.storeaddr. = getelementptr inbounds { i64, i64, i8* }, { i64, i64, i8* }* %polly.par.userContext, i32 0, i32 1
  store i64 %3, i64* %polly.subfn.storeaddr.
  %polly.subfn.storeaddr.call.i2 = getelementptr inbounds { i64, i64, i8* }, { i64, i64, i8* }* %polly.par.userContext, i32 0, i32 2
  store i8* %call.i, i8** %polly.subfn.storeaddr.call.i2
  %polly.par.userContext3 = bitcast { i64, i64, i8* }* %polly.par.userContext to i8*
  call void @GOMP_parallel_loop_runtime_start(void (i8*)* @main_polly_subfn, i8* %polly.par.userContext3, i32 0, i64 0, i64 32, i64 1)
  call void @main_polly_subfn(i8* %polly.par.userContext3)
  call void @GOMP_parallel_end()
  %18 = bitcast { i64, i64, i8* }* %polly.par.userContext to i8*
  call void @llvm.lifetime.end(i64 8, i8* %18)
  br label %polly.exiting

polly.exiting:                                    ; preds = %polly.parallel.for
  br label %polly.merge_new_and_old
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
  %exitcond22 = icmp eq i64 %polly.indvar_next6, 64
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
  %14 = getelementptr [2048 x [2048 x i32]], [2048 x [2048 x i32]]* @X, i64 0, i64 %13, i64 %5
  %15 = bitcast i32* %14 to <4 x i32>*
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* %15, align 16, !alias.scope !20, !noalias !22
  %16 = getelementptr [2048 x [2048 x i32]], [2048 x [2048 x i32]]* @Y, i64 0, i64 %13, i64 %5
  %17 = bitcast i32* %16 to <4 x i32>*
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* %17, align 16, !alias.scope !23, !noalias !24
  %18 = getelementptr [2048 x [2048 x i32]], [2048 x [2048 x i32]]* @X, i64 0, i64 %13, i64 %6
  %19 = bitcast i32* %18 to <4 x i32>*
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* %19, align 16, !alias.scope !20, !noalias !22
  %20 = getelementptr [2048 x [2048 x i32]], [2048 x [2048 x i32]]* @Y, i64 0, i64 %13, i64 %6
  %21 = bitcast i32* %20 to <4 x i32>*
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* %21, align 16, !alias.scope !23, !noalias !24
  %22 = getelementptr [2048 x [2048 x i32]], [2048 x [2048 x i32]]* @X, i64 0, i64 %13, i64 %7
  %23 = bitcast i32* %22 to <4 x i32>*
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* %23, align 16, !alias.scope !20, !noalias !22
  %24 = getelementptr [2048 x [2048 x i32]], [2048 x [2048 x i32]]* @Y, i64 0, i64 %13, i64 %7
  %25 = bitcast i32* %24 to <4 x i32>*
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* %25, align 16, !alias.scope !23, !noalias !24
  %26 = getelementptr [2048 x [2048 x i32]], [2048 x [2048 x i32]]* @X, i64 0, i64 %13, i64 %8
  %27 = bitcast i32* %26 to <4 x i32>*
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* %27, align 16, !alias.scope !20, !noalias !22
  %28 = getelementptr [2048 x [2048 x i32]], [2048 x [2048 x i32]]* @Y, i64 0, i64 %13, i64 %8
  %29 = bitcast i32* %28 to <4 x i32>*
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* %29, align 16, !alias.scope !23, !noalias !24
  %30 = getelementptr [2048 x [2048 x i32]], [2048 x [2048 x i32]]* @X, i64 0, i64 %13, i64 %9
  %31 = bitcast i32* %30 to <4 x i32>*
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* %31, align 16, !alias.scope !20, !noalias !22
  %32 = getelementptr [2048 x [2048 x i32]], [2048 x [2048 x i32]]* @Y, i64 0, i64 %13, i64 %9
  %33 = bitcast i32* %32 to <4 x i32>*
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* %33, align 16, !alias.scope !23, !noalias !24
  %34 = getelementptr [2048 x [2048 x i32]], [2048 x [2048 x i32]]* @X, i64 0, i64 %13, i64 %10
  %35 = bitcast i32* %34 to <4 x i32>*
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* %35, align 16, !alias.scope !20, !noalias !22
  %36 = getelementptr [2048 x [2048 x i32]], [2048 x [2048 x i32]]* @Y, i64 0, i64 %13, i64 %10
  %37 = bitcast i32* %36 to <4 x i32>*
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* %37, align 16, !alias.scope !23, !noalias !24
  %38 = getelementptr [2048 x [2048 x i32]], [2048 x [2048 x i32]]* @X, i64 0, i64 %13, i64 %11
  %39 = bitcast i32* %38 to <4 x i32>*
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* %39, align 16, !alias.scope !20, !noalias !22
  %40 = getelementptr [2048 x [2048 x i32]], [2048 x [2048 x i32]]* @Y, i64 0, i64 %13, i64 %11
  %41 = bitcast i32* %40 to <4 x i32>*
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* %41, align 16, !alias.scope !23, !noalias !24
  %42 = getelementptr [2048 x [2048 x i32]], [2048 x [2048 x i32]]* @X, i64 0, i64 %13, i64 %12
  %43 = bitcast i32* %42 to <4 x i32>*
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* %43, align 16, !alias.scope !20, !noalias !22
  %44 = getelementptr [2048 x [2048 x i32]], [2048 x [2048 x i32]]* @Y, i64 0, i64 %13, i64 %12
  %45 = bitcast i32* %44 to <4 x i32>*
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* %45, align 16, !alias.scope !23, !noalias !24
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

define internal void @transpose_polly_subfn(i8* nocapture readonly %polly.par.userContext) #6 {
polly.par.setup:
  %polly.par.LBPtr = alloca i64, align 8
  %polly.par.UBPtr = alloca i64, align 8
  %0 = bitcast i8* %polly.par.userContext to i32*
  %polly.subfunc.arg.index = load i32, i32* %0, align 4
  %1 = getelementptr inbounds i8, i8* %polly.par.userContext, i64 8
  %2 = bitcast i8* %1 to i8**
  %polly.subfunc.arg.call = load i8*, i8** %2, align 8
  %3 = call i8 @GOMP_loop_runtime_next(i64* nonnull %polly.par.LBPtr, i64* nonnull %polly.par.UBPtr)
  %4 = icmp eq i8 %3, 0
  br i1 %4, label %polly.par.exit, label %polly.par.loadIVBounds.preheader

polly.par.loadIVBounds.preheader:                 ; preds = %polly.par.setup
  %5 = sext i32 %polly.subfunc.arg.index to i64
  %scevgep = getelementptr [2048 x [2048 x i32]], [2048 x [2048 x i32]]* @Y, i64 0, i64 0, i64 %5
  br label %polly.par.loadIVBounds

polly.par.exit.loopexit:                          ; preds = %polly.par.checkNext.loopexit
  br label %polly.par.exit

polly.par.exit:                                   ; preds = %polly.par.exit.loopexit, %polly.par.setup
  call void @GOMP_loop_end_nowait()
  ret void

polly.par.checkNext.loopexit:                     ; preds = %polly.loop_exit4
  %6 = call i8 @GOMP_loop_runtime_next(i64* nonnull %polly.par.LBPtr, i64* nonnull %polly.par.UBPtr)
  %7 = icmp eq i8 %6, 0
  br i1 %7, label %polly.par.exit.loopexit, label %polly.par.loadIVBounds

polly.par.loadIVBounds:                           ; preds = %polly.par.loadIVBounds.preheader, %polly.par.checkNext.loopexit
  %polly.par.UB = load i64, i64* %polly.par.UBPtr, align 8
  %polly.par.LB = load i64, i64* %polly.par.LBPtr, align 8
  %polly.adjust_ub = add i64 %polly.par.UB, -2
  br label %polly.loop_preheader3

polly.loop_exit4:                                 ; preds = %polly.loop_exit10
  %polly.indvar_next = add nsw i64 %polly.indvar, 1
  %polly.loop_cond = icmp sgt i64 %polly.indvar, %polly.adjust_ub
  br i1 %polly.loop_cond, label %polly.par.checkNext.loopexit, label %polly.loop_preheader3

polly.loop_exit10:                                ; preds = %polly.loop_header8
  %polly.indvar_next6 = add nuw nsw i64 %polly.indvar5, 1
  %exitcond19 = icmp eq i64 %polly.indvar_next6, 32
  br i1 %exitcond19, label %polly.loop_exit4, label %polly.loop_preheader9

polly.loop_preheader3:                            ; preds = %polly.par.loadIVBounds, %polly.loop_exit4
  %polly.indvar = phi i64 [ %polly.par.LB, %polly.par.loadIVBounds ], [ %polly.indvar_next, %polly.loop_exit4 ]
  %8 = shl nsw i64 %polly.indvar, 5
  br label %polly.loop_preheader9

polly.loop_header8:                               ; preds = %polly.loop_header8, %polly.loop_preheader9
  %polly.indvar11 = phi i64 [ 0, %polly.loop_preheader9 ], [ %polly.indvar_next12, %polly.loop_header8 ]
  %9 = add nsw i64 %polly.indvar11, %8
  %10 = shl i64 %9, 11
  %scevgep15 = getelementptr i32, i32* %scevgep14, i64 %10
  %_p_scalar_ = load i32, i32* %scevgep15, align 4, !alias.scope !25, !noalias !27, !llvm.mem.parallel_loop_access !29
  %11 = shl i64 %9, 2
  %scevgep17 = getelementptr i8, i8* %scevgep16, i64 %11
  %scevgep1718 = bitcast i8* %scevgep17 to i32*
  store i32 %_p_scalar_, i32* %scevgep1718, align 4, !alias.scope !28, !noalias !30, !llvm.mem.parallel_loop_access !29
  %polly.indvar_next12 = add nuw nsw i64 %polly.indvar11, 1
  %exitcond = icmp eq i64 %polly.indvar_next12, 32
  br i1 %exitcond, label %polly.loop_exit10, label %polly.loop_header8, !llvm.loop !29

polly.loop_preheader9:                            ; preds = %polly.loop_exit10, %polly.loop_preheader3
  %polly.indvar5 = phi i64 [ 0, %polly.loop_preheader3 ], [ %polly.indvar_next6, %polly.loop_exit10 ]
  %12 = shl i64 %polly.indvar5, 17
  %scevgep14 = getelementptr i32, i32* %scevgep, i64 %12
  %13 = shl i64 %polly.indvar5, 8
  %scevgep16 = getelementptr i8, i8* %polly.subfunc.arg.call, i64 %13
  br label %polly.loop_header8
}

define internal void @transpose_polly_subfn_1(i8* %polly.par.userContext) #6 {
polly.par.setup:
  %polly.par.LBPtr = alloca i64
  %polly.par.UBPtr = alloca i64
  %polly.par.userContext1 = bitcast i8* %polly.par.userContext to { i32, i8* }*
  %0 = getelementptr inbounds { i32, i8* }, { i32, i8* }* %polly.par.userContext1, i32 0, i32 0
  %polly.subfunc.arg.index = load i32, i32* %0
  %1 = getelementptr inbounds { i32, i8* }, { i32, i8* }* %polly.par.userContext1, i32 0, i32 1
  %polly.subfunc.arg.call = load i8*, i8** %1
  br label %polly.par.checkNext

polly.par.exit:                                   ; preds = %polly.par.checkNext
  call void @GOMP_loop_end_nowait()
  ret void

polly.par.checkNext:                              ; preds = %polly.loop_exit, %polly.par.setup
  %2 = call i8 @GOMP_loop_runtime_next(i64* %polly.par.LBPtr, i64* %polly.par.UBPtr)
  %3 = icmp ne i8 %2, 0
  br i1 %3, label %polly.par.loadIVBounds, label %polly.par.exit

polly.par.loadIVBounds:                           ; preds = %polly.par.checkNext
  %polly.par.LB = load i64, i64* %polly.par.LBPtr
  %polly.par.UB = load i64, i64* %polly.par.UBPtr
  %polly.par.UBAdjusted = sub i64 %polly.par.UB, 1
  br label %polly.loop_preheader

polly.loop_exit:                                  ; preds = %polly.loop_exit4
  br label %polly.par.checkNext

polly.loop_header:                                ; preds = %polly.loop_exit4, %polly.loop_preheader
  %polly.indvar = phi i64 [ %polly.par.LB, %polly.loop_preheader ], [ %polly.indvar_next, %polly.loop_exit4 ]
  br label %polly.loop_preheader3

polly.loop_exit4:                                 ; preds = %polly.stmt.for.body3
  %polly.indvar_next = add nsw i64 %polly.indvar, 1
  %polly.adjust_ub = sub i64 %polly.par.UBAdjusted, 1
  %polly.loop_cond = icmp sle i64 %polly.indvar, %polly.adjust_ub
  br i1 %polly.loop_cond, label %polly.loop_header, label %polly.loop_exit

polly.loop_preheader:                             ; preds = %polly.par.loadIVBounds
  %4 = sext i32 %polly.subfunc.arg.index to i64
  %scevgep = getelementptr [2048 x [2048 x i32]], [2048 x [2048 x i32]]* @Y, i64 0, i64 0, i64 %4
  %scevgep13 = getelementptr [2048 x [2048 x i32]], [2048 x [2048 x i32]]* @Y, i64 0, i64 1, i64 %4
  %scevgep17 = getelementptr i8, i8* %polly.subfunc.arg.call, i64 4
  %scevgep21 = getelementptr [2048 x [2048 x i32]], [2048 x [2048 x i32]]* @Y, i64 0, i64 2, i64 %4
  %scevgep25 = getelementptr i8, i8* %polly.subfunc.arg.call, i64 8
  %scevgep29 = getelementptr [2048 x [2048 x i32]], [2048 x [2048 x i32]]* @Y, i64 0, i64 3, i64 %4
  %scevgep33 = getelementptr i8, i8* %polly.subfunc.arg.call, i64 12
  br label %polly.loop_header

polly.loop_header2:                               ; preds = %polly.stmt.for.body3, %polly.loop_preheader3
  %polly.indvar5 = phi i64 [ 0, %polly.loop_preheader3 ], [ %polly.indvar_next6, %polly.stmt.for.body3 ]
  br label %polly.stmt.for.body3

polly.stmt.for.body3:                             ; preds = %polly.loop_header2
  %5 = shl i64 %polly.indvar5, 13
  %scevgep9 = getelementptr i32, i32* %scevgep8, i64 %5
  %_p_scalar_ = load i32, i32* %scevgep9, align 4, !alias.scope !31, !noalias !33, !llvm.mem.parallel_loop_access !35
  %6 = shl i64 %polly.indvar5, 4
  %scevgep11 = getelementptr i8, i8* %scevgep10, i64 %6
  %scevgep1112 = bitcast i8* %scevgep11 to i32*
  store i32 %_p_scalar_, i32* %scevgep1112, align 4, !alias.scope !34, !noalias !36, !llvm.mem.parallel_loop_access !35
  %7 = shl i64 %polly.indvar5, 13
  %scevgep15 = getelementptr i32, i32* %scevgep14, i64 %7
  %_p_scalar_16 = load i32, i32* %scevgep15, align 4, !alias.scope !31, !noalias !33, !llvm.mem.parallel_loop_access !35
  %8 = shl i64 %polly.indvar5, 4
  %scevgep19 = getelementptr i8, i8* %scevgep18, i64 %8
  %scevgep1920 = bitcast i8* %scevgep19 to i32*
  store i32 %_p_scalar_16, i32* %scevgep1920, align 4, !alias.scope !34, !noalias !36, !llvm.mem.parallel_loop_access !35
  %9 = shl i64 %polly.indvar5, 13
  %scevgep23 = getelementptr i32, i32* %scevgep22, i64 %9
  %_p_scalar_24 = load i32, i32* %scevgep23, align 4, !alias.scope !31, !noalias !33, !llvm.mem.parallel_loop_access !35
  %10 = shl i64 %polly.indvar5, 4
  %scevgep27 = getelementptr i8, i8* %scevgep26, i64 %10
  %scevgep2728 = bitcast i8* %scevgep27 to i32*
  store i32 %_p_scalar_24, i32* %scevgep2728, align 4, !alias.scope !34, !noalias !36, !llvm.mem.parallel_loop_access !35
  %11 = shl i64 %polly.indvar5, 13
  %scevgep31 = getelementptr i32, i32* %scevgep30, i64 %11
  %_p_scalar_32 = load i32, i32* %scevgep31, align 4, !alias.scope !31, !noalias !33, !llvm.mem.parallel_loop_access !35
  %12 = shl i64 %polly.indvar5, 4
  %scevgep35 = getelementptr i8, i8* %scevgep34, i64 %12
  %scevgep3536 = bitcast i8* %scevgep35 to i32*
  store i32 %_p_scalar_32, i32* %scevgep3536, align 4, !alias.scope !34, !noalias !36, !llvm.mem.parallel_loop_access !35
  %13 = shl i64 %polly.indvar5, 2
  %14 = add i64 %13, 4
  %p_exitcond.3 = icmp eq i64 %14, 64
  %polly.indvar_next6 = add nsw i64 %polly.indvar5, 1
  %polly.loop_cond7 = icmp sle i64 %polly.indvar5, 14
  br i1 %polly.loop_cond7, label %polly.loop_header2, label %polly.loop_exit4, !llvm.loop !35

polly.loop_preheader3:                            ; preds = %polly.loop_header
  %15 = shl i64 %polly.indvar, 17
  %scevgep8 = getelementptr i32, i32* %scevgep, i64 %15
  %16 = shl i64 %polly.indvar, 8
  %scevgep10 = getelementptr i8, i8* %polly.subfunc.arg.call, i64 %16
  %scevgep14 = getelementptr i32, i32* %scevgep13, i64 %15
  %scevgep18 = getelementptr i8, i8* %scevgep17, i64 %16
  %scevgep22 = getelementptr i32, i32* %scevgep21, i64 %15
  %scevgep26 = getelementptr i8, i8* %scevgep25, i64 %16
  %17 = shl i64 %polly.indvar, 17
  %scevgep30 = getelementptr i32, i32* %scevgep29, i64 %17
  %18 = shl i64 %polly.indvar, 8
  %scevgep34 = getelementptr i8, i8* %scevgep33, i64 %18
  br label %polly.loop_header2
}

define internal void @main_polly_subfn(i8* %polly.par.userContext) #6 {
polly.par.setup:
  %polly.par.LBPtr = alloca i64
  %polly.par.UBPtr = alloca i64
  %polly.par.userContext1 = bitcast i8* %polly.par.userContext to { i64, i64, i8* }*
  %0 = getelementptr inbounds { i64, i64, i8* }, { i64, i64, i8* }* %polly.par.userContext1, i32 0, i32 0
  %polly.subfunc.arg.indvars.iv3 = load i64, i64* %0
  %1 = getelementptr inbounds { i64, i64, i8* }, { i64, i64, i8* }* %polly.par.userContext1, i32 0, i32 1
  %polly.subfunc.arg. = load i64, i64* %1
  %2 = getelementptr inbounds { i64, i64, i8* }, { i64, i64, i8* }* %polly.par.userContext1, i32 0, i32 2
  %polly.subfunc.arg.call.i = load i8*, i8** %2
  br label %polly.par.checkNext

polly.par.exit:                                   ; preds = %polly.par.checkNext
  call void @GOMP_loop_end_nowait()
  ret void

polly.par.checkNext:                              ; preds = %polly.loop_exit, %polly.par.setup
  %3 = call i8 @GOMP_loop_runtime_next(i64* %polly.par.LBPtr, i64* %polly.par.UBPtr)
  %4 = icmp ne i8 %3, 0
  br i1 %4, label %polly.par.loadIVBounds, label %polly.par.exit

polly.par.loadIVBounds:                           ; preds = %polly.par.checkNext
  %polly.par.LB = load i64, i64* %polly.par.LBPtr
  %polly.par.UB = load i64, i64* %polly.par.UBPtr
  %polly.par.UBAdjusted = sub i64 %polly.par.UB, 1
  br label %polly.loop_preheader

polly.loop_exit:                                  ; preds = %polly.loop_exit4
  br label %polly.par.checkNext

polly.loop_header:                                ; preds = %polly.loop_exit4, %polly.loop_preheader
  %polly.indvar = phi i64 [ %polly.par.LB, %polly.loop_preheader ], [ %polly.indvar_next, %polly.loop_exit4 ]
  br label %polly.loop_preheader3

polly.loop_exit4:                                 ; preds = %polly.stmt.for.body3.i
  %polly.indvar_next = add nsw i64 %polly.indvar, 1
  %polly.adjust_ub = sub i64 %polly.par.UBAdjusted, 1
  %polly.loop_cond = icmp sle i64 %polly.indvar, %polly.adjust_ub
  br i1 %polly.loop_cond, label %polly.loop_header, label %polly.loop_exit

polly.loop_preheader:                             ; preds = %polly.par.loadIVBounds
  %scevgep = getelementptr [2048 x [2048 x i32]], [2048 x [2048 x i32]]* @Y, i64 0, i64 0, i64 %polly.subfunc.arg.
  %scevgep13 = getelementptr [2048 x [2048 x i32]], [2048 x [2048 x i32]]* @Y, i64 0, i64 1, i64 %polly.subfunc.arg.
  %scevgep17 = getelementptr i8, i8* %polly.subfunc.arg.call.i, i64 4
  %scevgep21 = getelementptr [2048 x [2048 x i32]], [2048 x [2048 x i32]]* @Y, i64 0, i64 2, i64 %polly.subfunc.arg.
  %scevgep25 = getelementptr i8, i8* %polly.subfunc.arg.call.i, i64 8
  %scevgep29 = getelementptr [2048 x [2048 x i32]], [2048 x [2048 x i32]]* @Y, i64 0, i64 3, i64 %polly.subfunc.arg.
  %scevgep33 = getelementptr i8, i8* %polly.subfunc.arg.call.i, i64 12
  br label %polly.loop_header

polly.loop_header2:                               ; preds = %polly.stmt.for.body3.i, %polly.loop_preheader3
  %polly.indvar5 = phi i64 [ 0, %polly.loop_preheader3 ], [ %polly.indvar_next6, %polly.stmt.for.body3.i ]
  br label %polly.stmt.for.body3.i

polly.stmt.for.body3.i:                           ; preds = %polly.loop_header2
  %5 = shl i64 %polly.indvar5, 13
  %scevgep9 = getelementptr i32, i32* %scevgep8, i64 %5
  %_p_scalar_ = load i32, i32* %scevgep9, align 4, !alias.scope !37, !noalias !39, !llvm.mem.parallel_loop_access !41
  %6 = shl i64 %polly.indvar5, 4
  %scevgep11 = getelementptr i8, i8* %scevgep10, i64 %6
  %scevgep1112 = bitcast i8* %scevgep11 to i32*
  store i32 %_p_scalar_, i32* %scevgep1112, align 4, !alias.scope !40, !noalias !42, !llvm.mem.parallel_loop_access !41
  %7 = shl i64 %polly.indvar5, 13
  %scevgep15 = getelementptr i32, i32* %scevgep14, i64 %7
  %_p_scalar_16 = load i32, i32* %scevgep15, align 4, !alias.scope !37, !noalias !39, !llvm.mem.parallel_loop_access !41
  %8 = shl i64 %polly.indvar5, 4
  %scevgep19 = getelementptr i8, i8* %scevgep18, i64 %8
  %scevgep1920 = bitcast i8* %scevgep19 to i32*
  store i32 %_p_scalar_16, i32* %scevgep1920, align 4, !alias.scope !40, !noalias !42, !llvm.mem.parallel_loop_access !41
  %9 = shl i64 %polly.indvar5, 13
  %scevgep23 = getelementptr i32, i32* %scevgep22, i64 %9
  %_p_scalar_24 = load i32, i32* %scevgep23, align 4, !alias.scope !37, !noalias !39, !llvm.mem.parallel_loop_access !41
  %10 = shl i64 %polly.indvar5, 4
  %scevgep27 = getelementptr i8, i8* %scevgep26, i64 %10
  %scevgep2728 = bitcast i8* %scevgep27 to i32*
  store i32 %_p_scalar_24, i32* %scevgep2728, align 4, !alias.scope !40, !noalias !42, !llvm.mem.parallel_loop_access !41
  %11 = shl i64 %polly.indvar5, 13
  %scevgep31 = getelementptr i32, i32* %scevgep30, i64 %11
  %_p_scalar_32 = load i32, i32* %scevgep31, align 4, !alias.scope !37, !noalias !39, !llvm.mem.parallel_loop_access !41
  %12 = shl i64 %polly.indvar5, 4
  %scevgep35 = getelementptr i8, i8* %scevgep34, i64 %12
  %scevgep3536 = bitcast i8* %scevgep35 to i32*
  store i32 %_p_scalar_32, i32* %scevgep3536, align 4, !alias.scope !40, !noalias !42, !llvm.mem.parallel_loop_access !41
  %13 = shl i64 %polly.indvar5, 2
  %14 = add i64 %13, 4
  %p_exitcond.i.3 = icmp eq i64 %14, 64
  %polly.indvar_next6 = add nsw i64 %polly.indvar5, 1
  %polly.loop_cond7 = icmp sle i64 %polly.indvar5, 14
  br i1 %polly.loop_cond7, label %polly.loop_header2, label %polly.loop_exit4, !llvm.loop !41

polly.loop_preheader3:                            ; preds = %polly.loop_header
  %15 = shl i64 %polly.indvar, 17
  %scevgep8 = getelementptr i32, i32* %scevgep, i64 %15
  %16 = shl i64 %polly.indvar, 8
  %scevgep10 = getelementptr i8, i8* %polly.subfunc.arg.call.i, i64 %16
  %scevgep14 = getelementptr i32, i32* %scevgep13, i64 %15
  %scevgep18 = getelementptr i8, i8* %scevgep17, i64 %16
  %scevgep22 = getelementptr i32, i32* %scevgep21, i64 %15
  %scevgep26 = getelementptr i8, i8* %scevgep25, i64 %16
  %17 = shl i64 %polly.indvar, 17
  %scevgep30 = getelementptr i32, i32* %scevgep29, i64 %17
  %18 = shl i64 %polly.indvar, 8
  %scevgep34 = getelementptr i8, i8* %scevgep33, i64 %18
  br label %polly.loop_header2
}

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "polly-optimized" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { norecurse nounwind readonly uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "polly-optimized" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }
attributes #5 = { argmemonly nounwind }
attributes #6 = { "polly.skip.fn" }

!llvm.ident = !{!0}

!0 = !{!"clang version 3.9.0 (http://llvm.org/git/clang.git e177b4a63ca92c5fec010986944530688e104074) (http://llvm.org/git/llvm.git fcd97ccb03712372fe95f1732638de5ed3fcabe8)"}
!1 = distinct !{!1, !2, !"polly.alias.scope.sum"}
!2 = distinct !{!2, !"polly.alias.scope.domain"}
!3 = !{!4, !5, !6, !7, !8, !9}
!4 = distinct !{!4, !2, !"polly.alias.scope.add21"}
!5 = distinct !{!5, !2, !"polly.alias.scope.total.02"}
!6 = distinct !{!6, !2, !"polly.alias.scope.a"}
!7 = distinct !{!7, !2, !"polly.alias.scope.b"}
!8 = distinct !{!8, !2, !"polly.alias.scope.add9.lcssa"}
!9 = distinct !{!9, !2, !"polly.alias.scope.tmp.04"}
!10 = !{!4, !5, !7, !8, !9, !1}
!11 = !{!4, !5, !6, !8, !9, !1}
!12 = distinct !{!12, !13, !"polly.alias.scope.a"}
!13 = distinct !{!13, !"polly.alias.scope.domain"}
!14 = !{!15, !16}
!15 = distinct !{!15, !13, !"polly.alias.scope.b"}
!16 = distinct !{!16, !13, !"polly.alias.scope.sum"}
!17 = distinct !{!17}
!18 = !{!12, !16}
!19 = !{!12, !15}
!20 = distinct !{!20, !21, !"polly.alias.scope.X"}
!21 = distinct !{!21, !"polly.alias.scope.domain"}
!22 = !{!23}
!23 = distinct !{!23, !21, !"polly.alias.scope.Y"}
!24 = !{!20}
!25 = distinct !{!25, !26, !"polly.alias.scope.Y"}
!26 = distinct !{!26, !"polly.alias.scope.domain"}
!27 = !{!28}
!28 = distinct !{!28, !26, !"polly.alias.scope.call"}
!29 = distinct !{!29}
!30 = !{!25}
!31 = distinct !{!31, !32, !"polly.alias.scope.Y"}
!32 = distinct !{!32, !"polly.alias.scope.domain"}
!33 = !{!34}
!34 = distinct !{!34, !32, !"polly.alias.scope.call"}
!35 = distinct !{!35}
!36 = !{!31}
!37 = distinct !{!37, !38, !"polly.alias.scope.Y"}
!38 = distinct !{!38, !"polly.alias.scope.domain"}
!39 = !{!40}
!40 = distinct !{!40, !38, !"polly.alias.scope.call.i"}
!41 = distinct !{!41}
!42 = !{!37}
