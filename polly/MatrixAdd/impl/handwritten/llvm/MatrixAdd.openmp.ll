; ModuleID = 'MatrixAdd.preopt.ll'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@A = common global [10240 x [10240 x i64]] zeroinitializer, align 16
@B = common global [10240 x [10240 x i64]] zeroinitializer, align 16
@C = common global [10240 x [10240 x i64]] zeroinitializer, align 16
@stdout = external global %struct._IO_FILE*, align 8
@.str = private unnamed_addr constant [6 x i8] c"%lld \00", align 1
@.str.2 = private unnamed_addr constant [51 x i8] c"Pass %d X %d matrix test case (C[%d][%d] =%lld) \0A \00", align 1

; Function Attrs: nounwind uwtable
define void @init_array() #0 !dbg !4 {
entry:
  br label %entry.split, !dbg !24

entry.split:                                      ; preds = %entry
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !25, metadata !26), !dbg !24
  br label %vector.ph, !dbg !27

vector.ph:                                        ; preds = %for.inc10, %entry.split
  %indvars.iv3 = phi i64 [ 0, %entry.split ], [ %indvars.iv.next4, %for.inc10 ]
  br label %vector.body, !dbg !31

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next.1, %vector.body ], !dbg !31
  %0 = getelementptr inbounds [10240 x [10240 x i64]], [10240 x [10240 x i64]]* @A, i64 0, i64 %indvars.iv3, i64 %index, !dbg !36
  %1 = bitcast i64* %0 to <2 x i64>*, !dbg !38
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %1, align 16, !dbg !38
  %2 = getelementptr i64, i64* %0, i64 2, !dbg !38
  %3 = bitcast i64* %2 to <2 x i64>*, !dbg !38
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %3, align 16, !dbg !38
  %4 = getelementptr inbounds [10240 x [10240 x i64]], [10240 x [10240 x i64]]* @B, i64 0, i64 %indvars.iv3, i64 %index, !dbg !39
  %5 = bitcast i64* %4 to <2 x i64>*, !dbg !40
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %5, align 16, !dbg !40
  %6 = getelementptr i64, i64* %4, i64 2, !dbg !40
  %7 = bitcast i64* %6 to <2 x i64>*, !dbg !40
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %7, align 16, !dbg !40
  %index.next = or i64 %index, 4, !dbg !31
  %8 = getelementptr inbounds [10240 x [10240 x i64]], [10240 x [10240 x i64]]* @A, i64 0, i64 %indvars.iv3, i64 %index.next, !dbg !36
  %9 = bitcast i64* %8 to <2 x i64>*, !dbg !38
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %9, align 16, !dbg !38
  %10 = getelementptr i64, i64* %8, i64 2, !dbg !38
  %11 = bitcast i64* %10 to <2 x i64>*, !dbg !38
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %11, align 16, !dbg !38
  %12 = getelementptr inbounds [10240 x [10240 x i64]], [10240 x [10240 x i64]]* @B, i64 0, i64 %indvars.iv3, i64 %index.next, !dbg !39
  %13 = bitcast i64* %12 to <2 x i64>*, !dbg !40
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %13, align 16, !dbg !40
  %14 = getelementptr i64, i64* %12, i64 2, !dbg !40
  %15 = bitcast i64* %14 to <2 x i64>*, !dbg !40
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %15, align 16, !dbg !40
  %index.next.1 = add nsw i64 %index, 8, !dbg !31
  %16 = icmp eq i64 %index.next.1, 10240, !dbg !31
  br i1 %16, label %for.inc10, label %vector.body, !dbg !31, !llvm.loop !41

for.inc10:                                        ; preds = %vector.body
  %indvars.iv.next4 = add nuw nsw i64 %indvars.iv3, 1, !dbg !27
  %exitcond5 = icmp eq i64 %indvars.iv.next4, 10240, !dbg !27
  br i1 %exitcond5, label %for.end12, label %vector.ph, !dbg !27

for.end12:                                        ; preds = %for.inc10
  ret void, !dbg !44
}

; Function Attrs: nounwind uwtable
define void @mat_add() #1 !dbg !7 {
entry:
  %polly.par.userContext = alloca {}, align 8
  br label %entry.split, !dbg !45

entry.split:                                      ; preds = %entry
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !46, metadata !26), !dbg !45
  %0 = bitcast {}* %polly.par.userContext to i8*
  call void @llvm.lifetime.start(i64 0, i8* %0)
  call void @GOMP_parallel_loop_runtime_start(void (i8*)* nonnull @mat_add_polly_subfn, i8* %0, i32 0, i64 0, i64 320, i64 1) #4
  call void @mat_add_polly_subfn(i8* %0) #4
  call void @GOMP_parallel_end() #4
  call void @llvm.lifetime.end(i64 8, i8* %0)
  ret void, !dbg !47
}

; Function Attrs: nounwind uwtable
define void @print_array() #0 !dbg !8 {
entry:
  br label %entry.split, !dbg !48

entry.split:                                      ; preds = %entry
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !49, metadata !26), !dbg !48
  br label %for.cond1.preheader, !dbg !50

for.cond1.preheader:                              ; preds = %for.end, %entry.split
  %indvars.iv6 = phi i64 [ 0, %entry.split ], [ %indvars.iv.next7, %for.end ]
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 8, !dbg !54
  br label %for.body3, !dbg !59

for.body3:                                        ; preds = %for.inc, %for.cond1.preheader
  %indvars.iv = phi i64 [ 0, %for.cond1.preheader ], [ %indvars.iv.next, %for.inc ]
  %1 = phi %struct._IO_FILE* [ %0, %for.cond1.preheader ], [ %5, %for.inc ]
  %arrayidx5 = getelementptr inbounds [10240 x [10240 x i64]], [10240 x [10240 x i64]]* @C, i64 0, i64 %indvars.iv6, i64 %indvars.iv, !dbg !61
  %2 = load i64, i64* %arrayidx5, align 8, !dbg !61
  %call = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %1, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str, i64 0, i64 0), i64 %2) #4, !dbg !62
  %3 = trunc i64 %indvars.iv to i32, !dbg !63
  %rem = srem i32 %3, 80, !dbg !63
  %cmp6 = icmp eq i32 %rem, 79, !dbg !65
  br i1 %cmp6, label %if.then, label %for.inc, !dbg !66

if.then:                                          ; preds = %for.body3
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 8, !dbg !67
  %fputc3 = tail call i32 @fputc(i32 10, %struct._IO_FILE* %4), !dbg !69
  br label %for.inc, !dbg !69

for.inc:                                          ; preds = %if.then, %for.body3
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1, !dbg !59
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 8, !dbg !54
  %exitcond = icmp eq i64 %indvars.iv.next, 10240, !dbg !59
  br i1 %exitcond, label %for.end, label %for.body3, !dbg !59

for.end:                                          ; preds = %for.inc
  %.lcssa = phi %struct._IO_FILE* [ %5, %for.inc ]
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %.lcssa), !dbg !70
  %indvars.iv.next7 = add nuw nsw i64 %indvars.iv6, 1, !dbg !50
  %exitcond8 = icmp eq i64 %indvars.iv.next7, 10240, !dbg !50
  br i1 %exitcond8, label %for.end11, label %for.cond1.preheader, !dbg !50

for.end11:                                        ; preds = %for.end
  ret void, !dbg !71
}

; Function Attrs: nounwind
declare i32 @fprintf(%struct._IO_FILE* nocapture, i8* nocapture readonly, ...) #2

; Function Attrs: nounwind uwtable
define i32 @main() #0 !dbg !9 {
entry:
  %polly.par.userContext.i = alloca {}, align 8
  br label %entry.split, !dbg !72

entry.split:                                      ; preds = %entry
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !25, metadata !26), !dbg !72
  br label %vector.ph, !dbg !74

vector.ph:                                        ; preds = %for.inc10.i, %entry.split
  %indvars.iv3.i = phi i64 [ 0, %entry.split ], [ %indvars.iv.next4.i, %for.inc10.i ], !dbg !75
  br label %vector.body, !dbg !76

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next.1, %vector.body ], !dbg !75
  %0 = getelementptr inbounds [10240 x [10240 x i64]], [10240 x [10240 x i64]]* @A, i64 0, i64 %indvars.iv3.i, i64 %index, !dbg !77
  %1 = bitcast i64* %0 to <2 x i64>*, !dbg !78
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %1, align 16, !dbg !78
  %2 = getelementptr i64, i64* %0, i64 2, !dbg !78
  %3 = bitcast i64* %2 to <2 x i64>*, !dbg !78
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %3, align 16, !dbg !78
  %4 = getelementptr inbounds [10240 x [10240 x i64]], [10240 x [10240 x i64]]* @B, i64 0, i64 %indvars.iv3.i, i64 %index, !dbg !79
  %5 = bitcast i64* %4 to <2 x i64>*, !dbg !80
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %5, align 16, !dbg !80
  %6 = getelementptr i64, i64* %4, i64 2, !dbg !80
  %7 = bitcast i64* %6 to <2 x i64>*, !dbg !80
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %7, align 16, !dbg !80
  %index.next = or i64 %index, 4, !dbg !76
  %8 = getelementptr inbounds [10240 x [10240 x i64]], [10240 x [10240 x i64]]* @A, i64 0, i64 %indvars.iv3.i, i64 %index.next, !dbg !77
  %9 = bitcast i64* %8 to <2 x i64>*, !dbg !78
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %9, align 16, !dbg !78
  %10 = getelementptr i64, i64* %8, i64 2, !dbg !78
  %11 = bitcast i64* %10 to <2 x i64>*, !dbg !78
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %11, align 16, !dbg !78
  %12 = getelementptr inbounds [10240 x [10240 x i64]], [10240 x [10240 x i64]]* @B, i64 0, i64 %indvars.iv3.i, i64 %index.next, !dbg !79
  %13 = bitcast i64* %12 to <2 x i64>*, !dbg !80
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %13, align 16, !dbg !80
  %14 = getelementptr i64, i64* %12, i64 2, !dbg !80
  %15 = bitcast i64* %14 to <2 x i64>*, !dbg !80
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %15, align 16, !dbg !80
  %index.next.1 = add nsw i64 %index, 8, !dbg !76
  %16 = icmp eq i64 %index.next.1, 10240, !dbg !76
  br i1 %16, label %for.inc10.i, label %vector.body, !dbg !76, !llvm.loop !81

for.inc10.i:                                      ; preds = %vector.body
  %indvars.iv.next4.i = add nuw nsw i64 %indvars.iv3.i, 1, !dbg !74
  %exitcond5.i = icmp eq i64 %indvars.iv.next4.i, 10240, !dbg !74
  br i1 %exitcond5.i, label %init_array.exit, label %vector.ph, !dbg !74

init_array.exit:                                  ; preds = %for.inc10.i
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !46, metadata !26) #4, !dbg !82
  %17 = bitcast {}* %polly.par.userContext.i to i8*, !dbg !84
  call void @llvm.lifetime.start(i64 0, i8* %17) #4, !dbg !84
  call void @GOMP_parallel_loop_runtime_start(void (i8*)* nonnull @mat_add_polly_subfn, i8* %17, i32 0, i64 0, i64 320, i64 1) #4, !dbg !84
  call void @mat_add_polly_subfn(i8* %17) #4, !dbg !84
  call void @GOMP_parallel_end() #4, !dbg !84
  call void @llvm.lifetime.end(i64 8, i8* %17) #4, !dbg !84
  %18 = load i64, i64* getelementptr inbounds ([10240 x [10240 x i64]], [10240 x [10240 x i64]]* @C, i64 0, i64 10239, i64 10239), align 8, !dbg !85
  %call = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([51 x i8], [51 x i8]* @.str.2, i64 0, i64 0), i32 10240, i32 10240, i32 10239, i32 10239, i64 %18) #4, !dbg !86
  ret i32 0, !dbg !87
}

; Function Attrs: nounwind
declare i32 @printf(i8* nocapture readonly, ...) #2

; Function Attrs: nounwind readnone
declare void @llvm.dbg.value(metadata, i64, metadata, metadata) #3

; Function Attrs: nounwind
declare i32 @fputc(i32, %struct._IO_FILE* nocapture) #4

; Function Attrs: argmemonly nounwind
declare void @llvm.lifetime.start(i64, i8* nocapture) #5

define internal void @mat_add_polly_subfn(i8* nocapture readnone %polly.par.userContext) #6 {
polly.par.setup:
  %polly.par.LBPtr = alloca i64, align 8
  %polly.par.UBPtr = alloca i64, align 8
  br label %polly.par.setup.split

polly.par.setup.split:                            ; preds = %polly.par.setup
  %0 = call i8 @GOMP_loop_runtime_next(i64* nonnull %polly.par.LBPtr, i64* nonnull %polly.par.UBPtr)
  %1 = icmp eq i8 %0, 0
  br i1 %1, label %polly.par.exit, label %polly.par.loadIVBounds.preheader

polly.par.loadIVBounds.preheader:                 ; preds = %polly.par.setup.split
  br label %polly.par.loadIVBounds

polly.par.exit.loopexit:                          ; preds = %polly.par.checkNext.loopexit
  br label %polly.par.exit

polly.par.exit:                                   ; preds = %polly.par.exit.loopexit, %polly.par.setup.split
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
  %exitcond24 = icmp eq i64 %polly.indvar_next6, 320
  br i1 %exitcond24, label %polly.loop_exit4, label %polly.loop_preheader9

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
  %22 = getelementptr [10240 x [10240 x i64]], [10240 x [10240 x i64]]* @A, i64 0, i64 %21, i64 %5
  %23 = bitcast i64* %22 to <2 x i64>*
  %wide.load = load <2 x i64>, <2 x i64>* %23, align 16, !alias.scope !88, !noalias !90
  %24 = getelementptr [10240 x [10240 x i64]], [10240 x [10240 x i64]]* @B, i64 0, i64 %21, i64 %5
  %25 = bitcast i64* %24 to <2 x i64>*
  %wide.load27 = load <2 x i64>, <2 x i64>* %25, align 16, !alias.scope !91, !noalias !93
  %26 = add nsw <2 x i64> %wide.load27, %wide.load, !dbg !94
  %27 = getelementptr [10240 x [10240 x i64]], [10240 x [10240 x i64]]* @C, i64 0, i64 %21, i64 %5
  %28 = bitcast i64* %27 to <2 x i64>*
  store <2 x i64> %26, <2 x i64>* %28, align 16, !alias.scope !92, !noalias !101
  %29 = getelementptr [10240 x [10240 x i64]], [10240 x [10240 x i64]]* @A, i64 0, i64 %21, i64 %6
  %30 = bitcast i64* %29 to <2 x i64>*
  %wide.load.1 = load <2 x i64>, <2 x i64>* %30, align 16, !alias.scope !88, !noalias !90
  %31 = getelementptr [10240 x [10240 x i64]], [10240 x [10240 x i64]]* @B, i64 0, i64 %21, i64 %6
  %32 = bitcast i64* %31 to <2 x i64>*
  %wide.load27.1 = load <2 x i64>, <2 x i64>* %32, align 16, !alias.scope !91, !noalias !93
  %33 = add nsw <2 x i64> %wide.load27.1, %wide.load.1, !dbg !94
  %34 = getelementptr [10240 x [10240 x i64]], [10240 x [10240 x i64]]* @C, i64 0, i64 %21, i64 %6
  %35 = bitcast i64* %34 to <2 x i64>*
  store <2 x i64> %33, <2 x i64>* %35, align 16, !alias.scope !92, !noalias !101
  %36 = getelementptr [10240 x [10240 x i64]], [10240 x [10240 x i64]]* @A, i64 0, i64 %21, i64 %7
  %37 = bitcast i64* %36 to <2 x i64>*
  %wide.load.2 = load <2 x i64>, <2 x i64>* %37, align 16, !alias.scope !88, !noalias !90
  %38 = getelementptr [10240 x [10240 x i64]], [10240 x [10240 x i64]]* @B, i64 0, i64 %21, i64 %7
  %39 = bitcast i64* %38 to <2 x i64>*
  %wide.load27.2 = load <2 x i64>, <2 x i64>* %39, align 16, !alias.scope !91, !noalias !93
  %40 = add nsw <2 x i64> %wide.load27.2, %wide.load.2, !dbg !94
  %41 = getelementptr [10240 x [10240 x i64]], [10240 x [10240 x i64]]* @C, i64 0, i64 %21, i64 %7
  %42 = bitcast i64* %41 to <2 x i64>*
  store <2 x i64> %40, <2 x i64>* %42, align 16, !alias.scope !92, !noalias !101
  %43 = getelementptr [10240 x [10240 x i64]], [10240 x [10240 x i64]]* @A, i64 0, i64 %21, i64 %8
  %44 = bitcast i64* %43 to <2 x i64>*
  %wide.load.3 = load <2 x i64>, <2 x i64>* %44, align 16, !alias.scope !88, !noalias !90
  %45 = getelementptr [10240 x [10240 x i64]], [10240 x [10240 x i64]]* @B, i64 0, i64 %21, i64 %8
  %46 = bitcast i64* %45 to <2 x i64>*
  %wide.load27.3 = load <2 x i64>, <2 x i64>* %46, align 16, !alias.scope !91, !noalias !93
  %47 = add nsw <2 x i64> %wide.load27.3, %wide.load.3, !dbg !94
  %48 = getelementptr [10240 x [10240 x i64]], [10240 x [10240 x i64]]* @C, i64 0, i64 %21, i64 %8
  %49 = bitcast i64* %48 to <2 x i64>*
  store <2 x i64> %47, <2 x i64>* %49, align 16, !alias.scope !92, !noalias !101
  %50 = getelementptr [10240 x [10240 x i64]], [10240 x [10240 x i64]]* @A, i64 0, i64 %21, i64 %9
  %51 = bitcast i64* %50 to <2 x i64>*
  %wide.load.4 = load <2 x i64>, <2 x i64>* %51, align 16, !alias.scope !88, !noalias !90
  %52 = getelementptr [10240 x [10240 x i64]], [10240 x [10240 x i64]]* @B, i64 0, i64 %21, i64 %9
  %53 = bitcast i64* %52 to <2 x i64>*
  %wide.load27.4 = load <2 x i64>, <2 x i64>* %53, align 16, !alias.scope !91, !noalias !93
  %54 = add nsw <2 x i64> %wide.load27.4, %wide.load.4, !dbg !94
  %55 = getelementptr [10240 x [10240 x i64]], [10240 x [10240 x i64]]* @C, i64 0, i64 %21, i64 %9
  %56 = bitcast i64* %55 to <2 x i64>*
  store <2 x i64> %54, <2 x i64>* %56, align 16, !alias.scope !92, !noalias !101
  %57 = getelementptr [10240 x [10240 x i64]], [10240 x [10240 x i64]]* @A, i64 0, i64 %21, i64 %10
  %58 = bitcast i64* %57 to <2 x i64>*
  %wide.load.5 = load <2 x i64>, <2 x i64>* %58, align 16, !alias.scope !88, !noalias !90
  %59 = getelementptr [10240 x [10240 x i64]], [10240 x [10240 x i64]]* @B, i64 0, i64 %21, i64 %10
  %60 = bitcast i64* %59 to <2 x i64>*
  %wide.load27.5 = load <2 x i64>, <2 x i64>* %60, align 16, !alias.scope !91, !noalias !93
  %61 = add nsw <2 x i64> %wide.load27.5, %wide.load.5, !dbg !94
  %62 = getelementptr [10240 x [10240 x i64]], [10240 x [10240 x i64]]* @C, i64 0, i64 %21, i64 %10
  %63 = bitcast i64* %62 to <2 x i64>*
  store <2 x i64> %61, <2 x i64>* %63, align 16, !alias.scope !92, !noalias !101
  %64 = getelementptr [10240 x [10240 x i64]], [10240 x [10240 x i64]]* @A, i64 0, i64 %21, i64 %11
  %65 = bitcast i64* %64 to <2 x i64>*
  %wide.load.6 = load <2 x i64>, <2 x i64>* %65, align 16, !alias.scope !88, !noalias !90
  %66 = getelementptr [10240 x [10240 x i64]], [10240 x [10240 x i64]]* @B, i64 0, i64 %21, i64 %11
  %67 = bitcast i64* %66 to <2 x i64>*
  %wide.load27.6 = load <2 x i64>, <2 x i64>* %67, align 16, !alias.scope !91, !noalias !93
  %68 = add nsw <2 x i64> %wide.load27.6, %wide.load.6, !dbg !94
  %69 = getelementptr [10240 x [10240 x i64]], [10240 x [10240 x i64]]* @C, i64 0, i64 %21, i64 %11
  %70 = bitcast i64* %69 to <2 x i64>*
  store <2 x i64> %68, <2 x i64>* %70, align 16, !alias.scope !92, !noalias !101
  %71 = getelementptr [10240 x [10240 x i64]], [10240 x [10240 x i64]]* @A, i64 0, i64 %21, i64 %12
  %72 = bitcast i64* %71 to <2 x i64>*
  %wide.load.7 = load <2 x i64>, <2 x i64>* %72, align 16, !alias.scope !88, !noalias !90
  %73 = getelementptr [10240 x [10240 x i64]], [10240 x [10240 x i64]]* @B, i64 0, i64 %21, i64 %12
  %74 = bitcast i64* %73 to <2 x i64>*
  %wide.load27.7 = load <2 x i64>, <2 x i64>* %74, align 16, !alias.scope !91, !noalias !93
  %75 = add nsw <2 x i64> %wide.load27.7, %wide.load.7, !dbg !94
  %76 = getelementptr [10240 x [10240 x i64]], [10240 x [10240 x i64]]* @C, i64 0, i64 %21, i64 %12
  %77 = bitcast i64* %76 to <2 x i64>*
  store <2 x i64> %75, <2 x i64>* %77, align 16, !alias.scope !92, !noalias !101
  %78 = getelementptr [10240 x [10240 x i64]], [10240 x [10240 x i64]]* @A, i64 0, i64 %21, i64 %13
  %79 = bitcast i64* %78 to <2 x i64>*
  %wide.load.8 = load <2 x i64>, <2 x i64>* %79, align 16, !alias.scope !88, !noalias !90
  %80 = getelementptr [10240 x [10240 x i64]], [10240 x [10240 x i64]]* @B, i64 0, i64 %21, i64 %13
  %81 = bitcast i64* %80 to <2 x i64>*
  %wide.load27.8 = load <2 x i64>, <2 x i64>* %81, align 16, !alias.scope !91, !noalias !93
  %82 = add nsw <2 x i64> %wide.load27.8, %wide.load.8, !dbg !94
  %83 = getelementptr [10240 x [10240 x i64]], [10240 x [10240 x i64]]* @C, i64 0, i64 %21, i64 %13
  %84 = bitcast i64* %83 to <2 x i64>*
  store <2 x i64> %82, <2 x i64>* %84, align 16, !alias.scope !92, !noalias !101
  %85 = getelementptr [10240 x [10240 x i64]], [10240 x [10240 x i64]]* @A, i64 0, i64 %21, i64 %14
  %86 = bitcast i64* %85 to <2 x i64>*
  %wide.load.9 = load <2 x i64>, <2 x i64>* %86, align 16, !alias.scope !88, !noalias !90
  %87 = getelementptr [10240 x [10240 x i64]], [10240 x [10240 x i64]]* @B, i64 0, i64 %21, i64 %14
  %88 = bitcast i64* %87 to <2 x i64>*
  %wide.load27.9 = load <2 x i64>, <2 x i64>* %88, align 16, !alias.scope !91, !noalias !93
  %89 = add nsw <2 x i64> %wide.load27.9, %wide.load.9, !dbg !94
  %90 = getelementptr [10240 x [10240 x i64]], [10240 x [10240 x i64]]* @C, i64 0, i64 %21, i64 %14
  %91 = bitcast i64* %90 to <2 x i64>*
  store <2 x i64> %89, <2 x i64>* %91, align 16, !alias.scope !92, !noalias !101
  %92 = getelementptr [10240 x [10240 x i64]], [10240 x [10240 x i64]]* @A, i64 0, i64 %21, i64 %15
  %93 = bitcast i64* %92 to <2 x i64>*
  %wide.load.10 = load <2 x i64>, <2 x i64>* %93, align 16, !alias.scope !88, !noalias !90
  %94 = getelementptr [10240 x [10240 x i64]], [10240 x [10240 x i64]]* @B, i64 0, i64 %21, i64 %15
  %95 = bitcast i64* %94 to <2 x i64>*
  %wide.load27.10 = load <2 x i64>, <2 x i64>* %95, align 16, !alias.scope !91, !noalias !93
  %96 = add nsw <2 x i64> %wide.load27.10, %wide.load.10, !dbg !94
  %97 = getelementptr [10240 x [10240 x i64]], [10240 x [10240 x i64]]* @C, i64 0, i64 %21, i64 %15
  %98 = bitcast i64* %97 to <2 x i64>*
  store <2 x i64> %96, <2 x i64>* %98, align 16, !alias.scope !92, !noalias !101
  %99 = getelementptr [10240 x [10240 x i64]], [10240 x [10240 x i64]]* @A, i64 0, i64 %21, i64 %16
  %100 = bitcast i64* %99 to <2 x i64>*
  %wide.load.11 = load <2 x i64>, <2 x i64>* %100, align 16, !alias.scope !88, !noalias !90
  %101 = getelementptr [10240 x [10240 x i64]], [10240 x [10240 x i64]]* @B, i64 0, i64 %21, i64 %16
  %102 = bitcast i64* %101 to <2 x i64>*
  %wide.load27.11 = load <2 x i64>, <2 x i64>* %102, align 16, !alias.scope !91, !noalias !93
  %103 = add nsw <2 x i64> %wide.load27.11, %wide.load.11, !dbg !94
  %104 = getelementptr [10240 x [10240 x i64]], [10240 x [10240 x i64]]* @C, i64 0, i64 %21, i64 %16
  %105 = bitcast i64* %104 to <2 x i64>*
  store <2 x i64> %103, <2 x i64>* %105, align 16, !alias.scope !92, !noalias !101
  %106 = getelementptr [10240 x [10240 x i64]], [10240 x [10240 x i64]]* @A, i64 0, i64 %21, i64 %17
  %107 = bitcast i64* %106 to <2 x i64>*
  %wide.load.12 = load <2 x i64>, <2 x i64>* %107, align 16, !alias.scope !88, !noalias !90
  %108 = getelementptr [10240 x [10240 x i64]], [10240 x [10240 x i64]]* @B, i64 0, i64 %21, i64 %17
  %109 = bitcast i64* %108 to <2 x i64>*
  %wide.load27.12 = load <2 x i64>, <2 x i64>* %109, align 16, !alias.scope !91, !noalias !93
  %110 = add nsw <2 x i64> %wide.load27.12, %wide.load.12, !dbg !94
  %111 = getelementptr [10240 x [10240 x i64]], [10240 x [10240 x i64]]* @C, i64 0, i64 %21, i64 %17
  %112 = bitcast i64* %111 to <2 x i64>*
  store <2 x i64> %110, <2 x i64>* %112, align 16, !alias.scope !92, !noalias !101
  %113 = getelementptr [10240 x [10240 x i64]], [10240 x [10240 x i64]]* @A, i64 0, i64 %21, i64 %18
  %114 = bitcast i64* %113 to <2 x i64>*
  %wide.load.13 = load <2 x i64>, <2 x i64>* %114, align 16, !alias.scope !88, !noalias !90
  %115 = getelementptr [10240 x [10240 x i64]], [10240 x [10240 x i64]]* @B, i64 0, i64 %21, i64 %18
  %116 = bitcast i64* %115 to <2 x i64>*
  %wide.load27.13 = load <2 x i64>, <2 x i64>* %116, align 16, !alias.scope !91, !noalias !93
  %117 = add nsw <2 x i64> %wide.load27.13, %wide.load.13, !dbg !94
  %118 = getelementptr [10240 x [10240 x i64]], [10240 x [10240 x i64]]* @C, i64 0, i64 %21, i64 %18
  %119 = bitcast i64* %118 to <2 x i64>*
  store <2 x i64> %117, <2 x i64>* %119, align 16, !alias.scope !92, !noalias !101
  %120 = getelementptr [10240 x [10240 x i64]], [10240 x [10240 x i64]]* @A, i64 0, i64 %21, i64 %19
  %121 = bitcast i64* %120 to <2 x i64>*
  %wide.load.14 = load <2 x i64>, <2 x i64>* %121, align 16, !alias.scope !88, !noalias !90
  %122 = getelementptr [10240 x [10240 x i64]], [10240 x [10240 x i64]]* @B, i64 0, i64 %21, i64 %19
  %123 = bitcast i64* %122 to <2 x i64>*
  %wide.load27.14 = load <2 x i64>, <2 x i64>* %123, align 16, !alias.scope !91, !noalias !93
  %124 = add nsw <2 x i64> %wide.load27.14, %wide.load.14, !dbg !94
  %125 = getelementptr [10240 x [10240 x i64]], [10240 x [10240 x i64]]* @C, i64 0, i64 %21, i64 %19
  %126 = bitcast i64* %125 to <2 x i64>*
  store <2 x i64> %124, <2 x i64>* %126, align 16, !alias.scope !92, !noalias !101
  %127 = getelementptr [10240 x [10240 x i64]], [10240 x [10240 x i64]]* @A, i64 0, i64 %21, i64 %20
  %128 = bitcast i64* %127 to <2 x i64>*
  %wide.load.15 = load <2 x i64>, <2 x i64>* %128, align 16, !alias.scope !88, !noalias !90
  %129 = getelementptr [10240 x [10240 x i64]], [10240 x [10240 x i64]]* @B, i64 0, i64 %21, i64 %20
  %130 = bitcast i64* %129 to <2 x i64>*
  %wide.load27.15 = load <2 x i64>, <2 x i64>* %130, align 16, !alias.scope !91, !noalias !93
  %131 = add nsw <2 x i64> %wide.load27.15, %wide.load.15, !dbg !94
  %132 = getelementptr [10240 x [10240 x i64]], [10240 x [10240 x i64]]* @C, i64 0, i64 %21, i64 %20
  %133 = bitcast i64* %132 to <2 x i64>*
  store <2 x i64> %131, <2 x i64>* %133, align 16, !alias.scope !92, !noalias !101
  %polly.indvar_next12 = add nuw nsw i64 %polly.indvar11, 1
  %exitcond23 = icmp eq i64 %polly.indvar_next12, 32
  br i1 %exitcond23, label %polly.loop_exit10, label %polly.loop_preheader15
}

declare i8 @GOMP_loop_runtime_next(i64*, i64*)

declare void @GOMP_loop_end_nowait()

declare void @GOMP_parallel_loop_runtime_start(void (i8*)*, i8*, i32, i64, i64, i64)

declare void @GOMP_parallel_end()

; Function Attrs: argmemonly nounwind
declare void @llvm.lifetime.end(i64, i8* nocapture) #5

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "polly-optimized" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind readnone }
attributes #4 = { nounwind }
attributes #5 = { argmemonly nounwind }
attributes #6 = { "polly.skip.fn" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!21, !22}
!llvm.ident = !{!23}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 3.9.0 (http://llvm.org/git/clang.git e177b4a63ca92c5fec010986944530688e104074) (http://llvm.org/git/llvm.git fcd97ccb03712372fe95f1732638de5ed3fcabe8)", isOptimized: false, runtimeVersion: 0, emissionKind: 1, enums: !2, subprograms: !3, globals: !13)
!1 = !DIFile(filename: "MatrixAdd.c", directory: "/home/sam/workspace/WhileyOpenCL/polly/MatrixAdd/impl/handwritten")
!2 = !{}
!3 = !{!4, !7, !8, !9}
!4 = distinct !DISubprogram(name: "init_array", scope: !1, file: !1, line: 7, type: !5, isLocal: false, isDefinition: true, scopeLine: 8, isOptimized: false, variables: !2)
!5 = !DISubroutineType(types: !6)
!6 = !{null}
!7 = distinct !DISubprogram(name: "mat_add", scope: !1, file: !1, line: 19, type: !5, isLocal: false, isDefinition: true, scopeLine: 19, isOptimized: false, variables: !2)
!8 = distinct !DISubprogram(name: "print_array", scope: !1, file: !1, line: 29, type: !5, isLocal: false, isDefinition: true, scopeLine: 30, isOptimized: false, variables: !2)
!9 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 42, type: !10, isLocal: false, isDefinition: true, scopeLine: 43, isOptimized: false, variables: !2)
!10 = !DISubroutineType(types: !11)
!11 = !{!12}
!12 = !DIBasicType(name: "int", size: 32, align: 32, encoding: DW_ATE_signed)
!13 = !{!14, !19, !20}
!14 = !DIGlobalVariable(name: "A", scope: !0, file: !1, line: 3, type: !15, isLocal: false, isDefinition: true, variable: [10240 x [10240 x i64]]* @A)
!15 = !DICompositeType(tag: DW_TAG_array_type, baseType: !16, size: 6710886400, align: 64, elements: !17)
!16 = !DIBasicType(name: "long long int", size: 64, align: 64, encoding: DW_ATE_signed)
!17 = !{!18, !18}
!18 = !DISubrange(count: 10240)
!19 = !DIGlobalVariable(name: "B", scope: !0, file: !1, line: 4, type: !15, isLocal: false, isDefinition: true, variable: [10240 x [10240 x i64]]* @B)
!20 = !DIGlobalVariable(name: "C", scope: !0, file: !1, line: 5, type: !15, isLocal: false, isDefinition: true, variable: [10240 x [10240 x i64]]* @C)
!21 = !{i32 2, !"Dwarf Version", i32 4}
!22 = !{i32 2, !"Debug Info Version", i32 3}
!23 = !{!"clang version 3.9.0 (http://llvm.org/git/clang.git e177b4a63ca92c5fec010986944530688e104074) (http://llvm.org/git/llvm.git fcd97ccb03712372fe95f1732638de5ed3fcabe8)"}
!24 = !DILocation(line: 9, column: 9, scope: !4)
!25 = !DILocalVariable(name: "i", scope: !4, file: !1, line: 9, type: !12)
!26 = !DIExpression()
!27 = !DILocation(line: 11, column: 5, scope: !28)
!28 = !DILexicalBlockFile(scope: !29, file: !1, discriminator: 1)
!29 = distinct !DILexicalBlock(scope: !30, file: !1, line: 11, column: 5)
!30 = distinct !DILexicalBlock(scope: !4, file: !1, line: 11, column: 5)
!31 = !DILocation(line: 12, column: 9, scope: !32)
!32 = !DILexicalBlockFile(scope: !33, file: !1, discriminator: 1)
!33 = distinct !DILexicalBlock(scope: !34, file: !1, line: 12, column: 9)
!34 = distinct !DILexicalBlock(scope: !35, file: !1, line: 12, column: 9)
!35 = distinct !DILexicalBlock(scope: !29, file: !1, line: 11, column: 25)
!36 = !DILocation(line: 13, column: 13, scope: !37)
!37 = distinct !DILexicalBlock(scope: !33, file: !1, line: 12, column: 29)
!38 = !DILocation(line: 13, column: 21, scope: !37)
!39 = !DILocation(line: 14, column: 13, scope: !37)
!40 = !DILocation(line: 14, column: 21, scope: !37)
!41 = distinct !{!41, !42, !43}
!42 = !{!"llvm.loop.vectorize.width", i32 1}
!43 = !{!"llvm.loop.interleave.count", i32 1}
!44 = !DILocation(line: 17, column: 1, scope: !4)
!45 = !DILocation(line: 20, column: 9, scope: !7)
!46 = !DILocalVariable(name: "i", scope: !7, file: !1, line: 20, type: !12)
!47 = !DILocation(line: 27, column: 1, scope: !7)
!48 = !DILocation(line: 31, column: 9, scope: !8)
!49 = !DILocalVariable(name: "i", scope: !8, file: !1, line: 31, type: !12)
!50 = !DILocation(line: 33, column: 5, scope: !51)
!51 = !DILexicalBlockFile(scope: !52, file: !1, discriminator: 1)
!52 = distinct !DILexicalBlock(scope: !53, file: !1, line: 33, column: 5)
!53 = distinct !DILexicalBlock(scope: !8, file: !1, line: 33, column: 5)
!54 = !DILocation(line: 35, column: 21, scope: !55)
!55 = distinct !DILexicalBlock(scope: !56, file: !1, line: 34, column: 29)
!56 = distinct !DILexicalBlock(scope: !57, file: !1, line: 34, column: 9)
!57 = distinct !DILexicalBlock(scope: !58, file: !1, line: 34, column: 9)
!58 = distinct !DILexicalBlock(scope: !52, file: !1, line: 33, column: 25)
!59 = !DILocation(line: 34, column: 9, scope: !60)
!60 = !DILexicalBlockFile(scope: !56, file: !1, discriminator: 1)
!61 = !DILocation(line: 35, column: 38, scope: !55)
!62 = !DILocation(line: 35, column: 13, scope: !55)
!63 = !DILocation(line: 36, column: 18, scope: !64)
!64 = distinct !DILexicalBlock(scope: !55, file: !1, line: 36, column: 17)
!65 = !DILocation(line: 36, column: 22, scope: !64)
!66 = !DILocation(line: 36, column: 17, scope: !55)
!67 = !DILocation(line: 36, column: 37, scope: !68)
!68 = !DILexicalBlockFile(scope: !64, file: !1, discriminator: 1)
!69 = !DILocation(line: 36, column: 29, scope: !68)
!70 = !DILocation(line: 38, column: 9, scope: !58)
!71 = !DILocation(line: 40, column: 1, scope: !8)
!72 = !DILocation(line: 9, column: 9, scope: !4, inlinedAt: !73)
!73 = distinct !DILocation(line: 49, column: 5, scope: !9)
!74 = !DILocation(line: 11, column: 5, scope: !28, inlinedAt: !73)
!75 = !DILocation(line: 49, column: 5, scope: !9)
!76 = !DILocation(line: 12, column: 9, scope: !32, inlinedAt: !73)
!77 = !DILocation(line: 13, column: 13, scope: !37, inlinedAt: !73)
!78 = !DILocation(line: 13, column: 21, scope: !37, inlinedAt: !73)
!79 = !DILocation(line: 14, column: 13, scope: !37, inlinedAt: !73)
!80 = !DILocation(line: 14, column: 21, scope: !37, inlinedAt: !73)
!81 = distinct !{!81, !42, !43}
!82 = !DILocation(line: 20, column: 9, scope: !7, inlinedAt: !83)
!83 = distinct !DILocation(line: 50, column: 5, scope: !9)
!84 = !DILocation(line: 50, column: 5, scope: !9)
!85 = !DILocation(line: 53, column: 83, scope: !9)
!86 = !DILocation(line: 53, column: 5, scope: !9)
!87 = !DILocation(line: 54, column: 5, scope: !9)
!88 = distinct !{!88, !89, !"polly.alias.scope.A"}
!89 = distinct !{!89, !"polly.alias.scope.domain"}
!90 = !{!91, !92}
!91 = distinct !{!91, !89, !"polly.alias.scope.B"}
!92 = distinct !{!92, !89, !"polly.alias.scope.C"}
!93 = !{!92, !88}
!94 = !DILocation(line: 23, column: 31, scope: !95)
!95 = distinct !DILexicalBlock(scope: !96, file: !1, line: 22, column: 29)
!96 = distinct !DILexicalBlock(scope: !97, file: !1, line: 22, column: 9)
!97 = distinct !DILexicalBlock(scope: !98, file: !1, line: 22, column: 9)
!98 = distinct !DILexicalBlock(scope: !99, file: !1, line: 21, column: 25)
!99 = distinct !DILexicalBlock(scope: !100, file: !1, line: 21, column: 5)
!100 = distinct !DILexicalBlock(scope: !7, file: !1, line: 21, column: 5)
!101 = !{!91, !88}
