; ModuleID = 'MatrixAdd.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@A = common global [10240 x [10240 x i32]] zeroinitializer, align 16
@B = common global [10240 x [10240 x i32]] zeroinitializer, align 16
@C = common global [10240 x [10240 x i32]] zeroinitializer, align 16
@.str = private unnamed_addr constant [4 x i8] c"%d \00", align 1
@.str.2 = private unnamed_addr constant [49 x i8] c"Pass %d X %d matrix test case (C[%d][%d] =%d) \0A \00", align 1

; Function Attrs: nounwind uwtable
define void @init() #0 !dbg !6 {
entry:
  %t = alloca i64, align 8
  %0 = bitcast i64* %t to i8*, !dbg !52
  call void @llvm.lifetime.start(i64 8, i8* %0) #5, !dbg !52
  tail call void @llvm.dbg.value(metadata i64* %t, i64 0, metadata !13, metadata !53), !dbg !54
  %call = call i64 @time(i64* nonnull %t) #5, !dbg !55
  %conv = trunc i64 %call to i32, !dbg !56
  call void @srand(i32 %conv) #5, !dbg !57
  call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !10, metadata !59), !dbg !60
  br label %for.cond2.preheader, !dbg !61

for.cond2.preheader:                              ; preds = %for.inc22, %entry
  %indvars.iv41 = phi i64 [ 0, %entry ], [ %indvars.iv.next42, %for.inc22 ]
  br label %for.body5, !dbg !63

for.body5:                                        ; preds = %for.body5, %for.cond2.preheader
  %indvars.iv = phi i64 [ 0, %for.cond2.preheader ], [ %indvars.iv.next, %for.body5 ]
  %call6 = call i32 @rand() #5, !dbg !65
  %rem = srem i32 %call6, 100, !dbg !67
  call void @llvm.dbg.value(metadata i32 %rem, i64 0, metadata !19, metadata !59), !dbg !68
  %arrayidx8 = getelementptr inbounds [10240 x [10240 x i32]], [10240 x [10240 x i32]]* @A, i64 0, i64 %indvars.iv41, i64 %indvars.iv, !dbg !69
  %1 = load i32, i32* %arrayidx8, align 4, !dbg !69, !tbaa !70
  %add = add nsw i32 %1, %rem, !dbg !74
  store i32 %add, i32* %arrayidx8, align 4, !dbg !75, !tbaa !70
  %arrayidx16 = getelementptr inbounds [10240 x [10240 x i32]], [10240 x [10240 x i32]]* @B, i64 0, i64 %indvars.iv41, i64 %indvars.iv, !dbg !76
  %2 = load i32, i32* %arrayidx16, align 4, !dbg !76, !tbaa !70
  %add17 = sub nsw i32 100, %rem, !dbg !77
  %sub = add i32 %add17, %2, !dbg !78
  store i32 %sub, i32* %arrayidx16, align 4, !dbg !79, !tbaa !70
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1, !dbg !63
  %exitcond = icmp eq i64 %indvars.iv.next, 10240, !dbg !63
  br i1 %exitcond, label %for.inc22, label %for.body5, !dbg !63

for.inc22:                                        ; preds = %for.body5
  %indvars.iv.next42 = add nuw nsw i64 %indvars.iv41, 1, !dbg !61
  %exitcond43 = icmp eq i64 %indvars.iv.next42, 10240, !dbg !61
  br i1 %exitcond43, label %for.end24, label %for.cond2.preheader, !dbg !61

for.end24:                                        ; preds = %for.inc22
  call void @llvm.lifetime.end(i64 8, i8* %0) #5, !dbg !80
  ret void, !dbg !80
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
define void @mat_add() #3 !dbg !26 {
entry:
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !28, metadata !59), !dbg !81
  br label %polly.loop_preheader34

polly.exiting:                                    ; preds = %polly.loop_exit35
  ret void, !dbg !82

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
  %_p_scalar_ = load i32, i32* %scevgep, align 8, !alias.scope !83, !noalias !85
  %scevgep51 = getelementptr [10240 x [10240 x i32]], [10240 x [10240 x i32]]* @B, i64 0, i64 %4, i64 %2
  %_p_scalar_52 = load i32, i32* %scevgep51, align 8, !alias.scope !87, !noalias !88
  %p_add = add nsw i32 %_p_scalar_52, %_p_scalar_, !dbg !89
  %scevgep53 = getelementptr [10240 x [10240 x i32]], [10240 x [10240 x i32]]* @C, i64 0, i64 %4, i64 %2
  store i32 %p_add, i32* %scevgep53, align 8, !alias.scope !86, !noalias !96
  %polly.indvar_next49 = or i64 %polly.indvar48, 1
  %3 = add nuw nsw i64 %polly.indvar_next49, %1
  %scevgep.1 = getelementptr [10240 x [10240 x i32]], [10240 x [10240 x i32]]* @A, i64 0, i64 %4, i64 %3
  %_p_scalar_.1 = load i32, i32* %scevgep.1, align 4, !alias.scope !83, !noalias !85
  %scevgep51.1 = getelementptr [10240 x [10240 x i32]], [10240 x [10240 x i32]]* @B, i64 0, i64 %4, i64 %3
  %_p_scalar_52.1 = load i32, i32* %scevgep51.1, align 4, !alias.scope !87, !noalias !88
  %p_add.1 = add nsw i32 %_p_scalar_52.1, %_p_scalar_.1, !dbg !89
  %scevgep53.1 = getelementptr [10240 x [10240 x i32]], [10240 x [10240 x i32]]* @C, i64 0, i64 %4, i64 %3
  store i32 %p_add.1, i32* %scevgep53.1, align 4, !alias.scope !86, !noalias !96
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
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !33, metadata !59), !dbg !97
  br label %for.cond1.preheader, !dbg !98

for.cond1.preheader:                              ; preds = %for.end, %entry
  %indvars.iv22 = phi i64 [ 0, %entry ], [ %indvars.iv.next23, %for.end ]
  br label %for.body3, !dbg !102

for.body3:                                        ; preds = %for.inc, %for.cond1.preheader
  %indvars.iv = phi i64 [ 0, %for.cond1.preheader ], [ %indvars.iv.next, %for.inc ]
  %arrayidx5 = getelementptr inbounds [10240 x [10240 x i32]], [10240 x [10240 x i32]]* @C, i64 0, i64 %indvars.iv22, i64 %indvars.iv, !dbg !107
  %0 = load i32, i32* %arrayidx5, align 4, !dbg !107, !tbaa !70
  %call = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str, i64 0, i64 0), i32 %0), !dbg !109
  %1 = trunc i64 %indvars.iv to i32, !dbg !110
  %rem = srem i32 %1, 80, !dbg !110
  %cmp6 = icmp eq i32 %rem, 79, !dbg !112
  br i1 %cmp6, label %if.then, label %for.inc, !dbg !113

if.then:                                          ; preds = %for.body3
  %putchar19 = tail call i32 @putchar(i32 10) #5, !dbg !114
  br label %for.inc, !dbg !114

for.inc:                                          ; preds = %for.body3, %if.then
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1, !dbg !102
  %exitcond = icmp eq i64 %indvars.iv.next, 10240, !dbg !102
  br i1 %exitcond, label %for.end, label %for.body3, !dbg !102

for.end:                                          ; preds = %for.inc
  %putchar = tail call i32 @putchar(i32 10) #5, !dbg !116
  %indvars.iv.next23 = add nuw nsw i64 %indvars.iv22, 1, !dbg !98
  %exitcond24 = icmp eq i64 %indvars.iv.next23, 10240, !dbg !98
  br i1 %exitcond24, label %for.end11, label %for.cond1.preheader, !dbg !98

for.end11:                                        ; preds = %for.end
  ret void, !dbg !117
}

; Function Attrs: nounwind
declare i32 @printf(i8* nocapture readonly, ...) #2

; Function Attrs: nounwind uwtable
define i32 @main() #0 !dbg !35 {
entry:
  %t.i = alloca i64, align 8
  %0 = bitcast i64* %t.i to i8*, !dbg !118
  call void @llvm.lifetime.start(i64 8, i8* %0) #5, !dbg !118
  tail call void @llvm.dbg.value(metadata i64* %t.i, i64 0, metadata !13, metadata !53) #5, !dbg !120
  %call.i = call i64 @time(i64* nonnull %t.i) #5, !dbg !121
  %conv.i = trunc i64 %call.i to i32, !dbg !122
  call void @srand(i32 %conv.i) #5, !dbg !123
  call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !10, metadata !59) #5, !dbg !124
  br label %for.cond2.preheader.i, !dbg !125

for.cond2.preheader.i:                            ; preds = %for.inc22.i, %entry
  %indvars.iv41.i = phi i64 [ 0, %entry ], [ %indvars.iv.next42.i, %for.inc22.i ], !dbg !126
  br label %for.body5.i, !dbg !127

for.body5.i:                                      ; preds = %for.body5.i, %for.cond2.preheader.i
  %indvars.iv.i = phi i64 [ 0, %for.cond2.preheader.i ], [ %indvars.iv.next.i, %for.body5.i ], !dbg !126
  %call6.i = call i32 @rand() #5, !dbg !128
  %rem.i = srem i32 %call6.i, 100, !dbg !129
  call void @llvm.dbg.value(metadata i32 %rem.i, i64 0, metadata !19, metadata !59) #5, !dbg !130
  %arrayidx8.i = getelementptr inbounds [10240 x [10240 x i32]], [10240 x [10240 x i32]]* @A, i64 0, i64 %indvars.iv41.i, i64 %indvars.iv.i, !dbg !131
  %1 = load i32, i32* %arrayidx8.i, align 4, !dbg !131, !tbaa !70
  %add.i = add nsw i32 %1, %rem.i, !dbg !132
  store i32 %add.i, i32* %arrayidx8.i, align 4, !dbg !133, !tbaa !70
  %arrayidx16.i = getelementptr inbounds [10240 x [10240 x i32]], [10240 x [10240 x i32]]* @B, i64 0, i64 %indvars.iv41.i, i64 %indvars.iv.i, !dbg !134
  %2 = load i32, i32* %arrayidx16.i, align 4, !dbg !134, !tbaa !70
  %add17.i = sub nsw i32 100, %rem.i, !dbg !135
  %sub.i = add i32 %add17.i, %2, !dbg !136
  store i32 %sub.i, i32* %arrayidx16.i, align 4, !dbg !137, !tbaa !70
  %indvars.iv.next.i = add nuw nsw i64 %indvars.iv.i, 1, !dbg !127
  %exitcond.i = icmp eq i64 %indvars.iv.next.i, 10240, !dbg !127
  br i1 %exitcond.i, label %for.inc22.i, label %for.body5.i, !dbg !127

for.inc22.i:                                      ; preds = %for.body5.i
  %indvars.iv.next42.i = add nuw nsw i64 %indvars.iv41.i, 1, !dbg !125
  %exitcond43.i = icmp eq i64 %indvars.iv.next42.i, 10240, !dbg !125
  br i1 %exitcond43.i, label %init.exit, label %for.cond2.preheader.i, !dbg !125

init.exit:                                        ; preds = %for.inc22.i
  call void @llvm.lifetime.end(i64 8, i8* %0) #5, !dbg !138
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !28, metadata !59), !dbg !139
  br label %polly.loop_preheader34.i, !dbg !141

polly.loop_exit35.i:                              ; preds = %polly.loop_exit41.i
  %polly.indvar_next.i = add nuw nsw i64 %polly.indvar.i, 1, !dbg !141
  %exitcond56.i = icmp eq i64 %polly.indvar_next.i, 320, !dbg !141
  br i1 %exitcond56.i, label %mat_add.exit, label %polly.loop_preheader34.i, !dbg !141

polly.loop_exit41.i:                              ; preds = %polly.loop_exit47.i
  %polly.indvar_next37.i = add nuw nsw i64 %polly.indvar36.i, 1, !dbg !141
  %exitcond55.i = icmp eq i64 %polly.indvar_next37.i, 320, !dbg !141
  br i1 %exitcond55.i, label %polly.loop_exit35.i, label %polly.loop_preheader40.i, !dbg !141

polly.loop_preheader34.i:                         ; preds = %polly.loop_exit35.i, %init.exit
  %polly.indvar.i = phi i64 [ 0, %init.exit ], [ %polly.indvar_next.i, %polly.loop_exit35.i ], !dbg !141
  %3 = shl nsw i64 %polly.indvar.i, 5, !dbg !141
  br label %polly.loop_preheader40.i, !dbg !141

polly.loop_exit47.i:                              ; preds = %polly.loop_header45.i
  %polly.indvar_next43.i = add nuw nsw i64 %polly.indvar42.i, 1, !dbg !141
  %exitcond54.i = icmp eq i64 %polly.indvar_next43.i, 32, !dbg !141
  br i1 %exitcond54.i, label %polly.loop_exit41.i, label %polly.loop_preheader46.i, !dbg !141

polly.loop_preheader40.i:                         ; preds = %polly.loop_preheader34.i, %polly.loop_exit41.i
  %polly.indvar36.i = phi i64 [ 0, %polly.loop_preheader34.i ], [ %polly.indvar_next37.i, %polly.loop_exit41.i ], !dbg !141
  %4 = shl nsw i64 %polly.indvar36.i, 5, !dbg !141
  br label %polly.loop_preheader46.i, !dbg !141

polly.loop_header45.i:                            ; preds = %polly.loop_header45.i, %polly.loop_preheader46.i
  %polly.indvar48.i = phi i64 [ 0, %polly.loop_preheader46.i ], [ %polly.indvar_next49.i.1, %polly.loop_header45.i ], !dbg !141
  %5 = add nuw nsw i64 %polly.indvar48.i, %4, !dbg !141
  %scevgep.i = getelementptr [10240 x [10240 x i32]], [10240 x [10240 x i32]]* @A, i64 0, i64 %7, i64 %5, !dbg !141
  %_p_scalar_.i = load i32, i32* %scevgep.i, align 8, !dbg !141, !alias.scope !142, !noalias !144
  %scevgep51.i = getelementptr [10240 x [10240 x i32]], [10240 x [10240 x i32]]* @B, i64 0, i64 %7, i64 %5, !dbg !141
  %_p_scalar_52.i = load i32, i32* %scevgep51.i, align 8, !dbg !141, !alias.scope !146, !noalias !147
  %p_add.i = add nsw i32 %_p_scalar_52.i, %_p_scalar_.i, !dbg !148
  %scevgep53.i = getelementptr [10240 x [10240 x i32]], [10240 x [10240 x i32]]* @C, i64 0, i64 %7, i64 %5, !dbg !141
  store i32 %p_add.i, i32* %scevgep53.i, align 8, !dbg !141, !alias.scope !145, !noalias !149
  %polly.indvar_next49.i = or i64 %polly.indvar48.i, 1, !dbg !141
  %6 = add nuw nsw i64 %polly.indvar_next49.i, %4, !dbg !141
  %scevgep.i.1 = getelementptr [10240 x [10240 x i32]], [10240 x [10240 x i32]]* @A, i64 0, i64 %7, i64 %6, !dbg !141
  %_p_scalar_.i.1 = load i32, i32* %scevgep.i.1, align 4, !dbg !141, !alias.scope !142, !noalias !144
  %scevgep51.i.1 = getelementptr [10240 x [10240 x i32]], [10240 x [10240 x i32]]* @B, i64 0, i64 %7, i64 %6, !dbg !141
  %_p_scalar_52.i.1 = load i32, i32* %scevgep51.i.1, align 4, !dbg !141, !alias.scope !146, !noalias !147
  %p_add.i.1 = add nsw i32 %_p_scalar_52.i.1, %_p_scalar_.i.1, !dbg !148
  %scevgep53.i.1 = getelementptr [10240 x [10240 x i32]], [10240 x [10240 x i32]]* @C, i64 0, i64 %7, i64 %6, !dbg !141
  store i32 %p_add.i.1, i32* %scevgep53.i.1, align 4, !dbg !141, !alias.scope !145, !noalias !149
  %polly.indvar_next49.i.1 = add nsw i64 %polly.indvar48.i, 2, !dbg !141
  %exitcond.i4.1 = icmp eq i64 %polly.indvar_next49.i.1, 32, !dbg !141
  br i1 %exitcond.i4.1, label %polly.loop_exit47.i, label %polly.loop_header45.i, !dbg !141

polly.loop_preheader46.i:                         ; preds = %polly.loop_preheader40.i, %polly.loop_exit47.i
  %polly.indvar42.i = phi i64 [ 0, %polly.loop_preheader40.i ], [ %polly.indvar_next43.i, %polly.loop_exit47.i ], !dbg !141
  %7 = add nuw nsw i64 %polly.indvar42.i, %3, !dbg !141
  br label %polly.loop_header45.i, !dbg !141

mat_add.exit:                                     ; preds = %polly.loop_exit35.i
  %8 = load i32, i32* getelementptr inbounds ([10240 x [10240 x i32]], [10240 x [10240 x i32]]* @C, i64 0, i64 10239, i64 10239), align 4, !dbg !150, !tbaa !70
  %call = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([49 x i8], [49 x i8]* @.str.2, i64 0, i64 0), i32 10240, i32 10240, i32 10239, i32 10239, i32 %8), !dbg !151
  ret i32 0, !dbg !152
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.value(metadata, i64, metadata, metadata) #4

declare i32 @putchar(i32)

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { argmemonly nounwind }
attributes #2 = { nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "polly-optimized" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind readnone }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!49, !50}
!llvm.ident = !{!51}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 3.9.0 (http://llvm.org/git/clang.git e177b4a63ca92c5fec010986944530688e104074) (http://llvm.org/git/llvm.git fcd97ccb03712372fe95f1732638de5ed3fcabe8)", isOptimized: true, runtimeVersion: 0, emissionKind: 1, enums: !2, retainedTypes: !3, subprograms: !5, globals: !42)
!1 = !DIFile(filename: "MatrixAdd.c", directory: "/home/sam/workspace/WhileyOpenCL/polly/MatrixAdd/impl/handwritten")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, align: 32, encoding: DW_ATE_unsigned)
!5 = !{!6, !26, !31, !35}
!6 = distinct !DISubprogram(name: "init", scope: !1, file: !1, line: 7, type: !7, isLocal: false, isDefinition: true, scopeLine: 8, isOptimized: true, variables: !9)
!7 = !DISubroutineType(types: !8)
!8 = !{null}
!9 = !{!10, !12, !13, !19}
!10 = !DILocalVariable(name: "i", scope: !6, file: !1, line: 9, type: !11)
!11 = !DIBasicType(name: "int", size: 32, align: 32, encoding: DW_ATE_signed)
!12 = !DILocalVariable(name: "j", scope: !6, file: !1, line: 10, type: !11)
!13 = !DILocalVariable(name: "t", scope: !6, file: !1, line: 11, type: !14)
!14 = !DIDerivedType(tag: DW_TAG_typedef, name: "time_t", file: !15, line: 75, baseType: !16)
!15 = !DIFile(filename: "/usr/include/time.h", directory: "/home/sam/workspace/WhileyOpenCL/polly/MatrixAdd/impl/handwritten")
!16 = !DIDerivedType(tag: DW_TAG_typedef, name: "__time_t", file: !17, line: 139, baseType: !18)
!17 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types.h", directory: "/home/sam/workspace/WhileyOpenCL/polly/MatrixAdd/impl/handwritten")
!18 = !DIBasicType(name: "long int", size: 64, align: 64, encoding: DW_ATE_signed)
!19 = !DILocalVariable(name: "r", scope: !20, file: !1, line: 16, type: !11)
!20 = distinct !DILexicalBlock(scope: !21, file: !1, line: 15, column: 29)
!21 = distinct !DILexicalBlock(scope: !22, file: !1, line: 15, column: 9)
!22 = distinct !DILexicalBlock(scope: !23, file: !1, line: 15, column: 9)
!23 = distinct !DILexicalBlock(scope: !24, file: !1, line: 14, column: 25)
!24 = distinct !DILexicalBlock(scope: !25, file: !1, line: 14, column: 5)
!25 = distinct !DILexicalBlock(scope: !6, file: !1, line: 14, column: 5)
!26 = distinct !DISubprogram(name: "mat_add", scope: !1, file: !1, line: 23, type: !7, isLocal: false, isDefinition: true, scopeLine: 23, isOptimized: true, variables: !27)
!27 = !{!28, !29, !30}
!28 = !DILocalVariable(name: "i", scope: !26, file: !1, line: 24, type: !11)
!29 = !DILocalVariable(name: "j", scope: !26, file: !1, line: 24, type: !11)
!30 = !DILocalVariable(name: "k", scope: !26, file: !1, line: 24, type: !11)
!31 = distinct !DISubprogram(name: "print_array", scope: !1, file: !1, line: 32, type: !7, isLocal: false, isDefinition: true, scopeLine: 33, isOptimized: true, variables: !32)
!32 = !{!33, !34}
!33 = !DILocalVariable(name: "i", scope: !31, file: !1, line: 34, type: !11)
!34 = !DILocalVariable(name: "j", scope: !31, file: !1, line: 34, type: !11)
!35 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 45, type: !36, isLocal: false, isDefinition: true, scopeLine: 46, isOptimized: true, variables: !38)
!36 = !DISubroutineType(types: !37)
!37 = !{!11}
!38 = !{!39, !40, !41}
!39 = !DILocalVariable(name: "i", scope: !35, file: !1, line: 47, type: !11)
!40 = !DILocalVariable(name: "j", scope: !35, file: !1, line: 47, type: !11)
!41 = !DILocalVariable(name: "k", scope: !35, file: !1, line: 47, type: !11)
!42 = !{!43, !47, !48}
!43 = !DIGlobalVariable(name: "A", scope: !0, file: !1, line: 3, type: !44, isLocal: false, isDefinition: true, variable: [10240 x [10240 x i32]]* @A)
!44 = !DICompositeType(tag: DW_TAG_array_type, baseType: !11, size: 3355443200, align: 32, elements: !45)
!45 = !{!46, !46}
!46 = !DISubrange(count: 10240)
!47 = !DIGlobalVariable(name: "B", scope: !0, file: !1, line: 4, type: !44, isLocal: false, isDefinition: true, variable: [10240 x [10240 x i32]]* @B)
!48 = !DIGlobalVariable(name: "C", scope: !0, file: !1, line: 5, type: !44, isLocal: false, isDefinition: true, variable: [10240 x [10240 x i32]]* @C)
!49 = !{i32 2, !"Dwarf Version", i32 4}
!50 = !{i32 2, !"Debug Info Version", i32 3}
!51 = !{!"clang version 3.9.0 (http://llvm.org/git/clang.git e177b4a63ca92c5fec010986944530688e104074) (http://llvm.org/git/llvm.git fcd97ccb03712372fe95f1732638de5ed3fcabe8)"}
!52 = !DILocation(line: 11, column: 5, scope: !6)
!53 = !DIExpression(DW_OP_deref)
!54 = !DILocation(line: 11, column: 12, scope: !6)
!55 = !DILocation(line: 13, column: 22, scope: !6)
!56 = !DILocation(line: 13, column: 11, scope: !6)
!57 = !DILocation(line: 13, column: 5, scope: !58)
!58 = !DILexicalBlockFile(scope: !6, file: !1, discriminator: 1)
!59 = !DIExpression()
!60 = !DILocation(line: 9, column: 9, scope: !6)
!61 = !DILocation(line: 14, column: 5, scope: !62)
!62 = !DILexicalBlockFile(scope: !24, file: !1, discriminator: 1)
!63 = !DILocation(line: 15, column: 9, scope: !64)
!64 = !DILexicalBlockFile(scope: !21, file: !1, discriminator: 1)
!65 = !DILocation(line: 16, column: 21, scope: !66)
!66 = !DILexicalBlockFile(scope: !20, file: !1, discriminator: 1)
!67 = !DILocation(line: 16, column: 28, scope: !20)
!68 = !DILocation(line: 16, column: 17, scope: !20)
!69 = !DILocation(line: 17, column: 23, scope: !20)
!70 = !{!71, !71, i64 0}
!71 = !{!"int", !72, i64 0}
!72 = !{!"omnipotent char", !73, i64 0}
!73 = !{!"Simple C/C++ TBAA"}
!74 = !DILocation(line: 17, column: 31, scope: !20)
!75 = !DILocation(line: 17, column: 21, scope: !20)
!76 = !DILocation(line: 18, column: 23, scope: !20)
!77 = !DILocation(line: 18, column: 31, scope: !20)
!78 = !DILocation(line: 18, column: 37, scope: !20)
!79 = !DILocation(line: 18, column: 21, scope: !20)
!80 = !DILocation(line: 21, column: 1, scope: !6)
!81 = !DILocation(line: 24, column: 9, scope: !26)
!82 = !DILocation(line: 30, column: 1, scope: !26)
!83 = distinct !{!83, !84, !"polly.alias.scope.A"}
!84 = distinct !{!84, !"polly.alias.scope.domain"}
!85 = !{!86, !87}
!86 = distinct !{!86, !84, !"polly.alias.scope.C"}
!87 = distinct !{!87, !84, !"polly.alias.scope.B"}
!88 = !{!86, !83}
!89 = !DILocation(line: 27, column: 31, scope: !90)
!90 = distinct !DILexicalBlock(scope: !91, file: !1, line: 26, column: 29)
!91 = distinct !DILexicalBlock(scope: !92, file: !1, line: 26, column: 9)
!92 = distinct !DILexicalBlock(scope: !93, file: !1, line: 26, column: 9)
!93 = distinct !DILexicalBlock(scope: !94, file: !1, line: 25, column: 25)
!94 = distinct !DILexicalBlock(scope: !95, file: !1, line: 25, column: 5)
!95 = distinct !DILexicalBlock(scope: !26, file: !1, line: 25, column: 5)
!96 = !{!87, !83}
!97 = !DILocation(line: 34, column: 9, scope: !31)
!98 = !DILocation(line: 36, column: 5, scope: !99)
!99 = !DILexicalBlockFile(scope: !100, file: !1, discriminator: 1)
!100 = distinct !DILexicalBlock(scope: !101, file: !1, line: 36, column: 5)
!101 = distinct !DILexicalBlock(scope: !31, file: !1, line: 36, column: 5)
!102 = !DILocation(line: 37, column: 9, scope: !103)
!103 = !DILexicalBlockFile(scope: !104, file: !1, discriminator: 1)
!104 = distinct !DILexicalBlock(scope: !105, file: !1, line: 37, column: 9)
!105 = distinct !DILexicalBlock(scope: !106, file: !1, line: 37, column: 9)
!106 = distinct !DILexicalBlock(scope: !100, file: !1, line: 36, column: 25)
!107 = !DILocation(line: 38, column: 27, scope: !108)
!108 = distinct !DILexicalBlock(scope: !104, file: !1, line: 37, column: 29)
!109 = !DILocation(line: 38, column: 13, scope: !108)
!110 = !DILocation(line: 39, column: 18, scope: !111)
!111 = distinct !DILexicalBlock(scope: !108, file: !1, line: 39, column: 17)
!112 = !DILocation(line: 39, column: 22, scope: !111)
!113 = !DILocation(line: 39, column: 17, scope: !108)
!114 = !DILocation(line: 39, column: 29, scope: !115)
!115 = !DILexicalBlockFile(scope: !111, file: !1, discriminator: 1)
!116 = !DILocation(line: 41, column: 9, scope: !106)
!117 = !DILocation(line: 43, column: 1, scope: !31)
!118 = !DILocation(line: 11, column: 5, scope: !6, inlinedAt: !119)
!119 = distinct !DILocation(line: 49, column: 5, scope: !35)
!120 = !DILocation(line: 11, column: 12, scope: !6, inlinedAt: !119)
!121 = !DILocation(line: 13, column: 22, scope: !6, inlinedAt: !119)
!122 = !DILocation(line: 13, column: 11, scope: !6, inlinedAt: !119)
!123 = !DILocation(line: 13, column: 5, scope: !58, inlinedAt: !119)
!124 = !DILocation(line: 9, column: 9, scope: !6, inlinedAt: !119)
!125 = !DILocation(line: 14, column: 5, scope: !62, inlinedAt: !119)
!126 = !DILocation(line: 49, column: 5, scope: !35)
!127 = !DILocation(line: 15, column: 9, scope: !64, inlinedAt: !119)
!128 = !DILocation(line: 16, column: 21, scope: !66, inlinedAt: !119)
!129 = !DILocation(line: 16, column: 28, scope: !20, inlinedAt: !119)
!130 = !DILocation(line: 16, column: 17, scope: !20, inlinedAt: !119)
!131 = !DILocation(line: 17, column: 23, scope: !20, inlinedAt: !119)
!132 = !DILocation(line: 17, column: 31, scope: !20, inlinedAt: !119)
!133 = !DILocation(line: 17, column: 21, scope: !20, inlinedAt: !119)
!134 = !DILocation(line: 18, column: 23, scope: !20, inlinedAt: !119)
!135 = !DILocation(line: 18, column: 31, scope: !20, inlinedAt: !119)
!136 = !DILocation(line: 18, column: 37, scope: !20, inlinedAt: !119)
!137 = !DILocation(line: 18, column: 21, scope: !20, inlinedAt: !119)
!138 = !DILocation(line: 21, column: 1, scope: !6, inlinedAt: !119)
!139 = !DILocation(line: 24, column: 9, scope: !26, inlinedAt: !140)
!140 = distinct !DILocation(line: 50, column: 5, scope: !35)
!141 = !DILocation(line: 50, column: 5, scope: !35)
!142 = distinct !{!142, !143, !"polly.alias.scope.A"}
!143 = distinct !{!143, !"polly.alias.scope.domain"}
!144 = !{!145, !146}
!145 = distinct !{!145, !143, !"polly.alias.scope.C"}
!146 = distinct !{!146, !143, !"polly.alias.scope.B"}
!147 = !{!145, !142}
!148 = !DILocation(line: 27, column: 31, scope: !90, inlinedAt: !140)
!149 = !{!146, !142}
!150 = !DILocation(line: 52, column: 81, scope: !35)
!151 = !DILocation(line: 52, column: 5, scope: !35)
!152 = !DILocation(line: 53, column: 5, scope: !35)
