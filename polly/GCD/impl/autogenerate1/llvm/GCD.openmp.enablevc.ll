; ModuleID = 'GCD.c'
source_filename = "GCD.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external global %struct._IO_FILE*, align 8
@.str = private unnamed_addr constant [5 x i8] c"fail\00", align 1
@.str.1 = private unnamed_addr constant [6 x i8] c"%lld\0A\00", align 1

; Function Attrs: nounwind uwtable
define i64 @gcd(i64 %a, i64 %b) #0 {
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
  %a.addr.0.ph3648 = phi i64 [ %a.addr.033.lcssa, %blklab5 ], [ %a, %blklab4.preheader.preheader ]
  br label %blklab4

if.end3.loopexit:                                 ; preds = %if.end9
  br label %if.end3

if.end3:                                          ; preds = %if.end3.loopexit, %while.cond.preheader
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !1
  %1 = tail call i64 @fwrite(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str, i64 0, i64 0), i64 4, i64 1, %struct._IO_FILE* %0) #7
  tail call void @exit(i32 -1) #8
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
  %a.addr.033.lcssa = phi i64 [ %a.addr.033, %blklab4 ]
  %sub10 = sub nsw i64 %b.addr.0.ph3549, %a.addr.033.lcssa
  %cmp4 = icmp eq i64 %sub10, 0
  br i1 %cmp4, label %cleanup.loopexit, label %blklab4.preheader

cleanup.loopexit:                                 ; preds = %blklab5
  %a.addr.033.lcssa.lcssa = phi i64 [ %a.addr.033.lcssa, %blklab5 ]
  br label %cleanup

cleanup:                                          ; preds = %cleanup.loopexit, %blklab4.lr.ph.preheader, %entry
  %retval.0 = phi i64 [ %b, %entry ], [ %a, %blklab4.lr.ph.preheader ], [ %a.addr.033.lcssa.lcssa, %cleanup.loopexit ]
  ret i64 %retval.0
}

; Function Attrs: noreturn nounwind
declare void @exit(i32) #1

; Function Attrs: norecurse nounwind readonly uwtable
define i64 @gcd_cached(i64 %a, i64 %b, i64 %n, i64* nocapture readonly %gcds, i64 %gcds_size) #2 {
entry:
  %cmp = icmp eq i64 %a, 0
  br i1 %cmp, label %cleanup, label %blklab7

blklab7:                                          ; preds = %entry
  %cmp1 = icmp eq i64 %b, 0
  br i1 %cmp1, label %cleanup, label %blklab9

blklab9:                                          ; preds = %blklab7
  %cmp4 = icmp sgt i64 %a, %b
  %a.op = sub i64 0, %a
  %sub7.neg = select i1 %cmp4, i64 0, i64 %a.op
  %b.addr.0 = add i64 %sub7.neg, %b
  %sub = select i1 %cmp4, i64 %b, i64 0
  %a.addr.0 = sub nsw i64 %a, %sub
  %mul = mul nsw i64 %a.addr.0, %n
  %add = add nsw i64 %b.addr.0, %mul
  %arrayidx = getelementptr inbounds i64, i64* %gcds, i64 %add
  %0 = load i64, i64* %arrayidx, align 8, !tbaa !5
  br label %cleanup

cleanup:                                          ; preds = %blklab7, %entry, %blklab9
  %retval.0 = phi i64 [ %0, %blklab9 ], [ %b, %entry ], [ %a, %blklab7 ]
  ret i64 %retval.0
}

; Function Attrs: noreturn nounwind uwtable
define i32 @main(i32 %argc, i8** %args) #3 {
entry:
  %call = tail call i64** @convertArgsToIntArray(i32 %argc, i8** %args) #6
  %0 = load i64*, i64** %call, align 8, !tbaa !1
  %call1 = tail call i64* @parseStringToInt(i64* %0) #6
  %cmp = icmp eq i64* %call1, null
  br i1 %cmp, label %blklab13, label %if.end

if.end:                                           ; preds = %entry
  %1 = load i64, i64* %call1, align 8, !tbaa !5
  %call3 = tail call noalias i8* @malloc(i64 32) #6
  %2 = bitcast i8* %call3 to i64*
  %3 = bitcast i8* %call3 to <2 x i64>*
  store <2 x i64> <i64 78, i64 32>, <2 x i64>* %3, align 8, !tbaa !5
  %arrayidx6 = getelementptr inbounds i8, i8* %call3, i64 16
  %4 = bitcast i8* %arrayidx6 to <2 x i64>*
  store <2 x i64> <i64 61, i64 32>, <2 x i64>* %4, align 8, !tbaa !5
  tail call void @printf_s(i64* %2, i64 4) #6
  %call8 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.1, i64 0, i64 0), i64 %1)
  %mul = mul nsw i64 %1, %1
  %conv10 = trunc i64 %mul to i32
  %call11 = tail call i64* @gen1DArray(i32 0, i32 %conv10) #6
  %cmp12136 = icmp sgt i64 %1, 0
  br i1 %cmp12136, label %while.cond16.preheader.us.preheader, label %blklab14

while.cond16.preheader.us.preheader:              ; preds = %if.end
  %5 = add i64 %1, -4
  %6 = lshr i64 %5, 2
  %7 = add nuw nsw i64 %6, 1
  %min.iters.check = icmp ult i64 %1, 4
  %n.vec = and i64 %1, -4
  %cmp.zero = icmp eq i64 %n.vec, 0
  %xtraiter = and i64 %7, 1
  %lcmp.mod = icmp eq i64 %7, %xtraiter
  %unroll_iter = sub nsw i64 %7, %xtraiter
  %8 = icmp eq i64 %xtraiter, 0
  %cmp.n = icmp eq i64 %1, %n.vec
  br label %while.cond16.preheader.us

while.cond16.preheader.us:                        ; preds = %while.cond16.preheader.us.preheader, %blklab16.loopexit.us
  %sum.0139.us = phi i64 [ %add28.lcssa.us, %blklab16.loopexit.us ], [ 0, %while.cond16.preheader.us.preheader ]
  %i.0137.us = phi i64 [ %add30.us, %blklab16.loopexit.us ], [ 0, %while.cond16.preheader.us.preheader ]
  %cmp.i.us = icmp eq i64 %i.0137.us, 0
  %mul23.us = mul nsw i64 %i.0137.us, %1
  %a.op.i.us = sub i64 0, %i.0137.us
  br i1 %cmp.i.us, label %if.end21.us.us.preheader, label %if.end21.us142.preheader

if.end21.us142.preheader:                         ; preds = %while.cond16.preheader.us
  br label %if.end21.us142

if.end21.us.us.preheader:                         ; preds = %while.cond16.preheader.us
  br i1 %min.iters.check, label %if.end21.us.us.preheader176, label %min.iters.checked

if.end21.us.us.preheader176:                      ; preds = %middle.block, %min.iters.checked, %if.end21.us.us.preheader
  %sum.1135.us.us.ph = phi i64 [ %sum.0139.us, %min.iters.checked ], [ %sum.0139.us, %if.end21.us.us.preheader ], [ %31, %middle.block ]
  %j.0134.us.us.ph = phi i64 [ 0, %min.iters.checked ], [ 0, %if.end21.us.us.preheader ], [ %n.vec, %middle.block ]
  br label %if.end21.us.us

min.iters.checked:                                ; preds = %if.end21.us.us.preheader
  br i1 %cmp.zero, label %if.end21.us.us.preheader176, label %vector.ph

vector.ph:                                        ; preds = %min.iters.checked
  %9 = insertelement <2 x i64> <i64 undef, i64 0>, i64 %sum.0139.us, i32 0
  br i1 %lcmp.mod, label %middle.block.unr-lcssa, label %vector.ph.new

vector.ph.new:                                    ; preds = %vector.ph
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph.new
  %index = phi i64 [ 0, %vector.ph.new ], [ %index.next.1, %vector.body ]
  %vec.phi = phi <2 x i64> [ %9, %vector.ph.new ], [ %22, %vector.body ]
  %vec.phi169 = phi <2 x i64> [ zeroinitializer, %vector.ph.new ], [ %23, %vector.body ]
  %niter = phi i64 [ %unroll_iter, %vector.ph.new ], [ %niter.nsub.1, %vector.body ]
  %broadcast.splatinsert = insertelement <2 x i64> undef, i64 %index, i32 0
  %broadcast.splat = shufflevector <2 x i64> %broadcast.splatinsert, <2 x i64> undef, <2 x i32> zeroinitializer
  %induction = add <2 x i64> %broadcast.splat, <i64 0, i64 1>
  %induction170 = add <2 x i64> %broadcast.splat, <i64 2, i64 3>
  %10 = add nsw i64 %index, %mul23.us
  %11 = getelementptr inbounds i64, i64* %call11, i64 %10
  %12 = bitcast i64* %11 to <2 x i64>*
  store <2 x i64> %induction, <2 x i64>* %12, align 8, !tbaa !5
  %13 = getelementptr i64, i64* %11, i64 2
  %14 = bitcast i64* %13 to <2 x i64>*
  store <2 x i64> %induction170, <2 x i64>* %14, align 8, !tbaa !5
  %15 = add nsw <2 x i64> %induction, %vec.phi
  %16 = add nsw <2 x i64> %induction170, %vec.phi169
  %index.next = or i64 %index, 4
  %broadcast.splatinsert.1 = insertelement <2 x i64> undef, i64 %index.next, i32 0
  %broadcast.splat.1 = shufflevector <2 x i64> %broadcast.splatinsert.1, <2 x i64> undef, <2 x i32> zeroinitializer
  %induction.1 = add <2 x i64> %broadcast.splat.1, <i64 0, i64 1>
  %induction170.1 = add <2 x i64> %broadcast.splat.1, <i64 2, i64 3>
  %17 = add nsw i64 %index.next, %mul23.us
  %18 = getelementptr inbounds i64, i64* %call11, i64 %17
  %19 = bitcast i64* %18 to <2 x i64>*
  store <2 x i64> %induction.1, <2 x i64>* %19, align 8, !tbaa !5
  %20 = getelementptr i64, i64* %18, i64 2
  %21 = bitcast i64* %20 to <2 x i64>*
  store <2 x i64> %induction170.1, <2 x i64>* %21, align 8, !tbaa !5
  %22 = add nsw <2 x i64> %induction.1, %15
  %23 = add nsw <2 x i64> %induction170.1, %16
  %index.next.1 = add i64 %index, 8
  %niter.nsub.1 = add i64 %niter, -2
  %niter.ncmp.1 = icmp eq i64 %niter.nsub.1, 0
  br i1 %niter.ncmp.1, label %middle.block.unr-lcssa.loopexit, label %vector.body, !llvm.loop !7

middle.block.unr-lcssa.loopexit:                  ; preds = %vector.body
  %index.next.1.lcssa = phi i64 [ %index.next.1, %vector.body ]
  %.lcssa180 = phi <2 x i64> [ %23, %vector.body ]
  %.lcssa179 = phi <2 x i64> [ %22, %vector.body ]
  br label %middle.block.unr-lcssa

middle.block.unr-lcssa:                           ; preds = %vector.ph, %middle.block.unr-lcssa.loopexit
  %.lcssa178.ph = phi <2 x i64> [ undef, %vector.ph ], [ %.lcssa180, %middle.block.unr-lcssa.loopexit ]
  %.lcssa.ph = phi <2 x i64> [ undef, %vector.ph ], [ %.lcssa179, %middle.block.unr-lcssa.loopexit ]
  %index.unr = phi i64 [ 0, %vector.ph ], [ %index.next.1.lcssa, %middle.block.unr-lcssa.loopexit ]
  %vec.phi.unr = phi <2 x i64> [ %9, %vector.ph ], [ %.lcssa179, %middle.block.unr-lcssa.loopexit ]
  %vec.phi169.unr = phi <2 x i64> [ zeroinitializer, %vector.ph ], [ %.lcssa180, %middle.block.unr-lcssa.loopexit ]
  br i1 %8, label %middle.block, label %vector.body.epil.preheader

vector.body.epil.preheader:                       ; preds = %middle.block.unr-lcssa
  br label %vector.body.epil

vector.body.epil:                                 ; preds = %vector.body.epil.preheader
  %broadcast.splatinsert.epil = insertelement <2 x i64> undef, i64 %index.unr, i32 0
  %broadcast.splat.epil = shufflevector <2 x i64> %broadcast.splatinsert.epil, <2 x i64> undef, <2 x i32> zeroinitializer
  %induction.epil = add <2 x i64> %broadcast.splat.epil, <i64 0, i64 1>
  %induction170.epil = add <2 x i64> %broadcast.splat.epil, <i64 2, i64 3>
  %24 = add nsw i64 %index.unr, %mul23.us
  %25 = getelementptr inbounds i64, i64* %call11, i64 %24
  %26 = bitcast i64* %25 to <2 x i64>*
  store <2 x i64> %induction.epil, <2 x i64>* %26, align 8, !tbaa !5
  %27 = getelementptr i64, i64* %25, i64 2
  %28 = bitcast i64* %27 to <2 x i64>*
  store <2 x i64> %induction170.epil, <2 x i64>* %28, align 8, !tbaa !5
  br label %middle.block.epilog-lcssa

middle.block.epilog-lcssa:                        ; preds = %vector.body.epil
  %29 = add nsw <2 x i64> %induction170.epil, %vec.phi169.unr
  %30 = add nsw <2 x i64> %induction.epil, %vec.phi.unr
  br label %middle.block

middle.block:                                     ; preds = %middle.block.unr-lcssa, %middle.block.epilog-lcssa
  %.lcssa178 = phi <2 x i64> [ %.lcssa178.ph, %middle.block.unr-lcssa ], [ %29, %middle.block.epilog-lcssa ]
  %.lcssa = phi <2 x i64> [ %.lcssa.ph, %middle.block.unr-lcssa ], [ %30, %middle.block.epilog-lcssa ]
  %bin.rdx = add <2 x i64> %.lcssa178, %.lcssa
  %rdx.shuf = shufflevector <2 x i64> %bin.rdx, <2 x i64> undef, <2 x i32> <i32 1, i32 undef>
  %bin.rdx175 = add <2 x i64> %bin.rdx, %rdx.shuf
  %31 = extractelement <2 x i64> %bin.rdx175, i32 0
  br i1 %cmp.n, label %blklab16.loopexit.us, label %if.end21.us.us.preheader176

if.end21.us142:                                   ; preds = %if.end21.us142.preheader, %gcd_cached.exit.us156
  %sum.1135.us143 = phi i64 [ %add28.us160, %gcd_cached.exit.us156 ], [ %sum.0139.us, %if.end21.us142.preheader ]
  %j.0134.us144 = phi i64 [ %add29.us161, %gcd_cached.exit.us156 ], [ 0, %if.end21.us142.preheader ]
  %cmp1.i.us146 = icmp eq i64 %j.0134.us144, 0
  br i1 %cmp1.i.us146, label %gcd_cached.exit.us156, label %blklab9.i.us147

blklab9.i.us147:                                  ; preds = %if.end21.us142
  %cmp4.i.us148 = icmp sgt i64 %i.0137.us, %j.0134.us144
  %sub7.neg.i.us149 = select i1 %cmp4.i.us148, i64 0, i64 %a.op.i.us
  %b.addr.0.i.us150 = add i64 %sub7.neg.i.us149, %j.0134.us144
  %sub.i.us151 = select i1 %cmp4.i.us148, i64 %j.0134.us144, i64 0
  %a.addr.0.i.us152 = sub nsw i64 %i.0137.us, %sub.i.us151
  %mul.i.us153 = mul nsw i64 %a.addr.0.i.us152, %1
  %add.i.us154 = add nsw i64 %b.addr.0.i.us150, %mul.i.us153
  %arrayidx.i.us155 = getelementptr inbounds i64, i64* %call11, i64 %add.i.us154
  %32 = load i64, i64* %arrayidx.i.us155, align 8, !tbaa !5
  br label %gcd_cached.exit.us156

gcd_cached.exit.us156:                            ; preds = %blklab9.i.us147, %if.end21.us142
  %retval.0.i.us157 = phi i64 [ %32, %blklab9.i.us147 ], [ %i.0137.us, %if.end21.us142 ]
  %add.us158 = add nsw i64 %j.0134.us144, %mul23.us
  %arrayidx24.us159 = getelementptr inbounds i64, i64* %call11, i64 %add.us158
  store i64 %retval.0.i.us157, i64* %arrayidx24.us159, align 8, !tbaa !5
  %add28.us160 = add nsw i64 %retval.0.i.us157, %sum.1135.us143
  %add29.us161 = add nuw nsw i64 %j.0134.us144, 1
  %exitcond.us162 = icmp eq i64 %add29.us161, %1
  br i1 %exitcond.us162, label %blklab16.loopexit.us.loopexit177, label %if.end21.us142

blklab16.loopexit.us.loopexit:                    ; preds = %if.end21.us.us
  %add28.us.us.lcssa = phi i64 [ %add28.us.us, %if.end21.us.us ]
  br label %blklab16.loopexit.us

blklab16.loopexit.us.loopexit177:                 ; preds = %gcd_cached.exit.us156
  %add28.us160.lcssa = phi i64 [ %add28.us160, %gcd_cached.exit.us156 ]
  br label %blklab16.loopexit.us

blklab16.loopexit.us:                             ; preds = %blklab16.loopexit.us.loopexit177, %blklab16.loopexit.us.loopexit, %middle.block
  %add28.lcssa.us = phi i64 [ %31, %middle.block ], [ %add28.us.us.lcssa, %blklab16.loopexit.us.loopexit ], [ %add28.us160.lcssa, %blklab16.loopexit.us.loopexit177 ]
  %add30.us = add nuw nsw i64 %i.0137.us, 1
  %exitcond141.us = icmp eq i64 %add30.us, %1
  br i1 %exitcond141.us, label %blklab14.loopexit, label %while.cond16.preheader.us

if.end21.us.us:                                   ; preds = %if.end21.us.us.preheader176, %if.end21.us.us
  %sum.1135.us.us = phi i64 [ %add28.us.us, %if.end21.us.us ], [ %sum.1135.us.us.ph, %if.end21.us.us.preheader176 ]
  %j.0134.us.us = phi i64 [ %add29.us.us, %if.end21.us.us ], [ %j.0134.us.us.ph, %if.end21.us.us.preheader176 ]
  %add.us.us = add nsw i64 %j.0134.us.us, %mul23.us
  %arrayidx24.us.us = getelementptr inbounds i64, i64* %call11, i64 %add.us.us
  store i64 %j.0134.us.us, i64* %arrayidx24.us.us, align 8, !tbaa !5
  %add28.us.us = add nsw i64 %j.0134.us.us, %sum.1135.us.us
  %add29.us.us = add nuw nsw i64 %j.0134.us.us, 1
  %exitcond.us.us = icmp eq i64 %add29.us.us, %1
  br i1 %exitcond.us.us, label %blklab16.loopexit.us.loopexit, label %if.end21.us.us, !llvm.loop !10

blklab14.loopexit:                                ; preds = %blklab16.loopexit.us
  %add28.lcssa.us.lcssa = phi i64 [ %add28.lcssa.us, %blklab16.loopexit.us ]
  br label %blklab14

blklab14:                                         ; preds = %blklab14.loopexit, %if.end
  %sum.0.lcssa = phi i64 [ 0, %if.end ], [ %add28.lcssa.us.lcssa, %blklab14.loopexit ]
  %call31 = tail call noalias i8* @malloc(i64 40) #6
  %33 = bitcast i8* %call31 to i64*
  %34 = bitcast i8* %call31 to <2 x i64>*
  store <2 x i64> <i64 83, i64 117>, <2 x i64>* %34, align 8, !tbaa !5
  %arrayidx34 = getelementptr inbounds i8, i8* %call31, i64 16
  %35 = bitcast i8* %arrayidx34 to <2 x i64>*
  store <2 x i64> <i64 109, i64 58>, <2 x i64>* %35, align 8, !tbaa !5
  %arrayidx36 = getelementptr inbounds i8, i8* %call31, i64 32
  %36 = bitcast i8* %arrayidx36 to i64*
  store i64 32, i64* %36, align 8, !tbaa !5
  tail call void @printf_s(i64* %33, i64 5) #6
  %call37 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.1, i64 0, i64 0), i64 %sum.0.lcssa)
  %call38 = tail call noalias i8* @malloc(i64 256) #6
  %37 = bitcast i8* %call38 to i64*
  %38 = bitcast i8* %call38 to <2 x i64>*
  store <2 x i64> <i64 80, i64 97>, <2 x i64>* %38, align 8, !tbaa !5
  %arrayidx41 = getelementptr inbounds i8, i8* %call38, i64 16
  %39 = bitcast i8* %arrayidx41 to <2 x i64>*
  store <2 x i64> <i64 115, i64 115>, <2 x i64>* %39, align 8, !tbaa !5
  %arrayidx43 = getelementptr inbounds i8, i8* %call38, i64 32
  %40 = bitcast i8* %arrayidx43 to <2 x i64>*
  store <2 x i64> <i64 32, i64 99>, <2 x i64>* %40, align 8, !tbaa !5
  %arrayidx45 = getelementptr inbounds i8, i8* %call38, i64 48
  %41 = bitcast i8* %arrayidx45 to <2 x i64>*
  store <2 x i64> <i64 97, i64 99>, <2 x i64>* %41, align 8, !tbaa !5
  %arrayidx47 = getelementptr inbounds i8, i8* %call38, i64 64
  %42 = bitcast i8* %arrayidx47 to <2 x i64>*
  store <2 x i64> <i64 104, i64 101>, <2 x i64>* %42, align 8, !tbaa !5
  %arrayidx49 = getelementptr inbounds i8, i8* %call38, i64 80
  %43 = bitcast i8* %arrayidx49 to <2 x i64>*
  store <2 x i64> <i64 100, i64 32>, <2 x i64>* %43, align 8, !tbaa !5
  %arrayidx51 = getelementptr inbounds i8, i8* %call38, i64 96
  %44 = bitcast i8* %arrayidx51 to <2 x i64>*
  store <2 x i64> <i64 69, i64 117>, <2 x i64>* %44, align 8, !tbaa !5
  %arrayidx53 = getelementptr inbounds i8, i8* %call38, i64 112
  %45 = bitcast i8* %arrayidx53 to <2 x i64>*
  store <2 x i64> <i64 99, i64 108>, <2 x i64>* %45, align 8, !tbaa !5
  %arrayidx55 = getelementptr inbounds i8, i8* %call38, i64 128
  %46 = bitcast i8* %arrayidx55 to <2 x i64>*
  store <2 x i64> <i64 105, i64 100>, <2 x i64>* %46, align 8, !tbaa !5
  %arrayidx57 = getelementptr inbounds i8, i8* %call38, i64 144
  %47 = bitcast i8* %arrayidx57 to <2 x i64>*
  store <2 x i64> <i64 32, i64 71>, <2 x i64>* %47, align 8, !tbaa !5
  %arrayidx59 = getelementptr inbounds i8, i8* %call38, i64 160
  %48 = bitcast i8* %arrayidx59 to <2 x i64>*
  store <2 x i64> <i64 67, i64 68>, <2 x i64>* %48, align 8, !tbaa !5
  %arrayidx61 = getelementptr inbounds i8, i8* %call38, i64 176
  %49 = bitcast i8* %arrayidx61 to <2 x i64>*
  store <2 x i64> <i64 32, i64 116>, <2 x i64>* %49, align 8, !tbaa !5
  %arrayidx63 = getelementptr inbounds i8, i8* %call38, i64 192
  %50 = bitcast i8* %arrayidx63 to <2 x i64>*
  store <2 x i64> <i64 101, i64 115>, <2 x i64>* %50, align 8, !tbaa !5
  %arrayidx65 = getelementptr inbounds i8, i8* %call38, i64 208
  %51 = bitcast i8* %arrayidx65 to <2 x i64>*
  store <2 x i64> <i64 116, i64 32>, <2 x i64>* %51, align 8, !tbaa !5
  %arrayidx67 = getelementptr inbounds i8, i8* %call38, i64 224
  %52 = bitcast i8* %arrayidx67 to <2 x i64>*
  store <2 x i64> <i64 99, i64 97>, <2 x i64>* %52, align 8, !tbaa !5
  %arrayidx69 = getelementptr inbounds i8, i8* %call38, i64 240
  %53 = bitcast i8* %arrayidx69 to <2 x i64>*
  store <2 x i64> <i64 115, i64 101>, <2 x i64>* %53, align 8, !tbaa !5
  tail call void @println_s(i64* %37, i64 32) #6
  br label %blklab13

blklab13:                                         ; preds = %entry, %blklab14
  tail call void @exit(i32 0) #8
  unreachable
}

declare i64** @convertArgsToIntArray(i32, i8**) #4

declare i64* @parseStringToInt(i64*) #4

; Function Attrs: nounwind
declare noalias i8* @malloc(i64) #5

declare void @printf_s(i64*, i64) #4

; Function Attrs: nounwind
declare i32 @printf(i8* nocapture readonly, ...) #5

declare i64* @gen1DArray(i32, i32) #4

declare void @println_s(i64*, i64) #4

; Function Attrs: nounwind
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) #6

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { noreturn nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { norecurse nounwind readonly uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { noreturn nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #6 = { nounwind }
attributes #7 = { cold }
attributes #8 = { noreturn nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 3.9.0 (http://llvm.org/git/clang.git 2af14cc4a90f43170f8ea9c1dfa0f71f46a0621c) (http://llvm.org/git/llvm.git 1e7e2b2b556977af8ccc12b7afba61302f3a2da9)"}
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
