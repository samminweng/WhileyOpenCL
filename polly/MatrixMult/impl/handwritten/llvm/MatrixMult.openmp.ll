; ModuleID = 'MatrixMult.preopt.ll'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@A = common global [512 x [512 x i64]] zeroinitializer, align 16
@B = common global [512 x [512 x i64]] zeroinitializer, align 16
@C = common global [512 x [512 x i64]] zeroinitializer, align 16
@stdout = external global %struct._IO_FILE*, align 8
@.str = private unnamed_addr constant [6 x i8] c"%lld \00", align 1
@.str.2 = private unnamed_addr constant [49 x i8] c"Pass %d X %d matrix test case (C[N][N] =%lld) \0A \00", align 1

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
  %0 = getelementptr inbounds [512 x [512 x i64]], [512 x [512 x i64]]* @A, i64 0, i64 %indvars.iv3, i64 %index, !dbg !36
  %1 = bitcast i64* %0 to <2 x i64>*, !dbg !38
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %1, align 16, !dbg !38
  %2 = getelementptr i64, i64* %0, i64 2, !dbg !38
  %3 = bitcast i64* %2 to <2 x i64>*, !dbg !38
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %3, align 16, !dbg !38
  %4 = getelementptr inbounds [512 x [512 x i64]], [512 x [512 x i64]]* @B, i64 0, i64 %indvars.iv3, i64 %index, !dbg !39
  %5 = bitcast i64* %4 to <2 x i64>*, !dbg !40
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %5, align 16, !dbg !40
  %6 = getelementptr i64, i64* %4, i64 2, !dbg !40
  %7 = bitcast i64* %6 to <2 x i64>*, !dbg !40
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %7, align 16, !dbg !40
  %index.next = or i64 %index, 4, !dbg !31
  %8 = getelementptr inbounds [512 x [512 x i64]], [512 x [512 x i64]]* @A, i64 0, i64 %indvars.iv3, i64 %index.next, !dbg !36
  %9 = bitcast i64* %8 to <2 x i64>*, !dbg !38
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %9, align 16, !dbg !38
  %10 = getelementptr i64, i64* %8, i64 2, !dbg !38
  %11 = bitcast i64* %10 to <2 x i64>*, !dbg !38
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %11, align 16, !dbg !38
  %12 = getelementptr inbounds [512 x [512 x i64]], [512 x [512 x i64]]* @B, i64 0, i64 %indvars.iv3, i64 %index.next, !dbg !39
  %13 = bitcast i64* %12 to <2 x i64>*, !dbg !40
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %13, align 16, !dbg !40
  %14 = getelementptr i64, i64* %12, i64 2, !dbg !40
  %15 = bitcast i64* %14 to <2 x i64>*, !dbg !40
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %15, align 16, !dbg !40
  %index.next.1 = add nsw i64 %index, 8, !dbg !31
  %16 = icmp eq i64 %index.next.1, 512, !dbg !31
  br i1 %16, label %for.inc10, label %vector.body, !dbg !31, !llvm.loop !41

for.inc10:                                        ; preds = %vector.body
  %indvars.iv.next4 = add nuw nsw i64 %indvars.iv3, 1, !dbg !27
  %exitcond5 = icmp eq i64 %indvars.iv.next4, 512, !dbg !27
  br i1 %exitcond5, label %for.end12, label %vector.ph, !dbg !27

for.end12:                                        ; preds = %for.inc10
  ret void, !dbg !44
}

; Function Attrs: nounwind uwtable
define void @mat_mult() #1 !dbg !7 {
entry:
  %polly.par.userContext3 = alloca {}, align 8
  br label %entry.split, !dbg !45

entry.split:                                      ; preds = %entry
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !46, metadata !26), !dbg !45
  %0 = bitcast {}* %polly.par.userContext3 to i8*
  call void @llvm.lifetime.start(i64 0, i8* %0)
  call void @GOMP_parallel_loop_runtime_start(void (i8*)* nonnull @mat_mult_polly_subfn, i8* %0, i32 0, i64 0, i64 16, i64 1) #4
  call void @mat_mult_polly_subfn(i8* %0) #4
  call void @GOMP_parallel_end() #4
  call void @llvm.lifetime.end(i64 8, i8* %0)
  call void @llvm.lifetime.start(i64 0, i8* %0)
  call void @GOMP_parallel_loop_runtime_start(void (i8*)* nonnull @mat_mult_polly_subfn_1, i8* %0, i32 0, i64 0, i64 16, i64 1) #4
  call void @mat_mult_polly_subfn_1(i8* %0) #4
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
  %arrayidx5 = getelementptr inbounds [512 x [512 x i64]], [512 x [512 x i64]]* @C, i64 0, i64 %indvars.iv6, i64 %indvars.iv, !dbg !61
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
  %exitcond = icmp eq i64 %indvars.iv.next, 512, !dbg !59
  br i1 %exitcond, label %for.end, label %for.body3, !dbg !59

for.end:                                          ; preds = %for.inc
  %.lcssa = phi %struct._IO_FILE* [ %5, %for.inc ]
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %.lcssa), !dbg !70
  %indvars.iv.next7 = add nuw nsw i64 %indvars.iv6, 1, !dbg !50
  %exitcond8 = icmp eq i64 %indvars.iv.next7, 512, !dbg !50
  br i1 %exitcond8, label %for.end11, label %for.cond1.preheader, !dbg !50

for.end11:                                        ; preds = %for.end
  ret void, !dbg !71
}

; Function Attrs: nounwind
declare i32 @fprintf(%struct._IO_FILE* nocapture, i8* nocapture readonly, ...) #2

; Function Attrs: nounwind uwtable
define i32 @main() #0 !dbg !9 {
entry:
  %polly.par.userContext3.i = alloca {}, align 8
  br label %entry.split, !dbg !72

entry.split:                                      ; preds = %entry
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !25, metadata !26), !dbg !72
  br label %vector.ph, !dbg !74

vector.ph:                                        ; preds = %for.inc10.i, %entry.split
  %indvars.iv3.i = phi i64 [ 0, %entry.split ], [ %indvars.iv.next4.i, %for.inc10.i ], !dbg !75
  br label %vector.body, !dbg !76

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next.1, %vector.body ], !dbg !75
  %0 = getelementptr inbounds [512 x [512 x i64]], [512 x [512 x i64]]* @A, i64 0, i64 %indvars.iv3.i, i64 %index, !dbg !77
  %1 = bitcast i64* %0 to <2 x i64>*, !dbg !78
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %1, align 16, !dbg !78
  %2 = getelementptr i64, i64* %0, i64 2, !dbg !78
  %3 = bitcast i64* %2 to <2 x i64>*, !dbg !78
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %3, align 16, !dbg !78
  %4 = getelementptr inbounds [512 x [512 x i64]], [512 x [512 x i64]]* @B, i64 0, i64 %indvars.iv3.i, i64 %index, !dbg !79
  %5 = bitcast i64* %4 to <2 x i64>*, !dbg !80
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %5, align 16, !dbg !80
  %6 = getelementptr i64, i64* %4, i64 2, !dbg !80
  %7 = bitcast i64* %6 to <2 x i64>*, !dbg !80
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %7, align 16, !dbg !80
  %index.next = or i64 %index, 4, !dbg !76
  %8 = getelementptr inbounds [512 x [512 x i64]], [512 x [512 x i64]]* @A, i64 0, i64 %indvars.iv3.i, i64 %index.next, !dbg !77
  %9 = bitcast i64* %8 to <2 x i64>*, !dbg !78
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %9, align 16, !dbg !78
  %10 = getelementptr i64, i64* %8, i64 2, !dbg !78
  %11 = bitcast i64* %10 to <2 x i64>*, !dbg !78
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %11, align 16, !dbg !78
  %12 = getelementptr inbounds [512 x [512 x i64]], [512 x [512 x i64]]* @B, i64 0, i64 %indvars.iv3.i, i64 %index.next, !dbg !79
  %13 = bitcast i64* %12 to <2 x i64>*, !dbg !80
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %13, align 16, !dbg !80
  %14 = getelementptr i64, i64* %12, i64 2, !dbg !80
  %15 = bitcast i64* %14 to <2 x i64>*, !dbg !80
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %15, align 16, !dbg !80
  %index.next.1 = add nsw i64 %index, 8, !dbg !76
  %16 = icmp eq i64 %index.next.1, 512, !dbg !76
  br i1 %16, label %for.inc10.i, label %vector.body, !dbg !76, !llvm.loop !81

for.inc10.i:                                      ; preds = %vector.body
  %indvars.iv.next4.i = add nuw nsw i64 %indvars.iv3.i, 1, !dbg !74
  %exitcond5.i = icmp eq i64 %indvars.iv.next4.i, 512, !dbg !74
  br i1 %exitcond5.i, label %init_array.exit, label %vector.ph, !dbg !74

init_array.exit:                                  ; preds = %for.inc10.i
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !46, metadata !26) #4, !dbg !82
  %17 = bitcast {}* %polly.par.userContext3.i to i8*, !dbg !84
  call void @llvm.lifetime.start(i64 0, i8* %17) #4, !dbg !84
  call void @GOMP_parallel_loop_runtime_start(void (i8*)* nonnull @mat_mult_polly_subfn, i8* %17, i32 0, i64 0, i64 16, i64 1) #4, !dbg !84
  call void @mat_mult_polly_subfn(i8* %17) #4, !dbg !84
  call void @GOMP_parallel_end() #4, !dbg !84
  call void @llvm.lifetime.end(i64 8, i8* %17) #4, !dbg !84
  call void @llvm.lifetime.start(i64 0, i8* %17) #4, !dbg !84
  call void @GOMP_parallel_loop_runtime_start(void (i8*)* nonnull @mat_mult_polly_subfn_1, i8* %17, i32 0, i64 0, i64 16, i64 1) #4, !dbg !84
  call void @mat_mult_polly_subfn_1(i8* %17) #4, !dbg !84
  call void @GOMP_parallel_end() #4, !dbg !84
  call void @llvm.lifetime.end(i64 8, i8* %17) #4, !dbg !84
  %18 = load i64, i64* getelementptr inbounds ([512 x [512 x i64]], [512 x [512 x i64]]* @C, i64 0, i64 511, i64 511), align 8, !dbg !85
  %call = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([49 x i8], [49 x i8]* @.str.2, i64 0, i64 0), i32 512, i32 512, i64 %18) #4, !dbg !86
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

define internal void @mat_mult_polly_subfn(i8* nocapture readnone %polly.par.userContext) #6 {
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
  %scevgep22 = getelementptr [512 x [512 x i64]], [512 x [512 x i64]]* @C, i64 0, i64 %5, i64 %37
  %scevgep2223 = bitcast i64* %scevgep22 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep2223, i8 0, i64 256, i32 16, i1 false)
  %scevgep22.1 = getelementptr [512 x [512 x i64]], [512 x [512 x i64]]* @C, i64 0, i64 %6, i64 %37
  %scevgep2223.1 = bitcast i64* %scevgep22.1 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep2223.1, i8 0, i64 256, i32 16, i1 false)
  %scevgep22.2 = getelementptr [512 x [512 x i64]], [512 x [512 x i64]]* @C, i64 0, i64 %7, i64 %37
  %scevgep2223.2 = bitcast i64* %scevgep22.2 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep2223.2, i8 0, i64 256, i32 16, i1 false)
  %scevgep22.3 = getelementptr [512 x [512 x i64]], [512 x [512 x i64]]* @C, i64 0, i64 %8, i64 %37
  %scevgep2223.3 = bitcast i64* %scevgep22.3 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep2223.3, i8 0, i64 256, i32 16, i1 false)
  %scevgep22.4 = getelementptr [512 x [512 x i64]], [512 x [512 x i64]]* @C, i64 0, i64 %9, i64 %37
  %scevgep2223.4 = bitcast i64* %scevgep22.4 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep2223.4, i8 0, i64 256, i32 16, i1 false)
  %scevgep22.5 = getelementptr [512 x [512 x i64]], [512 x [512 x i64]]* @C, i64 0, i64 %10, i64 %37
  %scevgep2223.5 = bitcast i64* %scevgep22.5 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep2223.5, i8 0, i64 256, i32 16, i1 false)
  %scevgep22.6 = getelementptr [512 x [512 x i64]], [512 x [512 x i64]]* @C, i64 0, i64 %11, i64 %37
  %scevgep2223.6 = bitcast i64* %scevgep22.6 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep2223.6, i8 0, i64 256, i32 16, i1 false)
  %scevgep22.7 = getelementptr [512 x [512 x i64]], [512 x [512 x i64]]* @C, i64 0, i64 %12, i64 %37
  %scevgep2223.7 = bitcast i64* %scevgep22.7 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep2223.7, i8 0, i64 256, i32 16, i1 false)
  %scevgep22.8 = getelementptr [512 x [512 x i64]], [512 x [512 x i64]]* @C, i64 0, i64 %13, i64 %37
  %scevgep2223.8 = bitcast i64* %scevgep22.8 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep2223.8, i8 0, i64 256, i32 16, i1 false)
  %scevgep22.9 = getelementptr [512 x [512 x i64]], [512 x [512 x i64]]* @C, i64 0, i64 %14, i64 %37
  %scevgep2223.9 = bitcast i64* %scevgep22.9 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep2223.9, i8 0, i64 256, i32 16, i1 false)
  %scevgep22.10 = getelementptr [512 x [512 x i64]], [512 x [512 x i64]]* @C, i64 0, i64 %15, i64 %37
  %scevgep2223.10 = bitcast i64* %scevgep22.10 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep2223.10, i8 0, i64 256, i32 16, i1 false)
  %scevgep22.11 = getelementptr [512 x [512 x i64]], [512 x [512 x i64]]* @C, i64 0, i64 %16, i64 %37
  %scevgep2223.11 = bitcast i64* %scevgep22.11 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep2223.11, i8 0, i64 256, i32 16, i1 false)
  %scevgep22.12 = getelementptr [512 x [512 x i64]], [512 x [512 x i64]]* @C, i64 0, i64 %17, i64 %37
  %scevgep2223.12 = bitcast i64* %scevgep22.12 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep2223.12, i8 0, i64 256, i32 16, i1 false)
  %scevgep22.13 = getelementptr [512 x [512 x i64]], [512 x [512 x i64]]* @C, i64 0, i64 %18, i64 %37
  %scevgep2223.13 = bitcast i64* %scevgep22.13 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep2223.13, i8 0, i64 256, i32 16, i1 false)
  %scevgep22.14 = getelementptr [512 x [512 x i64]], [512 x [512 x i64]]* @C, i64 0, i64 %19, i64 %37
  %scevgep2223.14 = bitcast i64* %scevgep22.14 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep2223.14, i8 0, i64 256, i32 16, i1 false)
  %scevgep22.15 = getelementptr [512 x [512 x i64]], [512 x [512 x i64]]* @C, i64 0, i64 %20, i64 %37
  %scevgep2223.15 = bitcast i64* %scevgep22.15 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep2223.15, i8 0, i64 256, i32 16, i1 false)
  %scevgep22.16 = getelementptr [512 x [512 x i64]], [512 x [512 x i64]]* @C, i64 0, i64 %21, i64 %37
  %scevgep2223.16 = bitcast i64* %scevgep22.16 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep2223.16, i8 0, i64 256, i32 16, i1 false)
  %scevgep22.17 = getelementptr [512 x [512 x i64]], [512 x [512 x i64]]* @C, i64 0, i64 %22, i64 %37
  %scevgep2223.17 = bitcast i64* %scevgep22.17 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep2223.17, i8 0, i64 256, i32 16, i1 false)
  %scevgep22.18 = getelementptr [512 x [512 x i64]], [512 x [512 x i64]]* @C, i64 0, i64 %23, i64 %37
  %scevgep2223.18 = bitcast i64* %scevgep22.18 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep2223.18, i8 0, i64 256, i32 16, i1 false)
  %scevgep22.19 = getelementptr [512 x [512 x i64]], [512 x [512 x i64]]* @C, i64 0, i64 %24, i64 %37
  %scevgep2223.19 = bitcast i64* %scevgep22.19 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep2223.19, i8 0, i64 256, i32 16, i1 false)
  %scevgep22.20 = getelementptr [512 x [512 x i64]], [512 x [512 x i64]]* @C, i64 0, i64 %25, i64 %37
  %scevgep2223.20 = bitcast i64* %scevgep22.20 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep2223.20, i8 0, i64 256, i32 16, i1 false)
  %scevgep22.21 = getelementptr [512 x [512 x i64]], [512 x [512 x i64]]* @C, i64 0, i64 %26, i64 %37
  %scevgep2223.21 = bitcast i64* %scevgep22.21 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep2223.21, i8 0, i64 256, i32 16, i1 false)
  %scevgep22.22 = getelementptr [512 x [512 x i64]], [512 x [512 x i64]]* @C, i64 0, i64 %27, i64 %37
  %scevgep2223.22 = bitcast i64* %scevgep22.22 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep2223.22, i8 0, i64 256, i32 16, i1 false)
  %scevgep22.23 = getelementptr [512 x [512 x i64]], [512 x [512 x i64]]* @C, i64 0, i64 %28, i64 %37
  %scevgep2223.23 = bitcast i64* %scevgep22.23 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep2223.23, i8 0, i64 256, i32 16, i1 false)
  %scevgep22.24 = getelementptr [512 x [512 x i64]], [512 x [512 x i64]]* @C, i64 0, i64 %29, i64 %37
  %scevgep2223.24 = bitcast i64* %scevgep22.24 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep2223.24, i8 0, i64 256, i32 16, i1 false)
  %scevgep22.25 = getelementptr [512 x [512 x i64]], [512 x [512 x i64]]* @C, i64 0, i64 %30, i64 %37
  %scevgep2223.25 = bitcast i64* %scevgep22.25 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep2223.25, i8 0, i64 256, i32 16, i1 false)
  %scevgep22.26 = getelementptr [512 x [512 x i64]], [512 x [512 x i64]]* @C, i64 0, i64 %31, i64 %37
  %scevgep2223.26 = bitcast i64* %scevgep22.26 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep2223.26, i8 0, i64 256, i32 16, i1 false)
  %scevgep22.27 = getelementptr [512 x [512 x i64]], [512 x [512 x i64]]* @C, i64 0, i64 %32, i64 %37
  %scevgep2223.27 = bitcast i64* %scevgep22.27 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep2223.27, i8 0, i64 256, i32 16, i1 false)
  %scevgep22.28 = getelementptr [512 x [512 x i64]], [512 x [512 x i64]]* @C, i64 0, i64 %33, i64 %37
  %scevgep2223.28 = bitcast i64* %scevgep22.28 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep2223.28, i8 0, i64 256, i32 16, i1 false)
  %scevgep22.29 = getelementptr [512 x [512 x i64]], [512 x [512 x i64]]* @C, i64 0, i64 %34, i64 %37
  %scevgep2223.29 = bitcast i64* %scevgep22.29 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep2223.29, i8 0, i64 256, i32 16, i1 false)
  %scevgep22.30 = getelementptr [512 x [512 x i64]], [512 x [512 x i64]]* @C, i64 0, i64 %35, i64 %37
  %scevgep2223.30 = bitcast i64* %scevgep22.30 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep2223.30, i8 0, i64 256, i32 16, i1 false)
  %scevgep22.31 = getelementptr [512 x [512 x i64]], [512 x [512 x i64]]* @C, i64 0, i64 %36, i64 %37
  %scevgep2223.31 = bitcast i64* %scevgep22.31 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep2223.31, i8 0, i64 256, i32 16, i1 false)
  %polly.indvar_next6 = add nuw nsw i64 %polly.indvar5, 1
  %exitcond21 = icmp eq i64 %polly.indvar_next6, 16
  br i1 %exitcond21, label %polly.loop_exit4, label %polly.loop_preheader9
}

declare i8 @GOMP_loop_runtime_next(i64*, i64*)

declare void @GOMP_loop_end_nowait()

declare void @GOMP_parallel_loop_runtime_start(void (i8*)*, i8*, i32, i64, i64, i64)

declare void @GOMP_parallel_end()

; Function Attrs: argmemonly nounwind
declare void @llvm.lifetime.end(i64, i8* nocapture) #5

define internal void @mat_mult_polly_subfn_1(i8* nocapture readnone %polly.par.userContext) #6 {
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

polly.loop_exit10:                                ; preds = %polly.loop_exit16
  %polly.indvar_next6 = add nuw nsw i64 %polly.indvar5, 1
  %exitcond40 = icmp eq i64 %polly.indvar_next6, 16
  br i1 %exitcond40, label %polly.loop_exit4, label %polly.loop_preheader9

polly.loop_preheader3:                            ; preds = %polly.par.loadIVBounds, %polly.loop_exit4
  %polly.indvar = phi i64 [ %polly.par.LB, %polly.par.loadIVBounds ], [ %polly.indvar_next, %polly.loop_exit4 ]
  %4 = shl nsw i64 %polly.indvar, 5
  br label %polly.loop_preheader9

polly.loop_exit16:                                ; preds = %polly.loop_exit22
  %polly.indvar_next12 = add nuw nsw i64 %polly.indvar11, 1
  %exitcond39 = icmp eq i64 %polly.indvar_next12, 16
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
  store i64 %p_add.lcssa, i64* %scevgep, align 8, !alias.scope !88, !noalias !90
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
  %scevgep32 = getelementptr [512 x [512 x i64]], [512 x [512 x i64]]* @A, i64 0, i64 %7, i64 %8
  %_p_scalar_33 = load i64, i64* %scevgep32, align 8, !alias.scope !91, !noalias !93
  %scevgep34 = getelementptr [512 x [512 x i64]], [512 x [512 x i64]]* @B, i64 0, i64 %8, i64 %9
  %_p_scalar_35 = load i64, i64* %scevgep34, align 8, !alias.scope !92, !noalias !94
  %p_mul = mul nsw i64 %_p_scalar_35, %_p_scalar_33, !dbg !95
  %p_add = add nsw i64 %p_mul, %p_add41, !dbg !104
  %polly.indvar_next30 = add nuw nsw i64 %polly.indvar29, 1
  %exitcond = icmp eq i64 %polly.indvar_next30, 32
  br i1 %exitcond, label %polly.loop_exit28, label %polly.loop_header26

polly.loop_preheader27:                           ; preds = %polly.loop_exit28, %polly.loop_preheader21
  %polly.indvar23 = phi i64 [ 0, %polly.loop_preheader21 ], [ %polly.indvar_next24, %polly.loop_exit28 ]
  %9 = add nuw nsw i64 %polly.indvar23, %5
  %scevgep = getelementptr [512 x [512 x i64]], [512 x [512 x i64]]* @C, i64 0, i64 %7, i64 %9
  %scevgep.promoted = load i64, i64* %scevgep, align 8, !alias.scope !88, !noalias !90
  br label %polly.loop_header26
}

; Function Attrs: argmemonly nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture, i8, i64, i32, i1) #5

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
!1 = !DIFile(filename: "MatrixMult.c", directory: "/home/sam/workspace/WhileyOpenCL/polly/MatrixMult/impl/handwritten")
!2 = !{}
!3 = !{!4, !7, !8, !9}
!4 = distinct !DISubprogram(name: "init_array", scope: !1, file: !1, line: 7, type: !5, isLocal: false, isDefinition: true, scopeLine: 8, isOptimized: false, variables: !2)
!5 = !DISubroutineType(types: !6)
!6 = !{null}
!7 = distinct !DISubprogram(name: "mat_mult", scope: !1, file: !1, line: 19, type: !5, isLocal: false, isDefinition: true, scopeLine: 19, isOptimized: false, variables: !2)
!8 = distinct !DISubprogram(name: "print_array", scope: !1, file: !1, line: 31, type: !5, isLocal: false, isDefinition: true, scopeLine: 32, isOptimized: false, variables: !2)
!9 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 44, type: !10, isLocal: false, isDefinition: true, scopeLine: 45, isOptimized: false, variables: !2)
!10 = !DISubroutineType(types: !11)
!11 = !{!12}
!12 = !DIBasicType(name: "int", size: 32, align: 32, encoding: DW_ATE_signed)
!13 = !{!14, !19, !20}
!14 = !DIGlobalVariable(name: "A", scope: !0, file: !1, line: 3, type: !15, isLocal: false, isDefinition: true, variable: [512 x [512 x i64]]* @A)
!15 = !DICompositeType(tag: DW_TAG_array_type, baseType: !16, size: 16777216, align: 64, elements: !17)
!16 = !DIBasicType(name: "long long int", size: 64, align: 64, encoding: DW_ATE_signed)
!17 = !{!18, !18}
!18 = !DISubrange(count: 512)
!19 = !DIGlobalVariable(name: "B", scope: !0, file: !1, line: 4, type: !15, isLocal: false, isDefinition: true, variable: [512 x [512 x i64]]* @B)
!20 = !DIGlobalVariable(name: "C", scope: !0, file: !1, line: 5, type: !15, isLocal: false, isDefinition: true, variable: [512 x [512 x i64]]* @C)
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
!47 = !DILocation(line: 29, column: 1, scope: !7)
!48 = !DILocation(line: 33, column: 9, scope: !8)
!49 = !DILocalVariable(name: "i", scope: !8, file: !1, line: 33, type: !12)
!50 = !DILocation(line: 35, column: 5, scope: !51)
!51 = !DILexicalBlockFile(scope: !52, file: !1, discriminator: 1)
!52 = distinct !DILexicalBlock(scope: !53, file: !1, line: 35, column: 5)
!53 = distinct !DILexicalBlock(scope: !8, file: !1, line: 35, column: 5)
!54 = !DILocation(line: 37, column: 21, scope: !55)
!55 = distinct !DILexicalBlock(scope: !56, file: !1, line: 36, column: 29)
!56 = distinct !DILexicalBlock(scope: !57, file: !1, line: 36, column: 9)
!57 = distinct !DILexicalBlock(scope: !58, file: !1, line: 36, column: 9)
!58 = distinct !DILexicalBlock(scope: !52, file: !1, line: 35, column: 25)
!59 = !DILocation(line: 36, column: 9, scope: !60)
!60 = !DILexicalBlockFile(scope: !56, file: !1, discriminator: 1)
!61 = !DILocation(line: 37, column: 38, scope: !55)
!62 = !DILocation(line: 37, column: 13, scope: !55)
!63 = !DILocation(line: 38, column: 18, scope: !64)
!64 = distinct !DILexicalBlock(scope: !55, file: !1, line: 38, column: 17)
!65 = !DILocation(line: 38, column: 22, scope: !64)
!66 = !DILocation(line: 38, column: 17, scope: !55)
!67 = !DILocation(line: 38, column: 37, scope: !68)
!68 = !DILexicalBlockFile(scope: !64, file: !1, discriminator: 1)
!69 = !DILocation(line: 38, column: 29, scope: !68)
!70 = !DILocation(line: 40, column: 9, scope: !58)
!71 = !DILocation(line: 42, column: 1, scope: !8)
!72 = !DILocation(line: 9, column: 9, scope: !4, inlinedAt: !73)
!73 = distinct !DILocation(line: 51, column: 5, scope: !9)
!74 = !DILocation(line: 11, column: 5, scope: !28, inlinedAt: !73)
!75 = !DILocation(line: 51, column: 5, scope: !9)
!76 = !DILocation(line: 12, column: 9, scope: !32, inlinedAt: !73)
!77 = !DILocation(line: 13, column: 13, scope: !37, inlinedAt: !73)
!78 = !DILocation(line: 13, column: 21, scope: !37, inlinedAt: !73)
!79 = !DILocation(line: 14, column: 13, scope: !37, inlinedAt: !73)
!80 = !DILocation(line: 14, column: 21, scope: !37, inlinedAt: !73)
!81 = distinct !{!81, !42, !43}
!82 = !DILocation(line: 20, column: 9, scope: !7, inlinedAt: !83)
!83 = distinct !DILocation(line: 52, column: 5, scope: !9)
!84 = !DILocation(line: 52, column: 5, scope: !9)
!85 = !DILocation(line: 55, column: 71, scope: !9)
!86 = !DILocation(line: 55, column: 5, scope: !9)
!87 = !DILocation(line: 56, column: 5, scope: !9)
!88 = distinct !{!88, !89, !"polly.alias.scope.C"}
!89 = distinct !{!89, !"polly.alias.scope.domain"}
!90 = !{!91, !92}
!91 = distinct !{!91, !89, !"polly.alias.scope.A"}
!92 = distinct !{!92, !89, !"polly.alias.scope.B"}
!93 = !{!88, !92}
!94 = !{!91, !88}
!95 = !DILocation(line: 25, column: 45, scope: !96)
!96 = distinct !DILexicalBlock(scope: !97, file: !1, line: 24, column: 13)
!97 = distinct !DILexicalBlock(scope: !98, file: !1, line: 24, column: 13)
!98 = distinct !DILexicalBlock(scope: !99, file: !1, line: 22, column: 29)
!99 = distinct !DILexicalBlock(scope: !100, file: !1, line: 22, column: 9)
!100 = distinct !DILexicalBlock(scope: !101, file: !1, line: 22, column: 9)
!101 = distinct !DILexicalBlock(scope: !102, file: !1, line: 21, column: 25)
!102 = distinct !DILexicalBlock(scope: !103, file: !1, line: 21, column: 5)
!103 = distinct !DILexicalBlock(scope: !7, file: !1, line: 21, column: 5)
!104 = !DILocation(line: 25, column: 35, scope: !96)
