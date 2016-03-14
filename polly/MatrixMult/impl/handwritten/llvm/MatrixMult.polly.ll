; ModuleID = 'MatrixMult.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@R = common global [512 x [512 x i32]] zeroinitializer, align 16
@A = common global [512 x [512 x i32]] zeroinitializer, align 16
@B = common global [512 x [512 x i32]] zeroinitializer, align 16
@C = common global [512 x [512 x i32]] zeroinitializer, align 16
@.str = private unnamed_addr constant [32 x i8] c"Pass %d X %d matrix test case \0A\00", align 1
@.str.1 = private unnamed_addr constant [47 x i8] c"A[%d][%d] = %d, B[%d][%d] =%d, C[%d][%d] =%d \0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define void @init() #0 !dbg !6 {
entry:
  %call = tail call i64 @time(i64* null) #6, !dbg !32
  %conv = trunc i64 %call to i32, !dbg !33
  tail call void @srand(i32 %conv) #6, !dbg !34
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !10, metadata !36), !dbg !37
  br label %for.cond2.preheader, !dbg !38

for.cond2.preheader:                              ; preds = %for.inc9, %entry
  %indvars.iv70 = phi i64 [ 0, %entry ], [ %indvars.iv.next71, %for.inc9 ]
  br label %for.body5, !dbg !42

for.body5:                                        ; preds = %for.body5, %for.cond2.preheader
  %indvars.iv67 = phi i64 [ 0, %for.cond2.preheader ], [ %indvars.iv.next68, %for.body5 ]
  %call6 = tail call i32 @rand() #6, !dbg !47
  %rem = srem i32 %call6, 100, !dbg !49
  %arrayidx8 = getelementptr inbounds [512 x [512 x i32]], [512 x [512 x i32]]* @R, i64 0, i64 %indvars.iv70, i64 %indvars.iv67, !dbg !50
  store i32 %rem, i32* %arrayidx8, align 4, !dbg !51, !tbaa !52
  %indvars.iv.next68 = add nuw nsw i64 %indvars.iv67, 1, !dbg !42
  %exitcond69 = icmp eq i64 %indvars.iv.next68, 512, !dbg !42
  br i1 %exitcond69, label %for.inc9, label %for.body5, !dbg !42

for.inc9:                                         ; preds = %for.body5
  %indvars.iv.next71 = add nuw nsw i64 %indvars.iv70, 1, !dbg !38
  %exitcond72 = icmp eq i64 %indvars.iv.next71, 512, !dbg !38
  br i1 %exitcond72, label %polly.loop_preheader74.preheader, label %for.cond2.preheader, !dbg !38

polly.loop_preheader74.preheader:                 ; preds = %for.inc9
  br label %polly.loop_preheader74

polly.exiting:                                    ; preds = %polly.loop_exit75
  ret void, !dbg !56

polly.loop_exit75:                                ; preds = %polly.loop_exit81
  %polly.indvar_next = add nuw nsw i64 %polly.indvar, 1
  %exitcond99 = icmp eq i64 %polly.indvar_next, 16
  br i1 %exitcond99, label %polly.exiting, label %polly.loop_preheader74

polly.loop_exit81:                                ; preds = %polly.loop_exit87
  %polly.indvar_next77 = add nuw nsw i64 %polly.indvar76, 1
  %exitcond98 = icmp eq i64 %polly.indvar_next77, 16
  br i1 %exitcond98, label %polly.loop_exit75, label %polly.loop_preheader80

polly.loop_preheader74:                           ; preds = %polly.loop_preheader74.preheader, %polly.loop_exit75
  %polly.indvar = phi i64 [ %polly.indvar_next, %polly.loop_exit75 ], [ 0, %polly.loop_preheader74.preheader ]
  %0 = shl i64 %polly.indvar, 5
  br label %polly.loop_preheader80

polly.loop_exit87:                                ; preds = %polly.loop_header85
  %polly.indvar_next83 = add nuw nsw i64 %polly.indvar82, 1
  %exitcond97 = icmp eq i64 %polly.indvar_next83, 32
  br i1 %exitcond97, label %polly.loop_exit81, label %polly.loop_preheader86

polly.loop_preheader80:                           ; preds = %polly.loop_exit81, %polly.loop_preheader74
  %polly.indvar76 = phi i64 [ 0, %polly.loop_preheader74 ], [ %polly.indvar_next77, %polly.loop_exit81 ]
  %1 = shl i64 %polly.indvar76, 5
  br label %polly.loop_preheader86

polly.loop_header85:                              ; preds = %polly.loop_header85, %polly.loop_preheader86
  %polly.indvar88 = phi i64 [ 0, %polly.loop_preheader86 ], [ %polly.indvar_next89.1, %polly.loop_header85 ]
  %2 = add nuw nsw i64 %polly.indvar88, %1
  %scevgep = getelementptr [512 x [512 x i32]], [512 x [512 x i32]]* @R, i64 0, i64 %4, i64 %2
  %_p_scalar_ = load i32, i32* %scevgep, align 8, !alias.scope !57, !noalias !59
  %p_sub = sub nsw i32 100, %_p_scalar_, !dbg !62
  %scevgep92 = getelementptr [512 x [512 x i32]], [512 x [512 x i32]]* @B, i64 0, i64 %4, i64 %2
  store i32 %p_sub, i32* %scevgep92, align 8, !alias.scope !60, !noalias !69
  %polly.indvar_next89 = or i64 %polly.indvar88, 1
  %3 = add nuw nsw i64 %polly.indvar_next89, %1
  %scevgep.1 = getelementptr [512 x [512 x i32]], [512 x [512 x i32]]* @R, i64 0, i64 %4, i64 %3
  %_p_scalar_.1 = load i32, i32* %scevgep.1, align 4, !alias.scope !57, !noalias !59
  %p_sub.1 = sub nsw i32 100, %_p_scalar_.1, !dbg !62
  %scevgep92.1 = getelementptr [512 x [512 x i32]], [512 x [512 x i32]]* @B, i64 0, i64 %4, i64 %3
  store i32 %p_sub.1, i32* %scevgep92.1, align 4, !alias.scope !60, !noalias !69
  %polly.indvar_next89.1 = add nsw i64 %polly.indvar88, 2
  %exitcond.1 = icmp eq i64 %polly.indvar_next89.1, 32
  br i1 %exitcond.1, label %polly.loop_exit87, label %polly.loop_header85

polly.loop_preheader86:                           ; preds = %polly.loop_exit87, %polly.loop_preheader80
  %polly.indvar82 = phi i64 [ 0, %polly.loop_preheader80 ], [ %polly.indvar_next83, %polly.loop_exit87 ]
  %4 = add nuw nsw i64 %0, %polly.indvar82
  %scevgep93 = getelementptr [512 x [512 x i32]], [512 x [512 x i32]]* @A, i64 0, i64 %4, i64 %1
  %scevgep9394 = bitcast i32* %scevgep93 to i8*
  %scevgep95 = getelementptr [512 x [512 x i32]], [512 x [512 x i32]]* @R, i64 0, i64 %4, i64 %1
  %scevgep9596 = bitcast i32* %scevgep95 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %scevgep9394, i8* %scevgep9596, i64 128, i32 16, i1 false)
  br label %polly.loop_header85
}

; Function Attrs: nounwind
declare void @srand(i32) #1

; Function Attrs: nounwind
declare i64 @time(i64*) #1

; Function Attrs: nounwind
declare i32 @rand() #1

; Function Attrs: nounwind uwtable
define void @mat_mult() #2 !dbg !13 {
entry:
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !15, metadata !36), !dbg !70
  br label %polly.loop_preheader56

polly.exiting:                                    ; preds = %polly.loop_exit81
  ret void, !dbg !71

polly.loop_exit57:                                ; preds = %polly.loop_preheader68
  %polly.indvar_next = add nuw nsw i64 %polly.indvar, 1
  %exitcond125 = icmp eq i64 %polly.indvar_next, 16
  br i1 %exitcond125, label %polly.loop_preheader80.preheader, label %polly.loop_preheader56

polly.loop_preheader80.preheader:                 ; preds = %polly.loop_exit57
  br label %polly.loop_preheader80

polly.loop_preheader56:                           ; preds = %polly.loop_exit57, %entry
  %polly.indvar = phi i64 [ 0, %entry ], [ %polly.indvar_next, %polly.loop_exit57 ]
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
  br label %polly.loop_preheader62

polly.loop_preheader62:                           ; preds = %polly.loop_preheader68, %polly.loop_preheader56
  %polly.indvar58 = phi i64 [ 0, %polly.loop_preheader56 ], [ %polly.indvar_next59, %polly.loop_preheader68 ]
  %32 = shl i64 %polly.indvar58, 5
  br label %polly.loop_preheader68

polly.loop_preheader68:                           ; preds = %polly.loop_preheader62
  %scevgep121 = getelementptr [512 x [512 x i32]], [512 x [512 x i32]]* @C, i64 0, i64 %0, i64 %32
  %scevgep121122 = bitcast i32* %scevgep121 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep121122, i8 0, i64 128, i32 16, i1 false)
  %scevgep121.1 = getelementptr [512 x [512 x i32]], [512 x [512 x i32]]* @C, i64 0, i64 %1, i64 %32
  %scevgep121122.1 = bitcast i32* %scevgep121.1 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep121122.1, i8 0, i64 128, i32 16, i1 false)
  %scevgep121.2 = getelementptr [512 x [512 x i32]], [512 x [512 x i32]]* @C, i64 0, i64 %2, i64 %32
  %scevgep121122.2 = bitcast i32* %scevgep121.2 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep121122.2, i8 0, i64 128, i32 16, i1 false)
  %scevgep121.3 = getelementptr [512 x [512 x i32]], [512 x [512 x i32]]* @C, i64 0, i64 %3, i64 %32
  %scevgep121122.3 = bitcast i32* %scevgep121.3 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep121122.3, i8 0, i64 128, i32 16, i1 false)
  %scevgep121.4 = getelementptr [512 x [512 x i32]], [512 x [512 x i32]]* @C, i64 0, i64 %4, i64 %32
  %scevgep121122.4 = bitcast i32* %scevgep121.4 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep121122.4, i8 0, i64 128, i32 16, i1 false)
  %scevgep121.5 = getelementptr [512 x [512 x i32]], [512 x [512 x i32]]* @C, i64 0, i64 %5, i64 %32
  %scevgep121122.5 = bitcast i32* %scevgep121.5 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep121122.5, i8 0, i64 128, i32 16, i1 false)
  %scevgep121.6 = getelementptr [512 x [512 x i32]], [512 x [512 x i32]]* @C, i64 0, i64 %6, i64 %32
  %scevgep121122.6 = bitcast i32* %scevgep121.6 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep121122.6, i8 0, i64 128, i32 16, i1 false)
  %scevgep121.7 = getelementptr [512 x [512 x i32]], [512 x [512 x i32]]* @C, i64 0, i64 %7, i64 %32
  %scevgep121122.7 = bitcast i32* %scevgep121.7 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep121122.7, i8 0, i64 128, i32 16, i1 false)
  %scevgep121.8 = getelementptr [512 x [512 x i32]], [512 x [512 x i32]]* @C, i64 0, i64 %8, i64 %32
  %scevgep121122.8 = bitcast i32* %scevgep121.8 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep121122.8, i8 0, i64 128, i32 16, i1 false)
  %scevgep121.9 = getelementptr [512 x [512 x i32]], [512 x [512 x i32]]* @C, i64 0, i64 %9, i64 %32
  %scevgep121122.9 = bitcast i32* %scevgep121.9 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep121122.9, i8 0, i64 128, i32 16, i1 false)
  %scevgep121.10 = getelementptr [512 x [512 x i32]], [512 x [512 x i32]]* @C, i64 0, i64 %10, i64 %32
  %scevgep121122.10 = bitcast i32* %scevgep121.10 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep121122.10, i8 0, i64 128, i32 16, i1 false)
  %scevgep121.11 = getelementptr [512 x [512 x i32]], [512 x [512 x i32]]* @C, i64 0, i64 %11, i64 %32
  %scevgep121122.11 = bitcast i32* %scevgep121.11 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep121122.11, i8 0, i64 128, i32 16, i1 false)
  %scevgep121.12 = getelementptr [512 x [512 x i32]], [512 x [512 x i32]]* @C, i64 0, i64 %12, i64 %32
  %scevgep121122.12 = bitcast i32* %scevgep121.12 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep121122.12, i8 0, i64 128, i32 16, i1 false)
  %scevgep121.13 = getelementptr [512 x [512 x i32]], [512 x [512 x i32]]* @C, i64 0, i64 %13, i64 %32
  %scevgep121122.13 = bitcast i32* %scevgep121.13 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep121122.13, i8 0, i64 128, i32 16, i1 false)
  %scevgep121.14 = getelementptr [512 x [512 x i32]], [512 x [512 x i32]]* @C, i64 0, i64 %14, i64 %32
  %scevgep121122.14 = bitcast i32* %scevgep121.14 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep121122.14, i8 0, i64 128, i32 16, i1 false)
  %scevgep121.15 = getelementptr [512 x [512 x i32]], [512 x [512 x i32]]* @C, i64 0, i64 %15, i64 %32
  %scevgep121122.15 = bitcast i32* %scevgep121.15 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep121122.15, i8 0, i64 128, i32 16, i1 false)
  %scevgep121.16 = getelementptr [512 x [512 x i32]], [512 x [512 x i32]]* @C, i64 0, i64 %16, i64 %32
  %scevgep121122.16 = bitcast i32* %scevgep121.16 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep121122.16, i8 0, i64 128, i32 16, i1 false)
  %scevgep121.17 = getelementptr [512 x [512 x i32]], [512 x [512 x i32]]* @C, i64 0, i64 %17, i64 %32
  %scevgep121122.17 = bitcast i32* %scevgep121.17 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep121122.17, i8 0, i64 128, i32 16, i1 false)
  %scevgep121.18 = getelementptr [512 x [512 x i32]], [512 x [512 x i32]]* @C, i64 0, i64 %18, i64 %32
  %scevgep121122.18 = bitcast i32* %scevgep121.18 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep121122.18, i8 0, i64 128, i32 16, i1 false)
  %scevgep121.19 = getelementptr [512 x [512 x i32]], [512 x [512 x i32]]* @C, i64 0, i64 %19, i64 %32
  %scevgep121122.19 = bitcast i32* %scevgep121.19 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep121122.19, i8 0, i64 128, i32 16, i1 false)
  %scevgep121.20 = getelementptr [512 x [512 x i32]], [512 x [512 x i32]]* @C, i64 0, i64 %20, i64 %32
  %scevgep121122.20 = bitcast i32* %scevgep121.20 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep121122.20, i8 0, i64 128, i32 16, i1 false)
  %scevgep121.21 = getelementptr [512 x [512 x i32]], [512 x [512 x i32]]* @C, i64 0, i64 %21, i64 %32
  %scevgep121122.21 = bitcast i32* %scevgep121.21 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep121122.21, i8 0, i64 128, i32 16, i1 false)
  %scevgep121.22 = getelementptr [512 x [512 x i32]], [512 x [512 x i32]]* @C, i64 0, i64 %22, i64 %32
  %scevgep121122.22 = bitcast i32* %scevgep121.22 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep121122.22, i8 0, i64 128, i32 16, i1 false)
  %scevgep121.23 = getelementptr [512 x [512 x i32]], [512 x [512 x i32]]* @C, i64 0, i64 %23, i64 %32
  %scevgep121122.23 = bitcast i32* %scevgep121.23 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep121122.23, i8 0, i64 128, i32 16, i1 false)
  %scevgep121.24 = getelementptr [512 x [512 x i32]], [512 x [512 x i32]]* @C, i64 0, i64 %24, i64 %32
  %scevgep121122.24 = bitcast i32* %scevgep121.24 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep121122.24, i8 0, i64 128, i32 16, i1 false)
  %scevgep121.25 = getelementptr [512 x [512 x i32]], [512 x [512 x i32]]* @C, i64 0, i64 %25, i64 %32
  %scevgep121122.25 = bitcast i32* %scevgep121.25 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep121122.25, i8 0, i64 128, i32 16, i1 false)
  %scevgep121.26 = getelementptr [512 x [512 x i32]], [512 x [512 x i32]]* @C, i64 0, i64 %26, i64 %32
  %scevgep121122.26 = bitcast i32* %scevgep121.26 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep121122.26, i8 0, i64 128, i32 16, i1 false)
  %scevgep121.27 = getelementptr [512 x [512 x i32]], [512 x [512 x i32]]* @C, i64 0, i64 %27, i64 %32
  %scevgep121122.27 = bitcast i32* %scevgep121.27 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep121122.27, i8 0, i64 128, i32 16, i1 false)
  %scevgep121.28 = getelementptr [512 x [512 x i32]], [512 x [512 x i32]]* @C, i64 0, i64 %28, i64 %32
  %scevgep121122.28 = bitcast i32* %scevgep121.28 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep121122.28, i8 0, i64 128, i32 16, i1 false)
  %scevgep121.29 = getelementptr [512 x [512 x i32]], [512 x [512 x i32]]* @C, i64 0, i64 %29, i64 %32
  %scevgep121122.29 = bitcast i32* %scevgep121.29 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep121122.29, i8 0, i64 128, i32 16, i1 false)
  %scevgep121.30 = getelementptr [512 x [512 x i32]], [512 x [512 x i32]]* @C, i64 0, i64 %30, i64 %32
  %scevgep121122.30 = bitcast i32* %scevgep121.30 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep121122.30, i8 0, i64 128, i32 16, i1 false)
  %scevgep121.31 = getelementptr [512 x [512 x i32]], [512 x [512 x i32]]* @C, i64 0, i64 %31, i64 %32
  %scevgep121122.31 = bitcast i32* %scevgep121.31 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep121122.31, i8 0, i64 128, i32 16, i1 false)
  %polly.indvar_next59 = add nuw nsw i64 %polly.indvar58, 1
  %exitcond124 = icmp eq i64 %polly.indvar_next59, 16
  br i1 %exitcond124, label %polly.loop_exit57, label %polly.loop_preheader62

polly.loop_exit81:                                ; preds = %polly.loop_exit87
  %polly.indvar_next77 = add nuw nsw i64 %polly.indvar76, 1
  %exitcond119 = icmp eq i64 %polly.indvar_next77, 16
  br i1 %exitcond119, label %polly.exiting, label %polly.loop_preheader80

polly.loop_exit87:                                ; preds = %polly.loop_exit93
  %polly.indvar_next83 = add nuw nsw i64 %polly.indvar82, 1
  %exitcond118 = icmp eq i64 %polly.indvar_next83, 16
  br i1 %exitcond118, label %polly.loop_exit81, label %polly.loop_preheader86

polly.loop_preheader80:                           ; preds = %polly.loop_preheader80.preheader, %polly.loop_exit81
  %polly.indvar76 = phi i64 [ %polly.indvar_next77, %polly.loop_exit81 ], [ 0, %polly.loop_preheader80.preheader ]
  %33 = shl nsw i64 %polly.indvar76, 5
  br label %polly.loop_preheader86

polly.loop_exit93:                                ; preds = %polly.loop_exit99
  %polly.indvar_next89 = add nuw nsw i64 %polly.indvar88, 1
  %exitcond117 = icmp eq i64 %polly.indvar_next89, 16
  br i1 %exitcond117, label %polly.loop_exit87, label %polly.loop_preheader92

polly.loop_preheader86:                           ; preds = %polly.loop_exit87, %polly.loop_preheader80
  %polly.indvar82 = phi i64 [ 0, %polly.loop_preheader80 ], [ %polly.indvar_next83, %polly.loop_exit87 ]
  %34 = shl nsw i64 %polly.indvar82, 5
  br label %polly.loop_preheader92

polly.loop_exit99:                                ; preds = %polly.loop_exit105
  %polly.indvar_next95 = add nuw nsw i64 %polly.indvar94, 1
  %exitcond116 = icmp eq i64 %polly.indvar_next95, 32
  br i1 %exitcond116, label %polly.loop_exit93, label %polly.loop_preheader98

polly.loop_preheader92:                           ; preds = %polly.loop_exit93, %polly.loop_preheader86
  %polly.indvar88 = phi i64 [ 0, %polly.loop_preheader86 ], [ %polly.indvar_next89, %polly.loop_exit93 ]
  %35 = shl nsw i64 %polly.indvar88, 5
  br label %polly.loop_preheader98

polly.loop_exit105:                               ; preds = %polly.loop_header103
  %p_add.1.lcssa = phi i32 [ %p_add.1, %polly.loop_header103 ]
  store i32 %p_add.1.lcssa, i32* %scevgep109, align 4, !alias.scope !72, !noalias !74
  %polly.indvar_next101 = add nuw nsw i64 %polly.indvar100, 1
  %exitcond115 = icmp eq i64 %polly.indvar_next101, 32
  br i1 %exitcond115, label %polly.loop_exit99, label %polly.loop_preheader104

polly.loop_preheader98:                           ; preds = %polly.loop_exit99, %polly.loop_preheader92
  %polly.indvar94 = phi i64 [ 0, %polly.loop_preheader92 ], [ %polly.indvar_next95, %polly.loop_exit99 ]
  %36 = add nuw nsw i64 %polly.indvar94, %33
  br label %polly.loop_preheader104

polly.loop_header103:                             ; preds = %polly.loop_header103, %polly.loop_preheader104
  %p_add114 = phi i32 [ %scevgep109.promoted, %polly.loop_preheader104 ], [ %p_add.1, %polly.loop_header103 ]
  %polly.indvar106 = phi i64 [ 0, %polly.loop_preheader104 ], [ %polly.indvar_next107.1, %polly.loop_header103 ]
  %37 = add nuw nsw i64 %polly.indvar106, %35
  %scevgep110 = getelementptr [512 x [512 x i32]], [512 x [512 x i32]]* @A, i64 0, i64 %36, i64 %37
  %_p_scalar_111 = load i32, i32* %scevgep110, align 8, !alias.scope !76, !noalias !77
  %scevgep112 = getelementptr [512 x [512 x i32]], [512 x [512 x i32]]* @B, i64 0, i64 %37, i64 %39
  %_p_scalar_113 = load i32, i32* %scevgep112, align 4, !alias.scope !75, !noalias !78
  %p_mul = mul nsw i32 %_p_scalar_113, %_p_scalar_111, !dbg !79
  %p_add = add nsw i32 %p_mul, %p_add114, !dbg !88
  %polly.indvar_next107 = or i64 %polly.indvar106, 1
  %38 = add nuw nsw i64 %polly.indvar_next107, %35
  %scevgep110.1 = getelementptr [512 x [512 x i32]], [512 x [512 x i32]]* @A, i64 0, i64 %36, i64 %38
  %_p_scalar_111.1 = load i32, i32* %scevgep110.1, align 4, !alias.scope !76, !noalias !77
  %scevgep112.1 = getelementptr [512 x [512 x i32]], [512 x [512 x i32]]* @B, i64 0, i64 %38, i64 %39
  %_p_scalar_113.1 = load i32, i32* %scevgep112.1, align 4, !alias.scope !75, !noalias !78
  %p_mul.1 = mul nsw i32 %_p_scalar_113.1, %_p_scalar_111.1, !dbg !79
  %p_add.1 = add nsw i32 %p_mul.1, %p_add, !dbg !88
  %polly.indvar_next107.1 = add nsw i64 %polly.indvar106, 2
  %exitcond.1 = icmp eq i64 %polly.indvar_next107.1, 32
  br i1 %exitcond.1, label %polly.loop_exit105, label %polly.loop_header103

polly.loop_preheader104:                          ; preds = %polly.loop_exit105, %polly.loop_preheader98
  %polly.indvar100 = phi i64 [ 0, %polly.loop_preheader98 ], [ %polly.indvar_next101, %polly.loop_exit105 ]
  %39 = add nuw nsw i64 %polly.indvar100, %34
  %scevgep109 = getelementptr [512 x [512 x i32]], [512 x [512 x i32]]* @C, i64 0, i64 %36, i64 %39
  %scevgep109.promoted = load i32, i32* %scevgep109, align 4, !alias.scope !72, !noalias !74
  br label %polly.loop_header103
}

; Function Attrs: nounwind uwtable
define i32 @main() #3 !dbg !18 {
entry:
  tail call void @init(), !dbg !89
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !15, metadata !36) #6, !dbg !90
  br label %polly.loop_preheader56.i, !dbg !92

polly.loop_exit57.i:                              ; preds = %polly.loop_preheader62.i
  %polly.indvar_next.i = add nuw nsw i64 %polly.indvar.i, 1, !dbg !92
  %exitcond125.i = icmp eq i64 %polly.indvar_next.i, 16, !dbg !92
  br i1 %exitcond125.i, label %polly.loop_preheader80.i.preheader, label %polly.loop_preheader56.i, !dbg !92

polly.loop_preheader80.i.preheader:               ; preds = %polly.loop_exit57.i
  br label %polly.loop_preheader80.i, !dbg !92

polly.loop_preheader56.i:                         ; preds = %polly.loop_exit57.i, %entry
  %polly.indvar.i = phi i64 [ 0, %entry ], [ %polly.indvar_next.i, %polly.loop_exit57.i ], !dbg !92
  %0 = shl i64 %polly.indvar.i, 5, !dbg !92
  %1 = or i64 %0, 1, !dbg !92
  %2 = or i64 %0, 2, !dbg !92
  %3 = or i64 %0, 3, !dbg !92
  %4 = or i64 %0, 4, !dbg !92
  %5 = or i64 %0, 5, !dbg !92
  %6 = or i64 %0, 6, !dbg !92
  %7 = or i64 %0, 7, !dbg !92
  %8 = or i64 %0, 8, !dbg !92
  %9 = or i64 %0, 9, !dbg !92
  %10 = or i64 %0, 10, !dbg !92
  %11 = or i64 %0, 11, !dbg !92
  %12 = or i64 %0, 12, !dbg !92
  %13 = or i64 %0, 13, !dbg !92
  %14 = or i64 %0, 14, !dbg !92
  %15 = or i64 %0, 15, !dbg !92
  %16 = or i64 %0, 16, !dbg !92
  %17 = or i64 %0, 17, !dbg !92
  %18 = or i64 %0, 18, !dbg !92
  %19 = or i64 %0, 19, !dbg !92
  %20 = or i64 %0, 20, !dbg !92
  %21 = or i64 %0, 21, !dbg !92
  %22 = or i64 %0, 22, !dbg !92
  %23 = or i64 %0, 23, !dbg !92
  %24 = or i64 %0, 24, !dbg !92
  %25 = or i64 %0, 25, !dbg !92
  %26 = or i64 %0, 26, !dbg !92
  %27 = or i64 %0, 27, !dbg !92
  %28 = or i64 %0, 28, !dbg !92
  %29 = or i64 %0, 29, !dbg !92
  %30 = or i64 %0, 30, !dbg !92
  %31 = or i64 %0, 31, !dbg !92
  br label %polly.loop_preheader62.i, !dbg !92

polly.loop_preheader62.i:                         ; preds = %polly.loop_preheader56.i, %polly.loop_preheader62.i
  %polly.indvar58.i = phi i64 [ 0, %polly.loop_preheader56.i ], [ %polly.indvar_next59.i, %polly.loop_preheader62.i ], !dbg !92
  %32 = shl i64 %polly.indvar58.i, 5, !dbg !92
  %scevgep121.i = getelementptr [512 x [512 x i32]], [512 x [512 x i32]]* @C, i64 0, i64 %0, i64 %32, !dbg !92
  %scevgep121122.i = bitcast i32* %scevgep121.i to i8*, !dbg !92
  tail call void @llvm.memset.p0i8.i64(i8* %scevgep121122.i, i8 0, i64 128, i32 16, i1 false) #6, !dbg !92
  %scevgep121.i.1 = getelementptr [512 x [512 x i32]], [512 x [512 x i32]]* @C, i64 0, i64 %1, i64 %32, !dbg !92
  %scevgep121122.i.1 = bitcast i32* %scevgep121.i.1 to i8*, !dbg !92
  tail call void @llvm.memset.p0i8.i64(i8* %scevgep121122.i.1, i8 0, i64 128, i32 16, i1 false) #6, !dbg !92
  %scevgep121.i.2 = getelementptr [512 x [512 x i32]], [512 x [512 x i32]]* @C, i64 0, i64 %2, i64 %32, !dbg !92
  %scevgep121122.i.2 = bitcast i32* %scevgep121.i.2 to i8*, !dbg !92
  tail call void @llvm.memset.p0i8.i64(i8* %scevgep121122.i.2, i8 0, i64 128, i32 16, i1 false) #6, !dbg !92
  %scevgep121.i.3 = getelementptr [512 x [512 x i32]], [512 x [512 x i32]]* @C, i64 0, i64 %3, i64 %32, !dbg !92
  %scevgep121122.i.3 = bitcast i32* %scevgep121.i.3 to i8*, !dbg !92
  tail call void @llvm.memset.p0i8.i64(i8* %scevgep121122.i.3, i8 0, i64 128, i32 16, i1 false) #6, !dbg !92
  %scevgep121.i.4 = getelementptr [512 x [512 x i32]], [512 x [512 x i32]]* @C, i64 0, i64 %4, i64 %32, !dbg !92
  %scevgep121122.i.4 = bitcast i32* %scevgep121.i.4 to i8*, !dbg !92
  tail call void @llvm.memset.p0i8.i64(i8* %scevgep121122.i.4, i8 0, i64 128, i32 16, i1 false) #6, !dbg !92
  %scevgep121.i.5 = getelementptr [512 x [512 x i32]], [512 x [512 x i32]]* @C, i64 0, i64 %5, i64 %32, !dbg !92
  %scevgep121122.i.5 = bitcast i32* %scevgep121.i.5 to i8*, !dbg !92
  tail call void @llvm.memset.p0i8.i64(i8* %scevgep121122.i.5, i8 0, i64 128, i32 16, i1 false) #6, !dbg !92
  %scevgep121.i.6 = getelementptr [512 x [512 x i32]], [512 x [512 x i32]]* @C, i64 0, i64 %6, i64 %32, !dbg !92
  %scevgep121122.i.6 = bitcast i32* %scevgep121.i.6 to i8*, !dbg !92
  tail call void @llvm.memset.p0i8.i64(i8* %scevgep121122.i.6, i8 0, i64 128, i32 16, i1 false) #6, !dbg !92
  %scevgep121.i.7 = getelementptr [512 x [512 x i32]], [512 x [512 x i32]]* @C, i64 0, i64 %7, i64 %32, !dbg !92
  %scevgep121122.i.7 = bitcast i32* %scevgep121.i.7 to i8*, !dbg !92
  tail call void @llvm.memset.p0i8.i64(i8* %scevgep121122.i.7, i8 0, i64 128, i32 16, i1 false) #6, !dbg !92
  %scevgep121.i.8 = getelementptr [512 x [512 x i32]], [512 x [512 x i32]]* @C, i64 0, i64 %8, i64 %32, !dbg !92
  %scevgep121122.i.8 = bitcast i32* %scevgep121.i.8 to i8*, !dbg !92
  tail call void @llvm.memset.p0i8.i64(i8* %scevgep121122.i.8, i8 0, i64 128, i32 16, i1 false) #6, !dbg !92
  %scevgep121.i.9 = getelementptr [512 x [512 x i32]], [512 x [512 x i32]]* @C, i64 0, i64 %9, i64 %32, !dbg !92
  %scevgep121122.i.9 = bitcast i32* %scevgep121.i.9 to i8*, !dbg !92
  tail call void @llvm.memset.p0i8.i64(i8* %scevgep121122.i.9, i8 0, i64 128, i32 16, i1 false) #6, !dbg !92
  %scevgep121.i.10 = getelementptr [512 x [512 x i32]], [512 x [512 x i32]]* @C, i64 0, i64 %10, i64 %32, !dbg !92
  %scevgep121122.i.10 = bitcast i32* %scevgep121.i.10 to i8*, !dbg !92
  tail call void @llvm.memset.p0i8.i64(i8* %scevgep121122.i.10, i8 0, i64 128, i32 16, i1 false) #6, !dbg !92
  %scevgep121.i.11 = getelementptr [512 x [512 x i32]], [512 x [512 x i32]]* @C, i64 0, i64 %11, i64 %32, !dbg !92
  %scevgep121122.i.11 = bitcast i32* %scevgep121.i.11 to i8*, !dbg !92
  tail call void @llvm.memset.p0i8.i64(i8* %scevgep121122.i.11, i8 0, i64 128, i32 16, i1 false) #6, !dbg !92
  %scevgep121.i.12 = getelementptr [512 x [512 x i32]], [512 x [512 x i32]]* @C, i64 0, i64 %12, i64 %32, !dbg !92
  %scevgep121122.i.12 = bitcast i32* %scevgep121.i.12 to i8*, !dbg !92
  tail call void @llvm.memset.p0i8.i64(i8* %scevgep121122.i.12, i8 0, i64 128, i32 16, i1 false) #6, !dbg !92
  %scevgep121.i.13 = getelementptr [512 x [512 x i32]], [512 x [512 x i32]]* @C, i64 0, i64 %13, i64 %32, !dbg !92
  %scevgep121122.i.13 = bitcast i32* %scevgep121.i.13 to i8*, !dbg !92
  tail call void @llvm.memset.p0i8.i64(i8* %scevgep121122.i.13, i8 0, i64 128, i32 16, i1 false) #6, !dbg !92
  %scevgep121.i.14 = getelementptr [512 x [512 x i32]], [512 x [512 x i32]]* @C, i64 0, i64 %14, i64 %32, !dbg !92
  %scevgep121122.i.14 = bitcast i32* %scevgep121.i.14 to i8*, !dbg !92
  tail call void @llvm.memset.p0i8.i64(i8* %scevgep121122.i.14, i8 0, i64 128, i32 16, i1 false) #6, !dbg !92
  %scevgep121.i.15 = getelementptr [512 x [512 x i32]], [512 x [512 x i32]]* @C, i64 0, i64 %15, i64 %32, !dbg !92
  %scevgep121122.i.15 = bitcast i32* %scevgep121.i.15 to i8*, !dbg !92
  tail call void @llvm.memset.p0i8.i64(i8* %scevgep121122.i.15, i8 0, i64 128, i32 16, i1 false) #6, !dbg !92
  %scevgep121.i.16 = getelementptr [512 x [512 x i32]], [512 x [512 x i32]]* @C, i64 0, i64 %16, i64 %32, !dbg !92
  %scevgep121122.i.16 = bitcast i32* %scevgep121.i.16 to i8*, !dbg !92
  tail call void @llvm.memset.p0i8.i64(i8* %scevgep121122.i.16, i8 0, i64 128, i32 16, i1 false) #6, !dbg !92
  %scevgep121.i.17 = getelementptr [512 x [512 x i32]], [512 x [512 x i32]]* @C, i64 0, i64 %17, i64 %32, !dbg !92
  %scevgep121122.i.17 = bitcast i32* %scevgep121.i.17 to i8*, !dbg !92
  tail call void @llvm.memset.p0i8.i64(i8* %scevgep121122.i.17, i8 0, i64 128, i32 16, i1 false) #6, !dbg !92
  %scevgep121.i.18 = getelementptr [512 x [512 x i32]], [512 x [512 x i32]]* @C, i64 0, i64 %18, i64 %32, !dbg !92
  %scevgep121122.i.18 = bitcast i32* %scevgep121.i.18 to i8*, !dbg !92
  tail call void @llvm.memset.p0i8.i64(i8* %scevgep121122.i.18, i8 0, i64 128, i32 16, i1 false) #6, !dbg !92
  %scevgep121.i.19 = getelementptr [512 x [512 x i32]], [512 x [512 x i32]]* @C, i64 0, i64 %19, i64 %32, !dbg !92
  %scevgep121122.i.19 = bitcast i32* %scevgep121.i.19 to i8*, !dbg !92
  tail call void @llvm.memset.p0i8.i64(i8* %scevgep121122.i.19, i8 0, i64 128, i32 16, i1 false) #6, !dbg !92
  %scevgep121.i.20 = getelementptr [512 x [512 x i32]], [512 x [512 x i32]]* @C, i64 0, i64 %20, i64 %32, !dbg !92
  %scevgep121122.i.20 = bitcast i32* %scevgep121.i.20 to i8*, !dbg !92
  tail call void @llvm.memset.p0i8.i64(i8* %scevgep121122.i.20, i8 0, i64 128, i32 16, i1 false) #6, !dbg !92
  %scevgep121.i.21 = getelementptr [512 x [512 x i32]], [512 x [512 x i32]]* @C, i64 0, i64 %21, i64 %32, !dbg !92
  %scevgep121122.i.21 = bitcast i32* %scevgep121.i.21 to i8*, !dbg !92
  tail call void @llvm.memset.p0i8.i64(i8* %scevgep121122.i.21, i8 0, i64 128, i32 16, i1 false) #6, !dbg !92
  %scevgep121.i.22 = getelementptr [512 x [512 x i32]], [512 x [512 x i32]]* @C, i64 0, i64 %22, i64 %32, !dbg !92
  %scevgep121122.i.22 = bitcast i32* %scevgep121.i.22 to i8*, !dbg !92
  tail call void @llvm.memset.p0i8.i64(i8* %scevgep121122.i.22, i8 0, i64 128, i32 16, i1 false) #6, !dbg !92
  %scevgep121.i.23 = getelementptr [512 x [512 x i32]], [512 x [512 x i32]]* @C, i64 0, i64 %23, i64 %32, !dbg !92
  %scevgep121122.i.23 = bitcast i32* %scevgep121.i.23 to i8*, !dbg !92
  tail call void @llvm.memset.p0i8.i64(i8* %scevgep121122.i.23, i8 0, i64 128, i32 16, i1 false) #6, !dbg !92
  %scevgep121.i.24 = getelementptr [512 x [512 x i32]], [512 x [512 x i32]]* @C, i64 0, i64 %24, i64 %32, !dbg !92
  %scevgep121122.i.24 = bitcast i32* %scevgep121.i.24 to i8*, !dbg !92
  tail call void @llvm.memset.p0i8.i64(i8* %scevgep121122.i.24, i8 0, i64 128, i32 16, i1 false) #6, !dbg !92
  %scevgep121.i.25 = getelementptr [512 x [512 x i32]], [512 x [512 x i32]]* @C, i64 0, i64 %25, i64 %32, !dbg !92
  %scevgep121122.i.25 = bitcast i32* %scevgep121.i.25 to i8*, !dbg !92
  tail call void @llvm.memset.p0i8.i64(i8* %scevgep121122.i.25, i8 0, i64 128, i32 16, i1 false) #6, !dbg !92
  %scevgep121.i.26 = getelementptr [512 x [512 x i32]], [512 x [512 x i32]]* @C, i64 0, i64 %26, i64 %32, !dbg !92
  %scevgep121122.i.26 = bitcast i32* %scevgep121.i.26 to i8*, !dbg !92
  tail call void @llvm.memset.p0i8.i64(i8* %scevgep121122.i.26, i8 0, i64 128, i32 16, i1 false) #6, !dbg !92
  %scevgep121.i.27 = getelementptr [512 x [512 x i32]], [512 x [512 x i32]]* @C, i64 0, i64 %27, i64 %32, !dbg !92
  %scevgep121122.i.27 = bitcast i32* %scevgep121.i.27 to i8*, !dbg !92
  tail call void @llvm.memset.p0i8.i64(i8* %scevgep121122.i.27, i8 0, i64 128, i32 16, i1 false) #6, !dbg !92
  %scevgep121.i.28 = getelementptr [512 x [512 x i32]], [512 x [512 x i32]]* @C, i64 0, i64 %28, i64 %32, !dbg !92
  %scevgep121122.i.28 = bitcast i32* %scevgep121.i.28 to i8*, !dbg !92
  tail call void @llvm.memset.p0i8.i64(i8* %scevgep121122.i.28, i8 0, i64 128, i32 16, i1 false) #6, !dbg !92
  %scevgep121.i.29 = getelementptr [512 x [512 x i32]], [512 x [512 x i32]]* @C, i64 0, i64 %29, i64 %32, !dbg !92
  %scevgep121122.i.29 = bitcast i32* %scevgep121.i.29 to i8*, !dbg !92
  tail call void @llvm.memset.p0i8.i64(i8* %scevgep121122.i.29, i8 0, i64 128, i32 16, i1 false) #6, !dbg !92
  %scevgep121.i.30 = getelementptr [512 x [512 x i32]], [512 x [512 x i32]]* @C, i64 0, i64 %30, i64 %32, !dbg !92
  %scevgep121122.i.30 = bitcast i32* %scevgep121.i.30 to i8*, !dbg !92
  tail call void @llvm.memset.p0i8.i64(i8* %scevgep121122.i.30, i8 0, i64 128, i32 16, i1 false) #6, !dbg !92
  %scevgep121.i.31 = getelementptr [512 x [512 x i32]], [512 x [512 x i32]]* @C, i64 0, i64 %31, i64 %32, !dbg !92
  %scevgep121122.i.31 = bitcast i32* %scevgep121.i.31 to i8*, !dbg !92
  tail call void @llvm.memset.p0i8.i64(i8* %scevgep121122.i.31, i8 0, i64 128, i32 16, i1 false) #6, !dbg !92
  %polly.indvar_next59.i = add nuw nsw i64 %polly.indvar58.i, 1, !dbg !92
  %exitcond124.i = icmp eq i64 %polly.indvar_next59.i, 16, !dbg !92
  br i1 %exitcond124.i, label %polly.loop_exit57.i, label %polly.loop_preheader62.i, !dbg !92

polly.loop_exit81.i:                              ; preds = %polly.loop_exit87.i
  %polly.indvar_next77.i = add nuw nsw i64 %polly.indvar76.i, 1, !dbg !92
  %exitcond119.i = icmp eq i64 %polly.indvar_next77.i, 16, !dbg !92
  br i1 %exitcond119.i, label %mat_mult.exit, label %polly.loop_preheader80.i, !dbg !92

polly.loop_exit87.i:                              ; preds = %polly.loop_exit93.i
  %polly.indvar_next83.i = add nuw nsw i64 %polly.indvar82.i, 1, !dbg !92
  %exitcond118.i = icmp eq i64 %polly.indvar_next83.i, 16, !dbg !92
  br i1 %exitcond118.i, label %polly.loop_exit81.i, label %polly.loop_preheader86.i, !dbg !92

polly.loop_preheader80.i:                         ; preds = %polly.loop_preheader80.i.preheader, %polly.loop_exit81.i
  %polly.indvar76.i = phi i64 [ %polly.indvar_next77.i, %polly.loop_exit81.i ], [ 0, %polly.loop_preheader80.i.preheader ], !dbg !92
  %33 = shl nsw i64 %polly.indvar76.i, 5, !dbg !92
  br label %polly.loop_preheader86.i, !dbg !92

polly.loop_exit93.i:                              ; preds = %polly.loop_exit99.i
  %polly.indvar_next89.i = add nuw nsw i64 %polly.indvar88.i, 1, !dbg !92
  %exitcond117.i = icmp eq i64 %polly.indvar_next89.i, 16, !dbg !92
  br i1 %exitcond117.i, label %polly.loop_exit87.i, label %polly.loop_preheader92.i, !dbg !92

polly.loop_preheader86.i:                         ; preds = %polly.loop_preheader80.i, %polly.loop_exit87.i
  %polly.indvar82.i = phi i64 [ 0, %polly.loop_preheader80.i ], [ %polly.indvar_next83.i, %polly.loop_exit87.i ], !dbg !92
  %34 = shl nsw i64 %polly.indvar82.i, 5, !dbg !92
  br label %polly.loop_preheader92.i, !dbg !92

polly.loop_exit99.i:                              ; preds = %polly.loop_exit105.i
  %polly.indvar_next95.i = add nuw nsw i64 %polly.indvar94.i, 1, !dbg !92
  %exitcond116.i = icmp eq i64 %polly.indvar_next95.i, 32, !dbg !92
  br i1 %exitcond116.i, label %polly.loop_exit93.i, label %polly.loop_preheader98.i, !dbg !92

polly.loop_preheader92.i:                         ; preds = %polly.loop_preheader86.i, %polly.loop_exit93.i
  %polly.indvar88.i = phi i64 [ 0, %polly.loop_preheader86.i ], [ %polly.indvar_next89.i, %polly.loop_exit93.i ], !dbg !92
  %35 = shl nsw i64 %polly.indvar88.i, 5, !dbg !92
  br label %polly.loop_preheader98.i, !dbg !92

polly.loop_exit105.i:                             ; preds = %polly.loop_header103.i
  %p_add.i.1.lcssa = phi i32 [ %p_add.i.1, %polly.loop_header103.i ]
  store i32 %p_add.i.1.lcssa, i32* %scevgep109.i, align 4, !dbg !92, !alias.scope !93, !noalias !95
  %polly.indvar_next101.i = add nuw nsw i64 %polly.indvar100.i, 1, !dbg !92
  %exitcond115.i = icmp eq i64 %polly.indvar_next101.i, 32, !dbg !92
  br i1 %exitcond115.i, label %polly.loop_exit99.i, label %polly.loop_preheader104.i, !dbg !92

polly.loop_preheader98.i:                         ; preds = %polly.loop_preheader92.i, %polly.loop_exit99.i
  %polly.indvar94.i = phi i64 [ 0, %polly.loop_preheader92.i ], [ %polly.indvar_next95.i, %polly.loop_exit99.i ], !dbg !92
  %36 = add nuw nsw i64 %polly.indvar94.i, %33, !dbg !92
  br label %polly.loop_preheader104.i, !dbg !92

polly.loop_header103.i:                           ; preds = %polly.loop_header103.i, %polly.loop_preheader104.i
  %p_add114.i = phi i32 [ %scevgep109.promoted.i, %polly.loop_preheader104.i ], [ %p_add.i.1, %polly.loop_header103.i ], !dbg !92
  %polly.indvar106.i = phi i64 [ 0, %polly.loop_preheader104.i ], [ %polly.indvar_next107.i.1, %polly.loop_header103.i ], !dbg !92
  %37 = add nuw nsw i64 %polly.indvar106.i, %35, !dbg !92
  %scevgep110.i = getelementptr [512 x [512 x i32]], [512 x [512 x i32]]* @A, i64 0, i64 %36, i64 %37, !dbg !92
  %_p_scalar_111.i = load i32, i32* %scevgep110.i, align 8, !dbg !92, !alias.scope !97, !noalias !98
  %scevgep112.i = getelementptr [512 x [512 x i32]], [512 x [512 x i32]]* @B, i64 0, i64 %37, i64 %39, !dbg !92
  %_p_scalar_113.i = load i32, i32* %scevgep112.i, align 4, !dbg !92, !alias.scope !96, !noalias !99
  %p_mul.i = mul nsw i32 %_p_scalar_113.i, %_p_scalar_111.i, !dbg !100
  %p_add.i = add nsw i32 %p_mul.i, %p_add114.i, !dbg !101
  %polly.indvar_next107.i = or i64 %polly.indvar106.i, 1, !dbg !92
  %38 = add nuw nsw i64 %polly.indvar_next107.i, %35, !dbg !92
  %scevgep110.i.1 = getelementptr [512 x [512 x i32]], [512 x [512 x i32]]* @A, i64 0, i64 %36, i64 %38, !dbg !92
  %_p_scalar_111.i.1 = load i32, i32* %scevgep110.i.1, align 4, !dbg !92, !alias.scope !97, !noalias !98
  %scevgep112.i.1 = getelementptr [512 x [512 x i32]], [512 x [512 x i32]]* @B, i64 0, i64 %38, i64 %39, !dbg !92
  %_p_scalar_113.i.1 = load i32, i32* %scevgep112.i.1, align 4, !dbg !92, !alias.scope !96, !noalias !99
  %p_mul.i.1 = mul nsw i32 %_p_scalar_113.i.1, %_p_scalar_111.i.1, !dbg !100
  %p_add.i.1 = add nsw i32 %p_mul.i.1, %p_add.i, !dbg !101
  %polly.indvar_next107.i.1 = add nsw i64 %polly.indvar106.i, 2, !dbg !92
  %exitcond.i.1 = icmp eq i64 %polly.indvar_next107.i.1, 32, !dbg !92
  br i1 %exitcond.i.1, label %polly.loop_exit105.i, label %polly.loop_header103.i, !dbg !92

polly.loop_preheader104.i:                        ; preds = %polly.loop_preheader98.i, %polly.loop_exit105.i
  %polly.indvar100.i = phi i64 [ 0, %polly.loop_preheader98.i ], [ %polly.indvar_next101.i, %polly.loop_exit105.i ], !dbg !92
  %39 = add nuw nsw i64 %polly.indvar100.i, %34, !dbg !92
  %scevgep109.i = getelementptr [512 x [512 x i32]], [512 x [512 x i32]]* @C, i64 0, i64 %36, i64 %39, !dbg !92
  %scevgep109.promoted.i = load i32, i32* %scevgep109.i, align 4, !dbg !92, !alias.scope !93, !noalias !95
  br label %polly.loop_header103.i, !dbg !92

mat_mult.exit:                                    ; preds = %polly.loop_exit81.i
  %call = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i64 0, i64 0), i32 512, i32 512), !dbg !102
  %40 = load i32, i32* getelementptr inbounds ([512 x [512 x i32]], [512 x [512 x i32]]* @A, i64 0, i64 511, i64 511), align 4, !dbg !103, !tbaa !52
  %41 = load i32, i32* getelementptr inbounds ([512 x [512 x i32]], [512 x [512 x i32]]* @B, i64 0, i64 511, i64 511), align 4, !dbg !104, !tbaa !52
  %42 = load i32, i32* getelementptr inbounds ([512 x [512 x i32]], [512 x [512 x i32]]* @C, i64 0, i64 511, i64 511), align 4, !dbg !105, !tbaa !52
  %call1 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([47 x i8], [47 x i8]* @.str.1, i64 0, i64 0), i32 511, i32 511, i32 %40, i32 511, i32 511, i32 %41, i32 511, i32 511, i32 %42), !dbg !106
  ret i32 0, !dbg !107
}

; Function Attrs: nounwind
declare i32 @printf(i8* nocapture readonly, ...) #1

; Function Attrs: nounwind readnone
declare void @llvm.dbg.value(metadata, i64, metadata, metadata) #4

; Function Attrs: argmemonly nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture readonly, i64, i32, i1) #5

; Function Attrs: argmemonly nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture, i8, i64, i32, i1) #5

attributes #0 = { noinline nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "polly-optimized" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "polly-optimized" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind readnone }
attributes #5 = { argmemonly nounwind }
attributes #6 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!29, !30}
!llvm.ident = !{!31}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 3.9.0 (http://llvm.org/git/clang.git e177b4a63ca92c5fec010986944530688e104074) (http://llvm.org/git/llvm.git fcd97ccb03712372fe95f1732638de5ed3fcabe8)", isOptimized: true, runtimeVersion: 0, emissionKind: 1, enums: !2, retainedTypes: !3, subprograms: !5, globals: !21)
!1 = !DIFile(filename: "MatrixMult.c", directory: "/home/sam/workspace/WhileyOpenCL/polly/MatrixMult/impl/handwritten")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, align: 32, encoding: DW_ATE_unsigned)
!5 = !{!6, !13, !18}
!6 = distinct !DISubprogram(name: "init", scope: !1, file: !1, line: 9, type: !7, isLocal: false, isDefinition: true, scopeLine: 9, isOptimized: true, variables: !9)
!7 = !DISubroutineType(types: !8)
!8 = !{null}
!9 = !{!10, !12}
!10 = !DILocalVariable(name: "i", scope: !6, file: !1, line: 10, type: !11)
!11 = !DIBasicType(name: "int", size: 32, align: 32, encoding: DW_ATE_signed)
!12 = !DILocalVariable(name: "j", scope: !6, file: !1, line: 11, type: !11)
!13 = distinct !DISubprogram(name: "mat_mult", scope: !1, file: !1, line: 30, type: !7, isLocal: false, isDefinition: true, scopeLine: 30, isOptimized: true, variables: !14)
!14 = !{!15, !16, !17}
!15 = !DILocalVariable(name: "i", scope: !13, file: !1, line: 31, type: !11)
!16 = !DILocalVariable(name: "j", scope: !13, file: !1, line: 31, type: !11)
!17 = !DILocalVariable(name: "k", scope: !13, file: !1, line: 31, type: !11)
!18 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 55, type: !19, isLocal: false, isDefinition: true, scopeLine: 56, isOptimized: true, variables: !2)
!19 = !DISubroutineType(types: !20)
!20 = !{!11}
!21 = !{!22, !26, !27, !28}
!22 = !DIGlobalVariable(name: "A", scope: !0, file: !1, line: 3, type: !23, isLocal: false, isDefinition: true, variable: [512 x [512 x i32]]* @A)
!23 = !DICompositeType(tag: DW_TAG_array_type, baseType: !11, size: 8388608, align: 32, elements: !24)
!24 = !{!25, !25}
!25 = !DISubrange(count: 512)
!26 = !DIGlobalVariable(name: "B", scope: !0, file: !1, line: 4, type: !23, isLocal: false, isDefinition: true, variable: [512 x [512 x i32]]* @B)
!27 = !DIGlobalVariable(name: "C", scope: !0, file: !1, line: 5, type: !23, isLocal: false, isDefinition: true, variable: [512 x [512 x i32]]* @C)
!28 = !DIGlobalVariable(name: "R", scope: !0, file: !1, line: 6, type: !23, isLocal: false, isDefinition: true, variable: [512 x [512 x i32]]* @R)
!29 = !{i32 2, !"Dwarf Version", i32 4}
!30 = !{i32 2, !"Debug Info Version", i32 3}
!31 = !{!"clang version 3.9.0 (http://llvm.org/git/clang.git e177b4a63ca92c5fec010986944530688e104074) (http://llvm.org/git/llvm.git fcd97ccb03712372fe95f1732638de5ed3fcabe8)"}
!32 = !DILocation(line: 14, column: 22, scope: !6)
!33 = !DILocation(line: 14, column: 11, scope: !6)
!34 = !DILocation(line: 14, column: 5, scope: !35)
!35 = !DILexicalBlockFile(scope: !6, file: !1, discriminator: 1)
!36 = !DIExpression()
!37 = !DILocation(line: 10, column: 9, scope: !6)
!38 = !DILocation(line: 15, column: 5, scope: !39)
!39 = !DILexicalBlockFile(scope: !40, file: !1, discriminator: 1)
!40 = distinct !DILexicalBlock(scope: !41, file: !1, line: 15, column: 5)
!41 = distinct !DILexicalBlock(scope: !6, file: !1, line: 15, column: 5)
!42 = !DILocation(line: 16, column: 9, scope: !43)
!43 = !DILexicalBlockFile(scope: !44, file: !1, discriminator: 1)
!44 = distinct !DILexicalBlock(scope: !45, file: !1, line: 16, column: 9)
!45 = distinct !DILexicalBlock(scope: !46, file: !1, line: 16, column: 9)
!46 = distinct !DILexicalBlock(scope: !40, file: !1, line: 15, column: 25)
!47 = !DILocation(line: 18, column: 23, scope: !48)
!48 = distinct !DILexicalBlock(scope: !44, file: !1, line: 16, column: 29)
!49 = !DILocation(line: 18, column: 29, scope: !48)
!50 = !DILocation(line: 18, column: 13, scope: !48)
!51 = !DILocation(line: 18, column: 21, scope: !48)
!52 = !{!53, !53, i64 0}
!53 = !{!"int", !54, i64 0}
!54 = !{!"omnipotent char", !55, i64 0}
!55 = !{!"Simple C/C++ TBAA"}
!56 = !DILocation(line: 28, column: 1, scope: !6)
!57 = distinct !{!57, !58, !"polly.alias.scope.R"}
!58 = distinct !{!58, !"polly.alias.scope.domain"}
!59 = !{!60, !61}
!60 = distinct !{!60, !58, !"polly.alias.scope.B"}
!61 = distinct !{!61, !58, !"polly.alias.scope.A"}
!62 = !DILocation(line: 25, column: 27, scope: !63)
!63 = distinct !DILexicalBlock(scope: !64, file: !1, line: 23, column: 29)
!64 = distinct !DILexicalBlock(scope: !65, file: !1, line: 23, column: 9)
!65 = distinct !DILexicalBlock(scope: !66, file: !1, line: 23, column: 9)
!66 = distinct !DILexicalBlock(scope: !67, file: !1, line: 22, column: 25)
!67 = distinct !DILexicalBlock(scope: !68, file: !1, line: 22, column: 5)
!68 = distinct !DILexicalBlock(scope: !6, file: !1, line: 22, column: 5)
!69 = !{!57, !61}
!70 = !DILocation(line: 31, column: 9, scope: !13)
!71 = !DILocation(line: 40, column: 1, scope: !13)
!72 = distinct !{!72, !73, !"polly.alias.scope.C"}
!73 = distinct !{!73, !"polly.alias.scope.domain"}
!74 = !{!75, !76}
!75 = distinct !{!75, !73, !"polly.alias.scope.B"}
!76 = distinct !{!76, !73, !"polly.alias.scope.A"}
!77 = !{!75, !72}
!78 = !{!72, !76}
!79 = !DILocation(line: 36, column: 45, scope: !80)
!80 = distinct !DILexicalBlock(scope: !81, file: !1, line: 35, column: 13)
!81 = distinct !DILexicalBlock(scope: !82, file: !1, line: 35, column: 13)
!82 = distinct !DILexicalBlock(scope: !83, file: !1, line: 33, column: 29)
!83 = distinct !DILexicalBlock(scope: !84, file: !1, line: 33, column: 9)
!84 = distinct !DILexicalBlock(scope: !85, file: !1, line: 33, column: 9)
!85 = distinct !DILexicalBlock(scope: !86, file: !1, line: 32, column: 25)
!86 = distinct !DILexicalBlock(scope: !87, file: !1, line: 32, column: 5)
!87 = distinct !DILexicalBlock(scope: !13, file: !1, line: 32, column: 5)
!88 = !DILocation(line: 36, column: 35, scope: !80)
!89 = !DILocation(line: 57, column: 5, scope: !18)
!90 = !DILocation(line: 31, column: 9, scope: !13, inlinedAt: !91)
!91 = distinct !DILocation(line: 58, column: 5, scope: !18)
!92 = !DILocation(line: 58, column: 5, scope: !18)
!93 = distinct !{!93, !94, !"polly.alias.scope.C"}
!94 = distinct !{!94, !"polly.alias.scope.domain"}
!95 = !{!96, !97}
!96 = distinct !{!96, !94, !"polly.alias.scope.B"}
!97 = distinct !{!97, !94, !"polly.alias.scope.A"}
!98 = !{!96, !93}
!99 = !{!93, !97}
!100 = !DILocation(line: 36, column: 45, scope: !80, inlinedAt: !91)
!101 = !DILocation(line: 36, column: 35, scope: !80, inlinedAt: !91)
!102 = !DILocation(line: 60, column: 5, scope: !18)
!103 = !DILocation(line: 62, column: 19, scope: !18)
!104 = !DILocation(line: 63, column: 19, scope: !18)
!105 = !DILocation(line: 64, column: 19, scope: !18)
!106 = !DILocation(line: 61, column: 5, scope: !18)
!107 = !DILocation(line: 65, column: 5, scope: !18)
