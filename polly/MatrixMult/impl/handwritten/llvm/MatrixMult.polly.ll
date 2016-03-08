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
  br label %entry.split, !dbg !45

entry.split:                                      ; preds = %entry
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !46, metadata !26), !dbg !45
  br label %polly.loop_preheader2

polly.exiting:                                    ; preds = %polly.loop_exit27
  ret void, !dbg !47

polly.loop_exit3:                                 ; preds = %polly.loop_preheader14
  %polly.indvar_next = add nuw nsw i64 %polly.indvar, 1
  %exitcond72 = icmp eq i64 %polly.indvar_next, 16
  br i1 %exitcond72, label %polly.loop_preheader26.preheader, label %polly.loop_preheader2

polly.loop_preheader26.preheader:                 ; preds = %polly.loop_exit3
  br label %polly.loop_preheader26

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
  %scevgep68 = getelementptr [512 x [512 x i64]], [512 x [512 x i64]]* @C, i64 0, i64 %0, i64 %32
  %scevgep6869 = bitcast i64* %scevgep68 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep6869, i8 0, i64 256, i32 16, i1 false)
  %scevgep68.1 = getelementptr [512 x [512 x i64]], [512 x [512 x i64]]* @C, i64 0, i64 %1, i64 %32
  %scevgep6869.1 = bitcast i64* %scevgep68.1 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep6869.1, i8 0, i64 256, i32 16, i1 false)
  %scevgep68.2 = getelementptr [512 x [512 x i64]], [512 x [512 x i64]]* @C, i64 0, i64 %2, i64 %32
  %scevgep6869.2 = bitcast i64* %scevgep68.2 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep6869.2, i8 0, i64 256, i32 16, i1 false)
  %scevgep68.3 = getelementptr [512 x [512 x i64]], [512 x [512 x i64]]* @C, i64 0, i64 %3, i64 %32
  %scevgep6869.3 = bitcast i64* %scevgep68.3 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep6869.3, i8 0, i64 256, i32 16, i1 false)
  %scevgep68.4 = getelementptr [512 x [512 x i64]], [512 x [512 x i64]]* @C, i64 0, i64 %4, i64 %32
  %scevgep6869.4 = bitcast i64* %scevgep68.4 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep6869.4, i8 0, i64 256, i32 16, i1 false)
  %scevgep68.5 = getelementptr [512 x [512 x i64]], [512 x [512 x i64]]* @C, i64 0, i64 %5, i64 %32
  %scevgep6869.5 = bitcast i64* %scevgep68.5 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep6869.5, i8 0, i64 256, i32 16, i1 false)
  %scevgep68.6 = getelementptr [512 x [512 x i64]], [512 x [512 x i64]]* @C, i64 0, i64 %6, i64 %32
  %scevgep6869.6 = bitcast i64* %scevgep68.6 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep6869.6, i8 0, i64 256, i32 16, i1 false)
  %scevgep68.7 = getelementptr [512 x [512 x i64]], [512 x [512 x i64]]* @C, i64 0, i64 %7, i64 %32
  %scevgep6869.7 = bitcast i64* %scevgep68.7 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep6869.7, i8 0, i64 256, i32 16, i1 false)
  %scevgep68.8 = getelementptr [512 x [512 x i64]], [512 x [512 x i64]]* @C, i64 0, i64 %8, i64 %32
  %scevgep6869.8 = bitcast i64* %scevgep68.8 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep6869.8, i8 0, i64 256, i32 16, i1 false)
  %scevgep68.9 = getelementptr [512 x [512 x i64]], [512 x [512 x i64]]* @C, i64 0, i64 %9, i64 %32
  %scevgep6869.9 = bitcast i64* %scevgep68.9 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep6869.9, i8 0, i64 256, i32 16, i1 false)
  %scevgep68.10 = getelementptr [512 x [512 x i64]], [512 x [512 x i64]]* @C, i64 0, i64 %10, i64 %32
  %scevgep6869.10 = bitcast i64* %scevgep68.10 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep6869.10, i8 0, i64 256, i32 16, i1 false)
  %scevgep68.11 = getelementptr [512 x [512 x i64]], [512 x [512 x i64]]* @C, i64 0, i64 %11, i64 %32
  %scevgep6869.11 = bitcast i64* %scevgep68.11 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep6869.11, i8 0, i64 256, i32 16, i1 false)
  %scevgep68.12 = getelementptr [512 x [512 x i64]], [512 x [512 x i64]]* @C, i64 0, i64 %12, i64 %32
  %scevgep6869.12 = bitcast i64* %scevgep68.12 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep6869.12, i8 0, i64 256, i32 16, i1 false)
  %scevgep68.13 = getelementptr [512 x [512 x i64]], [512 x [512 x i64]]* @C, i64 0, i64 %13, i64 %32
  %scevgep6869.13 = bitcast i64* %scevgep68.13 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep6869.13, i8 0, i64 256, i32 16, i1 false)
  %scevgep68.14 = getelementptr [512 x [512 x i64]], [512 x [512 x i64]]* @C, i64 0, i64 %14, i64 %32
  %scevgep6869.14 = bitcast i64* %scevgep68.14 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep6869.14, i8 0, i64 256, i32 16, i1 false)
  %scevgep68.15 = getelementptr [512 x [512 x i64]], [512 x [512 x i64]]* @C, i64 0, i64 %15, i64 %32
  %scevgep6869.15 = bitcast i64* %scevgep68.15 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep6869.15, i8 0, i64 256, i32 16, i1 false)
  %scevgep68.16 = getelementptr [512 x [512 x i64]], [512 x [512 x i64]]* @C, i64 0, i64 %16, i64 %32
  %scevgep6869.16 = bitcast i64* %scevgep68.16 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep6869.16, i8 0, i64 256, i32 16, i1 false)
  %scevgep68.17 = getelementptr [512 x [512 x i64]], [512 x [512 x i64]]* @C, i64 0, i64 %17, i64 %32
  %scevgep6869.17 = bitcast i64* %scevgep68.17 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep6869.17, i8 0, i64 256, i32 16, i1 false)
  %scevgep68.18 = getelementptr [512 x [512 x i64]], [512 x [512 x i64]]* @C, i64 0, i64 %18, i64 %32
  %scevgep6869.18 = bitcast i64* %scevgep68.18 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep6869.18, i8 0, i64 256, i32 16, i1 false)
  %scevgep68.19 = getelementptr [512 x [512 x i64]], [512 x [512 x i64]]* @C, i64 0, i64 %19, i64 %32
  %scevgep6869.19 = bitcast i64* %scevgep68.19 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep6869.19, i8 0, i64 256, i32 16, i1 false)
  %scevgep68.20 = getelementptr [512 x [512 x i64]], [512 x [512 x i64]]* @C, i64 0, i64 %20, i64 %32
  %scevgep6869.20 = bitcast i64* %scevgep68.20 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep6869.20, i8 0, i64 256, i32 16, i1 false)
  %scevgep68.21 = getelementptr [512 x [512 x i64]], [512 x [512 x i64]]* @C, i64 0, i64 %21, i64 %32
  %scevgep6869.21 = bitcast i64* %scevgep68.21 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep6869.21, i8 0, i64 256, i32 16, i1 false)
  %scevgep68.22 = getelementptr [512 x [512 x i64]], [512 x [512 x i64]]* @C, i64 0, i64 %22, i64 %32
  %scevgep6869.22 = bitcast i64* %scevgep68.22 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep6869.22, i8 0, i64 256, i32 16, i1 false)
  %scevgep68.23 = getelementptr [512 x [512 x i64]], [512 x [512 x i64]]* @C, i64 0, i64 %23, i64 %32
  %scevgep6869.23 = bitcast i64* %scevgep68.23 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep6869.23, i8 0, i64 256, i32 16, i1 false)
  %scevgep68.24 = getelementptr [512 x [512 x i64]], [512 x [512 x i64]]* @C, i64 0, i64 %24, i64 %32
  %scevgep6869.24 = bitcast i64* %scevgep68.24 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep6869.24, i8 0, i64 256, i32 16, i1 false)
  %scevgep68.25 = getelementptr [512 x [512 x i64]], [512 x [512 x i64]]* @C, i64 0, i64 %25, i64 %32
  %scevgep6869.25 = bitcast i64* %scevgep68.25 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep6869.25, i8 0, i64 256, i32 16, i1 false)
  %scevgep68.26 = getelementptr [512 x [512 x i64]], [512 x [512 x i64]]* @C, i64 0, i64 %26, i64 %32
  %scevgep6869.26 = bitcast i64* %scevgep68.26 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep6869.26, i8 0, i64 256, i32 16, i1 false)
  %scevgep68.27 = getelementptr [512 x [512 x i64]], [512 x [512 x i64]]* @C, i64 0, i64 %27, i64 %32
  %scevgep6869.27 = bitcast i64* %scevgep68.27 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep6869.27, i8 0, i64 256, i32 16, i1 false)
  %scevgep68.28 = getelementptr [512 x [512 x i64]], [512 x [512 x i64]]* @C, i64 0, i64 %28, i64 %32
  %scevgep6869.28 = bitcast i64* %scevgep68.28 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep6869.28, i8 0, i64 256, i32 16, i1 false)
  %scevgep68.29 = getelementptr [512 x [512 x i64]], [512 x [512 x i64]]* @C, i64 0, i64 %29, i64 %32
  %scevgep6869.29 = bitcast i64* %scevgep68.29 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep6869.29, i8 0, i64 256, i32 16, i1 false)
  %scevgep68.30 = getelementptr [512 x [512 x i64]], [512 x [512 x i64]]* @C, i64 0, i64 %30, i64 %32
  %scevgep6869.30 = bitcast i64* %scevgep68.30 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep6869.30, i8 0, i64 256, i32 16, i1 false)
  %scevgep68.31 = getelementptr [512 x [512 x i64]], [512 x [512 x i64]]* @C, i64 0, i64 %31, i64 %32
  %scevgep6869.31 = bitcast i64* %scevgep68.31 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep6869.31, i8 0, i64 256, i32 16, i1 false)
  %polly.indvar_next5 = add nuw nsw i64 %polly.indvar4, 1
  %exitcond71 = icmp eq i64 %polly.indvar_next5, 16
  br i1 %exitcond71, label %polly.loop_exit3, label %polly.loop_preheader8

polly.loop_exit27:                                ; preds = %polly.loop_exit33
  %polly.indvar_next23 = add nuw nsw i64 %polly.indvar22, 1
  %exitcond66 = icmp eq i64 %polly.indvar_next23, 16
  br i1 %exitcond66, label %polly.exiting, label %polly.loop_preheader26

polly.loop_exit33:                                ; preds = %polly.loop_exit39
  %polly.indvar_next29 = add nuw nsw i64 %polly.indvar28, 1
  %exitcond65 = icmp eq i64 %polly.indvar_next29, 16
  br i1 %exitcond65, label %polly.loop_exit27, label %polly.loop_preheader32

polly.loop_preheader26:                           ; preds = %polly.loop_preheader26.preheader, %polly.loop_exit27
  %polly.indvar22 = phi i64 [ %polly.indvar_next23, %polly.loop_exit27 ], [ 0, %polly.loop_preheader26.preheader ]
  %33 = shl nsw i64 %polly.indvar22, 5
  br label %polly.loop_preheader32

polly.loop_exit39:                                ; preds = %polly.loop_exit45
  %polly.indvar_next35 = add nuw nsw i64 %polly.indvar34, 1
  %exitcond64 = icmp eq i64 %polly.indvar_next35, 16
  br i1 %exitcond64, label %polly.loop_exit33, label %polly.loop_preheader38

polly.loop_preheader32:                           ; preds = %polly.loop_exit33, %polly.loop_preheader26
  %polly.indvar28 = phi i64 [ 0, %polly.loop_preheader26 ], [ %polly.indvar_next29, %polly.loop_exit33 ]
  %34 = shl nsw i64 %polly.indvar28, 5
  br label %polly.loop_preheader38

polly.loop_exit45:                                ; preds = %polly.loop_exit51
  %polly.indvar_next41 = add nuw nsw i64 %polly.indvar40, 1
  %exitcond63 = icmp eq i64 %polly.indvar_next41, 32
  br i1 %exitcond63, label %polly.loop_exit39, label %polly.loop_preheader44

polly.loop_preheader38:                           ; preds = %polly.loop_exit39, %polly.loop_preheader32
  %polly.indvar34 = phi i64 [ 0, %polly.loop_preheader32 ], [ %polly.indvar_next35, %polly.loop_exit39 ]
  %35 = shl nsw i64 %polly.indvar34, 5
  br label %polly.loop_preheader44

polly.loop_exit51:                                ; preds = %polly.loop_header49
  %p_add.1.lcssa = phi i64 [ %p_add.1, %polly.loop_header49 ]
  store i64 %p_add.1.lcssa, i64* %scevgep55, align 8, !alias.scope !48, !noalias !50
  %polly.indvar_next47 = add nuw nsw i64 %polly.indvar46, 1
  %exitcond62 = icmp eq i64 %polly.indvar_next47, 32
  br i1 %exitcond62, label %polly.loop_exit45, label %polly.loop_preheader50

polly.loop_preheader44:                           ; preds = %polly.loop_exit45, %polly.loop_preheader38
  %polly.indvar40 = phi i64 [ 0, %polly.loop_preheader38 ], [ %polly.indvar_next41, %polly.loop_exit45 ]
  %36 = add nuw nsw i64 %polly.indvar40, %33
  br label %polly.loop_preheader50

polly.loop_header49:                              ; preds = %polly.loop_header49, %polly.loop_preheader50
  %p_add61 = phi i64 [ %scevgep55.promoted, %polly.loop_preheader50 ], [ %p_add.1, %polly.loop_header49 ]
  %polly.indvar52 = phi i64 [ 0, %polly.loop_preheader50 ], [ %polly.indvar_next53.1, %polly.loop_header49 ]
  %37 = add nuw nsw i64 %polly.indvar52, %35
  %scevgep56 = getelementptr [512 x [512 x i64]], [512 x [512 x i64]]* @A, i64 0, i64 %36, i64 %37
  %_p_scalar_57 = load i64, i64* %scevgep56, align 16, !alias.scope !51, !noalias !53
  %scevgep58 = getelementptr [512 x [512 x i64]], [512 x [512 x i64]]* @B, i64 0, i64 %37, i64 %39
  %_p_scalar_59 = load i64, i64* %scevgep58, align 8, !alias.scope !52, !noalias !54
  %p_mul = mul nsw i64 %_p_scalar_59, %_p_scalar_57, !dbg !55
  %p_add = add nsw i64 %p_mul, %p_add61, !dbg !64
  %polly.indvar_next53 = or i64 %polly.indvar52, 1
  %38 = add nuw nsw i64 %polly.indvar_next53, %35
  %scevgep56.1 = getelementptr [512 x [512 x i64]], [512 x [512 x i64]]* @A, i64 0, i64 %36, i64 %38
  %_p_scalar_57.1 = load i64, i64* %scevgep56.1, align 8, !alias.scope !51, !noalias !53
  %scevgep58.1 = getelementptr [512 x [512 x i64]], [512 x [512 x i64]]* @B, i64 0, i64 %38, i64 %39
  %_p_scalar_59.1 = load i64, i64* %scevgep58.1, align 8, !alias.scope !52, !noalias !54
  %p_mul.1 = mul nsw i64 %_p_scalar_59.1, %_p_scalar_57.1, !dbg !55
  %p_add.1 = add nsw i64 %p_mul.1, %p_add, !dbg !64
  %polly.indvar_next53.1 = add nsw i64 %polly.indvar52, 2
  %exitcond.1 = icmp eq i64 %polly.indvar_next53.1, 32
  br i1 %exitcond.1, label %polly.loop_exit51, label %polly.loop_header49

polly.loop_preheader50:                           ; preds = %polly.loop_exit51, %polly.loop_preheader44
  %polly.indvar46 = phi i64 [ 0, %polly.loop_preheader44 ], [ %polly.indvar_next47, %polly.loop_exit51 ]
  %39 = add nuw nsw i64 %polly.indvar46, %34
  %scevgep55 = getelementptr [512 x [512 x i64]], [512 x [512 x i64]]* @C, i64 0, i64 %36, i64 %39
  %scevgep55.promoted = load i64, i64* %scevgep55, align 8, !alias.scope !48, !noalias !50
  br label %polly.loop_header49
}

; Function Attrs: nounwind uwtable
define void @print_array() #0 !dbg !8 {
entry:
  br label %entry.split, !dbg !65

entry.split:                                      ; preds = %entry
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !66, metadata !26), !dbg !65
  br label %for.cond1.preheader, !dbg !67

for.cond1.preheader:                              ; preds = %for.end, %entry.split
  %indvars.iv6 = phi i64 [ 0, %entry.split ], [ %indvars.iv.next7, %for.end ]
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 8, !dbg !71
  br label %for.body3, !dbg !76

for.body3:                                        ; preds = %for.inc, %for.cond1.preheader
  %indvars.iv = phi i64 [ 0, %for.cond1.preheader ], [ %indvars.iv.next, %for.inc ]
  %1 = phi %struct._IO_FILE* [ %0, %for.cond1.preheader ], [ %5, %for.inc ]
  %arrayidx5 = getelementptr inbounds [512 x [512 x i64]], [512 x [512 x i64]]* @C, i64 0, i64 %indvars.iv6, i64 %indvars.iv, !dbg !78
  %2 = load i64, i64* %arrayidx5, align 8, !dbg !78
  %call = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %1, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str, i64 0, i64 0), i64 %2) #4, !dbg !79
  %3 = trunc i64 %indvars.iv to i32, !dbg !80
  %rem = srem i32 %3, 80, !dbg !80
  %cmp6 = icmp eq i32 %rem, 79, !dbg !82
  br i1 %cmp6, label %if.then, label %for.inc, !dbg !83

if.then:                                          ; preds = %for.body3
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 8, !dbg !84
  %fputc3 = tail call i32 @fputc(i32 10, %struct._IO_FILE* %4), !dbg !86
  br label %for.inc, !dbg !86

for.inc:                                          ; preds = %if.then, %for.body3
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1, !dbg !76
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 8, !dbg !71
  %exitcond = icmp eq i64 %indvars.iv.next, 512, !dbg !76
  br i1 %exitcond, label %for.end, label %for.body3, !dbg !76

for.end:                                          ; preds = %for.inc
  %.lcssa = phi %struct._IO_FILE* [ %5, %for.inc ]
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %.lcssa), !dbg !87
  %indvars.iv.next7 = add nuw nsw i64 %indvars.iv6, 1, !dbg !67
  %exitcond8 = icmp eq i64 %indvars.iv.next7, 512, !dbg !67
  br i1 %exitcond8, label %for.end11, label %for.cond1.preheader, !dbg !67

for.end11:                                        ; preds = %for.end
  ret void, !dbg !88
}

; Function Attrs: nounwind
declare i32 @fprintf(%struct._IO_FILE* nocapture, i8* nocapture readonly, ...) #2

; Function Attrs: nounwind uwtable
define i32 @main() #0 !dbg !9 {
entry:
  br label %entry.split, !dbg !89

entry.split:                                      ; preds = %entry
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !25, metadata !26), !dbg !89
  br label %vector.ph, !dbg !91

vector.ph:                                        ; preds = %for.inc10.i, %entry.split
  %indvars.iv3.i = phi i64 [ 0, %entry.split ], [ %indvars.iv.next4.i, %for.inc10.i ], !dbg !92
  br label %vector.body, !dbg !93

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next.1, %vector.body ], !dbg !92
  %0 = getelementptr inbounds [512 x [512 x i64]], [512 x [512 x i64]]* @A, i64 0, i64 %indvars.iv3.i, i64 %index, !dbg !94
  %1 = bitcast i64* %0 to <2 x i64>*, !dbg !95
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %1, align 16, !dbg !95
  %2 = getelementptr i64, i64* %0, i64 2, !dbg !95
  %3 = bitcast i64* %2 to <2 x i64>*, !dbg !95
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %3, align 16, !dbg !95
  %4 = getelementptr inbounds [512 x [512 x i64]], [512 x [512 x i64]]* @B, i64 0, i64 %indvars.iv3.i, i64 %index, !dbg !96
  %5 = bitcast i64* %4 to <2 x i64>*, !dbg !97
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %5, align 16, !dbg !97
  %6 = getelementptr i64, i64* %4, i64 2, !dbg !97
  %7 = bitcast i64* %6 to <2 x i64>*, !dbg !97
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %7, align 16, !dbg !97
  %index.next = or i64 %index, 4, !dbg !93
  %8 = getelementptr inbounds [512 x [512 x i64]], [512 x [512 x i64]]* @A, i64 0, i64 %indvars.iv3.i, i64 %index.next, !dbg !94
  %9 = bitcast i64* %8 to <2 x i64>*, !dbg !95
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %9, align 16, !dbg !95
  %10 = getelementptr i64, i64* %8, i64 2, !dbg !95
  %11 = bitcast i64* %10 to <2 x i64>*, !dbg !95
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %11, align 16, !dbg !95
  %12 = getelementptr inbounds [512 x [512 x i64]], [512 x [512 x i64]]* @B, i64 0, i64 %indvars.iv3.i, i64 %index.next, !dbg !96
  %13 = bitcast i64* %12 to <2 x i64>*, !dbg !97
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %13, align 16, !dbg !97
  %14 = getelementptr i64, i64* %12, i64 2, !dbg !97
  %15 = bitcast i64* %14 to <2 x i64>*, !dbg !97
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %15, align 16, !dbg !97
  %index.next.1 = add nsw i64 %index, 8, !dbg !93
  %16 = icmp eq i64 %index.next.1, 512, !dbg !93
  br i1 %16, label %for.inc10.i, label %vector.body, !dbg !93, !llvm.loop !98

for.inc10.i:                                      ; preds = %vector.body
  %indvars.iv.next4.i = add nuw nsw i64 %indvars.iv3.i, 1, !dbg !91
  %exitcond5.i = icmp eq i64 %indvars.iv.next4.i, 512, !dbg !91
  br i1 %exitcond5.i, label %polly.loop_preheader2.i.preheader, label %vector.ph, !dbg !91

polly.loop_preheader2.i.preheader:                ; preds = %for.inc10.i
  br label %polly.loop_preheader2.i, !dbg !99

polly.loop_exit3.i:                               ; preds = %polly.loop_preheader8.i
  %polly.indvar_next.i = add nuw nsw i64 %polly.indvar.i, 1, !dbg !99
  %exitcond72.i = icmp eq i64 %polly.indvar_next.i, 16, !dbg !99
  br i1 %exitcond72.i, label %polly.loop_preheader26.i.preheader, label %polly.loop_preheader2.i, !dbg !99

polly.loop_preheader26.i.preheader:               ; preds = %polly.loop_exit3.i
  br label %polly.loop_preheader26.i, !dbg !99

polly.loop_preheader2.i:                          ; preds = %polly.loop_preheader2.i.preheader, %polly.loop_exit3.i
  %polly.indvar.i = phi i64 [ %polly.indvar_next.i, %polly.loop_exit3.i ], [ 0, %polly.loop_preheader2.i.preheader ], !dbg !99
  %17 = shl i64 %polly.indvar.i, 5, !dbg !99
  %18 = or i64 %17, 1, !dbg !99
  %19 = or i64 %17, 2, !dbg !99
  %20 = or i64 %17, 3, !dbg !99
  %21 = or i64 %17, 4, !dbg !99
  %22 = or i64 %17, 5, !dbg !99
  %23 = or i64 %17, 6, !dbg !99
  %24 = or i64 %17, 7, !dbg !99
  %25 = or i64 %17, 8, !dbg !99
  %26 = or i64 %17, 9, !dbg !99
  %27 = or i64 %17, 10, !dbg !99
  %28 = or i64 %17, 11, !dbg !99
  %29 = or i64 %17, 12, !dbg !99
  %30 = or i64 %17, 13, !dbg !99
  %31 = or i64 %17, 14, !dbg !99
  %32 = or i64 %17, 15, !dbg !99
  %33 = or i64 %17, 16, !dbg !99
  %34 = or i64 %17, 17, !dbg !99
  %35 = or i64 %17, 18, !dbg !99
  %36 = or i64 %17, 19, !dbg !99
  %37 = or i64 %17, 20, !dbg !99
  %38 = or i64 %17, 21, !dbg !99
  %39 = or i64 %17, 22, !dbg !99
  %40 = or i64 %17, 23, !dbg !99
  %41 = or i64 %17, 24, !dbg !99
  %42 = or i64 %17, 25, !dbg !99
  %43 = or i64 %17, 26, !dbg !99
  %44 = or i64 %17, 27, !dbg !99
  %45 = or i64 %17, 28, !dbg !99
  %46 = or i64 %17, 29, !dbg !99
  %47 = or i64 %17, 30, !dbg !99
  %48 = or i64 %17, 31, !dbg !99
  br label %polly.loop_preheader8.i, !dbg !99

polly.loop_preheader8.i:                          ; preds = %polly.loop_preheader2.i, %polly.loop_preheader8.i
  %polly.indvar4.i = phi i64 [ 0, %polly.loop_preheader2.i ], [ %polly.indvar_next5.i, %polly.loop_preheader8.i ], !dbg !99
  %49 = shl i64 %polly.indvar4.i, 5, !dbg !99
  %scevgep68.i = getelementptr [512 x [512 x i64]], [512 x [512 x i64]]* @C, i64 0, i64 %17, i64 %49, !dbg !99
  %scevgep6869.i = bitcast i64* %scevgep68.i to i8*, !dbg !99
  tail call void @llvm.memset.p0i8.i64(i8* %scevgep6869.i, i8 0, i64 256, i32 16, i1 false) #4, !dbg !99
  %scevgep68.i.1 = getelementptr [512 x [512 x i64]], [512 x [512 x i64]]* @C, i64 0, i64 %18, i64 %49, !dbg !99
  %scevgep6869.i.1 = bitcast i64* %scevgep68.i.1 to i8*, !dbg !99
  tail call void @llvm.memset.p0i8.i64(i8* %scevgep6869.i.1, i8 0, i64 256, i32 16, i1 false) #4, !dbg !99
  %scevgep68.i.2 = getelementptr [512 x [512 x i64]], [512 x [512 x i64]]* @C, i64 0, i64 %19, i64 %49, !dbg !99
  %scevgep6869.i.2 = bitcast i64* %scevgep68.i.2 to i8*, !dbg !99
  tail call void @llvm.memset.p0i8.i64(i8* %scevgep6869.i.2, i8 0, i64 256, i32 16, i1 false) #4, !dbg !99
  %scevgep68.i.3 = getelementptr [512 x [512 x i64]], [512 x [512 x i64]]* @C, i64 0, i64 %20, i64 %49, !dbg !99
  %scevgep6869.i.3 = bitcast i64* %scevgep68.i.3 to i8*, !dbg !99
  tail call void @llvm.memset.p0i8.i64(i8* %scevgep6869.i.3, i8 0, i64 256, i32 16, i1 false) #4, !dbg !99
  %scevgep68.i.4 = getelementptr [512 x [512 x i64]], [512 x [512 x i64]]* @C, i64 0, i64 %21, i64 %49, !dbg !99
  %scevgep6869.i.4 = bitcast i64* %scevgep68.i.4 to i8*, !dbg !99
  tail call void @llvm.memset.p0i8.i64(i8* %scevgep6869.i.4, i8 0, i64 256, i32 16, i1 false) #4, !dbg !99
  %scevgep68.i.5 = getelementptr [512 x [512 x i64]], [512 x [512 x i64]]* @C, i64 0, i64 %22, i64 %49, !dbg !99
  %scevgep6869.i.5 = bitcast i64* %scevgep68.i.5 to i8*, !dbg !99
  tail call void @llvm.memset.p0i8.i64(i8* %scevgep6869.i.5, i8 0, i64 256, i32 16, i1 false) #4, !dbg !99
  %scevgep68.i.6 = getelementptr [512 x [512 x i64]], [512 x [512 x i64]]* @C, i64 0, i64 %23, i64 %49, !dbg !99
  %scevgep6869.i.6 = bitcast i64* %scevgep68.i.6 to i8*, !dbg !99
  tail call void @llvm.memset.p0i8.i64(i8* %scevgep6869.i.6, i8 0, i64 256, i32 16, i1 false) #4, !dbg !99
  %scevgep68.i.7 = getelementptr [512 x [512 x i64]], [512 x [512 x i64]]* @C, i64 0, i64 %24, i64 %49, !dbg !99
  %scevgep6869.i.7 = bitcast i64* %scevgep68.i.7 to i8*, !dbg !99
  tail call void @llvm.memset.p0i8.i64(i8* %scevgep6869.i.7, i8 0, i64 256, i32 16, i1 false) #4, !dbg !99
  %scevgep68.i.8 = getelementptr [512 x [512 x i64]], [512 x [512 x i64]]* @C, i64 0, i64 %25, i64 %49, !dbg !99
  %scevgep6869.i.8 = bitcast i64* %scevgep68.i.8 to i8*, !dbg !99
  tail call void @llvm.memset.p0i8.i64(i8* %scevgep6869.i.8, i8 0, i64 256, i32 16, i1 false) #4, !dbg !99
  %scevgep68.i.9 = getelementptr [512 x [512 x i64]], [512 x [512 x i64]]* @C, i64 0, i64 %26, i64 %49, !dbg !99
  %scevgep6869.i.9 = bitcast i64* %scevgep68.i.9 to i8*, !dbg !99
  tail call void @llvm.memset.p0i8.i64(i8* %scevgep6869.i.9, i8 0, i64 256, i32 16, i1 false) #4, !dbg !99
  %scevgep68.i.10 = getelementptr [512 x [512 x i64]], [512 x [512 x i64]]* @C, i64 0, i64 %27, i64 %49, !dbg !99
  %scevgep6869.i.10 = bitcast i64* %scevgep68.i.10 to i8*, !dbg !99
  tail call void @llvm.memset.p0i8.i64(i8* %scevgep6869.i.10, i8 0, i64 256, i32 16, i1 false) #4, !dbg !99
  %scevgep68.i.11 = getelementptr [512 x [512 x i64]], [512 x [512 x i64]]* @C, i64 0, i64 %28, i64 %49, !dbg !99
  %scevgep6869.i.11 = bitcast i64* %scevgep68.i.11 to i8*, !dbg !99
  tail call void @llvm.memset.p0i8.i64(i8* %scevgep6869.i.11, i8 0, i64 256, i32 16, i1 false) #4, !dbg !99
  %scevgep68.i.12 = getelementptr [512 x [512 x i64]], [512 x [512 x i64]]* @C, i64 0, i64 %29, i64 %49, !dbg !99
  %scevgep6869.i.12 = bitcast i64* %scevgep68.i.12 to i8*, !dbg !99
  tail call void @llvm.memset.p0i8.i64(i8* %scevgep6869.i.12, i8 0, i64 256, i32 16, i1 false) #4, !dbg !99
  %scevgep68.i.13 = getelementptr [512 x [512 x i64]], [512 x [512 x i64]]* @C, i64 0, i64 %30, i64 %49, !dbg !99
  %scevgep6869.i.13 = bitcast i64* %scevgep68.i.13 to i8*, !dbg !99
  tail call void @llvm.memset.p0i8.i64(i8* %scevgep6869.i.13, i8 0, i64 256, i32 16, i1 false) #4, !dbg !99
  %scevgep68.i.14 = getelementptr [512 x [512 x i64]], [512 x [512 x i64]]* @C, i64 0, i64 %31, i64 %49, !dbg !99
  %scevgep6869.i.14 = bitcast i64* %scevgep68.i.14 to i8*, !dbg !99
  tail call void @llvm.memset.p0i8.i64(i8* %scevgep6869.i.14, i8 0, i64 256, i32 16, i1 false) #4, !dbg !99
  %scevgep68.i.15 = getelementptr [512 x [512 x i64]], [512 x [512 x i64]]* @C, i64 0, i64 %32, i64 %49, !dbg !99
  %scevgep6869.i.15 = bitcast i64* %scevgep68.i.15 to i8*, !dbg !99
  tail call void @llvm.memset.p0i8.i64(i8* %scevgep6869.i.15, i8 0, i64 256, i32 16, i1 false) #4, !dbg !99
  %scevgep68.i.16 = getelementptr [512 x [512 x i64]], [512 x [512 x i64]]* @C, i64 0, i64 %33, i64 %49, !dbg !99
  %scevgep6869.i.16 = bitcast i64* %scevgep68.i.16 to i8*, !dbg !99
  tail call void @llvm.memset.p0i8.i64(i8* %scevgep6869.i.16, i8 0, i64 256, i32 16, i1 false) #4, !dbg !99
  %scevgep68.i.17 = getelementptr [512 x [512 x i64]], [512 x [512 x i64]]* @C, i64 0, i64 %34, i64 %49, !dbg !99
  %scevgep6869.i.17 = bitcast i64* %scevgep68.i.17 to i8*, !dbg !99
  tail call void @llvm.memset.p0i8.i64(i8* %scevgep6869.i.17, i8 0, i64 256, i32 16, i1 false) #4, !dbg !99
  %scevgep68.i.18 = getelementptr [512 x [512 x i64]], [512 x [512 x i64]]* @C, i64 0, i64 %35, i64 %49, !dbg !99
  %scevgep6869.i.18 = bitcast i64* %scevgep68.i.18 to i8*, !dbg !99
  tail call void @llvm.memset.p0i8.i64(i8* %scevgep6869.i.18, i8 0, i64 256, i32 16, i1 false) #4, !dbg !99
  %scevgep68.i.19 = getelementptr [512 x [512 x i64]], [512 x [512 x i64]]* @C, i64 0, i64 %36, i64 %49, !dbg !99
  %scevgep6869.i.19 = bitcast i64* %scevgep68.i.19 to i8*, !dbg !99
  tail call void @llvm.memset.p0i8.i64(i8* %scevgep6869.i.19, i8 0, i64 256, i32 16, i1 false) #4, !dbg !99
  %scevgep68.i.20 = getelementptr [512 x [512 x i64]], [512 x [512 x i64]]* @C, i64 0, i64 %37, i64 %49, !dbg !99
  %scevgep6869.i.20 = bitcast i64* %scevgep68.i.20 to i8*, !dbg !99
  tail call void @llvm.memset.p0i8.i64(i8* %scevgep6869.i.20, i8 0, i64 256, i32 16, i1 false) #4, !dbg !99
  %scevgep68.i.21 = getelementptr [512 x [512 x i64]], [512 x [512 x i64]]* @C, i64 0, i64 %38, i64 %49, !dbg !99
  %scevgep6869.i.21 = bitcast i64* %scevgep68.i.21 to i8*, !dbg !99
  tail call void @llvm.memset.p0i8.i64(i8* %scevgep6869.i.21, i8 0, i64 256, i32 16, i1 false) #4, !dbg !99
  %scevgep68.i.22 = getelementptr [512 x [512 x i64]], [512 x [512 x i64]]* @C, i64 0, i64 %39, i64 %49, !dbg !99
  %scevgep6869.i.22 = bitcast i64* %scevgep68.i.22 to i8*, !dbg !99
  tail call void @llvm.memset.p0i8.i64(i8* %scevgep6869.i.22, i8 0, i64 256, i32 16, i1 false) #4, !dbg !99
  %scevgep68.i.23 = getelementptr [512 x [512 x i64]], [512 x [512 x i64]]* @C, i64 0, i64 %40, i64 %49, !dbg !99
  %scevgep6869.i.23 = bitcast i64* %scevgep68.i.23 to i8*, !dbg !99
  tail call void @llvm.memset.p0i8.i64(i8* %scevgep6869.i.23, i8 0, i64 256, i32 16, i1 false) #4, !dbg !99
  %scevgep68.i.24 = getelementptr [512 x [512 x i64]], [512 x [512 x i64]]* @C, i64 0, i64 %41, i64 %49, !dbg !99
  %scevgep6869.i.24 = bitcast i64* %scevgep68.i.24 to i8*, !dbg !99
  tail call void @llvm.memset.p0i8.i64(i8* %scevgep6869.i.24, i8 0, i64 256, i32 16, i1 false) #4, !dbg !99
  %scevgep68.i.25 = getelementptr [512 x [512 x i64]], [512 x [512 x i64]]* @C, i64 0, i64 %42, i64 %49, !dbg !99
  %scevgep6869.i.25 = bitcast i64* %scevgep68.i.25 to i8*, !dbg !99
  tail call void @llvm.memset.p0i8.i64(i8* %scevgep6869.i.25, i8 0, i64 256, i32 16, i1 false) #4, !dbg !99
  %scevgep68.i.26 = getelementptr [512 x [512 x i64]], [512 x [512 x i64]]* @C, i64 0, i64 %43, i64 %49, !dbg !99
  %scevgep6869.i.26 = bitcast i64* %scevgep68.i.26 to i8*, !dbg !99
  tail call void @llvm.memset.p0i8.i64(i8* %scevgep6869.i.26, i8 0, i64 256, i32 16, i1 false) #4, !dbg !99
  %scevgep68.i.27 = getelementptr [512 x [512 x i64]], [512 x [512 x i64]]* @C, i64 0, i64 %44, i64 %49, !dbg !99
  %scevgep6869.i.27 = bitcast i64* %scevgep68.i.27 to i8*, !dbg !99
  tail call void @llvm.memset.p0i8.i64(i8* %scevgep6869.i.27, i8 0, i64 256, i32 16, i1 false) #4, !dbg !99
  %scevgep68.i.28 = getelementptr [512 x [512 x i64]], [512 x [512 x i64]]* @C, i64 0, i64 %45, i64 %49, !dbg !99
  %scevgep6869.i.28 = bitcast i64* %scevgep68.i.28 to i8*, !dbg !99
  tail call void @llvm.memset.p0i8.i64(i8* %scevgep6869.i.28, i8 0, i64 256, i32 16, i1 false) #4, !dbg !99
  %scevgep68.i.29 = getelementptr [512 x [512 x i64]], [512 x [512 x i64]]* @C, i64 0, i64 %46, i64 %49, !dbg !99
  %scevgep6869.i.29 = bitcast i64* %scevgep68.i.29 to i8*, !dbg !99
  tail call void @llvm.memset.p0i8.i64(i8* %scevgep6869.i.29, i8 0, i64 256, i32 16, i1 false) #4, !dbg !99
  %scevgep68.i.30 = getelementptr [512 x [512 x i64]], [512 x [512 x i64]]* @C, i64 0, i64 %47, i64 %49, !dbg !99
  %scevgep6869.i.30 = bitcast i64* %scevgep68.i.30 to i8*, !dbg !99
  tail call void @llvm.memset.p0i8.i64(i8* %scevgep6869.i.30, i8 0, i64 256, i32 16, i1 false) #4, !dbg !99
  %scevgep68.i.31 = getelementptr [512 x [512 x i64]], [512 x [512 x i64]]* @C, i64 0, i64 %48, i64 %49, !dbg !99
  %scevgep6869.i.31 = bitcast i64* %scevgep68.i.31 to i8*, !dbg !99
  tail call void @llvm.memset.p0i8.i64(i8* %scevgep6869.i.31, i8 0, i64 256, i32 16, i1 false) #4, !dbg !99
  %polly.indvar_next5.i = add nuw nsw i64 %polly.indvar4.i, 1, !dbg !99
  %exitcond71.i = icmp eq i64 %polly.indvar_next5.i, 16, !dbg !99
  br i1 %exitcond71.i, label %polly.loop_exit3.i, label %polly.loop_preheader8.i, !dbg !99

polly.loop_exit27.i:                              ; preds = %polly.loop_exit33.i
  %polly.indvar_next23.i = add nuw nsw i64 %polly.indvar22.i, 1, !dbg !99
  %exitcond66.i = icmp eq i64 %polly.indvar_next23.i, 16, !dbg !99
  br i1 %exitcond66.i, label %mat_mult.exit, label %polly.loop_preheader26.i, !dbg !99

polly.loop_exit33.i:                              ; preds = %polly.loop_exit39.i
  %polly.indvar_next29.i = add nuw nsw i64 %polly.indvar28.i, 1, !dbg !99
  %exitcond65.i = icmp eq i64 %polly.indvar_next29.i, 16, !dbg !99
  br i1 %exitcond65.i, label %polly.loop_exit27.i, label %polly.loop_preheader32.i, !dbg !99

polly.loop_preheader26.i:                         ; preds = %polly.loop_preheader26.i.preheader, %polly.loop_exit27.i
  %polly.indvar22.i = phi i64 [ %polly.indvar_next23.i, %polly.loop_exit27.i ], [ 0, %polly.loop_preheader26.i.preheader ], !dbg !99
  %50 = shl nsw i64 %polly.indvar22.i, 5, !dbg !99
  br label %polly.loop_preheader32.i, !dbg !99

polly.loop_exit39.i:                              ; preds = %polly.loop_exit45.i
  %polly.indvar_next35.i = add nuw nsw i64 %polly.indvar34.i, 1, !dbg !99
  %exitcond64.i = icmp eq i64 %polly.indvar_next35.i, 16, !dbg !99
  br i1 %exitcond64.i, label %polly.loop_exit33.i, label %polly.loop_preheader38.i, !dbg !99

polly.loop_preheader32.i:                         ; preds = %polly.loop_preheader26.i, %polly.loop_exit33.i
  %polly.indvar28.i = phi i64 [ 0, %polly.loop_preheader26.i ], [ %polly.indvar_next29.i, %polly.loop_exit33.i ], !dbg !99
  %51 = shl nsw i64 %polly.indvar28.i, 5, !dbg !99
  br label %polly.loop_preheader38.i, !dbg !99

polly.loop_exit45.i:                              ; preds = %polly.loop_exit51.i
  %polly.indvar_next41.i = add nuw nsw i64 %polly.indvar40.i, 1, !dbg !99
  %exitcond63.i = icmp eq i64 %polly.indvar_next41.i, 32, !dbg !99
  br i1 %exitcond63.i, label %polly.loop_exit39.i, label %polly.loop_preheader44.i, !dbg !99

polly.loop_preheader38.i:                         ; preds = %polly.loop_preheader32.i, %polly.loop_exit39.i
  %polly.indvar34.i = phi i64 [ 0, %polly.loop_preheader32.i ], [ %polly.indvar_next35.i, %polly.loop_exit39.i ], !dbg !99
  %52 = shl nsw i64 %polly.indvar34.i, 5, !dbg !99
  br label %polly.loop_preheader44.i, !dbg !99

polly.loop_exit51.i:                              ; preds = %polly.loop_header49.i
  %p_add.i.1.lcssa = phi i64 [ %p_add.i.1, %polly.loop_header49.i ]
  store i64 %p_add.i.1.lcssa, i64* %scevgep55.i, align 8, !dbg !99, !alias.scope !100, !noalias !102
  %polly.indvar_next47.i = add nuw nsw i64 %polly.indvar46.i, 1, !dbg !99
  %exitcond62.i = icmp eq i64 %polly.indvar_next47.i, 32, !dbg !99
  br i1 %exitcond62.i, label %polly.loop_exit45.i, label %polly.loop_preheader50.i, !dbg !99

polly.loop_preheader44.i:                         ; preds = %polly.loop_preheader38.i, %polly.loop_exit45.i
  %polly.indvar40.i = phi i64 [ 0, %polly.loop_preheader38.i ], [ %polly.indvar_next41.i, %polly.loop_exit45.i ], !dbg !99
  %53 = add nuw nsw i64 %polly.indvar40.i, %50, !dbg !99
  br label %polly.loop_preheader50.i, !dbg !99

polly.loop_header49.i:                            ; preds = %polly.loop_header49.i, %polly.loop_preheader50.i
  %p_add61.i = phi i64 [ %scevgep55.promoted.i, %polly.loop_preheader50.i ], [ %p_add.i.1, %polly.loop_header49.i ], !dbg !99
  %polly.indvar52.i = phi i64 [ 0, %polly.loop_preheader50.i ], [ %polly.indvar_next53.i.1, %polly.loop_header49.i ], !dbg !99
  %54 = add nuw nsw i64 %polly.indvar52.i, %52, !dbg !99
  %scevgep56.i = getelementptr [512 x [512 x i64]], [512 x [512 x i64]]* @A, i64 0, i64 %53, i64 %54, !dbg !99
  %_p_scalar_57.i = load i64, i64* %scevgep56.i, align 16, !dbg !99, !alias.scope !103, !noalias !105
  %scevgep58.i = getelementptr [512 x [512 x i64]], [512 x [512 x i64]]* @B, i64 0, i64 %54, i64 %56, !dbg !99
  %_p_scalar_59.i = load i64, i64* %scevgep58.i, align 8, !dbg !99, !alias.scope !104, !noalias !106
  %p_mul.i = mul nsw i64 %_p_scalar_59.i, %_p_scalar_57.i, !dbg !107
  %p_add.i = add nsw i64 %p_mul.i, %p_add61.i, !dbg !109
  %polly.indvar_next53.i = or i64 %polly.indvar52.i, 1, !dbg !99
  %55 = add nuw nsw i64 %polly.indvar_next53.i, %52, !dbg !99
  %scevgep56.i.1 = getelementptr [512 x [512 x i64]], [512 x [512 x i64]]* @A, i64 0, i64 %53, i64 %55, !dbg !99
  %_p_scalar_57.i.1 = load i64, i64* %scevgep56.i.1, align 8, !dbg !99, !alias.scope !103, !noalias !105
  %scevgep58.i.1 = getelementptr [512 x [512 x i64]], [512 x [512 x i64]]* @B, i64 0, i64 %55, i64 %56, !dbg !99
  %_p_scalar_59.i.1 = load i64, i64* %scevgep58.i.1, align 8, !dbg !99, !alias.scope !104, !noalias !106
  %p_mul.i.1 = mul nsw i64 %_p_scalar_59.i.1, %_p_scalar_57.i.1, !dbg !107
  %p_add.i.1 = add nsw i64 %p_mul.i.1, %p_add.i, !dbg !109
  %polly.indvar_next53.i.1 = add nsw i64 %polly.indvar52.i, 2, !dbg !99
  %exitcond.i1.1 = icmp eq i64 %polly.indvar_next53.i.1, 32, !dbg !99
  br i1 %exitcond.i1.1, label %polly.loop_exit51.i, label %polly.loop_header49.i, !dbg !99

polly.loop_preheader50.i:                         ; preds = %polly.loop_preheader44.i, %polly.loop_exit51.i
  %polly.indvar46.i = phi i64 [ 0, %polly.loop_preheader44.i ], [ %polly.indvar_next47.i, %polly.loop_exit51.i ], !dbg !99
  %56 = add nuw nsw i64 %polly.indvar46.i, %51, !dbg !99
  %scevgep55.i = getelementptr [512 x [512 x i64]], [512 x [512 x i64]]* @C, i64 0, i64 %53, i64 %56, !dbg !99
  %scevgep55.promoted.i = load i64, i64* %scevgep55.i, align 8, !dbg !99, !alias.scope !100, !noalias !102
  br label %polly.loop_header49.i, !dbg !99

mat_mult.exit:                                    ; preds = %polly.loop_exit27.i
  %57 = load i64, i64* getelementptr inbounds ([512 x [512 x i64]], [512 x [512 x i64]]* @C, i64 0, i64 511, i64 511), align 8, !dbg !110
  %call = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([49 x i8], [49 x i8]* @.str.2, i64 0, i64 0), i32 512, i32 512, i64 %57) #4, !dbg !111
  ret i32 0, !dbg !112
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
!48 = distinct !{!48, !49, !"polly.alias.scope.C"}
!49 = distinct !{!49, !"polly.alias.scope.domain"}
!50 = !{!51, !52}
!51 = distinct !{!51, !49, !"polly.alias.scope.A"}
!52 = distinct !{!52, !49, !"polly.alias.scope.B"}
!53 = !{!52, !48}
!54 = !{!51, !48}
!55 = !DILocation(line: 25, column: 45, scope: !56)
!56 = distinct !DILexicalBlock(scope: !57, file: !1, line: 24, column: 13)
!57 = distinct !DILexicalBlock(scope: !58, file: !1, line: 24, column: 13)
!58 = distinct !DILexicalBlock(scope: !59, file: !1, line: 22, column: 29)
!59 = distinct !DILexicalBlock(scope: !60, file: !1, line: 22, column: 9)
!60 = distinct !DILexicalBlock(scope: !61, file: !1, line: 22, column: 9)
!61 = distinct !DILexicalBlock(scope: !62, file: !1, line: 21, column: 25)
!62 = distinct !DILexicalBlock(scope: !63, file: !1, line: 21, column: 5)
!63 = distinct !DILexicalBlock(scope: !7, file: !1, line: 21, column: 5)
!64 = !DILocation(line: 25, column: 35, scope: !56)
!65 = !DILocation(line: 33, column: 9, scope: !8)
!66 = !DILocalVariable(name: "i", scope: !8, file: !1, line: 33, type: !12)
!67 = !DILocation(line: 35, column: 5, scope: !68)
!68 = !DILexicalBlockFile(scope: !69, file: !1, discriminator: 1)
!69 = distinct !DILexicalBlock(scope: !70, file: !1, line: 35, column: 5)
!70 = distinct !DILexicalBlock(scope: !8, file: !1, line: 35, column: 5)
!71 = !DILocation(line: 37, column: 21, scope: !72)
!72 = distinct !DILexicalBlock(scope: !73, file: !1, line: 36, column: 29)
!73 = distinct !DILexicalBlock(scope: !74, file: !1, line: 36, column: 9)
!74 = distinct !DILexicalBlock(scope: !75, file: !1, line: 36, column: 9)
!75 = distinct !DILexicalBlock(scope: !69, file: !1, line: 35, column: 25)
!76 = !DILocation(line: 36, column: 9, scope: !77)
!77 = !DILexicalBlockFile(scope: !73, file: !1, discriminator: 1)
!78 = !DILocation(line: 37, column: 38, scope: !72)
!79 = !DILocation(line: 37, column: 13, scope: !72)
!80 = !DILocation(line: 38, column: 18, scope: !81)
!81 = distinct !DILexicalBlock(scope: !72, file: !1, line: 38, column: 17)
!82 = !DILocation(line: 38, column: 22, scope: !81)
!83 = !DILocation(line: 38, column: 17, scope: !72)
!84 = !DILocation(line: 38, column: 37, scope: !85)
!85 = !DILexicalBlockFile(scope: !81, file: !1, discriminator: 1)
!86 = !DILocation(line: 38, column: 29, scope: !85)
!87 = !DILocation(line: 40, column: 9, scope: !75)
!88 = !DILocation(line: 42, column: 1, scope: !8)
!89 = !DILocation(line: 9, column: 9, scope: !4, inlinedAt: !90)
!90 = distinct !DILocation(line: 51, column: 5, scope: !9)
!91 = !DILocation(line: 11, column: 5, scope: !28, inlinedAt: !90)
!92 = !DILocation(line: 51, column: 5, scope: !9)
!93 = !DILocation(line: 12, column: 9, scope: !32, inlinedAt: !90)
!94 = !DILocation(line: 13, column: 13, scope: !37, inlinedAt: !90)
!95 = !DILocation(line: 13, column: 21, scope: !37, inlinedAt: !90)
!96 = !DILocation(line: 14, column: 13, scope: !37, inlinedAt: !90)
!97 = !DILocation(line: 14, column: 21, scope: !37, inlinedAt: !90)
!98 = distinct !{!98, !42, !43}
!99 = !DILocation(line: 52, column: 5, scope: !9)
!100 = distinct !{!100, !101, !"polly.alias.scope.C"}
!101 = distinct !{!101, !"polly.alias.scope.domain"}
!102 = !{!103, !104}
!103 = distinct !{!103, !101, !"polly.alias.scope.A"}
!104 = distinct !{!104, !101, !"polly.alias.scope.B"}
!105 = !{!104, !100}
!106 = !{!103, !100}
!107 = !DILocation(line: 25, column: 45, scope: !56, inlinedAt: !108)
!108 = distinct !DILocation(line: 52, column: 5, scope: !9)
!109 = !DILocation(line: 25, column: 35, scope: !56, inlinedAt: !108)
!110 = !DILocation(line: 55, column: 71, scope: !9)
!111 = !DILocation(line: 55, column: 5, scope: !9)
!112 = !DILocation(line: 56, column: 5, scope: !9)
