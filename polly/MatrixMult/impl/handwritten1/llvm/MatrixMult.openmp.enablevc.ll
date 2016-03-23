; ModuleID = 'MatrixMult.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@A = common global i32** null, align 8
@B = common global [2000 x [2000 x i32]] zeroinitializer, align 16
@C = common global [2000 x [2000 x i64]] zeroinitializer, align 16
@.str = private unnamed_addr constant [32 x i8] c"Pass %d X %d matrix test case \0A\00", align 1
@.str.1 = private unnamed_addr constant [49 x i8] c"A[%d][%d] = %d, B[%d][%d] =%d, C[%d][%d] =%lld \0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define void @init() #0 !dbg !8 {
entry:
  %call = tail call noalias i8* @malloc(i64 16000) #4, !dbg !34
  store i8* %call, i8** bitcast (i32*** @A to i8**), align 8, !dbg !35, !tbaa !36
  %call1 = tail call noalias i8* @malloc(i64 16000000) #4, !dbg !40
  %0 = bitcast i8* %call to i8**, !dbg !41
  store i8* %call1, i8** %0, align 8, !dbg !42, !tbaa !36
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !12, metadata !43), !dbg !44
  br label %for.body, !dbg !45

for.body:                                         ; preds = %for.body, %entry
  %indvars.iv92 = phi i64 [ 0, %entry ], [ %indvars.iv.next93.4, %for.body ]
  %1 = load i32**, i32*** @A, align 8, !dbg !49, !tbaa !36
  %2 = load i32*, i32** %1, align 8, !dbg !51, !tbaa !36
  %3 = mul nuw nsw i64 %indvars.iv92, 2000, !dbg !52
  %add.ptr = getelementptr inbounds i32, i32* %2, i64 %3, !dbg !53
  %arrayidx2 = getelementptr inbounds i32*, i32** %1, i64 %indvars.iv92, !dbg !54
  store i32* %add.ptr, i32** %arrayidx2, align 8, !dbg !55, !tbaa !36
  %indvars.iv.next93 = add nuw nsw i64 %indvars.iv92, 1, !dbg !45
  %4 = load i32**, i32*** @A, align 8, !dbg !49, !tbaa !36
  %5 = load i32*, i32** %4, align 8, !dbg !51, !tbaa !36
  %6 = mul nuw nsw i64 %indvars.iv.next93, 2000, !dbg !52
  %add.ptr.1 = getelementptr inbounds i32, i32* %5, i64 %6, !dbg !53
  %arrayidx2.1 = getelementptr inbounds i32*, i32** %4, i64 %indvars.iv.next93, !dbg !54
  store i32* %add.ptr.1, i32** %arrayidx2.1, align 8, !dbg !55, !tbaa !36
  %indvars.iv.next93.1 = add nsw i64 %indvars.iv92, 2, !dbg !45
  %7 = load i32**, i32*** @A, align 8, !dbg !49, !tbaa !36
  %8 = load i32*, i32** %7, align 8, !dbg !51, !tbaa !36
  %9 = mul nuw nsw i64 %indvars.iv.next93.1, 2000, !dbg !52
  %add.ptr.2 = getelementptr inbounds i32, i32* %8, i64 %9, !dbg !53
  %arrayidx2.2 = getelementptr inbounds i32*, i32** %7, i64 %indvars.iv.next93.1, !dbg !54
  store i32* %add.ptr.2, i32** %arrayidx2.2, align 8, !dbg !55, !tbaa !36
  %indvars.iv.next93.2 = add nsw i64 %indvars.iv92, 3, !dbg !45
  %10 = load i32**, i32*** @A, align 8, !dbg !49, !tbaa !36
  %11 = load i32*, i32** %10, align 8, !dbg !51, !tbaa !36
  %12 = mul nuw nsw i64 %indvars.iv.next93.2, 2000, !dbg !52
  %add.ptr.3 = getelementptr inbounds i32, i32* %11, i64 %12, !dbg !53
  %arrayidx2.3 = getelementptr inbounds i32*, i32** %10, i64 %indvars.iv.next93.2, !dbg !54
  store i32* %add.ptr.3, i32** %arrayidx2.3, align 8, !dbg !55, !tbaa !36
  %indvars.iv.next93.3 = add nsw i64 %indvars.iv92, 4, !dbg !45
  %13 = load i32**, i32*** @A, align 8, !dbg !49, !tbaa !36
  %14 = load i32*, i32** %13, align 8, !dbg !51, !tbaa !36
  %15 = mul nuw nsw i64 %indvars.iv.next93.3, 2000, !dbg !52
  %add.ptr.4 = getelementptr inbounds i32, i32* %14, i64 %15, !dbg !53
  %arrayidx2.4 = getelementptr inbounds i32*, i32** %13, i64 %indvars.iv.next93.3, !dbg !54
  store i32* %add.ptr.4, i32** %arrayidx2.4, align 8, !dbg !55, !tbaa !36
  %indvars.iv.next93.4 = add nsw i64 %indvars.iv92, 5, !dbg !45
  %exitcond95.4 = icmp eq i64 %indvars.iv.next93.4, 2000, !dbg !45
  br i1 %exitcond95.4, label %for.cond6.preheader.preheader, label %for.body, !dbg !45

for.cond6.preheader.preheader:                    ; preds = %for.body
  %16 = load i32**, i32*** @A, align 8, !dbg !56, !tbaa !36
  br label %for.cond6.preheader, !dbg !63

for.cond6.preheader:                              ; preds = %for.cond6.preheader.preheader, %for.inc20
  %indvars.iv89 = phi i64 [ %indvars.iv.next90, %for.inc20 ], [ 0, %for.cond6.preheader.preheader ]
  %scevgep98 = getelementptr [2000 x [2000 x i32]], [2000 x [2000 x i32]]* @B, i64 0, i64 %indvars.iv89, i64 0, !dbg !70
  %scevgep100 = getelementptr [2000 x [2000 x i32]], [2000 x [2000 x i32]]* @B, i64 0, i64 %indvars.iv89, i64 1999, !dbg !70
  %arrayidx11 = getelementptr inbounds i32*, i32** %16, i64 %indvars.iv89, !dbg !70
  %17 = load i32*, i32** %arrayidx11, align 8, !dbg !70, !tbaa !36
  %scevgep = getelementptr i32, i32* %17, i64 1999, !dbg !63
  %bound0 = icmp ule i32* %17, %scevgep100, !dbg !63
  %bound1 = icmp ule i32* %scevgep98, %scevgep, !dbg !63
  %memcheck.conflict = and i1 %bound0, %bound1, !dbg !63
  br i1 %memcheck.conflict, label %for.body8.preheader, label %vector.body.preheader, !dbg !63

vector.body.preheader:                            ; preds = %for.cond6.preheader
  br label %vector.body, !dbg !70

for.body8.preheader:                              ; preds = %for.cond6.preheader
  br label %for.body8, !dbg !70

vector.body:                                      ; preds = %vector.body, %vector.body.preheader
  %index = phi i64 [ 0, %vector.body.preheader ], [ %index.next.1, %vector.body ], !dbg !63
  %18 = getelementptr inbounds i32, i32* %17, i64 %index, !dbg !70
  %19 = bitcast i32* %18 to <4 x i32>*, !dbg !72
  store <4 x i32> zeroinitializer, <4 x i32>* %19, align 4, !dbg !72, !tbaa !73
  %20 = getelementptr i32, i32* %18, i64 4, !dbg !72
  %21 = bitcast i32* %20 to <4 x i32>*, !dbg !72
  store <4 x i32> zeroinitializer, <4 x i32>* %21, align 4, !dbg !72, !tbaa !73
  %22 = getelementptr inbounds [2000 x [2000 x i32]], [2000 x [2000 x i32]]* @B, i64 0, i64 %indvars.iv89, i64 %index, !dbg !75
  %23 = bitcast i32* %22 to <4 x i32>*, !dbg !76
  store <4 x i32> zeroinitializer, <4 x i32>* %23, align 16, !dbg !76, !tbaa !73
  %24 = getelementptr i32, i32* %22, i64 4, !dbg !76
  %25 = bitcast i32* %24 to <4 x i32>*, !dbg !76
  store <4 x i32> zeroinitializer, <4 x i32>* %25, align 16, !dbg !76, !tbaa !73
  %index.next = or i64 %index, 8, !dbg !63
  %26 = getelementptr inbounds i32, i32* %17, i64 %index.next, !dbg !70
  %27 = bitcast i32* %26 to <4 x i32>*, !dbg !72
  store <4 x i32> zeroinitializer, <4 x i32>* %27, align 4, !dbg !72, !tbaa !73
  %28 = getelementptr i32, i32* %26, i64 4, !dbg !72
  %29 = bitcast i32* %28 to <4 x i32>*, !dbg !72
  store <4 x i32> zeroinitializer, <4 x i32>* %29, align 4, !dbg !72, !tbaa !73
  %30 = getelementptr inbounds [2000 x [2000 x i32]], [2000 x [2000 x i32]]* @B, i64 0, i64 %indvars.iv89, i64 %index.next, !dbg !75
  %31 = bitcast i32* %30 to <4 x i32>*, !dbg !76
  store <4 x i32> zeroinitializer, <4 x i32>* %31, align 16, !dbg !76, !tbaa !73
  %32 = getelementptr i32, i32* %30, i64 4, !dbg !76
  %33 = bitcast i32* %32 to <4 x i32>*, !dbg !76
  store <4 x i32> zeroinitializer, <4 x i32>* %33, align 16, !dbg !76, !tbaa !73
  %index.next.1 = add nsw i64 %index, 16, !dbg !63
  %34 = icmp eq i64 %index.next.1, 2000, !dbg !63
  br i1 %34, label %for.inc20.loopexit134, label %vector.body, !dbg !63, !llvm.loop !77

for.body8:                                        ; preds = %for.body8, %for.body8.preheader
  %indvars.iv86 = phi i64 [ 0, %for.body8.preheader ], [ %indvars.iv.next87.4, %for.body8 ]
  %arrayidx12 = getelementptr inbounds i32, i32* %17, i64 %indvars.iv86, !dbg !70
  store i32 0, i32* %arrayidx12, align 4, !dbg !72, !tbaa !73
  %arrayidx16 = getelementptr inbounds [2000 x [2000 x i32]], [2000 x [2000 x i32]]* @B, i64 0, i64 %indvars.iv89, i64 %indvars.iv86, !dbg !75
  store i32 0, i32* %arrayidx16, align 4, !dbg !76, !tbaa !73
  %indvars.iv.next87 = add nuw nsw i64 %indvars.iv86, 1, !dbg !63
  %arrayidx12.1 = getelementptr inbounds i32, i32* %17, i64 %indvars.iv.next87, !dbg !70
  store i32 0, i32* %arrayidx12.1, align 4, !dbg !72, !tbaa !73
  %arrayidx16.1 = getelementptr inbounds [2000 x [2000 x i32]], [2000 x [2000 x i32]]* @B, i64 0, i64 %indvars.iv89, i64 %indvars.iv.next87, !dbg !75
  store i32 0, i32* %arrayidx16.1, align 4, !dbg !76, !tbaa !73
  %indvars.iv.next87.1 = add nsw i64 %indvars.iv86, 2, !dbg !63
  %arrayidx12.2 = getelementptr inbounds i32, i32* %17, i64 %indvars.iv.next87.1, !dbg !70
  store i32 0, i32* %arrayidx12.2, align 4, !dbg !72, !tbaa !73
  %arrayidx16.2 = getelementptr inbounds [2000 x [2000 x i32]], [2000 x [2000 x i32]]* @B, i64 0, i64 %indvars.iv89, i64 %indvars.iv.next87.1, !dbg !75
  store i32 0, i32* %arrayidx16.2, align 4, !dbg !76, !tbaa !73
  %indvars.iv.next87.2 = add nsw i64 %indvars.iv86, 3, !dbg !63
  %arrayidx12.3 = getelementptr inbounds i32, i32* %17, i64 %indvars.iv.next87.2, !dbg !70
  store i32 0, i32* %arrayidx12.3, align 4, !dbg !72, !tbaa !73
  %arrayidx16.3 = getelementptr inbounds [2000 x [2000 x i32]], [2000 x [2000 x i32]]* @B, i64 0, i64 %indvars.iv89, i64 %indvars.iv.next87.2, !dbg !75
  store i32 0, i32* %arrayidx16.3, align 4, !dbg !76, !tbaa !73
  %indvars.iv.next87.3 = add nsw i64 %indvars.iv86, 4, !dbg !63
  %arrayidx12.4 = getelementptr inbounds i32, i32* %17, i64 %indvars.iv.next87.3, !dbg !70
  store i32 0, i32* %arrayidx12.4, align 4, !dbg !72, !tbaa !73
  %arrayidx16.4 = getelementptr inbounds [2000 x [2000 x i32]], [2000 x [2000 x i32]]* @B, i64 0, i64 %indvars.iv89, i64 %indvars.iv.next87.3, !dbg !75
  store i32 0, i32* %arrayidx16.4, align 4, !dbg !76, !tbaa !73
  %indvars.iv.next87.4 = add nsw i64 %indvars.iv86, 5, !dbg !63
  %exitcond88.4 = icmp eq i64 %indvars.iv.next87.4, 2000, !dbg !63
  br i1 %exitcond88.4, label %for.inc20.loopexit, label %for.body8, !dbg !63, !llvm.loop !80

for.inc20.loopexit:                               ; preds = %for.body8
  br label %for.inc20, !dbg !81

for.inc20.loopexit134:                            ; preds = %vector.body
  br label %for.inc20, !dbg !81

for.inc20:                                        ; preds = %for.inc20.loopexit134, %for.inc20.loopexit
  %indvars.iv.next90 = add nuw nsw i64 %indvars.iv89, 1, !dbg !81
  %exitcond91 = icmp eq i64 %indvars.iv.next90, 2000, !dbg !81
  br i1 %exitcond91, label %for.cond26.preheader.preheader, label %for.cond6.preheader, !dbg !81

for.cond26.preheader.preheader:                   ; preds = %for.inc20
  br label %for.cond26.preheader, !dbg !56

for.cond26.preheader:                             ; preds = %for.cond26.preheader.preheader, %for.inc49
  %indvars.iv83 = phi i64 [ %indvars.iv.next84, %for.inc49 ], [ 0, %for.cond26.preheader.preheader ]
  %scevgep110 = getelementptr [2000 x [2000 x i32]], [2000 x [2000 x i32]]* @B, i64 0, i64 %indvars.iv83, i64 0, !dbg !56
  %scevgep112 = getelementptr [2000 x [2000 x i32]], [2000 x [2000 x i32]]* @B, i64 0, i64 %indvars.iv83, i64 1999, !dbg !56
  %arrayidx31 = getelementptr inbounds i32*, i32** %16, i64 %indvars.iv83, !dbg !56
  %35 = load i32*, i32** %arrayidx31, align 8, !dbg !56, !tbaa !36
  %36 = trunc i64 %indvars.iv83 to i32, !dbg !83
  %scevgep108 = getelementptr i32, i32* %35, i64 1999, !dbg !84
  %bound0114 = icmp ule i32* %35, %scevgep112, !dbg !84
  %bound1115 = icmp ule i32* %scevgep110, %scevgep108, !dbg !84
  %memcheck.conflict117 = and i1 %bound0114, %bound1115, !dbg !84
  br i1 %memcheck.conflict117, label %for.body28.preheader, label %vector.ph119, !dbg !84

for.body28.preheader:                             ; preds = %for.cond26.preheader
  br label %for.body28, !dbg !56

vector.ph119:                                     ; preds = %for.cond26.preheader
  %broadcast.splatinsert129 = insertelement <4 x i32> undef, i32 %36, i32 0, !dbg !84
  %broadcast.splat130 = shufflevector <4 x i32> %broadcast.splatinsert129, <4 x i32> undef, <4 x i32> zeroinitializer, !dbg !84
  br label %vector.body103, !dbg !84

vector.body103:                                   ; preds = %vector.body103, %vector.ph119
  %index120 = phi i64 [ 0, %vector.ph119 ], [ %index.next121, %vector.body103 ], !dbg !84
  %37 = getelementptr inbounds i32, i32* %35, i64 %index120, !dbg !56
  %38 = bitcast i32* %37 to <4 x i32>*, !dbg !56
  %wide.load = load <4 x i32>, <4 x i32>* %38, align 4, !dbg !56, !tbaa !73
  %39 = getelementptr i32, i32* %37, i64 4, !dbg !56
  %40 = bitcast i32* %39 to <4 x i32>*, !dbg !56
  %wide.load128 = load <4 x i32>, <4 x i32>* %40, align 4, !dbg !56, !tbaa !73
  %41 = add nsw <4 x i32> %wide.load, %broadcast.splat130, !dbg !83
  %42 = add nsw <4 x i32> %wide.load128, %broadcast.splat130, !dbg !83
  %43 = bitcast i32* %37 to <4 x i32>*, !dbg !86
  store <4 x i32> %41, <4 x i32>* %43, align 4, !dbg !86, !tbaa !73
  %44 = bitcast i32* %39 to <4 x i32>*, !dbg !86
  store <4 x i32> %42, <4 x i32>* %44, align 4, !dbg !86, !tbaa !73
  %45 = getelementptr inbounds [2000 x [2000 x i32]], [2000 x [2000 x i32]]* @B, i64 0, i64 %indvars.iv83, i64 %index120, !dbg !87
  %46 = bitcast i32* %45 to <4 x i32>*, !dbg !87
  %wide.load131 = load <4 x i32>, <4 x i32>* %46, align 16, !dbg !87, !tbaa !73
  %47 = getelementptr i32, i32* %45, i64 4, !dbg !87
  %48 = bitcast i32* %47 to <4 x i32>*, !dbg !87
  %wide.load132 = load <4 x i32>, <4 x i32>* %48, align 16, !dbg !87, !tbaa !73
  %49 = add nsw <4 x i32> %wide.load131, %broadcast.splat130, !dbg !88
  %50 = add nsw <4 x i32> %wide.load132, %broadcast.splat130, !dbg !88
  %51 = bitcast i32* %45 to <4 x i32>*, !dbg !89
  store <4 x i32> %49, <4 x i32>* %51, align 16, !dbg !89, !tbaa !73
  %52 = bitcast i32* %47 to <4 x i32>*, !dbg !89
  store <4 x i32> %50, <4 x i32>* %52, align 16, !dbg !89, !tbaa !73
  %index.next121 = add i64 %index120, 8, !dbg !84
  %53 = icmp eq i64 %index.next121, 2000, !dbg !84
  br i1 %53, label %for.inc49.loopexit133, label %vector.body103, !dbg !84, !llvm.loop !90

for.body28:                                       ; preds = %for.body28, %for.body28.preheader
  %indvars.iv = phi i64 [ 0, %for.body28.preheader ], [ %indvars.iv.next.1, %for.body28 ]
  %arrayidx32 = getelementptr inbounds i32, i32* %35, i64 %indvars.iv, !dbg !56
  %54 = load i32, i32* %arrayidx32, align 4, !dbg !56, !tbaa !73
  %add = add nsw i32 %54, %36, !dbg !83
  store i32 %add, i32* %arrayidx32, align 4, !dbg !86, !tbaa !73
  %arrayidx40 = getelementptr inbounds [2000 x [2000 x i32]], [2000 x [2000 x i32]]* @B, i64 0, i64 %indvars.iv83, i64 %indvars.iv, !dbg !87
  %55 = load i32, i32* %arrayidx40, align 8, !dbg !87, !tbaa !73
  %add41 = add nsw i32 %55, %36, !dbg !88
  store i32 %add41, i32* %arrayidx40, align 8, !dbg !89, !tbaa !73
  %indvars.iv.next = or i64 %indvars.iv, 1, !dbg !84
  %arrayidx32.1 = getelementptr inbounds i32, i32* %35, i64 %indvars.iv.next, !dbg !56
  %56 = load i32, i32* %arrayidx32.1, align 4, !dbg !56, !tbaa !73
  %add.1 = add nsw i32 %56, %36, !dbg !83
  store i32 %add.1, i32* %arrayidx32.1, align 4, !dbg !86, !tbaa !73
  %arrayidx40.1 = getelementptr inbounds [2000 x [2000 x i32]], [2000 x [2000 x i32]]* @B, i64 0, i64 %indvars.iv83, i64 %indvars.iv.next, !dbg !87
  %57 = load i32, i32* %arrayidx40.1, align 4, !dbg !87, !tbaa !73
  %add41.1 = add nsw i32 %57, %36, !dbg !88
  store i32 %add41.1, i32* %arrayidx40.1, align 4, !dbg !89, !tbaa !73
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2, !dbg !84
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 2000, !dbg !84
  br i1 %exitcond.1, label %for.inc49.loopexit, label %for.body28, !dbg !84, !llvm.loop !91

for.inc49.loopexit:                               ; preds = %for.body28
  br label %for.inc49, !dbg !92

for.inc49.loopexit133:                            ; preds = %vector.body103
  br label %for.inc49, !dbg !92

for.inc49:                                        ; preds = %for.inc49.loopexit133, %for.inc49.loopexit
  %indvars.iv.next84 = add nuw nsw i64 %indvars.iv83, 1, !dbg !92
  %exitcond85 = icmp eq i64 %indvars.iv.next84, 2000, !dbg !92
  br i1 %exitcond85, label %for.end51, label %for.cond26.preheader, !dbg !92

for.end51:                                        ; preds = %for.inc49
  ret void, !dbg !94
}

; Function Attrs: nounwind
declare noalias i8* @malloc(i64) #1

; Function Attrs: noinline nounwind uwtable
define void @mat_mult() #0 !dbg !14 {
entry:
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !16, metadata !43), !dbg !95
  %0 = load i32**, i32*** @A, align 8, !dbg !96, !tbaa !36
  br label %for.cond1.preheader, !dbg !105

for.cond1.preheader:                              ; preds = %for.inc28, %entry
  %indvars.iv52 = phi i64 [ 0, %entry ], [ %indvars.iv.next53, %for.inc28 ]
  %arrayidx15 = getelementptr inbounds i32*, i32** %0, i64 %indvars.iv52, !dbg !96
  %1 = load i32*, i32** %arrayidx15, align 8, !dbg !96, !tbaa !36
  br label %for.body3, !dbg !107

for.body3:                                        ; preds = %for.inc25, %for.cond1.preheader
  %indvars.iv49 = phi i64 [ 0, %for.cond1.preheader ], [ %indvars.iv.next50, %for.inc25 ]
  %arrayidx5 = getelementptr inbounds [2000 x [2000 x i64]], [2000 x [2000 x i64]]* @C, i64 0, i64 %indvars.iv52, i64 %indvars.iv49, !dbg !109
  store i64 0, i64* %arrayidx5, align 8, !dbg !110, !tbaa !111
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !18, metadata !43), !dbg !113
  br label %for.body8, !dbg !114

for.body8:                                        ; preds = %for.body8, %for.body3
  %2 = phi i64 [ 0, %for.body3 ], [ %add.1, %for.body8 ], !dbg !116
  %indvars.iv = phi i64 [ 0, %for.body3 ], [ %indvars.iv.next.1, %for.body8 ]
  %arrayidx16 = getelementptr inbounds i32, i32* %1, i64 %indvars.iv, !dbg !96
  %3 = load i32, i32* %arrayidx16, align 4, !dbg !96, !tbaa !73
  %arrayidx20 = getelementptr inbounds [2000 x [2000 x i32]], [2000 x [2000 x i32]]* @B, i64 0, i64 %indvars.iv, i64 %indvars.iv49, !dbg !117
  %4 = load i32, i32* %arrayidx20, align 4, !dbg !117, !tbaa !73
  %mul = mul nsw i32 %4, %3, !dbg !118
  %conv = sext i32 %mul to i64, !dbg !96
  %add = add nsw i64 %conv, %2, !dbg !119
  %indvars.iv.next = or i64 %indvars.iv, 1, !dbg !114
  %arrayidx16.1 = getelementptr inbounds i32, i32* %1, i64 %indvars.iv.next, !dbg !96
  %5 = load i32, i32* %arrayidx16.1, align 4, !dbg !96, !tbaa !73
  %arrayidx20.1 = getelementptr inbounds [2000 x [2000 x i32]], [2000 x [2000 x i32]]* @B, i64 0, i64 %indvars.iv.next, i64 %indvars.iv49, !dbg !117
  %6 = load i32, i32* %arrayidx20.1, align 4, !dbg !117, !tbaa !73
  %mul.1 = mul nsw i32 %6, %5, !dbg !118
  %conv.1 = sext i32 %mul.1 to i64, !dbg !96
  %add.1 = add nsw i64 %conv.1, %add, !dbg !119
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2, !dbg !114
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 2000, !dbg !114
  br i1 %exitcond.1, label %for.inc25, label %for.body8, !dbg !114

for.inc25:                                        ; preds = %for.body8
  %add.1.lcssa = phi i64 [ %add.1, %for.body8 ]
  store i64 %add.1.lcssa, i64* %arrayidx5, align 8, !dbg !116, !tbaa !111
  %indvars.iv.next50 = add nuw nsw i64 %indvars.iv49, 1, !dbg !107
  %exitcond51 = icmp eq i64 %indvars.iv.next50, 2000, !dbg !107
  br i1 %exitcond51, label %for.inc28, label %for.body3, !dbg !107

for.inc28:                                        ; preds = %for.inc25
  %indvars.iv.next53 = add nuw nsw i64 %indvars.iv52, 1, !dbg !105
  %exitcond54 = icmp eq i64 %indvars.iv.next53, 2000, !dbg !105
  br i1 %exitcond54, label %for.end30, label %for.cond1.preheader, !dbg !105

for.end30:                                        ; preds = %for.inc28
  ret void, !dbg !120
}

; Function Attrs: nounwind uwtable
define i32 @main() #2 !dbg !19 {
entry:
  tail call void @init(), !dbg !121
  tail call void @mat_mult(), !dbg !122
  %call = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i64 0, i64 0), i32 2000, i32 2000), !dbg !123
  %0 = load i32**, i32*** @A, align 8, !dbg !124, !tbaa !36
  %arrayidx = getelementptr inbounds i32*, i32** %0, i64 1999, !dbg !124
  %1 = load i32*, i32** %arrayidx, align 8, !dbg !124, !tbaa !36
  %arrayidx1 = getelementptr inbounds i32, i32* %1, i64 1999, !dbg !124
  %2 = load i32, i32* %arrayidx1, align 4, !dbg !124, !tbaa !73
  %3 = load i32, i32* getelementptr inbounds ([2000 x [2000 x i32]], [2000 x [2000 x i32]]* @B, i64 0, i64 1999, i64 1999), align 4, !dbg !125, !tbaa !73
  %4 = load i64, i64* getelementptr inbounds ([2000 x [2000 x i64]], [2000 x [2000 x i64]]* @C, i64 0, i64 1999, i64 1999), align 8, !dbg !126, !tbaa !111
  %call2 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([49 x i8], [49 x i8]* @.str.1, i64 0, i64 0), i32 1999, i32 1999, i32 %2, i32 1999, i32 1999, i32 %3, i32 1999, i32 1999, i64 %4), !dbg !127
  ret i32 0, !dbg !128
}

; Function Attrs: nounwind
declare i32 @printf(i8* nocapture readonly, ...) #1

; Function Attrs: nounwind readnone
declare void @llvm.dbg.value(metadata, i64, metadata, metadata) #3

attributes #0 = { noinline nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind readnone }
attributes #4 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!31, !32}
!llvm.ident = !{!33}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 3.9.0 (http://llvm.org/git/clang.git e177b4a63ca92c5fec010986944530688e104074) (http://llvm.org/git/llvm.git fcd97ccb03712372fe95f1732638de5ed3fcabe8)", isOptimized: true, runtimeVersion: 0, emissionKind: 1, enums: !2, retainedTypes: !3, subprograms: !7, globals: !22)
!1 = !DIFile(filename: "MatrixMult.c", directory: "/home/sam/workspace/WhileyOpenCL/polly/MatrixMult/impl/handwritten1")
!2 = !{}
!3 = !{!4, !5}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64, align: 64)
!5 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !6, size: 64, align: 64)
!6 = !DIBasicType(name: "int", size: 32, align: 32, encoding: DW_ATE_signed)
!7 = !{!8, !14, !19}
!8 = distinct !DISubprogram(name: "init", scope: !1, file: !1, line: 13, type: !9, isLocal: false, isDefinition: true, scopeLine: 13, isOptimized: true, variables: !11)
!9 = !DISubroutineType(types: !10)
!10 = !{null}
!11 = !{!12, !13}
!12 = !DILocalVariable(name: "i", scope: !8, file: !1, line: 15, type: !6)
!13 = !DILocalVariable(name: "j", scope: !8, file: !1, line: 15, type: !6)
!14 = distinct !DISubprogram(name: "mat_mult", scope: !1, file: !1, line: 38, type: !9, isLocal: false, isDefinition: true, scopeLine: 38, isOptimized: true, variables: !15)
!15 = !{!16, !17, !18}
!16 = !DILocalVariable(name: "i", scope: !14, file: !1, line: 39, type: !6)
!17 = !DILocalVariable(name: "j", scope: !14, file: !1, line: 39, type: !6)
!18 = !DILocalVariable(name: "k", scope: !14, file: !1, line: 39, type: !6)
!19 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 62, type: !20, isLocal: false, isDefinition: true, scopeLine: 63, isOptimized: true, variables: !2)
!20 = !DISubroutineType(types: !21)
!21 = !{!6}
!22 = !{!23, !24, !28}
!23 = !DIGlobalVariable(name: "A", scope: !0, file: !1, line: 8, type: !4, isLocal: false, isDefinition: true, variable: i32*** @A)
!24 = !DIGlobalVariable(name: "B", scope: !0, file: !1, line: 9, type: !25, isLocal: false, isDefinition: true, variable: [2000 x [2000 x i32]]* @B)
!25 = !DICompositeType(tag: DW_TAG_array_type, baseType: !6, size: 128000000, align: 32, elements: !26)
!26 = !{!27, !27}
!27 = !DISubrange(count: 2000)
!28 = !DIGlobalVariable(name: "C", scope: !0, file: !1, line: 10, type: !29, isLocal: false, isDefinition: true, variable: [2000 x [2000 x i64]]* @C)
!29 = !DICompositeType(tag: DW_TAG_array_type, baseType: !30, size: 256000000, align: 64, elements: !26)
!30 = !DIBasicType(name: "long long int", size: 64, align: 64, encoding: DW_ATE_signed)
!31 = !{i32 2, !"Dwarf Version", i32 4}
!32 = !{i32 2, !"Debug Info Version", i32 3}
!33 = !{!"clang version 3.9.0 (http://llvm.org/git/clang.git e177b4a63ca92c5fec010986944530688e104074) (http://llvm.org/git/llvm.git fcd97ccb03712372fe95f1732638de5ed3fcabe8)"}
!34 = !DILocation(line: 16, column: 16, scope: !8)
!35 = !DILocation(line: 16, column: 7, scope: !8)
!36 = !{!37, !37, i64 0}
!37 = !{!"any pointer", !38, i64 0}
!38 = !{!"omnipotent char", !39, i64 0}
!39 = !{!"Simple C/C++ TBAA"}
!40 = !DILocation(line: 17, column: 18, scope: !8)
!41 = !DILocation(line: 17, column: 5, scope: !8)
!42 = !DILocation(line: 17, column: 10, scope: !8)
!43 = !DIExpression()
!44 = !DILocation(line: 15, column: 9, scope: !8)
!45 = !DILocation(line: 19, column: 5, scope: !46)
!46 = !DILexicalBlockFile(scope: !47, file: !1, discriminator: 1)
!47 = distinct !DILexicalBlock(scope: !48, file: !1, line: 19, column: 5)
!48 = distinct !DILexicalBlock(scope: !8, file: !1, line: 19, column: 5)
!49 = !DILocation(line: 20, column: 18, scope: !50)
!50 = distinct !DILexicalBlock(scope: !47, file: !1, line: 19, column: 21)
!51 = !DILocation(line: 20, column: 17, scope: !50)
!52 = !DILocation(line: 20, column: 23, scope: !50)
!53 = !DILocation(line: 20, column: 20, scope: !50)
!54 = !DILocation(line: 20, column: 9, scope: !50)
!55 = !DILocation(line: 20, column: 14, scope: !50)
!56 = !DILocation(line: 32, column: 23, scope: !57)
!57 = distinct !DILexicalBlock(scope: !58, file: !1, line: 31, column: 29)
!58 = distinct !DILexicalBlock(scope: !59, file: !1, line: 31, column: 9)
!59 = distinct !DILexicalBlock(scope: !60, file: !1, line: 31, column: 9)
!60 = distinct !DILexicalBlock(scope: !61, file: !1, line: 30, column: 25)
!61 = distinct !DILexicalBlock(scope: !62, file: !1, line: 30, column: 5)
!62 = distinct !DILexicalBlock(scope: !8, file: !1, line: 30, column: 5)
!63 = !DILocation(line: 24, column: 9, scope: !64)
!64 = !DILexicalBlockFile(scope: !65, file: !1, discriminator: 1)
!65 = distinct !DILexicalBlock(scope: !66, file: !1, line: 24, column: 9)
!66 = distinct !DILexicalBlock(scope: !67, file: !1, line: 24, column: 9)
!67 = distinct !DILexicalBlock(scope: !68, file: !1, line: 23, column: 25)
!68 = distinct !DILexicalBlock(scope: !69, file: !1, line: 23, column: 5)
!69 = distinct !DILexicalBlock(scope: !8, file: !1, line: 23, column: 5)
!70 = !DILocation(line: 25, column: 13, scope: !71)
!71 = distinct !DILexicalBlock(scope: !65, file: !1, line: 24, column: 29)
!72 = !DILocation(line: 25, column: 21, scope: !71)
!73 = !{!74, !74, i64 0}
!74 = !{!"int", !38, i64 0}
!75 = !DILocation(line: 26, column: 13, scope: !71)
!76 = !DILocation(line: 26, column: 21, scope: !71)
!77 = distinct !{!77, !78, !79}
!78 = !{!"llvm.loop.vectorize.width", i32 1}
!79 = !{!"llvm.loop.interleave.count", i32 1}
!80 = distinct !{!80, !78, !79}
!81 = !DILocation(line: 23, column: 5, scope: !82)
!82 = !DILexicalBlockFile(scope: !68, file: !1, discriminator: 1)
!83 = !DILocation(line: 32, column: 31, scope: !57)
!84 = !DILocation(line: 31, column: 9, scope: !85)
!85 = !DILexicalBlockFile(scope: !58, file: !1, discriminator: 1)
!86 = !DILocation(line: 32, column: 21, scope: !57)
!87 = !DILocation(line: 33, column: 23, scope: !57)
!88 = !DILocation(line: 33, column: 31, scope: !57)
!89 = !DILocation(line: 33, column: 21, scope: !57)
!90 = distinct !{!90, !78, !79}
!91 = distinct !{!91, !78, !79}
!92 = !DILocation(line: 30, column: 5, scope: !93)
!93 = !DILexicalBlockFile(scope: !61, file: !1, discriminator: 1)
!94 = !DILocation(line: 36, column: 1, scope: !8)
!95 = !DILocation(line: 39, column: 9, scope: !14)
!96 = !DILocation(line: 44, column: 37, scope: !97)
!97 = distinct !DILexicalBlock(scope: !98, file: !1, line: 43, column: 13)
!98 = distinct !DILexicalBlock(scope: !99, file: !1, line: 43, column: 13)
!99 = distinct !DILexicalBlock(scope: !100, file: !1, line: 41, column: 29)
!100 = distinct !DILexicalBlock(scope: !101, file: !1, line: 41, column: 9)
!101 = distinct !DILexicalBlock(scope: !102, file: !1, line: 41, column: 9)
!102 = distinct !DILexicalBlock(scope: !103, file: !1, line: 40, column: 25)
!103 = distinct !DILexicalBlock(scope: !104, file: !1, line: 40, column: 5)
!104 = distinct !DILexicalBlock(scope: !14, file: !1, line: 40, column: 5)
!105 = !DILocation(line: 40, column: 5, scope: !106)
!106 = !DILexicalBlockFile(scope: !103, file: !1, discriminator: 1)
!107 = !DILocation(line: 41, column: 9, scope: !108)
!108 = !DILexicalBlockFile(scope: !100, file: !1, discriminator: 1)
!109 = !DILocation(line: 42, column: 13, scope: !99)
!110 = !DILocation(line: 42, column: 21, scope: !99)
!111 = !{!112, !112, i64 0}
!112 = !{!"long long", !38, i64 0}
!113 = !DILocation(line: 39, column: 15, scope: !14)
!114 = !DILocation(line: 43, column: 13, scope: !115)
!115 = !DILexicalBlockFile(scope: !97, file: !1, discriminator: 1)
!116 = !DILocation(line: 44, column: 27, scope: !97)
!117 = !DILocation(line: 44, column: 47, scope: !97)
!118 = !DILocation(line: 44, column: 45, scope: !97)
!119 = !DILocation(line: 44, column: 35, scope: !97)
!120 = !DILocation(line: 47, column: 1, scope: !14)
!121 = !DILocation(line: 64, column: 5, scope: !19)
!122 = !DILocation(line: 65, column: 5, scope: !19)
!123 = !DILocation(line: 68, column: 5, scope: !19)
!124 = !DILocation(line: 70, column: 19, scope: !19)
!125 = !DILocation(line: 71, column: 19, scope: !19)
!126 = !DILocation(line: 72, column: 19, scope: !19)
!127 = !DILocation(line: 69, column: 5, scope: !19)
!128 = !DILocation(line: 73, column: 5, scope: !19)
