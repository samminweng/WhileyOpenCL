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
  %p_add14.s2a = alloca i32
  %total.04.phiops.0.s2a = alloca i32
  %total.04.phiops.0.phiops = alloca i32
  br label %polly.split_new_and_old

polly.merge_new_and_old:                          ; preds = %polly.exiting15, %vector.body
  %p_add14.merge = phi i32 [ %p_add14.final_reload, %polly.exiting15 ], [ %p_add14, %vector.body ]
  br label %polly.exiting

polly.exiting:                                    ; preds = %polly.merge_new_and_old
  %p_add14.lcssa = phi i32 [ %p_add14.merge, %polly.merge_new_and_old ]
  ret i32 %p_add14.lcssa

polly.split_new_and_old:                          ; preds = %entry
  br i1 true, label %polly.start, label %polly.loop_preheader2

polly.loop_preheader2:                            ; preds = %polly.split_new_and_old, %vector.body
  %total.04.phiops.0 = phi i32 [ %p_add14, %vector.body ], [ 0, %polly.split_new_and_old ]
  %polly.indvar = phi i64 [ %polly.indvar_next, %vector.body ], [ 0, %polly.split_new_and_old ]
  %0 = shl i64 %polly.indvar, 6
  %scevgep = getelementptr i32, i32* %a, i64 %0
  %scevgep8 = getelementptr i32, i32* %b, i64 %0
  br label %vector.body

vector.body:                                      ; preds = %polly.loop_preheader2
  %1 = bitcast i32* %scevgep to <4 x i32>*
  %wide.load = load <4 x i32>, <4 x i32>* %1, align 4, !alias.scope !1, !noalias !3
  %2 = bitcast i32* %scevgep8 to <4 x i32>*
  %wide.load12 = load <4 x i32>, <4 x i32>* %2, align 4, !alias.scope !7, !noalias !9
  %3 = mul nsw <4 x i32> %wide.load12, %wide.load
  %4 = getelementptr i32, i32* %scevgep, i64 4
  %5 = bitcast i32* %4 to <4 x i32>*
  %wide.load.1 = load <4 x i32>, <4 x i32>* %5, align 4, !alias.scope !1, !noalias !3
  %6 = getelementptr i32, i32* %scevgep8, i64 4
  %7 = bitcast i32* %6 to <4 x i32>*
  %wide.load12.1 = load <4 x i32>, <4 x i32>* %7, align 4, !alias.scope !7, !noalias !9
  %8 = mul nsw <4 x i32> %wide.load12.1, %wide.load.1
  %9 = add nsw <4 x i32> %8, %3
  %10 = getelementptr i32, i32* %scevgep, i64 8
  %11 = bitcast i32* %10 to <4 x i32>*
  %wide.load.2 = load <4 x i32>, <4 x i32>* %11, align 4, !alias.scope !1, !noalias !3
  %12 = getelementptr i32, i32* %scevgep8, i64 8
  %13 = bitcast i32* %12 to <4 x i32>*
  %wide.load12.2 = load <4 x i32>, <4 x i32>* %13, align 4, !alias.scope !7, !noalias !9
  %14 = mul nsw <4 x i32> %wide.load12.2, %wide.load.2
  %15 = add nsw <4 x i32> %14, %9
  %16 = getelementptr i32, i32* %scevgep, i64 12
  %17 = bitcast i32* %16 to <4 x i32>*
  %wide.load.3 = load <4 x i32>, <4 x i32>* %17, align 4, !alias.scope !1, !noalias !3
  %18 = getelementptr i32, i32* %scevgep8, i64 12
  %19 = bitcast i32* %18 to <4 x i32>*
  %wide.load12.3 = load <4 x i32>, <4 x i32>* %19, align 4, !alias.scope !7, !noalias !9
  %20 = mul nsw <4 x i32> %wide.load12.3, %wide.load.3
  %21 = add nsw <4 x i32> %20, %15
  %22 = getelementptr i32, i32* %scevgep, i64 16
  %23 = bitcast i32* %22 to <4 x i32>*
  %wide.load.4 = load <4 x i32>, <4 x i32>* %23, align 4, !alias.scope !1, !noalias !3
  %24 = getelementptr i32, i32* %scevgep8, i64 16
  %25 = bitcast i32* %24 to <4 x i32>*
  %wide.load12.4 = load <4 x i32>, <4 x i32>* %25, align 4, !alias.scope !7, !noalias !9
  %26 = mul nsw <4 x i32> %wide.load12.4, %wide.load.4
  %27 = add nsw <4 x i32> %26, %21
  %28 = getelementptr i32, i32* %scevgep, i64 20
  %29 = bitcast i32* %28 to <4 x i32>*
  %wide.load.5 = load <4 x i32>, <4 x i32>* %29, align 4, !alias.scope !1, !noalias !3
  %30 = getelementptr i32, i32* %scevgep8, i64 20
  %31 = bitcast i32* %30 to <4 x i32>*
  %wide.load12.5 = load <4 x i32>, <4 x i32>* %31, align 4, !alias.scope !7, !noalias !9
  %32 = mul nsw <4 x i32> %wide.load12.5, %wide.load.5
  %33 = add nsw <4 x i32> %32, %27
  %34 = getelementptr i32, i32* %scevgep, i64 24
  %35 = bitcast i32* %34 to <4 x i32>*
  %wide.load.6 = load <4 x i32>, <4 x i32>* %35, align 4, !alias.scope !1, !noalias !3
  %36 = getelementptr i32, i32* %scevgep8, i64 24
  %37 = bitcast i32* %36 to <4 x i32>*
  %wide.load12.6 = load <4 x i32>, <4 x i32>* %37, align 4, !alias.scope !7, !noalias !9
  %38 = mul nsw <4 x i32> %wide.load12.6, %wide.load.6
  %39 = add nsw <4 x i32> %38, %33
  %40 = getelementptr i32, i32* %scevgep, i64 28
  %41 = bitcast i32* %40 to <4 x i32>*
  %wide.load.7 = load <4 x i32>, <4 x i32>* %41, align 4, !alias.scope !1, !noalias !3
  %42 = getelementptr i32, i32* %scevgep8, i64 28
  %43 = bitcast i32* %42 to <4 x i32>*
  %wide.load12.7 = load <4 x i32>, <4 x i32>* %43, align 4, !alias.scope !7, !noalias !9
  %44 = mul nsw <4 x i32> %wide.load12.7, %wide.load.7
  %45 = add nsw <4 x i32> %44, %39
  %46 = getelementptr i32, i32* %scevgep, i64 32
  %47 = bitcast i32* %46 to <4 x i32>*
  %wide.load.8 = load <4 x i32>, <4 x i32>* %47, align 4, !alias.scope !1, !noalias !3
  %48 = getelementptr i32, i32* %scevgep8, i64 32
  %49 = bitcast i32* %48 to <4 x i32>*
  %wide.load12.8 = load <4 x i32>, <4 x i32>* %49, align 4, !alias.scope !7, !noalias !9
  %50 = mul nsw <4 x i32> %wide.load12.8, %wide.load.8
  %51 = add nsw <4 x i32> %50, %45
  %52 = getelementptr i32, i32* %scevgep, i64 36
  %53 = bitcast i32* %52 to <4 x i32>*
  %wide.load.9 = load <4 x i32>, <4 x i32>* %53, align 4, !alias.scope !1, !noalias !3
  %54 = getelementptr i32, i32* %scevgep8, i64 36
  %55 = bitcast i32* %54 to <4 x i32>*
  %wide.load12.9 = load <4 x i32>, <4 x i32>* %55, align 4, !alias.scope !7, !noalias !9
  %56 = mul nsw <4 x i32> %wide.load12.9, %wide.load.9
  %57 = add nsw <4 x i32> %56, %51
  %58 = getelementptr i32, i32* %scevgep, i64 40
  %59 = bitcast i32* %58 to <4 x i32>*
  %wide.load.10 = load <4 x i32>, <4 x i32>* %59, align 4, !alias.scope !1, !noalias !3
  %60 = getelementptr i32, i32* %scevgep8, i64 40
  %61 = bitcast i32* %60 to <4 x i32>*
  %wide.load12.10 = load <4 x i32>, <4 x i32>* %61, align 4, !alias.scope !7, !noalias !9
  %62 = mul nsw <4 x i32> %wide.load12.10, %wide.load.10
  %63 = add nsw <4 x i32> %62, %57
  %64 = getelementptr i32, i32* %scevgep, i64 44
  %65 = bitcast i32* %64 to <4 x i32>*
  %wide.load.11 = load <4 x i32>, <4 x i32>* %65, align 4, !alias.scope !1, !noalias !3
  %66 = getelementptr i32, i32* %scevgep8, i64 44
  %67 = bitcast i32* %66 to <4 x i32>*
  %wide.load12.11 = load <4 x i32>, <4 x i32>* %67, align 4, !alias.scope !7, !noalias !9
  %68 = mul nsw <4 x i32> %wide.load12.11, %wide.load.11
  %69 = add nsw <4 x i32> %68, %63
  %70 = getelementptr i32, i32* %scevgep, i64 48
  %71 = bitcast i32* %70 to <4 x i32>*
  %wide.load.12 = load <4 x i32>, <4 x i32>* %71, align 4, !alias.scope !1, !noalias !3
  %72 = getelementptr i32, i32* %scevgep8, i64 48
  %73 = bitcast i32* %72 to <4 x i32>*
  %wide.load12.12 = load <4 x i32>, <4 x i32>* %73, align 4, !alias.scope !7, !noalias !9
  %74 = mul nsw <4 x i32> %wide.load12.12, %wide.load.12
  %75 = add nsw <4 x i32> %74, %69
  %76 = getelementptr i32, i32* %scevgep, i64 52
  %77 = bitcast i32* %76 to <4 x i32>*
  %wide.load.13 = load <4 x i32>, <4 x i32>* %77, align 4, !alias.scope !1, !noalias !3
  %78 = getelementptr i32, i32* %scevgep8, i64 52
  %79 = bitcast i32* %78 to <4 x i32>*
  %wide.load12.13 = load <4 x i32>, <4 x i32>* %79, align 4, !alias.scope !7, !noalias !9
  %80 = mul nsw <4 x i32> %wide.load12.13, %wide.load.13
  %81 = add nsw <4 x i32> %80, %75
  %82 = getelementptr i32, i32* %scevgep, i64 56
  %83 = bitcast i32* %82 to <4 x i32>*
  %wide.load.14 = load <4 x i32>, <4 x i32>* %83, align 4, !alias.scope !1, !noalias !3
  %84 = getelementptr i32, i32* %scevgep8, i64 56
  %85 = bitcast i32* %84 to <4 x i32>*
  %wide.load12.14 = load <4 x i32>, <4 x i32>* %85, align 4, !alias.scope !7, !noalias !9
  %86 = mul nsw <4 x i32> %wide.load12.14, %wide.load.14
  %87 = add nsw <4 x i32> %86, %81
  %88 = getelementptr i32, i32* %scevgep, i64 60
  %89 = bitcast i32* %88 to <4 x i32>*
  %wide.load.15 = load <4 x i32>, <4 x i32>* %89, align 4, !alias.scope !1, !noalias !3
  %90 = getelementptr i32, i32* %scevgep8, i64 60
  %91 = bitcast i32* %90 to <4 x i32>*
  %wide.load12.15 = load <4 x i32>, <4 x i32>* %91, align 4, !alias.scope !7, !noalias !9
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
  br i1 %exitcond11, label %polly.merge_new_and_old, label %polly.loop_preheader2

polly.start:                                      ; preds = %polly.split_new_and_old
  store i32 0, i32* %total.04.phiops.0.phiops
  br label %polly.loop_preheader

polly.loop_exit:                                  ; preds = %polly.stmt.vector.body
  br label %polly.exiting15

polly.exiting15:                                  ; preds = %polly.loop_exit
  %p_add14.final_reload = load i32, i32* %p_add14.s2a
  br label %polly.merge_new_and_old

polly.loop_header:                                ; preds = %polly.stmt.vector.body, %polly.loop_preheader
  %polly.indvar16 = phi i64 [ 0, %polly.loop_preheader ], [ %polly.indvar_next17, %polly.stmt.vector.body ]
  br label %polly.stmt.polly.loop_preheader2

polly.stmt.polly.loop_preheader2:                 ; preds = %polly.loop_header
  %total.04.phiops.0.phiops.reload = load i32, i32* %total.04.phiops.0.phiops
  store i32 %total.04.phiops.0.phiops.reload, i32* %total.04.phiops.0.s2a
  br label %polly.stmt.vector.body

polly.stmt.vector.body:                           ; preds = %polly.stmt.polly.loop_preheader2
  %total.04.phiops.0.s2a.reload = load i32, i32* %total.04.phiops.0.s2a
  %95 = shl i64 %polly.indvar16, 6
  %scevgep18 = getelementptr i32, i32* %a, i64 %95
  %scevgep1819 = bitcast i32* %scevgep18 to <4 x i32>*
  %wide.load_p_scalar_ = load <4 x i32>, <4 x i32>* %scevgep1819, align 4, !alias.scope !10, !noalias !12
  %scevgep20 = getelementptr i32, i32* %b, i64 %95
  %scevgep2021 = bitcast i32* %scevgep20 to <4 x i32>*
  %wide.load12_p_scalar_ = load <4 x i32>, <4 x i32>* %scevgep2021, align 4, !alias.scope !15, !noalias !16
  %p_ = mul nsw <4 x i32> %wide.load12_p_scalar_, %wide.load_p_scalar_
  %96 = shl i64 %polly.indvar16, 6
  %scevgep23 = getelementptr i32, i32* %scevgep22, i64 %96
  %scevgep2324 = bitcast i32* %scevgep23 to <4 x i32>*
  %wide.load.1_p_scalar_ = load <4 x i32>, <4 x i32>* %scevgep2324, align 4, !alias.scope !10, !noalias !12
  %scevgep26 = getelementptr i32, i32* %scevgep25, i64 %96
  %scevgep2627 = bitcast i32* %scevgep26 to <4 x i32>*
  %wide.load12.1_p_scalar_ = load <4 x i32>, <4 x i32>* %scevgep2627, align 4, !alias.scope !15, !noalias !16
  %p_28 = mul nsw <4 x i32> %wide.load12.1_p_scalar_, %wide.load.1_p_scalar_
  %p_29 = add nsw <4 x i32> %p_28, %p_
  %97 = shl i64 %polly.indvar16, 6
  %scevgep31 = getelementptr i32, i32* %scevgep30, i64 %97
  %scevgep3132 = bitcast i32* %scevgep31 to <4 x i32>*
  %wide.load.2_p_scalar_ = load <4 x i32>, <4 x i32>* %scevgep3132, align 4, !alias.scope !10, !noalias !12
  %scevgep34 = getelementptr i32, i32* %scevgep33, i64 %97
  %scevgep3435 = bitcast i32* %scevgep34 to <4 x i32>*
  %wide.load12.2_p_scalar_ = load <4 x i32>, <4 x i32>* %scevgep3435, align 4, !alias.scope !15, !noalias !16
  %p_36 = mul nsw <4 x i32> %wide.load12.2_p_scalar_, %wide.load.2_p_scalar_
  %p_37 = add nsw <4 x i32> %p_36, %p_29
  %98 = shl i64 %polly.indvar16, 6
  %scevgep39 = getelementptr i32, i32* %scevgep38, i64 %98
  %scevgep3940 = bitcast i32* %scevgep39 to <4 x i32>*
  %wide.load.3_p_scalar_ = load <4 x i32>, <4 x i32>* %scevgep3940, align 4, !alias.scope !10, !noalias !12
  %scevgep42 = getelementptr i32, i32* %scevgep41, i64 %98
  %scevgep4243 = bitcast i32* %scevgep42 to <4 x i32>*
  %wide.load12.3_p_scalar_ = load <4 x i32>, <4 x i32>* %scevgep4243, align 4, !alias.scope !15, !noalias !16
  %p_44 = mul nsw <4 x i32> %wide.load12.3_p_scalar_, %wide.load.3_p_scalar_
  %p_45 = add nsw <4 x i32> %p_44, %p_37
  %99 = shl i64 %polly.indvar16, 6
  %scevgep47 = getelementptr i32, i32* %scevgep46, i64 %99
  %scevgep4748 = bitcast i32* %scevgep47 to <4 x i32>*
  %wide.load.4_p_scalar_ = load <4 x i32>, <4 x i32>* %scevgep4748, align 4, !alias.scope !10, !noalias !12
  %scevgep50 = getelementptr i32, i32* %scevgep49, i64 %99
  %scevgep5051 = bitcast i32* %scevgep50 to <4 x i32>*
  %wide.load12.4_p_scalar_ = load <4 x i32>, <4 x i32>* %scevgep5051, align 4, !alias.scope !15, !noalias !16
  %p_52 = mul nsw <4 x i32> %wide.load12.4_p_scalar_, %wide.load.4_p_scalar_
  %p_53 = add nsw <4 x i32> %p_52, %p_45
  %100 = shl i64 %polly.indvar16, 6
  %scevgep55 = getelementptr i32, i32* %scevgep54, i64 %100
  %scevgep5556 = bitcast i32* %scevgep55 to <4 x i32>*
  %wide.load.5_p_scalar_ = load <4 x i32>, <4 x i32>* %scevgep5556, align 4, !alias.scope !10, !noalias !12
  %scevgep58 = getelementptr i32, i32* %scevgep57, i64 %100
  %scevgep5859 = bitcast i32* %scevgep58 to <4 x i32>*
  %wide.load12.5_p_scalar_ = load <4 x i32>, <4 x i32>* %scevgep5859, align 4, !alias.scope !15, !noalias !16
  %p_60 = mul nsw <4 x i32> %wide.load12.5_p_scalar_, %wide.load.5_p_scalar_
  %p_61 = add nsw <4 x i32> %p_60, %p_53
  %101 = shl i64 %polly.indvar16, 6
  %scevgep63 = getelementptr i32, i32* %scevgep62, i64 %101
  %scevgep6364 = bitcast i32* %scevgep63 to <4 x i32>*
  %wide.load.6_p_scalar_ = load <4 x i32>, <4 x i32>* %scevgep6364, align 4, !alias.scope !10, !noalias !12
  %scevgep66 = getelementptr i32, i32* %scevgep65, i64 %101
  %scevgep6667 = bitcast i32* %scevgep66 to <4 x i32>*
  %wide.load12.6_p_scalar_ = load <4 x i32>, <4 x i32>* %scevgep6667, align 4, !alias.scope !15, !noalias !16
  %p_68 = mul nsw <4 x i32> %wide.load12.6_p_scalar_, %wide.load.6_p_scalar_
  %p_69 = add nsw <4 x i32> %p_68, %p_61
  %102 = shl i64 %polly.indvar16, 6
  %scevgep71 = getelementptr i32, i32* %scevgep70, i64 %102
  %scevgep7172 = bitcast i32* %scevgep71 to <4 x i32>*
  %wide.load.7_p_scalar_ = load <4 x i32>, <4 x i32>* %scevgep7172, align 4, !alias.scope !10, !noalias !12
  %scevgep74 = getelementptr i32, i32* %scevgep73, i64 %102
  %scevgep7475 = bitcast i32* %scevgep74 to <4 x i32>*
  %wide.load12.7_p_scalar_ = load <4 x i32>, <4 x i32>* %scevgep7475, align 4, !alias.scope !15, !noalias !16
  %p_76 = mul nsw <4 x i32> %wide.load12.7_p_scalar_, %wide.load.7_p_scalar_
  %p_77 = add nsw <4 x i32> %p_76, %p_69
  %103 = shl i64 %polly.indvar16, 6
  %scevgep79 = getelementptr i32, i32* %scevgep78, i64 %103
  %scevgep7980 = bitcast i32* %scevgep79 to <4 x i32>*
  %wide.load.8_p_scalar_ = load <4 x i32>, <4 x i32>* %scevgep7980, align 4, !alias.scope !10, !noalias !12
  %scevgep82 = getelementptr i32, i32* %scevgep81, i64 %103
  %scevgep8283 = bitcast i32* %scevgep82 to <4 x i32>*
  %wide.load12.8_p_scalar_ = load <4 x i32>, <4 x i32>* %scevgep8283, align 4, !alias.scope !15, !noalias !16
  %p_84 = mul nsw <4 x i32> %wide.load12.8_p_scalar_, %wide.load.8_p_scalar_
  %p_85 = add nsw <4 x i32> %p_84, %p_77
  %104 = shl i64 %polly.indvar16, 6
  %scevgep87 = getelementptr i32, i32* %scevgep86, i64 %104
  %scevgep8788 = bitcast i32* %scevgep87 to <4 x i32>*
  %wide.load.9_p_scalar_ = load <4 x i32>, <4 x i32>* %scevgep8788, align 4, !alias.scope !10, !noalias !12
  %scevgep90 = getelementptr i32, i32* %scevgep89, i64 %104
  %scevgep9091 = bitcast i32* %scevgep90 to <4 x i32>*
  %wide.load12.9_p_scalar_ = load <4 x i32>, <4 x i32>* %scevgep9091, align 4, !alias.scope !15, !noalias !16
  %p_92 = mul nsw <4 x i32> %wide.load12.9_p_scalar_, %wide.load.9_p_scalar_
  %p_93 = add nsw <4 x i32> %p_92, %p_85
  %105 = shl i64 %polly.indvar16, 6
  %scevgep95 = getelementptr i32, i32* %scevgep94, i64 %105
  %scevgep9596 = bitcast i32* %scevgep95 to <4 x i32>*
  %wide.load.10_p_scalar_ = load <4 x i32>, <4 x i32>* %scevgep9596, align 4, !alias.scope !10, !noalias !12
  %scevgep98 = getelementptr i32, i32* %scevgep97, i64 %105
  %scevgep9899 = bitcast i32* %scevgep98 to <4 x i32>*
  %wide.load12.10_p_scalar_ = load <4 x i32>, <4 x i32>* %scevgep9899, align 4, !alias.scope !15, !noalias !16
  %p_100 = mul nsw <4 x i32> %wide.load12.10_p_scalar_, %wide.load.10_p_scalar_
  %p_101 = add nsw <4 x i32> %p_100, %p_93
  %106 = shl i64 %polly.indvar16, 6
  %scevgep103 = getelementptr i32, i32* %scevgep102, i64 %106
  %scevgep103104 = bitcast i32* %scevgep103 to <4 x i32>*
  %wide.load.11_p_scalar_ = load <4 x i32>, <4 x i32>* %scevgep103104, align 4, !alias.scope !10, !noalias !12
  %scevgep106 = getelementptr i32, i32* %scevgep105, i64 %106
  %scevgep106107 = bitcast i32* %scevgep106 to <4 x i32>*
  %wide.load12.11_p_scalar_ = load <4 x i32>, <4 x i32>* %scevgep106107, align 4, !alias.scope !15, !noalias !16
  %p_108 = mul nsw <4 x i32> %wide.load12.11_p_scalar_, %wide.load.11_p_scalar_
  %p_109 = add nsw <4 x i32> %p_108, %p_101
  %107 = shl i64 %polly.indvar16, 6
  %scevgep111 = getelementptr i32, i32* %scevgep110, i64 %107
  %scevgep111112 = bitcast i32* %scevgep111 to <4 x i32>*
  %wide.load.12_p_scalar_ = load <4 x i32>, <4 x i32>* %scevgep111112, align 4, !alias.scope !10, !noalias !12
  %scevgep114 = getelementptr i32, i32* %scevgep113, i64 %107
  %scevgep114115 = bitcast i32* %scevgep114 to <4 x i32>*
  %wide.load12.12_p_scalar_ = load <4 x i32>, <4 x i32>* %scevgep114115, align 4, !alias.scope !15, !noalias !16
  %p_116 = mul nsw <4 x i32> %wide.load12.12_p_scalar_, %wide.load.12_p_scalar_
  %p_117 = add nsw <4 x i32> %p_116, %p_109
  %108 = shl i64 %polly.indvar16, 6
  %scevgep119 = getelementptr i32, i32* %scevgep118, i64 %108
  %scevgep119120 = bitcast i32* %scevgep119 to <4 x i32>*
  %wide.load.13_p_scalar_ = load <4 x i32>, <4 x i32>* %scevgep119120, align 4, !alias.scope !10, !noalias !12
  %scevgep122 = getelementptr i32, i32* %scevgep121, i64 %108
  %scevgep122123 = bitcast i32* %scevgep122 to <4 x i32>*
  %wide.load12.13_p_scalar_ = load <4 x i32>, <4 x i32>* %scevgep122123, align 4, !alias.scope !15, !noalias !16
  %p_124 = mul nsw <4 x i32> %wide.load12.13_p_scalar_, %wide.load.13_p_scalar_
  %p_125 = add nsw <4 x i32> %p_124, %p_117
  %109 = shl i64 %polly.indvar16, 6
  %scevgep127 = getelementptr i32, i32* %scevgep126, i64 %109
  %scevgep127128 = bitcast i32* %scevgep127 to <4 x i32>*
  %wide.load.14_p_scalar_ = load <4 x i32>, <4 x i32>* %scevgep127128, align 4, !alias.scope !10, !noalias !12
  %scevgep130 = getelementptr i32, i32* %scevgep129, i64 %109
  %scevgep130131 = bitcast i32* %scevgep130 to <4 x i32>*
  %wide.load12.14_p_scalar_ = load <4 x i32>, <4 x i32>* %scevgep130131, align 4, !alias.scope !15, !noalias !16
  %p_132 = mul nsw <4 x i32> %wide.load12.14_p_scalar_, %wide.load.14_p_scalar_
  %p_133 = add nsw <4 x i32> %p_132, %p_125
  %110 = shl i64 %polly.indvar16, 6
  %scevgep135 = getelementptr i32, i32* %scevgep134, i64 %110
  %scevgep135136 = bitcast i32* %scevgep135 to <4 x i32>*
  %wide.load.15_p_scalar_ = load <4 x i32>, <4 x i32>* %scevgep135136, align 4, !alias.scope !10, !noalias !12
  %scevgep138 = getelementptr i32, i32* %scevgep137, i64 %110
  %scevgep138139 = bitcast i32* %scevgep138 to <4 x i32>*
  %wide.load12.15_p_scalar_ = load <4 x i32>, <4 x i32>* %scevgep138139, align 4, !alias.scope !15, !noalias !16
  %p_140 = mul nsw <4 x i32> %wide.load12.15_p_scalar_, %wide.load.15_p_scalar_
  %p_141 = add nsw <4 x i32> %p_140, %p_133
  %p_rdx.shuf = shufflevector <4 x i32> %p_141, <4 x i32> undef, <4 x i32> <i32 2, i32 3, i32 undef, i32 undef>
  %p_bin.rdx = add <4 x i32> %p_141, %p_rdx.shuf
  %p_rdx.shuf13 = shufflevector <4 x i32> %p_bin.rdx, <4 x i32> undef, <4 x i32> <i32 1, i32 undef, i32 undef, i32 undef>
  %p_bin.rdx14 = add <4 x i32> %p_bin.rdx, %p_rdx.shuf13
  %p_142 = extractelement <4 x i32> %p_bin.rdx14, i32 0
  %p_p_add14 = add nsw i32 %p_142, %total.04.phiops.0.s2a.reload
  %111 = add i64 %polly.indvar16, 1
  %p_exitcond11 = icmp eq i64 %111, 32
  store i32 %p_p_add14, i32* %total.04.phiops.0.phiops
  store i32 %p_p_add14, i32* %p_add14.s2a
  %polly.indvar_next17 = add nsw i64 %polly.indvar16, 1
  %polly.loop_cond = icmp sle i64 %polly.indvar16, 30
  br i1 %polly.loop_cond, label %polly.loop_header, label %polly.loop_exit

polly.loop_preheader:                             ; preds = %polly.start
  %scevgep22 = getelementptr i32, i32* %a, i64 4
  %scevgep25 = getelementptr i32, i32* %b, i64 4
  %scevgep30 = getelementptr i32, i32* %a, i64 8
  %scevgep33 = getelementptr i32, i32* %b, i64 8
  %scevgep38 = getelementptr i32, i32* %a, i64 12
  %scevgep41 = getelementptr i32, i32* %b, i64 12
  %scevgep46 = getelementptr i32, i32* %a, i64 16
  %scevgep49 = getelementptr i32, i32* %b, i64 16
  %scevgep54 = getelementptr i32, i32* %a, i64 20
  %scevgep57 = getelementptr i32, i32* %b, i64 20
  %scevgep62 = getelementptr i32, i32* %a, i64 24
  %scevgep65 = getelementptr i32, i32* %b, i64 24
  %scevgep70 = getelementptr i32, i32* %a, i64 28
  %scevgep73 = getelementptr i32, i32* %b, i64 28
  %scevgep78 = getelementptr i32, i32* %a, i64 32
  %scevgep81 = getelementptr i32, i32* %b, i64 32
  %scevgep86 = getelementptr i32, i32* %a, i64 36
  %scevgep89 = getelementptr i32, i32* %b, i64 36
  %scevgep94 = getelementptr i32, i32* %a, i64 40
  %scevgep97 = getelementptr i32, i32* %b, i64 40
  %scevgep102 = getelementptr i32, i32* %a, i64 44
  %scevgep105 = getelementptr i32, i32* %b, i64 44
  %scevgep110 = getelementptr i32, i32* %a, i64 48
  %scevgep113 = getelementptr i32, i32* %b, i64 48
  %scevgep118 = getelementptr i32, i32* %a, i64 52
  %scevgep121 = getelementptr i32, i32* %b, i64 52
  %scevgep126 = getelementptr i32, i32* %a, i64 56
  %scevgep129 = getelementptr i32, i32* %b, i64 56
  %scevgep134 = getelementptr i32, i32* %a, i64 60
  %scevgep137 = getelementptr i32, i32* %b, i64 60
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
  %polly.par.userContext.i19 = alloca { i32, i8* }, align 8
  %0 = bitcast {}* %polly.par.userContext.i to i8*
  call void @llvm.lifetime.start(i64 0, i8* %0) #4
  call void @GOMP_parallel_loop_runtime_start(void (i8*)* nonnull @init_polly_subfn, i8* %0, i32 0, i64 0, i64 64, i64 1) #4
  call void @init_polly_subfn(i8* %0) #4
  call void @GOMP_parallel_end() #4
  call void @llvm.lifetime.end(i64 8, i8* %0) #4
  %1 = bitcast { i32, i8* }* %polly.par.userContext.i19 to i8*
  %polly.subfn.storeaddr.index.i = getelementptr inbounds { i32, i8* }, { i32, i8* }* %polly.par.userContext.i19, i64 0, i32 0
  %polly.subfn.storeaddr.call.i = getelementptr inbounds { i32, i8* }, { i32, i8* }* %polly.par.userContext.i19, i64 0, i32 1
  br label %for.body

for.body:                                         ; preds = %for.end17, %entry
  %indvars.iv8 = phi i64 [ 0, %entry ], [ %indvars.iv.next9, %for.end17 ]
  %2 = shl i64 %indvars.iv8, 0
  %3 = add i64 %2, 0
  %4 = trunc i64 %indvars.iv8 to i32
  %call.i = tail call noalias i8* @malloc(i64 8192) #4
  %5 = bitcast i8* %call.i to i32*
  %6 = icmp ult i32 %4, 2048
  br i1 %6, label %polly.parallel.for.i, label %for.cond1.preheader.preheader.i

for.cond1.preheader.preheader.i:                  ; preds = %for.body
  %sext = shl i64 %indvars.iv8, 32
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
  br i1 %exitcond9.i, label %transpose.exit.loopexit, label %for.cond1.preheader.i

polly.parallel.for.i:                             ; preds = %for.body
  call void @llvm.lifetime.start(i64 16, i8* %1) #4
  store i32 %4, i32* %polly.subfn.storeaddr.index.i, align 8
  store i8* %call.i, i8** %polly.subfn.storeaddr.call.i, align 8
  call void @GOMP_parallel_loop_runtime_start(void (i8*)* nonnull @transpose_polly_subfn, i8* %1, i32 0, i64 0, i64 2, i64 1) #4
  call void @transpose_polly_subfn(i8* %1) #4
  call void @GOMP_parallel_end() #4
  call void @llvm.lifetime.end(i64 8, i8* %1) #4
  br label %transpose.exit

transpose.exit.loopexit:                          ; preds = %for.inc10.i
  br label %polly.merge_new_and_old

polly.merge_new_and_old:                          ; preds = %polly.exiting, %transpose.exit.loopexit
  br label %transpose.exit

transpose.exit:                                   ; preds = %polly.merge_new_and_old, %polly.parallel.for.i
  %polly.access.call = getelementptr i8, i8* %call.i, i64 8192
  %16 = bitcast i8* %polly.access.call to i32*
  %polly.access.Z = getelementptr [2048 x [2048 x i32]], [2048 x [2048 x i32]]* @Z, i64 0, i64 0, i64 %indvars.iv8
  %17 = icmp ule i32* %16, %polly.access.Z
  %polly.access.add.Z1 = add nuw nsw i64 %indvars.iv8, 4192257
  %polly.access.Z2 = getelementptr [2048 x [2048 x i32]], [2048 x [2048 x i32]]* @Z, i64 0, i64 0, i64 %polly.access.add.Z1
  %18 = icmp ule i32* %polly.access.Z2, %5
  %19 = or i1 %18, %17
  %20 = icmp uge i32* %polly.access.Z, getelementptr inbounds ([2048 x [2048 x i32]], [2048 x [2048 x i32]]* @X, i64 1, i64 0, i64 0)
  %21 = icmp ule i32* %polly.access.Z2, getelementptr inbounds ([2048 x [2048 x i32]], [2048 x [2048 x i32]]* @X, i64 0, i64 0, i64 0)
  %22 = or i1 %20, %21
  %23 = and i1 %22, %19
  br i1 %23, label %vector.ph.preheader, label %vector.ph38.preheader

vector.ph38.preheader:                            ; preds = %transpose.exit
  br label %vector.ph38

vector.ph.preheader:                              ; preds = %transpose.exit
  br label %vector.ph

vector.ph38:                                      ; preds = %vector.ph38.preheader, %middle.block35
  %indvars.iv5 = phi i64 [ %indvars.iv.next6, %middle.block35 ], [ 0, %vector.ph38.preheader ]
  br label %vector.body34

vector.body34:                                    ; preds = %vector.body34, %vector.ph38
  %index39 = phi i64 [ 0, %vector.ph38 ], [ %index.next40.1, %vector.body34 ]
  %vec.phi47 = phi <4 x i32> [ zeroinitializer, %vector.ph38 ], [ %46, %vector.body34 ]
  %vec.phi48 = phi <4 x i32> [ zeroinitializer, %vector.ph38 ], [ %47, %vector.body34 ]
  %24 = getelementptr inbounds [2048 x [2048 x i32]], [2048 x [2048 x i32]]* @X, i64 0, i64 %indvars.iv5, i64 %index39
  %25 = bitcast i32* %24 to <4 x i32>*
  %wide.load49 = load <4 x i32>, <4 x i32>* %25, align 16
  %26 = getelementptr i32, i32* %24, i64 4
  %27 = bitcast i32* %26 to <4 x i32>*
  %wide.load50 = load <4 x i32>, <4 x i32>* %27, align 16
  %28 = getelementptr inbounds i32, i32* %5, i64 %index39
  %29 = bitcast i32* %28 to <4 x i32>*
  %wide.load51 = load <4 x i32>, <4 x i32>* %29, align 4
  %30 = getelementptr i32, i32* %28, i64 4
  %31 = bitcast i32* %30 to <4 x i32>*
  %wide.load52 = load <4 x i32>, <4 x i32>* %31, align 4
  %32 = mul nsw <4 x i32> %wide.load51, %wide.load49
  %33 = mul nsw <4 x i32> %wide.load52, %wide.load50
  %34 = add nsw <4 x i32> %32, %vec.phi47
  %35 = add nsw <4 x i32> %33, %vec.phi48
  %index.next40 = or i64 %index39, 8
  %36 = getelementptr inbounds [2048 x [2048 x i32]], [2048 x [2048 x i32]]* @X, i64 0, i64 %indvars.iv5, i64 %index.next40
  %37 = bitcast i32* %36 to <4 x i32>*
  %wide.load49.1 = load <4 x i32>, <4 x i32>* %37, align 16
  %38 = getelementptr i32, i32* %36, i64 4
  %39 = bitcast i32* %38 to <4 x i32>*
  %wide.load50.1 = load <4 x i32>, <4 x i32>* %39, align 16
  %40 = getelementptr inbounds i32, i32* %5, i64 %index.next40
  %41 = bitcast i32* %40 to <4 x i32>*
  %wide.load51.1 = load <4 x i32>, <4 x i32>* %41, align 4
  %42 = getelementptr i32, i32* %40, i64 4
  %43 = bitcast i32* %42 to <4 x i32>*
  %wide.load52.1 = load <4 x i32>, <4 x i32>* %43, align 4
  %44 = mul nsw <4 x i32> %wide.load51.1, %wide.load49.1
  %45 = mul nsw <4 x i32> %wide.load52.1, %wide.load50.1
  %46 = add nsw <4 x i32> %44, %34
  %47 = add nsw <4 x i32> %45, %35
  %index.next40.1 = add nsw i64 %index39, 16
  %48 = icmp eq i64 %index.next40.1, 2048
  br i1 %48, label %middle.block35, label %vector.body34, !llvm.loop !17

middle.block35:                                   ; preds = %vector.body34
  %.lcssa63 = phi <4 x i32> [ %47, %vector.body34 ]
  %.lcssa = phi <4 x i32> [ %46, %vector.body34 ]
  %bin.rdx53 = add <4 x i32> %.lcssa63, %.lcssa
  %rdx.shuf54 = shufflevector <4 x i32> %bin.rdx53, <4 x i32> undef, <4 x i32> <i32 2, i32 3, i32 undef, i32 undef>
  %bin.rdx55 = add <4 x i32> %bin.rdx53, %rdx.shuf54
  %rdx.shuf56 = shufflevector <4 x i32> %bin.rdx55, <4 x i32> undef, <4 x i32> <i32 1, i32 undef, i32 undef, i32 undef>
  %bin.rdx57 = add <4 x i32> %bin.rdx55, %rdx.shuf56
  %49 = extractelement <4 x i32> %bin.rdx57, i32 0
  %arrayidx14 = getelementptr inbounds [2048 x [2048 x i32]], [2048 x [2048 x i32]]* @Z, i64 0, i64 %indvars.iv5, i64 %indvars.iv8
  store i32 %49, i32* %arrayidx14, align 4
  %indvars.iv.next6 = add nuw nsw i64 %indvars.iv5, 1
  %exitcond7 = icmp eq i64 %indvars.iv.next6, 2048
  br i1 %exitcond7, label %for.end17.loopexit59, label %vector.ph38

for.end17.loopexit:                               ; preds = %middle.block
  br label %for.end17

for.end17.loopexit59:                             ; preds = %middle.block35
  br label %for.end17

for.end17:                                        ; preds = %for.end17.loopexit59, %for.end17.loopexit
  tail call void @free(i8* nonnull %call.i) #4
  %indvars.iv.next9 = add nuw nsw i64 %indvars.iv8, 1
  %exitcond10 = icmp eq i64 %indvars.iv.next9, 2048
  br i1 %exitcond10, label %for.end20, label %for.body

for.end20:                                        ; preds = %for.end17
  %50 = load i32, i32* getelementptr inbounds ([2048 x [2048 x i32]], [2048 x [2048 x i32]]* @Z, i64 0, i64 2047, i64 2047), align 4
  %call21 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([46 x i8], [46 x i8]* @.str.2, i64 0, i64 0), i32 2048, i32 2048, i32 2047, i32 2047, i32 %50) #4
  ret i32 0

vector.ph:                                        ; preds = %vector.ph.preheader, %middle.block
  %polly.indvar = phi i64 [ %polly.indvar_next, %middle.block ], [ 0, %vector.ph.preheader ]
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next.1, %vector.body ]
  %vec.phi = phi <4 x i32> [ zeroinitializer, %vector.ph ], [ %73, %vector.body ]
  %vec.phi26 = phi <4 x i32> [ zeroinitializer, %vector.ph ], [ %74, %vector.body ]
  %51 = getelementptr [2048 x [2048 x i32]], [2048 x [2048 x i32]]* @X, i64 0, i64 %polly.indvar, i64 %index
  %52 = bitcast i32* %51 to <4 x i32>*
  %wide.load = load <4 x i32>, <4 x i32>* %52, align 16, !alias.scope !20, !noalias !22
  %53 = getelementptr i32, i32* %51, i64 4
  %54 = bitcast i32* %53 to <4 x i32>*
  %wide.load28 = load <4 x i32>, <4 x i32>* %54, align 16, !alias.scope !20, !noalias !22
  %55 = getelementptr i32, i32* %5, i64 %index
  %56 = bitcast i32* %55 to <4 x i32>*
  %wide.load29 = load <4 x i32>, <4 x i32>* %56, align 4, !alias.scope !24, !noalias !27
  %57 = getelementptr i32, i32* %55, i64 4
  %58 = bitcast i32* %57 to <4 x i32>*
  %wide.load30 = load <4 x i32>, <4 x i32>* %58, align 4, !alias.scope !24, !noalias !27
  %59 = mul nsw <4 x i32> %wide.load29, %wide.load
  %60 = mul nsw <4 x i32> %wide.load30, %wide.load28
  %61 = add nsw <4 x i32> %59, %vec.phi
  %62 = add nsw <4 x i32> %60, %vec.phi26
  %index.next = or i64 %index, 8
  %63 = getelementptr [2048 x [2048 x i32]], [2048 x [2048 x i32]]* @X, i64 0, i64 %polly.indvar, i64 %index.next
  %64 = bitcast i32* %63 to <4 x i32>*
  %wide.load.1 = load <4 x i32>, <4 x i32>* %64, align 16, !alias.scope !20, !noalias !22
  %65 = getelementptr i32, i32* %63, i64 4
  %66 = bitcast i32* %65 to <4 x i32>*
  %wide.load28.1 = load <4 x i32>, <4 x i32>* %66, align 16, !alias.scope !20, !noalias !22
  %67 = getelementptr i32, i32* %5, i64 %index.next
  %68 = bitcast i32* %67 to <4 x i32>*
  %wide.load29.1 = load <4 x i32>, <4 x i32>* %68, align 4, !alias.scope !24, !noalias !27
  %69 = getelementptr i32, i32* %67, i64 4
  %70 = bitcast i32* %69 to <4 x i32>*
  %wide.load30.1 = load <4 x i32>, <4 x i32>* %70, align 4, !alias.scope !24, !noalias !27
  %71 = mul nsw <4 x i32> %wide.load29.1, %wide.load.1
  %72 = mul nsw <4 x i32> %wide.load30.1, %wide.load28.1
  %73 = add nsw <4 x i32> %71, %61
  %74 = add nsw <4 x i32> %72, %62
  %index.next.1 = add nsw i64 %index, 16
  %75 = icmp eq i64 %index.next.1, 2048
  br i1 %75, label %middle.block, label %vector.body, !llvm.loop !28

middle.block:                                     ; preds = %vector.body
  %.lcssa65 = phi <4 x i32> [ %74, %vector.body ]
  %.lcssa64 = phi <4 x i32> [ %73, %vector.body ]
  %bin.rdx = add <4 x i32> %.lcssa65, %.lcssa64
  %rdx.shuf = shufflevector <4 x i32> %bin.rdx, <4 x i32> undef, <4 x i32> <i32 2, i32 3, i32 undef, i32 undef>
  %bin.rdx31 = add <4 x i32> %bin.rdx, %rdx.shuf
  %rdx.shuf32 = shufflevector <4 x i32> %bin.rdx31, <4 x i32> undef, <4 x i32> <i32 1, i32 undef, i32 undef, i32 undef>
  %bin.rdx33 = add <4 x i32> %bin.rdx31, %rdx.shuf32
  %76 = extractelement <4 x i32> %bin.rdx33, i32 0
  %77 = shl i64 %polly.indvar, 11
  %scevgep18 = getelementptr i32, i32* %polly.access.Z, i64 %77
  store i32 %76, i32* %scevgep18, align 4, !alias.scope !25, !noalias !29
  %polly.indvar_next = add nuw nsw i64 %polly.indvar, 1
  %exitcond23 = icmp eq i64 %polly.indvar_next, 2048
  br i1 %exitcond23, label %for.end17.loopexit, label %vector.ph

polly.start:                                      ; preds = %polly.split_new_and_old
  br label %polly.parallel.for

polly.parallel.for:                               ; preds = %polly.start
  %78 = bitcast { i64, i64, i8* }* %polly.par.userContext to i8*
  call void @llvm.lifetime.start(i64 24, i8* %78)
  %polly.subfn.storeaddr.indvars.iv8 = getelementptr inbounds { i64, i64, i8* }, { i64, i64, i8* }* %polly.par.userContext, i32 0, i32 0
  store i64 %indvars.iv8, i64* %polly.subfn.storeaddr.indvars.iv8
  %polly.subfn.storeaddr. = getelementptr inbounds { i64, i64, i8* }, { i64, i64, i8* }* %polly.par.userContext, i32 0, i32 1
  store i64 %3, i64* %polly.subfn.storeaddr.
  %polly.subfn.storeaddr.call.i66 = getelementptr inbounds { i64, i64, i8* }, { i64, i64, i8* }* %polly.par.userContext, i32 0, i32 2
  store i8* %call.i, i8** %polly.subfn.storeaddr.call.i66
  %polly.par.userContext67 = bitcast { i64, i64, i8* }* %polly.par.userContext to i8*
  call void @GOMP_parallel_loop_runtime_start(void (i8*)* @main_polly_subfn, i8* %polly.par.userContext67, i32 0, i64 0, i64 32, i64 1)
  call void @main_polly_subfn(i8* %polly.par.userContext67)
  call void @GOMP_parallel_end()
  %79 = bitcast { i64, i64, i8* }* %polly.par.userContext to i8*
  call void @llvm.lifetime.end(i64 8, i8* %79)
  br label %polly.exiting

polly.exiting:                                    ; preds = %polly.parallel.for
  br label %polly.merge_new_and_old
}

; Function Attrs: nounwind
declare void @free(i8* nocapture) #1

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
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* %15, align 16, !alias.scope !30, !noalias !32
  %16 = getelementptr [2048 x [2048 x i32]], [2048 x [2048 x i32]]* @Y, i64 0, i64 %13, i64 %5
  %17 = bitcast i32* %16 to <4 x i32>*
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* %17, align 16, !alias.scope !33, !noalias !34
  %18 = getelementptr [2048 x [2048 x i32]], [2048 x [2048 x i32]]* @X, i64 0, i64 %13, i64 %6
  %19 = bitcast i32* %18 to <4 x i32>*
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* %19, align 16, !alias.scope !30, !noalias !32
  %20 = getelementptr [2048 x [2048 x i32]], [2048 x [2048 x i32]]* @Y, i64 0, i64 %13, i64 %6
  %21 = bitcast i32* %20 to <4 x i32>*
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* %21, align 16, !alias.scope !33, !noalias !34
  %22 = getelementptr [2048 x [2048 x i32]], [2048 x [2048 x i32]]* @X, i64 0, i64 %13, i64 %7
  %23 = bitcast i32* %22 to <4 x i32>*
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* %23, align 16, !alias.scope !30, !noalias !32
  %24 = getelementptr [2048 x [2048 x i32]], [2048 x [2048 x i32]]* @Y, i64 0, i64 %13, i64 %7
  %25 = bitcast i32* %24 to <4 x i32>*
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* %25, align 16, !alias.scope !33, !noalias !34
  %26 = getelementptr [2048 x [2048 x i32]], [2048 x [2048 x i32]]* @X, i64 0, i64 %13, i64 %8
  %27 = bitcast i32* %26 to <4 x i32>*
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* %27, align 16, !alias.scope !30, !noalias !32
  %28 = getelementptr [2048 x [2048 x i32]], [2048 x [2048 x i32]]* @Y, i64 0, i64 %13, i64 %8
  %29 = bitcast i32* %28 to <4 x i32>*
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* %29, align 16, !alias.scope !33, !noalias !34
  %30 = getelementptr [2048 x [2048 x i32]], [2048 x [2048 x i32]]* @X, i64 0, i64 %13, i64 %9
  %31 = bitcast i32* %30 to <4 x i32>*
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* %31, align 16, !alias.scope !30, !noalias !32
  %32 = getelementptr [2048 x [2048 x i32]], [2048 x [2048 x i32]]* @Y, i64 0, i64 %13, i64 %9
  %33 = bitcast i32* %32 to <4 x i32>*
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* %33, align 16, !alias.scope !33, !noalias !34
  %34 = getelementptr [2048 x [2048 x i32]], [2048 x [2048 x i32]]* @X, i64 0, i64 %13, i64 %10
  %35 = bitcast i32* %34 to <4 x i32>*
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* %35, align 16, !alias.scope !30, !noalias !32
  %36 = getelementptr [2048 x [2048 x i32]], [2048 x [2048 x i32]]* @Y, i64 0, i64 %13, i64 %10
  %37 = bitcast i32* %36 to <4 x i32>*
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* %37, align 16, !alias.scope !33, !noalias !34
  %38 = getelementptr [2048 x [2048 x i32]], [2048 x [2048 x i32]]* @X, i64 0, i64 %13, i64 %11
  %39 = bitcast i32* %38 to <4 x i32>*
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* %39, align 16, !alias.scope !30, !noalias !32
  %40 = getelementptr [2048 x [2048 x i32]], [2048 x [2048 x i32]]* @Y, i64 0, i64 %13, i64 %11
  %41 = bitcast i32* %40 to <4 x i32>*
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* %41, align 16, !alias.scope !33, !noalias !34
  %42 = getelementptr [2048 x [2048 x i32]], [2048 x [2048 x i32]]* @X, i64 0, i64 %13, i64 %12
  %43 = bitcast i32* %42 to <4 x i32>*
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* %43, align 16, !alias.scope !30, !noalias !32
  %44 = getelementptr [2048 x [2048 x i32]], [2048 x [2048 x i32]]* @Y, i64 0, i64 %13, i64 %12
  %45 = bitcast i32* %44 to <4 x i32>*
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* %45, align 16, !alias.scope !33, !noalias !34
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
  %_p_scalar_ = load i32, i32* %scevgep15, align 4, !alias.scope !35, !noalias !37, !llvm.mem.parallel_loop_access !39
  %11 = shl i64 %9, 2
  %scevgep17 = getelementptr i8, i8* %scevgep16, i64 %11
  %scevgep1718 = bitcast i8* %scevgep17 to i32*
  store i32 %_p_scalar_, i32* %scevgep1718, align 4, !alias.scope !38, !noalias !40, !llvm.mem.parallel_loop_access !39
  %polly.indvar_next12 = add nuw nsw i64 %polly.indvar11, 1
  %exitcond = icmp eq i64 %polly.indvar_next12, 32
  br i1 %exitcond, label %polly.loop_exit10, label %polly.loop_header8, !llvm.loop !39

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
  %_p_scalar_ = load i32, i32* %scevgep9, align 4, !alias.scope !41, !noalias !43, !llvm.mem.parallel_loop_access !45
  %6 = shl i64 %polly.indvar5, 4
  %scevgep11 = getelementptr i8, i8* %scevgep10, i64 %6
  %scevgep1112 = bitcast i8* %scevgep11 to i32*
  store i32 %_p_scalar_, i32* %scevgep1112, align 4, !alias.scope !44, !noalias !46, !llvm.mem.parallel_loop_access !45
  %7 = shl i64 %polly.indvar5, 13
  %scevgep15 = getelementptr i32, i32* %scevgep14, i64 %7
  %_p_scalar_16 = load i32, i32* %scevgep15, align 4, !alias.scope !41, !noalias !43, !llvm.mem.parallel_loop_access !45
  %8 = shl i64 %polly.indvar5, 4
  %scevgep19 = getelementptr i8, i8* %scevgep18, i64 %8
  %scevgep1920 = bitcast i8* %scevgep19 to i32*
  store i32 %_p_scalar_16, i32* %scevgep1920, align 4, !alias.scope !44, !noalias !46, !llvm.mem.parallel_loop_access !45
  %9 = shl i64 %polly.indvar5, 13
  %scevgep23 = getelementptr i32, i32* %scevgep22, i64 %9
  %_p_scalar_24 = load i32, i32* %scevgep23, align 4, !alias.scope !41, !noalias !43, !llvm.mem.parallel_loop_access !45
  %10 = shl i64 %polly.indvar5, 4
  %scevgep27 = getelementptr i8, i8* %scevgep26, i64 %10
  %scevgep2728 = bitcast i8* %scevgep27 to i32*
  store i32 %_p_scalar_24, i32* %scevgep2728, align 4, !alias.scope !44, !noalias !46, !llvm.mem.parallel_loop_access !45
  %11 = shl i64 %polly.indvar5, 13
  %scevgep31 = getelementptr i32, i32* %scevgep30, i64 %11
  %_p_scalar_32 = load i32, i32* %scevgep31, align 4, !alias.scope !41, !noalias !43, !llvm.mem.parallel_loop_access !45
  %12 = shl i64 %polly.indvar5, 4
  %scevgep35 = getelementptr i8, i8* %scevgep34, i64 %12
  %scevgep3536 = bitcast i8* %scevgep35 to i32*
  store i32 %_p_scalar_32, i32* %scevgep3536, align 4, !alias.scope !44, !noalias !46, !llvm.mem.parallel_loop_access !45
  %13 = shl i64 %polly.indvar5, 2
  %14 = add i64 %13, 4
  %p_exitcond.3 = icmp eq i64 %14, 64
  %polly.indvar_next6 = add nsw i64 %polly.indvar5, 1
  %polly.loop_cond7 = icmp sle i64 %polly.indvar5, 14
  br i1 %polly.loop_cond7, label %polly.loop_header2, label %polly.loop_exit4, !llvm.loop !45

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
  %polly.subfunc.arg.indvars.iv8 = load i64, i64* %0
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
  %_p_scalar_ = load i32, i32* %scevgep9, align 4, !alias.scope !47, !noalias !49, !llvm.mem.parallel_loop_access !51
  %6 = shl i64 %polly.indvar5, 4
  %scevgep11 = getelementptr i8, i8* %scevgep10, i64 %6
  %scevgep1112 = bitcast i8* %scevgep11 to i32*
  store i32 %_p_scalar_, i32* %scevgep1112, align 4, !alias.scope !50, !noalias !52, !llvm.mem.parallel_loop_access !51
  %7 = shl i64 %polly.indvar5, 13
  %scevgep15 = getelementptr i32, i32* %scevgep14, i64 %7
  %_p_scalar_16 = load i32, i32* %scevgep15, align 4, !alias.scope !47, !noalias !49, !llvm.mem.parallel_loop_access !51
  %8 = shl i64 %polly.indvar5, 4
  %scevgep19 = getelementptr i8, i8* %scevgep18, i64 %8
  %scevgep1920 = bitcast i8* %scevgep19 to i32*
  store i32 %_p_scalar_16, i32* %scevgep1920, align 4, !alias.scope !50, !noalias !52, !llvm.mem.parallel_loop_access !51
  %9 = shl i64 %polly.indvar5, 13
  %scevgep23 = getelementptr i32, i32* %scevgep22, i64 %9
  %_p_scalar_24 = load i32, i32* %scevgep23, align 4, !alias.scope !47, !noalias !49, !llvm.mem.parallel_loop_access !51
  %10 = shl i64 %polly.indvar5, 4
  %scevgep27 = getelementptr i8, i8* %scevgep26, i64 %10
  %scevgep2728 = bitcast i8* %scevgep27 to i32*
  store i32 %_p_scalar_24, i32* %scevgep2728, align 4, !alias.scope !50, !noalias !52, !llvm.mem.parallel_loop_access !51
  %11 = shl i64 %polly.indvar5, 13
  %scevgep31 = getelementptr i32, i32* %scevgep30, i64 %11
  %_p_scalar_32 = load i32, i32* %scevgep31, align 4, !alias.scope !47, !noalias !49, !llvm.mem.parallel_loop_access !51
  %12 = shl i64 %polly.indvar5, 4
  %scevgep35 = getelementptr i8, i8* %scevgep34, i64 %12
  %scevgep3536 = bitcast i8* %scevgep35 to i32*
  store i32 %_p_scalar_32, i32* %scevgep3536, align 4, !alias.scope !50, !noalias !52, !llvm.mem.parallel_loop_access !51
  %13 = shl i64 %polly.indvar5, 2
  %14 = add i64 %13, 4
  %p_exitcond.i.3 = icmp eq i64 %14, 64
  %polly.indvar_next6 = add nsw i64 %polly.indvar5, 1
  %polly.loop_cond7 = icmp sle i64 %polly.indvar5, 14
  br i1 %polly.loop_cond7, label %polly.loop_header2, label %polly.loop_exit4, !llvm.loop !51

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
!1 = distinct !{!1, !2, !"polly.alias.scope.a"}
!2 = distinct !{!2, !"polly.alias.scope.domain"}
!3 = !{!4, !5, !6, !7, !8}
!4 = distinct !{!4, !2, !"polly.alias.scope.tmp.02"}
!5 = distinct !{!5, !2, !"polly.alias.scope.total.04"}
!6 = distinct !{!6, !2, !"polly.alias.scope.add9.lcssa"}
!7 = distinct !{!7, !2, !"polly.alias.scope.b"}
!8 = distinct !{!8, !2, !"polly.alias.scope.add14"}
!9 = !{!4, !1, !5, !6, !8}
!10 = distinct !{!10, !11, !"polly.alias.scope.a"}
!11 = distinct !{!11, !"polly.alias.scope.domain"}
!12 = !{!13, !14, !15}
!13 = distinct !{!13, !11, !"polly.alias.scope.p_add14"}
!14 = distinct !{!14, !11, !"polly.alias.scope.total.04.phiops.0"}
!15 = distinct !{!15, !11, !"polly.alias.scope.b"}
!16 = !{!13, !10, !14}
!17 = distinct !{!17, !18, !19}
!18 = !{!"llvm.loop.vectorize.width", i32 1}
!19 = !{!"llvm.loop.interleave.count", i32 1}
!20 = distinct !{!20, !21, !"polly.alias.scope.X"}
!21 = distinct !{!21, !"polly.alias.scope.domain"}
!22 = !{!23, !24, !25, !26}
!23 = distinct !{!23, !21, !"polly.alias.scope.add.lcssa"}
!24 = distinct !{!24, !21, !"polly.alias.scope.call"}
!25 = distinct !{!25, !21, !"polly.alias.scope.Z"}
!26 = distinct !{!26, !21, !"polly.alias.scope.sum.02"}
!27 = !{!23, !20, !25, !26}
!28 = distinct !{!28, !18, !19}
!29 = !{!23, !20, !24, !26}
!30 = distinct !{!30, !31, !"polly.alias.scope.X"}
!31 = distinct !{!31, !"polly.alias.scope.domain"}
!32 = !{!33}
!33 = distinct !{!33, !31, !"polly.alias.scope.Y"}
!34 = !{!30}
!35 = distinct !{!35, !36, !"polly.alias.scope.Y"}
!36 = distinct !{!36, !"polly.alias.scope.domain"}
!37 = !{!38}
!38 = distinct !{!38, !36, !"polly.alias.scope.call"}
!39 = distinct !{!39}
!40 = !{!35}
!41 = distinct !{!41, !42, !"polly.alias.scope.Y"}
!42 = distinct !{!42, !"polly.alias.scope.domain"}
!43 = !{!44}
!44 = distinct !{!44, !42, !"polly.alias.scope.call"}
!45 = distinct !{!45}
!46 = !{!41}
!47 = distinct !{!47, !48, !"polly.alias.scope.Y"}
!48 = distinct !{!48, !"polly.alias.scope.domain"}
!49 = !{!50}
!50 = distinct !{!50, !48, !"polly.alias.scope.call.i"}
!51 = distinct !{!51}
!52 = !{!47}
