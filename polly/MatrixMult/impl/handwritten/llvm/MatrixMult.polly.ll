; ModuleID = 'MatrixMult.preopt.ll'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@A = common global [32 x [32 x i64]] zeroinitializer, align 16
@B = common global [32 x [32 x i64]] zeroinitializer, align 16
@C = common global [32 x [32 x i64]] zeroinitializer, align 16
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

vector.ph:                                        ; preds = %vector.body, %entry.split
  %indvars.iv3 = phi i64 [ 0, %entry.split ], [ %indvars.iv.next4, %vector.body ]
  br label %vector.body, !dbg !31

vector.body:                                      ; preds = %vector.ph
  %0 = getelementptr inbounds [32 x [32 x i64]], [32 x [32 x i64]]* @A, i64 0, i64 %indvars.iv3, i64 0, !dbg !36
  %1 = bitcast i64* %0 to <2 x i64>*, !dbg !38
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %1, align 16, !dbg !38
  %2 = getelementptr inbounds [32 x [32 x i64]], [32 x [32 x i64]]* @B, i64 0, i64 %indvars.iv3, i64 0, !dbg !39
  %3 = bitcast i64* %2 to <2 x i64>*, !dbg !40
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %3, align 16, !dbg !40
  %4 = getelementptr inbounds [32 x [32 x i64]], [32 x [32 x i64]]* @A, i64 0, i64 %indvars.iv3, i64 2, !dbg !36
  %5 = bitcast i64* %4 to <2 x i64>*, !dbg !38
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %5, align 16, !dbg !38
  %6 = getelementptr inbounds [32 x [32 x i64]], [32 x [32 x i64]]* @B, i64 0, i64 %indvars.iv3, i64 2, !dbg !39
  %7 = bitcast i64* %6 to <2 x i64>*, !dbg !40
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %7, align 16, !dbg !40
  %8 = getelementptr inbounds [32 x [32 x i64]], [32 x [32 x i64]]* @A, i64 0, i64 %indvars.iv3, i64 4, !dbg !36
  %9 = bitcast i64* %8 to <2 x i64>*, !dbg !38
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %9, align 16, !dbg !38
  %10 = getelementptr inbounds [32 x [32 x i64]], [32 x [32 x i64]]* @B, i64 0, i64 %indvars.iv3, i64 4, !dbg !39
  %11 = bitcast i64* %10 to <2 x i64>*, !dbg !40
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %11, align 16, !dbg !40
  %12 = getelementptr inbounds [32 x [32 x i64]], [32 x [32 x i64]]* @A, i64 0, i64 %indvars.iv3, i64 6, !dbg !36
  %13 = bitcast i64* %12 to <2 x i64>*, !dbg !38
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %13, align 16, !dbg !38
  %14 = getelementptr inbounds [32 x [32 x i64]], [32 x [32 x i64]]* @B, i64 0, i64 %indvars.iv3, i64 6, !dbg !39
  %15 = bitcast i64* %14 to <2 x i64>*, !dbg !40
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %15, align 16, !dbg !40
  %16 = getelementptr inbounds [32 x [32 x i64]], [32 x [32 x i64]]* @A, i64 0, i64 %indvars.iv3, i64 8, !dbg !36
  %17 = bitcast i64* %16 to <2 x i64>*, !dbg !38
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %17, align 16, !dbg !38
  %18 = getelementptr inbounds [32 x [32 x i64]], [32 x [32 x i64]]* @B, i64 0, i64 %indvars.iv3, i64 8, !dbg !39
  %19 = bitcast i64* %18 to <2 x i64>*, !dbg !40
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %19, align 16, !dbg !40
  %20 = getelementptr inbounds [32 x [32 x i64]], [32 x [32 x i64]]* @A, i64 0, i64 %indvars.iv3, i64 10, !dbg !36
  %21 = bitcast i64* %20 to <2 x i64>*, !dbg !38
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %21, align 16, !dbg !38
  %22 = getelementptr inbounds [32 x [32 x i64]], [32 x [32 x i64]]* @B, i64 0, i64 %indvars.iv3, i64 10, !dbg !39
  %23 = bitcast i64* %22 to <2 x i64>*, !dbg !40
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %23, align 16, !dbg !40
  %24 = getelementptr inbounds [32 x [32 x i64]], [32 x [32 x i64]]* @A, i64 0, i64 %indvars.iv3, i64 12, !dbg !36
  %25 = bitcast i64* %24 to <2 x i64>*, !dbg !38
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %25, align 16, !dbg !38
  %26 = getelementptr inbounds [32 x [32 x i64]], [32 x [32 x i64]]* @B, i64 0, i64 %indvars.iv3, i64 12, !dbg !39
  %27 = bitcast i64* %26 to <2 x i64>*, !dbg !40
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %27, align 16, !dbg !40
  %28 = getelementptr inbounds [32 x [32 x i64]], [32 x [32 x i64]]* @A, i64 0, i64 %indvars.iv3, i64 14, !dbg !36
  %29 = bitcast i64* %28 to <2 x i64>*, !dbg !38
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %29, align 16, !dbg !38
  %30 = getelementptr inbounds [32 x [32 x i64]], [32 x [32 x i64]]* @B, i64 0, i64 %indvars.iv3, i64 14, !dbg !39
  %31 = bitcast i64* %30 to <2 x i64>*, !dbg !40
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %31, align 16, !dbg !40
  %32 = getelementptr inbounds [32 x [32 x i64]], [32 x [32 x i64]]* @A, i64 0, i64 %indvars.iv3, i64 16, !dbg !36
  %33 = bitcast i64* %32 to <2 x i64>*, !dbg !38
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %33, align 16, !dbg !38
  %34 = getelementptr inbounds [32 x [32 x i64]], [32 x [32 x i64]]* @B, i64 0, i64 %indvars.iv3, i64 16, !dbg !39
  %35 = bitcast i64* %34 to <2 x i64>*, !dbg !40
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %35, align 16, !dbg !40
  %36 = getelementptr inbounds [32 x [32 x i64]], [32 x [32 x i64]]* @A, i64 0, i64 %indvars.iv3, i64 18, !dbg !36
  %37 = bitcast i64* %36 to <2 x i64>*, !dbg !38
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %37, align 16, !dbg !38
  %38 = getelementptr inbounds [32 x [32 x i64]], [32 x [32 x i64]]* @B, i64 0, i64 %indvars.iv3, i64 18, !dbg !39
  %39 = bitcast i64* %38 to <2 x i64>*, !dbg !40
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %39, align 16, !dbg !40
  %40 = getelementptr inbounds [32 x [32 x i64]], [32 x [32 x i64]]* @A, i64 0, i64 %indvars.iv3, i64 20, !dbg !36
  %41 = bitcast i64* %40 to <2 x i64>*, !dbg !38
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %41, align 16, !dbg !38
  %42 = getelementptr inbounds [32 x [32 x i64]], [32 x [32 x i64]]* @B, i64 0, i64 %indvars.iv3, i64 20, !dbg !39
  %43 = bitcast i64* %42 to <2 x i64>*, !dbg !40
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %43, align 16, !dbg !40
  %44 = getelementptr inbounds [32 x [32 x i64]], [32 x [32 x i64]]* @A, i64 0, i64 %indvars.iv3, i64 22, !dbg !36
  %45 = bitcast i64* %44 to <2 x i64>*, !dbg !38
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %45, align 16, !dbg !38
  %46 = getelementptr inbounds [32 x [32 x i64]], [32 x [32 x i64]]* @B, i64 0, i64 %indvars.iv3, i64 22, !dbg !39
  %47 = bitcast i64* %46 to <2 x i64>*, !dbg !40
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %47, align 16, !dbg !40
  %48 = getelementptr inbounds [32 x [32 x i64]], [32 x [32 x i64]]* @A, i64 0, i64 %indvars.iv3, i64 24, !dbg !36
  %49 = bitcast i64* %48 to <2 x i64>*, !dbg !38
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %49, align 16, !dbg !38
  %50 = getelementptr inbounds [32 x [32 x i64]], [32 x [32 x i64]]* @B, i64 0, i64 %indvars.iv3, i64 24, !dbg !39
  %51 = bitcast i64* %50 to <2 x i64>*, !dbg !40
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %51, align 16, !dbg !40
  %52 = getelementptr inbounds [32 x [32 x i64]], [32 x [32 x i64]]* @A, i64 0, i64 %indvars.iv3, i64 26, !dbg !36
  %53 = bitcast i64* %52 to <2 x i64>*, !dbg !38
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %53, align 16, !dbg !38
  %54 = getelementptr inbounds [32 x [32 x i64]], [32 x [32 x i64]]* @B, i64 0, i64 %indvars.iv3, i64 26, !dbg !39
  %55 = bitcast i64* %54 to <2 x i64>*, !dbg !40
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %55, align 16, !dbg !40
  %56 = getelementptr inbounds [32 x [32 x i64]], [32 x [32 x i64]]* @A, i64 0, i64 %indvars.iv3, i64 28, !dbg !36
  %57 = bitcast i64* %56 to <2 x i64>*, !dbg !38
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %57, align 16, !dbg !38
  %58 = getelementptr inbounds [32 x [32 x i64]], [32 x [32 x i64]]* @B, i64 0, i64 %indvars.iv3, i64 28, !dbg !39
  %59 = bitcast i64* %58 to <2 x i64>*, !dbg !40
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %59, align 16, !dbg !40
  %60 = getelementptr inbounds [32 x [32 x i64]], [32 x [32 x i64]]* @A, i64 0, i64 %indvars.iv3, i64 30, !dbg !36
  %61 = bitcast i64* %60 to <2 x i64>*, !dbg !38
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %61, align 16, !dbg !38
  %62 = getelementptr inbounds [32 x [32 x i64]], [32 x [32 x i64]]* @B, i64 0, i64 %indvars.iv3, i64 30, !dbg !39
  %63 = bitcast i64* %62 to <2 x i64>*, !dbg !40
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %63, align 16, !dbg !40
  %indvars.iv.next4 = add nuw nsw i64 %indvars.iv3, 1, !dbg !27
  %exitcond5 = icmp eq i64 %indvars.iv.next4, 32, !dbg !27
  br i1 %exitcond5, label %for.end12, label %vector.ph, !dbg !27

for.end12:                                        ; preds = %vector.body
  ret void, !dbg !41
}

; Function Attrs: nounwind uwtable
define void @mat_mult() #1 !dbg !7 {
entry:
  br label %entry.split, !dbg !42

entry.split:                                      ; preds = %entry
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !43, metadata !26), !dbg !42
  call void @llvm.memset.p0i8.i64(i8* bitcast ([32 x [32 x i64]]* @C to i8*), i8 0, i64 8192, i32 16, i1 false)
  br label %polly.loop_preheader15

polly.exiting:                                    ; preds = %polly.loop_exit16
  ret void, !dbg !44

polly.loop_exit16:                                ; preds = %polly.loop_exit22
  %polly.indvar_next12 = add nuw nsw i64 %polly.indvar11, 1
  %exitcond38 = icmp eq i64 %polly.indvar_next12, 32
  br i1 %exitcond38, label %polly.exiting, label %polly.loop_preheader15

polly.loop_exit22:                                ; preds = %polly.stmt.for.body8
  %p_add.1.lcssa = phi i64 [ %p_add.1, %polly.stmt.for.body8 ]
  store i64 %p_add.1.lcssa, i64* %scevgep27, align 8, !alias.scope !45, !noalias !47
  %polly.indvar_next18 = add nuw nsw i64 %polly.indvar17, 1
  %exitcond37 = icmp eq i64 %polly.indvar_next18, 32
  br i1 %exitcond37, label %polly.loop_exit16, label %polly.loop_preheader21

polly.loop_preheader15:                           ; preds = %polly.loop_exit16, %entry.split
  %polly.indvar11 = phi i64 [ %polly.indvar_next12, %polly.loop_exit16 ], [ 0, %entry.split ]
  br label %polly.loop_preheader21

polly.stmt.for.body8:                             ; preds = %polly.stmt.for.body8, %polly.loop_preheader21
  %p_add36 = phi i64 [ %scevgep27.promoted, %polly.loop_preheader21 ], [ %p_add.1, %polly.stmt.for.body8 ]
  %polly.indvar23 = phi i64 [ 0, %polly.loop_preheader21 ], [ %polly.indvar_next24.1, %polly.stmt.for.body8 ]
  %scevgep29 = getelementptr [32 x [32 x i64]], [32 x [32 x i64]]* @A, i64 0, i64 %polly.indvar11, i64 %polly.indvar23
  %_p_scalar_30 = load i64, i64* %scevgep29, align 16, !alias.scope !48, !noalias !50
  %0 = shl i64 %polly.indvar23, 5
  %scevgep32 = getelementptr i64, i64* %scevgep31, i64 %0
  %_p_scalar_33 = load i64, i64* %scevgep32, align 8, !alias.scope !49, !noalias !51
  %p_mul = mul nsw i64 %_p_scalar_33, %_p_scalar_30, !dbg !52
  %p_add = add nsw i64 %p_mul, %p_add36, !dbg !61
  %polly.indvar_next24 = or i64 %polly.indvar23, 1
  %scevgep29.1 = getelementptr [32 x [32 x i64]], [32 x [32 x i64]]* @A, i64 0, i64 %polly.indvar11, i64 %polly.indvar_next24
  %_p_scalar_30.1 = load i64, i64* %scevgep29.1, align 8, !alias.scope !48, !noalias !50
  %1 = shl i64 %polly.indvar_next24, 5
  %scevgep32.1 = getelementptr i64, i64* %scevgep31, i64 %1
  %_p_scalar_33.1 = load i64, i64* %scevgep32.1, align 8, !alias.scope !49, !noalias !51
  %p_mul.1 = mul nsw i64 %_p_scalar_33.1, %_p_scalar_30.1, !dbg !52
  %p_add.1 = add nsw i64 %p_mul.1, %p_add, !dbg !61
  %polly.indvar_next24.1 = add nsw i64 %polly.indvar23, 2
  %exitcond.1 = icmp eq i64 %polly.indvar_next24.1, 32
  br i1 %exitcond.1, label %polly.loop_exit22, label %polly.stmt.for.body8

polly.loop_preheader21:                           ; preds = %polly.loop_exit22, %polly.loop_preheader15
  %polly.indvar17 = phi i64 [ 0, %polly.loop_preheader15 ], [ %polly.indvar_next18, %polly.loop_exit22 ]
  %scevgep27 = getelementptr [32 x [32 x i64]], [32 x [32 x i64]]* @C, i64 0, i64 %polly.indvar11, i64 %polly.indvar17
  %scevgep31 = getelementptr [32 x [32 x i64]], [32 x [32 x i64]]* @B, i64 0, i64 0, i64 %polly.indvar17
  %scevgep27.promoted = load i64, i64* %scevgep27, align 8, !alias.scope !45, !noalias !47
  br label %polly.stmt.for.body8
}

; Function Attrs: nounwind uwtable
define void @print_array() #0 !dbg !8 {
entry:
  br label %entry.split, !dbg !62

entry.split:                                      ; preds = %entry
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !63, metadata !26), !dbg !62
  br label %for.cond1.preheader, !dbg !64

for.cond1.preheader:                              ; preds = %for.end, %entry.split
  %indvars.iv6 = phi i64 [ 0, %entry.split ], [ %indvars.iv.next7, %for.end ]
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 8, !dbg !68
  br label %for.body3, !dbg !73

for.body3:                                        ; preds = %for.body3, %for.cond1.preheader
  %indvars.iv = phi i64 [ 0, %for.cond1.preheader ], [ %indvars.iv.next, %for.body3 ]
  %1 = phi %struct._IO_FILE* [ %0, %for.cond1.preheader ], [ %3, %for.body3 ]
  %arrayidx5 = getelementptr inbounds [32 x [32 x i64]], [32 x [32 x i64]]* @C, i64 0, i64 %indvars.iv6, i64 %indvars.iv, !dbg !75
  %2 = load i64, i64* %arrayidx5, align 8, !dbg !75
  %call = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %1, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str, i64 0, i64 0), i64 %2) #4, !dbg !76
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1, !dbg !73
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 8, !dbg !68
  %exitcond = icmp eq i64 %indvars.iv.next, 32, !dbg !73
  br i1 %exitcond, label %for.end, label %for.body3, !dbg !73

for.end:                                          ; preds = %for.body3
  %.lcssa = phi %struct._IO_FILE* [ %3, %for.body3 ]
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %.lcssa), !dbg !77
  %indvars.iv.next7 = add nuw nsw i64 %indvars.iv6, 1, !dbg !64
  %exitcond8 = icmp eq i64 %indvars.iv.next7, 32, !dbg !64
  br i1 %exitcond8, label %for.end11, label %for.cond1.preheader, !dbg !64

for.end11:                                        ; preds = %for.end
  ret void, !dbg !78
}

; Function Attrs: nounwind
declare i32 @fprintf(%struct._IO_FILE* nocapture, i8* nocapture readonly, ...) #2

; Function Attrs: nounwind uwtable
define i32 @main() #0 !dbg !9 {
entry:
  br label %entry.split, !dbg !79

entry.split:                                      ; preds = %entry
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !80, metadata !26), !dbg !79
  br label %for.body, !dbg !81

for.body:                                         ; preds = %mat_mult.exit, %entry.split
  %r.01 = phi i32 [ 0, %entry.split ], [ %inc, %mat_mult.exit ]
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !25, metadata !26), !dbg !85
  br label %vector.ph, !dbg !88

vector.ph:                                        ; preds = %vector.body, %for.body
  %indvars.iv3.i = phi i64 [ 0, %for.body ], [ %indvars.iv.next4.i, %vector.body ], !dbg !89
  br label %vector.body, !dbg !90

vector.body:                                      ; preds = %vector.ph
  %0 = getelementptr inbounds [32 x [32 x i64]], [32 x [32 x i64]]* @A, i64 0, i64 %indvars.iv3.i, i64 0, !dbg !91
  %1 = bitcast i64* %0 to <2 x i64>*, !dbg !92
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %1, align 16, !dbg !92
  %2 = getelementptr inbounds [32 x [32 x i64]], [32 x [32 x i64]]* @B, i64 0, i64 %indvars.iv3.i, i64 0, !dbg !93
  %3 = bitcast i64* %2 to <2 x i64>*, !dbg !94
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %3, align 16, !dbg !94
  %4 = getelementptr inbounds [32 x [32 x i64]], [32 x [32 x i64]]* @A, i64 0, i64 %indvars.iv3.i, i64 2, !dbg !91
  %5 = bitcast i64* %4 to <2 x i64>*, !dbg !92
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %5, align 16, !dbg !92
  %6 = getelementptr inbounds [32 x [32 x i64]], [32 x [32 x i64]]* @B, i64 0, i64 %indvars.iv3.i, i64 2, !dbg !93
  %7 = bitcast i64* %6 to <2 x i64>*, !dbg !94
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %7, align 16, !dbg !94
  %8 = getelementptr inbounds [32 x [32 x i64]], [32 x [32 x i64]]* @A, i64 0, i64 %indvars.iv3.i, i64 4, !dbg !91
  %9 = bitcast i64* %8 to <2 x i64>*, !dbg !92
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %9, align 16, !dbg !92
  %10 = getelementptr inbounds [32 x [32 x i64]], [32 x [32 x i64]]* @B, i64 0, i64 %indvars.iv3.i, i64 4, !dbg !93
  %11 = bitcast i64* %10 to <2 x i64>*, !dbg !94
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %11, align 16, !dbg !94
  %12 = getelementptr inbounds [32 x [32 x i64]], [32 x [32 x i64]]* @A, i64 0, i64 %indvars.iv3.i, i64 6, !dbg !91
  %13 = bitcast i64* %12 to <2 x i64>*, !dbg !92
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %13, align 16, !dbg !92
  %14 = getelementptr inbounds [32 x [32 x i64]], [32 x [32 x i64]]* @B, i64 0, i64 %indvars.iv3.i, i64 6, !dbg !93
  %15 = bitcast i64* %14 to <2 x i64>*, !dbg !94
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %15, align 16, !dbg !94
  %16 = getelementptr inbounds [32 x [32 x i64]], [32 x [32 x i64]]* @A, i64 0, i64 %indvars.iv3.i, i64 8, !dbg !91
  %17 = bitcast i64* %16 to <2 x i64>*, !dbg !92
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %17, align 16, !dbg !92
  %18 = getelementptr inbounds [32 x [32 x i64]], [32 x [32 x i64]]* @B, i64 0, i64 %indvars.iv3.i, i64 8, !dbg !93
  %19 = bitcast i64* %18 to <2 x i64>*, !dbg !94
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %19, align 16, !dbg !94
  %20 = getelementptr inbounds [32 x [32 x i64]], [32 x [32 x i64]]* @A, i64 0, i64 %indvars.iv3.i, i64 10, !dbg !91
  %21 = bitcast i64* %20 to <2 x i64>*, !dbg !92
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %21, align 16, !dbg !92
  %22 = getelementptr inbounds [32 x [32 x i64]], [32 x [32 x i64]]* @B, i64 0, i64 %indvars.iv3.i, i64 10, !dbg !93
  %23 = bitcast i64* %22 to <2 x i64>*, !dbg !94
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %23, align 16, !dbg !94
  %24 = getelementptr inbounds [32 x [32 x i64]], [32 x [32 x i64]]* @A, i64 0, i64 %indvars.iv3.i, i64 12, !dbg !91
  %25 = bitcast i64* %24 to <2 x i64>*, !dbg !92
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %25, align 16, !dbg !92
  %26 = getelementptr inbounds [32 x [32 x i64]], [32 x [32 x i64]]* @B, i64 0, i64 %indvars.iv3.i, i64 12, !dbg !93
  %27 = bitcast i64* %26 to <2 x i64>*, !dbg !94
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %27, align 16, !dbg !94
  %28 = getelementptr inbounds [32 x [32 x i64]], [32 x [32 x i64]]* @A, i64 0, i64 %indvars.iv3.i, i64 14, !dbg !91
  %29 = bitcast i64* %28 to <2 x i64>*, !dbg !92
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %29, align 16, !dbg !92
  %30 = getelementptr inbounds [32 x [32 x i64]], [32 x [32 x i64]]* @B, i64 0, i64 %indvars.iv3.i, i64 14, !dbg !93
  %31 = bitcast i64* %30 to <2 x i64>*, !dbg !94
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %31, align 16, !dbg !94
  %32 = getelementptr inbounds [32 x [32 x i64]], [32 x [32 x i64]]* @A, i64 0, i64 %indvars.iv3.i, i64 16, !dbg !91
  %33 = bitcast i64* %32 to <2 x i64>*, !dbg !92
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %33, align 16, !dbg !92
  %34 = getelementptr inbounds [32 x [32 x i64]], [32 x [32 x i64]]* @B, i64 0, i64 %indvars.iv3.i, i64 16, !dbg !93
  %35 = bitcast i64* %34 to <2 x i64>*, !dbg !94
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %35, align 16, !dbg !94
  %36 = getelementptr inbounds [32 x [32 x i64]], [32 x [32 x i64]]* @A, i64 0, i64 %indvars.iv3.i, i64 18, !dbg !91
  %37 = bitcast i64* %36 to <2 x i64>*, !dbg !92
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %37, align 16, !dbg !92
  %38 = getelementptr inbounds [32 x [32 x i64]], [32 x [32 x i64]]* @B, i64 0, i64 %indvars.iv3.i, i64 18, !dbg !93
  %39 = bitcast i64* %38 to <2 x i64>*, !dbg !94
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %39, align 16, !dbg !94
  %40 = getelementptr inbounds [32 x [32 x i64]], [32 x [32 x i64]]* @A, i64 0, i64 %indvars.iv3.i, i64 20, !dbg !91
  %41 = bitcast i64* %40 to <2 x i64>*, !dbg !92
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %41, align 16, !dbg !92
  %42 = getelementptr inbounds [32 x [32 x i64]], [32 x [32 x i64]]* @B, i64 0, i64 %indvars.iv3.i, i64 20, !dbg !93
  %43 = bitcast i64* %42 to <2 x i64>*, !dbg !94
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %43, align 16, !dbg !94
  %44 = getelementptr inbounds [32 x [32 x i64]], [32 x [32 x i64]]* @A, i64 0, i64 %indvars.iv3.i, i64 22, !dbg !91
  %45 = bitcast i64* %44 to <2 x i64>*, !dbg !92
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %45, align 16, !dbg !92
  %46 = getelementptr inbounds [32 x [32 x i64]], [32 x [32 x i64]]* @B, i64 0, i64 %indvars.iv3.i, i64 22, !dbg !93
  %47 = bitcast i64* %46 to <2 x i64>*, !dbg !94
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %47, align 16, !dbg !94
  %48 = getelementptr inbounds [32 x [32 x i64]], [32 x [32 x i64]]* @A, i64 0, i64 %indvars.iv3.i, i64 24, !dbg !91
  %49 = bitcast i64* %48 to <2 x i64>*, !dbg !92
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %49, align 16, !dbg !92
  %50 = getelementptr inbounds [32 x [32 x i64]], [32 x [32 x i64]]* @B, i64 0, i64 %indvars.iv3.i, i64 24, !dbg !93
  %51 = bitcast i64* %50 to <2 x i64>*, !dbg !94
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %51, align 16, !dbg !94
  %52 = getelementptr inbounds [32 x [32 x i64]], [32 x [32 x i64]]* @A, i64 0, i64 %indvars.iv3.i, i64 26, !dbg !91
  %53 = bitcast i64* %52 to <2 x i64>*, !dbg !92
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %53, align 16, !dbg !92
  %54 = getelementptr inbounds [32 x [32 x i64]], [32 x [32 x i64]]* @B, i64 0, i64 %indvars.iv3.i, i64 26, !dbg !93
  %55 = bitcast i64* %54 to <2 x i64>*, !dbg !94
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %55, align 16, !dbg !94
  %56 = getelementptr inbounds [32 x [32 x i64]], [32 x [32 x i64]]* @A, i64 0, i64 %indvars.iv3.i, i64 28, !dbg !91
  %57 = bitcast i64* %56 to <2 x i64>*, !dbg !92
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %57, align 16, !dbg !92
  %58 = getelementptr inbounds [32 x [32 x i64]], [32 x [32 x i64]]* @B, i64 0, i64 %indvars.iv3.i, i64 28, !dbg !93
  %59 = bitcast i64* %58 to <2 x i64>*, !dbg !94
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %59, align 16, !dbg !94
  %60 = getelementptr inbounds [32 x [32 x i64]], [32 x [32 x i64]]* @A, i64 0, i64 %indvars.iv3.i, i64 30, !dbg !91
  %61 = bitcast i64* %60 to <2 x i64>*, !dbg !92
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %61, align 16, !dbg !92
  %62 = getelementptr inbounds [32 x [32 x i64]], [32 x [32 x i64]]* @B, i64 0, i64 %indvars.iv3.i, i64 30, !dbg !93
  %63 = bitcast i64* %62 to <2 x i64>*, !dbg !94
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %63, align 16, !dbg !94
  %indvars.iv.next4.i = add nuw nsw i64 %indvars.iv3.i, 1, !dbg !88
  %exitcond5.i = icmp eq i64 %indvars.iv.next4.i, 32, !dbg !88
  br i1 %exitcond5.i, label %init_array.exit, label %vector.ph, !dbg !88

init_array.exit:                                  ; preds = %vector.body
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !43, metadata !26) #4, !dbg !95
  tail call void @llvm.memset.p0i8.i64(i8* bitcast ([32 x [32 x i64]]* @C to i8*), i8 0, i64 8192, i32 16, i1 false) #4, !dbg !97
  br label %polly.loop_preheader15.i, !dbg !97

polly.loop_exit16.i:                              ; preds = %polly.loop_exit22.i
  %polly.indvar_next12.i = add nuw nsw i64 %polly.indvar11.i, 1, !dbg !97
  %exitcond38.i = icmp eq i64 %polly.indvar_next12.i, 32, !dbg !97
  br i1 %exitcond38.i, label %mat_mult.exit, label %polly.loop_preheader15.i, !dbg !97

polly.loop_exit22.i:                              ; preds = %polly.stmt.for.body8.i
  %p_add.i.1.lcssa = phi i64 [ %p_add.i.1, %polly.stmt.for.body8.i ]
  store i64 %p_add.i.1.lcssa, i64* %scevgep27.i, align 8, !dbg !97, !alias.scope !98, !noalias !100
  %polly.indvar_next18.i = add nuw nsw i64 %polly.indvar17.i, 1, !dbg !97
  %exitcond37.i = icmp eq i64 %polly.indvar_next18.i, 32, !dbg !97
  br i1 %exitcond37.i, label %polly.loop_exit16.i, label %polly.loop_preheader21.i, !dbg !97

polly.loop_preheader15.i:                         ; preds = %polly.loop_exit16.i, %init_array.exit
  %polly.indvar11.i = phi i64 [ %polly.indvar_next12.i, %polly.loop_exit16.i ], [ 0, %init_array.exit ], !dbg !97
  br label %polly.loop_preheader21.i, !dbg !97

polly.stmt.for.body8.i:                           ; preds = %polly.stmt.for.body8.i, %polly.loop_preheader21.i
  %p_add36.i = phi i64 [ %scevgep27.promoted.i, %polly.loop_preheader21.i ], [ %p_add.i.1, %polly.stmt.for.body8.i ], !dbg !97
  %polly.indvar23.i = phi i64 [ 0, %polly.loop_preheader21.i ], [ %polly.indvar_next24.i.1, %polly.stmt.for.body8.i ], !dbg !97
  %scevgep29.i = getelementptr [32 x [32 x i64]], [32 x [32 x i64]]* @A, i64 0, i64 %polly.indvar11.i, i64 %polly.indvar23.i, !dbg !97
  %_p_scalar_30.i = load i64, i64* %scevgep29.i, align 16, !dbg !97, !alias.scope !101, !noalias !103
  %64 = shl i64 %polly.indvar23.i, 5, !dbg !97
  %scevgep32.i = getelementptr i64, i64* %scevgep31.i, i64 %64, !dbg !97
  %_p_scalar_33.i = load i64, i64* %scevgep32.i, align 8, !dbg !97, !alias.scope !102, !noalias !104
  %p_mul.i = mul nsw i64 %_p_scalar_33.i, %_p_scalar_30.i, !dbg !105
  %p_add.i = add nsw i64 %p_mul.i, %p_add36.i, !dbg !106
  %polly.indvar_next24.i = or i64 %polly.indvar23.i, 1, !dbg !97
  %scevgep29.i.1 = getelementptr [32 x [32 x i64]], [32 x [32 x i64]]* @A, i64 0, i64 %polly.indvar11.i, i64 %polly.indvar_next24.i, !dbg !97
  %_p_scalar_30.i.1 = load i64, i64* %scevgep29.i.1, align 8, !dbg !97, !alias.scope !101, !noalias !103
  %65 = shl i64 %polly.indvar_next24.i, 5, !dbg !97
  %scevgep32.i.1 = getelementptr i64, i64* %scevgep31.i, i64 %65, !dbg !97
  %_p_scalar_33.i.1 = load i64, i64* %scevgep32.i.1, align 8, !dbg !97, !alias.scope !102, !noalias !104
  %p_mul.i.1 = mul nsw i64 %_p_scalar_33.i.1, %_p_scalar_30.i.1, !dbg !105
  %p_add.i.1 = add nsw i64 %p_mul.i.1, %p_add.i, !dbg !106
  %polly.indvar_next24.i.1 = add nsw i64 %polly.indvar23.i, 2, !dbg !97
  %exitcond.i1.1 = icmp eq i64 %polly.indvar_next24.i.1, 32, !dbg !97
  br i1 %exitcond.i1.1, label %polly.loop_exit22.i, label %polly.stmt.for.body8.i, !dbg !97

polly.loop_preheader21.i:                         ; preds = %polly.loop_preheader15.i, %polly.loop_exit22.i
  %polly.indvar17.i = phi i64 [ 0, %polly.loop_preheader15.i ], [ %polly.indvar_next18.i, %polly.loop_exit22.i ], !dbg !97
  %scevgep27.i = getelementptr [32 x [32 x i64]], [32 x [32 x i64]]* @C, i64 0, i64 %polly.indvar11.i, i64 %polly.indvar17.i, !dbg !97
  %scevgep31.i = getelementptr [32 x [32 x i64]], [32 x [32 x i64]]* @B, i64 0, i64 0, i64 %polly.indvar17.i, !dbg !97
  %scevgep27.promoted.i = load i64, i64* %scevgep27.i, align 8, !dbg !97, !alias.scope !98, !noalias !100
  br label %polly.stmt.for.body8.i, !dbg !97

mat_mult.exit:                                    ; preds = %polly.loop_exit16.i
  %inc = add nuw nsw i32 %r.01, 1, !dbg !107
  tail call void @llvm.dbg.value(metadata i32 %inc, i64 0, metadata !80, metadata !26), !dbg !79
  %exitcond = icmp eq i32 %inc, 10000, !dbg !81
  br i1 %exitcond, label %for.end, label %for.body, !dbg !81

for.end:                                          ; preds = %mat_mult.exit
  %66 = load i64, i64* getelementptr inbounds ([32 x [32 x i64]], [32 x [32 x i64]]* @C, i64 0, i64 31, i64 31), align 8, !dbg !109
  %call = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([49 x i8], [49 x i8]* @.str.2, i64 0, i64 0), i32 32, i32 32, i64 %66) #4, !dbg !110
  ret i32 0, !dbg !111
}

; Function Attrs: nounwind
declare i32 @printf(i8* nocapture readonly, ...) #2

; Function Attrs: nounwind readnone
declare void @llvm.dbg.value(metadata, i64, metadata, metadata) #3

; Function Attrs: nounwind
declare i32 @fputc(i32, %struct._IO_FILE* nocapture) #4

; Function Attrs: argmemonly nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture, i8, i64, i32, i1) #5

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "polly-optimized" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind readnone }
attributes #4 = { nounwind }
attributes #5 = { argmemonly nounwind }

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
!14 = !DIGlobalVariable(name: "A", scope: !0, file: !1, line: 3, type: !15, isLocal: false, isDefinition: true, variable: [32 x [32 x i64]]* @A)
!15 = !DICompositeType(tag: DW_TAG_array_type, baseType: !16, size: 65536, align: 64, elements: !17)
!16 = !DIBasicType(name: "long long int", size: 64, align: 64, encoding: DW_ATE_signed)
!17 = !{!18, !18}
!18 = !DISubrange(count: 32)
!19 = !DIGlobalVariable(name: "B", scope: !0, file: !1, line: 4, type: !15, isLocal: false, isDefinition: true, variable: [32 x [32 x i64]]* @B)
!20 = !DIGlobalVariable(name: "C", scope: !0, file: !1, line: 5, type: !15, isLocal: false, isDefinition: true, variable: [32 x [32 x i64]]* @C)
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
!41 = !DILocation(line: 17, column: 1, scope: !4)
!42 = !DILocation(line: 20, column: 9, scope: !7)
!43 = !DILocalVariable(name: "i", scope: !7, file: !1, line: 20, type: !12)
!44 = !DILocation(line: 29, column: 1, scope: !7)
!45 = distinct !{!45, !46, !"polly.alias.scope.C"}
!46 = distinct !{!46, !"polly.alias.scope.domain"}
!47 = !{!48, !49}
!48 = distinct !{!48, !46, !"polly.alias.scope.A"}
!49 = distinct !{!49, !46, !"polly.alias.scope.B"}
!50 = !{!49, !45}
!51 = !{!48, !45}
!52 = !DILocation(line: 25, column: 45, scope: !53)
!53 = distinct !DILexicalBlock(scope: !54, file: !1, line: 24, column: 13)
!54 = distinct !DILexicalBlock(scope: !55, file: !1, line: 24, column: 13)
!55 = distinct !DILexicalBlock(scope: !56, file: !1, line: 22, column: 29)
!56 = distinct !DILexicalBlock(scope: !57, file: !1, line: 22, column: 9)
!57 = distinct !DILexicalBlock(scope: !58, file: !1, line: 22, column: 9)
!58 = distinct !DILexicalBlock(scope: !59, file: !1, line: 21, column: 25)
!59 = distinct !DILexicalBlock(scope: !60, file: !1, line: 21, column: 5)
!60 = distinct !DILexicalBlock(scope: !7, file: !1, line: 21, column: 5)
!61 = !DILocation(line: 25, column: 35, scope: !53)
!62 = !DILocation(line: 33, column: 9, scope: !8)
!63 = !DILocalVariable(name: "i", scope: !8, file: !1, line: 33, type: !12)
!64 = !DILocation(line: 35, column: 5, scope: !65)
!65 = !DILexicalBlockFile(scope: !66, file: !1, discriminator: 1)
!66 = distinct !DILexicalBlock(scope: !67, file: !1, line: 35, column: 5)
!67 = distinct !DILexicalBlock(scope: !8, file: !1, line: 35, column: 5)
!68 = !DILocation(line: 37, column: 21, scope: !69)
!69 = distinct !DILexicalBlock(scope: !70, file: !1, line: 36, column: 29)
!70 = distinct !DILexicalBlock(scope: !71, file: !1, line: 36, column: 9)
!71 = distinct !DILexicalBlock(scope: !72, file: !1, line: 36, column: 9)
!72 = distinct !DILexicalBlock(scope: !66, file: !1, line: 35, column: 25)
!73 = !DILocation(line: 36, column: 9, scope: !74)
!74 = !DILexicalBlockFile(scope: !70, file: !1, discriminator: 1)
!75 = !DILocation(line: 37, column: 38, scope: !69)
!76 = !DILocation(line: 37, column: 13, scope: !69)
!77 = !DILocation(line: 40, column: 9, scope: !72)
!78 = !DILocation(line: 42, column: 1, scope: !8)
!79 = !DILocation(line: 49, column: 9, scope: !9)
!80 = !DILocalVariable(name: "r", scope: !9, file: !1, line: 49, type: !12)
!81 = !DILocation(line: 50, column: 5, scope: !82)
!82 = !DILexicalBlockFile(scope: !83, file: !1, discriminator: 1)
!83 = distinct !DILexicalBlock(scope: !84, file: !1, line: 50, column: 5)
!84 = distinct !DILexicalBlock(scope: !9, file: !1, line: 50, column: 5)
!85 = !DILocation(line: 9, column: 9, scope: !4, inlinedAt: !86)
!86 = distinct !DILocation(line: 51, column: 9, scope: !87)
!87 = distinct !DILexicalBlock(scope: !83, file: !1, line: 50, column: 25)
!88 = !DILocation(line: 11, column: 5, scope: !28, inlinedAt: !86)
!89 = !DILocation(line: 51, column: 9, scope: !87)
!90 = !DILocation(line: 12, column: 9, scope: !32, inlinedAt: !86)
!91 = !DILocation(line: 13, column: 13, scope: !37, inlinedAt: !86)
!92 = !DILocation(line: 13, column: 21, scope: !37, inlinedAt: !86)
!93 = !DILocation(line: 14, column: 13, scope: !37, inlinedAt: !86)
!94 = !DILocation(line: 14, column: 21, scope: !37, inlinedAt: !86)
!95 = !DILocation(line: 20, column: 9, scope: !7, inlinedAt: !96)
!96 = distinct !DILocation(line: 52, column: 9, scope: !87)
!97 = !DILocation(line: 52, column: 9, scope: !87)
!98 = distinct !{!98, !99, !"polly.alias.scope.C"}
!99 = distinct !{!99, !"polly.alias.scope.domain"}
!100 = !{!101, !102}
!101 = distinct !{!101, !99, !"polly.alias.scope.A"}
!102 = distinct !{!102, !99, !"polly.alias.scope.B"}
!103 = !{!102, !98}
!104 = !{!101, !98}
!105 = !DILocation(line: 25, column: 45, scope: !53, inlinedAt: !96)
!106 = !DILocation(line: 25, column: 35, scope: !53, inlinedAt: !96)
!107 = !DILocation(line: 50, column: 22, scope: !108)
!108 = !DILexicalBlockFile(scope: !83, file: !1, discriminator: 2)
!109 = !DILocation(line: 55, column: 71, scope: !9)
!110 = !DILocation(line: 55, column: 5, scope: !9)
!111 = !DILocation(line: 56, column: 5, scope: !9)
