; ModuleID = 'MatrixAdd.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@R = common global [8000 x [8000 x i32]] zeroinitializer, align 16
@A = common global [8000 x [8000 x i32]] zeroinitializer, align 16
@B = common global [8000 x [8000 x i32]] zeroinitializer, align 16
@C = common global [8000 x [8000 x i32]] zeroinitializer, align 16
@.str = private unnamed_addr constant [32 x i8] c"Pass %d X %d matrix test case \0A\00", align 1
@.str.1 = private unnamed_addr constant [47 x i8] c"A[%d][%d] = %d, B[%d][%d] =%d, C[%d][%d] =%d \0A\00", align 1

; Function Attrs: nounwind uwtable
define void @init() #0 !dbg !6 {
entry:
  %t = alloca i64, align 8
  %0 = bitcast i64* %t to i8*, !dbg !42
  call void @llvm.lifetime.start(i64 8, i8* %0) #5, !dbg !42
  tail call void @llvm.dbg.value(metadata i64* %t, i64 0, metadata !13, metadata !43), !dbg !44
  %call = call i64 @time(i64* nonnull %t) #5, !dbg !45
  %conv = trunc i64 %call to i32, !dbg !46
  call void @srand(i32 %conv) #5, !dbg !47
  call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !10, metadata !49), !dbg !50
  br label %for.cond2.preheader, !dbg !51

for.cond2.preheader:                              ; preds = %for.inc9, %entry
  %indvars.iv70 = phi i64 [ 0, %entry ], [ %indvars.iv.next71, %for.inc9 ]
  br label %for.body5, !dbg !55

for.body5:                                        ; preds = %for.body5, %for.cond2.preheader
  %indvars.iv67 = phi i64 [ 0, %for.cond2.preheader ], [ %indvars.iv.next68, %for.body5 ]
  %call6 = call i32 @rand() #5, !dbg !60
  %rem = srem i32 %call6, 100, !dbg !62
  %arrayidx8 = getelementptr inbounds [8000 x [8000 x i32]], [8000 x [8000 x i32]]* @R, i64 0, i64 %indvars.iv70, i64 %indvars.iv67, !dbg !63
  store i32 %rem, i32* %arrayidx8, align 4, !dbg !64, !tbaa !65
  %indvars.iv.next68 = add nuw nsw i64 %indvars.iv67, 1, !dbg !55
  %exitcond69 = icmp eq i64 %indvars.iv.next68, 8000, !dbg !55
  br i1 %exitcond69, label %for.inc9, label %for.body5, !dbg !55

for.inc9:                                         ; preds = %for.body5
  %indvars.iv.next71 = add nuw nsw i64 %indvars.iv70, 1, !dbg !51
  %exitcond72 = icmp eq i64 %indvars.iv.next71, 8000, !dbg !51
  br i1 %exitcond72, label %polly.loop_preheader74.preheader, label %for.cond2.preheader, !dbg !51

polly.loop_preheader74.preheader:                 ; preds = %for.inc9
  br label %polly.loop_preheader74

polly.exiting:                                    ; preds = %polly.loop_exit75
  call void @llvm.lifetime.end(i64 8, i8* %0) #5, !dbg !69
  ret void, !dbg !69

polly.loop_exit75:                                ; preds = %polly.loop_exit81
  %polly.indvar_next = add nuw nsw i64 %polly.indvar, 1
  %exitcond99 = icmp eq i64 %polly.indvar_next, 250
  br i1 %exitcond99, label %polly.exiting, label %polly.loop_preheader74

polly.loop_exit81:                                ; preds = %polly.loop_exit87
  %polly.indvar_next77 = add nuw nsw i64 %polly.indvar76, 1
  %exitcond98 = icmp eq i64 %polly.indvar_next77, 250
  br i1 %exitcond98, label %polly.loop_exit75, label %polly.loop_preheader80

polly.loop_preheader74:                           ; preds = %polly.loop_preheader74.preheader, %polly.loop_exit75
  %polly.indvar = phi i64 [ %polly.indvar_next, %polly.loop_exit75 ], [ 0, %polly.loop_preheader74.preheader ]
  %1 = shl i64 %polly.indvar, 5
  br label %polly.loop_preheader80

polly.loop_exit87:                                ; preds = %polly.loop_header85
  %polly.indvar_next83 = add nuw nsw i64 %polly.indvar82, 1
  %exitcond97 = icmp eq i64 %polly.indvar_next83, 32
  br i1 %exitcond97, label %polly.loop_exit81, label %polly.loop_preheader86

polly.loop_preheader80:                           ; preds = %polly.loop_exit81, %polly.loop_preheader74
  %polly.indvar76 = phi i64 [ 0, %polly.loop_preheader74 ], [ %polly.indvar_next77, %polly.loop_exit81 ]
  %2 = shl i64 %polly.indvar76, 5
  br label %polly.loop_preheader86

polly.loop_header85:                              ; preds = %polly.loop_header85, %polly.loop_preheader86
  %polly.indvar88 = phi i64 [ 0, %polly.loop_preheader86 ], [ %polly.indvar_next89.1, %polly.loop_header85 ]
  %3 = add nuw nsw i64 %polly.indvar88, %2
  %scevgep = getelementptr [8000 x [8000 x i32]], [8000 x [8000 x i32]]* @R, i64 0, i64 %5, i64 %3
  %_p_scalar_ = load i32, i32* %scevgep, align 8, !alias.scope !70, !noalias !72
  %p_sub = sub nsw i32 100, %_p_scalar_, !dbg !75
  %scevgep92 = getelementptr [8000 x [8000 x i32]], [8000 x [8000 x i32]]* @B, i64 0, i64 %5, i64 %3
  store i32 %p_sub, i32* %scevgep92, align 8, !alias.scope !73, !noalias !82
  %polly.indvar_next89 = or i64 %polly.indvar88, 1
  %4 = add nuw nsw i64 %polly.indvar_next89, %2
  %scevgep.1 = getelementptr [8000 x [8000 x i32]], [8000 x [8000 x i32]]* @R, i64 0, i64 %5, i64 %4
  %_p_scalar_.1 = load i32, i32* %scevgep.1, align 4, !alias.scope !70, !noalias !72
  %p_sub.1 = sub nsw i32 100, %_p_scalar_.1, !dbg !75
  %scevgep92.1 = getelementptr [8000 x [8000 x i32]], [8000 x [8000 x i32]]* @B, i64 0, i64 %5, i64 %4
  store i32 %p_sub.1, i32* %scevgep92.1, align 4, !alias.scope !73, !noalias !82
  %polly.indvar_next89.1 = add nsw i64 %polly.indvar88, 2
  %exitcond.1 = icmp eq i64 %polly.indvar_next89.1, 32
  br i1 %exitcond.1, label %polly.loop_exit87, label %polly.loop_header85

polly.loop_preheader86:                           ; preds = %polly.loop_exit87, %polly.loop_preheader80
  %polly.indvar82 = phi i64 [ 0, %polly.loop_preheader80 ], [ %polly.indvar_next83, %polly.loop_exit87 ]
  %5 = add nuw nsw i64 %1, %polly.indvar82
  %scevgep93 = getelementptr [8000 x [8000 x i32]], [8000 x [8000 x i32]]* @A, i64 0, i64 %5, i64 %2
  %scevgep9394 = bitcast i32* %scevgep93 to i8*
  %scevgep95 = getelementptr [8000 x [8000 x i32]], [8000 x [8000 x i32]]* @R, i64 0, i64 %5, i64 %2
  %scevgep9596 = bitcast i32* %scevgep95 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %scevgep9394, i8* %scevgep9596, i64 128, i32 16, i1 false)
  br label %polly.loop_header85
}

; Function Attrs: argmemonly nounwind
declare void @llvm.lifetime.start(i64, i8* nocapture) #1

; Function Attrs: nounwind
declare void @srand(i32) #2

; Function Attrs: nounwind
declare i64 @time(i64*) #2

; Function Attrs: nounwind
declare i32 @rand() #2

; Function Attrs: argmemonly nounwind
declare void @llvm.lifetime.end(i64, i8* nocapture) #1

; Function Attrs: nounwind uwtable
define void @mat_add() #0 !dbg !19 {
entry:
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !21, metadata !49), !dbg !83
  br label %polly.loop_preheader34

polly.exiting:                                    ; preds = %polly.loop_exit35
  ret void, !dbg !84

polly.loop_exit35:                                ; preds = %polly.loop_exit41
  %polly.indvar_next = add nuw nsw i64 %polly.indvar, 1
  %exitcond56 = icmp eq i64 %polly.indvar_next, 250
  br i1 %exitcond56, label %polly.exiting, label %polly.loop_preheader34

polly.loop_exit41:                                ; preds = %polly.loop_exit47
  %polly.indvar_next37 = add nuw nsw i64 %polly.indvar36, 1
  %exitcond55 = icmp eq i64 %polly.indvar_next37, 250
  br i1 %exitcond55, label %polly.loop_exit35, label %polly.loop_preheader40

polly.loop_preheader34:                           ; preds = %polly.loop_exit35, %entry
  %polly.indvar = phi i64 [ 0, %entry ], [ %polly.indvar_next, %polly.loop_exit35 ]
  %0 = shl nsw i64 %polly.indvar, 5
  br label %polly.loop_preheader40

polly.loop_exit47:                                ; preds = %polly.loop_header45
  %polly.indvar_next43 = add nuw nsw i64 %polly.indvar42, 1
  %exitcond54 = icmp eq i64 %polly.indvar_next43, 32
  br i1 %exitcond54, label %polly.loop_exit41, label %polly.loop_preheader46

polly.loop_preheader40:                           ; preds = %polly.loop_exit41, %polly.loop_preheader34
  %polly.indvar36 = phi i64 [ 0, %polly.loop_preheader34 ], [ %polly.indvar_next37, %polly.loop_exit41 ]
  %1 = shl nsw i64 %polly.indvar36, 5
  br label %polly.loop_preheader46

polly.loop_header45:                              ; preds = %polly.loop_header45, %polly.loop_preheader46
  %polly.indvar48 = phi i64 [ 0, %polly.loop_preheader46 ], [ %polly.indvar_next49.1, %polly.loop_header45 ]
  %2 = add nuw nsw i64 %polly.indvar48, %1
  %scevgep = getelementptr [8000 x [8000 x i32]], [8000 x [8000 x i32]]* @A, i64 0, i64 %4, i64 %2
  %_p_scalar_ = load i32, i32* %scevgep, align 8, !alias.scope !85, !noalias !87
  %scevgep51 = getelementptr [8000 x [8000 x i32]], [8000 x [8000 x i32]]* @B, i64 0, i64 %4, i64 %2
  %_p_scalar_52 = load i32, i32* %scevgep51, align 8, !alias.scope !88, !noalias !90
  %p_add = add nsw i32 %_p_scalar_52, %_p_scalar_, !dbg !91
  %scevgep53 = getelementptr [8000 x [8000 x i32]], [8000 x [8000 x i32]]* @C, i64 0, i64 %4, i64 %2
  store i32 %p_add, i32* %scevgep53, align 8, !alias.scope !89, !noalias !98
  %polly.indvar_next49 = or i64 %polly.indvar48, 1
  %3 = add nuw nsw i64 %polly.indvar_next49, %1
  %scevgep.1 = getelementptr [8000 x [8000 x i32]], [8000 x [8000 x i32]]* @A, i64 0, i64 %4, i64 %3
  %_p_scalar_.1 = load i32, i32* %scevgep.1, align 4, !alias.scope !85, !noalias !87
  %scevgep51.1 = getelementptr [8000 x [8000 x i32]], [8000 x [8000 x i32]]* @B, i64 0, i64 %4, i64 %3
  %_p_scalar_52.1 = load i32, i32* %scevgep51.1, align 4, !alias.scope !88, !noalias !90
  %p_add.1 = add nsw i32 %_p_scalar_52.1, %_p_scalar_.1, !dbg !91
  %scevgep53.1 = getelementptr [8000 x [8000 x i32]], [8000 x [8000 x i32]]* @C, i64 0, i64 %4, i64 %3
  store i32 %p_add.1, i32* %scevgep53.1, align 4, !alias.scope !89, !noalias !98
  %polly.indvar_next49.1 = add nsw i64 %polly.indvar48, 2
  %exitcond.1 = icmp eq i64 %polly.indvar_next49.1, 32
  br i1 %exitcond.1, label %polly.loop_exit47, label %polly.loop_header45

polly.loop_preheader46:                           ; preds = %polly.loop_exit47, %polly.loop_preheader40
  %polly.indvar42 = phi i64 [ 0, %polly.loop_preheader40 ], [ %polly.indvar_next43, %polly.loop_exit47 ]
  %4 = add nuw nsw i64 %polly.indvar42, %0
  br label %polly.loop_header45
}

; Function Attrs: nounwind uwtable
define i32 @main() #3 !dbg !24 {
entry:
  %t.i = alloca i64, align 8
  %0 = bitcast i64* %t.i to i8*, !dbg !99
  call void @llvm.lifetime.start(i64 8, i8* %0) #5, !dbg !99
  tail call void @llvm.dbg.value(metadata i64* %t.i, i64 0, metadata !13, metadata !43) #5, !dbg !101
  %call.i = call i64 @time(i64* nonnull %t.i) #5, !dbg !102
  %conv.i = trunc i64 %call.i to i32, !dbg !103
  call void @srand(i32 %conv.i) #5, !dbg !104
  call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !10, metadata !49) #5, !dbg !105
  br label %for.cond2.preheader.i, !dbg !106

for.cond2.preheader.i:                            ; preds = %for.inc9.i, %entry
  %indvars.iv70.i = phi i64 [ 0, %entry ], [ %indvars.iv.next71.i, %for.inc9.i ], !dbg !107
  br label %for.body5.i, !dbg !108

for.body5.i:                                      ; preds = %for.body5.i, %for.cond2.preheader.i
  %indvars.iv67.i = phi i64 [ 0, %for.cond2.preheader.i ], [ %indvars.iv.next68.i, %for.body5.i ], !dbg !107
  %call6.i = call i32 @rand() #5, !dbg !109
  %rem.i = srem i32 %call6.i, 100, !dbg !110
  %arrayidx8.i = getelementptr inbounds [8000 x [8000 x i32]], [8000 x [8000 x i32]]* @R, i64 0, i64 %indvars.iv70.i, i64 %indvars.iv67.i, !dbg !111
  store i32 %rem.i, i32* %arrayidx8.i, align 4, !dbg !112, !tbaa !65
  %indvars.iv.next68.i = add nuw nsw i64 %indvars.iv67.i, 1, !dbg !108
  %exitcond69.i = icmp eq i64 %indvars.iv.next68.i, 8000, !dbg !108
  br i1 %exitcond69.i, label %for.inc9.i, label %for.body5.i, !dbg !108

for.inc9.i:                                       ; preds = %for.body5.i
  %indvars.iv.next71.i = add nuw nsw i64 %indvars.iv70.i, 1, !dbg !106
  %exitcond72.i = icmp eq i64 %indvars.iv.next71.i, 8000, !dbg !106
  br i1 %exitcond72.i, label %polly.loop_preheader74.i.preheader, label %for.cond2.preheader.i, !dbg !106

polly.loop_preheader74.i.preheader:               ; preds = %for.inc9.i
  br label %polly.loop_preheader74.i, !dbg !107

polly.loop_exit75.i:                              ; preds = %polly.loop_exit81.i
  %polly.indvar_next.i = add nuw nsw i64 %polly.indvar.i, 1, !dbg !107
  %exitcond99.i = icmp eq i64 %polly.indvar_next.i, 250, !dbg !107
  br i1 %exitcond99.i, label %init.exit, label %polly.loop_preheader74.i, !dbg !107

polly.loop_exit81.i:                              ; preds = %polly.loop_exit87.i
  %polly.indvar_next77.i = add nuw nsw i64 %polly.indvar76.i, 1, !dbg !107
  %exitcond98.i = icmp eq i64 %polly.indvar_next77.i, 250, !dbg !107
  br i1 %exitcond98.i, label %polly.loop_exit75.i, label %polly.loop_preheader80.i, !dbg !107

polly.loop_preheader74.i:                         ; preds = %polly.loop_preheader74.i.preheader, %polly.loop_exit75.i
  %polly.indvar.i = phi i64 [ %polly.indvar_next.i, %polly.loop_exit75.i ], [ 0, %polly.loop_preheader74.i.preheader ], !dbg !107
  %1 = shl i64 %polly.indvar.i, 5, !dbg !107
  br label %polly.loop_preheader80.i, !dbg !107

polly.loop_exit87.i:                              ; preds = %polly.loop_header85.i
  %polly.indvar_next83.i = add nuw nsw i64 %polly.indvar82.i, 1, !dbg !107
  %exitcond97.i = icmp eq i64 %polly.indvar_next83.i, 32, !dbg !107
  br i1 %exitcond97.i, label %polly.loop_exit81.i, label %polly.loop_preheader86.i, !dbg !107

polly.loop_preheader80.i:                         ; preds = %polly.loop_preheader74.i, %polly.loop_exit81.i
  %polly.indvar76.i = phi i64 [ 0, %polly.loop_preheader74.i ], [ %polly.indvar_next77.i, %polly.loop_exit81.i ], !dbg !107
  %2 = shl i64 %polly.indvar76.i, 5, !dbg !107
  br label %polly.loop_preheader86.i, !dbg !107

polly.loop_header85.i:                            ; preds = %polly.loop_header85.i, %polly.loop_preheader86.i
  %polly.indvar88.i = phi i64 [ 0, %polly.loop_preheader86.i ], [ %polly.indvar_next89.i.1, %polly.loop_header85.i ], !dbg !107
  %3 = add nuw nsw i64 %polly.indvar88.i, %2, !dbg !107
  %scevgep.i = getelementptr [8000 x [8000 x i32]], [8000 x [8000 x i32]]* @R, i64 0, i64 %5, i64 %3, !dbg !107
  %_p_scalar_.i = load i32, i32* %scevgep.i, align 8, !dbg !107, !alias.scope !113, !noalias !115
  %p_sub.i = sub nsw i32 100, %_p_scalar_.i, !dbg !118
  %scevgep92.i = getelementptr [8000 x [8000 x i32]], [8000 x [8000 x i32]]* @B, i64 0, i64 %5, i64 %3, !dbg !107
  store i32 %p_sub.i, i32* %scevgep92.i, align 8, !dbg !107, !alias.scope !116, !noalias !119
  %polly.indvar_next89.i = or i64 %polly.indvar88.i, 1, !dbg !107
  %4 = add nuw nsw i64 %polly.indvar_next89.i, %2, !dbg !107
  %scevgep.i.1 = getelementptr [8000 x [8000 x i32]], [8000 x [8000 x i32]]* @R, i64 0, i64 %5, i64 %4, !dbg !107
  %_p_scalar_.i.1 = load i32, i32* %scevgep.i.1, align 4, !dbg !107, !alias.scope !113, !noalias !115
  %p_sub.i.1 = sub nsw i32 100, %_p_scalar_.i.1, !dbg !118
  %scevgep92.i.1 = getelementptr [8000 x [8000 x i32]], [8000 x [8000 x i32]]* @B, i64 0, i64 %5, i64 %4, !dbg !107
  store i32 %p_sub.i.1, i32* %scevgep92.i.1, align 4, !dbg !107, !alias.scope !116, !noalias !119
  %polly.indvar_next89.i.1 = add nsw i64 %polly.indvar88.i, 2, !dbg !107
  %exitcond.i.1 = icmp eq i64 %polly.indvar_next89.i.1, 32, !dbg !107
  br i1 %exitcond.i.1, label %polly.loop_exit87.i, label %polly.loop_header85.i, !dbg !107

polly.loop_preheader86.i:                         ; preds = %polly.loop_preheader80.i, %polly.loop_exit87.i
  %polly.indvar82.i = phi i64 [ 0, %polly.loop_preheader80.i ], [ %polly.indvar_next83.i, %polly.loop_exit87.i ], !dbg !107
  %5 = add nuw nsw i64 %polly.indvar82.i, %1, !dbg !107
  %scevgep93.i = getelementptr [8000 x [8000 x i32]], [8000 x [8000 x i32]]* @A, i64 0, i64 %5, i64 %2, !dbg !107
  %scevgep9394.i = bitcast i32* %scevgep93.i to i8*, !dbg !107
  %scevgep95.i = getelementptr [8000 x [8000 x i32]], [8000 x [8000 x i32]]* @R, i64 0, i64 %5, i64 %2, !dbg !107
  %scevgep9596.i = bitcast i32* %scevgep95.i to i8*, !dbg !107
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %scevgep9394.i, i8* %scevgep9596.i, i64 128, i32 16, i1 false) #5, !dbg !107
  br label %polly.loop_header85.i, !dbg !107

init.exit:                                        ; preds = %polly.loop_exit75.i
  call void @llvm.lifetime.end(i64 8, i8* %0) #5, !dbg !120
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !21, metadata !49), !dbg !121
  br label %polly.loop_preheader34.i, !dbg !123

polly.loop_exit35.i:                              ; preds = %polly.loop_exit41.i
  %polly.indvar_next.i5 = add nuw nsw i64 %polly.indvar.i6, 1, !dbg !123
  %exitcond56.i = icmp eq i64 %polly.indvar_next.i5, 250, !dbg !123
  br i1 %exitcond56.i, label %mat_add.exit, label %polly.loop_preheader34.i, !dbg !123

polly.loop_exit41.i:                              ; preds = %polly.loop_exit47.i
  %polly.indvar_next37.i = add nuw nsw i64 %polly.indvar36.i, 1, !dbg !123
  %exitcond55.i = icmp eq i64 %polly.indvar_next37.i, 250, !dbg !123
  br i1 %exitcond55.i, label %polly.loop_exit35.i, label %polly.loop_preheader40.i, !dbg !123

polly.loop_preheader34.i:                         ; preds = %polly.loop_exit35.i, %init.exit
  %polly.indvar.i6 = phi i64 [ 0, %init.exit ], [ %polly.indvar_next.i5, %polly.loop_exit35.i ], !dbg !123
  %6 = shl nsw i64 %polly.indvar.i6, 5, !dbg !123
  br label %polly.loop_preheader40.i, !dbg !123

polly.loop_exit47.i:                              ; preds = %polly.loop_header45.i
  %polly.indvar_next43.i = add nuw nsw i64 %polly.indvar42.i, 1, !dbg !123
  %exitcond54.i = icmp eq i64 %polly.indvar_next43.i, 32, !dbg !123
  br i1 %exitcond54.i, label %polly.loop_exit41.i, label %polly.loop_preheader46.i, !dbg !123

polly.loop_preheader40.i:                         ; preds = %polly.loop_preheader34.i, %polly.loop_exit41.i
  %polly.indvar36.i = phi i64 [ 0, %polly.loop_preheader34.i ], [ %polly.indvar_next37.i, %polly.loop_exit41.i ], !dbg !123
  %7 = shl nsw i64 %polly.indvar36.i, 5, !dbg !123
  br label %polly.loop_preheader46.i, !dbg !123

polly.loop_header45.i:                            ; preds = %polly.loop_header45.i, %polly.loop_preheader46.i
  %polly.indvar48.i = phi i64 [ 0, %polly.loop_preheader46.i ], [ %polly.indvar_next49.i.1, %polly.loop_header45.i ], !dbg !123
  %8 = add nuw nsw i64 %polly.indvar48.i, %7, !dbg !123
  %scevgep.i7 = getelementptr [8000 x [8000 x i32]], [8000 x [8000 x i32]]* @A, i64 0, i64 %10, i64 %8, !dbg !123
  %_p_scalar_.i8 = load i32, i32* %scevgep.i7, align 8, !dbg !123, !alias.scope !124, !noalias !126
  %scevgep51.i = getelementptr [8000 x [8000 x i32]], [8000 x [8000 x i32]]* @B, i64 0, i64 %10, i64 %8, !dbg !123
  %_p_scalar_52.i = load i32, i32* %scevgep51.i, align 8, !dbg !123, !alias.scope !127, !noalias !129
  %p_add.i = add nsw i32 %_p_scalar_52.i, %_p_scalar_.i8, !dbg !130
  %scevgep53.i = getelementptr [8000 x [8000 x i32]], [8000 x [8000 x i32]]* @C, i64 0, i64 %10, i64 %8, !dbg !123
  store i32 %p_add.i, i32* %scevgep53.i, align 8, !dbg !123, !alias.scope !128, !noalias !131
  %polly.indvar_next49.i = or i64 %polly.indvar48.i, 1, !dbg !123
  %9 = add nuw nsw i64 %polly.indvar_next49.i, %7, !dbg !123
  %scevgep.i7.1 = getelementptr [8000 x [8000 x i32]], [8000 x [8000 x i32]]* @A, i64 0, i64 %10, i64 %9, !dbg !123
  %_p_scalar_.i8.1 = load i32, i32* %scevgep.i7.1, align 4, !dbg !123, !alias.scope !124, !noalias !126
  %scevgep51.i.1 = getelementptr [8000 x [8000 x i32]], [8000 x [8000 x i32]]* @B, i64 0, i64 %10, i64 %9, !dbg !123
  %_p_scalar_52.i.1 = load i32, i32* %scevgep51.i.1, align 4, !dbg !123, !alias.scope !127, !noalias !129
  %p_add.i.1 = add nsw i32 %_p_scalar_52.i.1, %_p_scalar_.i8.1, !dbg !130
  %scevgep53.i.1 = getelementptr [8000 x [8000 x i32]], [8000 x [8000 x i32]]* @C, i64 0, i64 %10, i64 %9, !dbg !123
  store i32 %p_add.i.1, i32* %scevgep53.i.1, align 4, !dbg !123, !alias.scope !128, !noalias !131
  %polly.indvar_next49.i.1 = add nsw i64 %polly.indvar48.i, 2, !dbg !123
  %exitcond.i9.1 = icmp eq i64 %polly.indvar_next49.i.1, 32, !dbg !123
  br i1 %exitcond.i9.1, label %polly.loop_exit47.i, label %polly.loop_header45.i, !dbg !123

polly.loop_preheader46.i:                         ; preds = %polly.loop_preheader40.i, %polly.loop_exit47.i
  %polly.indvar42.i = phi i64 [ 0, %polly.loop_preheader40.i ], [ %polly.indvar_next43.i, %polly.loop_exit47.i ], !dbg !123
  %10 = add nuw nsw i64 %polly.indvar42.i, %6, !dbg !123
  br label %polly.loop_header45.i, !dbg !123

mat_add.exit:                                     ; preds = %polly.loop_exit35.i
  %call = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i64 0, i64 0), i32 8000, i32 8000), !dbg !132
  %11 = load i32, i32* getelementptr inbounds ([8000 x [8000 x i32]], [8000 x [8000 x i32]]* @A, i64 0, i64 7999, i64 7999), align 4, !dbg !133, !tbaa !65
  %12 = load i32, i32* getelementptr inbounds ([8000 x [8000 x i32]], [8000 x [8000 x i32]]* @B, i64 0, i64 7999, i64 7999), align 4, !dbg !134, !tbaa !65
  %13 = load i32, i32* getelementptr inbounds ([8000 x [8000 x i32]], [8000 x [8000 x i32]]* @C, i64 0, i64 7999, i64 7999), align 4, !dbg !135, !tbaa !65
  %call1 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([47 x i8], [47 x i8]* @.str.1, i64 0, i64 0), i32 7999, i32 7999, i32 %11, i32 7999, i32 7999, i32 %12, i32 7999, i32 7999, i32 %13), !dbg !136
  ret i32 0, !dbg !137
}

; Function Attrs: nounwind
declare i32 @printf(i8* nocapture readonly, ...) #2

; Function Attrs: nounwind readnone
declare void @llvm.dbg.value(metadata, i64, metadata, metadata) #4

; Function Attrs: argmemonly nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture readonly, i64, i32, i1) #1

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "polly-optimized" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { argmemonly nounwind }
attributes #2 = { nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind readnone }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!39, !40}
!llvm.ident = !{!41}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 3.9.0 (http://llvm.org/git/clang.git e177b4a63ca92c5fec010986944530688e104074) (http://llvm.org/git/llvm.git fcd97ccb03712372fe95f1732638de5ed3fcabe8)", isOptimized: true, runtimeVersion: 0, emissionKind: 1, enums: !2, retainedTypes: !3, subprograms: !5, globals: !31)
!1 = !DIFile(filename: "MatrixAdd.c", directory: "/home/sam/workspace/WhileyOpenCL/polly/MatrixAdd/impl/handwritten")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, align: 32, encoding: DW_ATE_unsigned)
!5 = !{!6, !19, !24}
!6 = distinct !DISubprogram(name: "init", scope: !1, file: !1, line: 8, type: !7, isLocal: false, isDefinition: true, scopeLine: 9, isOptimized: true, variables: !9)
!7 = !DISubroutineType(types: !8)
!8 = !{null}
!9 = !{!10, !12, !13}
!10 = !DILocalVariable(name: "i", scope: !6, file: !1, line: 10, type: !11)
!11 = !DIBasicType(name: "int", size: 32, align: 32, encoding: DW_ATE_signed)
!12 = !DILocalVariable(name: "j", scope: !6, file: !1, line: 11, type: !11)
!13 = !DILocalVariable(name: "t", scope: !6, file: !1, line: 13, type: !14)
!14 = !DIDerivedType(tag: DW_TAG_typedef, name: "time_t", file: !15, line: 75, baseType: !16)
!15 = !DIFile(filename: "/usr/include/time.h", directory: "/home/sam/workspace/WhileyOpenCL/polly/MatrixAdd/impl/handwritten")
!16 = !DIDerivedType(tag: DW_TAG_typedef, name: "__time_t", file: !17, line: 139, baseType: !18)
!17 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types.h", directory: "/home/sam/workspace/WhileyOpenCL/polly/MatrixAdd/impl/handwritten")
!18 = !DIBasicType(name: "long int", size: 64, align: 64, encoding: DW_ATE_signed)
!19 = distinct !DISubprogram(name: "mat_add", scope: !1, file: !1, line: 31, type: !7, isLocal: false, isDefinition: true, scopeLine: 31, isOptimized: true, variables: !20)
!20 = !{!21, !22, !23}
!21 = !DILocalVariable(name: "i", scope: !19, file: !1, line: 32, type: !11)
!22 = !DILocalVariable(name: "j", scope: !19, file: !1, line: 32, type: !11)
!23 = !DILocalVariable(name: "k", scope: !19, file: !1, line: 32, type: !11)
!24 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 53, type: !25, isLocal: false, isDefinition: true, scopeLine: 54, isOptimized: true, variables: !27)
!25 = !DISubroutineType(types: !26)
!26 = !{!11}
!27 = !{!28, !29, !30}
!28 = !DILocalVariable(name: "i", scope: !24, file: !1, line: 55, type: !11)
!29 = !DILocalVariable(name: "j", scope: !24, file: !1, line: 55, type: !11)
!30 = !DILocalVariable(name: "k", scope: !24, file: !1, line: 55, type: !11)
!31 = !{!32, !36, !37, !38}
!32 = !DIGlobalVariable(name: "A", scope: !0, file: !1, line: 3, type: !33, isLocal: false, isDefinition: true, variable: [8000 x [8000 x i32]]* @A)
!33 = !DICompositeType(tag: DW_TAG_array_type, baseType: !11, size: 2048000000, align: 32, elements: !34)
!34 = !{!35, !35}
!35 = !DISubrange(count: 8000)
!36 = !DIGlobalVariable(name: "B", scope: !0, file: !1, line: 4, type: !33, isLocal: false, isDefinition: true, variable: [8000 x [8000 x i32]]* @B)
!37 = !DIGlobalVariable(name: "C", scope: !0, file: !1, line: 5, type: !33, isLocal: false, isDefinition: true, variable: [8000 x [8000 x i32]]* @C)
!38 = !DIGlobalVariable(name: "R", scope: !0, file: !1, line: 6, type: !33, isLocal: false, isDefinition: true, variable: [8000 x [8000 x i32]]* @R)
!39 = !{i32 2, !"Dwarf Version", i32 4}
!40 = !{i32 2, !"Debug Info Version", i32 3}
!41 = !{!"clang version 3.9.0 (http://llvm.org/git/clang.git e177b4a63ca92c5fec010986944530688e104074) (http://llvm.org/git/llvm.git fcd97ccb03712372fe95f1732638de5ed3fcabe8)"}
!42 = !DILocation(line: 13, column: 5, scope: !6)
!43 = !DIExpression(DW_OP_deref)
!44 = !DILocation(line: 13, column: 12, scope: !6)
!45 = !DILocation(line: 15, column: 22, scope: !6)
!46 = !DILocation(line: 15, column: 11, scope: !6)
!47 = !DILocation(line: 15, column: 5, scope: !48)
!48 = !DILexicalBlockFile(scope: !6, file: !1, discriminator: 1)
!49 = !DIExpression()
!50 = !DILocation(line: 10, column: 9, scope: !6)
!51 = !DILocation(line: 16, column: 5, scope: !52)
!52 = !DILexicalBlockFile(scope: !53, file: !1, discriminator: 1)
!53 = distinct !DILexicalBlock(scope: !54, file: !1, line: 16, column: 5)
!54 = distinct !DILexicalBlock(scope: !6, file: !1, line: 16, column: 5)
!55 = !DILocation(line: 17, column: 9, scope: !56)
!56 = !DILexicalBlockFile(scope: !57, file: !1, discriminator: 1)
!57 = distinct !DILexicalBlock(scope: !58, file: !1, line: 17, column: 9)
!58 = distinct !DILexicalBlock(scope: !59, file: !1, line: 17, column: 9)
!59 = distinct !DILexicalBlock(scope: !53, file: !1, line: 16, column: 25)
!60 = !DILocation(line: 19, column: 23, scope: !61)
!61 = distinct !DILexicalBlock(scope: !57, file: !1, line: 17, column: 29)
!62 = !DILocation(line: 19, column: 29, scope: !61)
!63 = !DILocation(line: 19, column: 13, scope: !61)
!64 = !DILocation(line: 19, column: 21, scope: !61)
!65 = !{!66, !66, i64 0}
!66 = !{!"int", !67, i64 0}
!67 = !{!"omnipotent char", !68, i64 0}
!68 = !{!"Simple C/C++ TBAA"}
!69 = !DILocation(line: 29, column: 1, scope: !6)
!70 = distinct !{!70, !71, !"polly.alias.scope.R"}
!71 = distinct !{!71, !"polly.alias.scope.domain"}
!72 = !{!73, !74}
!73 = distinct !{!73, !71, !"polly.alias.scope.B"}
!74 = distinct !{!74, !71, !"polly.alias.scope.A"}
!75 = !DILocation(line: 26, column: 27, scope: !76)
!76 = distinct !DILexicalBlock(scope: !77, file: !1, line: 24, column: 29)
!77 = distinct !DILexicalBlock(scope: !78, file: !1, line: 24, column: 9)
!78 = distinct !DILexicalBlock(scope: !79, file: !1, line: 24, column: 9)
!79 = distinct !DILexicalBlock(scope: !80, file: !1, line: 23, column: 25)
!80 = distinct !DILexicalBlock(scope: !81, file: !1, line: 23, column: 5)
!81 = distinct !DILexicalBlock(scope: !6, file: !1, line: 23, column: 5)
!82 = !{!70, !74}
!83 = !DILocation(line: 32, column: 9, scope: !19)
!84 = !DILocation(line: 38, column: 1, scope: !19)
!85 = distinct !{!85, !86, !"polly.alias.scope.A"}
!86 = distinct !{!86, !"polly.alias.scope.domain"}
!87 = !{!88, !89}
!88 = distinct !{!88, !86, !"polly.alias.scope.B"}
!89 = distinct !{!89, !86, !"polly.alias.scope.C"}
!90 = !{!89, !85}
!91 = !DILocation(line: 35, column: 31, scope: !92)
!92 = distinct !DILexicalBlock(scope: !93, file: !1, line: 34, column: 29)
!93 = distinct !DILexicalBlock(scope: !94, file: !1, line: 34, column: 9)
!94 = distinct !DILexicalBlock(scope: !95, file: !1, line: 34, column: 9)
!95 = distinct !DILexicalBlock(scope: !96, file: !1, line: 33, column: 25)
!96 = distinct !DILexicalBlock(scope: !97, file: !1, line: 33, column: 5)
!97 = distinct !DILexicalBlock(scope: !19, file: !1, line: 33, column: 5)
!98 = !{!88, !85}
!99 = !DILocation(line: 13, column: 5, scope: !6, inlinedAt: !100)
!100 = distinct !DILocation(line: 57, column: 5, scope: !24)
!101 = !DILocation(line: 13, column: 12, scope: !6, inlinedAt: !100)
!102 = !DILocation(line: 15, column: 22, scope: !6, inlinedAt: !100)
!103 = !DILocation(line: 15, column: 11, scope: !6, inlinedAt: !100)
!104 = !DILocation(line: 15, column: 5, scope: !48, inlinedAt: !100)
!105 = !DILocation(line: 10, column: 9, scope: !6, inlinedAt: !100)
!106 = !DILocation(line: 16, column: 5, scope: !52, inlinedAt: !100)
!107 = !DILocation(line: 57, column: 5, scope: !24)
!108 = !DILocation(line: 17, column: 9, scope: !56, inlinedAt: !100)
!109 = !DILocation(line: 19, column: 23, scope: !61, inlinedAt: !100)
!110 = !DILocation(line: 19, column: 29, scope: !61, inlinedAt: !100)
!111 = !DILocation(line: 19, column: 13, scope: !61, inlinedAt: !100)
!112 = !DILocation(line: 19, column: 21, scope: !61, inlinedAt: !100)
!113 = distinct !{!113, !114, !"polly.alias.scope.R"}
!114 = distinct !{!114, !"polly.alias.scope.domain"}
!115 = !{!116, !117}
!116 = distinct !{!116, !114, !"polly.alias.scope.B"}
!117 = distinct !{!117, !114, !"polly.alias.scope.A"}
!118 = !DILocation(line: 26, column: 27, scope: !76, inlinedAt: !100)
!119 = !{!113, !117}
!120 = !DILocation(line: 29, column: 1, scope: !6, inlinedAt: !100)
!121 = !DILocation(line: 32, column: 9, scope: !19, inlinedAt: !122)
!122 = distinct !DILocation(line: 58, column: 5, scope: !24)
!123 = !DILocation(line: 58, column: 5, scope: !24)
!124 = distinct !{!124, !125, !"polly.alias.scope.A"}
!125 = distinct !{!125, !"polly.alias.scope.domain"}
!126 = !{!127, !128}
!127 = distinct !{!127, !125, !"polly.alias.scope.B"}
!128 = distinct !{!128, !125, !"polly.alias.scope.C"}
!129 = !{!128, !124}
!130 = !DILocation(line: 35, column: 31, scope: !92, inlinedAt: !122)
!131 = !{!127, !124}
!132 = !DILocation(line: 60, column: 5, scope: !24)
!133 = !DILocation(line: 62, column: 19, scope: !24)
!134 = !DILocation(line: 63, column: 19, scope: !24)
!135 = !DILocation(line: 64, column: 19, scope: !24)
!136 = !DILocation(line: 61, column: 5, scope: !24)
!137 = !DILocation(line: 65, column: 5, scope: !24)
