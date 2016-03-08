; ModuleID = 'MatrixMult.before.none.ll'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@A = common global [512 x [512 x i64]] zeroinitializer, align 16
@B = common global [512 x [512 x i64]] zeroinitializer, align 16
@C = common global [512 x [512 x i64]] zeroinitializer, align 16
@stdout = external global %struct._IO_FILE*, align 8
@.str = private unnamed_addr constant [6 x i8] c"%lld \00", align 1
@.str.2 = private unnamed_addr constant [49 x i8] c"Pass %d X %d matrix test case (C[N][N] =%lld) \0A \00", align 1

; Function Attrs: nounwind uwtable
define void @init_array() #0 !dbg !4 {
entry:
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !24, metadata !25), !dbg !26
  br label %vector.ph, !dbg !27

vector.ph:                                        ; preds = %for.inc10, %entry
  %indvars.iv3 = phi i64 [ 0, %entry ], [ %indvars.iv.next4, %for.inc10 ]
  br label %vector.body, !dbg !31

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next.1, %vector.body ], !dbg !31
  %0 = getelementptr inbounds [512 x [512 x i64]], [512 x [512 x i64]]* @A, i64 0, i64 %indvars.iv3, i64 %index, !dbg !36
  %1 = bitcast i64* %0 to <2 x i64>*, !dbg !38
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %1, align 16, !dbg !38
  %2 = getelementptr i64, i64* %0, i64 2, !dbg !38
  %3 = bitcast i64* %2 to <2 x i64>*, !dbg !38
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %3, align 16, !dbg !38
  %4 = getelementptr inbounds [512 x [512 x i64]], [512 x [512 x i64]]* @B, i64 0, i64 %indvars.iv3, i64 %index, !dbg !39
  %5 = bitcast i64* %4 to <2 x i64>*, !dbg !40
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %5, align 16, !dbg !40
  %6 = getelementptr i64, i64* %4, i64 2, !dbg !40
  %7 = bitcast i64* %6 to <2 x i64>*, !dbg !40
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %7, align 16, !dbg !40
  %index.next = or i64 %index, 4, !dbg !31
  %8 = getelementptr inbounds [512 x [512 x i64]], [512 x [512 x i64]]* @A, i64 0, i64 %indvars.iv3, i64 %index.next, !dbg !36
  %9 = bitcast i64* %8 to <2 x i64>*, !dbg !38
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %9, align 16, !dbg !38
  %10 = getelementptr i64, i64* %8, i64 2, !dbg !38
  %11 = bitcast i64* %10 to <2 x i64>*, !dbg !38
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %11, align 16, !dbg !38
  %12 = getelementptr inbounds [512 x [512 x i64]], [512 x [512 x i64]]* @B, i64 0, i64 %indvars.iv3, i64 %index.next, !dbg !39
  %13 = bitcast i64* %12 to <2 x i64>*, !dbg !40
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %13, align 16, !dbg !40
  %14 = getelementptr i64, i64* %12, i64 2, !dbg !40
  %15 = bitcast i64* %14 to <2 x i64>*, !dbg !40
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %15, align 16, !dbg !40
  %index.next.1 = add nsw i64 %index, 8, !dbg !31
  %16 = icmp eq i64 %index.next.1, 512, !dbg !31
  br i1 %16, label %for.inc10, label %vector.body, !dbg !31, !llvm.loop !41

for.inc10:                                        ; preds = %vector.body
  %indvars.iv.next4 = add nuw nsw i64 %indvars.iv3, 1, !dbg !27
  %exitcond5 = icmp eq i64 %indvars.iv.next4, 512, !dbg !27
  br i1 %exitcond5, label %for.end12, label %vector.ph, !dbg !27

for.end12:                                        ; preds = %for.inc10
  ret void, !dbg !44
}

; Function Attrs: nounwind uwtable
define void @mat_mult() #0 !dbg !7 {
entry:
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !45, metadata !25), !dbg !46
  br label %for.cond1.preheader, !dbg !47

for.cond1.preheader:                              ; preds = %for.inc28, %entry
  %indvars.iv7 = phi i64 [ 0, %entry ], [ %indvars.iv.next8, %for.inc28 ]
  br label %for.body3, !dbg !51

for.body3:                                        ; preds = %for.inc25, %for.cond1.preheader
  %indvars.iv4 = phi i64 [ 0, %for.cond1.preheader ], [ %indvars.iv.next5, %for.inc25 ]
  %arrayidx5 = getelementptr inbounds [512 x [512 x i64]], [512 x [512 x i64]]* @C, i64 0, i64 %indvars.iv7, i64 %indvars.iv4, !dbg !56
  store i64 0, i64* %arrayidx5, align 8, !dbg !58
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !59, metadata !25), !dbg !60
  br label %for.body8, !dbg !61

for.body8:                                        ; preds = %for.body8, %for.body3
  %add1 = phi i64 [ 0, %for.body3 ], [ %add.1, %for.body8 ], !dbg !65
  %indvars.iv = phi i64 [ 0, %for.body3 ], [ %indvars.iv.next.1, %for.body8 ]
  %arrayidx16 = getelementptr inbounds [512 x [512 x i64]], [512 x [512 x i64]]* @A, i64 0, i64 %indvars.iv7, i64 %indvars.iv, !dbg !66
  %0 = load i64, i64* %arrayidx16, align 16, !dbg !66
  %arrayidx20 = getelementptr inbounds [512 x [512 x i64]], [512 x [512 x i64]]* @B, i64 0, i64 %indvars.iv, i64 %indvars.iv4, !dbg !67
  %1 = load i64, i64* %arrayidx20, align 8, !dbg !67
  %mul = mul nsw i64 %1, %0, !dbg !68
  %add = add nsw i64 %mul, %add1, !dbg !69
  %indvars.iv.next = or i64 %indvars.iv, 1, !dbg !61
  %arrayidx16.1 = getelementptr inbounds [512 x [512 x i64]], [512 x [512 x i64]]* @A, i64 0, i64 %indvars.iv7, i64 %indvars.iv.next, !dbg !66
  %2 = load i64, i64* %arrayidx16.1, align 8, !dbg !66
  %arrayidx20.1 = getelementptr inbounds [512 x [512 x i64]], [512 x [512 x i64]]* @B, i64 0, i64 %indvars.iv.next, i64 %indvars.iv4, !dbg !67
  %3 = load i64, i64* %arrayidx20.1, align 8, !dbg !67
  %mul.1 = mul nsw i64 %3, %2, !dbg !68
  %add.1 = add nsw i64 %mul.1, %add, !dbg !69
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2, !dbg !61
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 512, !dbg !61
  br i1 %exitcond.1, label %for.inc25, label %for.body8, !dbg !61

for.inc25:                                        ; preds = %for.body8
  %add.1.lcssa = phi i64 [ %add.1, %for.body8 ]
  store i64 %add.1.lcssa, i64* %arrayidx5, align 8, !dbg !70
  %indvars.iv.next5 = add nuw nsw i64 %indvars.iv4, 1, !dbg !51
  %exitcond6 = icmp eq i64 %indvars.iv.next5, 512, !dbg !51
  br i1 %exitcond6, label %for.inc28, label %for.body3, !dbg !51

for.inc28:                                        ; preds = %for.inc25
  %indvars.iv.next8 = add nuw nsw i64 %indvars.iv7, 1, !dbg !47
  %exitcond9 = icmp eq i64 %indvars.iv.next8, 512, !dbg !47
  br i1 %exitcond9, label %for.end30, label %for.cond1.preheader, !dbg !47

for.end30:                                        ; preds = %for.inc28
  ret void, !dbg !71
}

; Function Attrs: nounwind uwtable
define void @print_array() #0 !dbg !8 {
entry:
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !72, metadata !25), !dbg !73
  br label %for.cond1.preheader, !dbg !74

for.cond1.preheader:                              ; preds = %for.end, %entry
  %indvars.iv6 = phi i64 [ 0, %entry ], [ %indvars.iv.next7, %for.end ]
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 8, !dbg !78
  br label %for.body3, !dbg !83

for.body3:                                        ; preds = %for.inc, %for.cond1.preheader
  %indvars.iv = phi i64 [ 0, %for.cond1.preheader ], [ %indvars.iv.next, %for.inc ]
  %1 = phi %struct._IO_FILE* [ %0, %for.cond1.preheader ], [ %5, %for.inc ]
  %arrayidx5 = getelementptr inbounds [512 x [512 x i64]], [512 x [512 x i64]]* @C, i64 0, i64 %indvars.iv6, i64 %indvars.iv, !dbg !85
  %2 = load i64, i64* %arrayidx5, align 8, !dbg !85
  %call = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %1, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str, i64 0, i64 0), i64 %2) #3, !dbg !86
  %3 = trunc i64 %indvars.iv to i32, !dbg !87
  %rem = srem i32 %3, 80, !dbg !87
  %cmp6 = icmp eq i32 %rem, 79, !dbg !89
  br i1 %cmp6, label %if.then, label %for.inc, !dbg !90

if.then:                                          ; preds = %for.body3
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 8, !dbg !91
  %fputc3 = tail call i32 @fputc(i32 10, %struct._IO_FILE* %4), !dbg !93
  br label %for.inc, !dbg !93

for.inc:                                          ; preds = %if.then, %for.body3
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1, !dbg !83
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 8, !dbg !78
  %exitcond = icmp eq i64 %indvars.iv.next, 512, !dbg !83
  br i1 %exitcond, label %for.end, label %for.body3, !dbg !83

for.end:                                          ; preds = %for.inc
  %.lcssa = phi %struct._IO_FILE* [ %5, %for.inc ]
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %.lcssa), !dbg !94
  %indvars.iv.next7 = add nuw nsw i64 %indvars.iv6, 1, !dbg !74
  %exitcond8 = icmp eq i64 %indvars.iv.next7, 512, !dbg !74
  br i1 %exitcond8, label %for.end11, label %for.cond1.preheader, !dbg !74

for.end11:                                        ; preds = %for.end
  ret void, !dbg !95
}

; Function Attrs: nounwind
declare i32 @fprintf(%struct._IO_FILE* nocapture, i8* nocapture readonly, ...) #1

; Function Attrs: nounwind uwtable
define i32 @main() #0 !dbg !9 {
entry:
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !24, metadata !25), !dbg !96
  br label %vector.ph, !dbg !98

vector.ph:                                        ; preds = %for.inc10.i, %entry
  %indvars.iv3.i = phi i64 [ 0, %entry ], [ %indvars.iv.next4.i, %for.inc10.i ], !dbg !99
  br label %vector.body, !dbg !100

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next.1, %vector.body ], !dbg !99
  %0 = getelementptr inbounds [512 x [512 x i64]], [512 x [512 x i64]]* @A, i64 0, i64 %indvars.iv3.i, i64 %index, !dbg !101
  %1 = bitcast i64* %0 to <2 x i64>*, !dbg !102
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %1, align 16, !dbg !102
  %2 = getelementptr i64, i64* %0, i64 2, !dbg !102
  %3 = bitcast i64* %2 to <2 x i64>*, !dbg !102
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %3, align 16, !dbg !102
  %4 = getelementptr inbounds [512 x [512 x i64]], [512 x [512 x i64]]* @B, i64 0, i64 %indvars.iv3.i, i64 %index, !dbg !103
  %5 = bitcast i64* %4 to <2 x i64>*, !dbg !104
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %5, align 16, !dbg !104
  %6 = getelementptr i64, i64* %4, i64 2, !dbg !104
  %7 = bitcast i64* %6 to <2 x i64>*, !dbg !104
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %7, align 16, !dbg !104
  %index.next = or i64 %index, 4, !dbg !100
  %8 = getelementptr inbounds [512 x [512 x i64]], [512 x [512 x i64]]* @A, i64 0, i64 %indvars.iv3.i, i64 %index.next, !dbg !101
  %9 = bitcast i64* %8 to <2 x i64>*, !dbg !102
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %9, align 16, !dbg !102
  %10 = getelementptr i64, i64* %8, i64 2, !dbg !102
  %11 = bitcast i64* %10 to <2 x i64>*, !dbg !102
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %11, align 16, !dbg !102
  %12 = getelementptr inbounds [512 x [512 x i64]], [512 x [512 x i64]]* @B, i64 0, i64 %indvars.iv3.i, i64 %index.next, !dbg !103
  %13 = bitcast i64* %12 to <2 x i64>*, !dbg !104
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %13, align 16, !dbg !104
  %14 = getelementptr i64, i64* %12, i64 2, !dbg !104
  %15 = bitcast i64* %14 to <2 x i64>*, !dbg !104
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %15, align 16, !dbg !104
  %index.next.1 = add nsw i64 %index, 8, !dbg !100
  %16 = icmp eq i64 %index.next.1, 512, !dbg !100
  br i1 %16, label %for.inc10.i, label %vector.body, !dbg !100, !llvm.loop !105

for.inc10.i:                                      ; preds = %vector.body
  %indvars.iv.next4.i = add nuw nsw i64 %indvars.iv3.i, 1, !dbg !98
  %exitcond5.i = icmp eq i64 %indvars.iv.next4.i, 512, !dbg !98
  br i1 %exitcond5.i, label %for.cond1.preheader.i1.preheader, label %vector.ph, !dbg !98

for.cond1.preheader.i1.preheader:                 ; preds = %for.inc10.i
  br label %for.cond1.preheader.i1, !dbg !106

for.cond1.preheader.i1:                           ; preds = %for.cond1.preheader.i1.preheader, %for.inc28.i
  %indvars.iv7.i = phi i64 [ %indvars.iv.next8.i, %for.inc28.i ], [ 0, %for.cond1.preheader.i1.preheader ], !dbg !108
  br label %for.body3.i3, !dbg !106

for.body3.i3:                                     ; preds = %for.inc25.i, %for.cond1.preheader.i1
  %indvars.iv4.i = phi i64 [ 0, %for.cond1.preheader.i1 ], [ %indvars.iv.next5.i, %for.inc25.i ], !dbg !108
  %arrayidx5.i2 = getelementptr inbounds [512 x [512 x i64]], [512 x [512 x i64]]* @C, i64 0, i64 %indvars.iv7.i, i64 %indvars.iv4.i, !dbg !109
  store i64 0, i64* %arrayidx5.i2, align 8, !dbg !110
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !59, metadata !25), !dbg !111
  br label %for.body8.i, !dbg !112

for.body8.i:                                      ; preds = %for.body8.i, %for.body3.i3
  %add1.i = phi i64 [ 0, %for.body3.i3 ], [ %add.i.1, %for.body8.i ], !dbg !113
  %indvars.iv.i4 = phi i64 [ 0, %for.body3.i3 ], [ %indvars.iv.next.i5.1, %for.body8.i ], !dbg !108
  %arrayidx16.i = getelementptr inbounds [512 x [512 x i64]], [512 x [512 x i64]]* @A, i64 0, i64 %indvars.iv7.i, i64 %indvars.iv.i4, !dbg !114
  %17 = load i64, i64* %arrayidx16.i, align 16, !dbg !114
  %arrayidx20.i = getelementptr inbounds [512 x [512 x i64]], [512 x [512 x i64]]* @B, i64 0, i64 %indvars.iv.i4, i64 %indvars.iv4.i, !dbg !115
  %18 = load i64, i64* %arrayidx20.i, align 8, !dbg !115
  %mul.i = mul nsw i64 %18, %17, !dbg !116
  %add.i = add nsw i64 %mul.i, %add1.i, !dbg !117
  %indvars.iv.next.i5 = or i64 %indvars.iv.i4, 1, !dbg !112
  %arrayidx16.i.1 = getelementptr inbounds [512 x [512 x i64]], [512 x [512 x i64]]* @A, i64 0, i64 %indvars.iv7.i, i64 %indvars.iv.next.i5, !dbg !114
  %19 = load i64, i64* %arrayidx16.i.1, align 8, !dbg !114
  %arrayidx20.i.1 = getelementptr inbounds [512 x [512 x i64]], [512 x [512 x i64]]* @B, i64 0, i64 %indvars.iv.next.i5, i64 %indvars.iv4.i, !dbg !115
  %20 = load i64, i64* %arrayidx20.i.1, align 8, !dbg !115
  %mul.i.1 = mul nsw i64 %20, %19, !dbg !116
  %add.i.1 = add nsw i64 %mul.i.1, %add.i, !dbg !117
  %indvars.iv.next.i5.1 = add nsw i64 %indvars.iv.i4, 2, !dbg !112
  %exitcond.i6.1 = icmp eq i64 %indvars.iv.next.i5.1, 512, !dbg !112
  br i1 %exitcond.i6.1, label %for.inc25.i, label %for.body8.i, !dbg !112

for.inc25.i:                                      ; preds = %for.body8.i
  %add.i.1.lcssa = phi i64 [ %add.i.1, %for.body8.i ]
  store i64 %add.i.1.lcssa, i64* %arrayidx5.i2, align 8, !dbg !118
  %indvars.iv.next5.i = add nuw nsw i64 %indvars.iv4.i, 1, !dbg !106
  %exitcond6.i = icmp eq i64 %indvars.iv.next5.i, 512, !dbg !106
  br i1 %exitcond6.i, label %for.inc28.i, label %for.body3.i3, !dbg !106

for.inc28.i:                                      ; preds = %for.inc25.i
  %indvars.iv.next8.i = add nuw nsw i64 %indvars.iv7.i, 1, !dbg !119
  %exitcond9.i = icmp eq i64 %indvars.iv.next8.i, 512, !dbg !119
  br i1 %exitcond9.i, label %mat_mult.exit, label %for.cond1.preheader.i1, !dbg !119

mat_mult.exit:                                    ; preds = %for.inc28.i
  %21 = load i64, i64* getelementptr inbounds ([512 x [512 x i64]], [512 x [512 x i64]]* @C, i64 0, i64 511, i64 511), align 8, !dbg !120
  %call = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([49 x i8], [49 x i8]* @.str.2, i64 0, i64 0), i32 512, i32 512, i64 %21) #3, !dbg !121
  ret i32 0, !dbg !122
}

; Function Attrs: nounwind
declare i32 @printf(i8* nocapture readonly, ...) #1

; Function Attrs: nounwind readnone
declare void @llvm.dbg.value(metadata, i64, metadata, metadata) #2

; Function Attrs: nounwind
declare i32 @fputc(i32, %struct._IO_FILE* nocapture) #3

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind readnone }
attributes #3 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!21, !22}
!llvm.ident = !{!23}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 3.9.0 (http://llvm.org/git/clang.git e177b4a63ca92c5fec010986944530688e104074) (http://llvm.org/git/llvm.git fcd97ccb03712372fe95f1732638de5ed3fcabe8)", isOptimized: false, runtimeVersion: 0, emissionKind: 1, enums: !2, subprograms: !3, globals: !13)
!1 = !DIFile(filename: "MatrixMult.c", directory: "/home/sam/workspace/WhileyOpenCL/polly/MatrixMult/impl/handwritten")
!2 = !{}
!3 = !{!4, !7, !8, !9}
!4 = distinct !DISubprogram(name: "init_array", scope: !1, file: !1, line: 7, type: !5, isLocal: false, isDefinition: true, scopeLine: 8, isOptimized: false, variables: !2)
!5 = !DISubroutineType(types: !6)
!6 = !{null}
!7 = distinct !DISubprogram(name: "mat_mult", scope: !1, file: !1, line: 19, type: !5, isLocal: false, isDefinition: true, scopeLine: 19, isOptimized: false, variables: !2)
!8 = distinct !DISubprogram(name: "print_array", scope: !1, file: !1, line: 31, type: !5, isLocal: false, isDefinition: true, scopeLine: 32, isOptimized: false, variables: !2)
!9 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 44, type: !10, isLocal: false, isDefinition: true, scopeLine: 45, isOptimized: false, variables: !2)
!10 = !DISubroutineType(types: !11)
!11 = !{!12}
!12 = !DIBasicType(name: "int", size: 32, align: 32, encoding: DW_ATE_signed)
!13 = !{!14, !19, !20}
!14 = !DIGlobalVariable(name: "A", scope: !0, file: !1, line: 3, type: !15, isLocal: false, isDefinition: true, variable: [512 x [512 x i64]]* @A)
!15 = !DICompositeType(tag: DW_TAG_array_type, baseType: !16, size: 16777216, align: 64, elements: !17)
!16 = !DIBasicType(name: "long long int", size: 64, align: 64, encoding: DW_ATE_signed)
!17 = !{!18, !18}
!18 = !DISubrange(count: 512)
!19 = !DIGlobalVariable(name: "B", scope: !0, file: !1, line: 4, type: !15, isLocal: false, isDefinition: true, variable: [512 x [512 x i64]]* @B)
!20 = !DIGlobalVariable(name: "C", scope: !0, file: !1, line: 5, type: !15, isLocal: false, isDefinition: true, variable: [512 x [512 x i64]]* @C)
!21 = !{i32 2, !"Dwarf Version", i32 4}
!22 = !{i32 2, !"Debug Info Version", i32 3}
!23 = !{!"clang version 3.9.0 (http://llvm.org/git/clang.git e177b4a63ca92c5fec010986944530688e104074) (http://llvm.org/git/llvm.git fcd97ccb03712372fe95f1732638de5ed3fcabe8)"}
!24 = !DILocalVariable(name: "i", scope: !4, file: !1, line: 9, type: !12)
!25 = !DIExpression()
!26 = !DILocation(line: 9, column: 9, scope: !4)
!27 = !DILocation(line: 11, column: 5, scope: !28)
!28 = !DILexicalBlockFile(scope: !29, file: !1, discriminator: 1)
!29 = distinct !DILexicalBlock(scope: !30, file: !1, line: 11, column: 5)
!30 = distinct !DILexicalBlock(scope: !4, file: !1, line: 11, column: 5)
!31 = !DILocation(line: 12, column: 9, scope: !32)
!32 = !DILexicalBlockFile(scope: !33, file: !1, discriminator: 1)
!33 = distinct !DILexicalBlock(scope: !34, file: !1, line: 12, column: 9)
!34 = distinct !DILexicalBlock(scope: !35, file: !1, line: 12, column: 9)
!35 = distinct !DILexicalBlock(scope: !29, file: !1, line: 11, column: 25)
!36 = !DILocation(line: 13, column: 13, scope: !37)
!37 = distinct !DILexicalBlock(scope: !33, file: !1, line: 12, column: 29)
!38 = !DILocation(line: 13, column: 21, scope: !37)
!39 = !DILocation(line: 14, column: 13, scope: !37)
!40 = !DILocation(line: 14, column: 21, scope: !37)
!41 = distinct !{!41, !42, !43}
!42 = !{!"llvm.loop.vectorize.width", i32 1}
!43 = !{!"llvm.loop.interleave.count", i32 1}
!44 = !DILocation(line: 17, column: 1, scope: !4)
!45 = !DILocalVariable(name: "i", scope: !7, file: !1, line: 20, type: !12)
!46 = !DILocation(line: 20, column: 9, scope: !7)
!47 = !DILocation(line: 21, column: 5, scope: !48)
!48 = !DILexicalBlockFile(scope: !49, file: !1, discriminator: 1)
!49 = distinct !DILexicalBlock(scope: !50, file: !1, line: 21, column: 5)
!50 = distinct !DILexicalBlock(scope: !7, file: !1, line: 21, column: 5)
!51 = !DILocation(line: 22, column: 9, scope: !52)
!52 = !DILexicalBlockFile(scope: !53, file: !1, discriminator: 1)
!53 = distinct !DILexicalBlock(scope: !54, file: !1, line: 22, column: 9)
!54 = distinct !DILexicalBlock(scope: !55, file: !1, line: 22, column: 9)
!55 = distinct !DILexicalBlock(scope: !49, file: !1, line: 21, column: 25)
!56 = !DILocation(line: 23, column: 13, scope: !57)
!57 = distinct !DILexicalBlock(scope: !53, file: !1, line: 22, column: 29)
!58 = !DILocation(line: 23, column: 21, scope: !57)
!59 = !DILocalVariable(name: "k", scope: !7, file: !1, line: 20, type: !12)
!60 = !DILocation(line: 20, column: 15, scope: !7)
!61 = !DILocation(line: 24, column: 13, scope: !62)
!62 = !DILexicalBlockFile(scope: !63, file: !1, discriminator: 1)
!63 = distinct !DILexicalBlock(scope: !64, file: !1, line: 24, column: 13)
!64 = distinct !DILexicalBlock(scope: !57, file: !1, line: 24, column: 13)
!65 = !DILocation(line: 25, column: 27, scope: !63)
!66 = !DILocation(line: 25, column: 37, scope: !63)
!67 = !DILocation(line: 25, column: 47, scope: !63)
!68 = !DILocation(line: 25, column: 45, scope: !63)
!69 = !DILocation(line: 25, column: 35, scope: !63)
!70 = !DILocation(line: 25, column: 25, scope: !63)
!71 = !DILocation(line: 29, column: 1, scope: !7)
!72 = !DILocalVariable(name: "i", scope: !8, file: !1, line: 33, type: !12)
!73 = !DILocation(line: 33, column: 9, scope: !8)
!74 = !DILocation(line: 35, column: 5, scope: !75)
!75 = !DILexicalBlockFile(scope: !76, file: !1, discriminator: 1)
!76 = distinct !DILexicalBlock(scope: !77, file: !1, line: 35, column: 5)
!77 = distinct !DILexicalBlock(scope: !8, file: !1, line: 35, column: 5)
!78 = !DILocation(line: 37, column: 21, scope: !79)
!79 = distinct !DILexicalBlock(scope: !80, file: !1, line: 36, column: 29)
!80 = distinct !DILexicalBlock(scope: !81, file: !1, line: 36, column: 9)
!81 = distinct !DILexicalBlock(scope: !82, file: !1, line: 36, column: 9)
!82 = distinct !DILexicalBlock(scope: !76, file: !1, line: 35, column: 25)
!83 = !DILocation(line: 36, column: 9, scope: !84)
!84 = !DILexicalBlockFile(scope: !80, file: !1, discriminator: 1)
!85 = !DILocation(line: 37, column: 38, scope: !79)
!86 = !DILocation(line: 37, column: 13, scope: !79)
!87 = !DILocation(line: 38, column: 18, scope: !88)
!88 = distinct !DILexicalBlock(scope: !79, file: !1, line: 38, column: 17)
!89 = !DILocation(line: 38, column: 22, scope: !88)
!90 = !DILocation(line: 38, column: 17, scope: !79)
!91 = !DILocation(line: 38, column: 37, scope: !92)
!92 = !DILexicalBlockFile(scope: !88, file: !1, discriminator: 1)
!93 = !DILocation(line: 38, column: 29, scope: !92)
!94 = !DILocation(line: 40, column: 9, scope: !82)
!95 = !DILocation(line: 42, column: 1, scope: !8)
!96 = !DILocation(line: 9, column: 9, scope: !4, inlinedAt: !97)
!97 = distinct !DILocation(line: 51, column: 5, scope: !9)
!98 = !DILocation(line: 11, column: 5, scope: !28, inlinedAt: !97)
!99 = !DILocation(line: 51, column: 5, scope: !9)
!100 = !DILocation(line: 12, column: 9, scope: !32, inlinedAt: !97)
!101 = !DILocation(line: 13, column: 13, scope: !37, inlinedAt: !97)
!102 = !DILocation(line: 13, column: 21, scope: !37, inlinedAt: !97)
!103 = !DILocation(line: 14, column: 13, scope: !37, inlinedAt: !97)
!104 = !DILocation(line: 14, column: 21, scope: !37, inlinedAt: !97)
!105 = distinct !{!105, !42, !43}
!106 = !DILocation(line: 22, column: 9, scope: !52, inlinedAt: !107)
!107 = distinct !DILocation(line: 52, column: 5, scope: !9)
!108 = !DILocation(line: 52, column: 5, scope: !9)
!109 = !DILocation(line: 23, column: 13, scope: !57, inlinedAt: !107)
!110 = !DILocation(line: 23, column: 21, scope: !57, inlinedAt: !107)
!111 = !DILocation(line: 20, column: 15, scope: !7, inlinedAt: !107)
!112 = !DILocation(line: 24, column: 13, scope: !62, inlinedAt: !107)
!113 = !DILocation(line: 25, column: 27, scope: !63, inlinedAt: !107)
!114 = !DILocation(line: 25, column: 37, scope: !63, inlinedAt: !107)
!115 = !DILocation(line: 25, column: 47, scope: !63, inlinedAt: !107)
!116 = !DILocation(line: 25, column: 45, scope: !63, inlinedAt: !107)
!117 = !DILocation(line: 25, column: 35, scope: !63, inlinedAt: !107)
!118 = !DILocation(line: 25, column: 25, scope: !63, inlinedAt: !107)
!119 = !DILocation(line: 21, column: 5, scope: !48, inlinedAt: !107)
!120 = !DILocation(line: 55, column: 71, scope: !9)
!121 = !DILocation(line: 55, column: 5, scope: !9)
!122 = !DILocation(line: 56, column: 5, scope: !9)
