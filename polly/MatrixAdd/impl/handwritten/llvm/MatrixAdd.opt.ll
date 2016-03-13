; ModuleID = 'MatrixAdd.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@A = common global [10240 x [10240 x i64]] zeroinitializer, align 16
@B = common global [10240 x [10240 x i64]] zeroinitializer, align 16
@C = common global [10240 x [10240 x i64]] zeroinitializer, align 16
@stdout = external global %struct._IO_FILE*, align 8
@.str = private unnamed_addr constant [6 x i8] c"%lld \00", align 1
@.str.2 = private unnamed_addr constant [51 x i8] c"Pass %d X %d matrix test case (C[%d][%d] =%lld) \0A \00", align 1

; Function Attrs: nounwind uwtable
define void @init_array() #0 !dbg !4 {
entry:
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !8, metadata !42), !dbg !43
  br label %for.cond1.preheader, !dbg !44

for.cond1.preheader:                              ; preds = %for.inc10, %entry
  %indvars.iv23 = phi i64 [ 0, %entry ], [ %indvars.iv.next24, %for.inc10 ]
  br label %for.body3, !dbg !48

for.body3:                                        ; preds = %for.body3, %for.cond1.preheader
  %indvars.iv = phi i64 [ 0, %for.cond1.preheader ], [ %indvars.iv.next.4, %for.body3 ]
  %arrayidx5 = getelementptr inbounds [10240 x [10240 x i64]], [10240 x [10240 x i64]]* @A, i64 0, i64 %indvars.iv23, i64 %indvars.iv, !dbg !53
  store i64 1, i64* %arrayidx5, align 8, !dbg !55, !tbaa !56
  %arrayidx9 = getelementptr inbounds [10240 x [10240 x i64]], [10240 x [10240 x i64]]* @B, i64 0, i64 %indvars.iv23, i64 %indvars.iv, !dbg !60
  store i64 1, i64* %arrayidx9, align 8, !dbg !61, !tbaa !56
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1, !dbg !48
  %arrayidx5.1 = getelementptr inbounds [10240 x [10240 x i64]], [10240 x [10240 x i64]]* @A, i64 0, i64 %indvars.iv23, i64 %indvars.iv.next, !dbg !53
  store i64 1, i64* %arrayidx5.1, align 8, !dbg !55, !tbaa !56
  %arrayidx9.1 = getelementptr inbounds [10240 x [10240 x i64]], [10240 x [10240 x i64]]* @B, i64 0, i64 %indvars.iv23, i64 %indvars.iv.next, !dbg !60
  store i64 1, i64* %arrayidx9.1, align 8, !dbg !61, !tbaa !56
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2, !dbg !48
  %arrayidx5.2 = getelementptr inbounds [10240 x [10240 x i64]], [10240 x [10240 x i64]]* @A, i64 0, i64 %indvars.iv23, i64 %indvars.iv.next.1, !dbg !53
  store i64 1, i64* %arrayidx5.2, align 8, !dbg !55, !tbaa !56
  %arrayidx9.2 = getelementptr inbounds [10240 x [10240 x i64]], [10240 x [10240 x i64]]* @B, i64 0, i64 %indvars.iv23, i64 %indvars.iv.next.1, !dbg !60
  store i64 1, i64* %arrayidx9.2, align 8, !dbg !61, !tbaa !56
  %indvars.iv.next.2 = add nsw i64 %indvars.iv, 3, !dbg !48
  %arrayidx5.3 = getelementptr inbounds [10240 x [10240 x i64]], [10240 x [10240 x i64]]* @A, i64 0, i64 %indvars.iv23, i64 %indvars.iv.next.2, !dbg !53
  store i64 1, i64* %arrayidx5.3, align 8, !dbg !55, !tbaa !56
  %arrayidx9.3 = getelementptr inbounds [10240 x [10240 x i64]], [10240 x [10240 x i64]]* @B, i64 0, i64 %indvars.iv23, i64 %indvars.iv.next.2, !dbg !60
  store i64 1, i64* %arrayidx9.3, align 8, !dbg !61, !tbaa !56
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4, !dbg !48
  %arrayidx5.4 = getelementptr inbounds [10240 x [10240 x i64]], [10240 x [10240 x i64]]* @A, i64 0, i64 %indvars.iv23, i64 %indvars.iv.next.3, !dbg !53
  store i64 1, i64* %arrayidx5.4, align 8, !dbg !55, !tbaa !56
  %arrayidx9.4 = getelementptr inbounds [10240 x [10240 x i64]], [10240 x [10240 x i64]]* @B, i64 0, i64 %indvars.iv23, i64 %indvars.iv.next.3, !dbg !60
  store i64 1, i64* %arrayidx9.4, align 8, !dbg !61, !tbaa !56
  %indvars.iv.next.4 = add nsw i64 %indvars.iv, 5, !dbg !48
  %exitcond.4 = icmp eq i64 %indvars.iv.next.4, 10240, !dbg !48
  br i1 %exitcond.4, label %for.inc10, label %for.body3, !dbg !48

for.inc10:                                        ; preds = %for.body3
  %indvars.iv.next24 = add nuw nsw i64 %indvars.iv23, 1, !dbg !44
  %exitcond25 = icmp eq i64 %indvars.iv.next24, 10240, !dbg !44
  br i1 %exitcond25, label %for.end12, label %for.cond1.preheader, !dbg !44

for.end12:                                        ; preds = %for.inc10
  ret void, !dbg !62
}

; Function Attrs: nounwind uwtable
define void @mat_add() #1 !dbg !11 {
entry:
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !13, metadata !42), !dbg !63
  br label %polly.loop_preheader34

polly.exiting:                                    ; preds = %polly.loop_exit35
  ret void, !dbg !64

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
  %scevgep = getelementptr [10240 x [10240 x i64]], [10240 x [10240 x i64]]* @A, i64 0, i64 %4, i64 %2
  %_p_scalar_ = load i64, i64* %scevgep, align 16, !alias.scope !65, !noalias !67
  %scevgep51 = getelementptr [10240 x [10240 x i64]], [10240 x [10240 x i64]]* @B, i64 0, i64 %4, i64 %2
  %_p_scalar_52 = load i64, i64* %scevgep51, align 16, !alias.scope !68, !noalias !70
  %p_add = add nsw i64 %_p_scalar_52, %_p_scalar_, !dbg !71
  %scevgep53 = getelementptr [10240 x [10240 x i64]], [10240 x [10240 x i64]]* @C, i64 0, i64 %4, i64 %2
  store i64 %p_add, i64* %scevgep53, align 16, !alias.scope !69, !noalias !78
  %polly.indvar_next49 = or i64 %polly.indvar48, 1
  %3 = add nuw nsw i64 %polly.indvar_next49, %1
  %scevgep.1 = getelementptr [10240 x [10240 x i64]], [10240 x [10240 x i64]]* @A, i64 0, i64 %4, i64 %3
  %_p_scalar_.1 = load i64, i64* %scevgep.1, align 8, !alias.scope !65, !noalias !67
  %scevgep51.1 = getelementptr [10240 x [10240 x i64]], [10240 x [10240 x i64]]* @B, i64 0, i64 %4, i64 %3
  %_p_scalar_52.1 = load i64, i64* %scevgep51.1, align 8, !alias.scope !68, !noalias !70
  %p_add.1 = add nsw i64 %_p_scalar_52.1, %_p_scalar_.1, !dbg !71
  %scevgep53.1 = getelementptr [10240 x [10240 x i64]], [10240 x [10240 x i64]]* @C, i64 0, i64 %4, i64 %3
  store i64 %p_add.1, i64* %scevgep53.1, align 8, !alias.scope !69, !noalias !78
  %polly.indvar_next49.1 = add nsw i64 %polly.indvar48, 2
  %exitcond.1 = icmp eq i64 %polly.indvar_next49.1, 32
  br i1 %exitcond.1, label %polly.loop_exit47, label %polly.loop_header45

polly.loop_preheader46:                           ; preds = %polly.loop_exit47, %polly.loop_preheader40
  %polly.indvar42 = phi i64 [ 0, %polly.loop_preheader40 ], [ %polly.indvar_next43, %polly.loop_exit47 ]
  %4 = add nuw nsw i64 %polly.indvar42, %0
  br label %polly.loop_header45
}

; Function Attrs: nounwind uwtable
define void @print_array() #0 !dbg !16 {
entry:
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !18, metadata !42), !dbg !79
  br label %for.cond1.preheader, !dbg !80

for.cond1.preheader:                              ; preds = %for.end, %entry
  %indvars.iv24 = phi i64 [ 0, %entry ], [ %indvars.iv.next25, %for.end ]
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 8, !dbg !84, !tbaa !89
  br label %for.body3, !dbg !91

for.body3:                                        ; preds = %for.inc, %for.cond1.preheader
  %indvars.iv = phi i64 [ 0, %for.cond1.preheader ], [ %indvars.iv.next, %for.inc ]
  %1 = phi %struct._IO_FILE* [ %0, %for.cond1.preheader ], [ %5, %for.inc ]
  %arrayidx5 = getelementptr inbounds [10240 x [10240 x i64]], [10240 x [10240 x i64]]* @C, i64 0, i64 %indvars.iv24, i64 %indvars.iv, !dbg !93
  %2 = load i64, i64* %arrayidx5, align 8, !dbg !93, !tbaa !56
  %call = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %1, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str, i64 0, i64 0), i64 %2), !dbg !94
  %3 = trunc i64 %indvars.iv to i32, !dbg !95
  %rem = srem i32 %3, 80, !dbg !95
  %cmp6 = icmp eq i32 %rem, 79, !dbg !97
  br i1 %cmp6, label %if.then, label %for.inc, !dbg !98

if.then:                                          ; preds = %for.body3
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 8, !dbg !99, !tbaa !89
  %fputc21 = tail call i32 @fputc(i32 10, %struct._IO_FILE* %4), !dbg !101
  br label %for.inc, !dbg !101

for.inc:                                          ; preds = %for.body3, %if.then
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1, !dbg !91
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 8, !dbg !84, !tbaa !89
  %exitcond = icmp eq i64 %indvars.iv.next, 10240, !dbg !91
  br i1 %exitcond, label %for.end, label %for.body3, !dbg !91

for.end:                                          ; preds = %for.inc
  %.lcssa = phi %struct._IO_FILE* [ %5, %for.inc ]
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %.lcssa), !dbg !102
  %indvars.iv.next25 = add nuw nsw i64 %indvars.iv24, 1, !dbg !80
  %exitcond26 = icmp eq i64 %indvars.iv.next25, 10240, !dbg !80
  br i1 %exitcond26, label %for.end11, label %for.cond1.preheader, !dbg !80

for.end11:                                        ; preds = %for.end
  ret void, !dbg !103
}

; Function Attrs: nounwind
declare i32 @fprintf(%struct._IO_FILE* nocapture, i8* nocapture readonly, ...) #2

; Function Attrs: nounwind uwtable
define i32 @main() #0 !dbg !20 {
entry:
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !8, metadata !42), !dbg !104
  br label %for.cond1.preheader.i, !dbg !106

for.cond1.preheader.i:                            ; preds = %for.inc10.i, %entry
  %indvars.iv23.i = phi i64 [ 0, %entry ], [ %indvars.iv.next24.i, %for.inc10.i ], !dbg !107
  br label %for.body3.i, !dbg !108

for.body3.i:                                      ; preds = %for.body3.i, %for.cond1.preheader.i
  %indvars.iv.i = phi i64 [ 0, %for.cond1.preheader.i ], [ %indvars.iv.next.i.4, %for.body3.i ], !dbg !107
  %arrayidx5.i = getelementptr inbounds [10240 x [10240 x i64]], [10240 x [10240 x i64]]* @A, i64 0, i64 %indvars.iv23.i, i64 %indvars.iv.i, !dbg !109
  store i64 1, i64* %arrayidx5.i, align 8, !dbg !110, !tbaa !56
  %arrayidx9.i = getelementptr inbounds [10240 x [10240 x i64]], [10240 x [10240 x i64]]* @B, i64 0, i64 %indvars.iv23.i, i64 %indvars.iv.i, !dbg !111
  store i64 1, i64* %arrayidx9.i, align 8, !dbg !112, !tbaa !56
  %indvars.iv.next.i = add nuw nsw i64 %indvars.iv.i, 1, !dbg !108
  %arrayidx5.i.1 = getelementptr inbounds [10240 x [10240 x i64]], [10240 x [10240 x i64]]* @A, i64 0, i64 %indvars.iv23.i, i64 %indvars.iv.next.i, !dbg !109
  store i64 1, i64* %arrayidx5.i.1, align 8, !dbg !110, !tbaa !56
  %arrayidx9.i.1 = getelementptr inbounds [10240 x [10240 x i64]], [10240 x [10240 x i64]]* @B, i64 0, i64 %indvars.iv23.i, i64 %indvars.iv.next.i, !dbg !111
  store i64 1, i64* %arrayidx9.i.1, align 8, !dbg !112, !tbaa !56
  %indvars.iv.next.i.1 = add nsw i64 %indvars.iv.i, 2, !dbg !108
  %arrayidx5.i.2 = getelementptr inbounds [10240 x [10240 x i64]], [10240 x [10240 x i64]]* @A, i64 0, i64 %indvars.iv23.i, i64 %indvars.iv.next.i.1, !dbg !109
  store i64 1, i64* %arrayidx5.i.2, align 8, !dbg !110, !tbaa !56
  %arrayidx9.i.2 = getelementptr inbounds [10240 x [10240 x i64]], [10240 x [10240 x i64]]* @B, i64 0, i64 %indvars.iv23.i, i64 %indvars.iv.next.i.1, !dbg !111
  store i64 1, i64* %arrayidx9.i.2, align 8, !dbg !112, !tbaa !56
  %indvars.iv.next.i.2 = add nsw i64 %indvars.iv.i, 3, !dbg !108
  %arrayidx5.i.3 = getelementptr inbounds [10240 x [10240 x i64]], [10240 x [10240 x i64]]* @A, i64 0, i64 %indvars.iv23.i, i64 %indvars.iv.next.i.2, !dbg !109
  store i64 1, i64* %arrayidx5.i.3, align 8, !dbg !110, !tbaa !56
  %arrayidx9.i.3 = getelementptr inbounds [10240 x [10240 x i64]], [10240 x [10240 x i64]]* @B, i64 0, i64 %indvars.iv23.i, i64 %indvars.iv.next.i.2, !dbg !111
  store i64 1, i64* %arrayidx9.i.3, align 8, !dbg !112, !tbaa !56
  %indvars.iv.next.i.3 = add nsw i64 %indvars.iv.i, 4, !dbg !108
  %arrayidx5.i.4 = getelementptr inbounds [10240 x [10240 x i64]], [10240 x [10240 x i64]]* @A, i64 0, i64 %indvars.iv23.i, i64 %indvars.iv.next.i.3, !dbg !109
  store i64 1, i64* %arrayidx5.i.4, align 8, !dbg !110, !tbaa !56
  %arrayidx9.i.4 = getelementptr inbounds [10240 x [10240 x i64]], [10240 x [10240 x i64]]* @B, i64 0, i64 %indvars.iv23.i, i64 %indvars.iv.next.i.3, !dbg !111
  store i64 1, i64* %arrayidx9.i.4, align 8, !dbg !112, !tbaa !56
  %indvars.iv.next.i.4 = add nsw i64 %indvars.iv.i, 5, !dbg !108
  %exitcond.i.4 = icmp eq i64 %indvars.iv.next.i.4, 10240, !dbg !108
  br i1 %exitcond.i.4, label %for.inc10.i, label %for.body3.i, !dbg !108

for.inc10.i:                                      ; preds = %for.body3.i
  %indvars.iv.next24.i = add nuw nsw i64 %indvars.iv23.i, 1, !dbg !106
  %exitcond25.i = icmp eq i64 %indvars.iv.next24.i, 10240, !dbg !106
  br i1 %exitcond25.i, label %polly.loop_preheader34.i.preheader, label %for.cond1.preheader.i, !dbg !106

polly.loop_preheader34.i.preheader:               ; preds = %for.inc10.i
  br label %polly.loop_preheader34.i, !dbg !113

polly.loop_exit35.i:                              ; preds = %polly.loop_exit41.i
  %polly.indvar_next.i = add nuw nsw i64 %polly.indvar.i, 1, !dbg !113
  %exitcond56.i = icmp eq i64 %polly.indvar_next.i, 320, !dbg !113
  br i1 %exitcond56.i, label %mat_add.exit, label %polly.loop_preheader34.i, !dbg !113

polly.loop_exit41.i:                              ; preds = %polly.loop_exit47.i
  %polly.indvar_next37.i = add nuw nsw i64 %polly.indvar36.i, 1, !dbg !113
  %exitcond55.i = icmp eq i64 %polly.indvar_next37.i, 320, !dbg !113
  br i1 %exitcond55.i, label %polly.loop_exit35.i, label %polly.loop_preheader40.i, !dbg !113

polly.loop_preheader34.i:                         ; preds = %polly.loop_preheader34.i.preheader, %polly.loop_exit35.i
  %polly.indvar.i = phi i64 [ %polly.indvar_next.i, %polly.loop_exit35.i ], [ 0, %polly.loop_preheader34.i.preheader ], !dbg !113
  %0 = shl nsw i64 %polly.indvar.i, 5, !dbg !113
  br label %polly.loop_preheader40.i, !dbg !113

polly.loop_exit47.i:                              ; preds = %polly.loop_header45.i
  %polly.indvar_next43.i = add nuw nsw i64 %polly.indvar42.i, 1, !dbg !113
  %exitcond54.i = icmp eq i64 %polly.indvar_next43.i, 32, !dbg !113
  br i1 %exitcond54.i, label %polly.loop_exit41.i, label %polly.loop_preheader46.i, !dbg !113

polly.loop_preheader40.i:                         ; preds = %polly.loop_preheader34.i, %polly.loop_exit41.i
  %polly.indvar36.i = phi i64 [ 0, %polly.loop_preheader34.i ], [ %polly.indvar_next37.i, %polly.loop_exit41.i ], !dbg !113
  %1 = shl nsw i64 %polly.indvar36.i, 5, !dbg !113
  br label %polly.loop_preheader46.i, !dbg !113

polly.loop_header45.i:                            ; preds = %polly.loop_header45.i, %polly.loop_preheader46.i
  %polly.indvar48.i = phi i64 [ 0, %polly.loop_preheader46.i ], [ %polly.indvar_next49.i.1, %polly.loop_header45.i ], !dbg !113
  %2 = add nuw nsw i64 %polly.indvar48.i, %1, !dbg !113
  %scevgep.i = getelementptr [10240 x [10240 x i64]], [10240 x [10240 x i64]]* @A, i64 0, i64 %4, i64 %2, !dbg !113
  %_p_scalar_.i = load i64, i64* %scevgep.i, align 16, !dbg !113, !alias.scope !114, !noalias !116
  %scevgep51.i = getelementptr [10240 x [10240 x i64]], [10240 x [10240 x i64]]* @B, i64 0, i64 %4, i64 %2, !dbg !113
  %_p_scalar_52.i = load i64, i64* %scevgep51.i, align 16, !dbg !113, !alias.scope !117, !noalias !119
  %p_add.i = add nsw i64 %_p_scalar_52.i, %_p_scalar_.i, !dbg !120
  %scevgep53.i = getelementptr [10240 x [10240 x i64]], [10240 x [10240 x i64]]* @C, i64 0, i64 %4, i64 %2, !dbg !113
  store i64 %p_add.i, i64* %scevgep53.i, align 16, !dbg !113, !alias.scope !118, !noalias !122
  %polly.indvar_next49.i = or i64 %polly.indvar48.i, 1, !dbg !113
  %3 = add nuw nsw i64 %polly.indvar_next49.i, %1, !dbg !113
  %scevgep.i.1 = getelementptr [10240 x [10240 x i64]], [10240 x [10240 x i64]]* @A, i64 0, i64 %4, i64 %3, !dbg !113
  %_p_scalar_.i.1 = load i64, i64* %scevgep.i.1, align 8, !dbg !113, !alias.scope !114, !noalias !116
  %scevgep51.i.1 = getelementptr [10240 x [10240 x i64]], [10240 x [10240 x i64]]* @B, i64 0, i64 %4, i64 %3, !dbg !113
  %_p_scalar_52.i.1 = load i64, i64* %scevgep51.i.1, align 8, !dbg !113, !alias.scope !117, !noalias !119
  %p_add.i.1 = add nsw i64 %_p_scalar_52.i.1, %_p_scalar_.i.1, !dbg !120
  %scevgep53.i.1 = getelementptr [10240 x [10240 x i64]], [10240 x [10240 x i64]]* @C, i64 0, i64 %4, i64 %3, !dbg !113
  store i64 %p_add.i.1, i64* %scevgep53.i.1, align 8, !dbg !113, !alias.scope !118, !noalias !122
  %polly.indvar_next49.i.1 = add nsw i64 %polly.indvar48.i, 2, !dbg !113
  %exitcond.i7.1 = icmp eq i64 %polly.indvar_next49.i.1, 32, !dbg !113
  br i1 %exitcond.i7.1, label %polly.loop_exit47.i, label %polly.loop_header45.i, !dbg !113

polly.loop_preheader46.i:                         ; preds = %polly.loop_preheader40.i, %polly.loop_exit47.i
  %polly.indvar42.i = phi i64 [ 0, %polly.loop_preheader40.i ], [ %polly.indvar_next43.i, %polly.loop_exit47.i ], !dbg !113
  %4 = add nuw nsw i64 %polly.indvar42.i, %0, !dbg !113
  br label %polly.loop_header45.i, !dbg !113

mat_add.exit:                                     ; preds = %polly.loop_exit35.i
  %5 = load i64, i64* getelementptr inbounds ([10240 x [10240 x i64]], [10240 x [10240 x i64]]* @C, i64 0, i64 10239, i64 10239), align 8, !dbg !123, !tbaa !56
  %call = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([51 x i8], [51 x i8]* @.str.2, i64 0, i64 0), i32 10240, i32 10240, i32 10239, i32 10239, i64 %5), !dbg !124
  ret i32 0, !dbg !125
}

; Function Attrs: nounwind
declare i32 @printf(i8* nocapture readonly, ...) #2

; Function Attrs: nounwind readnone
declare void @llvm.dbg.value(metadata, i64, metadata, metadata) #3

; Function Attrs: nounwind
declare i32 @fputc(i32, %struct._IO_FILE* nocapture) #4

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "polly-optimized" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind readnone }
attributes #4 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!39, !40}
!llvm.ident = !{!41}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 3.9.0 (http://llvm.org/git/clang.git e177b4a63ca92c5fec010986944530688e104074) (http://llvm.org/git/llvm.git fcd97ccb03712372fe95f1732638de5ed3fcabe8)", isOptimized: true, runtimeVersion: 0, emissionKind: 1, enums: !2, subprograms: !3, globals: !31)
!1 = !DIFile(filename: "MatrixAdd.c", directory: "/home/sam/workspace/WhileyOpenCL/polly/MatrixAdd/impl/handwritten")
!2 = !{}
!3 = !{!4, !11, !16, !20}
!4 = distinct !DISubprogram(name: "init_array", scope: !1, file: !1, line: 7, type: !5, isLocal: false, isDefinition: true, scopeLine: 8, isOptimized: true, variables: !7)
!5 = !DISubroutineType(types: !6)
!6 = !{null}
!7 = !{!8, !10}
!8 = !DILocalVariable(name: "i", scope: !4, file: !1, line: 9, type: !9)
!9 = !DIBasicType(name: "int", size: 32, align: 32, encoding: DW_ATE_signed)
!10 = !DILocalVariable(name: "j", scope: !4, file: !1, line: 9, type: !9)
!11 = distinct !DISubprogram(name: "mat_add", scope: !1, file: !1, line: 19, type: !5, isLocal: false, isDefinition: true, scopeLine: 19, isOptimized: true, variables: !12)
!12 = !{!13, !14, !15}
!13 = !DILocalVariable(name: "i", scope: !11, file: !1, line: 20, type: !9)
!14 = !DILocalVariable(name: "j", scope: !11, file: !1, line: 20, type: !9)
!15 = !DILocalVariable(name: "k", scope: !11, file: !1, line: 20, type: !9)
!16 = distinct !DISubprogram(name: "print_array", scope: !1, file: !1, line: 29, type: !5, isLocal: false, isDefinition: true, scopeLine: 30, isOptimized: true, variables: !17)
!17 = !{!18, !19}
!18 = !DILocalVariable(name: "i", scope: !16, file: !1, line: 31, type: !9)
!19 = !DILocalVariable(name: "j", scope: !16, file: !1, line: 31, type: !9)
!20 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 42, type: !21, isLocal: false, isDefinition: true, scopeLine: 43, isOptimized: true, variables: !23)
!21 = !DISubroutineType(types: !22)
!22 = !{!9}
!23 = !{!24, !25, !26, !27, !29, !30}
!24 = !DILocalVariable(name: "i", scope: !20, file: !1, line: 44, type: !9)
!25 = !DILocalVariable(name: "j", scope: !20, file: !1, line: 44, type: !9)
!26 = !DILocalVariable(name: "k", scope: !20, file: !1, line: 44, type: !9)
!27 = !DILocalVariable(name: "t_start", scope: !20, file: !1, line: 45, type: !28)
!28 = !DIBasicType(name: "double", size: 64, align: 64, encoding: DW_ATE_float)
!29 = !DILocalVariable(name: "t_end", scope: !20, file: !1, line: 45, type: !28)
!30 = !DILocalVariable(name: "r", scope: !20, file: !1, line: 47, type: !9)
!31 = !{!32, !37, !38}
!32 = !DIGlobalVariable(name: "A", scope: !0, file: !1, line: 3, type: !33, isLocal: false, isDefinition: true, variable: [10240 x [10240 x i64]]* @A)
!33 = !DICompositeType(tag: DW_TAG_array_type, baseType: !34, size: 6710886400, align: 64, elements: !35)
!34 = !DIBasicType(name: "long long int", size: 64, align: 64, encoding: DW_ATE_signed)
!35 = !{!36, !36}
!36 = !DISubrange(count: 10240)
!37 = !DIGlobalVariable(name: "B", scope: !0, file: !1, line: 4, type: !33, isLocal: false, isDefinition: true, variable: [10240 x [10240 x i64]]* @B)
!38 = !DIGlobalVariable(name: "C", scope: !0, file: !1, line: 5, type: !33, isLocal: false, isDefinition: true, variable: [10240 x [10240 x i64]]* @C)
!39 = !{i32 2, !"Dwarf Version", i32 4}
!40 = !{i32 2, !"Debug Info Version", i32 3}
!41 = !{!"clang version 3.9.0 (http://llvm.org/git/clang.git e177b4a63ca92c5fec010986944530688e104074) (http://llvm.org/git/llvm.git fcd97ccb03712372fe95f1732638de5ed3fcabe8)"}
!42 = !DIExpression()
!43 = !DILocation(line: 9, column: 9, scope: !4)
!44 = !DILocation(line: 11, column: 5, scope: !45)
!45 = !DILexicalBlockFile(scope: !46, file: !1, discriminator: 1)
!46 = distinct !DILexicalBlock(scope: !47, file: !1, line: 11, column: 5)
!47 = distinct !DILexicalBlock(scope: !4, file: !1, line: 11, column: 5)
!48 = !DILocation(line: 12, column: 9, scope: !49)
!49 = !DILexicalBlockFile(scope: !50, file: !1, discriminator: 1)
!50 = distinct !DILexicalBlock(scope: !51, file: !1, line: 12, column: 9)
!51 = distinct !DILexicalBlock(scope: !52, file: !1, line: 12, column: 9)
!52 = distinct !DILexicalBlock(scope: !46, file: !1, line: 11, column: 25)
!53 = !DILocation(line: 13, column: 13, scope: !54)
!54 = distinct !DILexicalBlock(scope: !50, file: !1, line: 12, column: 29)
!55 = !DILocation(line: 13, column: 21, scope: !54)
!56 = !{!57, !57, i64 0}
!57 = !{!"long long", !58, i64 0}
!58 = !{!"omnipotent char", !59, i64 0}
!59 = !{!"Simple C/C++ TBAA"}
!60 = !DILocation(line: 14, column: 13, scope: !54)
!61 = !DILocation(line: 14, column: 21, scope: !54)
!62 = !DILocation(line: 17, column: 1, scope: !4)
!63 = !DILocation(line: 20, column: 9, scope: !11)
!64 = !DILocation(line: 27, column: 1, scope: !11)
!65 = distinct !{!65, !66, !"polly.alias.scope.A"}
!66 = distinct !{!66, !"polly.alias.scope.domain"}
!67 = !{!68, !69}
!68 = distinct !{!68, !66, !"polly.alias.scope.B"}
!69 = distinct !{!69, !66, !"polly.alias.scope.C"}
!70 = !{!65, !69}
!71 = !DILocation(line: 23, column: 31, scope: !72)
!72 = distinct !DILexicalBlock(scope: !73, file: !1, line: 22, column: 29)
!73 = distinct !DILexicalBlock(scope: !74, file: !1, line: 22, column: 9)
!74 = distinct !DILexicalBlock(scope: !75, file: !1, line: 22, column: 9)
!75 = distinct !DILexicalBlock(scope: !76, file: !1, line: 21, column: 25)
!76 = distinct !DILexicalBlock(scope: !77, file: !1, line: 21, column: 5)
!77 = distinct !DILexicalBlock(scope: !11, file: !1, line: 21, column: 5)
!78 = !{!68, !65}
!79 = !DILocation(line: 31, column: 9, scope: !16)
!80 = !DILocation(line: 33, column: 5, scope: !81)
!81 = !DILexicalBlockFile(scope: !82, file: !1, discriminator: 1)
!82 = distinct !DILexicalBlock(scope: !83, file: !1, line: 33, column: 5)
!83 = distinct !DILexicalBlock(scope: !16, file: !1, line: 33, column: 5)
!84 = !DILocation(line: 35, column: 21, scope: !85)
!85 = distinct !DILexicalBlock(scope: !86, file: !1, line: 34, column: 29)
!86 = distinct !DILexicalBlock(scope: !87, file: !1, line: 34, column: 9)
!87 = distinct !DILexicalBlock(scope: !88, file: !1, line: 34, column: 9)
!88 = distinct !DILexicalBlock(scope: !82, file: !1, line: 33, column: 25)
!89 = !{!90, !90, i64 0}
!90 = !{!"any pointer", !58, i64 0}
!91 = !DILocation(line: 34, column: 9, scope: !92)
!92 = !DILexicalBlockFile(scope: !86, file: !1, discriminator: 1)
!93 = !DILocation(line: 35, column: 38, scope: !85)
!94 = !DILocation(line: 35, column: 13, scope: !85)
!95 = !DILocation(line: 36, column: 18, scope: !96)
!96 = distinct !DILexicalBlock(scope: !85, file: !1, line: 36, column: 17)
!97 = !DILocation(line: 36, column: 22, scope: !96)
!98 = !DILocation(line: 36, column: 17, scope: !85)
!99 = !DILocation(line: 36, column: 37, scope: !100)
!100 = !DILexicalBlockFile(scope: !96, file: !1, discriminator: 1)
!101 = !DILocation(line: 36, column: 29, scope: !100)
!102 = !DILocation(line: 38, column: 9, scope: !88)
!103 = !DILocation(line: 40, column: 1, scope: !16)
!104 = !DILocation(line: 9, column: 9, scope: !4, inlinedAt: !105)
!105 = distinct !DILocation(line: 49, column: 5, scope: !20)
!106 = !DILocation(line: 11, column: 5, scope: !45, inlinedAt: !105)
!107 = !DILocation(line: 49, column: 5, scope: !20)
!108 = !DILocation(line: 12, column: 9, scope: !49, inlinedAt: !105)
!109 = !DILocation(line: 13, column: 13, scope: !54, inlinedAt: !105)
!110 = !DILocation(line: 13, column: 21, scope: !54, inlinedAt: !105)
!111 = !DILocation(line: 14, column: 13, scope: !54, inlinedAt: !105)
!112 = !DILocation(line: 14, column: 21, scope: !54, inlinedAt: !105)
!113 = !DILocation(line: 50, column: 5, scope: !20)
!114 = distinct !{!114, !115, !"polly.alias.scope.A"}
!115 = distinct !{!115, !"polly.alias.scope.domain"}
!116 = !{!117, !118}
!117 = distinct !{!117, !115, !"polly.alias.scope.B"}
!118 = distinct !{!118, !115, !"polly.alias.scope.C"}
!119 = !{!114, !118}
!120 = !DILocation(line: 23, column: 31, scope: !72, inlinedAt: !121)
!121 = distinct !DILocation(line: 50, column: 5, scope: !20)
!122 = !{!117, !114}
!123 = !DILocation(line: 53, column: 83, scope: !20)
!124 = !DILocation(line: 53, column: 5, scope: !20)
!125 = !DILocation(line: 54, column: 5, scope: !20)
