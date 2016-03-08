; ModuleID = 'MatrixAdd.none.ll'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@A = common global [1024 x [1024 x i64]] zeroinitializer, align 16
@B = common global [1024 x [1024 x i64]] zeroinitializer, align 16
@C = common global [1024 x [1024 x i64]] zeroinitializer, align 16
@stdout = external global %struct._IO_FILE*, align 8
@.str = private unnamed_addr constant [6 x i8] c"%lld \00", align 1
@.str.2 = private unnamed_addr constant [51 x i8] c"Pass %d X %d matrix test case (C[%d][%d] =%lld) \0A \00", align 1

; Function Attrs: nounwind uwtable
define void @init_array() #0 !dbg !4 {
entry:
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !24, metadata !25), !dbg !26
  br label %vector.ph, !dbg !27

vector.ph:                                        ; preds = %for.inc10, %entry
  %indvars.iv3 = phi i64 [ 0, %entry ], [ %indvars.iv.next4, %for.inc10 ]
  br label %vector.body, !dbg !31

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next.1, %vector.body ], !dbg !31
  %0 = getelementptr inbounds [1024 x [1024 x i64]], [1024 x [1024 x i64]]* @A, i64 0, i64 %indvars.iv3, i64 %index, !dbg !36
  %1 = bitcast i64* %0 to <2 x i64>*, !dbg !38
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %1, align 16, !dbg !38
  %2 = getelementptr i64, i64* %0, i64 2, !dbg !38
  %3 = bitcast i64* %2 to <2 x i64>*, !dbg !38
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %3, align 16, !dbg !38
  %4 = getelementptr inbounds [1024 x [1024 x i64]], [1024 x [1024 x i64]]* @B, i64 0, i64 %indvars.iv3, i64 %index, !dbg !39
  %5 = bitcast i64* %4 to <2 x i64>*, !dbg !40
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %5, align 16, !dbg !40
  %6 = getelementptr i64, i64* %4, i64 2, !dbg !40
  %7 = bitcast i64* %6 to <2 x i64>*, !dbg !40
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %7, align 16, !dbg !40
  %index.next = or i64 %index, 4, !dbg !31
  %8 = getelementptr inbounds [1024 x [1024 x i64]], [1024 x [1024 x i64]]* @A, i64 0, i64 %indvars.iv3, i64 %index.next, !dbg !36
  %9 = bitcast i64* %8 to <2 x i64>*, !dbg !38
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %9, align 16, !dbg !38
  %10 = getelementptr i64, i64* %8, i64 2, !dbg !38
  %11 = bitcast i64* %10 to <2 x i64>*, !dbg !38
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %11, align 16, !dbg !38
  %12 = getelementptr inbounds [1024 x [1024 x i64]], [1024 x [1024 x i64]]* @B, i64 0, i64 %indvars.iv3, i64 %index.next, !dbg !39
  %13 = bitcast i64* %12 to <2 x i64>*, !dbg !40
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %13, align 16, !dbg !40
  %14 = getelementptr i64, i64* %12, i64 2, !dbg !40
  %15 = bitcast i64* %14 to <2 x i64>*, !dbg !40
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %15, align 16, !dbg !40
  %index.next.1 = add nsw i64 %index, 8, !dbg !31
  %16 = icmp eq i64 %index.next.1, 1024, !dbg !31
  br i1 %16, label %for.inc10, label %vector.body, !dbg !31, !llvm.loop !41

for.inc10:                                        ; preds = %vector.body
  %indvars.iv.next4 = add nuw nsw i64 %indvars.iv3, 1, !dbg !27
  %exitcond5 = icmp eq i64 %indvars.iv.next4, 1024, !dbg !27
  br i1 %exitcond5, label %for.end12, label %vector.ph, !dbg !27

for.end12:                                        ; preds = %for.inc10
  ret void, !dbg !44
}

; Function Attrs: nounwind uwtable
define void @mat_add() #0 !dbg !7 {
entry:
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !45, metadata !25), !dbg !46
  br label %vector.ph, !dbg !47

vector.ph:                                        ; preds = %for.inc14, %entry
  %indvars.iv3 = phi i64 [ 0, %entry ], [ %indvars.iv.next4, %for.inc14 ]
  br label %vector.body, !dbg !51

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next.1, %vector.body ], !dbg !51
  %0 = getelementptr inbounds [1024 x [1024 x i64]], [1024 x [1024 x i64]]* @A, i64 0, i64 %indvars.iv3, i64 %index, !dbg !56
  %1 = bitcast i64* %0 to <2 x i64>*, !dbg !56
  %wide.load = load <2 x i64>, <2 x i64>* %1, align 16, !dbg !56
  %2 = getelementptr i64, i64* %0, i64 2, !dbg !56
  %3 = bitcast i64* %2 to <2 x i64>*, !dbg !56
  %wide.load2 = load <2 x i64>, <2 x i64>* %3, align 16, !dbg !56
  %4 = getelementptr inbounds [1024 x [1024 x i64]], [1024 x [1024 x i64]]* @B, i64 0, i64 %indvars.iv3, i64 %index, !dbg !58
  %5 = bitcast i64* %4 to <2 x i64>*, !dbg !58
  %wide.load3 = load <2 x i64>, <2 x i64>* %5, align 16, !dbg !58
  %6 = getelementptr i64, i64* %4, i64 2, !dbg !58
  %7 = bitcast i64* %6 to <2 x i64>*, !dbg !58
  %wide.load4 = load <2 x i64>, <2 x i64>* %7, align 16, !dbg !58
  %8 = add nsw <2 x i64> %wide.load3, %wide.load, !dbg !59
  %9 = add nsw <2 x i64> %wide.load4, %wide.load2, !dbg !59
  %10 = getelementptr inbounds [1024 x [1024 x i64]], [1024 x [1024 x i64]]* @C, i64 0, i64 %indvars.iv3, i64 %index, !dbg !60
  %11 = bitcast i64* %10 to <2 x i64>*, !dbg !61
  store <2 x i64> %8, <2 x i64>* %11, align 16, !dbg !61
  %12 = getelementptr i64, i64* %10, i64 2, !dbg !61
  %13 = bitcast i64* %12 to <2 x i64>*, !dbg !61
  store <2 x i64> %9, <2 x i64>* %13, align 16, !dbg !61
  %index.next = or i64 %index, 4, !dbg !51
  %14 = getelementptr inbounds [1024 x [1024 x i64]], [1024 x [1024 x i64]]* @A, i64 0, i64 %indvars.iv3, i64 %index.next, !dbg !56
  %15 = bitcast i64* %14 to <2 x i64>*, !dbg !56
  %wide.load.1 = load <2 x i64>, <2 x i64>* %15, align 16, !dbg !56
  %16 = getelementptr i64, i64* %14, i64 2, !dbg !56
  %17 = bitcast i64* %16 to <2 x i64>*, !dbg !56
  %wide.load2.1 = load <2 x i64>, <2 x i64>* %17, align 16, !dbg !56
  %18 = getelementptr inbounds [1024 x [1024 x i64]], [1024 x [1024 x i64]]* @B, i64 0, i64 %indvars.iv3, i64 %index.next, !dbg !58
  %19 = bitcast i64* %18 to <2 x i64>*, !dbg !58
  %wide.load3.1 = load <2 x i64>, <2 x i64>* %19, align 16, !dbg !58
  %20 = getelementptr i64, i64* %18, i64 2, !dbg !58
  %21 = bitcast i64* %20 to <2 x i64>*, !dbg !58
  %wide.load4.1 = load <2 x i64>, <2 x i64>* %21, align 16, !dbg !58
  %22 = add nsw <2 x i64> %wide.load3.1, %wide.load.1, !dbg !59
  %23 = add nsw <2 x i64> %wide.load4.1, %wide.load2.1, !dbg !59
  %24 = getelementptr inbounds [1024 x [1024 x i64]], [1024 x [1024 x i64]]* @C, i64 0, i64 %indvars.iv3, i64 %index.next, !dbg !60
  %25 = bitcast i64* %24 to <2 x i64>*, !dbg !61
  store <2 x i64> %22, <2 x i64>* %25, align 16, !dbg !61
  %26 = getelementptr i64, i64* %24, i64 2, !dbg !61
  %27 = bitcast i64* %26 to <2 x i64>*, !dbg !61
  store <2 x i64> %23, <2 x i64>* %27, align 16, !dbg !61
  %index.next.1 = add nsw i64 %index, 8, !dbg !51
  %28 = icmp eq i64 %index.next.1, 1024, !dbg !51
  br i1 %28, label %for.inc14, label %vector.body, !dbg !51, !llvm.loop !62

for.inc14:                                        ; preds = %vector.body
  %indvars.iv.next4 = add nuw nsw i64 %indvars.iv3, 1, !dbg !47
  %exitcond5 = icmp eq i64 %indvars.iv.next4, 1024, !dbg !47
  br i1 %exitcond5, label %for.end16, label %vector.ph, !dbg !47

for.end16:                                        ; preds = %for.inc14
  ret void, !dbg !63
}

; Function Attrs: nounwind uwtable
define void @print_array() #0 !dbg !8 {
entry:
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !64, metadata !25), !dbg !65
  br label %for.cond1.preheader, !dbg !66

for.cond1.preheader:                              ; preds = %for.end, %entry
  %indvars.iv6 = phi i64 [ 0, %entry ], [ %indvars.iv.next7, %for.end ]
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 8, !dbg !70
  br label %for.body3, !dbg !75

for.body3:                                        ; preds = %for.inc, %for.cond1.preheader
  %indvars.iv = phi i64 [ 0, %for.cond1.preheader ], [ %indvars.iv.next, %for.inc ]
  %1 = phi %struct._IO_FILE* [ %0, %for.cond1.preheader ], [ %5, %for.inc ]
  %arrayidx5 = getelementptr inbounds [1024 x [1024 x i64]], [1024 x [1024 x i64]]* @C, i64 0, i64 %indvars.iv6, i64 %indvars.iv, !dbg !77
  %2 = load i64, i64* %arrayidx5, align 8, !dbg !77
  %call = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %1, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str, i64 0, i64 0), i64 %2) #3, !dbg !78
  %3 = trunc i64 %indvars.iv to i32, !dbg !79
  %rem = srem i32 %3, 80, !dbg !79
  %cmp6 = icmp eq i32 %rem, 79, !dbg !81
  br i1 %cmp6, label %if.then, label %for.inc, !dbg !82

if.then:                                          ; preds = %for.body3
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 8, !dbg !83
  %fputc3 = tail call i32 @fputc(i32 10, %struct._IO_FILE* %4), !dbg !85
  br label %for.inc, !dbg !85

for.inc:                                          ; preds = %if.then, %for.body3
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1, !dbg !75
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 8, !dbg !70
  %exitcond = icmp eq i64 %indvars.iv.next, 1024, !dbg !75
  br i1 %exitcond, label %for.end, label %for.body3, !dbg !75

for.end:                                          ; preds = %for.inc
  %.lcssa = phi %struct._IO_FILE* [ %5, %for.inc ]
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %.lcssa), !dbg !86
  %indvars.iv.next7 = add nuw nsw i64 %indvars.iv6, 1, !dbg !66
  %exitcond8 = icmp eq i64 %indvars.iv.next7, 1024, !dbg !66
  br i1 %exitcond8, label %for.end11, label %for.cond1.preheader, !dbg !66

for.end11:                                        ; preds = %for.end
  ret void, !dbg !87
}

; Function Attrs: nounwind
declare i32 @fprintf(%struct._IO_FILE* nocapture, i8* nocapture readonly, ...) #1

; Function Attrs: nounwind uwtable
define i32 @main() #0 !dbg !9 {
entry:
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !88, metadata !25), !dbg !89
  br label %for.body, !dbg !90

for.body:                                         ; preds = %mat_add.exit, %entry
  %r.01 = phi i32 [ 0, %entry ], [ %inc, %mat_add.exit ]
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !24, metadata !25), !dbg !94
  br label %vector.ph19, !dbg !97

vector.ph19:                                      ; preds = %for.inc10.i, %for.body
  %indvars.iv3.i = phi i64 [ 0, %for.body ], [ %indvars.iv.next4.i, %for.inc10.i ], !dbg !98
  br label %vector.body15, !dbg !99

vector.body15:                                    ; preds = %vector.body15, %vector.ph19
  %index20 = phi i64 [ 0, %vector.ph19 ], [ %index.next21.1, %vector.body15 ], !dbg !98
  %0 = getelementptr inbounds [1024 x [1024 x i64]], [1024 x [1024 x i64]]* @A, i64 0, i64 %indvars.iv3.i, i64 %index20, !dbg !100
  %1 = bitcast i64* %0 to <2 x i64>*, !dbg !101
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %1, align 16, !dbg !101
  %2 = getelementptr i64, i64* %0, i64 2, !dbg !101
  %3 = bitcast i64* %2 to <2 x i64>*, !dbg !101
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %3, align 16, !dbg !101
  %4 = getelementptr inbounds [1024 x [1024 x i64]], [1024 x [1024 x i64]]* @B, i64 0, i64 %indvars.iv3.i, i64 %index20, !dbg !102
  %5 = bitcast i64* %4 to <2 x i64>*, !dbg !103
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %5, align 16, !dbg !103
  %6 = getelementptr i64, i64* %4, i64 2, !dbg !103
  %7 = bitcast i64* %6 to <2 x i64>*, !dbg !103
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %7, align 16, !dbg !103
  %index.next21 = or i64 %index20, 4, !dbg !99
  %8 = getelementptr inbounds [1024 x [1024 x i64]], [1024 x [1024 x i64]]* @A, i64 0, i64 %indvars.iv3.i, i64 %index.next21, !dbg !100
  %9 = bitcast i64* %8 to <2 x i64>*, !dbg !101
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %9, align 16, !dbg !101
  %10 = getelementptr i64, i64* %8, i64 2, !dbg !101
  %11 = bitcast i64* %10 to <2 x i64>*, !dbg !101
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %11, align 16, !dbg !101
  %12 = getelementptr inbounds [1024 x [1024 x i64]], [1024 x [1024 x i64]]* @B, i64 0, i64 %indvars.iv3.i, i64 %index.next21, !dbg !102
  %13 = bitcast i64* %12 to <2 x i64>*, !dbg !103
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %13, align 16, !dbg !103
  %14 = getelementptr i64, i64* %12, i64 2, !dbg !103
  %15 = bitcast i64* %14 to <2 x i64>*, !dbg !103
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %15, align 16, !dbg !103
  %index.next21.1 = add nsw i64 %index20, 8, !dbg !99
  %16 = icmp eq i64 %index.next21.1, 1024, !dbg !99
  br i1 %16, label %for.inc10.i, label %vector.body15, !dbg !99, !llvm.loop !104

for.inc10.i:                                      ; preds = %vector.body15
  %indvars.iv.next4.i = add nuw nsw i64 %indvars.iv3.i, 1, !dbg !97
  %exitcond5.i = icmp eq i64 %indvars.iv.next4.i, 1024, !dbg !97
  br i1 %exitcond5.i, label %vector.ph.preheader, label %vector.ph19, !dbg !97

vector.ph.preheader:                              ; preds = %for.inc10.i
  br label %vector.ph, !dbg !105

vector.ph:                                        ; preds = %for.inc14.i, %vector.ph.preheader
  %indvars.iv3.i1 = phi i64 [ %indvars.iv.next4.i9, %for.inc14.i ], [ 0, %vector.ph.preheader ], !dbg !107
  br label %vector.body, !dbg !105

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next.1, %vector.body ], !dbg !107
  %17 = getelementptr inbounds [1024 x [1024 x i64]], [1024 x [1024 x i64]]* @A, i64 0, i64 %indvars.iv3.i1, i64 %index, !dbg !108
  %18 = bitcast i64* %17 to <2 x i64>*, !dbg !108
  %wide.load = load <2 x i64>, <2 x i64>* %18, align 16, !dbg !108
  %19 = getelementptr i64, i64* %17, i64 2, !dbg !108
  %20 = bitcast i64* %19 to <2 x i64>*, !dbg !108
  %wide.load12 = load <2 x i64>, <2 x i64>* %20, align 16, !dbg !108
  %21 = getelementptr inbounds [1024 x [1024 x i64]], [1024 x [1024 x i64]]* @B, i64 0, i64 %indvars.iv3.i1, i64 %index, !dbg !109
  %22 = bitcast i64* %21 to <2 x i64>*, !dbg !109
  %wide.load13 = load <2 x i64>, <2 x i64>* %22, align 16, !dbg !109
  %23 = getelementptr i64, i64* %21, i64 2, !dbg !109
  %24 = bitcast i64* %23 to <2 x i64>*, !dbg !109
  %wide.load14 = load <2 x i64>, <2 x i64>* %24, align 16, !dbg !109
  %25 = add nsw <2 x i64> %wide.load13, %wide.load, !dbg !110
  %26 = add nsw <2 x i64> %wide.load14, %wide.load12, !dbg !110
  %27 = getelementptr inbounds [1024 x [1024 x i64]], [1024 x [1024 x i64]]* @C, i64 0, i64 %indvars.iv3.i1, i64 %index, !dbg !111
  %28 = bitcast i64* %27 to <2 x i64>*, !dbg !112
  store <2 x i64> %25, <2 x i64>* %28, align 16, !dbg !112
  %29 = getelementptr i64, i64* %27, i64 2, !dbg !112
  %30 = bitcast i64* %29 to <2 x i64>*, !dbg !112
  store <2 x i64> %26, <2 x i64>* %30, align 16, !dbg !112
  %index.next = or i64 %index, 4, !dbg !105
  %31 = getelementptr inbounds [1024 x [1024 x i64]], [1024 x [1024 x i64]]* @A, i64 0, i64 %indvars.iv3.i1, i64 %index.next, !dbg !108
  %32 = bitcast i64* %31 to <2 x i64>*, !dbg !108
  %wide.load.1 = load <2 x i64>, <2 x i64>* %32, align 16, !dbg !108
  %33 = getelementptr i64, i64* %31, i64 2, !dbg !108
  %34 = bitcast i64* %33 to <2 x i64>*, !dbg !108
  %wide.load12.1 = load <2 x i64>, <2 x i64>* %34, align 16, !dbg !108
  %35 = getelementptr inbounds [1024 x [1024 x i64]], [1024 x [1024 x i64]]* @B, i64 0, i64 %indvars.iv3.i1, i64 %index.next, !dbg !109
  %36 = bitcast i64* %35 to <2 x i64>*, !dbg !109
  %wide.load13.1 = load <2 x i64>, <2 x i64>* %36, align 16, !dbg !109
  %37 = getelementptr i64, i64* %35, i64 2, !dbg !109
  %38 = bitcast i64* %37 to <2 x i64>*, !dbg !109
  %wide.load14.1 = load <2 x i64>, <2 x i64>* %38, align 16, !dbg !109
  %39 = add nsw <2 x i64> %wide.load13.1, %wide.load.1, !dbg !110
  %40 = add nsw <2 x i64> %wide.load14.1, %wide.load12.1, !dbg !110
  %41 = getelementptr inbounds [1024 x [1024 x i64]], [1024 x [1024 x i64]]* @C, i64 0, i64 %indvars.iv3.i1, i64 %index.next, !dbg !111
  %42 = bitcast i64* %41 to <2 x i64>*, !dbg !112
  store <2 x i64> %39, <2 x i64>* %42, align 16, !dbg !112
  %43 = getelementptr i64, i64* %41, i64 2, !dbg !112
  %44 = bitcast i64* %43 to <2 x i64>*, !dbg !112
  store <2 x i64> %40, <2 x i64>* %44, align 16, !dbg !112
  %index.next.1 = add nsw i64 %index, 8, !dbg !105
  %45 = icmp eq i64 %index.next.1, 1024, !dbg !105
  br i1 %45, label %for.inc14.i, label %vector.body, !dbg !105, !llvm.loop !113

for.inc14.i:                                      ; preds = %vector.body
  %indvars.iv.next4.i9 = add nuw nsw i64 %indvars.iv3.i1, 1, !dbg !114
  %exitcond5.i10 = icmp eq i64 %indvars.iv.next4.i9, 1024, !dbg !114
  br i1 %exitcond5.i10, label %mat_add.exit, label %vector.ph, !dbg !114

mat_add.exit:                                     ; preds = %for.inc14.i
  %inc = add nuw nsw i32 %r.01, 1, !dbg !115
  tail call void @llvm.dbg.value(metadata i32 %inc, i64 0, metadata !88, metadata !25), !dbg !89
  %exitcond = icmp eq i32 %inc, 100, !dbg !90
  br i1 %exitcond, label %for.end, label %for.body, !dbg !90

for.end:                                          ; preds = %mat_add.exit
  %46 = load i64, i64* getelementptr inbounds ([1024 x [1024 x i64]], [1024 x [1024 x i64]]* @C, i64 0, i64 1023, i64 1023), align 8, !dbg !117
  %call = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([51 x i8], [51 x i8]* @.str.2, i64 0, i64 0), i32 1024, i32 1024, i32 1023, i32 1023, i64 %46) #3, !dbg !118
  ret i32 0, !dbg !119
}

; Function Attrs: nounwind
declare i32 @printf(i8* nocapture readonly, ...) #1

; Function Attrs: nounwind readnone
declare void @llvm.dbg.value(metadata, i64, metadata, metadata) #2

; Function Attrs: nounwind
declare i32 @fputc(i32, %struct._IO_FILE* nocapture) #3

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind readnone }
attributes #3 = { nounwind }

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
!14 = !DIGlobalVariable(name: "A", scope: !0, file: !1, line: 3, type: !15, isLocal: false, isDefinition: true, variable: [1024 x [1024 x i64]]* @A)
!15 = !DICompositeType(tag: DW_TAG_array_type, baseType: !16, size: 67108864, align: 64, elements: !17)
!16 = !DIBasicType(name: "long long int", size: 64, align: 64, encoding: DW_ATE_signed)
!17 = !{!18, !18}
!18 = !DISubrange(count: 1024)
!19 = !DIGlobalVariable(name: "B", scope: !0, file: !1, line: 4, type: !15, isLocal: false, isDefinition: true, variable: [1024 x [1024 x i64]]* @B)
!20 = !DIGlobalVariable(name: "C", scope: !0, file: !1, line: 5, type: !15, isLocal: false, isDefinition: true, variable: [1024 x [1024 x i64]]* @C)
!21 = !{i32 2, !"Dwarf Version", i32 4}
!22 = !{i32 2, !"Debug Info Version", i32 3}
!23 = !{!"clang version 3.9.0 (http://llvm.org/git/clang.git e177b4a63ca92c5fec010986944530688e104074) (http://llvm.org/git/llvm.git fcd97ccb03712372fe95f1732638de5ed3fcabe8)"}
!24 = !DILocalVariable(name: "i", scope: !4, file: !1, line: 9, type: !12)
!25 = !DIExpression()
!26 = !DILocation(line: 9, column: 9, scope: !4)
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
!45 = !DILocalVariable(name: "i", scope: !7, file: !1, line: 20, type: !12)
!46 = !DILocation(line: 20, column: 9, scope: !7)
!47 = !DILocation(line: 21, column: 5, scope: !48)
!48 = !DILexicalBlockFile(scope: !49, file: !1, discriminator: 1)
!49 = distinct !DILexicalBlock(scope: !50, file: !1, line: 21, column: 5)
!50 = distinct !DILexicalBlock(scope: !7, file: !1, line: 21, column: 5)
!51 = !DILocation(line: 22, column: 9, scope: !52)
!52 = !DILexicalBlockFile(scope: !53, file: !1, discriminator: 1)
!53 = distinct !DILexicalBlock(scope: !54, file: !1, line: 22, column: 9)
!54 = distinct !DILexicalBlock(scope: !55, file: !1, line: 22, column: 9)
!55 = distinct !DILexicalBlock(scope: !49, file: !1, line: 21, column: 25)
!56 = !DILocation(line: 23, column: 23, scope: !57)
!57 = distinct !DILexicalBlock(scope: !53, file: !1, line: 22, column: 29)
!58 = !DILocation(line: 23, column: 33, scope: !57)
!59 = !DILocation(line: 23, column: 31, scope: !57)
!60 = !DILocation(line: 23, column: 13, scope: !57)
!61 = !DILocation(line: 23, column: 21, scope: !57)
!62 = distinct !{!62, !42, !43}
!63 = !DILocation(line: 27, column: 1, scope: !7)
!64 = !DILocalVariable(name: "i", scope: !8, file: !1, line: 31, type: !12)
!65 = !DILocation(line: 31, column: 9, scope: !8)
!66 = !DILocation(line: 33, column: 5, scope: !67)
!67 = !DILexicalBlockFile(scope: !68, file: !1, discriminator: 1)
!68 = distinct !DILexicalBlock(scope: !69, file: !1, line: 33, column: 5)
!69 = distinct !DILexicalBlock(scope: !8, file: !1, line: 33, column: 5)
!70 = !DILocation(line: 35, column: 21, scope: !71)
!71 = distinct !DILexicalBlock(scope: !72, file: !1, line: 34, column: 29)
!72 = distinct !DILexicalBlock(scope: !73, file: !1, line: 34, column: 9)
!73 = distinct !DILexicalBlock(scope: !74, file: !1, line: 34, column: 9)
!74 = distinct !DILexicalBlock(scope: !68, file: !1, line: 33, column: 25)
!75 = !DILocation(line: 34, column: 9, scope: !76)
!76 = !DILexicalBlockFile(scope: !72, file: !1, discriminator: 1)
!77 = !DILocation(line: 35, column: 38, scope: !71)
!78 = !DILocation(line: 35, column: 13, scope: !71)
!79 = !DILocation(line: 36, column: 18, scope: !80)
!80 = distinct !DILexicalBlock(scope: !71, file: !1, line: 36, column: 17)
!81 = !DILocation(line: 36, column: 22, scope: !80)
!82 = !DILocation(line: 36, column: 17, scope: !71)
!83 = !DILocation(line: 36, column: 37, scope: !84)
!84 = !DILexicalBlockFile(scope: !80, file: !1, discriminator: 1)
!85 = !DILocation(line: 36, column: 29, scope: !84)
!86 = !DILocation(line: 38, column: 9, scope: !74)
!87 = !DILocation(line: 40, column: 1, scope: !8)
!88 = !DILocalVariable(name: "r", scope: !9, file: !1, line: 47, type: !12)
!89 = !DILocation(line: 47, column: 9, scope: !9)
!90 = !DILocation(line: 48, column: 5, scope: !91)
!91 = !DILexicalBlockFile(scope: !92, file: !1, discriminator: 1)
!92 = distinct !DILexicalBlock(scope: !93, file: !1, line: 48, column: 5)
!93 = distinct !DILexicalBlock(scope: !9, file: !1, line: 48, column: 5)
!94 = !DILocation(line: 9, column: 9, scope: !4, inlinedAt: !95)
!95 = distinct !DILocation(line: 49, column: 9, scope: !96)
!96 = distinct !DILexicalBlock(scope: !92, file: !1, line: 48, column: 23)
!97 = !DILocation(line: 11, column: 5, scope: !28, inlinedAt: !95)
!98 = !DILocation(line: 49, column: 9, scope: !96)
!99 = !DILocation(line: 12, column: 9, scope: !32, inlinedAt: !95)
!100 = !DILocation(line: 13, column: 13, scope: !37, inlinedAt: !95)
!101 = !DILocation(line: 13, column: 21, scope: !37, inlinedAt: !95)
!102 = !DILocation(line: 14, column: 13, scope: !37, inlinedAt: !95)
!103 = !DILocation(line: 14, column: 21, scope: !37, inlinedAt: !95)
!104 = distinct !{!104, !42, !43}
!105 = !DILocation(line: 22, column: 9, scope: !52, inlinedAt: !106)
!106 = distinct !DILocation(line: 50, column: 9, scope: !96)
!107 = !DILocation(line: 50, column: 9, scope: !96)
!108 = !DILocation(line: 23, column: 23, scope: !57, inlinedAt: !106)
!109 = !DILocation(line: 23, column: 33, scope: !57, inlinedAt: !106)
!110 = !DILocation(line: 23, column: 31, scope: !57, inlinedAt: !106)
!111 = !DILocation(line: 23, column: 13, scope: !57, inlinedAt: !106)
!112 = !DILocation(line: 23, column: 21, scope: !57, inlinedAt: !106)
!113 = distinct !{!113, !42, !43}
!114 = !DILocation(line: 21, column: 5, scope: !48, inlinedAt: !106)
!115 = !DILocation(line: 48, column: 20, scope: !116)
!116 = !DILexicalBlockFile(scope: !92, file: !1, discriminator: 2)
!117 = !DILocation(line: 53, column: 83, scope: !9)
!118 = !DILocation(line: 53, column: 5, scope: !9)
!119 = !DILocation(line: 54, column: 5, scope: !9)
