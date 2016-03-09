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
  %.lhs.rhs.7.s2a = alloca i64
  %.lhs.rhs.6.s2a = alloca i64
  %.lhs.rhs.5.s2a = alloca i64
  %.lhs.rhs.4.s2a = alloca i64
  %.lhs.rhs.3.s2a = alloca i64
  %.lhs.rhs.2.s2a = alloca i64
  %.lhs.rhs.1.s2a = alloca i64
  %.lhs.rhs.s2a = alloca i64
  br label %entry.split, !dbg !45

entry.split:                                      ; preds = %entry
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !46, metadata !26), !dbg !45
  br label %polly.loop_preheader2

polly.merge_new_and_old:                          ; preds = %polly.exiting87, %polly.loop_exit30
  br label %polly.exiting, !dbg !47

polly.exiting:                                    ; preds = %polly.merge_new_and_old
  ret void, !dbg !47

polly.loop_exit3:                                 ; preds = %polly.loop_preheader14
  %polly.indvar_next = add nuw nsw i64 %polly.indvar, 1
  %exitcond86 = icmp eq i64 %polly.indvar_next, 16
  br i1 %exitcond86, label %polly.loop_preheader29.preheader, label %polly.loop_preheader2, !llvm.loop !48

polly.loop_preheader29.preheader:                 ; preds = %polly.loop_exit3
  br label %polly.split_new_and_old

polly.loop_preheader2:                            ; preds = %polly.loop_exit3, %entry.split
  %polly.indvar = phi i64 [ 0, %entry.split ], [ %polly.indvar_next, %polly.loop_exit3 ]
  %0 = shl i64 %polly.indvar, 5
  %1 = or i64 %0, 1
  %2 = or i64 %0, 2
  %3 = or i64 %0, 3
  %4 = or i64 %0, 4
  %5 = or i64 %0, 5
  %6 = or i64 %0, 6
  %7 = or i64 %0, 7
  %8 = or i64 %0, 8
  %9 = or i64 %0, 9
  %10 = or i64 %0, 10
  %11 = or i64 %0, 11
  %12 = or i64 %0, 12
  %13 = or i64 %0, 13
  %14 = or i64 %0, 14
  %15 = or i64 %0, 15
  %16 = or i64 %0, 16
  %17 = or i64 %0, 17
  %18 = or i64 %0, 18
  %19 = or i64 %0, 19
  %20 = or i64 %0, 20
  %21 = or i64 %0, 21
  %22 = or i64 %0, 22
  %23 = or i64 %0, 23
  %24 = or i64 %0, 24
  %25 = or i64 %0, 25
  %26 = or i64 %0, 26
  %27 = or i64 %0, 27
  %28 = or i64 %0, 28
  %29 = or i64 %0, 29
  %30 = or i64 %0, 30
  %31 = or i64 %0, 31
  br label %polly.loop_preheader8

polly.loop_preheader8:                            ; preds = %polly.loop_preheader14, %polly.loop_preheader2
  %polly.indvar4 = phi i64 [ 0, %polly.loop_preheader2 ], [ %polly.indvar_next5, %polly.loop_preheader14 ]
  %32 = shl i64 %polly.indvar4, 5
  br label %polly.loop_preheader14

polly.loop_preheader14:                           ; preds = %polly.loop_preheader8
  %scevgep82 = getelementptr [512 x [512 x i64]], [512 x [512 x i64]]* @C, i64 0, i64 %0, i64 %32
  %scevgep8283 = bitcast i64* %scevgep82 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep8283, i8 0, i64 256, i32 16, i1 false)
  %scevgep82.1 = getelementptr [512 x [512 x i64]], [512 x [512 x i64]]* @C, i64 0, i64 %1, i64 %32
  %scevgep8283.1 = bitcast i64* %scevgep82.1 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep8283.1, i8 0, i64 256, i32 16, i1 false)
  %scevgep82.2 = getelementptr [512 x [512 x i64]], [512 x [512 x i64]]* @C, i64 0, i64 %2, i64 %32
  %scevgep8283.2 = bitcast i64* %scevgep82.2 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep8283.2, i8 0, i64 256, i32 16, i1 false)
  %scevgep82.3 = getelementptr [512 x [512 x i64]], [512 x [512 x i64]]* @C, i64 0, i64 %3, i64 %32
  %scevgep8283.3 = bitcast i64* %scevgep82.3 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep8283.3, i8 0, i64 256, i32 16, i1 false)
  %scevgep82.4 = getelementptr [512 x [512 x i64]], [512 x [512 x i64]]* @C, i64 0, i64 %4, i64 %32
  %scevgep8283.4 = bitcast i64* %scevgep82.4 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep8283.4, i8 0, i64 256, i32 16, i1 false)
  %scevgep82.5 = getelementptr [512 x [512 x i64]], [512 x [512 x i64]]* @C, i64 0, i64 %5, i64 %32
  %scevgep8283.5 = bitcast i64* %scevgep82.5 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep8283.5, i8 0, i64 256, i32 16, i1 false)
  %scevgep82.6 = getelementptr [512 x [512 x i64]], [512 x [512 x i64]]* @C, i64 0, i64 %6, i64 %32
  %scevgep8283.6 = bitcast i64* %scevgep82.6 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep8283.6, i8 0, i64 256, i32 16, i1 false)
  %scevgep82.7 = getelementptr [512 x [512 x i64]], [512 x [512 x i64]]* @C, i64 0, i64 %7, i64 %32
  %scevgep8283.7 = bitcast i64* %scevgep82.7 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep8283.7, i8 0, i64 256, i32 16, i1 false)
  %scevgep82.8 = getelementptr [512 x [512 x i64]], [512 x [512 x i64]]* @C, i64 0, i64 %8, i64 %32
  %scevgep8283.8 = bitcast i64* %scevgep82.8 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep8283.8, i8 0, i64 256, i32 16, i1 false)
  %scevgep82.9 = getelementptr [512 x [512 x i64]], [512 x [512 x i64]]* @C, i64 0, i64 %9, i64 %32
  %scevgep8283.9 = bitcast i64* %scevgep82.9 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep8283.9, i8 0, i64 256, i32 16, i1 false)
  %scevgep82.10 = getelementptr [512 x [512 x i64]], [512 x [512 x i64]]* @C, i64 0, i64 %10, i64 %32
  %scevgep8283.10 = bitcast i64* %scevgep82.10 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep8283.10, i8 0, i64 256, i32 16, i1 false)
  %scevgep82.11 = getelementptr [512 x [512 x i64]], [512 x [512 x i64]]* @C, i64 0, i64 %11, i64 %32
  %scevgep8283.11 = bitcast i64* %scevgep82.11 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep8283.11, i8 0, i64 256, i32 16, i1 false)
  %scevgep82.12 = getelementptr [512 x [512 x i64]], [512 x [512 x i64]]* @C, i64 0, i64 %12, i64 %32
  %scevgep8283.12 = bitcast i64* %scevgep82.12 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep8283.12, i8 0, i64 256, i32 16, i1 false)
  %scevgep82.13 = getelementptr [512 x [512 x i64]], [512 x [512 x i64]]* @C, i64 0, i64 %13, i64 %32
  %scevgep8283.13 = bitcast i64* %scevgep82.13 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep8283.13, i8 0, i64 256, i32 16, i1 false)
  %scevgep82.14 = getelementptr [512 x [512 x i64]], [512 x [512 x i64]]* @C, i64 0, i64 %14, i64 %32
  %scevgep8283.14 = bitcast i64* %scevgep82.14 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep8283.14, i8 0, i64 256, i32 16, i1 false)
  %scevgep82.15 = getelementptr [512 x [512 x i64]], [512 x [512 x i64]]* @C, i64 0, i64 %15, i64 %32
  %scevgep8283.15 = bitcast i64* %scevgep82.15 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep8283.15, i8 0, i64 256, i32 16, i1 false)
  %scevgep82.16 = getelementptr [512 x [512 x i64]], [512 x [512 x i64]]* @C, i64 0, i64 %16, i64 %32
  %scevgep8283.16 = bitcast i64* %scevgep82.16 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep8283.16, i8 0, i64 256, i32 16, i1 false)
  %scevgep82.17 = getelementptr [512 x [512 x i64]], [512 x [512 x i64]]* @C, i64 0, i64 %17, i64 %32
  %scevgep8283.17 = bitcast i64* %scevgep82.17 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep8283.17, i8 0, i64 256, i32 16, i1 false)
  %scevgep82.18 = getelementptr [512 x [512 x i64]], [512 x [512 x i64]]* @C, i64 0, i64 %18, i64 %32
  %scevgep8283.18 = bitcast i64* %scevgep82.18 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep8283.18, i8 0, i64 256, i32 16, i1 false)
  %scevgep82.19 = getelementptr [512 x [512 x i64]], [512 x [512 x i64]]* @C, i64 0, i64 %19, i64 %32
  %scevgep8283.19 = bitcast i64* %scevgep82.19 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep8283.19, i8 0, i64 256, i32 16, i1 false)
  %scevgep82.20 = getelementptr [512 x [512 x i64]], [512 x [512 x i64]]* @C, i64 0, i64 %20, i64 %32
  %scevgep8283.20 = bitcast i64* %scevgep82.20 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep8283.20, i8 0, i64 256, i32 16, i1 false)
  %scevgep82.21 = getelementptr [512 x [512 x i64]], [512 x [512 x i64]]* @C, i64 0, i64 %21, i64 %32
  %scevgep8283.21 = bitcast i64* %scevgep82.21 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep8283.21, i8 0, i64 256, i32 16, i1 false)
  %scevgep82.22 = getelementptr [512 x [512 x i64]], [512 x [512 x i64]]* @C, i64 0, i64 %22, i64 %32
  %scevgep8283.22 = bitcast i64* %scevgep82.22 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep8283.22, i8 0, i64 256, i32 16, i1 false)
  %scevgep82.23 = getelementptr [512 x [512 x i64]], [512 x [512 x i64]]* @C, i64 0, i64 %23, i64 %32
  %scevgep8283.23 = bitcast i64* %scevgep82.23 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep8283.23, i8 0, i64 256, i32 16, i1 false)
  %scevgep82.24 = getelementptr [512 x [512 x i64]], [512 x [512 x i64]]* @C, i64 0, i64 %24, i64 %32
  %scevgep8283.24 = bitcast i64* %scevgep82.24 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep8283.24, i8 0, i64 256, i32 16, i1 false)
  %scevgep82.25 = getelementptr [512 x [512 x i64]], [512 x [512 x i64]]* @C, i64 0, i64 %25, i64 %32
  %scevgep8283.25 = bitcast i64* %scevgep82.25 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep8283.25, i8 0, i64 256, i32 16, i1 false)
  %scevgep82.26 = getelementptr [512 x [512 x i64]], [512 x [512 x i64]]* @C, i64 0, i64 %26, i64 %32
  %scevgep8283.26 = bitcast i64* %scevgep82.26 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep8283.26, i8 0, i64 256, i32 16, i1 false)
  %scevgep82.27 = getelementptr [512 x [512 x i64]], [512 x [512 x i64]]* @C, i64 0, i64 %27, i64 %32
  %scevgep8283.27 = bitcast i64* %scevgep82.27 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep8283.27, i8 0, i64 256, i32 16, i1 false)
  %scevgep82.28 = getelementptr [512 x [512 x i64]], [512 x [512 x i64]]* @C, i64 0, i64 %28, i64 %32
  %scevgep8283.28 = bitcast i64* %scevgep82.28 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep8283.28, i8 0, i64 256, i32 16, i1 false)
  %scevgep82.29 = getelementptr [512 x [512 x i64]], [512 x [512 x i64]]* @C, i64 0, i64 %29, i64 %32
  %scevgep8283.29 = bitcast i64* %scevgep82.29 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep8283.29, i8 0, i64 256, i32 16, i1 false)
  %scevgep82.30 = getelementptr [512 x [512 x i64]], [512 x [512 x i64]]* @C, i64 0, i64 %30, i64 %32
  %scevgep8283.30 = bitcast i64* %scevgep82.30 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep8283.30, i8 0, i64 256, i32 16, i1 false)
  %scevgep82.31 = getelementptr [512 x [512 x i64]], [512 x [512 x i64]]* @C, i64 0, i64 %31, i64 %32
  %scevgep8283.31 = bitcast i64* %scevgep82.31 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep8283.31, i8 0, i64 256, i32 16, i1 false)
  %polly.indvar_next5 = add nuw nsw i64 %polly.indvar4, 1
  %exitcond85 = icmp eq i64 %polly.indvar_next5, 16
  br i1 %exitcond85, label %polly.loop_exit3, label %polly.loop_preheader8

polly.loop_exit30:                                ; preds = %polly.loop_exit36
  %polly.indvar_next26 = add nuw nsw i64 %polly.indvar25, 1
  %exitcond80 = icmp eq i64 %polly.indvar_next26, 16
  br i1 %exitcond80, label %polly.merge_new_and_old, label %polly.loop_preheader29, !llvm.loop !49

polly.loop_exit36:                                ; preds = %polly.loop_exit42
  %polly.indvar_next32 = add nuw nsw i64 %polly.indvar31, 1
  %exitcond79 = icmp eq i64 %polly.indvar_next32, 16
  br i1 %exitcond79, label %polly.loop_exit30, label %polly.loop_preheader35

polly.split_new_and_old:                          ; preds = %polly.loop_preheader29.preheader
  br i1 true, label %polly.start, label %polly.loop_preheader29

polly.loop_preheader29:                           ; preds = %polly.split_new_and_old, %polly.loop_exit30
  %polly.indvar25 = phi i64 [ %polly.indvar_next26, %polly.loop_exit30 ], [ 0, %polly.split_new_and_old ]
  %33 = shl nsw i64 %polly.indvar25, 5
  br label %polly.loop_preheader35

polly.loop_exit42:                                ; preds = %polly.loop_exit48
  %polly.indvar_next38 = add nuw nsw i64 %polly.indvar37, 1
  %exitcond78 = icmp eq i64 %polly.indvar_next38, 16
  br i1 %exitcond78, label %polly.loop_exit36, label %polly.loop_preheader41

polly.loop_preheader35:                           ; preds = %polly.loop_exit36, %polly.loop_preheader29
  %polly.indvar31 = phi i64 [ 0, %polly.loop_preheader29 ], [ %polly.indvar_next32, %polly.loop_exit36 ]
  %34 = shl nsw i64 %polly.indvar31, 5
  br label %polly.loop_preheader41

polly.loop_exit48:                                ; preds = %polly.loop_preheader53
  %polly.indvar_next44 = add nuw nsw i64 %polly.indvar43, 1
  %exitcond77 = icmp eq i64 %polly.indvar_next44, 32
  br i1 %exitcond77, label %polly.loop_exit42, label %polly.loop_preheader47

polly.loop_preheader41:                           ; preds = %polly.loop_exit42, %polly.loop_preheader35
  %polly.indvar37 = phi i64 [ 0, %polly.loop_preheader35 ], [ %polly.indvar_next38, %polly.loop_exit42 ]
  %35 = shl nsw i64 %polly.indvar37, 5
  %36 = or i64 %35, 3
  %37 = or i64 %35, 4
  %38 = or i64 %35, 7
  %39 = or i64 %35, 8
  %40 = or i64 %35, 11
  %41 = or i64 %35, 12
  %42 = or i64 %35, 15
  %43 = or i64 %35, 16
  %44 = or i64 %35, 19
  %45 = or i64 %35, 20
  %46 = or i64 %35, 23
  %47 = or i64 %35, 24
  %48 = or i64 %35, 27
  %49 = or i64 %35, 28
  %50 = or i64 %35, 31
  br label %polly.loop_preheader47

polly.loop_preheader47:                           ; preds = %polly.loop_exit48, %polly.loop_preheader41
  %polly.indvar43 = phi i64 [ 0, %polly.loop_preheader41 ], [ %polly.indvar_next44, %polly.loop_exit48 ]
  %51 = add nuw nsw i64 %polly.indvar43, %33
  %scevgep59 = getelementptr [512 x [512 x i64]], [512 x [512 x i64]]* @A, i64 0, i64 %51, i64 %35
  %vector_ptr = bitcast i64* %scevgep59 to <4 x i64>*
  %_p_vec_full = load <4 x i64>, <4 x i64>* %vector_ptr, align 16, !alias.scope !50, !noalias !52, !llvm.mem.parallel_loop_access !49
  %.lhs.rhs = extractelement <4 x i64> %_p_vec_full, i32 3
  %scevgep59.1 = getelementptr [512 x [512 x i64]], [512 x [512 x i64]]* @A, i64 0, i64 %51, i64 %37
  %vector_ptr.1 = bitcast i64* %scevgep59.1 to <4 x i64>*
  %_p_vec_full.1 = load <4 x i64>, <4 x i64>* %vector_ptr.1, align 16, !alias.scope !50, !noalias !52, !llvm.mem.parallel_loop_access !49
  %.lhs.rhs.1 = extractelement <4 x i64> %_p_vec_full.1, i32 3
  %scevgep59.2 = getelementptr [512 x [512 x i64]], [512 x [512 x i64]]* @A, i64 0, i64 %51, i64 %39
  %vector_ptr.2 = bitcast i64* %scevgep59.2 to <4 x i64>*
  %_p_vec_full.2 = load <4 x i64>, <4 x i64>* %vector_ptr.2, align 16, !alias.scope !50, !noalias !52, !llvm.mem.parallel_loop_access !49
  %.lhs.rhs.2 = extractelement <4 x i64> %_p_vec_full.2, i32 3
  %scevgep59.3 = getelementptr [512 x [512 x i64]], [512 x [512 x i64]]* @A, i64 0, i64 %51, i64 %41
  %vector_ptr.3 = bitcast i64* %scevgep59.3 to <4 x i64>*
  %_p_vec_full.3 = load <4 x i64>, <4 x i64>* %vector_ptr.3, align 16, !alias.scope !50, !noalias !52, !llvm.mem.parallel_loop_access !49
  %.lhs.rhs.3 = extractelement <4 x i64> %_p_vec_full.3, i32 3
  %scevgep59.4 = getelementptr [512 x [512 x i64]], [512 x [512 x i64]]* @A, i64 0, i64 %51, i64 %43
  %vector_ptr.4 = bitcast i64* %scevgep59.4 to <4 x i64>*
  %_p_vec_full.4 = load <4 x i64>, <4 x i64>* %vector_ptr.4, align 16, !alias.scope !50, !noalias !52, !llvm.mem.parallel_loop_access !49
  %.lhs.rhs.4 = extractelement <4 x i64> %_p_vec_full.4, i32 3
  %scevgep59.5 = getelementptr [512 x [512 x i64]], [512 x [512 x i64]]* @A, i64 0, i64 %51, i64 %45
  %vector_ptr.5 = bitcast i64* %scevgep59.5 to <4 x i64>*
  %_p_vec_full.5 = load <4 x i64>, <4 x i64>* %vector_ptr.5, align 16, !alias.scope !50, !noalias !52, !llvm.mem.parallel_loop_access !49
  %.lhs.rhs.5 = extractelement <4 x i64> %_p_vec_full.5, i32 3
  %scevgep59.6 = getelementptr [512 x [512 x i64]], [512 x [512 x i64]]* @A, i64 0, i64 %51, i64 %47
  %vector_ptr.6 = bitcast i64* %scevgep59.6 to <4 x i64>*
  %_p_vec_full.6 = load <4 x i64>, <4 x i64>* %vector_ptr.6, align 16, !alias.scope !50, !noalias !52, !llvm.mem.parallel_loop_access !49
  %.lhs.rhs.6 = extractelement <4 x i64> %_p_vec_full.6, i32 3
  %scevgep59.7 = getelementptr [512 x [512 x i64]], [512 x [512 x i64]]* @A, i64 0, i64 %51, i64 %49
  %vector_ptr.7 = bitcast i64* %scevgep59.7 to <4 x i64>*
  %_p_vec_full.7 = load <4 x i64>, <4 x i64>* %vector_ptr.7, align 16, !alias.scope !50, !noalias !52, !llvm.mem.parallel_loop_access !49
  %.lhs.rhs.7 = extractelement <4 x i64> %_p_vec_full.7, i32 3
  br label %polly.loop_preheader53

polly.loop_preheader53:                           ; preds = %polly.loop_preheader53, %polly.loop_preheader47
  %polly.indvar49 = phi i64 [ 0, %polly.loop_preheader47 ], [ %polly.indvar_next50, %polly.loop_preheader53 ]
  %52 = add nuw nsw i64 %polly.indvar49, %34
  %scevgep58 = getelementptr [512 x [512 x i64]], [512 x [512 x i64]]* @C, i64 0, i64 %51, i64 %52
  %_p_vec_p = bitcast i64* %scevgep58 to <1 x i64>*
  %_p_splat_one = load <1 x i64>, <1 x i64>* %_p_vec_p, align 8, !alias.scope !54, !noalias !55, !llvm.mem.parallel_loop_access !49
  %scevgep67 = getelementptr [512 x [512 x i64]], [512 x [512 x i64]]* @B, i64 0, i64 %36, i64 %52
  %_p_scalar_68 = load i64, i64* %scevgep67, align 8, !alias.scope !53, !noalias !56, !llvm.mem.parallel_loop_access !49
  %.lhs = mul i64 %_p_scalar_68, %.lhs.rhs
  %.rhs = extractelement <1 x i64> %_p_splat_one, i32 0
  %53 = add i64 %.lhs, %.rhs
  %scevgep67.1 = getelementptr [512 x [512 x i64]], [512 x [512 x i64]]* @B, i64 0, i64 %38, i64 %52
  %_p_scalar_68.1 = load i64, i64* %scevgep67.1, align 8, !alias.scope !53, !noalias !56, !llvm.mem.parallel_loop_access !49
  %.lhs.1 = mul i64 %_p_scalar_68.1, %.lhs.rhs.1
  %54 = add i64 %.lhs.1, %53
  %scevgep67.2 = getelementptr [512 x [512 x i64]], [512 x [512 x i64]]* @B, i64 0, i64 %40, i64 %52
  %_p_scalar_68.2 = load i64, i64* %scevgep67.2, align 8, !alias.scope !53, !noalias !56, !llvm.mem.parallel_loop_access !49
  %.lhs.2 = mul i64 %_p_scalar_68.2, %.lhs.rhs.2
  %55 = add i64 %.lhs.2, %54
  %scevgep67.3 = getelementptr [512 x [512 x i64]], [512 x [512 x i64]]* @B, i64 0, i64 %42, i64 %52
  %_p_scalar_68.3 = load i64, i64* %scevgep67.3, align 8, !alias.scope !53, !noalias !56, !llvm.mem.parallel_loop_access !49
  %.lhs.3 = mul i64 %_p_scalar_68.3, %.lhs.rhs.3
  %56 = add i64 %.lhs.3, %55
  %scevgep67.4 = getelementptr [512 x [512 x i64]], [512 x [512 x i64]]* @B, i64 0, i64 %44, i64 %52
  %_p_scalar_68.4 = load i64, i64* %scevgep67.4, align 8, !alias.scope !53, !noalias !56, !llvm.mem.parallel_loop_access !49
  %.lhs.4 = mul i64 %_p_scalar_68.4, %.lhs.rhs.4
  %57 = add i64 %.lhs.4, %56
  %scevgep67.5 = getelementptr [512 x [512 x i64]], [512 x [512 x i64]]* @B, i64 0, i64 %46, i64 %52
  %_p_scalar_68.5 = load i64, i64* %scevgep67.5, align 8, !alias.scope !53, !noalias !56, !llvm.mem.parallel_loop_access !49
  %.lhs.5 = mul i64 %_p_scalar_68.5, %.lhs.rhs.5
  %58 = add i64 %.lhs.5, %57
  %scevgep67.6 = getelementptr [512 x [512 x i64]], [512 x [512 x i64]]* @B, i64 0, i64 %48, i64 %52
  %_p_scalar_68.6 = load i64, i64* %scevgep67.6, align 8, !alias.scope !53, !noalias !56, !llvm.mem.parallel_loop_access !49
  %.lhs.6 = mul i64 %_p_scalar_68.6, %.lhs.rhs.6
  %59 = add i64 %.lhs.6, %58
  %scevgep67.7 = getelementptr [512 x [512 x i64]], [512 x [512 x i64]]* @B, i64 0, i64 %50, i64 %52
  %_p_scalar_68.7 = load i64, i64* %scevgep67.7, align 8, !alias.scope !53, !noalias !56, !llvm.mem.parallel_loop_access !49
  %.lhs.7 = mul i64 %_p_scalar_68.7, %.lhs.rhs.7
  %60 = add i64 %.lhs.7, %59
  store i64 %60, i64* %scevgep58, align 8, !alias.scope !54, !noalias !55, !llvm.mem.parallel_loop_access !49
  %polly.indvar_next50 = add nuw nsw i64 %polly.indvar49, 1
  %exitcond = icmp eq i64 %polly.indvar_next50, 32
  br i1 %exitcond, label %polly.loop_exit48, label %polly.loop_preheader53

polly.start:                                      ; preds = %polly.split_new_and_old
  br label %polly.loop_preheader

polly.loop_exit:                                  ; preds = %polly.loop_exit92
  br label %polly.exiting87

polly.exiting87:                                  ; preds = %polly.loop_exit
  br label %polly.merge_new_and_old

polly.loop_header:                                ; preds = %polly.loop_exit92, %polly.loop_preheader
  %polly.indvar88 = phi i64 [ 0, %polly.loop_preheader ], [ %polly.indvar_next89, %polly.loop_exit92 ]
  br label %polly.loop_preheader91

polly.loop_exit92:                                ; preds = %polly.loop_exit98
  %polly.indvar_next89 = add nsw i64 %polly.indvar88, 1
  %polly.loop_cond = icmp sle i64 %polly.indvar88, 14
  br i1 %polly.loop_cond, label %polly.loop_header, label %polly.loop_exit

polly.loop_preheader:                             ; preds = %polly.start
  br label %polly.loop_header

polly.loop_header90:                              ; preds = %polly.loop_exit98, %polly.loop_preheader91
  %polly.indvar93 = phi i64 [ 0, %polly.loop_preheader91 ], [ %polly.indvar_next94, %polly.loop_exit98 ]
  br label %polly.loop_preheader97

polly.loop_exit98:                                ; preds = %polly.loop_exit104
  %polly.indvar_next94 = add nsw i64 %polly.indvar93, 1
  %polly.loop_cond95 = icmp sle i64 %polly.indvar93, 14
  br i1 %polly.loop_cond95, label %polly.loop_header90, label %polly.loop_exit92

polly.loop_preheader91:                           ; preds = %polly.loop_header
  %61 = shl i64 %polly.indvar88, 5
  %scevgep = getelementptr [512 x [512 x i64]], [512 x [512 x i64]]* @A, i64 0, i64 %61, i64 0
  %62 = shl i64 %polly.indvar88, 14
  %scevgep111 = getelementptr i64, i64* getelementptr inbounds ([512 x [512 x i64]], [512 x [512 x i64]]* @A, i64 0, i64 0, i64 4), i64 %62
  %scevgep115 = getelementptr i64, i64* getelementptr inbounds ([512 x [512 x i64]], [512 x [512 x i64]]* @A, i64 0, i64 0, i64 8), i64 %62
  %scevgep119 = getelementptr i64, i64* getelementptr inbounds ([512 x [512 x i64]], [512 x [512 x i64]]* @A, i64 0, i64 0, i64 12), i64 %62
  %scevgep123 = getelementptr i64, i64* getelementptr inbounds ([512 x [512 x i64]], [512 x [512 x i64]]* @A, i64 0, i64 0, i64 16), i64 %62
  %scevgep127 = getelementptr i64, i64* getelementptr inbounds ([512 x [512 x i64]], [512 x [512 x i64]]* @A, i64 0, i64 0, i64 20), i64 %62
  %scevgep131 = getelementptr i64, i64* getelementptr inbounds ([512 x [512 x i64]], [512 x [512 x i64]]* @A, i64 0, i64 0, i64 24), i64 %62
  %63 = shl i64 %polly.indvar88, 14
  %scevgep135 = getelementptr i64, i64* getelementptr inbounds ([512 x [512 x i64]], [512 x [512 x i64]]* @A, i64 0, i64 0, i64 28), i64 %63
  %64 = shl i64 %polly.indvar88, 5
  %scevgep145 = getelementptr [512 x [512 x i64]], [512 x [512 x i64]]* @C, i64 0, i64 %64, i64 0
  %scevgep181 = getelementptr [512 x [512 x i64]], [512 x [512 x i64]]* @C, i64 0, i64 %64, i64 0
  br label %polly.loop_header90

polly.loop_header96:                              ; preds = %polly.loop_exit104, %polly.loop_preheader97
  %polly.indvar99 = phi i64 [ 0, %polly.loop_preheader97 ], [ %polly.indvar_next100, %polly.loop_exit104 ]
  br label %polly.loop_preheader103

polly.loop_exit104:                               ; preds = %polly.loop_exit141
  %polly.indvar_next100 = add nsw i64 %polly.indvar99, 1
  %polly.loop_cond101 = icmp sle i64 %polly.indvar99, 14
  br i1 %polly.loop_cond101, label %polly.loop_header96, label %polly.loop_exit98

polly.loop_preheader97:                           ; preds = %polly.loop_header90
  %65 = shl i64 %polly.indvar93, 5
  %scevgep146 = getelementptr i64, i64* %scevgep145, i64 %65
  %scevgep150 = getelementptr i64, i64* getelementptr inbounds ([512 x [512 x i64]], [512 x [512 x i64]]* @B, i64 0, i64 3, i64 0), i64 %65
  %scevgep153 = getelementptr i64, i64* getelementptr inbounds ([512 x [512 x i64]], [512 x [512 x i64]]* @B, i64 0, i64 7, i64 0), i64 %65
  %scevgep157 = getelementptr i64, i64* getelementptr inbounds ([512 x [512 x i64]], [512 x [512 x i64]]* @B, i64 0, i64 11, i64 0), i64 %65
  %scevgep161 = getelementptr i64, i64* getelementptr inbounds ([512 x [512 x i64]], [512 x [512 x i64]]* @B, i64 0, i64 15, i64 0), i64 %65
  %scevgep165 = getelementptr i64, i64* getelementptr inbounds ([512 x [512 x i64]], [512 x [512 x i64]]* @B, i64 0, i64 19, i64 0), i64 %65
  %66 = shl i64 %polly.indvar93, 5
  %scevgep169 = getelementptr i64, i64* getelementptr inbounds ([512 x [512 x i64]], [512 x [512 x i64]]* @B, i64 0, i64 23, i64 0), i64 %66
  %scevgep173 = getelementptr i64, i64* getelementptr inbounds ([512 x [512 x i64]], [512 x [512 x i64]]* @B, i64 0, i64 27, i64 0), i64 %66
  %scevgep177 = getelementptr i64, i64* getelementptr inbounds ([512 x [512 x i64]], [512 x [512 x i64]]* @B, i64 0, i64 31, i64 0), i64 %66
  %scevgep182 = getelementptr i64, i64* %scevgep181, i64 %66
  br label %polly.loop_header96

polly.loop_header102:                             ; preds = %polly.loop_exit141, %polly.loop_preheader103
  %polly.indvar105 = phi i64 [ 0, %polly.loop_preheader103 ], [ %polly.indvar_next106, %polly.loop_exit141 ]
  br label %polly.stmt.polly.loop_preheader47

polly.stmt.polly.loop_preheader47:                ; preds = %polly.loop_header102
  %67 = shl i64 %polly.indvar105, 9
  %scevgep109 = getelementptr i64, i64* %scevgep108, i64 %67
  %scevgep109110 = bitcast i64* %scevgep109 to <4 x i64>*
  %_p_vec_full_p_scalar_ = load <4 x i64>, <4 x i64>* %scevgep109110, align 16, !alias.scope !57, !noalias !59
  %p_.lhs.rhs = extractelement <4 x i64> %_p_vec_full_p_scalar_, i32 3
  %scevgep113 = getelementptr i64, i64* %scevgep112, i64 %67
  %scevgep113114 = bitcast i64* %scevgep113 to <4 x i64>*
  %_p_vec_full.1_p_scalar_ = load <4 x i64>, <4 x i64>* %scevgep113114, align 16, !alias.scope !57, !noalias !59
  %p_.lhs.rhs.1 = extractelement <4 x i64> %_p_vec_full.1_p_scalar_, i32 3
  %68 = shl i64 %polly.indvar105, 9
  %scevgep117 = getelementptr i64, i64* %scevgep116, i64 %68
  %scevgep117118 = bitcast i64* %scevgep117 to <4 x i64>*
  %_p_vec_full.2_p_scalar_ = load <4 x i64>, <4 x i64>* %scevgep117118, align 16, !alias.scope !57, !noalias !59
  %p_.lhs.rhs.2 = extractelement <4 x i64> %_p_vec_full.2_p_scalar_, i32 3
  %scevgep121 = getelementptr i64, i64* %scevgep120, i64 %68
  %scevgep121122 = bitcast i64* %scevgep121 to <4 x i64>*
  %_p_vec_full.3_p_scalar_ = load <4 x i64>, <4 x i64>* %scevgep121122, align 16, !alias.scope !57, !noalias !59
  %p_.lhs.rhs.3 = extractelement <4 x i64> %_p_vec_full.3_p_scalar_, i32 3
  %69 = shl i64 %polly.indvar105, 9
  %scevgep125 = getelementptr i64, i64* %scevgep124, i64 %69
  %scevgep125126 = bitcast i64* %scevgep125 to <4 x i64>*
  %_p_vec_full.4_p_scalar_ = load <4 x i64>, <4 x i64>* %scevgep125126, align 16, !alias.scope !57, !noalias !59
  %p_.lhs.rhs.4 = extractelement <4 x i64> %_p_vec_full.4_p_scalar_, i32 3
  %scevgep129 = getelementptr i64, i64* %scevgep128, i64 %69
  %scevgep129130 = bitcast i64* %scevgep129 to <4 x i64>*
  %_p_vec_full.5_p_scalar_ = load <4 x i64>, <4 x i64>* %scevgep129130, align 16, !alias.scope !57, !noalias !59
  %p_.lhs.rhs.5 = extractelement <4 x i64> %_p_vec_full.5_p_scalar_, i32 3
  %70 = shl i64 %polly.indvar105, 9
  %scevgep133 = getelementptr i64, i64* %scevgep132, i64 %70
  %scevgep133134 = bitcast i64* %scevgep133 to <4 x i64>*
  %_p_vec_full.6_p_scalar_ = load <4 x i64>, <4 x i64>* %scevgep133134, align 16, !alias.scope !57, !noalias !59
  %p_.lhs.rhs.6 = extractelement <4 x i64> %_p_vec_full.6_p_scalar_, i32 3
  %scevgep137 = getelementptr i64, i64* %scevgep136, i64 %70
  %scevgep137138 = bitcast i64* %scevgep137 to <4 x i64>*
  %_p_vec_full.7_p_scalar_ = load <4 x i64>, <4 x i64>* %scevgep137138, align 16, !alias.scope !57, !noalias !59
  %p_.lhs.rhs.7 = extractelement <4 x i64> %_p_vec_full.7_p_scalar_, i32 3
  store i64 %p_.lhs.rhs, i64* %.lhs.rhs.s2a
  store i64 %p_.lhs.rhs.1, i64* %.lhs.rhs.1.s2a
  store i64 %p_.lhs.rhs.2, i64* %.lhs.rhs.2.s2a
  store i64 %p_.lhs.rhs.3, i64* %.lhs.rhs.3.s2a
  store i64 %p_.lhs.rhs.4, i64* %.lhs.rhs.4.s2a
  store i64 %p_.lhs.rhs.5, i64* %.lhs.rhs.5.s2a
  store i64 %p_.lhs.rhs.6, i64* %.lhs.rhs.6.s2a
  store i64 %p_.lhs.rhs.7, i64* %.lhs.rhs.7.s2a
  br label %polly.loop_preheader140

polly.loop_exit141:                               ; preds = %polly.stmt.polly.loop_preheader53
  %polly.indvar_next106 = add nsw i64 %polly.indvar105, 1
  %polly.loop_cond107 = icmp sle i64 %polly.indvar105, 30
  br i1 %polly.loop_cond107, label %polly.loop_header102, label %polly.loop_exit104

polly.loop_preheader103:                          ; preds = %polly.loop_header96
  %71 = shl i64 %polly.indvar99, 5
  %scevgep108 = getelementptr i64, i64* %scevgep, i64 %71
  %scevgep112 = getelementptr i64, i64* %scevgep111, i64 %71
  %scevgep116 = getelementptr i64, i64* %scevgep115, i64 %71
  %scevgep120 = getelementptr i64, i64* %scevgep119, i64 %71
  %scevgep124 = getelementptr i64, i64* %scevgep123, i64 %71
  %scevgep128 = getelementptr i64, i64* %scevgep127, i64 %71
  %72 = shl i64 %polly.indvar99, 5
  %scevgep132 = getelementptr i64, i64* %scevgep131, i64 %72
  %scevgep136 = getelementptr i64, i64* %scevgep135, i64 %72
  %73 = shl i64 %polly.indvar99, 14
  %scevgep151 = getelementptr i64, i64* %scevgep150, i64 %73
  %scevgep154 = getelementptr i64, i64* %scevgep153, i64 %73
  %scevgep158 = getelementptr i64, i64* %scevgep157, i64 %73
  %scevgep162 = getelementptr i64, i64* %scevgep161, i64 %73
  %scevgep166 = getelementptr i64, i64* %scevgep165, i64 %73
  %scevgep170 = getelementptr i64, i64* %scevgep169, i64 %73
  %74 = shl i64 %polly.indvar99, 14
  %scevgep174 = getelementptr i64, i64* %scevgep173, i64 %74
  %scevgep178 = getelementptr i64, i64* %scevgep177, i64 %74
  br label %polly.loop_header102

polly.loop_header139:                             ; preds = %polly.stmt.polly.loop_preheader53, %polly.loop_preheader140
  %polly.indvar142 = phi i64 [ 0, %polly.loop_preheader140 ], [ %polly.indvar_next143, %polly.stmt.polly.loop_preheader53 ]
  br label %polly.stmt.polly.loop_preheader53

polly.stmt.polly.loop_preheader53:                ; preds = %polly.loop_header139
  %.lhs.rhs.s2a.reload = load i64, i64* %.lhs.rhs.s2a, !llvm.mem.parallel_loop_access !70
  %.lhs.rhs.1.s2a.reload = load i64, i64* %.lhs.rhs.1.s2a, !llvm.mem.parallel_loop_access !70
  %.lhs.rhs.2.s2a.reload = load i64, i64* %.lhs.rhs.2.s2a, !llvm.mem.parallel_loop_access !70
  %.lhs.rhs.3.s2a.reload = load i64, i64* %.lhs.rhs.3.s2a, !llvm.mem.parallel_loop_access !70
  %.lhs.rhs.4.s2a.reload = load i64, i64* %.lhs.rhs.4.s2a, !llvm.mem.parallel_loop_access !70
  %.lhs.rhs.5.s2a.reload = load i64, i64* %.lhs.rhs.5.s2a, !llvm.mem.parallel_loop_access !70
  %.lhs.rhs.6.s2a.reload = load i64, i64* %.lhs.rhs.6.s2a, !llvm.mem.parallel_loop_access !70
  %.lhs.rhs.7.s2a.reload = load i64, i64* %.lhs.rhs.7.s2a, !llvm.mem.parallel_loop_access !70
  %scevgep148 = getelementptr i64, i64* %scevgep147, i64 %polly.indvar142
  %scevgep148149 = bitcast i64* %scevgep148 to <1 x i64>*
  %_p_splat_one_p_scalar_ = load <1 x i64>, <1 x i64>* %scevgep148149, align 8, !alias.scope !67, !noalias !71, !llvm.mem.parallel_loop_access !70
  %scevgep152 = getelementptr i64, i64* %scevgep151, i64 %polly.indvar142
  %_p_scalar_68_p_scalar_ = load i64, i64* %scevgep152, align 8, !alias.scope !66, !noalias !72, !llvm.mem.parallel_loop_access !70
  %p_.lhs = mul i64 %_p_scalar_68_p_scalar_, %.lhs.rhs.s2a.reload
  %p_.rhs = extractelement <1 x i64> %_p_splat_one_p_scalar_, i32 0
  %p_ = add i64 %p_.lhs, %p_.rhs
  %scevgep155 = getelementptr i64, i64* %scevgep154, i64 %polly.indvar142
  %_p_scalar_68.1_p_scalar_ = load i64, i64* %scevgep155, align 8, !alias.scope !66, !noalias !72, !llvm.mem.parallel_loop_access !70
  %p_.lhs.1 = mul i64 %_p_scalar_68.1_p_scalar_, %.lhs.rhs.1.s2a.reload
  %p_156 = add i64 %p_.lhs.1, %p_
  %scevgep159 = getelementptr i64, i64* %scevgep158, i64 %polly.indvar142
  %_p_scalar_68.2_p_scalar_ = load i64, i64* %scevgep159, align 8, !alias.scope !66, !noalias !72, !llvm.mem.parallel_loop_access !70
  %p_.lhs.2 = mul i64 %_p_scalar_68.2_p_scalar_, %.lhs.rhs.2.s2a.reload
  %p_160 = add i64 %p_.lhs.2, %p_156
  %scevgep163 = getelementptr i64, i64* %scevgep162, i64 %polly.indvar142
  %_p_scalar_68.3_p_scalar_ = load i64, i64* %scevgep163, align 8, !alias.scope !66, !noalias !72, !llvm.mem.parallel_loop_access !70
  %p_.lhs.3 = mul i64 %_p_scalar_68.3_p_scalar_, %.lhs.rhs.3.s2a.reload
  %p_164 = add i64 %p_.lhs.3, %p_160
  %scevgep167 = getelementptr i64, i64* %scevgep166, i64 %polly.indvar142
  %_p_scalar_68.4_p_scalar_ = load i64, i64* %scevgep167, align 8, !alias.scope !66, !noalias !72, !llvm.mem.parallel_loop_access !70
  %p_.lhs.4 = mul i64 %_p_scalar_68.4_p_scalar_, %.lhs.rhs.4.s2a.reload
  %p_168 = add i64 %p_.lhs.4, %p_164
  %scevgep171 = getelementptr i64, i64* %scevgep170, i64 %polly.indvar142
  %_p_scalar_68.5_p_scalar_ = load i64, i64* %scevgep171, align 8, !alias.scope !66, !noalias !72, !llvm.mem.parallel_loop_access !70
  %p_.lhs.5 = mul i64 %_p_scalar_68.5_p_scalar_, %.lhs.rhs.5.s2a.reload
  %p_172 = add i64 %p_.lhs.5, %p_168
  %scevgep175 = getelementptr i64, i64* %scevgep174, i64 %polly.indvar142
  %_p_scalar_68.6_p_scalar_ = load i64, i64* %scevgep175, align 8, !alias.scope !66, !noalias !72, !llvm.mem.parallel_loop_access !70
  %p_.lhs.6 = mul i64 %_p_scalar_68.6_p_scalar_, %.lhs.rhs.6.s2a.reload
  %p_176 = add i64 %p_.lhs.6, %p_172
  %scevgep179 = getelementptr i64, i64* %scevgep178, i64 %polly.indvar142
  %_p_scalar_68.7_p_scalar_ = load i64, i64* %scevgep179, align 8, !alias.scope !66, !noalias !72, !llvm.mem.parallel_loop_access !70
  %p_.lhs.7 = mul i64 %_p_scalar_68.7_p_scalar_, %.lhs.rhs.7.s2a.reload
  %p_180 = add i64 %p_.lhs.7, %p_176
  %scevgep184 = getelementptr i64, i64* %scevgep183, i64 %polly.indvar142
  store i64 %p_180, i64* %scevgep184, align 8, !alias.scope !67, !noalias !71, !llvm.mem.parallel_loop_access !70
  %75 = add i64 %polly.indvar142, 1
  %p_exitcond = icmp eq i64 %75, 32
  %polly.indvar_next143 = add nsw i64 %polly.indvar142, 1
  %polly.loop_cond144 = icmp sle i64 %polly.indvar142, 30
  br i1 %polly.loop_cond144, label %polly.loop_header139, label %polly.loop_exit141, !llvm.loop !70

polly.loop_preheader140:                          ; preds = %polly.stmt.polly.loop_preheader47
  %76 = shl i64 %polly.indvar105, 9
  %scevgep147 = getelementptr i64, i64* %scevgep146, i64 %76
  %scevgep183 = getelementptr i64, i64* %scevgep182, i64 %76
  br label %polly.loop_header139
}

; Function Attrs: nounwind uwtable
define void @print_array() #0 !dbg !8 {
entry:
  br label %entry.split, !dbg !73

entry.split:                                      ; preds = %entry
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !74, metadata !26), !dbg !73
  br label %for.cond1.preheader, !dbg !75

for.cond1.preheader:                              ; preds = %for.end, %entry.split
  %indvars.iv6 = phi i64 [ 0, %entry.split ], [ %indvars.iv.next7, %for.end ]
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 8, !dbg !79
  br label %for.body3, !dbg !84

for.body3:                                        ; preds = %for.inc, %for.cond1.preheader
  %indvars.iv = phi i64 [ 0, %for.cond1.preheader ], [ %indvars.iv.next, %for.inc ]
  %1 = phi %struct._IO_FILE* [ %0, %for.cond1.preheader ], [ %5, %for.inc ]
  %arrayidx5 = getelementptr inbounds [512 x [512 x i64]], [512 x [512 x i64]]* @C, i64 0, i64 %indvars.iv6, i64 %indvars.iv, !dbg !86
  %2 = load i64, i64* %arrayidx5, align 8, !dbg !86
  %call = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %1, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str, i64 0, i64 0), i64 %2) #4, !dbg !87
  %3 = trunc i64 %indvars.iv to i32, !dbg !88
  %rem = srem i32 %3, 80, !dbg !88
  %cmp6 = icmp eq i32 %rem, 79, !dbg !90
  br i1 %cmp6, label %if.then, label %for.inc, !dbg !91

if.then:                                          ; preds = %for.body3
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 8, !dbg !92
  %fputc3 = tail call i32 @fputc(i32 10, %struct._IO_FILE* %4), !dbg !94
  br label %for.inc, !dbg !94

for.inc:                                          ; preds = %if.then, %for.body3
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1, !dbg !84
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 8, !dbg !79
  %exitcond = icmp eq i64 %indvars.iv.next, 512, !dbg !84
  br i1 %exitcond, label %for.end, label %for.body3, !dbg !84

for.end:                                          ; preds = %for.inc
  %.lcssa = phi %struct._IO_FILE* [ %5, %for.inc ]
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %.lcssa), !dbg !95
  %indvars.iv.next7 = add nuw nsw i64 %indvars.iv6, 1, !dbg !75
  %exitcond8 = icmp eq i64 %indvars.iv.next7, 512, !dbg !75
  br i1 %exitcond8, label %for.end11, label %for.cond1.preheader, !dbg !75

for.end11:                                        ; preds = %for.end
  ret void, !dbg !96
}

; Function Attrs: nounwind
declare i32 @fprintf(%struct._IO_FILE* nocapture, i8* nocapture readonly, ...) #2

; Function Attrs: nounwind uwtable
define i32 @main() #0 !dbg !9 {
entry:
  br label %entry.split, !dbg !97

entry.split:                                      ; preds = %entry
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !25, metadata !26), !dbg !97
  br label %vector.ph, !dbg !99

vector.ph:                                        ; preds = %for.inc10.i, %entry.split
  %indvars.iv3.i = phi i64 [ 0, %entry.split ], [ %indvars.iv.next4.i, %for.inc10.i ], !dbg !100
  br label %vector.body, !dbg !101

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next.1, %vector.body ], !dbg !100
  %0 = getelementptr inbounds [512 x [512 x i64]], [512 x [512 x i64]]* @A, i64 0, i64 %indvars.iv3.i, i64 %index, !dbg !102
  %1 = bitcast i64* %0 to <2 x i64>*, !dbg !103
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %1, align 16, !dbg !103
  %2 = getelementptr i64, i64* %0, i64 2, !dbg !103
  %3 = bitcast i64* %2 to <2 x i64>*, !dbg !103
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %3, align 16, !dbg !103
  %4 = getelementptr inbounds [512 x [512 x i64]], [512 x [512 x i64]]* @B, i64 0, i64 %indvars.iv3.i, i64 %index, !dbg !104
  %5 = bitcast i64* %4 to <2 x i64>*, !dbg !105
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %5, align 16, !dbg !105
  %6 = getelementptr i64, i64* %4, i64 2, !dbg !105
  %7 = bitcast i64* %6 to <2 x i64>*, !dbg !105
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %7, align 16, !dbg !105
  %index.next = or i64 %index, 4, !dbg !101
  %8 = getelementptr inbounds [512 x [512 x i64]], [512 x [512 x i64]]* @A, i64 0, i64 %indvars.iv3.i, i64 %index.next, !dbg !102
  %9 = bitcast i64* %8 to <2 x i64>*, !dbg !103
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %9, align 16, !dbg !103
  %10 = getelementptr i64, i64* %8, i64 2, !dbg !103
  %11 = bitcast i64* %10 to <2 x i64>*, !dbg !103
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %11, align 16, !dbg !103
  %12 = getelementptr inbounds [512 x [512 x i64]], [512 x [512 x i64]]* @B, i64 0, i64 %indvars.iv3.i, i64 %index.next, !dbg !104
  %13 = bitcast i64* %12 to <2 x i64>*, !dbg !105
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %13, align 16, !dbg !105
  %14 = getelementptr i64, i64* %12, i64 2, !dbg !105
  %15 = bitcast i64* %14 to <2 x i64>*, !dbg !105
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %15, align 16, !dbg !105
  %index.next.1 = add nsw i64 %index, 8, !dbg !101
  %16 = icmp eq i64 %index.next.1, 512, !dbg !101
  br i1 %16, label %for.inc10.i, label %vector.body, !dbg !101, !llvm.loop !106

for.inc10.i:                                      ; preds = %vector.body
  %indvars.iv.next4.i = add nuw nsw i64 %indvars.iv3.i, 1, !dbg !99
  %exitcond5.i = icmp eq i64 %indvars.iv.next4.i, 512, !dbg !99
  br i1 %exitcond5.i, label %init_array.exit, label %vector.ph, !dbg !99

init_array.exit:                                  ; preds = %for.inc10.i
  tail call void @mat_mult(), !dbg !107
  %17 = load i64, i64* getelementptr inbounds ([512 x [512 x i64]], [512 x [512 x i64]]* @C, i64 0, i64 511, i64 511), align 8, !dbg !108
  %call = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([49 x i8], [49 x i8]* @.str.2, i64 0, i64 0), i32 512, i32 512, i64 %17) #4, !dbg !109
  ret i32 0, !dbg !110
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
!48 = distinct !{!48}
!49 = distinct !{!49}
!50 = distinct !{!50, !51, !"polly.alias.scope.A"}
!51 = distinct !{!51, !"polly.alias.scope.domain"}
!52 = !{!53, !54}
!53 = distinct !{!53, !51, !"polly.alias.scope.B"}
!54 = distinct !{!54, !51, !"polly.alias.scope.C"}
!55 = !{!50, !53}
!56 = !{!50, !54}
!57 = distinct !{!57, !58, !"polly.alias.scope.A"}
!58 = distinct !{!58, !"polly.alias.scope.domain"}
!59 = !{!60, !61, !62, !63, !64, !65, !66, !67, !68, !69}
!60 = distinct !{!60, !58, !"polly.alias.scope..lhs.rhs"}
!61 = distinct !{!61, !58, !"polly.alias.scope..lhs.rhs.1"}
!62 = distinct !{!62, !58, !"polly.alias.scope..lhs.rhs.3"}
!63 = distinct !{!63, !58, !"polly.alias.scope..lhs.rhs.7"}
!64 = distinct !{!64, !58, !"polly.alias.scope..lhs.rhs.2"}
!65 = distinct !{!65, !58, !"polly.alias.scope..lhs.rhs.5"}
!66 = distinct !{!66, !58, !"polly.alias.scope.B"}
!67 = distinct !{!67, !58, !"polly.alias.scope.C"}
!68 = distinct !{!68, !58, !"polly.alias.scope..lhs.rhs.4"}
!69 = distinct !{!69, !58, !"polly.alias.scope..lhs.rhs.6"}
!70 = distinct !{!70}
!71 = !{!60, !61, !62, !63, !57, !64, !65, !66, !68, !69}
!72 = !{!60, !61, !62, !63, !57, !64, !65, !67, !68, !69}
!73 = !DILocation(line: 33, column: 9, scope: !8)
!74 = !DILocalVariable(name: "i", scope: !8, file: !1, line: 33, type: !12)
!75 = !DILocation(line: 35, column: 5, scope: !76)
!76 = !DILexicalBlockFile(scope: !77, file: !1, discriminator: 1)
!77 = distinct !DILexicalBlock(scope: !78, file: !1, line: 35, column: 5)
!78 = distinct !DILexicalBlock(scope: !8, file: !1, line: 35, column: 5)
!79 = !DILocation(line: 37, column: 21, scope: !80)
!80 = distinct !DILexicalBlock(scope: !81, file: !1, line: 36, column: 29)
!81 = distinct !DILexicalBlock(scope: !82, file: !1, line: 36, column: 9)
!82 = distinct !DILexicalBlock(scope: !83, file: !1, line: 36, column: 9)
!83 = distinct !DILexicalBlock(scope: !77, file: !1, line: 35, column: 25)
!84 = !DILocation(line: 36, column: 9, scope: !85)
!85 = !DILexicalBlockFile(scope: !81, file: !1, discriminator: 1)
!86 = !DILocation(line: 37, column: 38, scope: !80)
!87 = !DILocation(line: 37, column: 13, scope: !80)
!88 = !DILocation(line: 38, column: 18, scope: !89)
!89 = distinct !DILexicalBlock(scope: !80, file: !1, line: 38, column: 17)
!90 = !DILocation(line: 38, column: 22, scope: !89)
!91 = !DILocation(line: 38, column: 17, scope: !80)
!92 = !DILocation(line: 38, column: 37, scope: !93)
!93 = !DILexicalBlockFile(scope: !89, file: !1, discriminator: 1)
!94 = !DILocation(line: 38, column: 29, scope: !93)
!95 = !DILocation(line: 40, column: 9, scope: !83)
!96 = !DILocation(line: 42, column: 1, scope: !8)
!97 = !DILocation(line: 9, column: 9, scope: !4, inlinedAt: !98)
!98 = distinct !DILocation(line: 51, column: 5, scope: !9)
!99 = !DILocation(line: 11, column: 5, scope: !28, inlinedAt: !98)
!100 = !DILocation(line: 51, column: 5, scope: !9)
!101 = !DILocation(line: 12, column: 9, scope: !32, inlinedAt: !98)
!102 = !DILocation(line: 13, column: 13, scope: !37, inlinedAt: !98)
!103 = !DILocation(line: 13, column: 21, scope: !37, inlinedAt: !98)
!104 = !DILocation(line: 14, column: 13, scope: !37, inlinedAt: !98)
!105 = !DILocation(line: 14, column: 21, scope: !37, inlinedAt: !98)
!106 = distinct !{!106, !42, !43}
!107 = !DILocation(line: 52, column: 5, scope: !9)
!108 = !DILocation(line: 55, column: 71, scope: !9)
!109 = !DILocation(line: 55, column: 5, scope: !9)
!110 = !DILocation(line: 56, column: 5, scope: !9)
