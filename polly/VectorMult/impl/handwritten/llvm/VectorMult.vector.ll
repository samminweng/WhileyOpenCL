; ModuleID = 'VectorMult.preopt.ll'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@u = common global [4096 x i32] zeroinitializer, align 16
@v = common global [4096 x i32] zeroinitializer, align 16
@.str = private unnamed_addr constant [34 x i8] c"fail to multiply two unit vectors\00", align 1
@.str.1 = private unnamed_addr constant [1 x i8] zeroinitializer, align 1
@.str.2 = private unnamed_addr constant [102 x i8] c"Pass the %'lld vector multiplication test case with local vectors = %d size.\0AThe Dot Product = %'lld\0A\00", align 1

; Function Attrs: nounwind uwtable
define i32 @main(i32 %argc, i8** nocapture readnone %args) #0 {
entry:
  %p_add21.3.s2a = alloca i64
  %sum.02.phiops.0.phiops = alloca i64
  %call = tail call noalias i8* @malloc(i64 1048576) #4
  call void @llvm.memset.p0i8.i64(i8* %call, i8 0, i64 1048576, i32 4, i1 false)
  br label %polly.split_new_and_old

if.then:                                          ; preds = %polly.exiting
  %call27 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([34 x i8], [34 x i8]* @.str, i64 0, i64 0)) #4
  tail call void @exit(i32 -2) #5
  unreachable

if.end:                                           ; preds = %polly.exiting
  %call28 = tail call i8* @setlocale(i32 6, i8* getelementptr inbounds ([1 x i8], [1 x i8]* @.str.1, i64 0, i64 0)) #4
  %call29 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([102 x i8], [102 x i8]* @.str.2, i64 0, i64 0), i32 1073741824, i32 4096, i64 1073741824) #4
  ret i32 0

polly.merge_new_and_old:                          ; preds = %polly.exiting54, %polly.stmt.for.inc22
  %p_add21.3.merge = phi i64 [ %p_add21.3.final_reload, %polly.exiting54 ], [ %p_add21.3, %polly.stmt.for.inc22 ]
  br label %polly.exiting

polly.exiting:                                    ; preds = %polly.merge_new_and_old
  %p_add21.3.lcssa = phi i64 [ %p_add21.3.merge, %polly.merge_new_and_old ]
  %cmp25 = icmp eq i64 %p_add21.3.lcssa, 1073741824
  br i1 %cmp25, label %if.end, label %if.then

polly.loop_exit10:                                ; preds = %polly.loop_exit16
  %polly.indvar_next6 = add nuw nsw i64 %polly.indvar5, 1
  %exitcond52 = icmp eq i64 %polly.indvar_next6, 128
  br i1 %exitcond52, label %polly.stmt.for.inc22.preheader, label %polly.loop_preheader9

polly.stmt.for.inc22.preheader:                   ; preds = %polly.loop_exit10
  br label %polly.stmt.for.inc22

polly.loop_exit16:                                ; preds = %polly.loop_exit22
  %polly.indvar_next12 = add nuw nsw i64 %polly.indvar11, 1
  %exitcond51 = icmp eq i64 %polly.indvar_next12, 8192
  br i1 %exitcond51, label %polly.loop_exit10, label %polly.loop_preheader15

polly.split_new_and_old:                          ; preds = %entry
  br i1 true, label %polly.start, label %polly.loop_preheader9

polly.loop_preheader9:                            ; preds = %polly.split_new_and_old, %polly.loop_exit10
  %polly.indvar5 = phi i64 [ %polly.indvar_next6, %polly.loop_exit10 ], [ 0, %polly.split_new_and_old ]
  %0 = shl i64 %polly.indvar5, 5
  br label %polly.loop_preheader15

polly.loop_exit22:                                ; preds = %polly.loop_preheader27
  %1 = bitcast i32* %scevgep32 to <4 x i32>*
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* %1, align 16, !alias.scope !1, !noalias !3
  %2 = bitcast i32* %scevgep33 to <4 x i32>*
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* %2, align 16, !alias.scope !7, !noalias !8
  %polly.indvar_next18 = add nuw nsw i64 %polly.indvar17, 1
  %exitcond50 = icmp eq i64 %polly.indvar_next18, 8
  br i1 %exitcond50, label %polly.loop_exit16, label %polly.loop_preheader21

polly.loop_preheader15:                           ; preds = %polly.loop_exit16, %polly.loop_preheader9
  %polly.indvar11 = phi i64 [ 0, %polly.loop_preheader9 ], [ %polly.indvar_next12, %polly.loop_exit16 ]
  %3 = shl i64 %polly.indvar11, 5
  br label %polly.loop_preheader21

polly.loop_preheader21:                           ; preds = %polly.loop_exit22, %polly.loop_preheader15
  %polly.indvar17 = phi i64 [ 0, %polly.loop_preheader15 ], [ %polly.indvar_next18, %polly.loop_exit22 ]
  %4 = shl i64 %polly.indvar17, 2
  %5 = add nuw nsw i64 %4, %0
  %scevgep32 = getelementptr [4096 x i32], [4096 x i32]* @u, i64 0, i64 %5
  %scevgep33 = getelementptr [4096 x i32], [4096 x i32]* @v, i64 0, i64 %5
  br label %polly.loop_preheader27

polly.loop_preheader27:                           ; preds = %polly.loop_preheader27, %polly.loop_preheader21
  %polly.indvar23 = phi i64 [ 0, %polly.loop_preheader21 ], [ %polly.indvar_next24.3, %polly.loop_preheader27 ]
  %6 = add nuw nsw i64 %polly.indvar23, %3
  %7 = shl i64 %6, 2
  %scevgep34 = getelementptr i8, i8* %call, i64 %7
  %scevgep3435 = bitcast i8* %scevgep34 to i32*
  %scevgep3435.promoted = load i32, i32* %scevgep3435, align 4, !alias.scope !4, !noalias !9
  %8 = add i32 %scevgep3435.promoted, 4
  store i32 %8, i32* %scevgep3435, align 4, !alias.scope !4, !noalias !9
  %polly.indvar_next24 = or i64 %polly.indvar23, 1
  %9 = add nuw nsw i64 %polly.indvar_next24, %3
  %10 = shl i64 %9, 2
  %scevgep34.1 = getelementptr i8, i8* %call, i64 %10
  %scevgep3435.1 = bitcast i8* %scevgep34.1 to i32*
  %scevgep3435.promoted.1 = load i32, i32* %scevgep3435.1, align 4, !alias.scope !4, !noalias !9
  %11 = add i32 %scevgep3435.promoted.1, 4
  store i32 %11, i32* %scevgep3435.1, align 4, !alias.scope !4, !noalias !9
  %polly.indvar_next24.1 = or i64 %polly.indvar23, 2
  %12 = add nuw nsw i64 %polly.indvar_next24.1, %3
  %13 = shl i64 %12, 2
  %scevgep34.2 = getelementptr i8, i8* %call, i64 %13
  %scevgep3435.2 = bitcast i8* %scevgep34.2 to i32*
  %scevgep3435.promoted.2 = load i32, i32* %scevgep3435.2, align 4, !alias.scope !4, !noalias !9
  %14 = add i32 %scevgep3435.promoted.2, 4
  store i32 %14, i32* %scevgep3435.2, align 4, !alias.scope !4, !noalias !9
  %polly.indvar_next24.2 = or i64 %polly.indvar23, 3
  %15 = add nuw nsw i64 %polly.indvar_next24.2, %3
  %16 = shl i64 %15, 2
  %scevgep34.3 = getelementptr i8, i8* %call, i64 %16
  %scevgep3435.3 = bitcast i8* %scevgep34.3 to i32*
  %scevgep3435.promoted.3 = load i32, i32* %scevgep3435.3, align 4, !alias.scope !4, !noalias !9
  %17 = add i32 %scevgep3435.promoted.3, 4
  store i32 %17, i32* %scevgep3435.3, align 4, !alias.scope !4, !noalias !9
  %polly.indvar_next24.3 = add nsw i64 %polly.indvar23, 4
  %exitcond49.3 = icmp eq i64 %polly.indvar_next24.3, 32
  br i1 %exitcond49.3, label %polly.loop_exit22, label %polly.loop_preheader27

polly.stmt.for.inc22:                             ; preds = %polly.stmt.for.inc22, %polly.stmt.for.inc22.preheader
  %sum.02.phiops.0 = phi i64 [ 0, %polly.stmt.for.inc22.preheader ], [ %p_add21.3, %polly.stmt.for.inc22 ]
  %polly.indvar41 = phi i64 [ 0, %polly.stmt.for.inc22.preheader ], [ %polly.indvar_next42.3, %polly.stmt.for.inc22 ]
  %18 = shl i64 %polly.indvar41, 2
  %scevgep44 = getelementptr i8, i8* %call, i64 %18
  %scevgep4445 = bitcast i8* %scevgep44 to i32*
  %_p_scalar_46 = load i32, i32* %scevgep4445, align 4, !alias.scope !4, !noalias !9
  %p_conv = sext i32 %_p_scalar_46 to i64
  %p_add21 = add nsw i64 %p_conv, %sum.02.phiops.0
  %polly.indvar_next42 = shl i64 %polly.indvar41, 2
  %19 = or i64 %polly.indvar_next42, 4
  %scevgep44.1 = getelementptr i8, i8* %call, i64 %19
  %scevgep4445.1 = bitcast i8* %scevgep44.1 to i32*
  %_p_scalar_46.1 = load i32, i32* %scevgep4445.1, align 4, !alias.scope !4, !noalias !9
  %p_conv.1 = sext i32 %_p_scalar_46.1 to i64
  %p_add21.1 = add nsw i64 %p_conv.1, %p_add21
  %polly.indvar_next42.1 = shl i64 %polly.indvar41, 2
  %20 = or i64 %polly.indvar_next42.1, 8
  %scevgep44.2 = getelementptr i8, i8* %call, i64 %20
  %scevgep4445.2 = bitcast i8* %scevgep44.2 to i32*
  %_p_scalar_46.2 = load i32, i32* %scevgep4445.2, align 4, !alias.scope !4, !noalias !9
  %p_conv.2 = sext i32 %_p_scalar_46.2 to i64
  %p_add21.2 = add nsw i64 %p_conv.2, %p_add21.1
  %polly.indvar_next42.2 = shl i64 %polly.indvar41, 2
  %21 = or i64 %polly.indvar_next42.2, 12
  %scevgep44.3 = getelementptr i8, i8* %call, i64 %21
  %scevgep4445.3 = bitcast i8* %scevgep44.3 to i32*
  %_p_scalar_46.3 = load i32, i32* %scevgep4445.3, align 4, !alias.scope !4, !noalias !9
  %p_conv.3 = sext i32 %_p_scalar_46.3 to i64
  %p_add21.3 = add nsw i64 %p_conv.3, %p_add21.2
  %polly.indvar_next42.3 = add nsw i64 %polly.indvar41, 4
  %exitcond.3 = icmp eq i64 %polly.indvar_next42.3, 262144
  br i1 %exitcond.3, label %polly.merge_new_and_old, label %polly.stmt.for.inc22

polly.start:                                      ; preds = %polly.split_new_and_old
  br label %polly.loop_preheader

polly.loop_exit:                                  ; preds = %polly.loop_exit57
  br label %polly.stmt.polly.stmt.for.inc22.preheader

polly.stmt.polly.stmt.for.inc22.preheader:        ; preds = %polly.loop_exit
  store i64 0, i64* %sum.02.phiops.0.phiops
  br label %polly.loop_preheader97

polly.loop_exit98:                                ; preds = %polly.stmt.polly.stmt.for.inc22
  br label %polly.exiting54

polly.exiting54:                                  ; preds = %polly.loop_exit98
  %p_add21.3.final_reload = load i64, i64* %p_add21.3.s2a
  br label %polly.merge_new_and_old

polly.loop_header:                                ; preds = %polly.loop_exit57, %polly.loop_preheader
  %polly.indvar = phi i64 [ 0, %polly.loop_preheader ], [ %polly.indvar_next, %polly.loop_exit57 ]
  br label %polly.loop_preheader56

polly.loop_exit57:                                ; preds = %polly.loop_exit63
  %polly.indvar_next = add nsw i64 %polly.indvar, 1
  %polly.loop_cond = icmp sle i64 %polly.indvar, 126
  br i1 %polly.loop_cond, label %polly.loop_header, label %polly.loop_exit

polly.loop_preheader:                             ; preds = %polly.start
  %scevgep75 = getelementptr i8, i8* %call, i64 4
  %scevgep80 = getelementptr i8, i8* %call, i64 8
  %scevgep85 = getelementptr i8, i8* %call, i64 12
  br label %polly.loop_header

polly.loop_header55:                              ; preds = %polly.loop_exit63, %polly.loop_preheader56
  %polly.indvar58 = phi i64 [ 0, %polly.loop_preheader56 ], [ %polly.indvar_next59, %polly.loop_exit63 ]
  br label %polly.loop_preheader62

polly.loop_exit63:                                ; preds = %polly.stmt.polly.loop_exit22
  %polly.indvar_next59 = add nsw i64 %polly.indvar58, 1
  %polly.loop_cond60 = icmp sle i64 %polly.indvar58, 8190
  br i1 %polly.loop_cond60, label %polly.loop_header55, label %polly.loop_exit57

polly.loop_preheader56:                           ; preds = %polly.loop_header
  %22 = shl i64 %polly.indvar, 5
  %scevgep90 = getelementptr [4096 x i32], [4096 x i32]* @u, i64 0, i64 %22
  %scevgep93 = getelementptr [4096 x i32], [4096 x i32]* @v, i64 0, i64 %22
  br label %polly.loop_header55

polly.loop_header61:                              ; preds = %polly.stmt.polly.loop_exit22, %polly.loop_preheader62
  %polly.indvar64 = phi i64 [ 0, %polly.loop_preheader62 ], [ %polly.indvar_next65, %polly.stmt.polly.loop_exit22 ]
  br label %polly.loop_preheader68

polly.loop_exit69:                                ; preds = %polly.stmt.polly.loop_preheader27
  br label %polly.stmt.polly.loop_exit22

polly.stmt.polly.loop_exit22:                     ; preds = %polly.loop_exit69
  %23 = shl i64 %polly.indvar64, 2
  %scevgep91 = getelementptr i32, i32* %scevgep90, i64 %23
  %scevgep9192 = bitcast i32* %scevgep91 to <4 x i32>*
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* %scevgep9192, align 16, !alias.scope !10, !noalias !12
  %scevgep94 = getelementptr i32, i32* %scevgep93, i64 %23
  %scevgep9495 = bitcast i32* %scevgep94 to <4 x i32>*
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* %scevgep9495, align 16, !alias.scope !15, !noalias !17
  %24 = add i64 %polly.indvar64, 1
  %p_exitcond50 = icmp eq i64 %24, 8
  %polly.indvar_next65 = add nsw i64 %polly.indvar64, 1
  %polly.loop_cond66 = icmp sle i64 %polly.indvar64, 6
  br i1 %polly.loop_cond66, label %polly.loop_header61, label %polly.loop_exit63

polly.loop_preheader62:                           ; preds = %polly.loop_header55
  %25 = shl i64 %polly.indvar58, 7
  %scevgep = getelementptr i8, i8* %call, i64 %25
  %scevgep76 = getelementptr i8, i8* %scevgep75, i64 %25
  %scevgep81 = getelementptr i8, i8* %scevgep80, i64 %25
  %scevgep86 = getelementptr i8, i8* %scevgep85, i64 %25
  br label %polly.loop_header61

polly.loop_header67:                              ; preds = %polly.stmt.polly.loop_preheader27, %polly.loop_preheader68
  %polly.indvar70 = phi i64 [ 0, %polly.loop_preheader68 ], [ %polly.indvar_next71, %polly.stmt.polly.loop_preheader27 ]
  br label %polly.stmt.polly.loop_preheader27

polly.stmt.polly.loop_preheader27:                ; preds = %polly.loop_header67
  %26 = shl i64 %polly.indvar70, 4
  %scevgep73 = getelementptr i8, i8* %scevgep, i64 %26
  %scevgep7374 = bitcast i8* %scevgep73 to i32*
  %scevgep3435.promoted_p_scalar_ = load i32, i32* %scevgep7374, align 4, !alias.scope !13, !noalias !18
  %p_ = add i32 %scevgep3435.promoted_p_scalar_, 4
  store i32 %p_, i32* %scevgep7374, align 4, !alias.scope !13, !noalias !18
  %scevgep77 = getelementptr i8, i8* %scevgep76, i64 %26
  %scevgep7778 = bitcast i8* %scevgep77 to i32*
  %scevgep3435.promoted.1_p_scalar_ = load i32, i32* %scevgep7778, align 4, !alias.scope !13, !noalias !18
  %p_79 = add i32 %scevgep3435.promoted.1_p_scalar_, 4
  store i32 %p_79, i32* %scevgep7778, align 4, !alias.scope !13, !noalias !18
  %27 = shl i64 %polly.indvar70, 4
  %scevgep82 = getelementptr i8, i8* %scevgep81, i64 %27
  %scevgep8283 = bitcast i8* %scevgep82 to i32*
  %scevgep3435.promoted.2_p_scalar_ = load i32, i32* %scevgep8283, align 4, !alias.scope !13, !noalias !18
  %p_84 = add i32 %scevgep3435.promoted.2_p_scalar_, 4
  store i32 %p_84, i32* %scevgep8283, align 4, !alias.scope !13, !noalias !18
  %scevgep87 = getelementptr i8, i8* %scevgep86, i64 %27
  %scevgep8788 = bitcast i8* %scevgep87 to i32*
  %scevgep3435.promoted.3_p_scalar_ = load i32, i32* %scevgep8788, align 4, !alias.scope !13, !noalias !18
  %p_89 = add i32 %scevgep3435.promoted.3_p_scalar_, 4
  store i32 %p_89, i32* %scevgep8788, align 4, !alias.scope !13, !noalias !18
  %28 = shl i64 %polly.indvar70, 2
  %29 = add i64 %28, 4
  %p_exitcond49.3 = icmp eq i64 %29, 32
  %polly.indvar_next71 = add nsw i64 %polly.indvar70, 1
  %polly.loop_cond72 = icmp sle i64 %polly.indvar70, 6
  br i1 %polly.loop_cond72, label %polly.loop_header67, label %polly.loop_exit69

polly.loop_preheader68:                           ; preds = %polly.loop_header61
  br label %polly.loop_header67

polly.loop_header96:                              ; preds = %polly.stmt.polly.stmt.for.inc22, %polly.loop_preheader97
  %polly.indvar99 = phi i64 [ 0, %polly.loop_preheader97 ], [ %polly.indvar_next100, %polly.stmt.polly.stmt.for.inc22 ]
  br label %polly.stmt.polly.stmt.for.inc22

polly.stmt.polly.stmt.for.inc22:                  ; preds = %polly.loop_header96
  %sum.02.phiops.0.phiops.reload = load i64, i64* %sum.02.phiops.0.phiops
  %30 = shl i64 %polly.indvar99, 4
  %scevgep102 = getelementptr i8, i8* %call, i64 %30
  %scevgep102103 = bitcast i8* %scevgep102 to i32*
  %_p_scalar_46_p_scalar_ = load i32, i32* %scevgep102103, align 4, !alias.scope !13, !noalias !18
  %p_p_conv = sext i32 %_p_scalar_46_p_scalar_ to i64
  %p_p_add21 = add nsw i64 %p_p_conv, %sum.02.phiops.0.phiops.reload
  %scevgep105 = getelementptr i8, i8* %scevgep104, i64 %30
  %scevgep105106 = bitcast i8* %scevgep105 to i32*
  %_p_scalar_46.1_p_scalar_ = load i32, i32* %scevgep105106, align 4, !alias.scope !13, !noalias !18
  %p_p_conv.1 = sext i32 %_p_scalar_46.1_p_scalar_ to i64
  %p_p_add21.1 = add nsw i64 %p_p_conv.1, %p_p_add21
  %31 = shl i64 %polly.indvar99, 4
  %scevgep108 = getelementptr i8, i8* %scevgep107, i64 %31
  %scevgep108109 = bitcast i8* %scevgep108 to i32*
  %_p_scalar_46.2_p_scalar_ = load i32, i32* %scevgep108109, align 4, !alias.scope !13, !noalias !18
  %p_p_conv.2 = sext i32 %_p_scalar_46.2_p_scalar_ to i64
  %p_p_add21.2 = add nsw i64 %p_p_conv.2, %p_p_add21.1
  %scevgep111 = getelementptr i8, i8* %scevgep110, i64 %31
  %scevgep111112 = bitcast i8* %scevgep111 to i32*
  %_p_scalar_46.3_p_scalar_ = load i32, i32* %scevgep111112, align 4, !alias.scope !13, !noalias !18
  %p_p_conv.3 = sext i32 %_p_scalar_46.3_p_scalar_ to i64
  %p_p_add21.3 = add nsw i64 %p_p_conv.3, %p_p_add21.2
  %32 = shl i64 %polly.indvar99, 2
  %33 = add i64 %32, 4
  %p_exitcond.3 = icmp eq i64 %33, 262144
  store i64 %p_p_add21.3, i64* %sum.02.phiops.0.phiops
  store i64 %p_p_add21.3, i64* %p_add21.3.s2a
  %polly.indvar_next100 = add nsw i64 %polly.indvar99, 1
  %polly.loop_cond101 = icmp sle i64 %polly.indvar99, 65534
  br i1 %polly.loop_cond101, label %polly.loop_header96, label %polly.loop_exit98

polly.loop_preheader97:                           ; preds = %polly.stmt.polly.stmt.for.inc22.preheader
  %scevgep104 = getelementptr i8, i8* %call, i64 4
  %scevgep107 = getelementptr i8, i8* %call, i64 8
  %scevgep110 = getelementptr i8, i8* %call, i64 12
  br label %polly.loop_header96
}

; Function Attrs: nounwind
declare noalias i8* @malloc(i64) #1

; Function Attrs: nounwind
declare i32 @printf(i8* nocapture readonly, ...) #1

; Function Attrs: noreturn nounwind
declare void @exit(i32) #2

; Function Attrs: nounwind
declare i8* @setlocale(i32, i8*) #1

; Function Attrs: argmemonly nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture, i8, i64, i32, i1) #3

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "polly-optimized" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noreturn nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { argmemonly nounwind }
attributes #4 = { nounwind }
attributes #5 = { noreturn nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 3.9.0 (http://llvm.org/git/clang.git e177b4a63ca92c5fec010986944530688e104074) (http://llvm.org/git/llvm.git fcd97ccb03712372fe95f1732638de5ed3fcabe8)"}
!1 = distinct !{!1, !2, !"polly.alias.scope.u"}
!2 = distinct !{!2, !"polly.alias.scope.domain"}
!3 = !{!4, !5, !6, !7}
!4 = distinct !{!4, !2, !"polly.alias.scope.call"}
!5 = distinct !{!5, !2, !"polly.alias.scope.sum.02"}
!6 = distinct !{!6, !2, !"polly.alias.scope.add21"}
!7 = distinct !{!7, !2, !"polly.alias.scope.v"}
!8 = !{!4, !1, !5, !6}
!9 = !{!1, !5, !6, !7}
!10 = distinct !{!10, !11, !"polly.alias.scope.u"}
!11 = distinct !{!11, !"polly.alias.scope.domain"}
!12 = !{!13, !14, !15, !16}
!13 = distinct !{!13, !11, !"polly.alias.scope.call"}
!14 = distinct !{!14, !11, !"polly.alias.scope.p_add21.3"}
!15 = distinct !{!15, !11, !"polly.alias.scope.v"}
!16 = distinct !{!16, !11, !"polly.alias.scope.sum.02.phiops.0"}
!17 = !{!13, !10, !14, !16}
!18 = !{!10, !14, !15, !16}
