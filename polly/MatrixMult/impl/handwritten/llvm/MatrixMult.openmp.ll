; ModuleID = 'MatrixMult.preopt.ll'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@A = common global [1024 x [1024 x i64]] zeroinitializer, align 16
@B = common global [1024 x [1024 x i64]] zeroinitializer, align 16
@stdout = external global %struct._IO_FILE*, align 8
@.str = private unnamed_addr constant [6 x i8] c"%lld \00", align 1
@C = common global [1024 x [1024 x i64]] zeroinitializer, align 16
@.str.2 = private unnamed_addr constant [49 x i8] c"Pass %d X %d matrix test case (C[N][N] =%lld) \0A \00", align 1

; Function Attrs: nounwind uwtable
define void @init_array() #0 !dbg !4 {
entry:
  %polly.par.userContext = alloca {}, align 8
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !23, metadata !24), !dbg !25
  %0 = bitcast {}* %polly.par.userContext to i8*
  call void @llvm.lifetime.start(i64 0, i8* %0)
  call void @GOMP_parallel_loop_runtime_start(void (i8*)* nonnull @init_array_polly_subfn, i8* %0, i32 0, i64 0, i64 32, i64 1) #4
  call void @init_array_polly_subfn(i8* %0) #4
  call void @GOMP_parallel_end() #4
  call void @llvm.lifetime.end(i64 8, i8* %0)
  ret void, !dbg !26
}

; Function Attrs: nounwind uwtable
define void @print_array() #1 !dbg !7 {
entry:
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !27, metadata !24), !dbg !28
  br label %for.cond1.preheader, !dbg !29

for.cond1.preheader:                              ; preds = %for.end, %entry
  %indvars.iv6 = phi i64 [ 0, %entry ], [ %indvars.iv.next7, %for.end ]
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 8, !dbg !33
  br label %for.body3, !dbg !38

for.body3:                                        ; preds = %for.inc, %for.cond1.preheader
  %indvars.iv = phi i64 [ 0, %for.cond1.preheader ], [ %indvars.iv.next, %for.inc ]
  %1 = phi %struct._IO_FILE* [ %0, %for.cond1.preheader ], [ %5, %for.inc ]
  %arrayidx5 = getelementptr inbounds [1024 x [1024 x i64]], [1024 x [1024 x i64]]* @C, i64 0, i64 %indvars.iv6, i64 %indvars.iv, !dbg !40
  %2 = load i64, i64* %arrayidx5, align 8, !dbg !40
  %call = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %1, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str, i64 0, i64 0), i64 %2) #4, !dbg !41
  %3 = trunc i64 %indvars.iv to i32, !dbg !42
  %rem = srem i32 %3, 80, !dbg !42
  %cmp6 = icmp eq i32 %rem, 79, !dbg !44
  br i1 %cmp6, label %if.then, label %for.inc, !dbg !45

if.then:                                          ; preds = %for.body3
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 8, !dbg !46
  %fputc3 = tail call i32 @fputc(i32 10, %struct._IO_FILE* %4), !dbg !48
  br label %for.inc, !dbg !48

for.inc:                                          ; preds = %if.then, %for.body3
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1, !dbg !38
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 8, !dbg !33
  %exitcond = icmp eq i64 %indvars.iv.next, 1024, !dbg !38
  br i1 %exitcond, label %for.end, label %for.body3, !dbg !38

for.end:                                          ; preds = %for.inc
  %.lcssa = phi %struct._IO_FILE* [ %5, %for.inc ]
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %.lcssa), !dbg !49
  %indvars.iv.next7 = add nuw nsw i64 %indvars.iv6, 1, !dbg !29
  %exitcond8 = icmp eq i64 %indvars.iv.next7, 1024, !dbg !29
  br i1 %exitcond8, label %for.end11, label %for.cond1.preheader, !dbg !29

for.end11:                                        ; preds = %for.end
  ret void, !dbg !50
}

; Function Attrs: nounwind
declare i32 @fprintf(%struct._IO_FILE* nocapture, i8* nocapture readonly, ...) #2

; Function Attrs: nounwind uwtable
define i32 @main() #0 !dbg !8 {
entry:
  %polly.par.userContext.i = alloca {}, align 8
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !23, metadata !24) #4, !dbg !51
  %0 = bitcast {}* %polly.par.userContext.i to i8*, !dbg !53
  call void @llvm.lifetime.start(i64 0, i8* %0) #4, !dbg !53
  call void @GOMP_parallel_loop_runtime_start(void (i8*)* nonnull @init_array_polly_subfn, i8* %0, i32 0, i64 0, i64 32, i64 1) #4, !dbg !53
  call void @init_array_polly_subfn(i8* %0) #4, !dbg !53
  call void @GOMP_parallel_end() #4, !dbg !53
  call void @llvm.lifetime.end(i64 8, i8* %0) #4, !dbg !53
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !54, metadata !24), !dbg !55
  call void @llvm.lifetime.start(i64 0, i8* %0)
  call void @GOMP_parallel_loop_runtime_start(void (i8*)* nonnull @main_polly_subfn, i8* %0, i32 0, i64 0, i64 32, i64 1) #4
  call void @main_polly_subfn(i8* %0) #4
  call void @GOMP_parallel_end() #4
  call void @llvm.lifetime.end(i64 8, i8* %0)
  call void @llvm.lifetime.start(i64 0, i8* %0)
  call void @GOMP_parallel_loop_runtime_start(void (i8*)* nonnull @main_polly_subfn_1, i8* %0, i32 0, i64 0, i64 32, i64 1) #4
  call void @main_polly_subfn_1(i8* %0) #4
  call void @GOMP_parallel_end() #4
  call void @llvm.lifetime.end(i64 8, i8* %0)
  %1 = load i64, i64* getelementptr inbounds ([1024 x [1024 x i64]], [1024 x [1024 x i64]]* @C, i64 0, i64 1023, i64 1023), align 8, !dbg !56
  %call = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([49 x i8], [49 x i8]* @.str.2, i64 0, i64 0), i32 1024, i32 1024, i64 %1) #4, !dbg !57
  ret i32 0, !dbg !58
}

; Function Attrs: nounwind
declare i32 @printf(i8* nocapture readonly, ...) #2

; Function Attrs: nounwind readnone
declare void @llvm.dbg.value(metadata, i64, metadata, metadata) #3

; Function Attrs: nounwind
declare i32 @fputc(i32, %struct._IO_FILE* nocapture) #4

; Function Attrs: argmemonly nounwind
declare void @llvm.lifetime.start(i64, i8* nocapture) #5

define internal void @init_array_polly_subfn(i8* nocapture readnone %polly.par.userContext) #6 {
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
  %6 = or i64 %5, 2
  %7 = or i64 %5, 4
  %8 = or i64 %5, 6
  %9 = or i64 %5, 8
  %10 = or i64 %5, 10
  %11 = or i64 %5, 12
  %12 = or i64 %5, 14
  %13 = or i64 %5, 16
  %14 = or i64 %5, 18
  %15 = or i64 %5, 20
  %16 = or i64 %5, 22
  %17 = or i64 %5, 24
  %18 = or i64 %5, 26
  %19 = or i64 %5, 28
  %20 = or i64 %5, 30
  br label %polly.loop_preheader15

polly.loop_preheader15:                           ; preds = %vector.body, %polly.loop_preheader9
  %polly.indvar11 = phi i64 [ 0, %polly.loop_preheader9 ], [ %polly.indvar_next12, %vector.body ]
  %21 = add nsw i64 %polly.indvar11, %4
  br label %vector.body

vector.body:                                      ; preds = %polly.loop_preheader15
  %22 = getelementptr [1024 x [1024 x i64]], [1024 x [1024 x i64]]* @A, i64 0, i64 %21, i64 %5
  %23 = bitcast i64* %22 to <2 x i64>*
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %23, align 16, !alias.scope !59, !noalias !61
  %24 = getelementptr [1024 x [1024 x i64]], [1024 x [1024 x i64]]* @B, i64 0, i64 %21, i64 %5
  %25 = bitcast i64* %24 to <2 x i64>*
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %25, align 16, !alias.scope !62, !noalias !63
  %26 = getelementptr [1024 x [1024 x i64]], [1024 x [1024 x i64]]* @A, i64 0, i64 %21, i64 %6
  %27 = bitcast i64* %26 to <2 x i64>*
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %27, align 16, !alias.scope !59, !noalias !61
  %28 = getelementptr [1024 x [1024 x i64]], [1024 x [1024 x i64]]* @B, i64 0, i64 %21, i64 %6
  %29 = bitcast i64* %28 to <2 x i64>*
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %29, align 16, !alias.scope !62, !noalias !63
  %30 = getelementptr [1024 x [1024 x i64]], [1024 x [1024 x i64]]* @A, i64 0, i64 %21, i64 %7
  %31 = bitcast i64* %30 to <2 x i64>*
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %31, align 16, !alias.scope !59, !noalias !61
  %32 = getelementptr [1024 x [1024 x i64]], [1024 x [1024 x i64]]* @B, i64 0, i64 %21, i64 %7
  %33 = bitcast i64* %32 to <2 x i64>*
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %33, align 16, !alias.scope !62, !noalias !63
  %34 = getelementptr [1024 x [1024 x i64]], [1024 x [1024 x i64]]* @A, i64 0, i64 %21, i64 %8
  %35 = bitcast i64* %34 to <2 x i64>*
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %35, align 16, !alias.scope !59, !noalias !61
  %36 = getelementptr [1024 x [1024 x i64]], [1024 x [1024 x i64]]* @B, i64 0, i64 %21, i64 %8
  %37 = bitcast i64* %36 to <2 x i64>*
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %37, align 16, !alias.scope !62, !noalias !63
  %38 = getelementptr [1024 x [1024 x i64]], [1024 x [1024 x i64]]* @A, i64 0, i64 %21, i64 %9
  %39 = bitcast i64* %38 to <2 x i64>*
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %39, align 16, !alias.scope !59, !noalias !61
  %40 = getelementptr [1024 x [1024 x i64]], [1024 x [1024 x i64]]* @B, i64 0, i64 %21, i64 %9
  %41 = bitcast i64* %40 to <2 x i64>*
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %41, align 16, !alias.scope !62, !noalias !63
  %42 = getelementptr [1024 x [1024 x i64]], [1024 x [1024 x i64]]* @A, i64 0, i64 %21, i64 %10
  %43 = bitcast i64* %42 to <2 x i64>*
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %43, align 16, !alias.scope !59, !noalias !61
  %44 = getelementptr [1024 x [1024 x i64]], [1024 x [1024 x i64]]* @B, i64 0, i64 %21, i64 %10
  %45 = bitcast i64* %44 to <2 x i64>*
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %45, align 16, !alias.scope !62, !noalias !63
  %46 = getelementptr [1024 x [1024 x i64]], [1024 x [1024 x i64]]* @A, i64 0, i64 %21, i64 %11
  %47 = bitcast i64* %46 to <2 x i64>*
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %47, align 16, !alias.scope !59, !noalias !61
  %48 = getelementptr [1024 x [1024 x i64]], [1024 x [1024 x i64]]* @B, i64 0, i64 %21, i64 %11
  %49 = bitcast i64* %48 to <2 x i64>*
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %49, align 16, !alias.scope !62, !noalias !63
  %50 = getelementptr [1024 x [1024 x i64]], [1024 x [1024 x i64]]* @A, i64 0, i64 %21, i64 %12
  %51 = bitcast i64* %50 to <2 x i64>*
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %51, align 16, !alias.scope !59, !noalias !61
  %52 = getelementptr [1024 x [1024 x i64]], [1024 x [1024 x i64]]* @B, i64 0, i64 %21, i64 %12
  %53 = bitcast i64* %52 to <2 x i64>*
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %53, align 16, !alias.scope !62, !noalias !63
  %54 = getelementptr [1024 x [1024 x i64]], [1024 x [1024 x i64]]* @A, i64 0, i64 %21, i64 %13
  %55 = bitcast i64* %54 to <2 x i64>*
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %55, align 16, !alias.scope !59, !noalias !61
  %56 = getelementptr [1024 x [1024 x i64]], [1024 x [1024 x i64]]* @B, i64 0, i64 %21, i64 %13
  %57 = bitcast i64* %56 to <2 x i64>*
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %57, align 16, !alias.scope !62, !noalias !63
  %58 = getelementptr [1024 x [1024 x i64]], [1024 x [1024 x i64]]* @A, i64 0, i64 %21, i64 %14
  %59 = bitcast i64* %58 to <2 x i64>*
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %59, align 16, !alias.scope !59, !noalias !61
  %60 = getelementptr [1024 x [1024 x i64]], [1024 x [1024 x i64]]* @B, i64 0, i64 %21, i64 %14
  %61 = bitcast i64* %60 to <2 x i64>*
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %61, align 16, !alias.scope !62, !noalias !63
  %62 = getelementptr [1024 x [1024 x i64]], [1024 x [1024 x i64]]* @A, i64 0, i64 %21, i64 %15
  %63 = bitcast i64* %62 to <2 x i64>*
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %63, align 16, !alias.scope !59, !noalias !61
  %64 = getelementptr [1024 x [1024 x i64]], [1024 x [1024 x i64]]* @B, i64 0, i64 %21, i64 %15
  %65 = bitcast i64* %64 to <2 x i64>*
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %65, align 16, !alias.scope !62, !noalias !63
  %66 = getelementptr [1024 x [1024 x i64]], [1024 x [1024 x i64]]* @A, i64 0, i64 %21, i64 %16
  %67 = bitcast i64* %66 to <2 x i64>*
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %67, align 16, !alias.scope !59, !noalias !61
  %68 = getelementptr [1024 x [1024 x i64]], [1024 x [1024 x i64]]* @B, i64 0, i64 %21, i64 %16
  %69 = bitcast i64* %68 to <2 x i64>*
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %69, align 16, !alias.scope !62, !noalias !63
  %70 = getelementptr [1024 x [1024 x i64]], [1024 x [1024 x i64]]* @A, i64 0, i64 %21, i64 %17
  %71 = bitcast i64* %70 to <2 x i64>*
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %71, align 16, !alias.scope !59, !noalias !61
  %72 = getelementptr [1024 x [1024 x i64]], [1024 x [1024 x i64]]* @B, i64 0, i64 %21, i64 %17
  %73 = bitcast i64* %72 to <2 x i64>*
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %73, align 16, !alias.scope !62, !noalias !63
  %74 = getelementptr [1024 x [1024 x i64]], [1024 x [1024 x i64]]* @A, i64 0, i64 %21, i64 %18
  %75 = bitcast i64* %74 to <2 x i64>*
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %75, align 16, !alias.scope !59, !noalias !61
  %76 = getelementptr [1024 x [1024 x i64]], [1024 x [1024 x i64]]* @B, i64 0, i64 %21, i64 %18
  %77 = bitcast i64* %76 to <2 x i64>*
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %77, align 16, !alias.scope !62, !noalias !63
  %78 = getelementptr [1024 x [1024 x i64]], [1024 x [1024 x i64]]* @A, i64 0, i64 %21, i64 %19
  %79 = bitcast i64* %78 to <2 x i64>*
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %79, align 16, !alias.scope !59, !noalias !61
  %80 = getelementptr [1024 x [1024 x i64]], [1024 x [1024 x i64]]* @B, i64 0, i64 %21, i64 %19
  %81 = bitcast i64* %80 to <2 x i64>*
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %81, align 16, !alias.scope !62, !noalias !63
  %82 = getelementptr [1024 x [1024 x i64]], [1024 x [1024 x i64]]* @A, i64 0, i64 %21, i64 %20
  %83 = bitcast i64* %82 to <2 x i64>*
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %83, align 16, !alias.scope !59, !noalias !61
  %84 = getelementptr [1024 x [1024 x i64]], [1024 x [1024 x i64]]* @B, i64 0, i64 %21, i64 %20
  %85 = bitcast i64* %84 to <2 x i64>*
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %85, align 16, !alias.scope !62, !noalias !63
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

define internal void @main_polly_subfn(i8* nocapture readnone %polly.par.userContext) #6 {
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

polly.loop_exit4:                                 ; preds = %polly.loop_preheader15
  %polly.indvar_next = add nsw i64 %polly.indvar, 1
  %polly.loop_cond = icmp sgt i64 %polly.indvar, %polly.adjust_ub
  %indvar.next = add i64 %indvar, 1
  br i1 %polly.loop_cond, label %polly.par.checkNext.loopexit, label %polly.loop_preheader3

polly.loop_preheader3:                            ; preds = %polly.par.loadIVBounds, %polly.loop_exit4
  %indvar = phi i64 [ 0, %polly.par.loadIVBounds ], [ %indvar.next, %polly.loop_exit4 ]
  %polly.indvar = phi i64 [ %polly.par.LB, %polly.par.loadIVBounds ], [ %polly.indvar_next, %polly.loop_exit4 ]
  %4 = add i64 %polly.par.LB, %indvar
  %5 = shl i64 %4, 5
  %6 = or i64 %5, 1
  %7 = or i64 %5, 2
  %8 = or i64 %5, 3
  %9 = or i64 %5, 4
  %10 = or i64 %5, 5
  %11 = or i64 %5, 6
  %12 = or i64 %5, 7
  %13 = or i64 %5, 8
  %14 = or i64 %5, 9
  %15 = or i64 %5, 10
  %16 = or i64 %5, 11
  %17 = or i64 %5, 12
  %18 = or i64 %5, 13
  %19 = or i64 %5, 14
  %20 = or i64 %5, 15
  %21 = or i64 %5, 16
  %22 = or i64 %5, 17
  %23 = or i64 %5, 18
  %24 = or i64 %5, 19
  %25 = or i64 %5, 20
  %26 = or i64 %5, 21
  %27 = or i64 %5, 22
  %28 = or i64 %5, 23
  %29 = or i64 %5, 24
  %30 = or i64 %5, 25
  %31 = or i64 %5, 26
  %32 = or i64 %5, 27
  %33 = or i64 %5, 28
  %34 = or i64 %5, 29
  %35 = or i64 %5, 30
  %36 = or i64 %5, 31
  br label %polly.loop_preheader9

polly.loop_preheader9:                            ; preds = %polly.loop_preheader15, %polly.loop_preheader3
  %polly.indvar5 = phi i64 [ 0, %polly.loop_preheader3 ], [ %polly.indvar_next6, %polly.loop_preheader15 ]
  %37 = shl i64 %polly.indvar5, 5
  br label %polly.loop_preheader15

polly.loop_preheader15:                           ; preds = %polly.loop_preheader9
  %scevgep22 = getelementptr [1024 x [1024 x i64]], [1024 x [1024 x i64]]* @C, i64 0, i64 %5, i64 %37
  %scevgep2223 = bitcast i64* %scevgep22 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep2223, i8 0, i64 256, i32 16, i1 false)
  %scevgep22.1 = getelementptr [1024 x [1024 x i64]], [1024 x [1024 x i64]]* @C, i64 0, i64 %6, i64 %37
  %scevgep2223.1 = bitcast i64* %scevgep22.1 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep2223.1, i8 0, i64 256, i32 16, i1 false)
  %scevgep22.2 = getelementptr [1024 x [1024 x i64]], [1024 x [1024 x i64]]* @C, i64 0, i64 %7, i64 %37
  %scevgep2223.2 = bitcast i64* %scevgep22.2 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep2223.2, i8 0, i64 256, i32 16, i1 false)
  %scevgep22.3 = getelementptr [1024 x [1024 x i64]], [1024 x [1024 x i64]]* @C, i64 0, i64 %8, i64 %37
  %scevgep2223.3 = bitcast i64* %scevgep22.3 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep2223.3, i8 0, i64 256, i32 16, i1 false)
  %scevgep22.4 = getelementptr [1024 x [1024 x i64]], [1024 x [1024 x i64]]* @C, i64 0, i64 %9, i64 %37
  %scevgep2223.4 = bitcast i64* %scevgep22.4 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep2223.4, i8 0, i64 256, i32 16, i1 false)
  %scevgep22.5 = getelementptr [1024 x [1024 x i64]], [1024 x [1024 x i64]]* @C, i64 0, i64 %10, i64 %37
  %scevgep2223.5 = bitcast i64* %scevgep22.5 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep2223.5, i8 0, i64 256, i32 16, i1 false)
  %scevgep22.6 = getelementptr [1024 x [1024 x i64]], [1024 x [1024 x i64]]* @C, i64 0, i64 %11, i64 %37
  %scevgep2223.6 = bitcast i64* %scevgep22.6 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep2223.6, i8 0, i64 256, i32 16, i1 false)
  %scevgep22.7 = getelementptr [1024 x [1024 x i64]], [1024 x [1024 x i64]]* @C, i64 0, i64 %12, i64 %37
  %scevgep2223.7 = bitcast i64* %scevgep22.7 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep2223.7, i8 0, i64 256, i32 16, i1 false)
  %scevgep22.8 = getelementptr [1024 x [1024 x i64]], [1024 x [1024 x i64]]* @C, i64 0, i64 %13, i64 %37
  %scevgep2223.8 = bitcast i64* %scevgep22.8 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep2223.8, i8 0, i64 256, i32 16, i1 false)
  %scevgep22.9 = getelementptr [1024 x [1024 x i64]], [1024 x [1024 x i64]]* @C, i64 0, i64 %14, i64 %37
  %scevgep2223.9 = bitcast i64* %scevgep22.9 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep2223.9, i8 0, i64 256, i32 16, i1 false)
  %scevgep22.10 = getelementptr [1024 x [1024 x i64]], [1024 x [1024 x i64]]* @C, i64 0, i64 %15, i64 %37
  %scevgep2223.10 = bitcast i64* %scevgep22.10 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep2223.10, i8 0, i64 256, i32 16, i1 false)
  %scevgep22.11 = getelementptr [1024 x [1024 x i64]], [1024 x [1024 x i64]]* @C, i64 0, i64 %16, i64 %37
  %scevgep2223.11 = bitcast i64* %scevgep22.11 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep2223.11, i8 0, i64 256, i32 16, i1 false)
  %scevgep22.12 = getelementptr [1024 x [1024 x i64]], [1024 x [1024 x i64]]* @C, i64 0, i64 %17, i64 %37
  %scevgep2223.12 = bitcast i64* %scevgep22.12 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep2223.12, i8 0, i64 256, i32 16, i1 false)
  %scevgep22.13 = getelementptr [1024 x [1024 x i64]], [1024 x [1024 x i64]]* @C, i64 0, i64 %18, i64 %37
  %scevgep2223.13 = bitcast i64* %scevgep22.13 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep2223.13, i8 0, i64 256, i32 16, i1 false)
  %scevgep22.14 = getelementptr [1024 x [1024 x i64]], [1024 x [1024 x i64]]* @C, i64 0, i64 %19, i64 %37
  %scevgep2223.14 = bitcast i64* %scevgep22.14 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep2223.14, i8 0, i64 256, i32 16, i1 false)
  %scevgep22.15 = getelementptr [1024 x [1024 x i64]], [1024 x [1024 x i64]]* @C, i64 0, i64 %20, i64 %37
  %scevgep2223.15 = bitcast i64* %scevgep22.15 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep2223.15, i8 0, i64 256, i32 16, i1 false)
  %scevgep22.16 = getelementptr [1024 x [1024 x i64]], [1024 x [1024 x i64]]* @C, i64 0, i64 %21, i64 %37
  %scevgep2223.16 = bitcast i64* %scevgep22.16 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep2223.16, i8 0, i64 256, i32 16, i1 false)
  %scevgep22.17 = getelementptr [1024 x [1024 x i64]], [1024 x [1024 x i64]]* @C, i64 0, i64 %22, i64 %37
  %scevgep2223.17 = bitcast i64* %scevgep22.17 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep2223.17, i8 0, i64 256, i32 16, i1 false)
  %scevgep22.18 = getelementptr [1024 x [1024 x i64]], [1024 x [1024 x i64]]* @C, i64 0, i64 %23, i64 %37
  %scevgep2223.18 = bitcast i64* %scevgep22.18 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep2223.18, i8 0, i64 256, i32 16, i1 false)
  %scevgep22.19 = getelementptr [1024 x [1024 x i64]], [1024 x [1024 x i64]]* @C, i64 0, i64 %24, i64 %37
  %scevgep2223.19 = bitcast i64* %scevgep22.19 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep2223.19, i8 0, i64 256, i32 16, i1 false)
  %scevgep22.20 = getelementptr [1024 x [1024 x i64]], [1024 x [1024 x i64]]* @C, i64 0, i64 %25, i64 %37
  %scevgep2223.20 = bitcast i64* %scevgep22.20 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep2223.20, i8 0, i64 256, i32 16, i1 false)
  %scevgep22.21 = getelementptr [1024 x [1024 x i64]], [1024 x [1024 x i64]]* @C, i64 0, i64 %26, i64 %37
  %scevgep2223.21 = bitcast i64* %scevgep22.21 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep2223.21, i8 0, i64 256, i32 16, i1 false)
  %scevgep22.22 = getelementptr [1024 x [1024 x i64]], [1024 x [1024 x i64]]* @C, i64 0, i64 %27, i64 %37
  %scevgep2223.22 = bitcast i64* %scevgep22.22 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep2223.22, i8 0, i64 256, i32 16, i1 false)
  %scevgep22.23 = getelementptr [1024 x [1024 x i64]], [1024 x [1024 x i64]]* @C, i64 0, i64 %28, i64 %37
  %scevgep2223.23 = bitcast i64* %scevgep22.23 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep2223.23, i8 0, i64 256, i32 16, i1 false)
  %scevgep22.24 = getelementptr [1024 x [1024 x i64]], [1024 x [1024 x i64]]* @C, i64 0, i64 %29, i64 %37
  %scevgep2223.24 = bitcast i64* %scevgep22.24 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep2223.24, i8 0, i64 256, i32 16, i1 false)
  %scevgep22.25 = getelementptr [1024 x [1024 x i64]], [1024 x [1024 x i64]]* @C, i64 0, i64 %30, i64 %37
  %scevgep2223.25 = bitcast i64* %scevgep22.25 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep2223.25, i8 0, i64 256, i32 16, i1 false)
  %scevgep22.26 = getelementptr [1024 x [1024 x i64]], [1024 x [1024 x i64]]* @C, i64 0, i64 %31, i64 %37
  %scevgep2223.26 = bitcast i64* %scevgep22.26 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep2223.26, i8 0, i64 256, i32 16, i1 false)
  %scevgep22.27 = getelementptr [1024 x [1024 x i64]], [1024 x [1024 x i64]]* @C, i64 0, i64 %32, i64 %37
  %scevgep2223.27 = bitcast i64* %scevgep22.27 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep2223.27, i8 0, i64 256, i32 16, i1 false)
  %scevgep22.28 = getelementptr [1024 x [1024 x i64]], [1024 x [1024 x i64]]* @C, i64 0, i64 %33, i64 %37
  %scevgep2223.28 = bitcast i64* %scevgep22.28 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep2223.28, i8 0, i64 256, i32 16, i1 false)
  %scevgep22.29 = getelementptr [1024 x [1024 x i64]], [1024 x [1024 x i64]]* @C, i64 0, i64 %34, i64 %37
  %scevgep2223.29 = bitcast i64* %scevgep22.29 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep2223.29, i8 0, i64 256, i32 16, i1 false)
  %scevgep22.30 = getelementptr [1024 x [1024 x i64]], [1024 x [1024 x i64]]* @C, i64 0, i64 %35, i64 %37
  %scevgep2223.30 = bitcast i64* %scevgep22.30 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep2223.30, i8 0, i64 256, i32 16, i1 false)
  %scevgep22.31 = getelementptr [1024 x [1024 x i64]], [1024 x [1024 x i64]]* @C, i64 0, i64 %36, i64 %37
  %scevgep2223.31 = bitcast i64* %scevgep22.31 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep2223.31, i8 0, i64 256, i32 16, i1 false)
  %polly.indvar_next6 = add nuw nsw i64 %polly.indvar5, 1
  %exitcond21 = icmp eq i64 %polly.indvar_next6, 32
  br i1 %exitcond21, label %polly.loop_exit4, label %polly.loop_preheader9
}

define internal void @main_polly_subfn_1(i8* nocapture readnone %polly.par.userContext) #6 {
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

polly.loop_exit10:                                ; preds = %polly.loop_exit16
  %polly.indvar_next6 = add nuw nsw i64 %polly.indvar5, 1
  %exitcond40 = icmp eq i64 %polly.indvar_next6, 32
  br i1 %exitcond40, label %polly.loop_exit4, label %polly.loop_preheader9

polly.loop_preheader3:                            ; preds = %polly.par.loadIVBounds, %polly.loop_exit4
  %polly.indvar = phi i64 [ %polly.par.LB, %polly.par.loadIVBounds ], [ %polly.indvar_next, %polly.loop_exit4 ]
  %4 = shl nsw i64 %polly.indvar, 5
  br label %polly.loop_preheader9

polly.loop_exit16:                                ; preds = %polly.loop_exit22
  %polly.indvar_next12 = add nuw nsw i64 %polly.indvar11, 1
  %exitcond39 = icmp eq i64 %polly.indvar_next12, 32
  br i1 %exitcond39, label %polly.loop_exit10, label %polly.loop_preheader15

polly.loop_preheader9:                            ; preds = %polly.loop_exit10, %polly.loop_preheader3
  %polly.indvar5 = phi i64 [ 0, %polly.loop_preheader3 ], [ %polly.indvar_next6, %polly.loop_exit10 ]
  %5 = shl nsw i64 %polly.indvar5, 5
  br label %polly.loop_preheader15

polly.loop_exit22:                                ; preds = %polly.loop_exit28
  %polly.indvar_next18 = add nuw nsw i64 %polly.indvar17, 1
  %exitcond38 = icmp eq i64 %polly.indvar_next18, 32
  br i1 %exitcond38, label %polly.loop_exit16, label %polly.loop_preheader21

polly.loop_preheader15:                           ; preds = %polly.loop_exit16, %polly.loop_preheader9
  %polly.indvar11 = phi i64 [ 0, %polly.loop_preheader9 ], [ %polly.indvar_next12, %polly.loop_exit16 ]
  %6 = shl nsw i64 %polly.indvar11, 5
  br label %polly.loop_preheader21

polly.loop_exit28:                                ; preds = %polly.loop_header26
  %p_add.lcssa = phi i64 [ %p_add, %polly.loop_header26 ]
  store i64 %p_add.lcssa, i64* %scevgep, align 8, !alias.scope !64, !noalias !66
  %polly.indvar_next24 = add nuw nsw i64 %polly.indvar23, 1
  %exitcond37 = icmp eq i64 %polly.indvar_next24, 32
  br i1 %exitcond37, label %polly.loop_exit22, label %polly.loop_preheader27

polly.loop_preheader21:                           ; preds = %polly.loop_exit22, %polly.loop_preheader15
  %polly.indvar17 = phi i64 [ 0, %polly.loop_preheader15 ], [ %polly.indvar_next18, %polly.loop_exit22 ]
  %7 = add nsw i64 %polly.indvar17, %4
  br label %polly.loop_preheader27

polly.loop_header26:                              ; preds = %polly.loop_header26, %polly.loop_preheader27
  %p_add41 = phi i64 [ %scevgep.promoted, %polly.loop_preheader27 ], [ %p_add, %polly.loop_header26 ]
  %polly.indvar29 = phi i64 [ 0, %polly.loop_preheader27 ], [ %polly.indvar_next30, %polly.loop_header26 ]
  %8 = add nuw nsw i64 %polly.indvar29, %6
  %scevgep32 = getelementptr [1024 x [1024 x i64]], [1024 x [1024 x i64]]* @A, i64 0, i64 %7, i64 %8
  %_p_scalar_33 = load i64, i64* %scevgep32, align 8, !alias.scope !67, !noalias !69
  %scevgep34 = getelementptr [1024 x [1024 x i64]], [1024 x [1024 x i64]]* @B, i64 0, i64 %8, i64 %9
  %_p_scalar_35 = load i64, i64* %scevgep34, align 8, !alias.scope !68, !noalias !70
  %p_mul = mul nsw i64 %_p_scalar_35, %_p_scalar_33, !dbg !71
  %p_add = add nsw i64 %p_mul, %p_add41, !dbg !80
  %polly.indvar_next30 = add nuw nsw i64 %polly.indvar29, 1
  %exitcond = icmp eq i64 %polly.indvar_next30, 32
  br i1 %exitcond, label %polly.loop_exit28, label %polly.loop_header26

polly.loop_preheader27:                           ; preds = %polly.loop_exit28, %polly.loop_preheader21
  %polly.indvar23 = phi i64 [ 0, %polly.loop_preheader21 ], [ %polly.indvar_next24, %polly.loop_exit28 ]
  %9 = add nuw nsw i64 %polly.indvar23, %5
  %scevgep = getelementptr [1024 x [1024 x i64]], [1024 x [1024 x i64]]* @C, i64 0, i64 %7, i64 %9
  %scevgep.promoted = load i64, i64* %scevgep, align 8, !alias.scope !64, !noalias !66
  br label %polly.loop_header26
}

; Function Attrs: argmemonly nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture, i8, i64, i32, i1) #5

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "polly-optimized" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind readnone }
attributes #4 = { nounwind }
attributes #5 = { argmemonly nounwind }
attributes #6 = { "polly.skip.fn" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!20, !21}
!llvm.ident = !{!22}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 3.9.0 (http://llvm.org/git/clang.git e177b4a63ca92c5fec010986944530688e104074) (http://llvm.org/git/llvm.git fcd97ccb03712372fe95f1732638de5ed3fcabe8)", isOptimized: false, runtimeVersion: 0, emissionKind: 1, enums: !2, subprograms: !3, globals: !12)
!1 = !DIFile(filename: "MatrixMult.c", directory: "/home/sam/workspace/WhileyOpenCL/polly/MatrixMult/impl/handwritten")
!2 = !{}
!3 = !{!4, !7, !8}
!4 = distinct !DISubprogram(name: "init_array", scope: !1, file: !1, line: 7, type: !5, isLocal: false, isDefinition: true, scopeLine: 8, isOptimized: false, variables: !2)
!5 = !DISubroutineType(types: !6)
!6 = !{null}
!7 = distinct !DISubprogram(name: "print_array", scope: !1, file: !1, line: 19, type: !5, isLocal: false, isDefinition: true, scopeLine: 20, isOptimized: false, variables: !2)
!8 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 32, type: !9, isLocal: false, isDefinition: true, scopeLine: 33, isOptimized: false, variables: !2)
!9 = !DISubroutineType(types: !10)
!10 = !{!11}
!11 = !DIBasicType(name: "int", size: 32, align: 32, encoding: DW_ATE_signed)
!12 = !{!13, !18, !19}
!13 = !DIGlobalVariable(name: "A", scope: !0, file: !1, line: 3, type: !14, isLocal: false, isDefinition: true, variable: [1024 x [1024 x i64]]* @A)
!14 = !DICompositeType(tag: DW_TAG_array_type, baseType: !15, size: 67108864, align: 64, elements: !16)
!15 = !DIBasicType(name: "long long int", size: 64, align: 64, encoding: DW_ATE_signed)
!16 = !{!17, !17}
!17 = !DISubrange(count: 1024)
!18 = !DIGlobalVariable(name: "B", scope: !0, file: !1, line: 4, type: !14, isLocal: false, isDefinition: true, variable: [1024 x [1024 x i64]]* @B)
!19 = !DIGlobalVariable(name: "C", scope: !0, file: !1, line: 5, type: !14, isLocal: false, isDefinition: true, variable: [1024 x [1024 x i64]]* @C)
!20 = !{i32 2, !"Dwarf Version", i32 4}
!21 = !{i32 2, !"Debug Info Version", i32 3}
!22 = !{!"clang version 3.9.0 (http://llvm.org/git/clang.git e177b4a63ca92c5fec010986944530688e104074) (http://llvm.org/git/llvm.git fcd97ccb03712372fe95f1732638de5ed3fcabe8)"}
!23 = !DILocalVariable(name: "i", scope: !4, file: !1, line: 9, type: !11)
!24 = !DIExpression()
!25 = !DILocation(line: 9, column: 9, scope: !4)
!26 = !DILocation(line: 17, column: 1, scope: !4)
!27 = !DILocalVariable(name: "i", scope: !7, file: !1, line: 21, type: !11)
!28 = !DILocation(line: 21, column: 9, scope: !7)
!29 = !DILocation(line: 23, column: 5, scope: !30)
!30 = !DILexicalBlockFile(scope: !31, file: !1, discriminator: 1)
!31 = distinct !DILexicalBlock(scope: !32, file: !1, line: 23, column: 5)
!32 = distinct !DILexicalBlock(scope: !7, file: !1, line: 23, column: 5)
!33 = !DILocation(line: 25, column: 21, scope: !34)
!34 = distinct !DILexicalBlock(scope: !35, file: !1, line: 24, column: 29)
!35 = distinct !DILexicalBlock(scope: !36, file: !1, line: 24, column: 9)
!36 = distinct !DILexicalBlock(scope: !37, file: !1, line: 24, column: 9)
!37 = distinct !DILexicalBlock(scope: !31, file: !1, line: 23, column: 25)
!38 = !DILocation(line: 24, column: 9, scope: !39)
!39 = !DILexicalBlockFile(scope: !35, file: !1, discriminator: 1)
!40 = !DILocation(line: 25, column: 38, scope: !34)
!41 = !DILocation(line: 25, column: 13, scope: !34)
!42 = !DILocation(line: 26, column: 18, scope: !43)
!43 = distinct !DILexicalBlock(scope: !34, file: !1, line: 26, column: 17)
!44 = !DILocation(line: 26, column: 22, scope: !43)
!45 = !DILocation(line: 26, column: 17, scope: !34)
!46 = !DILocation(line: 26, column: 37, scope: !47)
!47 = !DILexicalBlockFile(scope: !43, file: !1, discriminator: 1)
!48 = !DILocation(line: 26, column: 29, scope: !47)
!49 = !DILocation(line: 28, column: 9, scope: !37)
!50 = !DILocation(line: 30, column: 1, scope: !7)
!51 = !DILocation(line: 9, column: 9, scope: !4, inlinedAt: !52)
!52 = distinct !DILocation(line: 37, column: 5, scope: !8)
!53 = !DILocation(line: 37, column: 5, scope: !8)
!54 = !DILocalVariable(name: "i", scope: !8, file: !1, line: 34, type: !11)
!55 = !DILocation(line: 34, column: 9, scope: !8)
!56 = !DILocation(line: 47, column: 71, scope: !8)
!57 = !DILocation(line: 47, column: 5, scope: !8)
!58 = !DILocation(line: 48, column: 5, scope: !8)
!59 = distinct !{!59, !60, !"polly.alias.scope.A"}
!60 = distinct !{!60, !"polly.alias.scope.domain"}
!61 = !{!62}
!62 = distinct !{!62, !60, !"polly.alias.scope.B"}
!63 = !{!59}
!64 = distinct !{!64, !65, !"polly.alias.scope.C"}
!65 = distinct !{!65, !"polly.alias.scope.domain"}
!66 = !{!67, !68}
!67 = distinct !{!67, !65, !"polly.alias.scope.A"}
!68 = distinct !{!68, !65, !"polly.alias.scope.B"}
!69 = !{!64, !68}
!70 = !{!67, !64}
!71 = !DILocation(line: 43, column: 45, scope: !72)
!72 = distinct !DILexicalBlock(scope: !73, file: !1, line: 42, column: 13)
!73 = distinct !DILexicalBlock(scope: !74, file: !1, line: 42, column: 13)
!74 = distinct !DILexicalBlock(scope: !75, file: !1, line: 40, column: 29)
!75 = distinct !DILexicalBlock(scope: !76, file: !1, line: 40, column: 9)
!76 = distinct !DILexicalBlock(scope: !77, file: !1, line: 40, column: 9)
!77 = distinct !DILexicalBlock(scope: !78, file: !1, line: 39, column: 25)
!78 = distinct !DILexicalBlock(scope: !79, file: !1, line: 39, column: 5)
!79 = distinct !DILexicalBlock(scope: !8, file: !1, line: 39, column: 5)
!80 = !DILocation(line: 43, column: 35, scope: !72)
