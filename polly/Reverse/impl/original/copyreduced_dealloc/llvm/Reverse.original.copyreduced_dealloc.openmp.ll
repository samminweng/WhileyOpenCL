; ModuleID = 'Reverse_original.c'
source_filename = "Reverse_original.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external local_unnamed_addr global %struct._IO_FILE*, align 8
@.str = private unnamed_addr constant [5 x i8] c"fail\00", align 1
@.str.1 = private unnamed_addr constant [6 x i8] c"%lld\0A\00", align 1

; Function Attrs: nounwind uwtable
define i64* @reverse(i64* nocapture %ls, i64 %ls_size, i1 zeroext %ls_dealloc) local_unnamed_addr #0 {
entry:
  %conv1 = trunc i64 %ls_size to i32
  %call = tail call i64* @create1DArray(i32 0, i32 %conv1) #6
  br label %blklab2

blklab3:                                          ; preds = %if.end18
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !1
  %1 = tail call i64 @fwrite(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str, i64 0, i64 0), i64 4, i64 1, %struct._IO_FILE* %0) #8
  tail call void @exit(i32 -1) #9
  unreachable

blklab2:                                          ; preds = %entry, %if.end18
  %i.066 = phi i64 [ %ls_size, %entry ], [ %sub19, %if.end18 ]
  %cmp15 = icmp slt i64 %i.066, 1
  br i1 %cmp15, label %blklab0, label %if.end18

if.end18:                                         ; preds = %blklab2
  %sub = sub nuw nsw i64 %ls_size, %i.066
  %arrayidx = getelementptr inbounds i64, i64* %ls, i64 %sub
  %2 = load i64, i64* %arrayidx, align 8, !tbaa !5
  %sub19 = add nsw i64 %i.066, -1
  %arrayidx20 = getelementptr inbounds i64, i64* %call, i64 %sub19
  store i64 %2, i64* %arrayidx20, align 8, !tbaa !5
  %cmp = icmp sgt i64 %sub19, %ls_size
  br i1 %cmp, label %blklab3, label %blklab2

blklab0:                                          ; preds = %blklab2
  br i1 %ls_dealloc, label %if.then22, label %if.end29

if.then22:                                        ; preds = %blklab0
  %3 = bitcast i64* %ls to i8*
  tail call void @free(i8* %3) #6
  br label %if.end29

if.end29:                                         ; preds = %if.then22, %blklab0
  ret i64* %call
}

; Function Attrs: argmemonly nounwind
declare void @llvm.lifetime.start(i64, i8* nocapture) #1

; Function Attrs: nounwind
declare void @free(i8* nocapture) local_unnamed_addr #2

declare i64* @create1DArray(i32, i32) local_unnamed_addr #3

; Function Attrs: noreturn nounwind
declare void @exit(i32) local_unnamed_addr #4

; Function Attrs: argmemonly nounwind
declare void @llvm.lifetime.end(i64, i8* nocapture) #1

; Function Attrs: noreturn nounwind uwtable
define i32 @main(i32 %argc, i8** %args) local_unnamed_addr #5 {
entry:
  %polly.par.LBPtr.i = alloca i64, align 8
  %polly.par.UBPtr.i = alloca i64, align 8
  %polly.par.userContext = alloca { i64, i64* }, align 8
  %call = tail call i64** @convertArgsToIntArray(i32 %argc, i8** %args) #6
  %sub = add nsw i32 %argc, -1
  %conv = sext i32 %sub to i64
  %0 = load i64*, i64** %call, align 8, !tbaa !1
  %call1 = tail call i64* @parseStringToInt(i64* %0) #6
  %cmp = icmp eq i64* %call1, null
  br i1 %cmp, label %if.end90.critedge, label %if.end8

if.end8:                                          ; preds = %entry
  %1 = load i64, i64* %call1, align 8, !tbaa !5
  %conv13 = trunc i64 %1 to i32
  %call14 = tail call i64* @create1DArray(i32 0, i32 %conv13) #6
  %cmp20154 = icmp sgt i64 %1, 0
  br i1 %cmp20154, label %polly.parallel.for, label %if.end28

if.end28:                                         ; preds = %main_polly_subfn.exit, %if.end8
  %call.i = tail call i64* @create1DArray(i32 0, i32 %conv13) #6
  br label %blklab2.i

blklab3.i:                                        ; preds = %if.end18.i
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !1
  %3 = tail call i64 @fwrite(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str, i64 0, i64 0), i64 4, i64 1, %struct._IO_FILE* %2) #10
  tail call void @exit(i32 -1) #9
  unreachable

blklab2.i:                                        ; preds = %if.end18.i, %if.end28
  %i.066.i = phi i64 [ %1, %if.end28 ], [ %sub19.i, %if.end18.i ]
  %cmp15.i = icmp slt i64 %i.066.i, 1
  br i1 %cmp15.i, label %if.then71, label %if.end18.i

if.end18.i:                                       ; preds = %blklab2.i
  %sub.i = sub nuw nsw i64 %1, %i.066.i
  %arrayidx.i = getelementptr inbounds i64, i64* %call14, i64 %sub.i
  %4 = load i64, i64* %arrayidx.i, align 8, !tbaa !5
  %sub19.i = add nsw i64 %i.066.i, -1
  %arrayidx20.i = getelementptr inbounds i64, i64* %call.i, i64 %sub19.i
  store i64 %4, i64* %arrayidx20.i, align 8, !tbaa !5
  %cmp.i = icmp sgt i64 %sub19.i, %1
  br i1 %cmp.i, label %blklab3.i, label %blklab2.i

if.then71:                                        ; preds = %blklab2.i
  %5 = bitcast i64* %call14 to i8*
  tail call void @free(i8* %5) #6
  %6 = load i64, i64* %call.i, align 8, !tbaa !5
  %call36 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.1, i64 0, i64 0), i64 %6)
  %sub37 = add nsw i64 %1, -1
  %arrayidx38 = getelementptr inbounds i64, i64* %call.i, i64 %sub37
  %7 = load i64, i64* %arrayidx38, align 8, !tbaa !5
  %call39 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.1, i64 0, i64 0), i64 %7)
  %call44 = tail call i64* @create1DArray(i32 0, i32 22) #6
  %8 = bitcast i64* %call44 to <2 x i64>*
  store <2 x i64> <i64 80, i64 97>, <2 x i64>* %8, align 8, !tbaa !5
  %arrayidx47 = getelementptr inbounds i64, i64* %call44, i64 2
  %9 = bitcast i64* %arrayidx47 to <2 x i64>*
  store <2 x i64> <i64 115, i64 115>, <2 x i64>* %9, align 8, !tbaa !5
  %arrayidx49 = getelementptr inbounds i64, i64* %call44, i64 4
  %10 = bitcast i64* %arrayidx49 to <2 x i64>*
  store <2 x i64> <i64 32, i64 82>, <2 x i64>* %10, align 8, !tbaa !5
  %arrayidx51 = getelementptr inbounds i64, i64* %call44, i64 6
  %11 = bitcast i64* %arrayidx51 to <2 x i64>*
  store <2 x i64> <i64 101, i64 118>, <2 x i64>* %11, align 8, !tbaa !5
  %arrayidx53 = getelementptr inbounds i64, i64* %call44, i64 8
  %12 = bitcast i64* %arrayidx53 to <2 x i64>*
  store <2 x i64> <i64 101, i64 114>, <2 x i64>* %12, align 8, !tbaa !5
  %arrayidx55 = getelementptr inbounds i64, i64* %call44, i64 10
  %13 = bitcast i64* %arrayidx55 to <2 x i64>*
  store <2 x i64> <i64 115, i64 101>, <2 x i64>* %13, align 8, !tbaa !5
  %arrayidx57 = getelementptr inbounds i64, i64* %call44, i64 12
  %14 = bitcast i64* %arrayidx57 to <2 x i64>*
  store <2 x i64> <i64 32, i64 116>, <2 x i64>* %14, align 8, !tbaa !5
  %arrayidx59 = getelementptr inbounds i64, i64* %call44, i64 14
  %15 = bitcast i64* %arrayidx59 to <2 x i64>*
  store <2 x i64> <i64 101, i64 115>, <2 x i64>* %15, align 8, !tbaa !5
  %arrayidx61 = getelementptr inbounds i64, i64* %call44, i64 16
  %16 = bitcast i64* %arrayidx61 to <2 x i64>*
  store <2 x i64> <i64 116, i64 32>, <2 x i64>* %16, align 8, !tbaa !5
  %arrayidx63 = getelementptr inbounds i64, i64* %call44, i64 18
  %17 = bitcast i64* %arrayidx63 to <2 x i64>*
  store <2 x i64> <i64 99, i64 97>, <2 x i64>* %17, align 8, !tbaa !5
  %arrayidx65 = getelementptr inbounds i64, i64* %call44, i64 20
  %18 = bitcast i64* %arrayidx65 to <2 x i64>*
  store <2 x i64> <i64 115, i64 101>, <2 x i64>* %18, align 8, !tbaa !5
  tail call void @printf_s(i64* %call44, i64 22) #6
  %phitmp = bitcast i64* %call44 to i8*
  %phitmp153 = bitcast i64* %call.i to i8*
  %19 = bitcast i64* %call1 to i8*
  tail call void @free(i8* %19) #6
  tail call void @free(i8* %phitmp153) #6
  tail call void @free2DArray(i64** %call, i64 %conv) #6
  tail call void @free(i8* %phitmp) #6
  br label %if.end90

if.end90.critedge:                                ; preds = %entry
  tail call void @free2DArray(i64** %call, i64 %conv) #6
  br label %if.end90

if.end90:                                         ; preds = %if.end90.critedge, %if.then71
  tail call void @exit(i32 0) #9
  unreachable

polly.parallel.for:                               ; preds = %if.end8
  %20 = bitcast { i64, i64* }* %polly.par.userContext to i8*
  call void @llvm.lifetime.start(i64 16, i8* %20)
  %polly.subfn.storeaddr. = getelementptr inbounds { i64, i64* }, { i64, i64* }* %polly.par.userContext, i64 0, i32 0
  store i64 %1, i64* %polly.subfn.storeaddr., align 8
  %polly.subfn.storeaddr.call14 = getelementptr inbounds { i64, i64* }, { i64, i64* }* %polly.par.userContext, i64 0, i32 1
  store i64* %call14, i64** %polly.subfn.storeaddr.call14, align 8
  call void @GOMP_parallel_loop_runtime_start(void (i8*)* nonnull @main_polly_subfn, i8* %20, i32 0, i64 0, i64 %1, i64 1) #6
  %21 = bitcast i64* %polly.par.LBPtr.i to i8*
  call void @llvm.lifetime.start(i64 8, i8* %21)
  %22 = bitcast i64* %polly.par.UBPtr.i to i8*
  call void @llvm.lifetime.start(i64 8, i8* %22)
  %polly.subfunc.arg..i = load i64, i64* %polly.subfn.storeaddr., align 8
  %polly.subfunc.arg.call14.i = load i64*, i64** %polly.subfn.storeaddr.call14, align 8
  %23 = call i8 @GOMP_loop_runtime_next(i64* nonnull %polly.par.LBPtr.i, i64* nonnull %polly.par.UBPtr.i) #6
  %24 = icmp eq i8 %23, 0
  br i1 %24, label %main_polly_subfn.exit, label %polly.par.loadIVBounds.i.preheader

polly.par.loadIVBounds.i.preheader:               ; preds = %polly.parallel.for
  br label %polly.par.loadIVBounds.i

polly.par.checkNext.loopexit.i:                   ; preds = %polly.loop_header.i
  %25 = call i8 @GOMP_loop_runtime_next(i64* nonnull %polly.par.LBPtr.i, i64* nonnull %polly.par.UBPtr.i) #6
  %26 = icmp eq i8 %25, 0
  br i1 %26, label %main_polly_subfn.exit.loopexit, label %polly.par.loadIVBounds.i

polly.par.loadIVBounds.i:                         ; preds = %polly.par.loadIVBounds.i.preheader, %polly.par.checkNext.loopexit.i
  %polly.par.UB.i = load i64, i64* %polly.par.UBPtr.i, align 8
  %polly.par.LB.i = load i64, i64* %polly.par.LBPtr.i, align 8
  %polly.adjust_ub.i = add i64 %polly.par.UB.i, -2
  br label %polly.loop_header.i

polly.loop_header.i:                              ; preds = %polly.loop_header.i, %polly.par.loadIVBounds.i
  %polly.indvar.i = phi i64 [ %polly.par.LB.i, %polly.par.loadIVBounds.i ], [ %polly.indvar_next.i, %polly.loop_header.i ]
  %scevgep.i = getelementptr i64, i64* %polly.subfunc.arg.call14.i, i64 %polly.indvar.i
  %27 = sub i64 %polly.subfunc.arg..i, %polly.indvar.i
  store i64 %27, i64* %scevgep.i, align 8, !alias.scope !7, !noalias !9
  %polly.indvar_next.i = add nsw i64 %polly.indvar.i, 1
  %polly.loop_cond.i = icmp sgt i64 %polly.indvar.i, %polly.adjust_ub.i
  br i1 %polly.loop_cond.i, label %polly.par.checkNext.loopexit.i, label %polly.loop_header.i

main_polly_subfn.exit.loopexit:                   ; preds = %polly.par.checkNext.loopexit.i
  br label %main_polly_subfn.exit

main_polly_subfn.exit:                            ; preds = %main_polly_subfn.exit.loopexit, %polly.parallel.for
  call void @GOMP_loop_end_nowait() #6
  call void @llvm.lifetime.end(i64 8, i8* %21)
  call void @llvm.lifetime.end(i64 8, i8* %22)
  call void @GOMP_parallel_end() #6
  call void @llvm.lifetime.end(i64 8, i8* %20)
  br label %if.end28
}

declare void @free2DArray(i64**, i64) local_unnamed_addr #3

declare i64** @convertArgsToIntArray(i32, i8**) local_unnamed_addr #3

declare i64* @parseStringToInt(i64*) local_unnamed_addr #3

; Function Attrs: nounwind
declare i32 @printf(i8* nocapture readonly, ...) local_unnamed_addr #2

declare void @printf_s(i64*, i64) local_unnamed_addr #3

; Function Attrs: nounwind
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) local_unnamed_addr #6

define internal void @main_polly_subfn(i8* nocapture readonly %polly.par.userContext) #7 {
polly.par.setup:
  %polly.par.LBPtr = alloca i64, align 8
  %polly.par.UBPtr = alloca i64, align 8
  %0 = bitcast i8* %polly.par.userContext to i64*
  %polly.subfunc.arg. = load i64, i64* %0, align 8
  %1 = getelementptr inbounds i8, i8* %polly.par.userContext, i64 8
  %2 = bitcast i8* %1 to i64**
  %polly.subfunc.arg.call14 = load i64*, i64** %2, align 8
  %3 = call i8 @GOMP_loop_runtime_next(i64* nonnull %polly.par.LBPtr, i64* nonnull %polly.par.UBPtr)
  %4 = icmp eq i8 %3, 0
  br i1 %4, label %polly.par.exit, label %polly.par.loadIVBounds.preheader

polly.par.loadIVBounds.preheader:                 ; preds = %polly.par.setup
  br label %polly.par.loadIVBounds

polly.par.exit.loopexit:                          ; preds = %polly.par.checkNext.loopexit
  br label %polly.par.exit

polly.par.exit:                                   ; preds = %polly.par.exit.loopexit, %polly.par.setup
  call void @GOMP_loop_end_nowait()
  ret void

polly.par.checkNext.loopexit:                     ; preds = %polly.loop_header
  %5 = call i8 @GOMP_loop_runtime_next(i64* nonnull %polly.par.LBPtr, i64* nonnull %polly.par.UBPtr)
  %6 = icmp eq i8 %5, 0
  br i1 %6, label %polly.par.exit.loopexit, label %polly.par.loadIVBounds

polly.par.loadIVBounds:                           ; preds = %polly.par.loadIVBounds.preheader, %polly.par.checkNext.loopexit
  %polly.par.UB = load i64, i64* %polly.par.UBPtr, align 8
  %polly.par.LB = load i64, i64* %polly.par.LBPtr, align 8
  %polly.adjust_ub = add i64 %polly.par.UB, -2
  br label %polly.loop_header

polly.loop_header:                                ; preds = %polly.loop_header, %polly.par.loadIVBounds
  %polly.indvar = phi i64 [ %polly.par.LB, %polly.par.loadIVBounds ], [ %polly.indvar_next, %polly.loop_header ]
  %scevgep = getelementptr i64, i64* %polly.subfunc.arg.call14, i64 %polly.indvar
  %7 = sub i64 %polly.subfunc.arg., %polly.indvar
  store i64 %7, i64* %scevgep, align 8, !alias.scope !10, !noalias !9
  %polly.indvar_next = add nsw i64 %polly.indvar, 1
  %polly.loop_cond = icmp sgt i64 %polly.indvar, %polly.adjust_ub
  br i1 %polly.loop_cond, label %polly.par.checkNext.loopexit, label %polly.loop_header
}

declare i8 @GOMP_loop_runtime_next(i64*, i64*) local_unnamed_addr

declare void @GOMP_loop_end_nowait() local_unnamed_addr

declare void @GOMP_parallel_loop_runtime_start(void (i8*)*, i8*, i32, i64, i64, i64) local_unnamed_addr

declare void @GOMP_parallel_end() local_unnamed_addr

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { argmemonly nounwind }
attributes #2 = { nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { noreturn nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { noreturn nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "polly-optimized" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #6 = { nounwind }
attributes #7 = { "polly.skip.fn" }
attributes #8 = { cold }
attributes #9 = { noreturn nounwind }
attributes #10 = { cold nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 3.9.0 (http://llvm.org/git/clang.git aec29e5973c27bcbc3c1cf54295e3778050a73cd) (http://llvm.org/git/llvm.git 4c6356e8c64e246972f760a1f05bc0f365b090ad)"}
!1 = !{!2, !2, i64 0}
!2 = !{!"any pointer", !3, i64 0}
!3 = !{!"omnipotent char", !4, i64 0}
!4 = !{!"Simple C/C++ TBAA"}
!5 = !{!6, !6, i64 0}
!6 = !{!"long long", !3, i64 0}
!7 = distinct !{!7, !8, !"polly.alias.scope.call14"}
!8 = distinct !{!8, !"polly.alias.scope.domain"}
!9 = !{}
!10 = distinct !{!10, !11, !"polly.alias.scope.call14"}
!11 = distinct !{!11, !"polly.alias.scope.domain"}
