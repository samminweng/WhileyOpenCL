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
  %sub = add nsw i32 %argc, -1
  %conv = sext i32 %sub to i64
  %0 = load i64*, i64** %call, align 8, !tbaa !1
  %call1 = tail call i64* @parseStringToInt(i64* %0) #5
  %cmp = icmp eq i64* %call1, null
  br i1 %cmp, label %if.end123.critedge, label %if.end8

if.end8:                                          ; preds = %entry
  %1 = load i64, i64* %call1, align 8, !tbaa !5
  %call13 = tail call i64* @create1DArray(i32 0, i32 4) #5
  %2 = bitcast i64* %call13 to <2 x i64>*
  store <2 x i64> <i64 78, i64 32>, <2 x i64>* %2, align 8, !tbaa !5
  %arrayidx16 = getelementptr inbounds i64, i64* %call13, i64 2
  %3 = bitcast i64* %arrayidx16 to <2 x i64>*
  store <2 x i64> <i64 61, i64 32>, <2 x i64>* %3, align 8, !tbaa !5
  tail call void @printf_s(i64* %call13, i64 4) #5
  %call18 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.1, i64 0, i64 0), i64 %1)
  %mul = mul nsw i64 %1, %1
  %conv23 = trunc i64 %mul to i32
  %call24 = tail call i64* @create1DArray(i32 0, i32 %conv23) #5
  %cmp30222 = icmp sgt i64 %1, 0
  br i1 %cmp30222, label %while.cond34.preheader.us.preheader, label %if.then101

while.cond34.preheader.us.preheader:              ; preds = %if.end8
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
  br label %while.cond34.preheader.us

while.cond34.preheader.us:                        ; preds = %while.cond34.preheader.us.preheader, %blklab16.loopexit.us
  %sum.0225.us = phi i64 [ %add46.lcssa.us, %blklab16.loopexit.us ], [ 0, %while.cond34.preheader.us.preheader ]
  %i.0223.us = phi i64 [ %add48.us, %blklab16.loopexit.us ], [ 0, %while.cond34.preheader.us.preheader ]
  %cmp.i.us = icmp eq i64 %i.0223.us, 0
  %mul41.us = mul nsw i64 %i.0223.us, %1
  %a.op.i.us = sub i64 0, %i.0223.us
  br i1 %cmp.i.us, label %if.end39.us.us.preheader, label %if.end39.us232.preheader

if.end39.us232.preheader:                         ; preds = %while.cond34.preheader.us
  br label %if.end39.us232

if.end39.us.us.preheader:                         ; preds = %while.cond34.preheader.us
  br i1 %min.iters.check, label %if.end39.us.us.preheader264, label %min.iters.checked

if.end39.us.us.preheader264:                      ; preds = %middle.block, %min.iters.checked, %if.end39.us.us.preheader
  %sum.1221.us.us.ph = phi i64 [ %sum.0225.us, %min.iters.checked ], [ %sum.0225.us, %if.end39.us.us.preheader ], [ %30, %middle.block ]
  %j.0220.us.us.ph = phi i64 [ 0, %min.iters.checked ], [ 0, %if.end39.us.us.preheader ], [ %n.vec, %middle.block ]
  br label %if.end39.us.us

min.iters.checked:                                ; preds = %if.end39.us.us.preheader
  br i1 %cmp.zero, label %if.end39.us.us.preheader264, label %vector.ph

vector.ph:                                        ; preds = %min.iters.checked
  %8 = insertelement <2 x i64> <i64 undef, i64 0>, i64 %sum.0225.us, i32 0
  br i1 %7, label %middle.block.unr-lcssa, label %vector.ph.new

vector.ph.new:                                    ; preds = %vector.ph
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph.new
  %vec.phi = phi <2 x i64> [ %8, %vector.ph.new ], [ %21, %vector.body ]
  %vec.phi259 = phi <2 x i64> [ zeroinitializer, %vector.ph.new ], [ %22, %vector.body ]
  %vec.ind = phi <2 x i64> [ <i64 0, i64 1>, %vector.ph.new ], [ %step.add260.1, %vector.body ]
  %niter = phi i64 [ %unroll_iter, %vector.ph.new ], [ %niter.nsub.1, %vector.body ]
  %step.add = add <2 x i64> %vec.ind, <i64 2, i64 2>
  %step.add260 = add <2 x i64> %vec.ind, <i64 4, i64 4>
  %.lhs = extractelement <2 x i64> %vec.ind, i32 0
  %9 = add nsw i64 %.lhs, %mul41.us
  %10 = getelementptr inbounds i64, i64* %call24, i64 %9
  %11 = bitcast i64* %10 to <2 x i64>*
  store <2 x i64> %vec.ind, <2 x i64>* %11, align 8, !tbaa !5
  %12 = getelementptr i64, i64* %10, i64 2
  %13 = bitcast i64* %12 to <2 x i64>*
  store <2 x i64> %step.add, <2 x i64>* %13, align 8, !tbaa !5
  %14 = add nsw <2 x i64> %vec.ind, %vec.phi
  %15 = add nsw <2 x i64> %step.add, %vec.phi259
  %step.add.1 = add <2 x i64> %vec.ind, <i64 6, i64 6>
  %step.add260.1 = add <2 x i64> %vec.ind, <i64 8, i64 8>
  %.lhs.1 = extractelement <2 x i64> %step.add260, i32 0
  %16 = add nsw i64 %.lhs.1, %mul41.us
  %17 = getelementptr inbounds i64, i64* %call24, i64 %16
  %18 = bitcast i64* %17 to <2 x i64>*
  store <2 x i64> %step.add260, <2 x i64>* %18, align 8, !tbaa !5
  %19 = getelementptr i64, i64* %17, i64 2
  %20 = bitcast i64* %19 to <2 x i64>*
  store <2 x i64> %step.add.1, <2 x i64>* %20, align 8, !tbaa !5
  %21 = add nsw <2 x i64> %step.add260, %14
  %22 = add nsw <2 x i64> %step.add.1, %15
  %niter.nsub.1 = add i64 %niter, -2
  %niter.ncmp.1 = icmp eq i64 %niter.nsub.1, 0
  br i1 %niter.ncmp.1, label %middle.block.unr-lcssa.loopexit, label %vector.body, !llvm.loop !7

middle.block.unr-lcssa.loopexit:                  ; preds = %vector.body
  br label %middle.block.unr-lcssa

middle.block.unr-lcssa:                           ; preds = %middle.block.unr-lcssa.loopexit, %vector.ph
  %.lcssa266.ph = phi <2 x i64> [ undef, %vector.ph ], [ %22, %middle.block.unr-lcssa.loopexit ]
  %.lcssa.ph = phi <2 x i64> [ undef, %vector.ph ], [ %21, %middle.block.unr-lcssa.loopexit ]
  %vec.phi.unr = phi <2 x i64> [ %8, %vector.ph ], [ %21, %middle.block.unr-lcssa.loopexit ]
  %vec.phi259.unr = phi <2 x i64> [ zeroinitializer, %vector.ph ], [ %22, %middle.block.unr-lcssa.loopexit ]
  %vec.ind.unr = phi <2 x i64> [ <i64 0, i64 1>, %vector.ph ], [ %step.add260.1, %middle.block.unr-lcssa.loopexit ]
  br i1 %lcmp.mod, label %middle.block, label %vector.body.epil.preheader

vector.body.epil.preheader:                       ; preds = %middle.block.unr-lcssa
  br label %vector.body.epil

vector.body.epil:                                 ; preds = %vector.body.epil.preheader
  %step.add.epil = add <2 x i64> %vec.ind.unr, <i64 2, i64 2>
  %.lhs.epil = extractelement <2 x i64> %vec.ind.unr, i32 0
  %23 = add nsw i64 %.lhs.epil, %mul41.us
  %24 = getelementptr inbounds i64, i64* %call24, i64 %23
  %25 = bitcast i64* %24 to <2 x i64>*
  store <2 x i64> %vec.ind.unr, <2 x i64>* %25, align 8, !tbaa !5
  %26 = getelementptr i64, i64* %24, i64 2
  %27 = bitcast i64* %26 to <2 x i64>*
  store <2 x i64> %step.add.epil, <2 x i64>* %27, align 8, !tbaa !5
  br label %middle.block.epilog-lcssa

middle.block.epilog-lcssa:                        ; preds = %vector.body.epil
  %28 = add nsw <2 x i64> %step.add.epil, %vec.phi259.unr
  %29 = add nsw <2 x i64> %vec.ind.unr, %vec.phi.unr
  br label %middle.block

middle.block:                                     ; preds = %middle.block.unr-lcssa, %middle.block.epilog-lcssa
  %.lcssa266 = phi <2 x i64> [ %.lcssa266.ph, %middle.block.unr-lcssa ], [ %28, %middle.block.epilog-lcssa ]
  %.lcssa = phi <2 x i64> [ %.lcssa.ph, %middle.block.unr-lcssa ], [ %29, %middle.block.epilog-lcssa ]
  %bin.rdx = add <2 x i64> %.lcssa266, %.lcssa
  %rdx.shuf = shufflevector <2 x i64> %bin.rdx, <2 x i64> undef, <2 x i32> <i32 1, i32 undef>
  %bin.rdx263 = add <2 x i64> %bin.rdx, %rdx.shuf
  %30 = extractelement <2 x i64> %bin.rdx263, i32 0
  br i1 %cmp.n, label %blklab16.loopexit.us, label %if.end39.us.us.preheader264

if.end39.us232:                                   ; preds = %if.end39.us232.preheader, %gcd_cached.exit.us246
  %sum.1221.us233 = phi i64 [ %add46.us250, %gcd_cached.exit.us246 ], [ %sum.0225.us, %if.end39.us232.preheader ]
  %j.0220.us234 = phi i64 [ %add47.us251, %gcd_cached.exit.us246 ], [ 0, %if.end39.us232.preheader ]
  %cmp3.i.us236 = icmp eq i64 %j.0220.us234, 0
  br i1 %cmp3.i.us236, label %gcd_cached.exit.us246, label %blklab9.i.us237

blklab9.i.us237:                                  ; preds = %if.end39.us232
  %cmp9.i.us238 = icmp sgt i64 %i.0223.us, %j.0220.us234
  %sub12.neg.i.us239 = select i1 %cmp9.i.us238, i64 0, i64 %a.op.i.us
  %b.addr.0.i.us240 = add i64 %sub12.neg.i.us239, %j.0220.us234
  %sub.i.us241 = select i1 %cmp9.i.us238, i64 %j.0220.us234, i64 0
  %a.addr.0.i.us242 = sub nsw i64 %i.0223.us, %sub.i.us241
  %mul.i.us243 = mul nsw i64 %a.addr.0.i.us242, %1
  %add.i.us244 = add nsw i64 %b.addr.0.i.us240, %mul.i.us243
  %arrayidx.i.us245 = getelementptr inbounds i64, i64* %call24, i64 %add.i.us244
  %31 = load i64, i64* %arrayidx.i.us245, align 8, !tbaa !5
  br label %gcd_cached.exit.us246

gcd_cached.exit.us246:                            ; preds = %blklab9.i.us237, %if.end39.us232
  %retval.0.i.us247 = phi i64 [ %31, %blklab9.i.us237 ], [ %i.0223.us, %if.end39.us232 ]
  %add.us248 = add nsw i64 %j.0220.us234, %mul41.us
  %arrayidx42.us249 = getelementptr inbounds i64, i64* %call24, i64 %add.us248
  store i64 %retval.0.i.us247, i64* %arrayidx42.us249, align 8, !tbaa !5
  %add46.us250 = add nsw i64 %retval.0.i.us247, %sum.1221.us233
  %add47.us251 = add nuw nsw i64 %j.0220.us234, 1
  %exitcond.us252 = icmp eq i64 %add47.us251, %1
  br i1 %exitcond.us252, label %blklab16.loopexit.us.loopexit265, label %if.end39.us232

blklab16.loopexit.us.loopexit:                    ; preds = %if.end39.us.us
  br label %blklab16.loopexit.us

blklab16.loopexit.us.loopexit265:                 ; preds = %gcd_cached.exit.us246
  br label %blklab16.loopexit.us

blklab16.loopexit.us:                             ; preds = %blklab16.loopexit.us.loopexit265, %blklab16.loopexit.us.loopexit, %middle.block
  %add46.lcssa.us = phi i64 [ %30, %middle.block ], [ %add46.us.us, %blklab16.loopexit.us.loopexit ], [ %add46.us250, %blklab16.loopexit.us.loopexit265 ]
  %add48.us = add nuw nsw i64 %i.0223.us, 1
  %exitcond227.us = icmp eq i64 %add48.us, %1
  br i1 %exitcond227.us, label %if.then101.loopexit, label %while.cond34.preheader.us

if.end39.us.us:                                   ; preds = %if.end39.us.us.preheader264, %if.end39.us.us
  %sum.1221.us.us = phi i64 [ %add46.us.us, %if.end39.us.us ], [ %sum.1221.us.us.ph, %if.end39.us.us.preheader264 ]
  %j.0220.us.us = phi i64 [ %add47.us.us, %if.end39.us.us ], [ %j.0220.us.us.ph, %if.end39.us.us.preheader264 ]
  %add.us.us = add nsw i64 %j.0220.us.us, %mul41.us
  %arrayidx42.us.us = getelementptr inbounds i64, i64* %call24, i64 %add.us.us
  store i64 %j.0220.us.us, i64* %arrayidx42.us.us, align 8, !tbaa !5
  %add46.us.us = add nsw i64 %j.0220.us.us, %sum.1221.us.us
  %add47.us.us = add nuw nsw i64 %j.0220.us.us, 1
  %exitcond.us.us = icmp eq i64 %add47.us.us, %1
  br i1 %exitcond.us.us, label %blklab16.loopexit.us.loopexit, label %if.end39.us.us, !llvm.loop !10

if.then101.loopexit:                              ; preds = %blklab16.loopexit.us
  br label %if.then101

if.then101:                                       ; preds = %if.then101.loopexit, %if.end8
  %sum.0.lcssa = phi i64 [ 0, %if.end8 ], [ %add46.lcssa.us, %if.then101.loopexit ]
  %call53 = tail call i64* @create1DArray(i32 0, i32 5) #5
  %32 = bitcast i64* %call53 to <2 x i64>*
  store <2 x i64> <i64 83, i64 117>, <2 x i64>* %32, align 8, !tbaa !5
  %arrayidx56 = getelementptr inbounds i64, i64* %call53, i64 2
  %33 = bitcast i64* %arrayidx56 to <2 x i64>*
  store <2 x i64> <i64 109, i64 58>, <2 x i64>* %33, align 8, !tbaa !5
  %arrayidx58 = getelementptr inbounds i64, i64* %call53, i64 4
  store i64 32, i64* %arrayidx58, align 8, !tbaa !5
  tail call void @printf_s(i64* %call53, i64 5) #5
  %call59 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.1, i64 0, i64 0), i64 %sum.0.lcssa)
  %call64 = tail call i64* @create1DArray(i32 0, i32 32) #5
  %34 = bitcast i64* %call64 to <2 x i64>*
  store <2 x i64> <i64 80, i64 97>, <2 x i64>* %34, align 8, !tbaa !5
  %arrayidx67 = getelementptr inbounds i64, i64* %call64, i64 2
  %35 = bitcast i64* %arrayidx67 to <2 x i64>*
  store <2 x i64> <i64 115, i64 115>, <2 x i64>* %35, align 8, !tbaa !5
  %arrayidx69 = getelementptr inbounds i64, i64* %call64, i64 4
  %36 = bitcast i64* %arrayidx69 to <2 x i64>*
  store <2 x i64> <i64 32, i64 99>, <2 x i64>* %36, align 8, !tbaa !5
  %arrayidx71 = getelementptr inbounds i64, i64* %call64, i64 6
  %37 = bitcast i64* %arrayidx71 to <2 x i64>*
  store <2 x i64> <i64 97, i64 99>, <2 x i64>* %37, align 8, !tbaa !5
  %arrayidx73 = getelementptr inbounds i64, i64* %call64, i64 8
  %38 = bitcast i64* %arrayidx73 to <2 x i64>*
  store <2 x i64> <i64 104, i64 101>, <2 x i64>* %38, align 8, !tbaa !5
  %arrayidx75 = getelementptr inbounds i64, i64* %call64, i64 10
  %39 = bitcast i64* %arrayidx75 to <2 x i64>*
  store <2 x i64> <i64 100, i64 32>, <2 x i64>* %39, align 8, !tbaa !5
  %arrayidx77 = getelementptr inbounds i64, i64* %call64, i64 12
  %40 = bitcast i64* %arrayidx77 to <2 x i64>*
  store <2 x i64> <i64 69, i64 117>, <2 x i64>* %40, align 8, !tbaa !5
  %arrayidx79 = getelementptr inbounds i64, i64* %call64, i64 14
  %41 = bitcast i64* %arrayidx79 to <2 x i64>*
  store <2 x i64> <i64 99, i64 108>, <2 x i64>* %41, align 8, !tbaa !5
  %arrayidx81 = getelementptr inbounds i64, i64* %call64, i64 16
  %42 = bitcast i64* %arrayidx81 to <2 x i64>*
  store <2 x i64> <i64 105, i64 100>, <2 x i64>* %42, align 8, !tbaa !5
  %arrayidx83 = getelementptr inbounds i64, i64* %call64, i64 18
  %43 = bitcast i64* %arrayidx83 to <2 x i64>*
  store <2 x i64> <i64 32, i64 71>, <2 x i64>* %43, align 8, !tbaa !5
  %arrayidx85 = getelementptr inbounds i64, i64* %call64, i64 20
  %44 = bitcast i64* %arrayidx85 to <2 x i64>*
  store <2 x i64> <i64 67, i64 68>, <2 x i64>* %44, align 8, !tbaa !5
  %arrayidx87 = getelementptr inbounds i64, i64* %call64, i64 22
  %45 = bitcast i64* %arrayidx87 to <2 x i64>*
  store <2 x i64> <i64 32, i64 116>, <2 x i64>* %45, align 8, !tbaa !5
  %arrayidx89 = getelementptr inbounds i64, i64* %call64, i64 24
  %46 = bitcast i64* %arrayidx89 to <2 x i64>*
  store <2 x i64> <i64 101, i64 115>, <2 x i64>* %46, align 8, !tbaa !5
  %arrayidx91 = getelementptr inbounds i64, i64* %call64, i64 26
  %47 = bitcast i64* %arrayidx91 to <2 x i64>*
  store <2 x i64> <i64 116, i64 32>, <2 x i64>* %47, align 8, !tbaa !5
  %arrayidx93 = getelementptr inbounds i64, i64* %call64, i64 28
  %48 = bitcast i64* %arrayidx93 to <2 x i64>*
  store <2 x i64> <i64 99, i64 97>, <2 x i64>* %48, align 8, !tbaa !5
  %arrayidx95 = getelementptr inbounds i64, i64* %call64, i64 30
  %49 = bitcast i64* %arrayidx95 to <2 x i64>*
  store <2 x i64> <i64 115, i64 101>, <2 x i64>* %49, align 8, !tbaa !5
  tail call void @println_s(i64* %call64, i64 32) #5
  %phitmp = bitcast i64* %call64 to i8*
  %phitmp215 = bitcast i64* %call53 to i8*
  %phitmp216 = bitcast i64* %call13 to i8*
  %phitmp217 = bitcast i64* %call24 to i8*
  %50 = bitcast i64* %call1 to i8*
  tail call void @free(i8* %50) #5
  tail call void @free(i8* %phitmp217) #5
  tail call void @free2DArray(i64** %call, i64 %conv) #5
  tail call void @free(i8* %phitmp216) #5
  tail call void @free(i8* %phitmp215) #5
  tail call void @free(i8* %phitmp) #5
  br label %if.end123

if.end123.critedge:                               ; preds = %entry
  tail call void @free2DArray(i64** %call, i64 %conv) #5
  br label %if.end123

if.end123:                                        ; preds = %if.end123.critedge, %if.then101
  tail call void @exit(i32 0) #7
  unreachable
}

declare void @free2DArray(i64**, i64) local_unnamed_addr #4

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
