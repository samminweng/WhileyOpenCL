; ModuleID = 'MatrixAdd.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@A = common global [10240 x [10240 x i32]] zeroinitializer, align 16
@B = common global [10240 x [10240 x i32]] zeroinitializer, align 16
@C = common global [10240 x [10240 x i32]] zeroinitializer, align 16
@.str = private unnamed_addr constant [4 x i8] c"%d \00", align 1
@.str.2 = private unnamed_addr constant [32 x i8] c"Pass %d X %d matrix test case \0A\00", align 1
@.str.3 = private unnamed_addr constant [47 x i8] c"A[%d][%d] = %d, B[%d][%d] =%d, C[%d][%d] =%d \0A\00", align 1

; Function Attrs: nounwind uwtable
define i32 @getRand() #0 !dbg !6 {
entry:
  %call = tail call i32 @rand() #5, !dbg !47
  %rem = srem i32 %call, 100, !dbg !48
  ret i32 %rem, !dbg !49
}

; Function Attrs: nounwind
declare i32 @rand() #1

; Function Attrs: nounwind uwtable
define void @init() #2 !dbg !10 {
entry:
  %t = alloca i64, align 8
  %R = alloca [10240 x [10240 x i32]], align 16
  %0 = bitcast i64* %t to i8*, !dbg !50
  call void @llvm.lifetime.start(i64 8, i8* %0) #5, !dbg !50
  %1 = bitcast [10240 x [10240 x i32]]* %R to i8*, !dbg !51
  call void @llvm.lifetime.start(i64 419430400, i8* %1) #5, !dbg !51
  tail call void @llvm.dbg.declare(metadata [10240 x [10240 x i32]]* %R, metadata !22, metadata !52), !dbg !53
  tail call void @llvm.dbg.value(metadata i64* %t, i64 0, metadata !16, metadata !54), !dbg !55
  %call = call i64 @time(i64* nonnull %t) #5, !dbg !56
  %conv = trunc i64 %call to i32, !dbg !57
  call void @srand(i32 %conv) #5, !dbg !58
  call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !14, metadata !52), !dbg !60
  br label %for.cond2.preheader, !dbg !61

for.cond2.preheader:                              ; preds = %for.inc9, %entry
  %indvars.iv70 = phi i64 [ 0, %entry ], [ %indvars.iv.next71, %for.inc9 ]
  br label %for.body5, !dbg !65

for.body5:                                        ; preds = %for.body5, %for.cond2.preheader
  %indvars.iv67 = phi i64 [ 0, %for.cond2.preheader ], [ %indvars.iv.next68, %for.body5 ]
  %call6 = call i32 @rand() #5, !dbg !70
  %rem = srem i32 %call6, 100, !dbg !72
  %arrayidx8 = getelementptr inbounds [10240 x [10240 x i32]], [10240 x [10240 x i32]]* %R, i64 0, i64 %indvars.iv70, i64 %indvars.iv67, !dbg !73
  store i32 %rem, i32* %arrayidx8, align 4, !dbg !74, !tbaa !75
  %indvars.iv.next68 = add nuw nsw i64 %indvars.iv67, 1, !dbg !65
  %exitcond69 = icmp eq i64 %indvars.iv.next68, 10240, !dbg !65
  br i1 %exitcond69, label %for.inc9, label %for.body5, !dbg !65

for.inc9:                                         ; preds = %for.body5
  %indvars.iv.next71 = add nuw nsw i64 %indvars.iv70, 1, !dbg !61
  %exitcond72 = icmp eq i64 %indvars.iv.next71, 10240, !dbg !61
  br i1 %exitcond72, label %polly.loop_preheader74.preheader, label %for.cond2.preheader, !dbg !61

polly.loop_preheader74.preheader:                 ; preds = %for.inc9
  br label %polly.loop_preheader74

polly.exiting:                                    ; preds = %polly.loop_exit75
  call void @llvm.lifetime.end(i64 419430400, i8* nonnull %1) #5, !dbg !79
  call void @llvm.lifetime.end(i64 8, i8* %0) #5, !dbg !80
  ret void, !dbg !79

polly.loop_exit75:                                ; preds = %polly.loop_exit81
  %polly.indvar_next = add nuw nsw i64 %polly.indvar, 1
  %exitcond99 = icmp eq i64 %polly.indvar_next, 320
  br i1 %exitcond99, label %polly.exiting, label %polly.loop_preheader74

polly.loop_exit81:                                ; preds = %polly.loop_exit87
  %polly.indvar_next77 = add nuw nsw i64 %polly.indvar76, 1
  %exitcond98 = icmp eq i64 %polly.indvar_next77, 320
  br i1 %exitcond98, label %polly.loop_exit75, label %polly.loop_preheader80

polly.loop_preheader74:                           ; preds = %polly.loop_preheader74.preheader, %polly.loop_exit75
  %polly.indvar = phi i64 [ %polly.indvar_next, %polly.loop_exit75 ], [ 0, %polly.loop_preheader74.preheader ]
  %2 = shl i64 %polly.indvar, 5
  br label %polly.loop_preheader80

polly.loop_exit87:                                ; preds = %polly.loop_header85
  %polly.indvar_next83 = add nuw nsw i64 %polly.indvar82, 1
  %exitcond97 = icmp eq i64 %polly.indvar_next83, 32
  br i1 %exitcond97, label %polly.loop_exit81, label %polly.loop_preheader86

polly.loop_preheader80:                           ; preds = %polly.loop_exit81, %polly.loop_preheader74
  %polly.indvar76 = phi i64 [ 0, %polly.loop_preheader74 ], [ %polly.indvar_next77, %polly.loop_exit81 ]
  %3 = shl i64 %polly.indvar76, 5
  br label %polly.loop_preheader86

polly.loop_header85:                              ; preds = %polly.loop_header85, %polly.loop_preheader86
  %polly.indvar88 = phi i64 [ 0, %polly.loop_preheader86 ], [ %polly.indvar_next89.1, %polly.loop_header85 ]
  %4 = add nuw nsw i64 %polly.indvar88, %3
  %scevgep = getelementptr [10240 x [10240 x i32]], [10240 x [10240 x i32]]* %R, i64 0, i64 %6, i64 %4
  %_p_scalar_ = load i32, i32* %scevgep, align 8, !alias.scope !81, !noalias !83
  %p_sub = sub nsw i32 100, %_p_scalar_, !dbg !86
  %scevgep92 = getelementptr [10240 x [10240 x i32]], [10240 x [10240 x i32]]* @B, i64 0, i64 %6, i64 %4
  store i32 %p_sub, i32* %scevgep92, align 8, !alias.scope !84, !noalias !93
  %polly.indvar_next89 = or i64 %polly.indvar88, 1
  %5 = add nuw nsw i64 %polly.indvar_next89, %3
  %scevgep.1 = getelementptr [10240 x [10240 x i32]], [10240 x [10240 x i32]]* %R, i64 0, i64 %6, i64 %5
  %_p_scalar_.1 = load i32, i32* %scevgep.1, align 4, !alias.scope !81, !noalias !83
  %p_sub.1 = sub nsw i32 100, %_p_scalar_.1, !dbg !86
  %scevgep92.1 = getelementptr [10240 x [10240 x i32]], [10240 x [10240 x i32]]* @B, i64 0, i64 %6, i64 %5
  store i32 %p_sub.1, i32* %scevgep92.1, align 4, !alias.scope !84, !noalias !93
  %polly.indvar_next89.1 = add nsw i64 %polly.indvar88, 2
  %exitcond.1 = icmp eq i64 %polly.indvar_next89.1, 32
  br i1 %exitcond.1, label %polly.loop_exit87, label %polly.loop_header85

polly.loop_preheader86:                           ; preds = %polly.loop_exit87, %polly.loop_preheader80
  %polly.indvar82 = phi i64 [ 0, %polly.loop_preheader80 ], [ %polly.indvar_next83, %polly.loop_exit87 ]
  %6 = add nuw nsw i64 %2, %polly.indvar82
  %scevgep93 = getelementptr [10240 x [10240 x i32]], [10240 x [10240 x i32]]* @A, i64 0, i64 %6, i64 %3
  %scevgep9394 = bitcast i32* %scevgep93 to i8*
  %scevgep95 = getelementptr [10240 x [10240 x i32]], [10240 x [10240 x i32]]* %R, i64 0, i64 %6, i64 %3
  %scevgep9596 = bitcast i32* %scevgep95 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %scevgep9394, i8* %scevgep9596, i64 128, i32 16, i1 false)
  br label %polly.loop_header85
}

; Function Attrs: argmemonly nounwind
declare void @llvm.lifetime.start(i64, i8* nocapture) #3

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata, metadata) #4

; Function Attrs: nounwind
declare void @srand(i32) #1

; Function Attrs: nounwind
declare i64 @time(i64*) #1

; Function Attrs: argmemonly nounwind
declare void @llvm.lifetime.end(i64, i8* nocapture) #3

; Function Attrs: nounwind uwtable
define void @mat_add() #2 !dbg !26 {
entry:
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !28, metadata !52), !dbg !94
  br label %polly.loop_preheader34

polly.exiting:                                    ; preds = %polly.loop_exit35
  ret void, !dbg !95

polly.loop_exit35:                                ; preds = %polly.loop_exit41
  %polly.indvar_next = add nuw nsw i64 %polly.indvar, 1
  %exitcond56 = icmp eq i64 %polly.indvar_next, 320
  br i1 %exitcond56, label %polly.exiting, label %polly.loop_preheader34

polly.loop_exit41:                                ; preds = %polly.loop_exit47
  %polly.indvar_next37 = add nuw nsw i64 %polly.indvar36, 1
  %exitcond55 = icmp eq i64 %polly.indvar_next37, 320
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
  %scevgep = getelementptr [10240 x [10240 x i32]], [10240 x [10240 x i32]]* @A, i64 0, i64 %4, i64 %2
  %_p_scalar_ = load i32, i32* %scevgep, align 8, !alias.scope !96, !noalias !98
  %scevgep51 = getelementptr [10240 x [10240 x i32]], [10240 x [10240 x i32]]* @B, i64 0, i64 %4, i64 %2
  %_p_scalar_52 = load i32, i32* %scevgep51, align 8, !alias.scope !100, !noalias !101
  %p_add = add nsw i32 %_p_scalar_52, %_p_scalar_, !dbg !102
  %scevgep53 = getelementptr [10240 x [10240 x i32]], [10240 x [10240 x i32]]* @C, i64 0, i64 %4, i64 %2
  store i32 %p_add, i32* %scevgep53, align 8, !alias.scope !99, !noalias !109
  %polly.indvar_next49 = or i64 %polly.indvar48, 1
  %3 = add nuw nsw i64 %polly.indvar_next49, %1
  %scevgep.1 = getelementptr [10240 x [10240 x i32]], [10240 x [10240 x i32]]* @A, i64 0, i64 %4, i64 %3
  %_p_scalar_.1 = load i32, i32* %scevgep.1, align 4, !alias.scope !96, !noalias !98
  %scevgep51.1 = getelementptr [10240 x [10240 x i32]], [10240 x [10240 x i32]]* @B, i64 0, i64 %4, i64 %3
  %_p_scalar_52.1 = load i32, i32* %scevgep51.1, align 4, !alias.scope !100, !noalias !101
  %p_add.1 = add nsw i32 %_p_scalar_52.1, %_p_scalar_.1, !dbg !102
  %scevgep53.1 = getelementptr [10240 x [10240 x i32]], [10240 x [10240 x i32]]* @C, i64 0, i64 %4, i64 %3
  store i32 %p_add.1, i32* %scevgep53.1, align 4, !alias.scope !99, !noalias !109
  %polly.indvar_next49.1 = add nsw i64 %polly.indvar48, 2
  %exitcond.1 = icmp eq i64 %polly.indvar_next49.1, 32
  br i1 %exitcond.1, label %polly.loop_exit47, label %polly.loop_header45

polly.loop_preheader46:                           ; preds = %polly.loop_exit47, %polly.loop_preheader40
  %polly.indvar42 = phi i64 [ 0, %polly.loop_preheader40 ], [ %polly.indvar_next43, %polly.loop_exit47 ]
  %4 = add nuw nsw i64 %polly.indvar42, %0
  br label %polly.loop_header45
}

; Function Attrs: nounwind uwtable
define void @print_array() #0 !dbg !31 {
entry:
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !33, metadata !52), !dbg !110
  br label %for.cond1.preheader, !dbg !111

for.cond1.preheader:                              ; preds = %for.end, %entry
  %indvars.iv22 = phi i64 [ 0, %entry ], [ %indvars.iv.next23, %for.end ]
  br label %for.body3, !dbg !115

for.body3:                                        ; preds = %for.inc, %for.cond1.preheader
  %indvars.iv = phi i64 [ 0, %for.cond1.preheader ], [ %indvars.iv.next, %for.inc ]
  %arrayidx5 = getelementptr inbounds [10240 x [10240 x i32]], [10240 x [10240 x i32]]* @C, i64 0, i64 %indvars.iv22, i64 %indvars.iv, !dbg !120
  %0 = load i32, i32* %arrayidx5, align 4, !dbg !120, !tbaa !75
  %call = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str, i64 0, i64 0), i32 %0), !dbg !122
  %1 = trunc i64 %indvars.iv to i32, !dbg !123
  %rem = srem i32 %1, 80, !dbg !123
  %cmp6 = icmp eq i32 %rem, 79, !dbg !125
  br i1 %cmp6, label %if.then, label %for.inc, !dbg !126

if.then:                                          ; preds = %for.body3
  %putchar19 = tail call i32 @putchar(i32 10) #5, !dbg !127
  br label %for.inc, !dbg !127

for.inc:                                          ; preds = %for.body3, %if.then
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1, !dbg !115
  %exitcond = icmp eq i64 %indvars.iv.next, 10240, !dbg !115
  br i1 %exitcond, label %for.end, label %for.body3, !dbg !115

for.end:                                          ; preds = %for.inc
  %putchar = tail call i32 @putchar(i32 10) #5, !dbg !129
  %indvars.iv.next23 = add nuw nsw i64 %indvars.iv22, 1, !dbg !111
  %exitcond24 = icmp eq i64 %indvars.iv.next23, 10240, !dbg !111
  br i1 %exitcond24, label %for.end11, label %for.cond1.preheader, !dbg !111

for.end11:                                        ; preds = %for.end
  ret void, !dbg !130
}

; Function Attrs: nounwind
declare i32 @printf(i8* nocapture readonly, ...) #1

; Function Attrs: nounwind uwtable
define i32 @main() #0 !dbg !35 {
entry:
  tail call void @init(), !dbg !131
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !28, metadata !52), !dbg !132
  br label %polly.loop_preheader34.i, !dbg !134

polly.loop_exit35.i:                              ; preds = %polly.loop_exit41.i
  %polly.indvar_next.i = add nuw nsw i64 %polly.indvar.i, 1, !dbg !134
  %exitcond56.i = icmp eq i64 %polly.indvar_next.i, 320, !dbg !134
  br i1 %exitcond56.i, label %mat_add.exit, label %polly.loop_preheader34.i, !dbg !134

polly.loop_exit41.i:                              ; preds = %polly.loop_exit47.i
  %polly.indvar_next37.i = add nuw nsw i64 %polly.indvar36.i, 1, !dbg !134
  %exitcond55.i = icmp eq i64 %polly.indvar_next37.i, 320, !dbg !134
  br i1 %exitcond55.i, label %polly.loop_exit35.i, label %polly.loop_preheader40.i, !dbg !134

polly.loop_preheader34.i:                         ; preds = %polly.loop_exit35.i, %entry
  %polly.indvar.i = phi i64 [ 0, %entry ], [ %polly.indvar_next.i, %polly.loop_exit35.i ], !dbg !134
  %0 = shl nsw i64 %polly.indvar.i, 5, !dbg !134
  br label %polly.loop_preheader40.i, !dbg !134

polly.loop_exit47.i:                              ; preds = %polly.loop_header45.i
  %polly.indvar_next43.i = add nuw nsw i64 %polly.indvar42.i, 1, !dbg !134
  %exitcond54.i = icmp eq i64 %polly.indvar_next43.i, 32, !dbg !134
  br i1 %exitcond54.i, label %polly.loop_exit41.i, label %polly.loop_preheader46.i, !dbg !134

polly.loop_preheader40.i:                         ; preds = %polly.loop_preheader34.i, %polly.loop_exit41.i
  %polly.indvar36.i = phi i64 [ 0, %polly.loop_preheader34.i ], [ %polly.indvar_next37.i, %polly.loop_exit41.i ], !dbg !134
  %1 = shl nsw i64 %polly.indvar36.i, 5, !dbg !134
  br label %polly.loop_preheader46.i, !dbg !134

polly.loop_header45.i:                            ; preds = %polly.loop_header45.i, %polly.loop_preheader46.i
  %polly.indvar48.i = phi i64 [ 0, %polly.loop_preheader46.i ], [ %polly.indvar_next49.i.1, %polly.loop_header45.i ], !dbg !134
  %2 = add nuw nsw i64 %polly.indvar48.i, %1, !dbg !134
  %scevgep.i = getelementptr [10240 x [10240 x i32]], [10240 x [10240 x i32]]* @A, i64 0, i64 %4, i64 %2, !dbg !134
  %_p_scalar_.i = load i32, i32* %scevgep.i, align 8, !dbg !134, !alias.scope !135, !noalias !137
  %scevgep51.i = getelementptr [10240 x [10240 x i32]], [10240 x [10240 x i32]]* @B, i64 0, i64 %4, i64 %2, !dbg !134
  %_p_scalar_52.i = load i32, i32* %scevgep51.i, align 8, !dbg !134, !alias.scope !139, !noalias !140
  %p_add.i = add nsw i32 %_p_scalar_52.i, %_p_scalar_.i, !dbg !141
  %scevgep53.i = getelementptr [10240 x [10240 x i32]], [10240 x [10240 x i32]]* @C, i64 0, i64 %4, i64 %2, !dbg !134
  store i32 %p_add.i, i32* %scevgep53.i, align 8, !dbg !134, !alias.scope !138, !noalias !142
  %polly.indvar_next49.i = or i64 %polly.indvar48.i, 1, !dbg !134
  %3 = add nuw nsw i64 %polly.indvar_next49.i, %1, !dbg !134
  %scevgep.i.1 = getelementptr [10240 x [10240 x i32]], [10240 x [10240 x i32]]* @A, i64 0, i64 %4, i64 %3, !dbg !134
  %_p_scalar_.i.1 = load i32, i32* %scevgep.i.1, align 4, !dbg !134, !alias.scope !135, !noalias !137
  %scevgep51.i.1 = getelementptr [10240 x [10240 x i32]], [10240 x [10240 x i32]]* @B, i64 0, i64 %4, i64 %3, !dbg !134
  %_p_scalar_52.i.1 = load i32, i32* %scevgep51.i.1, align 4, !dbg !134, !alias.scope !139, !noalias !140
  %p_add.i.1 = add nsw i32 %_p_scalar_52.i.1, %_p_scalar_.i.1, !dbg !141
  %scevgep53.i.1 = getelementptr [10240 x [10240 x i32]], [10240 x [10240 x i32]]* @C, i64 0, i64 %4, i64 %3, !dbg !134
  store i32 %p_add.i.1, i32* %scevgep53.i.1, align 4, !dbg !134, !alias.scope !138, !noalias !142
  %polly.indvar_next49.i.1 = add nsw i64 %polly.indvar48.i, 2, !dbg !134
  %exitcond.i.1 = icmp eq i64 %polly.indvar_next49.i.1, 32, !dbg !134
  br i1 %exitcond.i.1, label %polly.loop_exit47.i, label %polly.loop_header45.i, !dbg !134

polly.loop_preheader46.i:                         ; preds = %polly.loop_preheader40.i, %polly.loop_exit47.i
  %polly.indvar42.i = phi i64 [ 0, %polly.loop_preheader40.i ], [ %polly.indvar_next43.i, %polly.loop_exit47.i ], !dbg !134
  %4 = add nuw nsw i64 %polly.indvar42.i, %0, !dbg !134
  br label %polly.loop_header45.i, !dbg !134

mat_add.exit:                                     ; preds = %polly.loop_exit35.i
  %call = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str.2, i64 0, i64 0), i32 10240, i32 10240), !dbg !143
  %5 = load i32, i32* getelementptr inbounds ([10240 x [10240 x i32]], [10240 x [10240 x i32]]* @A, i64 0, i64 10239, i64 10239), align 4, !dbg !144, !tbaa !75
  %6 = load i32, i32* getelementptr inbounds ([10240 x [10240 x i32]], [10240 x [10240 x i32]]* @B, i64 0, i64 10239, i64 10239), align 4, !dbg !145, !tbaa !75
  %7 = load i32, i32* getelementptr inbounds ([10240 x [10240 x i32]], [10240 x [10240 x i32]]* @C, i64 0, i64 10239, i64 10239), align 4, !dbg !146, !tbaa !75
  %call1 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([47 x i8], [47 x i8]* @.str.3, i64 0, i64 0), i32 10239, i32 10239, i32 %5, i32 10239, i32 10239, i32 %6, i32 10239, i32 10239, i32 %7), !dbg !147
  ret i32 0, !dbg !148
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.value(metadata, i64, metadata, metadata) #4

declare i32 @putchar(i32)

; Function Attrs: argmemonly nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture readonly, i64, i32, i1) #3

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "polly-optimized" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { argmemonly nounwind }
attributes #4 = { nounwind readnone }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!44, !45}
!llvm.ident = !{!46}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 3.9.0 (http://llvm.org/git/clang.git e177b4a63ca92c5fec010986944530688e104074) (http://llvm.org/git/llvm.git fcd97ccb03712372fe95f1732638de5ed3fcabe8)", isOptimized: true, runtimeVersion: 0, emissionKind: 1, enums: !2, retainedTypes: !3, subprograms: !5, globals: !40)
!1 = !DIFile(filename: "MatrixAdd.c", directory: "/home/sam/workspace/WhileyOpenCL/polly/MatrixAdd/impl/handwritten")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, align: 32, encoding: DW_ATE_unsigned)
!5 = !{!6, !10, !26, !31, !35}
!6 = distinct !DISubprogram(name: "getRand", scope: !1, file: !1, line: 8, type: !7, isLocal: false, isDefinition: true, scopeLine: 8, isOptimized: true, variables: !2)
!7 = !DISubroutineType(types: !8)
!8 = !{!9}
!9 = !DIBasicType(name: "int", size: 32, align: 32, encoding: DW_ATE_signed)
!10 = distinct !DISubprogram(name: "init", scope: !1, file: !1, line: 12, type: !11, isLocal: false, isDefinition: true, scopeLine: 13, isOptimized: true, variables: !13)
!11 = !DISubroutineType(types: !12)
!12 = !{null}
!13 = !{!14, !15, !16, !22}
!14 = !DILocalVariable(name: "i", scope: !10, file: !1, line: 14, type: !9)
!15 = !DILocalVariable(name: "j", scope: !10, file: !1, line: 15, type: !9)
!16 = !DILocalVariable(name: "t", scope: !10, file: !1, line: 17, type: !17)
!17 = !DIDerivedType(tag: DW_TAG_typedef, name: "time_t", file: !18, line: 75, baseType: !19)
!18 = !DIFile(filename: "/usr/include/time.h", directory: "/home/sam/workspace/WhileyOpenCL/polly/MatrixAdd/impl/handwritten")
!19 = !DIDerivedType(tag: DW_TAG_typedef, name: "__time_t", file: !20, line: 139, baseType: !21)
!20 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types.h", directory: "/home/sam/workspace/WhileyOpenCL/polly/MatrixAdd/impl/handwritten")
!21 = !DIBasicType(name: "long int", size: 64, align: 64, encoding: DW_ATE_signed)
!22 = !DILocalVariable(name: "R", scope: !10, file: !1, line: 18, type: !23)
!23 = !DICompositeType(tag: DW_TAG_array_type, baseType: !9, size: 3355443200, align: 32, elements: !24)
!24 = !{!25, !25}
!25 = !DISubrange(count: 10240)
!26 = distinct !DISubprogram(name: "mat_add", scope: !1, file: !1, line: 35, type: !11, isLocal: false, isDefinition: true, scopeLine: 35, isOptimized: true, variables: !27)
!27 = !{!28, !29, !30}
!28 = !DILocalVariable(name: "i", scope: !26, file: !1, line: 36, type: !9)
!29 = !DILocalVariable(name: "j", scope: !26, file: !1, line: 36, type: !9)
!30 = !DILocalVariable(name: "k", scope: !26, file: !1, line: 36, type: !9)
!31 = distinct !DISubprogram(name: "print_array", scope: !1, file: !1, line: 44, type: !11, isLocal: false, isDefinition: true, scopeLine: 45, isOptimized: true, variables: !32)
!32 = !{!33, !34}
!33 = !DILocalVariable(name: "i", scope: !31, file: !1, line: 46, type: !9)
!34 = !DILocalVariable(name: "j", scope: !31, file: !1, line: 46, type: !9)
!35 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 57, type: !7, isLocal: false, isDefinition: true, scopeLine: 58, isOptimized: true, variables: !36)
!36 = !{!37, !38, !39}
!37 = !DILocalVariable(name: "i", scope: !35, file: !1, line: 59, type: !9)
!38 = !DILocalVariable(name: "j", scope: !35, file: !1, line: 59, type: !9)
!39 = !DILocalVariable(name: "k", scope: !35, file: !1, line: 59, type: !9)
!40 = !{!41, !42, !43}
!41 = !DIGlobalVariable(name: "A", scope: !0, file: !1, line: 3, type: !23, isLocal: false, isDefinition: true, variable: [10240 x [10240 x i32]]* @A)
!42 = !DIGlobalVariable(name: "B", scope: !0, file: !1, line: 4, type: !23, isLocal: false, isDefinition: true, variable: [10240 x [10240 x i32]]* @B)
!43 = !DIGlobalVariable(name: "C", scope: !0, file: !1, line: 5, type: !23, isLocal: false, isDefinition: true, variable: [10240 x [10240 x i32]]* @C)
!44 = !{i32 2, !"Dwarf Version", i32 4}
!45 = !{i32 2, !"Debug Info Version", i32 3}
!46 = !{!"clang version 3.9.0 (http://llvm.org/git/clang.git e177b4a63ca92c5fec010986944530688e104074) (http://llvm.org/git/llvm.git fcd97ccb03712372fe95f1732638de5ed3fcabe8)"}
!47 = !DILocation(line: 9, column: 12, scope: !6)
!48 = !DILocation(line: 9, column: 19, scope: !6)
!49 = !DILocation(line: 9, column: 5, scope: !6)
!50 = !DILocation(line: 17, column: 5, scope: !10)
!51 = !DILocation(line: 18, column: 5, scope: !10)
!52 = !DIExpression()
!53 = !DILocation(line: 18, column: 9, scope: !10)
!54 = !DIExpression(DW_OP_deref)
!55 = !DILocation(line: 17, column: 12, scope: !10)
!56 = !DILocation(line: 20, column: 22, scope: !10)
!57 = !DILocation(line: 20, column: 11, scope: !10)
!58 = !DILocation(line: 20, column: 5, scope: !59)
!59 = !DILexicalBlockFile(scope: !10, file: !1, discriminator: 1)
!60 = !DILocation(line: 14, column: 9, scope: !10)
!61 = !DILocation(line: 21, column: 5, scope: !62)
!62 = !DILexicalBlockFile(scope: !63, file: !1, discriminator: 1)
!63 = distinct !DILexicalBlock(scope: !64, file: !1, line: 21, column: 5)
!64 = distinct !DILexicalBlock(scope: !10, file: !1, line: 21, column: 5)
!65 = !DILocation(line: 22, column: 9, scope: !66)
!66 = !DILexicalBlockFile(scope: !67, file: !1, discriminator: 1)
!67 = distinct !DILexicalBlock(scope: !68, file: !1, line: 22, column: 9)
!68 = distinct !DILexicalBlock(scope: !69, file: !1, line: 22, column: 9)
!69 = distinct !DILexicalBlock(scope: !63, file: !1, line: 21, column: 25)
!70 = !DILocation(line: 23, column: 23, scope: !71)
!71 = distinct !DILexicalBlock(scope: !67, file: !1, line: 22, column: 29)
!72 = !DILocation(line: 23, column: 30, scope: !71)
!73 = !DILocation(line: 23, column: 13, scope: !71)
!74 = !DILocation(line: 23, column: 21, scope: !71)
!75 = !{!76, !76, i64 0}
!76 = !{!"int", !77, i64 0}
!77 = !{!"omnipotent char", !78, i64 0}
!78 = !{!"Simple C/C++ TBAA"}
!79 = !DILocation(line: 33, column: 1, scope: !10)
!80 = !DILocation(line: 33, column: 1, scope: !59)
!81 = distinct !{!81, !82, !"polly.alias.scope.R"}
!82 = distinct !{!82, !"polly.alias.scope.domain"}
!83 = !{!84, !85}
!84 = distinct !{!84, !82, !"polly.alias.scope.B"}
!85 = distinct !{!85, !82, !"polly.alias.scope.A"}
!86 = !DILocation(line: 30, column: 27, scope: !87)
!87 = distinct !DILexicalBlock(scope: !88, file: !1, line: 28, column: 29)
!88 = distinct !DILexicalBlock(scope: !89, file: !1, line: 28, column: 9)
!89 = distinct !DILexicalBlock(scope: !90, file: !1, line: 28, column: 9)
!90 = distinct !DILexicalBlock(scope: !91, file: !1, line: 27, column: 25)
!91 = distinct !DILexicalBlock(scope: !92, file: !1, line: 27, column: 5)
!92 = distinct !DILexicalBlock(scope: !10, file: !1, line: 27, column: 5)
!93 = !{!81, !85}
!94 = !DILocation(line: 36, column: 9, scope: !26)
!95 = !DILocation(line: 42, column: 1, scope: !26)
!96 = distinct !{!96, !97, !"polly.alias.scope.A"}
!97 = distinct !{!97, !"polly.alias.scope.domain"}
!98 = !{!99, !100}
!99 = distinct !{!99, !97, !"polly.alias.scope.C"}
!100 = distinct !{!100, !97, !"polly.alias.scope.B"}
!101 = !{!99, !96}
!102 = !DILocation(line: 39, column: 31, scope: !103)
!103 = distinct !DILexicalBlock(scope: !104, file: !1, line: 38, column: 29)
!104 = distinct !DILexicalBlock(scope: !105, file: !1, line: 38, column: 9)
!105 = distinct !DILexicalBlock(scope: !106, file: !1, line: 38, column: 9)
!106 = distinct !DILexicalBlock(scope: !107, file: !1, line: 37, column: 25)
!107 = distinct !DILexicalBlock(scope: !108, file: !1, line: 37, column: 5)
!108 = distinct !DILexicalBlock(scope: !26, file: !1, line: 37, column: 5)
!109 = !{!100, !96}
!110 = !DILocation(line: 46, column: 9, scope: !31)
!111 = !DILocation(line: 48, column: 5, scope: !112)
!112 = !DILexicalBlockFile(scope: !113, file: !1, discriminator: 1)
!113 = distinct !DILexicalBlock(scope: !114, file: !1, line: 48, column: 5)
!114 = distinct !DILexicalBlock(scope: !31, file: !1, line: 48, column: 5)
!115 = !DILocation(line: 49, column: 9, scope: !116)
!116 = !DILexicalBlockFile(scope: !117, file: !1, discriminator: 1)
!117 = distinct !DILexicalBlock(scope: !118, file: !1, line: 49, column: 9)
!118 = distinct !DILexicalBlock(scope: !119, file: !1, line: 49, column: 9)
!119 = distinct !DILexicalBlock(scope: !113, file: !1, line: 48, column: 25)
!120 = !DILocation(line: 50, column: 27, scope: !121)
!121 = distinct !DILexicalBlock(scope: !117, file: !1, line: 49, column: 29)
!122 = !DILocation(line: 50, column: 13, scope: !121)
!123 = !DILocation(line: 51, column: 18, scope: !124)
!124 = distinct !DILexicalBlock(scope: !121, file: !1, line: 51, column: 17)
!125 = !DILocation(line: 51, column: 22, scope: !124)
!126 = !DILocation(line: 51, column: 17, scope: !121)
!127 = !DILocation(line: 51, column: 29, scope: !128)
!128 = !DILexicalBlockFile(scope: !124, file: !1, discriminator: 1)
!129 = !DILocation(line: 53, column: 9, scope: !119)
!130 = !DILocation(line: 55, column: 1, scope: !31)
!131 = !DILocation(line: 61, column: 5, scope: !35)
!132 = !DILocation(line: 36, column: 9, scope: !26, inlinedAt: !133)
!133 = distinct !DILocation(line: 62, column: 5, scope: !35)
!134 = !DILocation(line: 62, column: 5, scope: !35)
!135 = distinct !{!135, !136, !"polly.alias.scope.A"}
!136 = distinct !{!136, !"polly.alias.scope.domain"}
!137 = !{!138, !139}
!138 = distinct !{!138, !136, !"polly.alias.scope.C"}
!139 = distinct !{!139, !136, !"polly.alias.scope.B"}
!140 = !{!138, !135}
!141 = !DILocation(line: 39, column: 31, scope: !103, inlinedAt: !133)
!142 = !{!139, !135}
!143 = !DILocation(line: 64, column: 5, scope: !35)
!144 = !DILocation(line: 66, column: 19, scope: !35)
!145 = !DILocation(line: 67, column: 19, scope: !35)
!146 = !DILocation(line: 68, column: 19, scope: !35)
!147 = !DILocation(line: 65, column: 5, scope: !35)
!148 = !DILocation(line: 69, column: 5, scope: !35)
