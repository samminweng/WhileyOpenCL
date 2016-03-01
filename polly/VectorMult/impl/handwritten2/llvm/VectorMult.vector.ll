; ModuleID = 'VectorMult.preopt.ll'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@u = common global [1024 x i32] zeroinitializer, align 16
@v = common global [1024 x i32] zeroinitializer, align 16
@p = common global [1024 x i32] zeroinitializer, align 16
@sum = common global [67108864 x i32] zeroinitializer, align 16
@.str = private unnamed_addr constant [34 x i8] c"fail to multiply two unit vectors\00", align 1
@.str.1 = private unnamed_addr constant [1 x i8] zeroinitializer, align 1
@.str.2 = private unnamed_addr constant [100 x i8] c"Pass the %'lld vector multiplication test case with local vector size = %d\0AThe Dot Product = %'lld\0A\00", align 1

; Function Attrs: nounwind uwtable
define i32 @main(i32 %argc, i8** nocapture readnone %args) #0 {
entry:
  %.s2a186 = alloca <2 x i64>
  %.s2a = alloca <2 x i64>
  %vec.phi69.phiops = alloca <2 x i64>
  %vec.phi.phiops = alloca <2 x i64>
  br label %polly.split_new_and_old

polly.split_new_and_old:                          ; preds = %entry
  br i1 true, label %polly.start, label %vector.body

vector.body:                                      ; preds = %polly.split_new_and_old, %vector.body
  %index = phi i64 [ %index.next.7, %vector.body ], [ 0, %polly.split_new_and_old ]
  %0 = getelementptr [67108864 x i32], [67108864 x i32]* @sum, i64 0, i64 %index
  %1 = bitcast i32* %0 to <4 x i32>*
  store <4 x i32> <i32 1024, i32 1024, i32 1024, i32 1024>, <4 x i32>* %1, align 16, !alias.scope !1, !noalias !3
  %2 = getelementptr i32, i32* %0, i64 4
  %3 = bitcast i32* %2 to <4 x i32>*
  store <4 x i32> <i32 1024, i32 1024, i32 1024, i32 1024>, <4 x i32>* %3, align 16, !alias.scope !1, !noalias !3
  %index.next = or i64 %index, 8
  %4 = getelementptr [67108864 x i32], [67108864 x i32]* @sum, i64 0, i64 %index.next
  %5 = bitcast i32* %4 to <4 x i32>*
  store <4 x i32> <i32 1024, i32 1024, i32 1024, i32 1024>, <4 x i32>* %5, align 16, !alias.scope !1, !noalias !3
  %6 = getelementptr i32, i32* %4, i64 4
  %7 = bitcast i32* %6 to <4 x i32>*
  store <4 x i32> <i32 1024, i32 1024, i32 1024, i32 1024>, <4 x i32>* %7, align 16, !alias.scope !1, !noalias !3
  %index.next.1 = or i64 %index, 16
  %8 = getelementptr [67108864 x i32], [67108864 x i32]* @sum, i64 0, i64 %index.next.1
  %9 = bitcast i32* %8 to <4 x i32>*
  store <4 x i32> <i32 1024, i32 1024, i32 1024, i32 1024>, <4 x i32>* %9, align 16, !alias.scope !1, !noalias !3
  %10 = getelementptr i32, i32* %8, i64 4
  %11 = bitcast i32* %10 to <4 x i32>*
  store <4 x i32> <i32 1024, i32 1024, i32 1024, i32 1024>, <4 x i32>* %11, align 16, !alias.scope !1, !noalias !3
  %index.next.2 = or i64 %index, 24
  %12 = getelementptr [67108864 x i32], [67108864 x i32]* @sum, i64 0, i64 %index.next.2
  %13 = bitcast i32* %12 to <4 x i32>*
  store <4 x i32> <i32 1024, i32 1024, i32 1024, i32 1024>, <4 x i32>* %13, align 16, !alias.scope !1, !noalias !3
  %14 = getelementptr i32, i32* %12, i64 4
  %15 = bitcast i32* %14 to <4 x i32>*
  store <4 x i32> <i32 1024, i32 1024, i32 1024, i32 1024>, <4 x i32>* %15, align 16, !alias.scope !1, !noalias !3
  %index.next.3 = or i64 %index, 32
  %16 = getelementptr [67108864 x i32], [67108864 x i32]* @sum, i64 0, i64 %index.next.3
  %17 = bitcast i32* %16 to <4 x i32>*
  store <4 x i32> <i32 1024, i32 1024, i32 1024, i32 1024>, <4 x i32>* %17, align 16, !alias.scope !1, !noalias !3
  %18 = getelementptr i32, i32* %16, i64 4
  %19 = bitcast i32* %18 to <4 x i32>*
  store <4 x i32> <i32 1024, i32 1024, i32 1024, i32 1024>, <4 x i32>* %19, align 16, !alias.scope !1, !noalias !3
  %index.next.4 = or i64 %index, 40
  %20 = getelementptr [67108864 x i32], [67108864 x i32]* @sum, i64 0, i64 %index.next.4
  %21 = bitcast i32* %20 to <4 x i32>*
  store <4 x i32> <i32 1024, i32 1024, i32 1024, i32 1024>, <4 x i32>* %21, align 16, !alias.scope !1, !noalias !3
  %22 = getelementptr i32, i32* %20, i64 4
  %23 = bitcast i32* %22 to <4 x i32>*
  store <4 x i32> <i32 1024, i32 1024, i32 1024, i32 1024>, <4 x i32>* %23, align 16, !alias.scope !1, !noalias !3
  %index.next.5 = or i64 %index, 48
  %24 = getelementptr [67108864 x i32], [67108864 x i32]* @sum, i64 0, i64 %index.next.5
  %25 = bitcast i32* %24 to <4 x i32>*
  store <4 x i32> <i32 1024, i32 1024, i32 1024, i32 1024>, <4 x i32>* %25, align 16, !alias.scope !1, !noalias !3
  %26 = getelementptr i32, i32* %24, i64 4
  %27 = bitcast i32* %26 to <4 x i32>*
  store <4 x i32> <i32 1024, i32 1024, i32 1024, i32 1024>, <4 x i32>* %27, align 16, !alias.scope !1, !noalias !3
  %index.next.6 = or i64 %index, 56
  %28 = getelementptr [67108864 x i32], [67108864 x i32]* @sum, i64 0, i64 %index.next.6
  %29 = bitcast i32* %28 to <4 x i32>*
  store <4 x i32> <i32 1024, i32 1024, i32 1024, i32 1024>, <4 x i32>* %29, align 16, !alias.scope !1, !noalias !3
  %30 = getelementptr i32, i32* %28, i64 4
  %31 = bitcast i32* %30 to <4 x i32>*
  store <4 x i32> <i32 1024, i32 1024, i32 1024, i32 1024>, <4 x i32>* %31, align 16, !alias.scope !1, !noalias !3
  %index.next.7 = add nsw i64 %index, 64
  %32 = icmp eq i64 %index.next.7, 67108864
  br i1 %32, label %polly.loop_preheader8.preheader, label %vector.body, !llvm.loop !9

polly.loop_preheader8.preheader:                  ; preds = %vector.body
  br label %polly.loop_preheader8

if.then:                                          ; preds = %middle.block61
  %call = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([34 x i8], [34 x i8]* @.str, i64 0, i64 0)) #3
  tail call void @exit(i32 -2) #4
  unreachable

if.end:                                           ; preds = %middle.block61
  %call29 = tail call i8* @setlocale(i32 6, i8* getelementptr inbounds ([1 x i8], [1 x i8]* @.str.1, i64 0, i64 0)) #3
  %call30 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([100 x i8], [100 x i8]* @.str.2, i64 0, i64 0), i64 68719476736, i32 1024, i64 68719476736) #3
  ret i32 0

polly.loop_exit9:                                 ; preds = %vector.body48.7
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* %54, align 16, !alias.scope !4, !noalias !12
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* %55, align 16, !alias.scope !8, !noalias !13
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* %56, align 16, !alias.scope !6, !noalias !14
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* %58, align 16, !alias.scope !4, !noalias !12
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* %59, align 16, !alias.scope !8, !noalias !13
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* %60, align 16, !alias.scope !6, !noalias !14
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* %62, align 16, !alias.scope !4, !noalias !12
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* %63, align 16, !alias.scope !8, !noalias !13
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* %64, align 16, !alias.scope !6, !noalias !14
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* %66, align 16, !alias.scope !4, !noalias !12
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* %67, align 16, !alias.scope !8, !noalias !13
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* %68, align 16, !alias.scope !6, !noalias !14
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* %70, align 16, !alias.scope !4, !noalias !12
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* %71, align 16, !alias.scope !8, !noalias !13
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* %72, align 16, !alias.scope !6, !noalias !14
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* %74, align 16, !alias.scope !4, !noalias !12
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* %75, align 16, !alias.scope !8, !noalias !13
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* %76, align 16, !alias.scope !6, !noalias !14
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* %78, align 16, !alias.scope !4, !noalias !12
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* %79, align 16, !alias.scope !8, !noalias !13
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* %80, align 16, !alias.scope !6, !noalias !14
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* %53, align 16, !alias.scope !4, !noalias !12
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* %81, align 16, !alias.scope !8, !noalias !13
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* %82, align 16, !alias.scope !6, !noalias !14
  %polly.indvar_next5 = add nuw nsw i64 %polly.indvar4, 1
  %exitcond45 = icmp eq i64 %polly.indvar_next5, 32
  br i1 %exitcond45, label %vector.body60.preheader, label %polly.loop_preheader8, !llvm.loop !15

vector.body60.preheader:                          ; preds = %polly.loop_exit9
  br label %vector.body60

vector.body60:                                    ; preds = %vector.body60, %vector.body60.preheader
  %index65 = phi i64 [ 0, %vector.body60.preheader ], [ %index.next66.1, %vector.body60 ]
  %vec.phi = phi <2 x i64> [ zeroinitializer, %vector.body60.preheader ], [ %47, %vector.body60 ]
  %vec.phi69 = phi <2 x i64> [ zeroinitializer, %vector.body60.preheader ], [ %48, %vector.body60 ]
  %33 = getelementptr [67108864 x i32], [67108864 x i32]* @sum, i64 0, i64 %index65
  %34 = bitcast i32* %33 to <2 x i32>*
  %wide.load = load <2 x i32>, <2 x i32>* %34, align 16, !alias.scope !1, !noalias !3
  %35 = getelementptr i32, i32* %33, i64 2
  %36 = bitcast i32* %35 to <2 x i32>*
  %wide.load74 = load <2 x i32>, <2 x i32>* %36, align 8, !alias.scope !1, !noalias !3
  %37 = sext <2 x i32> %wide.load to <2 x i64>
  %38 = sext <2 x i32> %wide.load74 to <2 x i64>
  %39 = add nsw <2 x i64> %37, %vec.phi
  %40 = add nsw <2 x i64> %38, %vec.phi69
  %index.next66 = or i64 %index65, 4
  %41 = getelementptr [67108864 x i32], [67108864 x i32]* @sum, i64 0, i64 %index.next66
  %42 = bitcast i32* %41 to <2 x i32>*
  %wide.load.1 = load <2 x i32>, <2 x i32>* %42, align 16, !alias.scope !1, !noalias !3
  %43 = getelementptr i32, i32* %41, i64 2
  %44 = bitcast i32* %43 to <2 x i32>*
  %wide.load74.1 = load <2 x i32>, <2 x i32>* %44, align 8, !alias.scope !1, !noalias !3
  %45 = sext <2 x i32> %wide.load.1 to <2 x i64>
  %46 = sext <2 x i32> %wide.load74.1 to <2 x i64>
  %47 = add nsw <2 x i64> %45, %39
  %48 = add nsw <2 x i64> %46, %40
  %index.next66.1 = add nsw i64 %index65, 8
  %49 = icmp eq i64 %index.next66.1, 67108864
  br i1 %49, label %polly.merge_new_and_old, label %vector.body60, !llvm.loop !16

polly.merge_new_and_old:                          ; preds = %polly.exiting, %vector.body60
  %.merge = phi <2 x i64> [ %.final_reload, %polly.exiting ], [ %48, %vector.body60 ]
  %.merge188 = phi <2 x i64> [ %.final_reload187, %polly.exiting ], [ %47, %vector.body60 ]
  br label %middle.block61

middle.block61:                                   ; preds = %polly.merge_new_and_old
  %.lcssa77 = phi <2 x i64> [ %.merge, %polly.merge_new_and_old ]
  %.lcssa = phi <2 x i64> [ %.merge188, %polly.merge_new_and_old ]
  %bin.rdx = add <2 x i64> %.lcssa77, %.lcssa
  %rdx.shuf = shufflevector <2 x i64> %bin.rdx, <2 x i64> undef, <2 x i32> <i32 1, i32 undef>
  %bin.rdx75 = add <2 x i64> %bin.rdx, %rdx.shuf
  %50 = extractelement <2 x i64> %bin.rdx75, i32 0
  %cmp27 = icmp eq i64 %50, 68719476736
  br i1 %cmp27, label %if.end, label %if.then

polly.loop_preheader8:                            ; preds = %polly.loop_preheader8.preheader, %polly.loop_exit9
  %polly.indvar4 = phi i64 [ %polly.indvar_next5, %polly.loop_exit9 ], [ 0, %polly.loop_preheader8.preheader ]
  %51 = shl i64 %polly.indvar4, 5
  %52 = or i64 %51, 28
  %scevgep31.7 = getelementptr [1024 x i32], [1024 x i32]* @u, i64 0, i64 %52
  %53 = bitcast i32* %scevgep31.7 to <4 x i32>*
  %scevgep33.7 = getelementptr [1024 x i32], [1024 x i32]* @p, i64 0, i64 %52
  %scevgep32.7 = getelementptr [1024 x i32], [1024 x i32]* @v, i64 0, i64 %52
  %scevgep33 = getelementptr [1024 x i32], [1024 x i32]* @p, i64 0, i64 %51
  %scevgep32 = getelementptr [1024 x i32], [1024 x i32]* @v, i64 0, i64 %51
  %scevgep31 = getelementptr [1024 x i32], [1024 x i32]* @u, i64 0, i64 %51
  %54 = bitcast i32* %scevgep31 to <4 x i32>*
  %55 = bitcast i32* %scevgep32 to <4 x i32>*
  %56 = bitcast i32* %scevgep33 to <4 x i32>*
  %57 = or i64 %51, 4
  %scevgep33.1 = getelementptr [1024 x i32], [1024 x i32]* @p, i64 0, i64 %57
  %scevgep32.1 = getelementptr [1024 x i32], [1024 x i32]* @v, i64 0, i64 %57
  %scevgep31.1 = getelementptr [1024 x i32], [1024 x i32]* @u, i64 0, i64 %57
  %58 = bitcast i32* %scevgep31.1 to <4 x i32>*
  %59 = bitcast i32* %scevgep32.1 to <4 x i32>*
  %60 = bitcast i32* %scevgep33.1 to <4 x i32>*
  %61 = or i64 %51, 8
  %scevgep33.2 = getelementptr [1024 x i32], [1024 x i32]* @p, i64 0, i64 %61
  %scevgep32.2 = getelementptr [1024 x i32], [1024 x i32]* @v, i64 0, i64 %61
  %scevgep31.2 = getelementptr [1024 x i32], [1024 x i32]* @u, i64 0, i64 %61
  %62 = bitcast i32* %scevgep31.2 to <4 x i32>*
  %63 = bitcast i32* %scevgep32.2 to <4 x i32>*
  %64 = bitcast i32* %scevgep33.2 to <4 x i32>*
  %65 = or i64 %51, 12
  %scevgep33.3 = getelementptr [1024 x i32], [1024 x i32]* @p, i64 0, i64 %65
  %scevgep32.3 = getelementptr [1024 x i32], [1024 x i32]* @v, i64 0, i64 %65
  %scevgep31.3 = getelementptr [1024 x i32], [1024 x i32]* @u, i64 0, i64 %65
  %66 = bitcast i32* %scevgep31.3 to <4 x i32>*
  %67 = bitcast i32* %scevgep32.3 to <4 x i32>*
  %68 = bitcast i32* %scevgep33.3 to <4 x i32>*
  %69 = or i64 %51, 16
  %scevgep33.4 = getelementptr [1024 x i32], [1024 x i32]* @p, i64 0, i64 %69
  %scevgep32.4 = getelementptr [1024 x i32], [1024 x i32]* @v, i64 0, i64 %69
  %scevgep31.4 = getelementptr [1024 x i32], [1024 x i32]* @u, i64 0, i64 %69
  %70 = bitcast i32* %scevgep31.4 to <4 x i32>*
  %71 = bitcast i32* %scevgep32.4 to <4 x i32>*
  %72 = bitcast i32* %scevgep33.4 to <4 x i32>*
  %73 = or i64 %51, 20
  %scevgep33.5 = getelementptr [1024 x i32], [1024 x i32]* @p, i64 0, i64 %73
  %scevgep32.5 = getelementptr [1024 x i32], [1024 x i32]* @v, i64 0, i64 %73
  %scevgep31.5 = getelementptr [1024 x i32], [1024 x i32]* @u, i64 0, i64 %73
  %74 = bitcast i32* %scevgep31.5 to <4 x i32>*
  %75 = bitcast i32* %scevgep32.5 to <4 x i32>*
  %76 = bitcast i32* %scevgep33.5 to <4 x i32>*
  %77 = or i64 %51, 24
  %scevgep33.6 = getelementptr [1024 x i32], [1024 x i32]* @p, i64 0, i64 %77
  %scevgep32.6 = getelementptr [1024 x i32], [1024 x i32]* @v, i64 0, i64 %77
  %scevgep31.6 = getelementptr [1024 x i32], [1024 x i32]* @u, i64 0, i64 %77
  %78 = bitcast i32* %scevgep31.6 to <4 x i32>*
  %79 = bitcast i32* %scevgep32.6 to <4 x i32>*
  %80 = bitcast i32* %scevgep33.6 to <4 x i32>*
  %81 = bitcast i32* %scevgep32.7 to <4 x i32>*
  %82 = bitcast i32* %scevgep33.7 to <4 x i32>*
  br label %polly.loop_preheader14

polly.loop_preheader14:                           ; preds = %vector.body48.7, %polly.loop_preheader8
  %polly.indvar10 = phi i64 [ 0, %polly.loop_preheader8 ], [ %polly.indvar_next11, %vector.body48.7 ]
  br label %polly.loop_preheader20

polly.loop_preheader20:                           ; preds = %polly.loop_preheader14
  br label %vector.body48

vector.body48:                                    ; preds = %polly.loop_preheader20
  br label %vector.body48.1

vector.body48.1:                                  ; preds = %vector.body48
  br label %vector.body48.2

vector.body48.2:                                  ; preds = %vector.body48.1
  br label %vector.body48.3

vector.body48.3:                                  ; preds = %vector.body48.2
  br label %vector.body48.4

vector.body48.4:                                  ; preds = %vector.body48.3
  br label %vector.body48.5

vector.body48.5:                                  ; preds = %vector.body48.4
  br label %vector.body48.6

vector.body48.6:                                  ; preds = %vector.body48.5
  br label %vector.body48.7

vector.body48.7:                                  ; preds = %vector.body48.6
  %polly.indvar_next11 = add nuw nsw i64 %polly.indvar10, 1
  %exitcond44 = icmp eq i64 %polly.indvar_next11, 2097152
  br i1 %exitcond44, label %polly.loop_exit9, label %polly.loop_preheader14

polly.start:                                      ; preds = %polly.split_new_and_old
  br label %polly.loop_preheader

polly.loop_exit:                                  ; preds = %polly.stmt.vector.body
  br label %polly.loop_preheader110

polly.loop_exit111:                               ; preds = %polly.stmt.polly.loop_exit9
  br label %polly.stmt.vector.body60.preheader

polly.stmt.vector.body60.preheader:               ; preds = %polly.loop_exit111
  store <2 x i64> zeroinitializer, <2 x i64>* %vec.phi.phiops
  store <2 x i64> zeroinitializer, <2 x i64>* %vec.phi69.phiops
  br label %polly.loop_preheader164

polly.loop_exit165:                               ; preds = %polly.stmt.vector.body60
  br label %polly.exiting

polly.exiting:                                    ; preds = %polly.loop_exit165
  %.final_reload = load <2 x i64>, <2 x i64>* %.s2a186
  %.final_reload187 = load <2 x i64>, <2 x i64>* %.s2a
  br label %polly.merge_new_and_old

polly.loop_header:                                ; preds = %polly.stmt.vector.body, %polly.loop_preheader
  %polly.indvar = phi i64 [ 0, %polly.loop_preheader ], [ %polly.indvar_next, %polly.stmt.vector.body ]
  br label %polly.stmt.vector.body

polly.stmt.vector.body:                           ; preds = %polly.loop_header
  %83 = shl i64 %polly.indvar, 6
  %scevgep = getelementptr [67108864 x i32], [67108864 x i32]* @sum, i64 0, i64 %83
  %scevgep78 = bitcast i32* %scevgep to <4 x i32>*
  store <4 x i32> <i32 1024, i32 1024, i32 1024, i32 1024>, <4 x i32>* %scevgep78, align 16, !alias.scope !17, !noalias !19, !llvm.mem.parallel_loop_access !27
  %scevgep79 = getelementptr i32, i32* getelementptr inbounds ([67108864 x i32], [67108864 x i32]* @sum, i64 0, i64 4), i64 %83
  %scevgep7980 = bitcast i32* %scevgep79 to <4 x i32>*
  store <4 x i32> <i32 1024, i32 1024, i32 1024, i32 1024>, <4 x i32>* %scevgep7980, align 16, !alias.scope !17, !noalias !19, !llvm.mem.parallel_loop_access !27
  %84 = shl i64 %polly.indvar, 6
  %scevgep81 = getelementptr i32, i32* getelementptr inbounds ([67108864 x i32], [67108864 x i32]* @sum, i64 0, i64 8), i64 %84
  %scevgep8182 = bitcast i32* %scevgep81 to <4 x i32>*
  store <4 x i32> <i32 1024, i32 1024, i32 1024, i32 1024>, <4 x i32>* %scevgep8182, align 16, !alias.scope !17, !noalias !19, !llvm.mem.parallel_loop_access !27
  %scevgep83 = getelementptr i32, i32* getelementptr inbounds ([67108864 x i32], [67108864 x i32]* @sum, i64 0, i64 12), i64 %84
  %scevgep8384 = bitcast i32* %scevgep83 to <4 x i32>*
  store <4 x i32> <i32 1024, i32 1024, i32 1024, i32 1024>, <4 x i32>* %scevgep8384, align 16, !alias.scope !17, !noalias !19, !llvm.mem.parallel_loop_access !27
  %85 = shl i64 %polly.indvar, 6
  %scevgep85 = getelementptr i32, i32* getelementptr inbounds ([67108864 x i32], [67108864 x i32]* @sum, i64 0, i64 16), i64 %85
  %scevgep8586 = bitcast i32* %scevgep85 to <4 x i32>*
  store <4 x i32> <i32 1024, i32 1024, i32 1024, i32 1024>, <4 x i32>* %scevgep8586, align 16, !alias.scope !17, !noalias !19, !llvm.mem.parallel_loop_access !27
  %scevgep87 = getelementptr i32, i32* getelementptr inbounds ([67108864 x i32], [67108864 x i32]* @sum, i64 0, i64 20), i64 %85
  %scevgep8788 = bitcast i32* %scevgep87 to <4 x i32>*
  store <4 x i32> <i32 1024, i32 1024, i32 1024, i32 1024>, <4 x i32>* %scevgep8788, align 16, !alias.scope !17, !noalias !19, !llvm.mem.parallel_loop_access !27
  %86 = shl i64 %polly.indvar, 6
  %scevgep89 = getelementptr i32, i32* getelementptr inbounds ([67108864 x i32], [67108864 x i32]* @sum, i64 0, i64 24), i64 %86
  %scevgep8990 = bitcast i32* %scevgep89 to <4 x i32>*
  store <4 x i32> <i32 1024, i32 1024, i32 1024, i32 1024>, <4 x i32>* %scevgep8990, align 16, !alias.scope !17, !noalias !19, !llvm.mem.parallel_loop_access !27
  %scevgep91 = getelementptr i32, i32* getelementptr inbounds ([67108864 x i32], [67108864 x i32]* @sum, i64 0, i64 28), i64 %86
  %scevgep9192 = bitcast i32* %scevgep91 to <4 x i32>*
  store <4 x i32> <i32 1024, i32 1024, i32 1024, i32 1024>, <4 x i32>* %scevgep9192, align 16, !alias.scope !17, !noalias !19, !llvm.mem.parallel_loop_access !27
  %87 = shl i64 %polly.indvar, 6
  %scevgep93 = getelementptr i32, i32* getelementptr inbounds ([67108864 x i32], [67108864 x i32]* @sum, i64 0, i64 32), i64 %87
  %scevgep9394 = bitcast i32* %scevgep93 to <4 x i32>*
  store <4 x i32> <i32 1024, i32 1024, i32 1024, i32 1024>, <4 x i32>* %scevgep9394, align 16, !alias.scope !17, !noalias !19, !llvm.mem.parallel_loop_access !27
  %scevgep95 = getelementptr i32, i32* getelementptr inbounds ([67108864 x i32], [67108864 x i32]* @sum, i64 0, i64 36), i64 %87
  %scevgep9596 = bitcast i32* %scevgep95 to <4 x i32>*
  store <4 x i32> <i32 1024, i32 1024, i32 1024, i32 1024>, <4 x i32>* %scevgep9596, align 16, !alias.scope !17, !noalias !19, !llvm.mem.parallel_loop_access !27
  %88 = shl i64 %polly.indvar, 6
  %scevgep97 = getelementptr i32, i32* getelementptr inbounds ([67108864 x i32], [67108864 x i32]* @sum, i64 0, i64 40), i64 %88
  %scevgep9798 = bitcast i32* %scevgep97 to <4 x i32>*
  store <4 x i32> <i32 1024, i32 1024, i32 1024, i32 1024>, <4 x i32>* %scevgep9798, align 16, !alias.scope !17, !noalias !19, !llvm.mem.parallel_loop_access !27
  %scevgep99 = getelementptr i32, i32* getelementptr inbounds ([67108864 x i32], [67108864 x i32]* @sum, i64 0, i64 44), i64 %88
  %scevgep99100 = bitcast i32* %scevgep99 to <4 x i32>*
  store <4 x i32> <i32 1024, i32 1024, i32 1024, i32 1024>, <4 x i32>* %scevgep99100, align 16, !alias.scope !17, !noalias !19, !llvm.mem.parallel_loop_access !27
  %89 = shl i64 %polly.indvar, 6
  %scevgep101 = getelementptr i32, i32* getelementptr inbounds ([67108864 x i32], [67108864 x i32]* @sum, i64 0, i64 48), i64 %89
  %scevgep101102 = bitcast i32* %scevgep101 to <4 x i32>*
  store <4 x i32> <i32 1024, i32 1024, i32 1024, i32 1024>, <4 x i32>* %scevgep101102, align 16, !alias.scope !17, !noalias !19, !llvm.mem.parallel_loop_access !27
  %scevgep103 = getelementptr i32, i32* getelementptr inbounds ([67108864 x i32], [67108864 x i32]* @sum, i64 0, i64 52), i64 %89
  %scevgep103104 = bitcast i32* %scevgep103 to <4 x i32>*
  store <4 x i32> <i32 1024, i32 1024, i32 1024, i32 1024>, <4 x i32>* %scevgep103104, align 16, !alias.scope !17, !noalias !19, !llvm.mem.parallel_loop_access !27
  %90 = shl i64 %polly.indvar, 6
  %scevgep105 = getelementptr i32, i32* getelementptr inbounds ([67108864 x i32], [67108864 x i32]* @sum, i64 0, i64 56), i64 %90
  %scevgep105106 = bitcast i32* %scevgep105 to <4 x i32>*
  store <4 x i32> <i32 1024, i32 1024, i32 1024, i32 1024>, <4 x i32>* %scevgep105106, align 16, !alias.scope !17, !noalias !19, !llvm.mem.parallel_loop_access !27
  %scevgep107 = getelementptr i32, i32* getelementptr inbounds ([67108864 x i32], [67108864 x i32]* @sum, i64 0, i64 60), i64 %90
  %scevgep107108 = bitcast i32* %scevgep107 to <4 x i32>*
  store <4 x i32> <i32 1024, i32 1024, i32 1024, i32 1024>, <4 x i32>* %scevgep107108, align 16, !alias.scope !17, !noalias !19, !llvm.mem.parallel_loop_access !27
  %91 = shl i64 %polly.indvar, 6
  %92 = add i64 %91, 64
  %p_ = icmp eq i64 %92, 67108864
  %polly.indvar_next = add nsw i64 %polly.indvar, 1
  %polly.loop_cond = icmp sle i64 %polly.indvar, 1048574
  br i1 %polly.loop_cond, label %polly.loop_header, label %polly.loop_exit, !llvm.loop !27

polly.loop_preheader:                             ; preds = %polly.start
  br label %polly.loop_header

polly.loop_header109:                             ; preds = %polly.stmt.polly.loop_exit9, %polly.loop_preheader110
  %polly.indvar112 = phi i64 [ 0, %polly.loop_preheader110 ], [ %polly.indvar_next113, %polly.stmt.polly.loop_exit9 ]
  br label %polly.stmt.polly.loop_exit9

polly.stmt.polly.loop_exit9:                      ; preds = %polly.loop_header109
  %93 = shl i64 %polly.indvar112, 5
  %scevgep115 = getelementptr [1024 x i32], [1024 x i32]* @u, i64 0, i64 %93
  %scevgep115116 = bitcast i32* %scevgep115 to <4 x i32>*
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* %scevgep115116, align 16, !alias.scope !20, !noalias !28, !llvm.mem.parallel_loop_access !29
  %scevgep117 = getelementptr [1024 x i32], [1024 x i32]* @v, i64 0, i64 %93
  %scevgep117118 = bitcast i32* %scevgep117 to <4 x i32>*
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* %scevgep117118, align 16, !alias.scope !24, !noalias !30, !llvm.mem.parallel_loop_access !29
  %94 = shl i64 %polly.indvar112, 5
  %scevgep119 = getelementptr [1024 x i32], [1024 x i32]* @p, i64 0, i64 %94
  %scevgep119120 = bitcast i32* %scevgep119 to <4 x i32>*
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* %scevgep119120, align 16, !alias.scope !23, !noalias !31, !llvm.mem.parallel_loop_access !29
  %scevgep121 = getelementptr i32, i32* getelementptr inbounds ([1024 x i32], [1024 x i32]* @u, i64 0, i64 4), i64 %94
  %scevgep121122 = bitcast i32* %scevgep121 to <4 x i32>*
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* %scevgep121122, align 16, !alias.scope !20, !noalias !28, !llvm.mem.parallel_loop_access !29
  %95 = shl i64 %polly.indvar112, 5
  %scevgep123 = getelementptr i32, i32* getelementptr inbounds ([1024 x i32], [1024 x i32]* @v, i64 0, i64 4), i64 %95
  %scevgep123124 = bitcast i32* %scevgep123 to <4 x i32>*
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* %scevgep123124, align 16, !alias.scope !24, !noalias !30, !llvm.mem.parallel_loop_access !29
  %scevgep125 = getelementptr i32, i32* getelementptr inbounds ([1024 x i32], [1024 x i32]* @p, i64 0, i64 4), i64 %95
  %scevgep125126 = bitcast i32* %scevgep125 to <4 x i32>*
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* %scevgep125126, align 16, !alias.scope !23, !noalias !31, !llvm.mem.parallel_loop_access !29
  %96 = shl i64 %polly.indvar112, 5
  %scevgep127 = getelementptr i32, i32* getelementptr inbounds ([1024 x i32], [1024 x i32]* @u, i64 0, i64 8), i64 %96
  %scevgep127128 = bitcast i32* %scevgep127 to <4 x i32>*
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* %scevgep127128, align 16, !alias.scope !20, !noalias !28, !llvm.mem.parallel_loop_access !29
  %scevgep129 = getelementptr i32, i32* getelementptr inbounds ([1024 x i32], [1024 x i32]* @v, i64 0, i64 8), i64 %96
  %scevgep129130 = bitcast i32* %scevgep129 to <4 x i32>*
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* %scevgep129130, align 16, !alias.scope !24, !noalias !30, !llvm.mem.parallel_loop_access !29
  %97 = shl i64 %polly.indvar112, 5
  %scevgep131 = getelementptr i32, i32* getelementptr inbounds ([1024 x i32], [1024 x i32]* @p, i64 0, i64 8), i64 %97
  %scevgep131132 = bitcast i32* %scevgep131 to <4 x i32>*
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* %scevgep131132, align 16, !alias.scope !23, !noalias !31, !llvm.mem.parallel_loop_access !29
  %scevgep133 = getelementptr i32, i32* getelementptr inbounds ([1024 x i32], [1024 x i32]* @u, i64 0, i64 12), i64 %97
  %scevgep133134 = bitcast i32* %scevgep133 to <4 x i32>*
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* %scevgep133134, align 16, !alias.scope !20, !noalias !28, !llvm.mem.parallel_loop_access !29
  %98 = shl i64 %polly.indvar112, 5
  %scevgep135 = getelementptr i32, i32* getelementptr inbounds ([1024 x i32], [1024 x i32]* @v, i64 0, i64 12), i64 %98
  %scevgep135136 = bitcast i32* %scevgep135 to <4 x i32>*
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* %scevgep135136, align 16, !alias.scope !24, !noalias !30, !llvm.mem.parallel_loop_access !29
  %scevgep137 = getelementptr i32, i32* getelementptr inbounds ([1024 x i32], [1024 x i32]* @p, i64 0, i64 12), i64 %98
  %scevgep137138 = bitcast i32* %scevgep137 to <4 x i32>*
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* %scevgep137138, align 16, !alias.scope !23, !noalias !31, !llvm.mem.parallel_loop_access !29
  %99 = shl i64 %polly.indvar112, 5
  %scevgep139 = getelementptr i32, i32* getelementptr inbounds ([1024 x i32], [1024 x i32]* @u, i64 0, i64 16), i64 %99
  %scevgep139140 = bitcast i32* %scevgep139 to <4 x i32>*
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* %scevgep139140, align 16, !alias.scope !20, !noalias !28, !llvm.mem.parallel_loop_access !29
  %scevgep141 = getelementptr i32, i32* getelementptr inbounds ([1024 x i32], [1024 x i32]* @v, i64 0, i64 16), i64 %99
  %scevgep141142 = bitcast i32* %scevgep141 to <4 x i32>*
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* %scevgep141142, align 16, !alias.scope !24, !noalias !30, !llvm.mem.parallel_loop_access !29
  %100 = shl i64 %polly.indvar112, 5
  %scevgep143 = getelementptr i32, i32* getelementptr inbounds ([1024 x i32], [1024 x i32]* @p, i64 0, i64 16), i64 %100
  %scevgep143144 = bitcast i32* %scevgep143 to <4 x i32>*
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* %scevgep143144, align 16, !alias.scope !23, !noalias !31, !llvm.mem.parallel_loop_access !29
  %scevgep145 = getelementptr i32, i32* getelementptr inbounds ([1024 x i32], [1024 x i32]* @u, i64 0, i64 20), i64 %100
  %scevgep145146 = bitcast i32* %scevgep145 to <4 x i32>*
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* %scevgep145146, align 16, !alias.scope !20, !noalias !28, !llvm.mem.parallel_loop_access !29
  %101 = shl i64 %polly.indvar112, 5
  %scevgep147 = getelementptr i32, i32* getelementptr inbounds ([1024 x i32], [1024 x i32]* @v, i64 0, i64 20), i64 %101
  %scevgep147148 = bitcast i32* %scevgep147 to <4 x i32>*
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* %scevgep147148, align 16, !alias.scope !24, !noalias !30, !llvm.mem.parallel_loop_access !29
  %scevgep149 = getelementptr i32, i32* getelementptr inbounds ([1024 x i32], [1024 x i32]* @p, i64 0, i64 20), i64 %101
  %scevgep149150 = bitcast i32* %scevgep149 to <4 x i32>*
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* %scevgep149150, align 16, !alias.scope !23, !noalias !31, !llvm.mem.parallel_loop_access !29
  %102 = shl i64 %polly.indvar112, 5
  %scevgep151 = getelementptr i32, i32* getelementptr inbounds ([1024 x i32], [1024 x i32]* @u, i64 0, i64 24), i64 %102
  %scevgep151152 = bitcast i32* %scevgep151 to <4 x i32>*
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* %scevgep151152, align 16, !alias.scope !20, !noalias !28, !llvm.mem.parallel_loop_access !29
  %scevgep153 = getelementptr i32, i32* getelementptr inbounds ([1024 x i32], [1024 x i32]* @v, i64 0, i64 24), i64 %102
  %scevgep153154 = bitcast i32* %scevgep153 to <4 x i32>*
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* %scevgep153154, align 16, !alias.scope !24, !noalias !30, !llvm.mem.parallel_loop_access !29
  %103 = shl i64 %polly.indvar112, 5
  %scevgep155 = getelementptr i32, i32* getelementptr inbounds ([1024 x i32], [1024 x i32]* @p, i64 0, i64 24), i64 %103
  %scevgep155156 = bitcast i32* %scevgep155 to <4 x i32>*
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* %scevgep155156, align 16, !alias.scope !23, !noalias !31, !llvm.mem.parallel_loop_access !29
  %scevgep157 = getelementptr i32, i32* getelementptr inbounds ([1024 x i32], [1024 x i32]* @u, i64 0, i64 28), i64 %103
  %scevgep157158 = bitcast i32* %scevgep157 to <4 x i32>*
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* %scevgep157158, align 16, !alias.scope !20, !noalias !28, !llvm.mem.parallel_loop_access !29
  %104 = shl i64 %polly.indvar112, 5
  %scevgep159 = getelementptr i32, i32* getelementptr inbounds ([1024 x i32], [1024 x i32]* @v, i64 0, i64 28), i64 %104
  %scevgep159160 = bitcast i32* %scevgep159 to <4 x i32>*
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* %scevgep159160, align 16, !alias.scope !24, !noalias !30, !llvm.mem.parallel_loop_access !29
  %scevgep161 = getelementptr i32, i32* getelementptr inbounds ([1024 x i32], [1024 x i32]* @p, i64 0, i64 28), i64 %104
  %scevgep161162 = bitcast i32* %scevgep161 to <4 x i32>*
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* %scevgep161162, align 16, !alias.scope !23, !noalias !31, !llvm.mem.parallel_loop_access !29
  %105 = add i64 %polly.indvar112, 1
  %p_exitcond45 = icmp eq i64 %105, 32
  %polly.indvar_next113 = add nsw i64 %polly.indvar112, 1
  %polly.loop_cond114 = icmp sle i64 %polly.indvar112, 30
  br i1 %polly.loop_cond114, label %polly.loop_header109, label %polly.loop_exit111, !llvm.loop !29

polly.loop_preheader110:                          ; preds = %polly.loop_exit
  br label %polly.loop_header109

polly.loop_header163:                             ; preds = %polly.stmt.vector.body60, %polly.loop_preheader164
  %polly.indvar166 = phi i64 [ 0, %polly.loop_preheader164 ], [ %polly.indvar_next167, %polly.stmt.vector.body60 ]
  br label %polly.stmt.vector.body60

polly.stmt.vector.body60:                         ; preds = %polly.loop_header163
  %vec.phi.phiops.reload = load <2 x i64>, <2 x i64>* %vec.phi.phiops
  %vec.phi69.phiops.reload = load <2 x i64>, <2 x i64>* %vec.phi69.phiops
  %106 = shl i64 %polly.indvar166, 3
  %scevgep169 = getelementptr [67108864 x i32], [67108864 x i32]* @sum, i64 0, i64 %106
  %scevgep169170 = bitcast i32* %scevgep169 to <2 x i32>*
  %wide.load_p_scalar_ = load <2 x i32>, <2 x i32>* %scevgep169170, align 16, !alias.scope !17, !noalias !19
  %scevgep171 = getelementptr i32, i32* getelementptr inbounds ([67108864 x i32], [67108864 x i32]* @sum, i64 0, i64 2), i64 %106
  %scevgep171172 = bitcast i32* %scevgep171 to <2 x i32>*
  %wide.load74_p_scalar_ = load <2 x i32>, <2 x i32>* %scevgep171172, align 8, !alias.scope !17, !noalias !19
  %p_173 = sext <2 x i32> %wide.load_p_scalar_ to <2 x i64>
  %p_174 = sext <2 x i32> %wide.load74_p_scalar_ to <2 x i64>
  %p_175 = add nsw <2 x i64> %p_173, %vec.phi.phiops.reload
  %p_176 = add nsw <2 x i64> %p_174, %vec.phi69.phiops.reload
  %107 = shl i64 %polly.indvar166, 3
  %scevgep177 = getelementptr i32, i32* getelementptr inbounds ([67108864 x i32], [67108864 x i32]* @sum, i64 0, i64 4), i64 %107
  %scevgep177178 = bitcast i32* %scevgep177 to <2 x i32>*
  %wide.load.1_p_scalar_ = load <2 x i32>, <2 x i32>* %scevgep177178, align 16, !alias.scope !17, !noalias !19
  %scevgep179 = getelementptr i32, i32* getelementptr inbounds ([67108864 x i32], [67108864 x i32]* @sum, i64 0, i64 6), i64 %107
  %scevgep179180 = bitcast i32* %scevgep179 to <2 x i32>*
  %wide.load74.1_p_scalar_ = load <2 x i32>, <2 x i32>* %scevgep179180, align 8, !alias.scope !17, !noalias !19
  %p_181 = sext <2 x i32> %wide.load.1_p_scalar_ to <2 x i64>
  %p_182 = sext <2 x i32> %wide.load74.1_p_scalar_ to <2 x i64>
  %p_183 = add nsw <2 x i64> %p_181, %p_175
  %p_184 = add nsw <2 x i64> %p_182, %p_176
  %108 = shl i64 %polly.indvar166, 3
  %109 = add i64 %108, 8
  %p_185 = icmp eq i64 %109, 67108864
  store <2 x i64> %p_183, <2 x i64>* %vec.phi.phiops
  store <2 x i64> %p_184, <2 x i64>* %vec.phi69.phiops
  store <2 x i64> %p_183, <2 x i64>* %.s2a
  store <2 x i64> %p_184, <2 x i64>* %.s2a186
  %polly.indvar_next167 = add nsw i64 %polly.indvar166, 1
  %polly.loop_cond168 = icmp sle i64 %polly.indvar166, 8388606
  br i1 %polly.loop_cond168, label %polly.loop_header163, label %polly.loop_exit165

polly.loop_preheader164:                          ; preds = %polly.stmt.vector.body60.preheader
  br label %polly.loop_header163
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
!4 = distinct !{!4, !2, !"polly.alias.scope.u"}
!5 = distinct !{!5, !2, !"polly.alias.scope.add23"}
!6 = distinct !{!6, !2, !"polly.alias.scope.p"}
!7 = distinct !{!7, !2, !"polly.alias.scope.total.02"}
!8 = distinct !{!8, !2, !"polly.alias.scope.v"}
!9 = distinct !{!9, !10, !11}
!10 = !{!"llvm.loop.vectorize.width", i32 1}
!11 = !{!"llvm.loop.interleave.count", i32 1}
!12 = !{!1, !5, !6, !7, !8}
!13 = !{!1, !4, !5, !6, !7}
!14 = !{!1, !4, !5, !7, !8}
!15 = distinct !{!15}
!16 = distinct !{!16, !10, !11}
!17 = distinct !{!17, !18, !"polly.alias.scope.sum"}
!18 = distinct !{!18, !"polly.alias.scope.domain"}
!19 = !{!20, !21, !22, !23, !24, !25, !26}
!20 = distinct !{!20, !18, !"polly.alias.scope.u"}
!21 = distinct !{!21, !18, !"polly.alias.scope."}
!22 = distinct !{!22, !18, !"polly.alias.scope.vec.phi"}
!23 = distinct !{!23, !18, !"polly.alias.scope.p"}
!24 = distinct !{!24, !18, !"polly.alias.scope.v"}
!25 = distinct !{!25, !18, !"polly.alias.scope."}
!26 = distinct !{!26, !18, !"polly.alias.scope.vec.phi69"}
!27 = distinct !{!27}
!28 = !{!17, !21, !22, !23, !24, !25, !26}
!29 = distinct !{!29}
!30 = !{!17, !20, !21, !22, !23, !25, !26}
!31 = !{!17, !20, !21, !22, !24, !25, !26}
