; ModuleID = 'GCD_cached.c'
source_filename = "GCD_cached.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external local_unnamed_addr global %struct._IO_FILE*, align 8
@.str = private unnamed_addr constant [5 x i8] c"fail\00", align 1
@.str.1 = private unnamed_addr constant [6 x i8] c"%lld\0A\00", align 1

; Function Attrs: nounwind uwtable
define i64 @gcd(i64 %a, i64 %b) local_unnamed_addr #0 {
entry:
  %cmp = icmp eq i64 %a, 0
  br i1 %cmp, label %cleanup, label %while.cond.preheader

while.cond.preheader:                             ; preds = %entry
  %cmp13234 = icmp sgt i64 %a, -1
  br i1 %cmp13234, label %blklab4.lr.ph.preheader, label %if.end3

blklab4.lr.ph.preheader:                          ; preds = %while.cond.preheader
  %cmp447 = icmp eq i64 %b, 0
  br i1 %cmp447, label %cleanup, label %blklab4.preheader.preheader

blklab4.preheader.preheader:                      ; preds = %blklab4.lr.ph.preheader
  br label %blklab4.preheader

blklab4.preheader:                                ; preds = %blklab4.preheader.preheader, %blklab5
  %b.addr.0.ph3549 = phi i64 [ %sub10, %blklab5 ], [ %b, %blklab4.preheader.preheader ]
  %a.addr.0.ph3648 = phi i64 [ %a.addr.033, %blklab5 ], [ %a, %blklab4.preheader.preheader ]
  br label %blklab4

if.end3.loopexit:                                 ; preds = %if.end9
  br label %if.end3

if.end3:                                          ; preds = %if.end3.loopexit, %while.cond.preheader
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !1
  %1 = tail call i64 @fwrite(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str, i64 0, i64 0), i64 4, i64 1, %struct._IO_FILE* %0) #6
  tail call void @exit(i32 -1) #7
  unreachable

blklab4:                                          ; preds = %blklab4.preheader, %if.end9
  %a.addr.033 = phi i64 [ %sub, %if.end9 ], [ %a.addr.0.ph3648, %blklab4.preheader ]
  %cmp7 = icmp sgt i64 %a.addr.033, %b.addr.0.ph3549
  br i1 %cmp7, label %if.end9, label %blklab5

if.end9:                                          ; preds = %blklab4
  %sub = sub nsw i64 %a.addr.033, %b.addr.0.ph3549
  %cmp1 = icmp sgt i64 %sub, -1
  br i1 %cmp1, label %blklab4, label %if.end3.loopexit

blklab5:                                          ; preds = %blklab4
  %sub10 = sub nsw i64 %b.addr.0.ph3549, %a.addr.033
  %cmp4 = icmp eq i64 %sub10, 0
  br i1 %cmp4, label %cleanup.loopexit, label %blklab4.preheader

cleanup.loopexit:                                 ; preds = %blklab5
  br label %cleanup

cleanup:                                          ; preds = %cleanup.loopexit, %blklab4.lr.ph.preheader, %entry
  %retval.0 = phi i64 [ %b, %entry ], [ %a, %blklab4.lr.ph.preheader ], [ %a.addr.033, %cleanup.loopexit ]
  ret i64 %retval.0
}

; Function Attrs: noreturn nounwind
declare void @exit(i32) local_unnamed_addr #1

; Function Attrs: nounwind uwtable
define i64 @gcd_cached(i64 %a, i64 %b, i64 %n, i64* nocapture %gcds, i64 %gcds_size, i1 zeroext %gcds_dealloc) local_unnamed_addr #0 {
entry:
  %cmp = icmp eq i64 %a, 0
  br i1 %cmp, label %if.end, label %blklab7

if.end:                                           ; preds = %entry
  br i1 %gcds_dealloc, label %if.then1, label %cleanup

if.then1:                                         ; preds = %if.end
  %0 = bitcast i64* %gcds to i8*
  tail call void @free(i8* %0) #5
  br label %cleanup

blklab7:                                          ; preds = %entry
  %cmp3 = icmp eq i64 %b, 0
  br i1 %cmp3, label %if.end5, label %blklab9

if.end5:                                          ; preds = %blklab7
  br i1 %gcds_dealloc, label %if.then7, label %cleanup

if.then7:                                         ; preds = %if.end5
  %1 = bitcast i64* %gcds to i8*
  tail call void @free(i8* %1) #5
  br label %cleanup

blklab9:                                          ; preds = %blklab7
  %cmp9 = icmp sgt i64 %a, %b
  %a.op = sub i64 0, %a
  %sub12.neg = select i1 %cmp9, i64 0, i64 %a.op
  %b.addr.0 = add i64 %sub12.neg, %b
  %sub = select i1 %cmp9, i64 %b, i64 0
  %a.addr.0 = sub nsw i64 %a, %sub
  %mul = mul nsw i64 %a.addr.0, %n
  %add = add nsw i64 %b.addr.0, %mul
  %arrayidx = getelementptr inbounds i64, i64* %gcds, i64 %add
  %2 = load i64, i64* %arrayidx, align 8, !tbaa !5
  br i1 %gcds_dealloc, label %if.then14, label %cleanup

if.then14:                                        ; preds = %blklab9
  %3 = bitcast i64* %gcds to i8*
  tail call void @free(i8* %3) #5
  br label %cleanup

cleanup:                                          ; preds = %blklab9, %if.then14, %if.end5, %if.then7, %if.end, %if.then1
  %retval.0 = phi i64 [ %b, %if.then1 ], [ %b, %if.end ], [ %a, %if.then7 ], [ %a, %if.end5 ], [ %2, %if.then14 ], [ %2, %blklab9 ]
  ret i64 %retval.0
}

; Function Attrs: nounwind
declare void @free(i8* nocapture) local_unnamed_addr #2

; Function Attrs: noreturn nounwind uwtable
define i32 @main(i32 %argc, i8** %args) local_unnamed_addr #3 {
entry:
  %call = tail call i64** @convertArgsToIntArray(i32 %argc, i8** %args) #5
  %0 = load i64*, i64** %call, align 8, !tbaa !1
  %call1 = tail call i64* @parseStringToInt(i64* %0) #5
  %cmp = icmp eq i64* %call1, null
  br i1 %cmp, label %if.end120, label %if.end5

if.end5:                                          ; preds = %entry
  %1 = load i64, i64* %call1, align 8, !tbaa !5
  %call10 = tail call i64* @create1DArray(i32 0, i32 4) #5
  %2 = bitcast i64* %call10 to <2 x i64>*
  store <2 x i64> <i64 78, i64 32>, <2 x i64>* %2, align 8, !tbaa !5
  %arrayidx13 = getelementptr inbounds i64, i64* %call10, i64 2
  %3 = bitcast i64* %arrayidx13 to <2 x i64>*
  store <2 x i64> <i64 61, i64 32>, <2 x i64>* %3, align 8, !tbaa !5
  tail call void @printf_s(i64* %call10, i64 4) #5
  %call15 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.1, i64 0, i64 0), i64 %1)
  %mul = mul nsw i64 %1, %1
  %conv20 = trunc i64 %mul to i32
  %call21 = tail call i64* @create1DArray(i32 0, i32 %conv20) #5
  %cmp27218 = icmp sgt i64 %1, 0
  br i1 %cmp27218, label %while.cond31.preheader.us.preheader, label %if.then98

while.cond31.preheader.us.preheader:              ; preds = %if.end5
  %4 = add i64 %1, -4
  %5 = lshr i64 %4, 2
  %6 = add nuw nsw i64 %5, 1
  %min.iters.check = icmp ult i64 %1, 4
  %n.vec = and i64 %1, -4
  %cmp.zero = icmp eq i64 %n.vec, 0
  %xtraiter = and i64 %6, 1
  %7 = icmp eq i64 %5, 0
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  %cmp.n = icmp eq i64 %1, %n.vec
  %unroll_iter = sub nsw i64 %6, %xtraiter
  br label %while.cond31.preheader.us

while.cond31.preheader.us:                        ; preds = %while.cond31.preheader.us.preheader, %blklab16.loopexit.us
  %sum.0221.us = phi i64 [ %add43.lcssa.us, %blklab16.loopexit.us ], [ 0, %while.cond31.preheader.us.preheader ]
  %i.0219.us = phi i64 [ %add45.us, %blklab16.loopexit.us ], [ 0, %while.cond31.preheader.us.preheader ]
  %cmp.i.us = icmp eq i64 %i.0219.us, 0
  %mul38.us = mul nsw i64 %i.0219.us, %1
  %a.op.i.us = sub i64 0, %i.0219.us
  br i1 %cmp.i.us, label %if.end36.us.us.preheader, label %if.end36.us228.preheader

if.end36.us228.preheader:                         ; preds = %while.cond31.preheader.us
  br label %if.end36.us228

if.end36.us.us.preheader:                         ; preds = %while.cond31.preheader.us
  br i1 %min.iters.check, label %if.end36.us.us.preheader260, label %min.iters.checked

if.end36.us.us.preheader260:                      ; preds = %middle.block, %min.iters.checked, %if.end36.us.us.preheader
  %sum.1217.us.us.ph = phi i64 [ %sum.0221.us, %min.iters.checked ], [ %sum.0221.us, %if.end36.us.us.preheader ], [ %30, %middle.block ]
  %j.0216.us.us.ph = phi i64 [ 0, %min.iters.checked ], [ 0, %if.end36.us.us.preheader ], [ %n.vec, %middle.block ]
  br label %if.end36.us.us

min.iters.checked:                                ; preds = %if.end36.us.us.preheader
  br i1 %cmp.zero, label %if.end36.us.us.preheader260, label %vector.ph

vector.ph:                                        ; preds = %min.iters.checked
  %8 = insertelement <2 x i64> <i64 undef, i64 0>, i64 %sum.0221.us, i32 0
  br i1 %7, label %middle.block.unr-lcssa, label %vector.ph.new

vector.ph.new:                                    ; preds = %vector.ph
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph.new
  %vec.phi = phi <2 x i64> [ %8, %vector.ph.new ], [ %21, %vector.body ]
  %vec.phi255 = phi <2 x i64> [ zeroinitializer, %vector.ph.new ], [ %22, %vector.body ]
  %vec.ind = phi <2 x i64> [ <i64 0, i64 1>, %vector.ph.new ], [ %step.add256.1, %vector.body ]
  %niter = phi i64 [ %unroll_iter, %vector.ph.new ], [ %niter.nsub.1, %vector.body ]
  %step.add = add <2 x i64> %vec.ind, <i64 2, i64 2>
  %step.add256 = add <2 x i64> %vec.ind, <i64 4, i64 4>
  %.lhs = extractelement <2 x i64> %vec.ind, i32 0
  %9 = add nsw i64 %.lhs, %mul38.us
  %10 = getelementptr inbounds i64, i64* %call21, i64 %9
  %11 = bitcast i64* %10 to <2 x i64>*
  store <2 x i64> %vec.ind, <2 x i64>* %11, align 8, !tbaa !5
  %12 = getelementptr i64, i64* %10, i64 2
  %13 = bitcast i64* %12 to <2 x i64>*
  store <2 x i64> %step.add, <2 x i64>* %13, align 8, !tbaa !5
  %14 = add nsw <2 x i64> %vec.ind, %vec.phi
  %15 = add nsw <2 x i64> %step.add, %vec.phi255
  %step.add.1 = add <2 x i64> %vec.ind, <i64 6, i64 6>
  %step.add256.1 = add <2 x i64> %vec.ind, <i64 8, i64 8>
  %.lhs.1 = extractelement <2 x i64> %step.add256, i32 0
  %16 = add nsw i64 %.lhs.1, %mul38.us
  %17 = getelementptr inbounds i64, i64* %call21, i64 %16
  %18 = bitcast i64* %17 to <2 x i64>*
  store <2 x i64> %step.add256, <2 x i64>* %18, align 8, !tbaa !5
  %19 = getelementptr i64, i64* %17, i64 2
  %20 = bitcast i64* %19 to <2 x i64>*
  store <2 x i64> %step.add.1, <2 x i64>* %20, align 8, !tbaa !5
  %21 = add nsw <2 x i64> %step.add256, %14
  %22 = add nsw <2 x i64> %step.add.1, %15
  %niter.nsub.1 = add i64 %niter, -2
  %niter.ncmp.1 = icmp eq i64 %niter.nsub.1, 0
  br i1 %niter.ncmp.1, label %middle.block.unr-lcssa.loopexit, label %vector.body, !llvm.loop !7

middle.block.unr-lcssa.loopexit:                  ; preds = %vector.body
  br label %middle.block.unr-lcssa

middle.block.unr-lcssa:                           ; preds = %middle.block.unr-lcssa.loopexit, %vector.ph
  %.lcssa262.ph = phi <2 x i64> [ undef, %vector.ph ], [ %22, %middle.block.unr-lcssa.loopexit ]
  %.lcssa.ph = phi <2 x i64> [ undef, %vector.ph ], [ %21, %middle.block.unr-lcssa.loopexit ]
  %vec.phi.unr = phi <2 x i64> [ %8, %vector.ph ], [ %21, %middle.block.unr-lcssa.loopexit ]
  %vec.phi255.unr = phi <2 x i64> [ zeroinitializer, %vector.ph ], [ %22, %middle.block.unr-lcssa.loopexit ]
  %vec.ind.unr = phi <2 x i64> [ <i64 0, i64 1>, %vector.ph ], [ %step.add256.1, %middle.block.unr-lcssa.loopexit ]
  br i1 %lcmp.mod, label %middle.block, label %vector.body.epil.preheader

vector.body.epil.preheader:                       ; preds = %middle.block.unr-lcssa
  br label %vector.body.epil

vector.body.epil:                                 ; preds = %vector.body.epil.preheader
  %step.add.epil = add <2 x i64> %vec.ind.unr, <i64 2, i64 2>
  %.lhs.epil = extractelement <2 x i64> %vec.ind.unr, i32 0
  %23 = add nsw i64 %.lhs.epil, %mul38.us
  %24 = getelementptr inbounds i64, i64* %call21, i64 %23
  %25 = bitcast i64* %24 to <2 x i64>*
  store <2 x i64> %vec.ind.unr, <2 x i64>* %25, align 8, !tbaa !5
  %26 = getelementptr i64, i64* %24, i64 2
  %27 = bitcast i64* %26 to <2 x i64>*
  store <2 x i64> %step.add.epil, <2 x i64>* %27, align 8, !tbaa !5
  br label %middle.block.epilog-lcssa

middle.block.epilog-lcssa:                        ; preds = %vector.body.epil
  %28 = add nsw <2 x i64> %step.add.epil, %vec.phi255.unr
  %29 = add nsw <2 x i64> %vec.ind.unr, %vec.phi.unr
  br label %middle.block

middle.block:                                     ; preds = %middle.block.unr-lcssa, %middle.block.epilog-lcssa
  %.lcssa262 = phi <2 x i64> [ %.lcssa262.ph, %middle.block.unr-lcssa ], [ %28, %middle.block.epilog-lcssa ]
  %.lcssa = phi <2 x i64> [ %.lcssa.ph, %middle.block.unr-lcssa ], [ %29, %middle.block.epilog-lcssa ]
  %bin.rdx = add <2 x i64> %.lcssa262, %.lcssa
  %rdx.shuf = shufflevector <2 x i64> %bin.rdx, <2 x i64> undef, <2 x i32> <i32 1, i32 undef>
  %bin.rdx259 = add <2 x i64> %bin.rdx, %rdx.shuf
  %30 = extractelement <2 x i64> %bin.rdx259, i32 0
  br i1 %cmp.n, label %blklab16.loopexit.us, label %if.end36.us.us.preheader260

if.end36.us228:                                   ; preds = %if.end36.us228.preheader, %gcd_cached.exit.us242
  %sum.1217.us229 = phi i64 [ %add43.us246, %gcd_cached.exit.us242 ], [ %sum.0221.us, %if.end36.us228.preheader ]
  %j.0216.us230 = phi i64 [ %add44.us247, %gcd_cached.exit.us242 ], [ 0, %if.end36.us228.preheader ]
  %cmp3.i.us232 = icmp eq i64 %j.0216.us230, 0
  br i1 %cmp3.i.us232, label %gcd_cached.exit.us242, label %blklab9.i.us233

blklab9.i.us233:                                  ; preds = %if.end36.us228
  %cmp9.i.us234 = icmp sgt i64 %i.0219.us, %j.0216.us230
  %sub12.neg.i.us235 = select i1 %cmp9.i.us234, i64 0, i64 %a.op.i.us
  %b.addr.0.i.us236 = add i64 %sub12.neg.i.us235, %j.0216.us230
  %sub.i.us237 = select i1 %cmp9.i.us234, i64 %j.0216.us230, i64 0
  %a.addr.0.i.us238 = sub nsw i64 %i.0219.us, %sub.i.us237
  %mul.i.us239 = mul nsw i64 %a.addr.0.i.us238, %1
  %add.i.us240 = add nsw i64 %b.addr.0.i.us236, %mul.i.us239
  %arrayidx.i.us241 = getelementptr inbounds i64, i64* %call21, i64 %add.i.us240
  %31 = load i64, i64* %arrayidx.i.us241, align 8, !tbaa !5
  br label %gcd_cached.exit.us242

gcd_cached.exit.us242:                            ; preds = %blklab9.i.us233, %if.end36.us228
  %retval.0.i.us243 = phi i64 [ %31, %blklab9.i.us233 ], [ %i.0219.us, %if.end36.us228 ]
  %add.us244 = add nsw i64 %j.0216.us230, %mul38.us
  %arrayidx39.us245 = getelementptr inbounds i64, i64* %call21, i64 %add.us244
  store i64 %retval.0.i.us243, i64* %arrayidx39.us245, align 8, !tbaa !5
  %add43.us246 = add nsw i64 %retval.0.i.us243, %sum.1217.us229
  %add44.us247 = add nuw nsw i64 %j.0216.us230, 1
  %exitcond.us248 = icmp eq i64 %add44.us247, %1
  br i1 %exitcond.us248, label %blklab16.loopexit.us.loopexit261, label %if.end36.us228

blklab16.loopexit.us.loopexit:                    ; preds = %if.end36.us.us
  br label %blklab16.loopexit.us

blklab16.loopexit.us.loopexit261:                 ; preds = %gcd_cached.exit.us242
  br label %blklab16.loopexit.us

blklab16.loopexit.us:                             ; preds = %blklab16.loopexit.us.loopexit261, %blklab16.loopexit.us.loopexit, %middle.block
  %add43.lcssa.us = phi i64 [ %30, %middle.block ], [ %add43.us.us, %blklab16.loopexit.us.loopexit ], [ %add43.us246, %blklab16.loopexit.us.loopexit261 ]
  %add45.us = add nuw nsw i64 %i.0219.us, 1
  %exitcond223.us = icmp eq i64 %add45.us, %1
  br i1 %exitcond223.us, label %if.then98.loopexit, label %while.cond31.preheader.us

if.end36.us.us:                                   ; preds = %if.end36.us.us.preheader260, %if.end36.us.us
  %sum.1217.us.us = phi i64 [ %add43.us.us, %if.end36.us.us ], [ %sum.1217.us.us.ph, %if.end36.us.us.preheader260 ]
  %j.0216.us.us = phi i64 [ %add44.us.us, %if.end36.us.us ], [ %j.0216.us.us.ph, %if.end36.us.us.preheader260 ]
  %add.us.us = add nsw i64 %j.0216.us.us, %mul38.us
  %arrayidx39.us.us = getelementptr inbounds i64, i64* %call21, i64 %add.us.us
  store i64 %j.0216.us.us, i64* %arrayidx39.us.us, align 8, !tbaa !5
  %add43.us.us = add nsw i64 %j.0216.us.us, %sum.1217.us.us
  %add44.us.us = add nuw nsw i64 %j.0216.us.us, 1
  %exitcond.us.us = icmp eq i64 %add44.us.us, %1
  br i1 %exitcond.us.us, label %blklab16.loopexit.us.loopexit, label %if.end36.us.us, !llvm.loop !10

if.then98.loopexit:                               ; preds = %blklab16.loopexit.us
  br label %if.then98

if.then98:                                        ; preds = %if.then98.loopexit, %if.end5
  %sum.0.lcssa = phi i64 [ 0, %if.end5 ], [ %add43.lcssa.us, %if.then98.loopexit ]
  %call50 = tail call i64* @create1DArray(i32 0, i32 5) #5
  %32 = bitcast i64* %call50 to <2 x i64>*
  store <2 x i64> <i64 83, i64 117>, <2 x i64>* %32, align 8, !tbaa !5
  %arrayidx53 = getelementptr inbounds i64, i64* %call50, i64 2
  %33 = bitcast i64* %arrayidx53 to <2 x i64>*
  store <2 x i64> <i64 109, i64 58>, <2 x i64>* %33, align 8, !tbaa !5
  %arrayidx55 = getelementptr inbounds i64, i64* %call50, i64 4
  store i64 32, i64* %arrayidx55, align 8, !tbaa !5
  tail call void @printf_s(i64* %call50, i64 5) #5
  %call56 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.1, i64 0, i64 0), i64 %sum.0.lcssa)
  %call61 = tail call i64* @create1DArray(i32 0, i32 32) #5
  %34 = bitcast i64* %call61 to <2 x i64>*
  store <2 x i64> <i64 80, i64 97>, <2 x i64>* %34, align 8, !tbaa !5
  %arrayidx64 = getelementptr inbounds i64, i64* %call61, i64 2
  %35 = bitcast i64* %arrayidx64 to <2 x i64>*
  store <2 x i64> <i64 115, i64 115>, <2 x i64>* %35, align 8, !tbaa !5
  %arrayidx66 = getelementptr inbounds i64, i64* %call61, i64 4
  %36 = bitcast i64* %arrayidx66 to <2 x i64>*
  store <2 x i64> <i64 32, i64 99>, <2 x i64>* %36, align 8, !tbaa !5
  %arrayidx68 = getelementptr inbounds i64, i64* %call61, i64 6
  %37 = bitcast i64* %arrayidx68 to <2 x i64>*
  store <2 x i64> <i64 97, i64 99>, <2 x i64>* %37, align 8, !tbaa !5
  %arrayidx70 = getelementptr inbounds i64, i64* %call61, i64 8
  %38 = bitcast i64* %arrayidx70 to <2 x i64>*
  store <2 x i64> <i64 104, i64 101>, <2 x i64>* %38, align 8, !tbaa !5
  %arrayidx72 = getelementptr inbounds i64, i64* %call61, i64 10
  %39 = bitcast i64* %arrayidx72 to <2 x i64>*
  store <2 x i64> <i64 100, i64 32>, <2 x i64>* %39, align 8, !tbaa !5
  %arrayidx74 = getelementptr inbounds i64, i64* %call61, i64 12
  %40 = bitcast i64* %arrayidx74 to <2 x i64>*
  store <2 x i64> <i64 69, i64 117>, <2 x i64>* %40, align 8, !tbaa !5
  %arrayidx76 = getelementptr inbounds i64, i64* %call61, i64 14
  %41 = bitcast i64* %arrayidx76 to <2 x i64>*
  store <2 x i64> <i64 99, i64 108>, <2 x i64>* %41, align 8, !tbaa !5
  %arrayidx78 = getelementptr inbounds i64, i64* %call61, i64 16
  %42 = bitcast i64* %arrayidx78 to <2 x i64>*
  store <2 x i64> <i64 105, i64 100>, <2 x i64>* %42, align 8, !tbaa !5
  %arrayidx80 = getelementptr inbounds i64, i64* %call61, i64 18
  %43 = bitcast i64* %arrayidx80 to <2 x i64>*
  store <2 x i64> <i64 32, i64 71>, <2 x i64>* %43, align 8, !tbaa !5
  %arrayidx82 = getelementptr inbounds i64, i64* %call61, i64 20
  %44 = bitcast i64* %arrayidx82 to <2 x i64>*
  store <2 x i64> <i64 67, i64 68>, <2 x i64>* %44, align 8, !tbaa !5
  %arrayidx84 = getelementptr inbounds i64, i64* %call61, i64 22
  %45 = bitcast i64* %arrayidx84 to <2 x i64>*
  store <2 x i64> <i64 32, i64 116>, <2 x i64>* %45, align 8, !tbaa !5
  %arrayidx86 = getelementptr inbounds i64, i64* %call61, i64 24
  %46 = bitcast i64* %arrayidx86 to <2 x i64>*
  store <2 x i64> <i64 101, i64 115>, <2 x i64>* %46, align 8, !tbaa !5
  %arrayidx88 = getelementptr inbounds i64, i64* %call61, i64 26
  %47 = bitcast i64* %arrayidx88 to <2 x i64>*
  store <2 x i64> <i64 116, i64 32>, <2 x i64>* %47, align 8, !tbaa !5
  %arrayidx90 = getelementptr inbounds i64, i64* %call61, i64 28
  %48 = bitcast i64* %arrayidx90 to <2 x i64>*
  store <2 x i64> <i64 99, i64 97>, <2 x i64>* %48, align 8, !tbaa !5
  %arrayidx92 = getelementptr inbounds i64, i64* %call61, i64 30
  %49 = bitcast i64* %arrayidx92 to <2 x i64>*
  store <2 x i64> <i64 115, i64 101>, <2 x i64>* %49, align 8, !tbaa !5
  tail call void @println_s(i64* %call61, i64 32) #5
  %phitmp = bitcast i64* %call61 to i8*
  %phitmp209 = bitcast i64* %call50 to i8*
  %phitmp210 = bitcast i64* %call10 to i8*
  %phitmp211 = bitcast i64* %call21 to i8*
  %50 = bitcast i64* %call1 to i8*
  tail call void @free(i8* %50) #5
  tail call void @free(i8* %phitmp211) #5
  tail call void @free(i8* %phitmp210) #5
  tail call void @free(i8* %phitmp209) #5
  tail call void @free(i8* %phitmp) #5
  br label %if.end120

if.end120:                                        ; preds = %entry, %if.then98
  tail call void @exit(i32 0) #7
  unreachable
}

declare i64** @convertArgsToIntArray(i32, i8**) local_unnamed_addr #4

declare i64* @parseStringToInt(i64*) local_unnamed_addr #4

declare i64* @create1DArray(i32, i32) local_unnamed_addr #4

declare void @printf_s(i64*, i64) local_unnamed_addr #4

; Function Attrs: nounwind
declare i32 @printf(i8* nocapture readonly, ...) local_unnamed_addr #2

declare void @println_s(i64*, i64) local_unnamed_addr #4

; Function Attrs: nounwind
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) local_unnamed_addr #5

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { noreturn nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { noreturn nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { nounwind }
attributes #6 = { cold }
attributes #7 = { noreturn nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 3.9.0 (http://llvm.org/git/clang.git f82fb5beb88e841f7a00cfb2a2ceabe46bcb2a9b) (http://llvm.org/git/llvm.git bafbf2b643f118fd2ea402ed6cd204281c7e9e94)"}
!1 = !{!2, !2, i64 0}
!2 = !{!"any pointer", !3, i64 0}
!3 = !{!"omnipotent char", !4, i64 0}
!4 = !{!"Simple C/C++ TBAA"}
!5 = !{!6, !6, i64 0}
!6 = !{!"long long", !3, i64 0}
!7 = distinct !{!7, !8, !9}
!8 = !{!"llvm.loop.vectorize.width", i32 1}
!9 = !{!"llvm.loop.interleave.count", i32 1}
!10 = distinct !{!10, !11, !8, !9}
!11 = !{!"llvm.loop.unroll.runtime.disable"}
