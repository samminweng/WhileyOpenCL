; ModuleID = 'VectorMult.preopt.ll'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [34 x i8] c"fail to multiply two unit vectors\00", align 1
@.str.1 = private unnamed_addr constant [1 x i8] zeroinitializer, align 1
@.str.2 = private unnamed_addr constant [100 x i8] c"Pass the %'lld vector multiplication test case with local vector size = %d\0AThe Dot Product = %'lld\0A\00", align 1

; Function Attrs: nounwind uwtable
define i32 @main(i32 %argc, i8** nocapture readnone %args) #0 !dbg !8 {
entry:
  %p_add45.4.s2a = alloca i64
  %total.02.phiops.0.phiops = alloca i64
  %p_add30.3.lcssa.phiops = alloca i32
  %tmp.04.phiops.0.phiops = alloca i32
  br label %entry.split, !dbg !17

entry.split:                                      ; preds = %entry
  tail call void @llvm.dbg.value(metadata i32 %argc, i64 0, metadata !18, metadata !19), !dbg !17
  tail call void @llvm.dbg.value(metadata i8** %args, i64 0, metadata !20, metadata !19), !dbg !21
  %call = tail call noalias i8* @malloc(i64 41943040) #4, !dbg !22
  %0 = bitcast i8* %call to i32*, !dbg !23
  tail call void @llvm.dbg.value(metadata i32* %0, i64 0, metadata !24, metadata !19), !dbg !25
  %call1 = tail call noalias i8* @malloc(i64 41943040) #4, !dbg !26
  %1 = bitcast i8* %call1 to i32*, !dbg !27
  tail call void @llvm.dbg.value(metadata i32* %1, i64 0, metadata !28, metadata !19), !dbg !29
  %call2 = tail call noalias i8* @malloc(i64 40960) #4, !dbg !30
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !31, metadata !19), !dbg !32
  br label %for.cond3.preheader, !dbg !33

for.cond3.preheader:                              ; preds = %for.inc10, %entry.split
  %r.07 = phi i64 [ 0, %entry.split ], [ %inc11, %for.inc10 ]
  %mul = shl i64 %r.07, 10, !dbg !37
  br label %vector.body, !dbg !42

vector.body:                                      ; preds = %vector.body, %for.cond3.preheader
  %index = phi i64 [ 0, %for.cond3.preheader ], [ %index.next.3, %vector.body ], !dbg !42
  %2 = add nuw nsw i64 %index, %mul, !dbg !44
  %3 = getelementptr inbounds i32, i32* %0, i64 %2, !dbg !44
  %4 = bitcast i32* %3 to <4 x i32>*, !dbg !45
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* %4, align 4, !dbg !45
  %5 = getelementptr i32, i32* %3, i64 4, !dbg !45
  %6 = bitcast i32* %5 to <4 x i32>*, !dbg !45
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* %6, align 4, !dbg !45
  %7 = getelementptr inbounds i32, i32* %1, i64 %2, !dbg !46
  %8 = bitcast i32* %7 to <4 x i32>*, !dbg !47
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* %8, align 4, !dbg !47
  %9 = getelementptr i32, i32* %7, i64 4, !dbg !47
  %10 = bitcast i32* %9 to <4 x i32>*, !dbg !47
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* %10, align 4, !dbg !47
  %index.next = or i64 %index, 8, !dbg !42
  %11 = add nuw nsw i64 %index.next, %mul, !dbg !44
  %12 = getelementptr inbounds i32, i32* %0, i64 %11, !dbg !44
  %13 = bitcast i32* %12 to <4 x i32>*, !dbg !45
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* %13, align 4, !dbg !45
  %14 = getelementptr i32, i32* %12, i64 4, !dbg !45
  %15 = bitcast i32* %14 to <4 x i32>*, !dbg !45
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* %15, align 4, !dbg !45
  %16 = getelementptr inbounds i32, i32* %1, i64 %11, !dbg !46
  %17 = bitcast i32* %16 to <4 x i32>*, !dbg !47
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* %17, align 4, !dbg !47
  %18 = getelementptr i32, i32* %16, i64 4, !dbg !47
  %19 = bitcast i32* %18 to <4 x i32>*, !dbg !47
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* %19, align 4, !dbg !47
  %index.next.1 = or i64 %index, 16, !dbg !42
  %20 = add nuw nsw i64 %index.next.1, %mul, !dbg !44
  %21 = getelementptr inbounds i32, i32* %0, i64 %20, !dbg !44
  %22 = bitcast i32* %21 to <4 x i32>*, !dbg !45
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* %22, align 4, !dbg !45
  %23 = getelementptr i32, i32* %21, i64 4, !dbg !45
  %24 = bitcast i32* %23 to <4 x i32>*, !dbg !45
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* %24, align 4, !dbg !45
  %25 = getelementptr inbounds i32, i32* %1, i64 %20, !dbg !46
  %26 = bitcast i32* %25 to <4 x i32>*, !dbg !47
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* %26, align 4, !dbg !47
  %27 = getelementptr i32, i32* %25, i64 4, !dbg !47
  %28 = bitcast i32* %27 to <4 x i32>*, !dbg !47
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* %28, align 4, !dbg !47
  %index.next.2 = or i64 %index, 24, !dbg !42
  %29 = add nuw nsw i64 %index.next.2, %mul, !dbg !44
  %30 = getelementptr inbounds i32, i32* %0, i64 %29, !dbg !44
  %31 = bitcast i32* %30 to <4 x i32>*, !dbg !45
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* %31, align 4, !dbg !45
  %32 = getelementptr i32, i32* %30, i64 4, !dbg !45
  %33 = bitcast i32* %32 to <4 x i32>*, !dbg !45
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* %33, align 4, !dbg !45
  %34 = getelementptr inbounds i32, i32* %1, i64 %29, !dbg !46
  %35 = bitcast i32* %34 to <4 x i32>*, !dbg !47
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* %35, align 4, !dbg !47
  %36 = getelementptr i32, i32* %34, i64 4, !dbg !47
  %37 = bitcast i32* %36 to <4 x i32>*, !dbg !47
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* %37, align 4, !dbg !47
  %index.next.3 = add nsw i64 %index, 32, !dbg !42
  %38 = icmp eq i64 %index.next.3, 1024, !dbg !42
  br i1 %38, label %for.inc10, label %vector.body, !dbg !42, !llvm.loop !48

for.inc10:                                        ; preds = %vector.body
  %inc11 = add nuw nsw i64 %r.07, 1, !dbg !51
  tail call void @llvm.dbg.value(metadata i64 %inc11, i64 0, metadata !31, metadata !19), !dbg !32
  %exitcond13 = icmp eq i64 %inc11, 10240, !dbg !33
  br i1 %exitcond13, label %polly.loop_preheader2.preheader, label %for.cond3.preheader, !dbg !33

polly.loop_preheader2.preheader:                  ; preds = %for.inc10
  br label %polly.split_new_and_old

if.then:                                          ; preds = %polly.exiting
  %call51 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([34 x i8], [34 x i8]* @.str, i64 0, i64 0)) #4, !dbg !53
  tail call void @exit(i32 -2) #5, !dbg !56
  unreachable, !dbg !56

if.end:                                           ; preds = %polly.exiting
  %call52 = tail call i8* @setlocale(i32 6, i8* getelementptr inbounds ([1 x i8], [1 x i8]* @.str.1, i64 0, i64 0)) #4, !dbg !57
  %call53 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([100 x i8], [100 x i8]* @.str.2, i64 0, i64 0), i64 10485760, i32 1024, i64 10485760) #4, !dbg !58
  ret i32 0, !dbg !59

polly.merge_new_and_old:                          ; preds = %polly.exiting29, %polly.stmt.for.inc46
  %p_add45.4.merge = phi i64 [ %p_add45.4.final_reload, %polly.exiting29 ], [ %p_add45.4, %polly.stmt.for.inc46 ]
  br label %polly.exiting, !dbg !60

polly.exiting:                                    ; preds = %polly.merge_new_and_old
  %p_add45.4.lcssa = phi i64 [ %p_add45.4.merge, %polly.merge_new_and_old ]
  %cmp49 = icmp eq i64 %p_add45.4.lcssa, 10485760, !dbg !60
  br i1 %cmp49, label %if.end, label %if.then, !dbg !61

polly.stmt.for.end33:                             ; preds = %polly.stmt.for.inc31
  %p_add30.3.lcssa = phi i32 [ %p_add30.3, %polly.stmt.for.inc31 ]
  %39 = shl i64 %polly.indvar, 2
  %scevgep13 = getelementptr i8, i8* %call2, i64 %39
  %scevgep1314 = bitcast i8* %scevgep13 to i32*
  store i32 %p_add30.3.lcssa, i32* %scevgep1314, align 4, !alias.scope !62, !noalias !64
  %polly.indvar_next = add nuw nsw i64 %polly.indvar, 1
  %exitcond25 = icmp eq i64 %polly.indvar_next, 10240
  br i1 %exitcond25, label %polly.stmt.for.inc46.preheader, label %polly.loop_preheader2

polly.stmt.for.inc46.preheader:                   ; preds = %polly.stmt.for.end33
  br label %polly.stmt.for.inc46

polly.stmt.for.inc31:                             ; preds = %polly.stmt.for.inc31, %polly.loop_preheader2
  %tmp.04.phiops.0 = phi i32 [ 0, %polly.loop_preheader2 ], [ %p_add30.3, %polly.stmt.for.inc31 ]
  %polly.indvar4 = phi i64 [ 0, %polly.loop_preheader2 ], [ %polly.indvar_next5.3, %polly.stmt.for.inc31 ]
  %40 = shl i64 %polly.indvar4, 2
  %scevgep7 = getelementptr i8, i8* %scevgep, i64 %40
  %scevgep78 = bitcast i8* %scevgep7 to i32*
  %_p_scalar_ = load i32, i32* %scevgep78, align 4, !alias.scope !67, !noalias !71
  %scevgep10 = getelementptr i8, i8* %scevgep9, i64 %40
  %scevgep1011 = bitcast i8* %scevgep10 to i32*
  %_p_scalar_12 = load i32, i32* %scevgep1011, align 4, !alias.scope !69, !noalias !72
  %p_mul29 = mul nsw i32 %_p_scalar_12, %_p_scalar_, !dbg !73
  %p_add30 = add nsw i32 %p_mul29, %tmp.04.phiops.0, !dbg !80
  %polly.indvar_next5 = shl i64 %polly.indvar4, 2
  %41 = or i64 %polly.indvar_next5, 4
  %scevgep7.1 = getelementptr i8, i8* %scevgep, i64 %41
  %scevgep78.1 = bitcast i8* %scevgep7.1 to i32*
  %_p_scalar_.1 = load i32, i32* %scevgep78.1, align 4, !alias.scope !67, !noalias !71
  %scevgep10.1 = getelementptr i8, i8* %scevgep9, i64 %41
  %scevgep1011.1 = bitcast i8* %scevgep10.1 to i32*
  %_p_scalar_12.1 = load i32, i32* %scevgep1011.1, align 4, !alias.scope !69, !noalias !72
  %p_mul29.1 = mul nsw i32 %_p_scalar_12.1, %_p_scalar_.1, !dbg !73
  %p_add30.1 = add nsw i32 %p_mul29.1, %p_add30, !dbg !80
  %polly.indvar_next5.1 = shl i64 %polly.indvar4, 2
  %42 = or i64 %polly.indvar_next5.1, 8
  %scevgep7.2 = getelementptr i8, i8* %scevgep, i64 %42
  %scevgep78.2 = bitcast i8* %scevgep7.2 to i32*
  %_p_scalar_.2 = load i32, i32* %scevgep78.2, align 4, !alias.scope !67, !noalias !71
  %scevgep10.2 = getelementptr i8, i8* %scevgep9, i64 %42
  %scevgep1011.2 = bitcast i8* %scevgep10.2 to i32*
  %_p_scalar_12.2 = load i32, i32* %scevgep1011.2, align 4, !alias.scope !69, !noalias !72
  %p_mul29.2 = mul nsw i32 %_p_scalar_12.2, %_p_scalar_.2, !dbg !73
  %p_add30.2 = add nsw i32 %p_mul29.2, %p_add30.1, !dbg !80
  %polly.indvar_next5.2 = shl i64 %polly.indvar4, 2
  %43 = or i64 %polly.indvar_next5.2, 12
  %scevgep7.3 = getelementptr i8, i8* %scevgep, i64 %43
  %scevgep78.3 = bitcast i8* %scevgep7.3 to i32*
  %_p_scalar_.3 = load i32, i32* %scevgep78.3, align 4, !alias.scope !67, !noalias !71
  %scevgep10.3 = getelementptr i8, i8* %scevgep9, i64 %43
  %scevgep1011.3 = bitcast i8* %scevgep10.3 to i32*
  %_p_scalar_12.3 = load i32, i32* %scevgep1011.3, align 4, !alias.scope !69, !noalias !72
  %p_mul29.3 = mul nsw i32 %_p_scalar_12.3, %_p_scalar_.3, !dbg !73
  %p_add30.3 = add nsw i32 %p_mul29.3, %p_add30.2, !dbg !80
  %polly.indvar_next5.3 = add nsw i64 %polly.indvar4, 4
  %exitcond24.3 = icmp eq i64 %polly.indvar_next5.3, 1024
  br i1 %exitcond24.3, label %polly.stmt.for.end33, label %polly.stmt.for.inc31

polly.split_new_and_old:                          ; preds = %polly.loop_preheader2.preheader
  br i1 true, label %polly.start, label %polly.loop_preheader2

polly.loop_preheader2:                            ; preds = %polly.split_new_and_old, %polly.stmt.for.end33
  %polly.indvar = phi i64 [ %polly.indvar_next, %polly.stmt.for.end33 ], [ 0, %polly.split_new_and_old ]
  %44 = shl i64 %polly.indvar, 12
  %scevgep = getelementptr i8, i8* %call, i64 %44
  %scevgep9 = getelementptr i8, i8* %call1, i64 %44
  br label %polly.stmt.for.inc31

polly.stmt.for.inc46:                             ; preds = %polly.stmt.for.inc46, %polly.stmt.for.inc46.preheader
  %total.02.phiops.0 = phi i64 [ 0, %polly.stmt.for.inc46.preheader ], [ %p_add45.4, %polly.stmt.for.inc46 ]
  %polly.indvar18 = phi i64 [ 0, %polly.stmt.for.inc46.preheader ], [ %polly.indvar_next19.4, %polly.stmt.for.inc46 ]
  %45 = shl i64 %polly.indvar18, 2
  %scevgep21 = getelementptr i8, i8* %call2, i64 %45
  %scevgep2122 = bitcast i8* %scevgep21 to i32*
  %_p_scalar_23 = load i32, i32* %scevgep2122, align 4, !alias.scope !62, !noalias !64
  %p_conv44 = sext i32 %_p_scalar_23 to i64, !dbg !81
  %p_add45 = add nsw i64 %p_conv44, %total.02.phiops.0, !dbg !85
  %polly.indvar_next19 = shl i64 %polly.indvar18, 2
  %46 = add i64 %polly.indvar_next19, 4
  %scevgep21.1 = getelementptr i8, i8* %call2, i64 %46
  %scevgep2122.1 = bitcast i8* %scevgep21.1 to i32*
  %_p_scalar_23.1 = load i32, i32* %scevgep2122.1, align 4, !alias.scope !62, !noalias !64
  %p_conv44.1 = sext i32 %_p_scalar_23.1 to i64, !dbg !81
  %p_add45.1 = add nsw i64 %p_conv44.1, %p_add45, !dbg !85
  %polly.indvar_next19.1 = shl i64 %polly.indvar18, 2
  %47 = add i64 %polly.indvar_next19.1, 8
  %scevgep21.2 = getelementptr i8, i8* %call2, i64 %47
  %scevgep2122.2 = bitcast i8* %scevgep21.2 to i32*
  %_p_scalar_23.2 = load i32, i32* %scevgep2122.2, align 4, !alias.scope !62, !noalias !64
  %p_conv44.2 = sext i32 %_p_scalar_23.2 to i64, !dbg !81
  %p_add45.2 = add nsw i64 %p_conv44.2, %p_add45.1, !dbg !85
  %polly.indvar_next19.2 = shl i64 %polly.indvar18, 2
  %48 = add i64 %polly.indvar_next19.2, 12
  %scevgep21.3 = getelementptr i8, i8* %call2, i64 %48
  %scevgep2122.3 = bitcast i8* %scevgep21.3 to i32*
  %_p_scalar_23.3 = load i32, i32* %scevgep2122.3, align 4, !alias.scope !62, !noalias !64
  %p_conv44.3 = sext i32 %_p_scalar_23.3 to i64, !dbg !81
  %p_add45.3 = add nsw i64 %p_conv44.3, %p_add45.2, !dbg !85
  %polly.indvar_next19.3 = shl i64 %polly.indvar18, 2
  %49 = add i64 %polly.indvar_next19.3, 16
  %scevgep21.4 = getelementptr i8, i8* %call2, i64 %49
  %scevgep2122.4 = bitcast i8* %scevgep21.4 to i32*
  %_p_scalar_23.4 = load i32, i32* %scevgep2122.4, align 4, !alias.scope !62, !noalias !64
  %p_conv44.4 = sext i32 %_p_scalar_23.4 to i64, !dbg !81
  %p_add45.4 = add nsw i64 %p_conv44.4, %p_add45.3, !dbg !85
  %polly.indvar_next19.4 = add nsw i64 %polly.indvar18, 5
  %exitcond.4 = icmp eq i64 %polly.indvar_next19.4, 10240
  br i1 %exitcond.4, label %polly.merge_new_and_old, label %polly.stmt.for.inc46

polly.start:                                      ; preds = %polly.split_new_and_old
  br label %polly.loop_preheader

polly.loop_exit:                                  ; preds = %polly.stmt.polly.stmt.for.end33
  br label %polly.stmt.polly.stmt.for.inc46.preheader

polly.stmt.polly.stmt.for.inc46.preheader:        ; preds = %polly.loop_exit
  store i64 0, i64* %total.02.phiops.0.phiops
  br label %polly.loop_preheader71

polly.loop_exit72:                                ; preds = %polly.stmt.polly.stmt.for.inc46
  br label %polly.exiting29

polly.exiting29:                                  ; preds = %polly.loop_exit72
  %p_add45.4.final_reload = load i64, i64* %p_add45.4.s2a
  br label %polly.merge_new_and_old

polly.loop_header:                                ; preds = %polly.stmt.polly.stmt.for.end33, %polly.loop_preheader
  %polly.indvar30 = phi i64 [ 0, %polly.loop_preheader ], [ %polly.indvar_next31, %polly.stmt.polly.stmt.for.end33 ]
  br label %polly.stmt.polly.loop_preheader2

polly.stmt.polly.loop_preheader2:                 ; preds = %polly.loop_header
  store i32 0, i32* %tmp.04.phiops.0.phiops
  br label %polly.loop_preheader33

polly.loop_exit34:                                ; preds = %polly.stmt.polly.stmt.for.inc31
  br label %polly.stmt.polly.stmt.for.end33

polly.stmt.polly.stmt.for.end33:                  ; preds = %polly.loop_exit34
  %p_add30.3.lcssa.phiops.reload = load i32, i32* %p_add30.3.lcssa.phiops
  %50 = shl i64 %polly.indvar30, 2
  %scevgep68 = getelementptr i8, i8* %call2, i64 %50
  %scevgep6869 = bitcast i8* %scevgep68 to i32*
  store i32 %p_add30.3.lcssa.phiops.reload, i32* %scevgep6869, align 4, !alias.scope !86, !noalias !88
  %51 = add i64 %polly.indvar30, 1
  %p_exitcond25 = icmp eq i64 %51, 10240
  %polly.indvar_next31 = add nsw i64 %polly.indvar30, 1
  %polly.loop_cond = icmp sle i64 %polly.indvar30, 10238
  br i1 %polly.loop_cond, label %polly.loop_header, label %polly.loop_exit

polly.loop_preheader:                             ; preds = %polly.start
  %scevgep44 = getelementptr i8, i8* %call, i64 4
  %scevgep48 = getelementptr i8, i8* %call1, i64 4
  %scevgep52 = getelementptr i8, i8* %call, i64 8
  %scevgep56 = getelementptr i8, i8* %call1, i64 8
  %scevgep60 = getelementptr i8, i8* %call, i64 12
  %scevgep64 = getelementptr i8, i8* %call1, i64 12
  br label %polly.loop_header

polly.loop_header32:                              ; preds = %polly.stmt.polly.stmt.for.inc31, %polly.loop_preheader33
  %polly.indvar35 = phi i64 [ 0, %polly.loop_preheader33 ], [ %polly.indvar_next36, %polly.stmt.polly.stmt.for.inc31 ]
  br label %polly.stmt.polly.stmt.for.inc31

polly.stmt.polly.stmt.for.inc31:                  ; preds = %polly.loop_header32
  %tmp.04.phiops.0.phiops.reload = load i32, i32* %tmp.04.phiops.0.phiops
  %52 = shl i64 %polly.indvar35, 4
  %scevgep39 = getelementptr i8, i8* %scevgep38, i64 %52
  %scevgep3940 = bitcast i8* %scevgep39 to i32*
  %_p_scalar__p_scalar_ = load i32, i32* %scevgep3940, align 4, !alias.scope !91, !noalias !95
  %scevgep42 = getelementptr i8, i8* %scevgep41, i64 %52
  %scevgep4243 = bitcast i8* %scevgep42 to i32*
  %_p_scalar_12_p_scalar_ = load i32, i32* %scevgep4243, align 4, !alias.scope !94, !noalias !96
  %p_p_mul29 = mul nsw i32 %_p_scalar_12_p_scalar_, %_p_scalar__p_scalar_, !dbg !73
  %p_p_add30 = add nsw i32 %p_p_mul29, %tmp.04.phiops.0.phiops.reload, !dbg !80
  %53 = shl i64 %polly.indvar35, 4
  %scevgep46 = getelementptr i8, i8* %scevgep45, i64 %53
  %scevgep4647 = bitcast i8* %scevgep46 to i32*
  %_p_scalar_.1_p_scalar_ = load i32, i32* %scevgep4647, align 4, !alias.scope !91, !noalias !95
  %scevgep50 = getelementptr i8, i8* %scevgep49, i64 %53
  %scevgep5051 = bitcast i8* %scevgep50 to i32*
  %_p_scalar_12.1_p_scalar_ = load i32, i32* %scevgep5051, align 4, !alias.scope !94, !noalias !96
  %p_p_mul29.1 = mul nsw i32 %_p_scalar_12.1_p_scalar_, %_p_scalar_.1_p_scalar_, !dbg !73
  %p_p_add30.1 = add nsw i32 %p_p_mul29.1, %p_p_add30, !dbg !80
  %54 = shl i64 %polly.indvar35, 4
  %scevgep54 = getelementptr i8, i8* %scevgep53, i64 %54
  %scevgep5455 = bitcast i8* %scevgep54 to i32*
  %_p_scalar_.2_p_scalar_ = load i32, i32* %scevgep5455, align 4, !alias.scope !91, !noalias !95
  %scevgep58 = getelementptr i8, i8* %scevgep57, i64 %54
  %scevgep5859 = bitcast i8* %scevgep58 to i32*
  %_p_scalar_12.2_p_scalar_ = load i32, i32* %scevgep5859, align 4, !alias.scope !94, !noalias !96
  %p_p_mul29.2 = mul nsw i32 %_p_scalar_12.2_p_scalar_, %_p_scalar_.2_p_scalar_, !dbg !73
  %p_p_add30.2 = add nsw i32 %p_p_mul29.2, %p_p_add30.1, !dbg !80
  %55 = shl i64 %polly.indvar35, 4
  %scevgep62 = getelementptr i8, i8* %scevgep61, i64 %55
  %scevgep6263 = bitcast i8* %scevgep62 to i32*
  %_p_scalar_.3_p_scalar_ = load i32, i32* %scevgep6263, align 4, !alias.scope !91, !noalias !95
  %scevgep66 = getelementptr i8, i8* %scevgep65, i64 %55
  %scevgep6667 = bitcast i8* %scevgep66 to i32*
  %_p_scalar_12.3_p_scalar_ = load i32, i32* %scevgep6667, align 4, !alias.scope !94, !noalias !96
  %p_p_mul29.3 = mul nsw i32 %_p_scalar_12.3_p_scalar_, %_p_scalar_.3_p_scalar_, !dbg !73
  %p_p_add30.3 = add nsw i32 %p_p_mul29.3, %p_p_add30.2, !dbg !80
  %56 = shl i64 %polly.indvar35, 2
  %57 = add i64 %56, 4
  %p_exitcond24.3 = icmp eq i64 %57, 1024
  store i32 %p_p_add30.3, i32* %tmp.04.phiops.0.phiops
  store i32 %p_p_add30.3, i32* %p_add30.3.lcssa.phiops
  %polly.indvar_next36 = add nsw i64 %polly.indvar35, 1
  %polly.loop_cond37 = icmp sle i64 %polly.indvar35, 254
  br i1 %polly.loop_cond37, label %polly.loop_header32, label %polly.loop_exit34

polly.loop_preheader33:                           ; preds = %polly.stmt.polly.loop_preheader2
  %58 = shl i64 %polly.indvar30, 12
  %scevgep38 = getelementptr i8, i8* %call, i64 %58
  %scevgep41 = getelementptr i8, i8* %call1, i64 %58
  %scevgep45 = getelementptr i8, i8* %scevgep44, i64 %58
  %scevgep49 = getelementptr i8, i8* %scevgep48, i64 %58
  %scevgep53 = getelementptr i8, i8* %scevgep52, i64 %58
  %scevgep57 = getelementptr i8, i8* %scevgep56, i64 %58
  %59 = shl i64 %polly.indvar30, 12
  %scevgep61 = getelementptr i8, i8* %scevgep60, i64 %59
  %scevgep65 = getelementptr i8, i8* %scevgep64, i64 %59
  br label %polly.loop_header32

polly.loop_header70:                              ; preds = %polly.stmt.polly.stmt.for.inc46, %polly.loop_preheader71
  %polly.indvar73 = phi i64 [ 0, %polly.loop_preheader71 ], [ %polly.indvar_next74, %polly.stmt.polly.stmt.for.inc46 ]
  br label %polly.stmt.polly.stmt.for.inc46

polly.stmt.polly.stmt.for.inc46:                  ; preds = %polly.loop_header70
  %total.02.phiops.0.phiops.reload = load i64, i64* %total.02.phiops.0.phiops
  %60 = mul i64 %polly.indvar73, 20
  %scevgep76 = getelementptr i8, i8* %call2, i64 %60
  %scevgep7677 = bitcast i8* %scevgep76 to i32*
  %_p_scalar_23_p_scalar_ = load i32, i32* %scevgep7677, align 4, !alias.scope !86, !noalias !88
  %p_p_conv44 = sext i32 %_p_scalar_23_p_scalar_ to i64, !dbg !81
  %p_p_add45 = add nsw i64 %p_p_conv44, %total.02.phiops.0.phiops.reload, !dbg !85
  %scevgep80 = getelementptr i8, i8* %scevgep79, i64 %60
  %scevgep8081 = bitcast i8* %scevgep80 to i32*
  %_p_scalar_23.1_p_scalar_ = load i32, i32* %scevgep8081, align 4, !alias.scope !86, !noalias !88
  %p_p_conv44.1 = sext i32 %_p_scalar_23.1_p_scalar_ to i64, !dbg !81
  %p_p_add45.1 = add nsw i64 %p_p_conv44.1, %p_p_add45, !dbg !85
  %61 = mul i64 %polly.indvar73, 20
  %scevgep83 = getelementptr i8, i8* %scevgep82, i64 %61
  %scevgep8384 = bitcast i8* %scevgep83 to i32*
  %_p_scalar_23.2_p_scalar_ = load i32, i32* %scevgep8384, align 4, !alias.scope !86, !noalias !88
  %p_p_conv44.2 = sext i32 %_p_scalar_23.2_p_scalar_ to i64, !dbg !81
  %p_p_add45.2 = add nsw i64 %p_p_conv44.2, %p_p_add45.1, !dbg !85
  %scevgep86 = getelementptr i8, i8* %scevgep85, i64 %61
  %scevgep8687 = bitcast i8* %scevgep86 to i32*
  %_p_scalar_23.3_p_scalar_ = load i32, i32* %scevgep8687, align 4, !alias.scope !86, !noalias !88
  %p_p_conv44.3 = sext i32 %_p_scalar_23.3_p_scalar_ to i64, !dbg !81
  %p_p_add45.3 = add nsw i64 %p_p_conv44.3, %p_p_add45.2, !dbg !85
  %62 = mul i64 %polly.indvar73, 20
  %scevgep89 = getelementptr i8, i8* %scevgep88, i64 %62
  %scevgep8990 = bitcast i8* %scevgep89 to i32*
  %_p_scalar_23.4_p_scalar_ = load i32, i32* %scevgep8990, align 4, !alias.scope !86, !noalias !88
  %p_p_conv44.4 = sext i32 %_p_scalar_23.4_p_scalar_ to i64, !dbg !81
  %p_p_add45.4 = add nsw i64 %p_p_conv44.4, %p_p_add45.3, !dbg !85
  %63 = mul i64 %polly.indvar73, 5
  %64 = add i64 %63, 5
  %p_exitcond.4 = icmp eq i64 %64, 10240
  store i64 %p_p_add45.4, i64* %total.02.phiops.0.phiops
  store i64 %p_p_add45.4, i64* %p_add45.4.s2a
  %polly.indvar_next74 = add nsw i64 %polly.indvar73, 1
  %polly.loop_cond75 = icmp sle i64 %polly.indvar73, 2046
  br i1 %polly.loop_cond75, label %polly.loop_header70, label %polly.loop_exit72

polly.loop_preheader71:                           ; preds = %polly.stmt.polly.stmt.for.inc46.preheader
  %scevgep79 = getelementptr i8, i8* %call2, i64 4
  %scevgep82 = getelementptr i8, i8* %call2, i64 8
  %scevgep85 = getelementptr i8, i8* %call2, i64 12
  %scevgep88 = getelementptr i8, i8* %call2, i64 16
  br label %polly.loop_header70
}

; Function Attrs: nounwind
declare noalias i8* @malloc(i64) #1

; Function Attrs: nounwind
declare i32 @printf(i8* nocapture readonly, ...) #1

; Function Attrs: noreturn nounwind
declare void @exit(i32) #2

; Function Attrs: nounwind
declare i8* @setlocale(i32, i8*) #1

; Function Attrs: nounwind readnone
declare void @llvm.dbg.value(metadata, i64, metadata, metadata) #3

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "polly-optimized" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noreturn nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind readnone }
attributes #4 = { nounwind }
attributes #5 = { noreturn nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!14, !15}
!llvm.ident = !{!16}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 3.9.0 (http://llvm.org/git/clang.git e177b4a63ca92c5fec010986944530688e104074) (http://llvm.org/git/llvm.git fcd97ccb03712372fe95f1732638de5ed3fcabe8)", isOptimized: false, runtimeVersion: 0, emissionKind: 1, enums: !2, retainedTypes: !3, subprograms: !7)
!1 = !DIFile(filename: "VectorMult.c", directory: "/home/sam/workspace/WhileyOpenCL/polly/VectorMult/impl/handwritten")
!2 = !{}
!3 = !{!4, !6}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64, align: 64)
!5 = !DIBasicType(name: "int", size: 32, align: 32, encoding: DW_ATE_signed)
!6 = !DIBasicType(name: "long long int", size: 64, align: 64, encoding: DW_ATE_signed)
!7 = !{!8}
!8 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 8, type: !9, isLocal: false, isDefinition: true, scopeLine: 8, flags: DIFlagPrototyped, isOptimized: false, variables: !2)
!9 = !DISubroutineType(types: !10)
!10 = !{!5, !5, !11}
!11 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !12, size: 64, align: 64)
!12 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !13, size: 64, align: 64)
!13 = !DIBasicType(name: "char", size: 8, align: 8, encoding: DW_ATE_signed_char)
!14 = !{i32 2, !"Dwarf Version", i32 4}
!15 = !{i32 2, !"Debug Info Version", i32 3}
!16 = !{!"clang version 3.9.0 (http://llvm.org/git/clang.git e177b4a63ca92c5fec010986944530688e104074) (http://llvm.org/git/llvm.git fcd97ccb03712372fe95f1732638de5ed3fcabe8)"}
!17 = !DILocation(line: 8, column: 14, scope: !8)
!18 = !DILocalVariable(name: "argc", arg: 1, scope: !8, file: !1, line: 8, type: !5)
!19 = !DIExpression()
!20 = !DILocalVariable(name: "args", arg: 2, scope: !8, file: !1, line: 8, type: !11)
!21 = !DILocation(line: 8, column: 27, scope: !8)
!22 = !DILocation(line: 12, column: 18, scope: !8)
!23 = !DILocation(line: 12, column: 11, scope: !8)
!24 = !DILocalVariable(name: "u", scope: !8, file: !1, line: 12, type: !4)
!25 = !DILocation(line: 12, column: 7, scope: !8)
!26 = !DILocation(line: 13, column: 18, scope: !8)
!27 = !DILocation(line: 13, column: 11, scope: !8)
!28 = !DILocalVariable(name: "v", scope: !8, file: !1, line: 13, type: !4)
!29 = !DILocation(line: 13, column: 7, scope: !8)
!30 = !DILocation(line: 14, column: 20, scope: !8)
!31 = !DILocalVariable(name: "r", scope: !8, file: !1, line: 11, type: !6)
!32 = !DILocation(line: 11, column: 12, scope: !8)
!33 = !DILocation(line: 17, column: 2, scope: !34)
!34 = !DILexicalBlockFile(scope: !35, file: !1, discriminator: 1)
!35 = distinct !DILexicalBlock(scope: !36, file: !1, line: 17, column: 2)
!36 = distinct !DILexicalBlock(scope: !8, file: !1, line: 17, column: 2)
!37 = !DILocation(line: 20, column: 7, scope: !38)
!38 = distinct !DILexicalBlock(scope: !39, file: !1, line: 19, column: 21)
!39 = distinct !DILexicalBlock(scope: !40, file: !1, line: 19, column: 3)
!40 = distinct !DILexicalBlock(scope: !41, file: !1, line: 19, column: 3)
!41 = distinct !DILexicalBlock(scope: !35, file: !1, line: 17, column: 18)
!42 = !DILocation(line: 19, column: 3, scope: !43)
!43 = !DILexicalBlockFile(scope: !39, file: !1, discriminator: 1)
!44 = !DILocation(line: 20, column: 4, scope: !38)
!45 = !DILocation(line: 20, column: 13, scope: !38)
!46 = !DILocation(line: 21, column: 4, scope: !38)
!47 = !DILocation(line: 21, column: 13, scope: !38)
!48 = distinct !{!48, !49, !50}
!49 = !{!"llvm.loop.vectorize.width", i32 1}
!50 = !{!"llvm.loop.interleave.count", i32 1}
!51 = !DILocation(line: 17, column: 15, scope: !52)
!52 = !DILexicalBlockFile(scope: !35, file: !1, discriminator: 2)
!53 = !DILocation(line: 41, column: 3, scope: !54)
!54 = distinct !DILexicalBlock(scope: !55, file: !1, line: 40, column: 19)
!55 = distinct !DILexicalBlock(scope: !8, file: !1, line: 40, column: 5)
!56 = !DILocation(line: 42, column: 3, scope: !54)
!57 = !DILocation(line: 46, column: 2, scope: !8)
!58 = !DILocation(line: 47, column: 2, scope: !8)
!59 = !DILocation(line: 49, column: 2, scope: !8)
!60 = !DILocation(line: 40, column: 11, scope: !55)
!61 = !DILocation(line: 40, column: 5, scope: !8)
!62 = distinct !{!62, !63, !"polly.alias.scope.call2"}
!63 = distinct !{!63, !"polly.alias.scope.domain"}
!64 = !{!65, !66, !67, !68, !69, !70}
!65 = distinct !{!65, !63, !"polly.alias.scope.total.02"}
!66 = distinct !{!66, !63, !"polly.alias.scope.tmp.04"}
!67 = distinct !{!67, !63, !"polly.alias.scope.call"}
!68 = distinct !{!68, !63, !"polly.alias.scope.add30.lcssa"}
!69 = distinct !{!69, !63, !"polly.alias.scope.call1"}
!70 = distinct !{!70, !63, !"polly.alias.scope.add45"}
!71 = !{!65, !66, !68, !69, !70, !62}
!72 = !{!65, !66, !67, !68, !70, !62}
!73 = !DILocation(line: 29, column: 23, scope: !74)
!74 = distinct !DILexicalBlock(scope: !75, file: !1, line: 27, column: 21)
!75 = distinct !DILexicalBlock(scope: !76, file: !1, line: 27, column: 3)
!76 = distinct !DILexicalBlock(scope: !77, file: !1, line: 27, column: 3)
!77 = distinct !DILexicalBlock(scope: !78, file: !1, line: 25, column: 18)
!78 = distinct !DILexicalBlock(scope: !79, file: !1, line: 25, column: 2)
!79 = distinct !DILexicalBlock(scope: !8, file: !1, line: 25, column: 2)
!80 = !DILocation(line: 29, column: 13, scope: !74)
!81 = !DILocation(line: 36, column: 19, scope: !82)
!82 = distinct !DILexicalBlock(scope: !83, file: !1, line: 35, column: 18)
!83 = distinct !DILexicalBlock(scope: !84, file: !1, line: 35, column: 2)
!84 = distinct !DILexicalBlock(scope: !8, file: !1, line: 35, column: 2)
!85 = !DILocation(line: 36, column: 17, scope: !82)
!86 = distinct !{!86, !87, !"polly.alias.scope.call2"}
!87 = distinct !{!87, !"polly.alias.scope.domain"}
!88 = !{!89, !90, !91, !92, !93, !94}
!89 = distinct !{!89, !87, !"polly.alias.scope.p_add30.3.lcssa"}
!90 = distinct !{!90, !87, !"polly.alias.scope.total.02.phiops.0"}
!91 = distinct !{!91, !87, !"polly.alias.scope.call"}
!92 = distinct !{!92, !87, !"polly.alias.scope.p_add45.4"}
!93 = distinct !{!93, !87, !"polly.alias.scope.tmp.04.phiops.0"}
!94 = distinct !{!94, !87, !"polly.alias.scope.call1"}
!95 = !{!89, !90, !92, !93, !94, !86}
!96 = !{!89, !90, !91, !92, !93, !86}
