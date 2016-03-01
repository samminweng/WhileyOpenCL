; ModuleID = 'VectorMult.preopt.ll'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@u = common global [256 x i32] zeroinitializer, align 16
@v = common global [256 x i32] zeroinitializer, align 16
@p = common global [256 x i32] zeroinitializer, align 16
@sum = common global [268435456 x i32] zeroinitializer, align 16
@.str = private unnamed_addr constant [34 x i8] c"fail to multiply two unit vectors\00", align 1
@.str.1 = private unnamed_addr constant [1 x i8] zeroinitializer, align 1
@.str.2 = private unnamed_addr constant [100 x i8] c"Pass the %'lld vector multiplication test case with local vector size = %d\0AThe Dot Product = %'lld\0A\00", align 1

; Function Attrs: nounwind uwtable
define i32 @main(i32 %argc, i8** nocapture readnone %args) #0 {
entry:
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %entry
  %index = phi i64 [ 0, %entry ], [ %index.next.7, %vector.body ]
  %0 = getelementptr [268435456 x i32], [268435456 x i32]* @sum, i64 0, i64 %index
  %1 = bitcast i32* %0 to <4 x i32>*
  store <4 x i32> <i32 256, i32 256, i32 256, i32 256>, <4 x i32>* %1, align 16, !alias.scope !1, !noalias !3
  %2 = getelementptr i32, i32* %0, i64 4
  %3 = bitcast i32* %2 to <4 x i32>*
  store <4 x i32> <i32 256, i32 256, i32 256, i32 256>, <4 x i32>* %3, align 16, !alias.scope !1, !noalias !3
  %index.next = or i64 %index, 8
  %4 = getelementptr [268435456 x i32], [268435456 x i32]* @sum, i64 0, i64 %index.next
  %5 = bitcast i32* %4 to <4 x i32>*
  store <4 x i32> <i32 256, i32 256, i32 256, i32 256>, <4 x i32>* %5, align 16, !alias.scope !1, !noalias !3
  %6 = getelementptr i32, i32* %4, i64 4
  %7 = bitcast i32* %6 to <4 x i32>*
  store <4 x i32> <i32 256, i32 256, i32 256, i32 256>, <4 x i32>* %7, align 16, !alias.scope !1, !noalias !3
  %index.next.1 = or i64 %index, 16
  %8 = getelementptr [268435456 x i32], [268435456 x i32]* @sum, i64 0, i64 %index.next.1
  %9 = bitcast i32* %8 to <4 x i32>*
  store <4 x i32> <i32 256, i32 256, i32 256, i32 256>, <4 x i32>* %9, align 16, !alias.scope !1, !noalias !3
  %10 = getelementptr i32, i32* %8, i64 4
  %11 = bitcast i32* %10 to <4 x i32>*
  store <4 x i32> <i32 256, i32 256, i32 256, i32 256>, <4 x i32>* %11, align 16, !alias.scope !1, !noalias !3
  %index.next.2 = or i64 %index, 24
  %12 = getelementptr [268435456 x i32], [268435456 x i32]* @sum, i64 0, i64 %index.next.2
  %13 = bitcast i32* %12 to <4 x i32>*
  store <4 x i32> <i32 256, i32 256, i32 256, i32 256>, <4 x i32>* %13, align 16, !alias.scope !1, !noalias !3
  %14 = getelementptr i32, i32* %12, i64 4
  %15 = bitcast i32* %14 to <4 x i32>*
  store <4 x i32> <i32 256, i32 256, i32 256, i32 256>, <4 x i32>* %15, align 16, !alias.scope !1, !noalias !3
  %index.next.3 = or i64 %index, 32
  %16 = getelementptr [268435456 x i32], [268435456 x i32]* @sum, i64 0, i64 %index.next.3
  %17 = bitcast i32* %16 to <4 x i32>*
  store <4 x i32> <i32 256, i32 256, i32 256, i32 256>, <4 x i32>* %17, align 16, !alias.scope !1, !noalias !3
  %18 = getelementptr i32, i32* %16, i64 4
  %19 = bitcast i32* %18 to <4 x i32>*
  store <4 x i32> <i32 256, i32 256, i32 256, i32 256>, <4 x i32>* %19, align 16, !alias.scope !1, !noalias !3
  %index.next.4 = or i64 %index, 40
  %20 = getelementptr [268435456 x i32], [268435456 x i32]* @sum, i64 0, i64 %index.next.4
  %21 = bitcast i32* %20 to <4 x i32>*
  store <4 x i32> <i32 256, i32 256, i32 256, i32 256>, <4 x i32>* %21, align 16, !alias.scope !1, !noalias !3
  %22 = getelementptr i32, i32* %20, i64 4
  %23 = bitcast i32* %22 to <4 x i32>*
  store <4 x i32> <i32 256, i32 256, i32 256, i32 256>, <4 x i32>* %23, align 16, !alias.scope !1, !noalias !3
  %index.next.5 = or i64 %index, 48
  %24 = getelementptr [268435456 x i32], [268435456 x i32]* @sum, i64 0, i64 %index.next.5
  %25 = bitcast i32* %24 to <4 x i32>*
  store <4 x i32> <i32 256, i32 256, i32 256, i32 256>, <4 x i32>* %25, align 16, !alias.scope !1, !noalias !3
  %26 = getelementptr i32, i32* %24, i64 4
  %27 = bitcast i32* %26 to <4 x i32>*
  store <4 x i32> <i32 256, i32 256, i32 256, i32 256>, <4 x i32>* %27, align 16, !alias.scope !1, !noalias !3
  %index.next.6 = or i64 %index, 56
  %28 = getelementptr [268435456 x i32], [268435456 x i32]* @sum, i64 0, i64 %index.next.6
  %29 = bitcast i32* %28 to <4 x i32>*
  store <4 x i32> <i32 256, i32 256, i32 256, i32 256>, <4 x i32>* %29, align 16, !alias.scope !1, !noalias !3
  %30 = getelementptr i32, i32* %28, i64 4
  %31 = bitcast i32* %30 to <4 x i32>*
  store <4 x i32> <i32 256, i32 256, i32 256, i32 256>, <4 x i32>* %31, align 16, !alias.scope !1, !noalias !3
  %index.next.7 = add nsw i64 %index, 64
  %32 = icmp eq i64 %index.next.7, 268435456
  br i1 %32, label %vector.ph45.preheader, label %vector.body, !llvm.loop !9

vector.ph45.preheader:                            ; preds = %vector.body
  br label %vector.ph45

if.then:                                          ; preds = %middle.block138
  %call = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([34 x i8], [34 x i8]* @.str, i64 0, i64 0)) #3
  tail call void @exit(i32 -2) #4
  unreachable

if.end:                                           ; preds = %middle.block138
  %call29 = tail call i8* @setlocale(i32 6, i8* getelementptr inbounds ([1 x i8], [1 x i8]* @.str.1, i64 0, i64 0)) #3
  %call30 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([100 x i8], [100 x i8]* @.str.2, i64 0, i64 0), i64 68719476736, i32 256, i64 68719476736) #3
  ret i32 0

vector.ph45:                                      ; preds = %vector.ph45.preheader, %vector.body41
  %polly.indvar10 = phi i64 [ %polly.indvar_next11, %vector.body41 ], [ 0, %vector.ph45.preheader ]
  br label %vector.body41

vector.body41:                                    ; preds = %vector.ph45
  %polly.indvar_next11 = add nuw nsw i64 %polly.indvar10, 1
  %exitcond37 = icmp eq i64 %polly.indvar_next11, 8388608
  br i1 %exitcond37, label %vector.ph57.preheader, label %vector.ph45

vector.ph57.preheader:                            ; preds = %vector.body41
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* bitcast ([256 x i32]* @u to <4 x i32>*), align 16, !alias.scope !8, !noalias !12
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* bitcast ([256 x i32]* @v to <4 x i32>*), align 16, !alias.scope !5, !noalias !13
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* bitcast ([256 x i32]* @p to <4 x i32>*), align 16, !alias.scope !4, !noalias !14
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* bitcast (i32* getelementptr inbounds ([256 x i32], [256 x i32]* @u, i64 0, i64 4) to <4 x i32>*), align 16, !alias.scope !8, !noalias !12
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* bitcast (i32* getelementptr inbounds ([256 x i32], [256 x i32]* @v, i64 0, i64 4) to <4 x i32>*), align 16, !alias.scope !5, !noalias !13
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* bitcast (i32* getelementptr inbounds ([256 x i32], [256 x i32]* @p, i64 0, i64 4) to <4 x i32>*), align 16, !alias.scope !4, !noalias !14
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* bitcast (i32* getelementptr inbounds ([256 x i32], [256 x i32]* @u, i64 0, i64 8) to <4 x i32>*), align 16, !alias.scope !8, !noalias !12
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* bitcast (i32* getelementptr inbounds ([256 x i32], [256 x i32]* @v, i64 0, i64 8) to <4 x i32>*), align 16, !alias.scope !5, !noalias !13
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* bitcast (i32* getelementptr inbounds ([256 x i32], [256 x i32]* @p, i64 0, i64 8) to <4 x i32>*), align 16, !alias.scope !4, !noalias !14
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* bitcast (i32* getelementptr inbounds ([256 x i32], [256 x i32]* @u, i64 0, i64 12) to <4 x i32>*), align 16, !alias.scope !8, !noalias !12
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* bitcast (i32* getelementptr inbounds ([256 x i32], [256 x i32]* @v, i64 0, i64 12) to <4 x i32>*), align 16, !alias.scope !5, !noalias !13
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* bitcast (i32* getelementptr inbounds ([256 x i32], [256 x i32]* @p, i64 0, i64 12) to <4 x i32>*), align 16, !alias.scope !4, !noalias !14
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* bitcast (i32* getelementptr inbounds ([256 x i32], [256 x i32]* @u, i64 0, i64 16) to <4 x i32>*), align 16, !alias.scope !8, !noalias !12
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* bitcast (i32* getelementptr inbounds ([256 x i32], [256 x i32]* @v, i64 0, i64 16) to <4 x i32>*), align 16, !alias.scope !5, !noalias !13
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* bitcast (i32* getelementptr inbounds ([256 x i32], [256 x i32]* @p, i64 0, i64 16) to <4 x i32>*), align 16, !alias.scope !4, !noalias !14
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* bitcast (i32* getelementptr inbounds ([256 x i32], [256 x i32]* @u, i64 0, i64 20) to <4 x i32>*), align 16, !alias.scope !8, !noalias !12
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* bitcast (i32* getelementptr inbounds ([256 x i32], [256 x i32]* @v, i64 0, i64 20) to <4 x i32>*), align 16, !alias.scope !5, !noalias !13
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* bitcast (i32* getelementptr inbounds ([256 x i32], [256 x i32]* @p, i64 0, i64 20) to <4 x i32>*), align 16, !alias.scope !4, !noalias !14
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* bitcast (i32* getelementptr inbounds ([256 x i32], [256 x i32]* @u, i64 0, i64 24) to <4 x i32>*), align 16, !alias.scope !8, !noalias !12
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* bitcast (i32* getelementptr inbounds ([256 x i32], [256 x i32]* @v, i64 0, i64 24) to <4 x i32>*), align 16, !alias.scope !5, !noalias !13
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* bitcast (i32* getelementptr inbounds ([256 x i32], [256 x i32]* @p, i64 0, i64 24) to <4 x i32>*), align 16, !alias.scope !4, !noalias !14
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* bitcast (i32* getelementptr inbounds ([256 x i32], [256 x i32]* @u, i64 0, i64 28) to <4 x i32>*), align 16, !alias.scope !8, !noalias !12
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* bitcast (i32* getelementptr inbounds ([256 x i32], [256 x i32]* @v, i64 0, i64 28) to <4 x i32>*), align 16, !alias.scope !5, !noalias !13
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* bitcast (i32* getelementptr inbounds ([256 x i32], [256 x i32]* @p, i64 0, i64 28) to <4 x i32>*), align 16, !alias.scope !4, !noalias !14
  br label %vector.ph57

vector.ph57:                                      ; preds = %vector.ph57.preheader, %vector.body53
  %polly.indvar10.1 = phi i64 [ %polly.indvar_next11.1, %vector.body53 ], [ 0, %vector.ph57.preheader ]
  br label %vector.body53

vector.body53:                                    ; preds = %vector.ph57
  %polly.indvar_next11.1 = add nuw nsw i64 %polly.indvar10.1, 1
  %exitcond37.1 = icmp eq i64 %polly.indvar_next11.1, 8388608
  br i1 %exitcond37.1, label %vector.ph69.preheader, label %vector.ph57

vector.ph69.preheader:                            ; preds = %vector.body53
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* bitcast (i32* getelementptr inbounds ([256 x i32], [256 x i32]* @u, i64 0, i64 32) to <4 x i32>*), align 16, !alias.scope !8, !noalias !12
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* bitcast (i32* getelementptr inbounds ([256 x i32], [256 x i32]* @v, i64 0, i64 32) to <4 x i32>*), align 16, !alias.scope !5, !noalias !13
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* bitcast (i32* getelementptr inbounds ([256 x i32], [256 x i32]* @p, i64 0, i64 32) to <4 x i32>*), align 16, !alias.scope !4, !noalias !14
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* bitcast (i32* getelementptr inbounds ([256 x i32], [256 x i32]* @u, i64 0, i64 36) to <4 x i32>*), align 16, !alias.scope !8, !noalias !12
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* bitcast (i32* getelementptr inbounds ([256 x i32], [256 x i32]* @v, i64 0, i64 36) to <4 x i32>*), align 16, !alias.scope !5, !noalias !13
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* bitcast (i32* getelementptr inbounds ([256 x i32], [256 x i32]* @p, i64 0, i64 36) to <4 x i32>*), align 16, !alias.scope !4, !noalias !14
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* bitcast (i32* getelementptr inbounds ([256 x i32], [256 x i32]* @u, i64 0, i64 40) to <4 x i32>*), align 16, !alias.scope !8, !noalias !12
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* bitcast (i32* getelementptr inbounds ([256 x i32], [256 x i32]* @v, i64 0, i64 40) to <4 x i32>*), align 16, !alias.scope !5, !noalias !13
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* bitcast (i32* getelementptr inbounds ([256 x i32], [256 x i32]* @p, i64 0, i64 40) to <4 x i32>*), align 16, !alias.scope !4, !noalias !14
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* bitcast (i32* getelementptr inbounds ([256 x i32], [256 x i32]* @u, i64 0, i64 44) to <4 x i32>*), align 16, !alias.scope !8, !noalias !12
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* bitcast (i32* getelementptr inbounds ([256 x i32], [256 x i32]* @v, i64 0, i64 44) to <4 x i32>*), align 16, !alias.scope !5, !noalias !13
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* bitcast (i32* getelementptr inbounds ([256 x i32], [256 x i32]* @p, i64 0, i64 44) to <4 x i32>*), align 16, !alias.scope !4, !noalias !14
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* bitcast (i32* getelementptr inbounds ([256 x i32], [256 x i32]* @u, i64 0, i64 48) to <4 x i32>*), align 16, !alias.scope !8, !noalias !12
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* bitcast (i32* getelementptr inbounds ([256 x i32], [256 x i32]* @v, i64 0, i64 48) to <4 x i32>*), align 16, !alias.scope !5, !noalias !13
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* bitcast (i32* getelementptr inbounds ([256 x i32], [256 x i32]* @p, i64 0, i64 48) to <4 x i32>*), align 16, !alias.scope !4, !noalias !14
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* bitcast (i32* getelementptr inbounds ([256 x i32], [256 x i32]* @u, i64 0, i64 52) to <4 x i32>*), align 16, !alias.scope !8, !noalias !12
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* bitcast (i32* getelementptr inbounds ([256 x i32], [256 x i32]* @v, i64 0, i64 52) to <4 x i32>*), align 16, !alias.scope !5, !noalias !13
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* bitcast (i32* getelementptr inbounds ([256 x i32], [256 x i32]* @p, i64 0, i64 52) to <4 x i32>*), align 16, !alias.scope !4, !noalias !14
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* bitcast (i32* getelementptr inbounds ([256 x i32], [256 x i32]* @u, i64 0, i64 56) to <4 x i32>*), align 16, !alias.scope !8, !noalias !12
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* bitcast (i32* getelementptr inbounds ([256 x i32], [256 x i32]* @v, i64 0, i64 56) to <4 x i32>*), align 16, !alias.scope !5, !noalias !13
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* bitcast (i32* getelementptr inbounds ([256 x i32], [256 x i32]* @p, i64 0, i64 56) to <4 x i32>*), align 16, !alias.scope !4, !noalias !14
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* bitcast (i32* getelementptr inbounds ([256 x i32], [256 x i32]* @u, i64 0, i64 60) to <4 x i32>*), align 16, !alias.scope !8, !noalias !12
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* bitcast (i32* getelementptr inbounds ([256 x i32], [256 x i32]* @v, i64 0, i64 60) to <4 x i32>*), align 16, !alias.scope !5, !noalias !13
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* bitcast (i32* getelementptr inbounds ([256 x i32], [256 x i32]* @p, i64 0, i64 60) to <4 x i32>*), align 16, !alias.scope !4, !noalias !14
  br label %vector.ph69

vector.ph69:                                      ; preds = %vector.ph69.preheader, %vector.body65
  %polly.indvar10.2 = phi i64 [ %polly.indvar_next11.2, %vector.body65 ], [ 0, %vector.ph69.preheader ]
  br label %vector.body65

vector.body65:                                    ; preds = %vector.ph69
  %polly.indvar_next11.2 = add nuw nsw i64 %polly.indvar10.2, 1
  %exitcond37.2 = icmp eq i64 %polly.indvar_next11.2, 8388608
  br i1 %exitcond37.2, label %vector.ph81.preheader, label %vector.ph69

vector.ph81.preheader:                            ; preds = %vector.body65
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* bitcast (i32* getelementptr inbounds ([256 x i32], [256 x i32]* @u, i64 0, i64 64) to <4 x i32>*), align 16, !alias.scope !8, !noalias !12
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* bitcast (i32* getelementptr inbounds ([256 x i32], [256 x i32]* @v, i64 0, i64 64) to <4 x i32>*), align 16, !alias.scope !5, !noalias !13
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* bitcast (i32* getelementptr inbounds ([256 x i32], [256 x i32]* @p, i64 0, i64 64) to <4 x i32>*), align 16, !alias.scope !4, !noalias !14
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* bitcast (i32* getelementptr inbounds ([256 x i32], [256 x i32]* @u, i64 0, i64 68) to <4 x i32>*), align 16, !alias.scope !8, !noalias !12
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* bitcast (i32* getelementptr inbounds ([256 x i32], [256 x i32]* @v, i64 0, i64 68) to <4 x i32>*), align 16, !alias.scope !5, !noalias !13
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* bitcast (i32* getelementptr inbounds ([256 x i32], [256 x i32]* @p, i64 0, i64 68) to <4 x i32>*), align 16, !alias.scope !4, !noalias !14
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* bitcast (i32* getelementptr inbounds ([256 x i32], [256 x i32]* @u, i64 0, i64 72) to <4 x i32>*), align 16, !alias.scope !8, !noalias !12
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* bitcast (i32* getelementptr inbounds ([256 x i32], [256 x i32]* @v, i64 0, i64 72) to <4 x i32>*), align 16, !alias.scope !5, !noalias !13
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* bitcast (i32* getelementptr inbounds ([256 x i32], [256 x i32]* @p, i64 0, i64 72) to <4 x i32>*), align 16, !alias.scope !4, !noalias !14
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* bitcast (i32* getelementptr inbounds ([256 x i32], [256 x i32]* @u, i64 0, i64 76) to <4 x i32>*), align 16, !alias.scope !8, !noalias !12
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* bitcast (i32* getelementptr inbounds ([256 x i32], [256 x i32]* @v, i64 0, i64 76) to <4 x i32>*), align 16, !alias.scope !5, !noalias !13
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* bitcast (i32* getelementptr inbounds ([256 x i32], [256 x i32]* @p, i64 0, i64 76) to <4 x i32>*), align 16, !alias.scope !4, !noalias !14
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* bitcast (i32* getelementptr inbounds ([256 x i32], [256 x i32]* @u, i64 0, i64 80) to <4 x i32>*), align 16, !alias.scope !8, !noalias !12
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* bitcast (i32* getelementptr inbounds ([256 x i32], [256 x i32]* @v, i64 0, i64 80) to <4 x i32>*), align 16, !alias.scope !5, !noalias !13
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* bitcast (i32* getelementptr inbounds ([256 x i32], [256 x i32]* @p, i64 0, i64 80) to <4 x i32>*), align 16, !alias.scope !4, !noalias !14
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* bitcast (i32* getelementptr inbounds ([256 x i32], [256 x i32]* @u, i64 0, i64 84) to <4 x i32>*), align 16, !alias.scope !8, !noalias !12
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* bitcast (i32* getelementptr inbounds ([256 x i32], [256 x i32]* @v, i64 0, i64 84) to <4 x i32>*), align 16, !alias.scope !5, !noalias !13
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* bitcast (i32* getelementptr inbounds ([256 x i32], [256 x i32]* @p, i64 0, i64 84) to <4 x i32>*), align 16, !alias.scope !4, !noalias !14
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* bitcast (i32* getelementptr inbounds ([256 x i32], [256 x i32]* @u, i64 0, i64 88) to <4 x i32>*), align 16, !alias.scope !8, !noalias !12
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* bitcast (i32* getelementptr inbounds ([256 x i32], [256 x i32]* @v, i64 0, i64 88) to <4 x i32>*), align 16, !alias.scope !5, !noalias !13
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* bitcast (i32* getelementptr inbounds ([256 x i32], [256 x i32]* @p, i64 0, i64 88) to <4 x i32>*), align 16, !alias.scope !4, !noalias !14
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* bitcast (i32* getelementptr inbounds ([256 x i32], [256 x i32]* @u, i64 0, i64 92) to <4 x i32>*), align 16, !alias.scope !8, !noalias !12
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* bitcast (i32* getelementptr inbounds ([256 x i32], [256 x i32]* @v, i64 0, i64 92) to <4 x i32>*), align 16, !alias.scope !5, !noalias !13
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* bitcast (i32* getelementptr inbounds ([256 x i32], [256 x i32]* @p, i64 0, i64 92) to <4 x i32>*), align 16, !alias.scope !4, !noalias !14
  br label %vector.ph81

vector.ph81:                                      ; preds = %vector.ph81.preheader, %vector.body77
  %polly.indvar10.3 = phi i64 [ %polly.indvar_next11.3, %vector.body77 ], [ 0, %vector.ph81.preheader ]
  br label %vector.body77

vector.body77:                                    ; preds = %vector.ph81
  %polly.indvar_next11.3 = add nuw nsw i64 %polly.indvar10.3, 1
  %exitcond37.3 = icmp eq i64 %polly.indvar_next11.3, 8388608
  br i1 %exitcond37.3, label %vector.ph93.preheader, label %vector.ph81

vector.ph93.preheader:                            ; preds = %vector.body77
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* bitcast (i32* getelementptr inbounds ([256 x i32], [256 x i32]* @u, i64 0, i64 96) to <4 x i32>*), align 16, !alias.scope !8, !noalias !12
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* bitcast (i32* getelementptr inbounds ([256 x i32], [256 x i32]* @v, i64 0, i64 96) to <4 x i32>*), align 16, !alias.scope !5, !noalias !13
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* bitcast (i32* getelementptr inbounds ([256 x i32], [256 x i32]* @p, i64 0, i64 96) to <4 x i32>*), align 16, !alias.scope !4, !noalias !14
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* bitcast (i32* getelementptr inbounds ([256 x i32], [256 x i32]* @u, i64 0, i64 100) to <4 x i32>*), align 16, !alias.scope !8, !noalias !12
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* bitcast (i32* getelementptr inbounds ([256 x i32], [256 x i32]* @v, i64 0, i64 100) to <4 x i32>*), align 16, !alias.scope !5, !noalias !13
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* bitcast (i32* getelementptr inbounds ([256 x i32], [256 x i32]* @p, i64 0, i64 100) to <4 x i32>*), align 16, !alias.scope !4, !noalias !14
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* bitcast (i32* getelementptr inbounds ([256 x i32], [256 x i32]* @u, i64 0, i64 104) to <4 x i32>*), align 16, !alias.scope !8, !noalias !12
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* bitcast (i32* getelementptr inbounds ([256 x i32], [256 x i32]* @v, i64 0, i64 104) to <4 x i32>*), align 16, !alias.scope !5, !noalias !13
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* bitcast (i32* getelementptr inbounds ([256 x i32], [256 x i32]* @p, i64 0, i64 104) to <4 x i32>*), align 16, !alias.scope !4, !noalias !14
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* bitcast (i32* getelementptr inbounds ([256 x i32], [256 x i32]* @u, i64 0, i64 108) to <4 x i32>*), align 16, !alias.scope !8, !noalias !12
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* bitcast (i32* getelementptr inbounds ([256 x i32], [256 x i32]* @v, i64 0, i64 108) to <4 x i32>*), align 16, !alias.scope !5, !noalias !13
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* bitcast (i32* getelementptr inbounds ([256 x i32], [256 x i32]* @p, i64 0, i64 108) to <4 x i32>*), align 16, !alias.scope !4, !noalias !14
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* bitcast (i32* getelementptr inbounds ([256 x i32], [256 x i32]* @u, i64 0, i64 112) to <4 x i32>*), align 16, !alias.scope !8, !noalias !12
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* bitcast (i32* getelementptr inbounds ([256 x i32], [256 x i32]* @v, i64 0, i64 112) to <4 x i32>*), align 16, !alias.scope !5, !noalias !13
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* bitcast (i32* getelementptr inbounds ([256 x i32], [256 x i32]* @p, i64 0, i64 112) to <4 x i32>*), align 16, !alias.scope !4, !noalias !14
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* bitcast (i32* getelementptr inbounds ([256 x i32], [256 x i32]* @u, i64 0, i64 116) to <4 x i32>*), align 16, !alias.scope !8, !noalias !12
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* bitcast (i32* getelementptr inbounds ([256 x i32], [256 x i32]* @v, i64 0, i64 116) to <4 x i32>*), align 16, !alias.scope !5, !noalias !13
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* bitcast (i32* getelementptr inbounds ([256 x i32], [256 x i32]* @p, i64 0, i64 116) to <4 x i32>*), align 16, !alias.scope !4, !noalias !14
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* bitcast (i32* getelementptr inbounds ([256 x i32], [256 x i32]* @u, i64 0, i64 120) to <4 x i32>*), align 16, !alias.scope !8, !noalias !12
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* bitcast (i32* getelementptr inbounds ([256 x i32], [256 x i32]* @v, i64 0, i64 120) to <4 x i32>*), align 16, !alias.scope !5, !noalias !13
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* bitcast (i32* getelementptr inbounds ([256 x i32], [256 x i32]* @p, i64 0, i64 120) to <4 x i32>*), align 16, !alias.scope !4, !noalias !14
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* bitcast (i32* getelementptr inbounds ([256 x i32], [256 x i32]* @u, i64 0, i64 124) to <4 x i32>*), align 16, !alias.scope !8, !noalias !12
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* bitcast (i32* getelementptr inbounds ([256 x i32], [256 x i32]* @v, i64 0, i64 124) to <4 x i32>*), align 16, !alias.scope !5, !noalias !13
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* bitcast (i32* getelementptr inbounds ([256 x i32], [256 x i32]* @p, i64 0, i64 124) to <4 x i32>*), align 16, !alias.scope !4, !noalias !14
  br label %vector.ph93

vector.ph93:                                      ; preds = %vector.ph93.preheader, %vector.body89
  %polly.indvar10.4 = phi i64 [ %polly.indvar_next11.4, %vector.body89 ], [ 0, %vector.ph93.preheader ]
  br label %vector.body89

vector.body89:                                    ; preds = %vector.ph93
  %polly.indvar_next11.4 = add nuw nsw i64 %polly.indvar10.4, 1
  %exitcond37.4 = icmp eq i64 %polly.indvar_next11.4, 8388608
  br i1 %exitcond37.4, label %vector.ph105.preheader, label %vector.ph93

vector.ph105.preheader:                           ; preds = %vector.body89
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* bitcast (i32* getelementptr inbounds ([256 x i32], [256 x i32]* @u, i64 0, i64 128) to <4 x i32>*), align 16, !alias.scope !8, !noalias !12
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* bitcast (i32* getelementptr inbounds ([256 x i32], [256 x i32]* @v, i64 0, i64 128) to <4 x i32>*), align 16, !alias.scope !5, !noalias !13
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* bitcast (i32* getelementptr inbounds ([256 x i32], [256 x i32]* @p, i64 0, i64 128) to <4 x i32>*), align 16, !alias.scope !4, !noalias !14
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* bitcast (i32* getelementptr inbounds ([256 x i32], [256 x i32]* @u, i64 0, i64 132) to <4 x i32>*), align 16, !alias.scope !8, !noalias !12
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* bitcast (i32* getelementptr inbounds ([256 x i32], [256 x i32]* @v, i64 0, i64 132) to <4 x i32>*), align 16, !alias.scope !5, !noalias !13
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* bitcast (i32* getelementptr inbounds ([256 x i32], [256 x i32]* @p, i64 0, i64 132) to <4 x i32>*), align 16, !alias.scope !4, !noalias !14
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* bitcast (i32* getelementptr inbounds ([256 x i32], [256 x i32]* @u, i64 0, i64 136) to <4 x i32>*), align 16, !alias.scope !8, !noalias !12
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* bitcast (i32* getelementptr inbounds ([256 x i32], [256 x i32]* @v, i64 0, i64 136) to <4 x i32>*), align 16, !alias.scope !5, !noalias !13
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* bitcast (i32* getelementptr inbounds ([256 x i32], [256 x i32]* @p, i64 0, i64 136) to <4 x i32>*), align 16, !alias.scope !4, !noalias !14
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* bitcast (i32* getelementptr inbounds ([256 x i32], [256 x i32]* @u, i64 0, i64 140) to <4 x i32>*), align 16, !alias.scope !8, !noalias !12
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* bitcast (i32* getelementptr inbounds ([256 x i32], [256 x i32]* @v, i64 0, i64 140) to <4 x i32>*), align 16, !alias.scope !5, !noalias !13
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* bitcast (i32* getelementptr inbounds ([256 x i32], [256 x i32]* @p, i64 0, i64 140) to <4 x i32>*), align 16, !alias.scope !4, !noalias !14
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* bitcast (i32* getelementptr inbounds ([256 x i32], [256 x i32]* @u, i64 0, i64 144) to <4 x i32>*), align 16, !alias.scope !8, !noalias !12
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* bitcast (i32* getelementptr inbounds ([256 x i32], [256 x i32]* @v, i64 0, i64 144) to <4 x i32>*), align 16, !alias.scope !5, !noalias !13
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* bitcast (i32* getelementptr inbounds ([256 x i32], [256 x i32]* @p, i64 0, i64 144) to <4 x i32>*), align 16, !alias.scope !4, !noalias !14
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* bitcast (i32* getelementptr inbounds ([256 x i32], [256 x i32]* @u, i64 0, i64 148) to <4 x i32>*), align 16, !alias.scope !8, !noalias !12
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* bitcast (i32* getelementptr inbounds ([256 x i32], [256 x i32]* @v, i64 0, i64 148) to <4 x i32>*), align 16, !alias.scope !5, !noalias !13
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* bitcast (i32* getelementptr inbounds ([256 x i32], [256 x i32]* @p, i64 0, i64 148) to <4 x i32>*), align 16, !alias.scope !4, !noalias !14
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* bitcast (i32* getelementptr inbounds ([256 x i32], [256 x i32]* @u, i64 0, i64 152) to <4 x i32>*), align 16, !alias.scope !8, !noalias !12
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* bitcast (i32* getelementptr inbounds ([256 x i32], [256 x i32]* @v, i64 0, i64 152) to <4 x i32>*), align 16, !alias.scope !5, !noalias !13
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* bitcast (i32* getelementptr inbounds ([256 x i32], [256 x i32]* @p, i64 0, i64 152) to <4 x i32>*), align 16, !alias.scope !4, !noalias !14
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* bitcast (i32* getelementptr inbounds ([256 x i32], [256 x i32]* @u, i64 0, i64 156) to <4 x i32>*), align 16, !alias.scope !8, !noalias !12
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* bitcast (i32* getelementptr inbounds ([256 x i32], [256 x i32]* @v, i64 0, i64 156) to <4 x i32>*), align 16, !alias.scope !5, !noalias !13
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* bitcast (i32* getelementptr inbounds ([256 x i32], [256 x i32]* @p, i64 0, i64 156) to <4 x i32>*), align 16, !alias.scope !4, !noalias !14
  br label %vector.ph105

vector.ph105:                                     ; preds = %vector.ph105.preheader, %vector.body101
  %polly.indvar10.5 = phi i64 [ %polly.indvar_next11.5, %vector.body101 ], [ 0, %vector.ph105.preheader ]
  br label %vector.body101

vector.body101:                                   ; preds = %vector.ph105
  %polly.indvar_next11.5 = add nuw nsw i64 %polly.indvar10.5, 1
  %exitcond37.5 = icmp eq i64 %polly.indvar_next11.5, 8388608
  br i1 %exitcond37.5, label %vector.ph117.preheader, label %vector.ph105

vector.ph117.preheader:                           ; preds = %vector.body101
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* bitcast (i32* getelementptr inbounds ([256 x i32], [256 x i32]* @u, i64 0, i64 160) to <4 x i32>*), align 16, !alias.scope !8, !noalias !12
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* bitcast (i32* getelementptr inbounds ([256 x i32], [256 x i32]* @v, i64 0, i64 160) to <4 x i32>*), align 16, !alias.scope !5, !noalias !13
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* bitcast (i32* getelementptr inbounds ([256 x i32], [256 x i32]* @p, i64 0, i64 160) to <4 x i32>*), align 16, !alias.scope !4, !noalias !14
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* bitcast (i32* getelementptr inbounds ([256 x i32], [256 x i32]* @u, i64 0, i64 164) to <4 x i32>*), align 16, !alias.scope !8, !noalias !12
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* bitcast (i32* getelementptr inbounds ([256 x i32], [256 x i32]* @v, i64 0, i64 164) to <4 x i32>*), align 16, !alias.scope !5, !noalias !13
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* bitcast (i32* getelementptr inbounds ([256 x i32], [256 x i32]* @p, i64 0, i64 164) to <4 x i32>*), align 16, !alias.scope !4, !noalias !14
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* bitcast (i32* getelementptr inbounds ([256 x i32], [256 x i32]* @u, i64 0, i64 168) to <4 x i32>*), align 16, !alias.scope !8, !noalias !12
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* bitcast (i32* getelementptr inbounds ([256 x i32], [256 x i32]* @v, i64 0, i64 168) to <4 x i32>*), align 16, !alias.scope !5, !noalias !13
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* bitcast (i32* getelementptr inbounds ([256 x i32], [256 x i32]* @p, i64 0, i64 168) to <4 x i32>*), align 16, !alias.scope !4, !noalias !14
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* bitcast (i32* getelementptr inbounds ([256 x i32], [256 x i32]* @u, i64 0, i64 172) to <4 x i32>*), align 16, !alias.scope !8, !noalias !12
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* bitcast (i32* getelementptr inbounds ([256 x i32], [256 x i32]* @v, i64 0, i64 172) to <4 x i32>*), align 16, !alias.scope !5, !noalias !13
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* bitcast (i32* getelementptr inbounds ([256 x i32], [256 x i32]* @p, i64 0, i64 172) to <4 x i32>*), align 16, !alias.scope !4, !noalias !14
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* bitcast (i32* getelementptr inbounds ([256 x i32], [256 x i32]* @u, i64 0, i64 176) to <4 x i32>*), align 16, !alias.scope !8, !noalias !12
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* bitcast (i32* getelementptr inbounds ([256 x i32], [256 x i32]* @v, i64 0, i64 176) to <4 x i32>*), align 16, !alias.scope !5, !noalias !13
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* bitcast (i32* getelementptr inbounds ([256 x i32], [256 x i32]* @p, i64 0, i64 176) to <4 x i32>*), align 16, !alias.scope !4, !noalias !14
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* bitcast (i32* getelementptr inbounds ([256 x i32], [256 x i32]* @u, i64 0, i64 180) to <4 x i32>*), align 16, !alias.scope !8, !noalias !12
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* bitcast (i32* getelementptr inbounds ([256 x i32], [256 x i32]* @v, i64 0, i64 180) to <4 x i32>*), align 16, !alias.scope !5, !noalias !13
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* bitcast (i32* getelementptr inbounds ([256 x i32], [256 x i32]* @p, i64 0, i64 180) to <4 x i32>*), align 16, !alias.scope !4, !noalias !14
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* bitcast (i32* getelementptr inbounds ([256 x i32], [256 x i32]* @u, i64 0, i64 184) to <4 x i32>*), align 16, !alias.scope !8, !noalias !12
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* bitcast (i32* getelementptr inbounds ([256 x i32], [256 x i32]* @v, i64 0, i64 184) to <4 x i32>*), align 16, !alias.scope !5, !noalias !13
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* bitcast (i32* getelementptr inbounds ([256 x i32], [256 x i32]* @p, i64 0, i64 184) to <4 x i32>*), align 16, !alias.scope !4, !noalias !14
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* bitcast (i32* getelementptr inbounds ([256 x i32], [256 x i32]* @u, i64 0, i64 188) to <4 x i32>*), align 16, !alias.scope !8, !noalias !12
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* bitcast (i32* getelementptr inbounds ([256 x i32], [256 x i32]* @v, i64 0, i64 188) to <4 x i32>*), align 16, !alias.scope !5, !noalias !13
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* bitcast (i32* getelementptr inbounds ([256 x i32], [256 x i32]* @p, i64 0, i64 188) to <4 x i32>*), align 16, !alias.scope !4, !noalias !14
  br label %vector.ph117

vector.ph117:                                     ; preds = %vector.ph117.preheader, %vector.body113
  %polly.indvar10.6 = phi i64 [ %polly.indvar_next11.6, %vector.body113 ], [ 0, %vector.ph117.preheader ]
  br label %vector.body113

vector.body113:                                   ; preds = %vector.ph117
  %polly.indvar_next11.6 = add nuw nsw i64 %polly.indvar10.6, 1
  %exitcond37.6 = icmp eq i64 %polly.indvar_next11.6, 8388608
  br i1 %exitcond37.6, label %vector.ph129.preheader, label %vector.ph117

vector.ph129.preheader:                           ; preds = %vector.body113
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* bitcast (i32* getelementptr inbounds ([256 x i32], [256 x i32]* @u, i64 0, i64 192) to <4 x i32>*), align 16, !alias.scope !8, !noalias !12
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* bitcast (i32* getelementptr inbounds ([256 x i32], [256 x i32]* @v, i64 0, i64 192) to <4 x i32>*), align 16, !alias.scope !5, !noalias !13
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* bitcast (i32* getelementptr inbounds ([256 x i32], [256 x i32]* @p, i64 0, i64 192) to <4 x i32>*), align 16, !alias.scope !4, !noalias !14
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* bitcast (i32* getelementptr inbounds ([256 x i32], [256 x i32]* @u, i64 0, i64 196) to <4 x i32>*), align 16, !alias.scope !8, !noalias !12
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* bitcast (i32* getelementptr inbounds ([256 x i32], [256 x i32]* @v, i64 0, i64 196) to <4 x i32>*), align 16, !alias.scope !5, !noalias !13
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* bitcast (i32* getelementptr inbounds ([256 x i32], [256 x i32]* @p, i64 0, i64 196) to <4 x i32>*), align 16, !alias.scope !4, !noalias !14
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* bitcast (i32* getelementptr inbounds ([256 x i32], [256 x i32]* @u, i64 0, i64 200) to <4 x i32>*), align 16, !alias.scope !8, !noalias !12
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* bitcast (i32* getelementptr inbounds ([256 x i32], [256 x i32]* @v, i64 0, i64 200) to <4 x i32>*), align 16, !alias.scope !5, !noalias !13
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* bitcast (i32* getelementptr inbounds ([256 x i32], [256 x i32]* @p, i64 0, i64 200) to <4 x i32>*), align 16, !alias.scope !4, !noalias !14
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* bitcast (i32* getelementptr inbounds ([256 x i32], [256 x i32]* @u, i64 0, i64 204) to <4 x i32>*), align 16, !alias.scope !8, !noalias !12
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* bitcast (i32* getelementptr inbounds ([256 x i32], [256 x i32]* @v, i64 0, i64 204) to <4 x i32>*), align 16, !alias.scope !5, !noalias !13
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* bitcast (i32* getelementptr inbounds ([256 x i32], [256 x i32]* @p, i64 0, i64 204) to <4 x i32>*), align 16, !alias.scope !4, !noalias !14
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* bitcast (i32* getelementptr inbounds ([256 x i32], [256 x i32]* @u, i64 0, i64 208) to <4 x i32>*), align 16, !alias.scope !8, !noalias !12
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* bitcast (i32* getelementptr inbounds ([256 x i32], [256 x i32]* @v, i64 0, i64 208) to <4 x i32>*), align 16, !alias.scope !5, !noalias !13
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* bitcast (i32* getelementptr inbounds ([256 x i32], [256 x i32]* @p, i64 0, i64 208) to <4 x i32>*), align 16, !alias.scope !4, !noalias !14
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* bitcast (i32* getelementptr inbounds ([256 x i32], [256 x i32]* @u, i64 0, i64 212) to <4 x i32>*), align 16, !alias.scope !8, !noalias !12
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* bitcast (i32* getelementptr inbounds ([256 x i32], [256 x i32]* @v, i64 0, i64 212) to <4 x i32>*), align 16, !alias.scope !5, !noalias !13
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* bitcast (i32* getelementptr inbounds ([256 x i32], [256 x i32]* @p, i64 0, i64 212) to <4 x i32>*), align 16, !alias.scope !4, !noalias !14
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* bitcast (i32* getelementptr inbounds ([256 x i32], [256 x i32]* @u, i64 0, i64 216) to <4 x i32>*), align 16, !alias.scope !8, !noalias !12
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* bitcast (i32* getelementptr inbounds ([256 x i32], [256 x i32]* @v, i64 0, i64 216) to <4 x i32>*), align 16, !alias.scope !5, !noalias !13
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* bitcast (i32* getelementptr inbounds ([256 x i32], [256 x i32]* @p, i64 0, i64 216) to <4 x i32>*), align 16, !alias.scope !4, !noalias !14
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* bitcast (i32* getelementptr inbounds ([256 x i32], [256 x i32]* @u, i64 0, i64 220) to <4 x i32>*), align 16, !alias.scope !8, !noalias !12
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* bitcast (i32* getelementptr inbounds ([256 x i32], [256 x i32]* @v, i64 0, i64 220) to <4 x i32>*), align 16, !alias.scope !5, !noalias !13
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* bitcast (i32* getelementptr inbounds ([256 x i32], [256 x i32]* @p, i64 0, i64 220) to <4 x i32>*), align 16, !alias.scope !4, !noalias !14
  br label %vector.ph129

vector.ph129:                                     ; preds = %vector.ph129.preheader, %vector.body125
  %polly.indvar10.7 = phi i64 [ %polly.indvar_next11.7, %vector.body125 ], [ 0, %vector.ph129.preheader ]
  br label %vector.body125

vector.body125:                                   ; preds = %vector.ph129
  %polly.indvar_next11.7 = add nuw nsw i64 %polly.indvar10.7, 1
  %exitcond37.7 = icmp eq i64 %polly.indvar_next11.7, 8388608
  br i1 %exitcond37.7, label %vector.body137.preheader, label %vector.ph129

vector.body137.preheader:                         ; preds = %vector.body125
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* bitcast (i32* getelementptr inbounds ([256 x i32], [256 x i32]* @u, i64 0, i64 224) to <4 x i32>*), align 16, !alias.scope !8, !noalias !12
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* bitcast (i32* getelementptr inbounds ([256 x i32], [256 x i32]* @v, i64 0, i64 224) to <4 x i32>*), align 16, !alias.scope !5, !noalias !13
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* bitcast (i32* getelementptr inbounds ([256 x i32], [256 x i32]* @p, i64 0, i64 224) to <4 x i32>*), align 16, !alias.scope !4, !noalias !14
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* bitcast (i32* getelementptr inbounds ([256 x i32], [256 x i32]* @u, i64 0, i64 228) to <4 x i32>*), align 16, !alias.scope !8, !noalias !12
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* bitcast (i32* getelementptr inbounds ([256 x i32], [256 x i32]* @v, i64 0, i64 228) to <4 x i32>*), align 16, !alias.scope !5, !noalias !13
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* bitcast (i32* getelementptr inbounds ([256 x i32], [256 x i32]* @p, i64 0, i64 228) to <4 x i32>*), align 16, !alias.scope !4, !noalias !14
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* bitcast (i32* getelementptr inbounds ([256 x i32], [256 x i32]* @u, i64 0, i64 232) to <4 x i32>*), align 16, !alias.scope !8, !noalias !12
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* bitcast (i32* getelementptr inbounds ([256 x i32], [256 x i32]* @v, i64 0, i64 232) to <4 x i32>*), align 16, !alias.scope !5, !noalias !13
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* bitcast (i32* getelementptr inbounds ([256 x i32], [256 x i32]* @p, i64 0, i64 232) to <4 x i32>*), align 16, !alias.scope !4, !noalias !14
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* bitcast (i32* getelementptr inbounds ([256 x i32], [256 x i32]* @u, i64 0, i64 236) to <4 x i32>*), align 16, !alias.scope !8, !noalias !12
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* bitcast (i32* getelementptr inbounds ([256 x i32], [256 x i32]* @v, i64 0, i64 236) to <4 x i32>*), align 16, !alias.scope !5, !noalias !13
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* bitcast (i32* getelementptr inbounds ([256 x i32], [256 x i32]* @p, i64 0, i64 236) to <4 x i32>*), align 16, !alias.scope !4, !noalias !14
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* bitcast (i32* getelementptr inbounds ([256 x i32], [256 x i32]* @u, i64 0, i64 240) to <4 x i32>*), align 16, !alias.scope !8, !noalias !12
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* bitcast (i32* getelementptr inbounds ([256 x i32], [256 x i32]* @v, i64 0, i64 240) to <4 x i32>*), align 16, !alias.scope !5, !noalias !13
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* bitcast (i32* getelementptr inbounds ([256 x i32], [256 x i32]* @p, i64 0, i64 240) to <4 x i32>*), align 16, !alias.scope !4, !noalias !14
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* bitcast (i32* getelementptr inbounds ([256 x i32], [256 x i32]* @u, i64 0, i64 244) to <4 x i32>*), align 16, !alias.scope !8, !noalias !12
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* bitcast (i32* getelementptr inbounds ([256 x i32], [256 x i32]* @v, i64 0, i64 244) to <4 x i32>*), align 16, !alias.scope !5, !noalias !13
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* bitcast (i32* getelementptr inbounds ([256 x i32], [256 x i32]* @p, i64 0, i64 244) to <4 x i32>*), align 16, !alias.scope !4, !noalias !14
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* bitcast (i32* getelementptr inbounds ([256 x i32], [256 x i32]* @u, i64 0, i64 248) to <4 x i32>*), align 16, !alias.scope !8, !noalias !12
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* bitcast (i32* getelementptr inbounds ([256 x i32], [256 x i32]* @v, i64 0, i64 248) to <4 x i32>*), align 16, !alias.scope !5, !noalias !13
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* bitcast (i32* getelementptr inbounds ([256 x i32], [256 x i32]* @p, i64 0, i64 248) to <4 x i32>*), align 16, !alias.scope !4, !noalias !14
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* bitcast (i32* getelementptr inbounds ([256 x i32], [256 x i32]* @u, i64 0, i64 252) to <4 x i32>*), align 16, !alias.scope !8, !noalias !12
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* bitcast (i32* getelementptr inbounds ([256 x i32], [256 x i32]* @v, i64 0, i64 252) to <4 x i32>*), align 16, !alias.scope !5, !noalias !13
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* bitcast (i32* getelementptr inbounds ([256 x i32], [256 x i32]* @p, i64 0, i64 252) to <4 x i32>*), align 16, !alias.scope !4, !noalias !14
  br label %vector.body137

vector.body137:                                   ; preds = %vector.body137, %vector.body137.preheader
  %index142 = phi i64 [ 0, %vector.body137.preheader ], [ %index.next143.1, %vector.body137 ]
  %vec.phi = phi <2 x i64> [ zeroinitializer, %vector.body137.preheader ], [ %47, %vector.body137 ]
  %vec.phi146 = phi <2 x i64> [ zeroinitializer, %vector.body137.preheader ], [ %48, %vector.body137 ]
  %33 = getelementptr [268435456 x i32], [268435456 x i32]* @sum, i64 0, i64 %index142
  %34 = bitcast i32* %33 to <2 x i32>*
  %wide.load = load <2 x i32>, <2 x i32>* %34, align 16, !alias.scope !1, !noalias !3
  %35 = getelementptr i32, i32* %33, i64 2
  %36 = bitcast i32* %35 to <2 x i32>*
  %wide.load151 = load <2 x i32>, <2 x i32>* %36, align 8, !alias.scope !1, !noalias !3
  %37 = sext <2 x i32> %wide.load to <2 x i64>
  %38 = sext <2 x i32> %wide.load151 to <2 x i64>
  %39 = add nsw <2 x i64> %37, %vec.phi
  %40 = add nsw <2 x i64> %38, %vec.phi146
  %index.next143 = or i64 %index142, 4
  %41 = getelementptr [268435456 x i32], [268435456 x i32]* @sum, i64 0, i64 %index.next143
  %42 = bitcast i32* %41 to <2 x i32>*
  %wide.load.1 = load <2 x i32>, <2 x i32>* %42, align 16, !alias.scope !1, !noalias !3
  %43 = getelementptr i32, i32* %41, i64 2
  %44 = bitcast i32* %43 to <2 x i32>*
  %wide.load151.1 = load <2 x i32>, <2 x i32>* %44, align 8, !alias.scope !1, !noalias !3
  %45 = sext <2 x i32> %wide.load.1 to <2 x i64>
  %46 = sext <2 x i32> %wide.load151.1 to <2 x i64>
  %47 = add nsw <2 x i64> %45, %39
  %48 = add nsw <2 x i64> %46, %40
  %index.next143.1 = add nsw i64 %index142, 8
  %49 = icmp eq i64 %index.next143.1, 268435456
  br i1 %49, label %middle.block138, label %vector.body137, !llvm.loop !15

middle.block138:                                  ; preds = %vector.body137
  %.lcssa154 = phi <2 x i64> [ %48, %vector.body137 ]
  %.lcssa = phi <2 x i64> [ %47, %vector.body137 ]
  %bin.rdx = add <2 x i64> %.lcssa154, %.lcssa
  %rdx.shuf = shufflevector <2 x i64> %bin.rdx, <2 x i64> undef, <2 x i32> <i32 1, i32 undef>
  %bin.rdx152 = add <2 x i64> %bin.rdx, %rdx.shuf
  %50 = extractelement <2 x i64> %bin.rdx152, i32 0
  %cmp27 = icmp eq i64 %50, 68719476736
  br i1 %cmp27, label %if.end, label %if.then
}

; Function Attrs: nounwind
declare i32 @printf(i8* nocapture readonly, ...) #1

; Function Attrs: noreturn nounwind
declare void @exit(i32) #2

; Function Attrs: nounwind
declare i8* @setlocale(i32, i8*) #1

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "polly-optimized" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noreturn nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind }
attributes #4 = { noreturn nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 3.9.0 (http://llvm.org/git/clang.git e177b4a63ca92c5fec010986944530688e104074) (http://llvm.org/git/llvm.git fcd97ccb03712372fe95f1732638de5ed3fcabe8)"}
!1 = distinct !{!1, !2, !"polly.alias.scope.sum"}
!2 = distinct !{!2, !"polly.alias.scope.domain"}
!3 = !{!4, !5, !6, !7, !8}
!4 = distinct !{!4, !2, !"polly.alias.scope.p"}
!5 = distinct !{!5, !2, !"polly.alias.scope.v"}
!6 = distinct !{!6, !2, !"polly.alias.scope.total.02"}
!7 = distinct !{!7, !2, !"polly.alias.scope.add23"}
!8 = distinct !{!8, !2, !"polly.alias.scope.u"}
!9 = distinct !{!9, !10, !11}
!10 = !{!"llvm.loop.vectorize.width", i32 1}
!11 = !{!"llvm.loop.interleave.count", i32 1}
!12 = !{!4, !5, !6, !1, !7}
!13 = !{!4, !6, !1, !7, !8}
!14 = !{!5, !6, !1, !7, !8}
!15 = distinct !{!15, !10, !11}
