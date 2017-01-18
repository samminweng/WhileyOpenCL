; ModuleID = 'MergeSort_original.c'
source_filename = "MergeSort_original.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [5 x i8] c"%ld\0A\00", align 1

; Function Attrs: nounwind uwtable
define i64* @_sortV1_(i64* returned %items, i64 %items_size, i64 %start, i64 %end, i64* nocapture %_size_call_by_ref) local_unnamed_addr #0 {
entry:
  %0 = sub i64 0, %start
  %polly.par.LBPtr.i939 = alloca i64, align 8
  %polly.par.UBPtr.i940 = alloca i64, align 8
  %polly.par.LBPtr.i = alloca i64, align 8
  %polly.par.UBPtr.i = alloca i64, align 8
  %polly.par.userContext930 = alloca { i64, i64, i64, i64, i64*, i64*, i64 }, align 8
  %polly.par.userContext920 = alloca { i64, i64, i64, i64, i64*, i64*, i64 }, align 8
  %_16_size = alloca i64, align 8
  %_19_size = alloca i64, align 8
  %1 = bitcast i64* %_16_size to i8*
  call void @llvm.lifetime.start(i64 8, i8* nonnull %1) #8
  store i64 0, i64* %_16_size, align 8, !tbaa !1
  %2 = bitcast i64* %_19_size to i8*
  call void @llvm.lifetime.start(i64 8, i8* nonnull %2) #8
  store i64 0, i64* %_19_size, align 8, !tbaa !1
  %add = add nsw i64 %start, 1
  %cmp = icmp slt i64 %add, %end
  br i1 %cmp, label %if.end, label %blklab0

if.end:                                           ; preds = %entry
  %add1 = add nsw i64 %end, %start
  %div = sdiv i64 %add1, 2
  %conv = trunc i64 %start to i32
  %conv2 = trunc i64 %div to i32
  %call = tail call i64* @slice(i64* %items, i64 %items_size, i32 %conv, i32 %conv2) #8
  %sub = sub i64 %div, %start
  %call3 = tail call i64* @copy1DArray_int64_t(i64* %call, i64 %sub) #8
  %call4 = tail call i64* @copy1DArray_int64_t(i64* %call3, i64 %sub) #8
  %call5 = call i64* @_sortV1_(i64* %call4, i64 %sub, i64 0, i64 %div, i64* nonnull %_16_size)
  %3 = load i64, i64* %_16_size, align 8, !tbaa !1
  %call6 = tail call i64* @copy1DArray_int64_t(i64* %call5, i64 %3) #8
  %conv8 = trunc i64 %end to i32
  %call9 = tail call i64* @slice(i64* %items, i64 %items_size, i32 %conv2, i32 %conv8) #8
  %sub10 = sub nsw i64 %end, %div
  %call11 = tail call i64* @copy1DArray_int64_t(i64* %call9, i64 %sub10) #8
  %call13 = tail call i64* @copy1DArray_int64_t(i64* %call11, i64 %sub10) #8
  %call14 = call i64* @_sortV1_(i64* %call13, i64 %sub10, i64 0, i64 %sub10, i64* nonnull %_19_size)
  %4 = load i64, i64* %_19_size, align 8, !tbaa !1
  %call15 = tail call i64* @copy1DArray_int64_t(i64* %call14, i64 %4) #8
  %sub16 = sub nsw i64 %end, %start
  %cmp17185 = icmp sgt i64 %sub16, 0
  %cmp22186 = icmp sgt i64 %sub, 0
  %or.cond187 = and i1 %cmp17185, %cmp22186
  %cmp27188 = icmp sgt i64 %sub10, 0
  %or.cond178189 = and i1 %cmp27188, %or.cond187
  br i1 %or.cond178189, label %if.end30.preheader, label %while.cond43.preheader

if.end30.preheader:                               ; preds = %if.end
  br label %if.end30

while.cond43.preheader.loopexit:                  ; preds = %blklab4
  br label %while.cond43.preheader

while.cond43.preheader:                           ; preds = %while.cond43.preheader.loopexit, %if.end
  %l.0.lcssa = phi i64 [ 0, %if.end ], [ %l.1, %while.cond43.preheader.loopexit ]
  %r.0.lcssa = phi i64 [ 0, %if.end ], [ %r.1, %while.cond43.preheader.loopexit ]
  %i.0.lcssa = phi i64 [ 0, %if.end ], [ %add42, %while.cond43.preheader.loopexit ]
  %cmp46182 = icmp sgt i64 %sub, %l.0.lcssa
  br i1 %cmp46182, label %if.end49.lr.ph, label %while.cond54.preheader

if.end49.lr.ph:                                   ; preds = %while.cond43.preheader
  %5 = sub i64 %sub, %l.0.lcssa
  %6 = add i64 %5, %i.0.lcssa
  %7 = tail call { i64, i1 } @llvm.smul.with.overflow.i64(i64 %i.0.lcssa, i64 2)
  %.obit671 = extractvalue { i64, i1 } %7, 1
  %.res673 = extractvalue { i64, i1 } %7, 0
  %8 = tail call { i64, i1 } @llvm.sadd.with.overflow.i64(i64 %.res673, i64 %end)
  %.obit674 = extractvalue { i64, i1 } %8, 1
  %polly.overflow.state675 = or i1 %.obit671, %.obit674
  %.res676 = extractvalue { i64, i1 } %8, 0
  %9 = tail call { i64, i1 } @llvm.smul.with.overflow.i64(i64 %l.0.lcssa, i64 2)
  %.obit677 = extractvalue { i64, i1 } %9, 1
  %polly.overflow.state678 = or i1 %.obit677, %polly.overflow.state675
  %.res679 = extractvalue { i64, i1 } %9, 0
  %10 = tail call { i64, i1 } @llvm.sadd.with.overflow.i64(i64 %start, i64 %.res679)
  %.obit680 = extractvalue { i64, i1 } %10, 1
  %polly.overflow.state681 = or i1 %.obit680, %polly.overflow.state678
  %.res682 = extractvalue { i64, i1 } %10, 0
  %11 = tail call { i64, i1 } @llvm.sadd.with.overflow.i64(i64 %.res682, i64 -1)
  %.obit683 = extractvalue { i64, i1 } %11, 1
  %polly.overflow.state684 = or i1 %.obit683, %polly.overflow.state681
  %.res685 = extractvalue { i64, i1 } %11, 0
  %12 = icmp sge i64 %.res676, %.res685
  %13 = tail call { i64, i1 } @llvm.sadd.with.overflow.i64(i64 %start, i64 %end)
  %.obit686 = extractvalue { i64, i1 } %13, 1
  %14 = icmp slt i64 %add1, 0
  %15 = and i1 %14, %12
  %polly.overflow.state696 = or i1 %.obit686, %polly.overflow.state684
  %16 = tail call { i64, i1 } @llvm.sadd.with.overflow.i64(i64 %.res682, i64 2)
  %.obit698 = extractvalue { i64, i1 } %16, 1
  %.res700 = extractvalue { i64, i1 } %16, 0
  %17 = icmp sle i64 %.res700, %end
  %polly.overflow.state702 = or i1 %.obit698, %polly.overflow.state696
  %polly.overflow.state705 = or i1 %.obit677, %polly.overflow.state702
  %polly.overflow.state708 = or i1 %.obit680, %polly.overflow.state705
  %18 = tail call { i64, i1 } @llvm.sadd.with.overflow.i64(i64 %.res682, i64 1)
  %.obit710 = extractvalue { i64, i1 } %18, 1
  %polly.overflow.state711 = or i1 %.obit710, %polly.overflow.state708
  %19 = or i1 %17, %15
  %polly.overflow.state714 = or i1 %.obit671, %polly.overflow.state711
  %polly.overflow.state717 = or i1 %.obit674, %polly.overflow.state714
  %polly.overflow.state720 = or i1 %.obit677, %polly.overflow.state717
  %polly.overflow.state723 = or i1 %.obit680, %polly.overflow.state720
  %20 = sext i64 %.res682 to i66
  %21 = tail call { i66, i1 } @llvm.sadd.with.overflow.i66(i66 %20, i66 18446744073709551616)
  %.obit725 = extractvalue { i66, i1 } %21, 1
  %polly.overflow.state726 = or i1 %.obit725, %polly.overflow.state723
  %.res727 = extractvalue { i66, i1 } %21, 0
  %22 = sext i64 %.res676 to i66
  %23 = icmp sge i66 %22, %.res727
  %24 = icmp sgt i64 %add1, -1
  %25 = and i1 %24, %23
  %26 = or i1 %19, %25
  %27 = icmp slt i64 %i.0.lcssa, -1152921504606846976
  %polly.overflow.state735 = or i1 %.obit686, %polly.overflow.state726
  %28 = and i1 %27, %17
  %polly.overflow.state741 = or i1 %.obit698, %polly.overflow.state735
  %29 = and i1 %24, %28
  %30 = or i1 %29, %26
  %polly.overflow.state744 = or i1 %.obit677, %polly.overflow.state741
  %polly.overflow.state747 = or i1 %.obit680, %polly.overflow.state744
  %polly.overflow.state750 = or i1 %.obit710, %polly.overflow.state747
  %.res751 = extractvalue { i64, i1 } %18, 0
  %31 = icmp sle i64 %.res751, %end
  %32 = and i1 %27, %31
  %33 = and i1 %14, %32
  %34 = or i1 %33, %30
  %35 = icmp slt i64 %l.0.lcssa, -1152921504606846976
  %polly.overflow.state759 = or i1 %.obit686, %polly.overflow.state750
  %36 = and i1 %35, %17
  %polly.overflow.state765 = or i1 %.obit698, %polly.overflow.state759
  %37 = and i1 %24, %36
  %38 = or i1 %37, %34
  %polly.overflow.state768 = or i1 %.obit677, %polly.overflow.state765
  %polly.overflow.state771 = or i1 %.obit680, %polly.overflow.state768
  %polly.overflow.state774 = or i1 %.obit710, %polly.overflow.state771
  %39 = and i1 %35, %31
  %40 = and i1 %14, %39
  %41 = or i1 %40, %38
  %42 = icmp sgt i64 %l.0.lcssa, 1152921504606846975
  %polly.overflow.state783 = or i1 %.obit686, %polly.overflow.state774
  %43 = and i1 %42, %17
  %polly.overflow.state789 = or i1 %.obit698, %polly.overflow.state783
  %44 = and i1 %24, %43
  %45 = or i1 %44, %41
  %polly.overflow.state792 = or i1 %.obit677, %polly.overflow.state789
  %polly.overflow.state795 = or i1 %.obit680, %polly.overflow.state792
  %polly.overflow.state798 = or i1 %.obit710, %polly.overflow.state795
  %46 = and i1 %42, %31
  %47 = and i1 %14, %46
  %48 = or i1 %47, %45
  %49 = icmp sgt i64 %i.0.lcssa, 1152921504606846975
  %polly.overflow.state807 = or i1 %.obit686, %polly.overflow.state798
  %50 = and i1 %49, %17
  %polly.overflow.state813 = or i1 %.obit698, %polly.overflow.state807
  %51 = and i1 %24, %50
  %52 = or i1 %51, %48
  %polly.overflow.state816 = or i1 %.obit677, %polly.overflow.state813
  %polly.overflow.state819 = or i1 %.obit680, %polly.overflow.state816
  %polly.overflow.state822 = or i1 %.obit710, %polly.overflow.state819
  %53 = and i1 %49, %31
  %polly.overflow.state825 = or i1 %.obit686, %polly.overflow.state822
  %54 = and i1 %14, %53
  %55 = or i1 %54, %52
  %56 = icmp eq i64 %l.0.lcssa, -9223372036854775808
  %57 = or i1 %56, %55
  %58 = icmp eq i64 %start, -9223372036854775808
  %59 = tail call { i64, i1 } @llvm.sadd.with.overflow.i64(i64 %end, i64 9223372036854775807)
  %.obit827 = extractvalue { i64, i1 } %59, 1
  %polly.overflow.state828 = or i1 %.obit827, %polly.overflow.state825
  %.res829 = extractvalue { i64, i1 } %59, 0
  %polly.overflow.state831 = or i1 %.obit677, %polly.overflow.state828
  %60 = icmp sge i64 %.res829, %.res679
  %61 = and i1 %58, %60
  %62 = or i1 %61, %57
  %63 = xor i1 %62, true
  %polly.overflow.state837 = or i1 %.obit680, %polly.overflow.state831
  %polly.overflow.state840 = or i1 %.obit698, %polly.overflow.state837
  %polly.overflow.state843 = or i1 %.obit686, %polly.overflow.state840
  %64 = and i1 %24, %17
  %65 = tail call { i64, i1 } @llvm.ssub.with.overflow.i64(i64 0, i64 %start)
  %.obit845 = extractvalue { i64, i1 } %65, 1
  %polly.overflow.state846 = or i1 %.obit845, %polly.overflow.state843
  %pexp.p_div_q851 = lshr i64 %add1, 1
  %66 = tail call { i64, i1 } @llvm.sadd.with.overflow.i64(i64 %0, i64 %pexp.p_div_q851)
  %.obit852 = extractvalue { i64, i1 } %66, 1
  %polly.overflow.state853 = or i1 %.obit852, %polly.overflow.state846
  %.res854 = extractvalue { i64, i1 } %66, 0
  %67 = tail call { i64, i1 } @llvm.ssub.with.overflow.i64(i64 %0, i64 %end)
  %.obit861 = extractvalue { i64, i1 } %67, 1
  %polly.overflow.state862 = or i1 %.obit861, %polly.overflow.state853
  %.res863 = extractvalue { i64, i1 } %67, 0
  %pexp.p_div_q864 = lshr i64 %.res863, 1
  %68 = tail call { i64, i1 } @llvm.ssub.with.overflow.i64(i64 %0, i64 %pexp.p_div_q864)
  %.obit865 = extractvalue { i64, i1 } %68, 1
  %polly.overflow.state866 = or i1 %.obit865, %polly.overflow.state862
  %.res867 = extractvalue { i64, i1 } %68, 0
  %69 = select i1 %64, i64 %.res854, i64 %.res867
  %polly.access.call6 = getelementptr i64, i64* %call6, i64 %69
  %polly.access.items868 = getelementptr i64, i64* %items, i64 %i.0.lcssa
  %70 = icmp ule i64* %polly.access.call6, %polly.access.items868
  %polly.overflow.state870 = or i1 %.obit677, %polly.overflow.state866
  %polly.overflow.state873 = or i1 %.obit680, %polly.overflow.state870
  %polly.overflow.state876 = or i1 %.obit698, %polly.overflow.state873
  %polly.overflow.state879 = or i1 %.obit686, %polly.overflow.state876
  %71 = tail call { i64, i1 } @llvm.ssub.with.overflow.i64(i64 %i.0.lcssa, i64 %start)
  %.obit881 = extractvalue { i64, i1 } %71, 1
  %polly.overflow.state882 = or i1 %.obit881, %polly.overflow.state879
  %.res883 = extractvalue { i64, i1 } %71, 0
  %72 = tail call { i64, i1 } @llvm.ssub.with.overflow.i64(i64 %.res883, i64 %l.0.lcssa)
  %.obit884 = extractvalue { i64, i1 } %72, 1
  %polly.overflow.state885 = or i1 %.obit884, %polly.overflow.state882
  %.res886 = extractvalue { i64, i1 } %72, 0
  %73 = tail call { i64, i1 } @llvm.sadd.with.overflow.i64(i64 %.res886, i64 %pexp.p_div_q851)
  %.obit891 = extractvalue { i64, i1 } %73, 1
  %polly.overflow.state892 = or i1 %.obit891, %polly.overflow.state885
  %.res893 = extractvalue { i64, i1 } %73, 0
  %polly.overflow.state901 = or i1 %.obit845, %polly.overflow.state892
  %polly.overflow.state904 = or i1 %.obit861, %polly.overflow.state901
  %74 = tail call { i64, i1 } @llvm.ssub.with.overflow.i64(i64 %.res886, i64 %pexp.p_div_q864)
  %.obit907 = extractvalue { i64, i1 } %74, 1
  %polly.overflow.state908 = or i1 %.obit907, %polly.overflow.state904
  %.res909 = extractvalue { i64, i1 } %74, 0
  %75 = select i1 %64, i64 %.res893, i64 %.res909
  %polly.access.items910 = getelementptr i64, i64* %items, i64 %75
  %polly.access.call6911 = getelementptr i64, i64* %call6, i64 %l.0.lcssa
  %76 = icmp ule i64* %polly.access.items910, %polly.access.call6911
  %77 = or i1 %70, %76
  %78 = and i1 %77, %63
  %polly.rtc.overflown912 = xor i1 %polly.overflow.state908, true
  %polly.rtc.result913 = and i1 %78, %polly.rtc.overflown912
  br i1 %polly.rtc.result913, label %polly.cond914, label %if.end49.preheader

if.end49.preheader:                               ; preds = %if.end49.lr.ph
  %79 = sub i64 %div, %l.0.lcssa
  %80 = sub i64 %79, %start
  %min.iters.check = icmp ult i64 %80, 4
  br i1 %min.iters.check, label %if.end49.preheader1021, label %min.iters.checked

if.end49.preheader1021:                           ; preds = %middle.block, %vector.memcheck, %min.iters.checked, %if.end49.preheader
  %i.1184.ph = phi i64 [ %i.0.lcssa, %vector.memcheck ], [ %i.0.lcssa, %min.iters.checked ], [ %i.0.lcssa, %if.end49.preheader ], [ %ind.end, %middle.block ]
  %l.2183.ph = phi i64 [ %l.0.lcssa, %vector.memcheck ], [ %l.0.lcssa, %min.iters.checked ], [ %l.0.lcssa, %if.end49.preheader ], [ %ind.end970, %middle.block ]
  %81 = add i64 %i.0.lcssa, %div
  %82 = sub i64 %81, %i.1184.ph
  %83 = sub i64 %82, %l.0.lcssa
  %84 = sub i64 %83, %start
  %85 = add i64 %81, -1
  %86 = sub i64 %85, %i.1184.ph
  %87 = sub i64 %86, %l.0.lcssa
  %88 = sub i64 %87, %start
  %xtraiter1024 = and i64 %84, 3
  %lcmp.mod1025 = icmp eq i64 %xtraiter1024, 0
  br i1 %lcmp.mod1025, label %if.end49.prol.loopexit, label %if.end49.prol.preheader

if.end49.prol.preheader:                          ; preds = %if.end49.preheader1021
  br label %if.end49.prol

if.end49.prol:                                    ; preds = %if.end49.prol, %if.end49.prol.preheader
  %i.1184.prol = phi i64 [ %add52.prol, %if.end49.prol ], [ %i.1184.ph, %if.end49.prol.preheader ]
  %l.2183.prol = phi i64 [ %add53.prol, %if.end49.prol ], [ %l.2183.ph, %if.end49.prol.preheader ]
  %prol.iter1026 = phi i64 [ %prol.iter1026.sub, %if.end49.prol ], [ %xtraiter1024, %if.end49.prol.preheader ]
  %arrayidx50.prol = getelementptr inbounds i64, i64* %call6, i64 %l.2183.prol
  %89 = load i64, i64* %arrayidx50.prol, align 8, !tbaa !1
  %arrayidx51.prol = getelementptr inbounds i64, i64* %items, i64 %i.1184.prol
  store i64 %89, i64* %arrayidx51.prol, align 8, !tbaa !1
  %add52.prol = add nsw i64 %i.1184.prol, 1
  %add53.prol = add nsw i64 %l.2183.prol, 1
  %prol.iter1026.sub = add i64 %prol.iter1026, -1
  %prol.iter1026.cmp = icmp eq i64 %prol.iter1026.sub, 0
  br i1 %prol.iter1026.cmp, label %if.end49.prol.loopexit.unr-lcssa, label %if.end49.prol, !llvm.loop !5

if.end49.prol.loopexit.unr-lcssa:                 ; preds = %if.end49.prol
  br label %if.end49.prol.loopexit

if.end49.prol.loopexit:                           ; preds = %if.end49.preheader1021, %if.end49.prol.loopexit.unr-lcssa
  %i.1184.unr = phi i64 [ %i.1184.ph, %if.end49.preheader1021 ], [ %add52.prol, %if.end49.prol.loopexit.unr-lcssa ]
  %l.2183.unr = phi i64 [ %l.2183.ph, %if.end49.preheader1021 ], [ %add53.prol, %if.end49.prol.loopexit.unr-lcssa ]
  %90 = icmp ult i64 %88, 3
  br i1 %90, label %while.cond54.preheader.loopexit, label %if.end49.preheader1021.new

if.end49.preheader1021.new:                       ; preds = %if.end49.prol.loopexit
  br label %if.end49

min.iters.checked:                                ; preds = %if.end49.preheader
  %n.vec = and i64 %80, -4
  %cmp.zero = icmp eq i64 %n.vec, 0
  br i1 %cmp.zero, label %if.end49.preheader1021, label %vector.memcheck

vector.memcheck:                                  ; preds = %min.iters.checked
  %scevgep = getelementptr i64, i64* %items, i64 %i.0.lcssa
  %91 = add i64 %i.0.lcssa, %div
  %92 = add i64 %l.0.lcssa, %start
  %93 = sub i64 %91, %92
  %scevgep963 = getelementptr i64, i64* %items, i64 %93
  %scevgep965 = getelementptr i64, i64* %call6, i64 %l.0.lcssa
  %scevgep967 = getelementptr i64, i64* %call6, i64 %sub
  %bound0 = icmp ult i64* %scevgep, %scevgep967
  %bound1 = icmp ult i64* %scevgep965, %scevgep963
  %memcheck.conflict = and i1 %bound0, %bound1
  %ind.end = add i64 %i.0.lcssa, %n.vec
  %ind.end970 = add i64 %l.0.lcssa, %n.vec
  br i1 %memcheck.conflict, label %if.end49.preheader1021, label %vector.body.preheader

vector.body.preheader:                            ; preds = %vector.memcheck
  %94 = add i64 %n.vec, -4
  %95 = lshr exact i64 %94, 2
  %96 = and i64 %95, 1
  %lcmp.mod1028 = icmp eq i64 %96, 0
  br i1 %lcmp.mod1028, label %vector.body.prol.preheader, label %vector.body.prol.loopexit

vector.body.prol.preheader:                       ; preds = %vector.body.preheader
  br label %vector.body.prol

vector.body.prol:                                 ; preds = %vector.body.prol.preheader
  %97 = getelementptr inbounds i64, i64* %call6, i64 %l.0.lcssa
  %98 = bitcast i64* %97 to <2 x i64>*
  %wide.load.prol = load <2 x i64>, <2 x i64>* %98, align 8, !tbaa !1, !alias.scope !7
  %99 = getelementptr i64, i64* %97, i64 2
  %100 = bitcast i64* %99 to <2 x i64>*
  %wide.load977.prol = load <2 x i64>, <2 x i64>* %100, align 8, !tbaa !1, !alias.scope !7
  %101 = getelementptr inbounds i64, i64* %items, i64 %i.0.lcssa
  %102 = bitcast i64* %101 to <2 x i64>*
  store <2 x i64> %wide.load.prol, <2 x i64>* %102, align 8, !tbaa !1, !alias.scope !10, !noalias !7
  %103 = getelementptr i64, i64* %101, i64 2
  %104 = bitcast i64* %103 to <2 x i64>*
  store <2 x i64> %wide.load977.prol, <2 x i64>* %104, align 8, !tbaa !1, !alias.scope !10, !noalias !7
  br label %vector.body.prol.loopexit

vector.body.prol.loopexit:                        ; preds = %vector.body.prol, %vector.body.preheader
  %index.unr = phi i64 [ 0, %vector.body.preheader ], [ 4, %vector.body.prol ]
  %105 = icmp eq i64 %95, 0
  br i1 %105, label %middle.block, label %vector.body.preheader.new

vector.body.preheader.new:                        ; preds = %vector.body.prol.loopexit
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.body.preheader.new
  %index = phi i64 [ %index.unr, %vector.body.preheader.new ], [ %index.next.1, %vector.body ]
  %106 = add i64 %i.0.lcssa, %index
  %107 = add i64 %l.0.lcssa, %index
  %108 = getelementptr inbounds i64, i64* %call6, i64 %107
  %109 = bitcast i64* %108 to <2 x i64>*
  %wide.load = load <2 x i64>, <2 x i64>* %109, align 8, !tbaa !1, !alias.scope !7
  %110 = getelementptr i64, i64* %108, i64 2
  %111 = bitcast i64* %110 to <2 x i64>*
  %wide.load977 = load <2 x i64>, <2 x i64>* %111, align 8, !tbaa !1, !alias.scope !7
  %112 = getelementptr inbounds i64, i64* %items, i64 %106
  %113 = bitcast i64* %112 to <2 x i64>*
  store <2 x i64> %wide.load, <2 x i64>* %113, align 8, !tbaa !1, !alias.scope !10, !noalias !7
  %114 = getelementptr i64, i64* %112, i64 2
  %115 = bitcast i64* %114 to <2 x i64>*
  store <2 x i64> %wide.load977, <2 x i64>* %115, align 8, !tbaa !1, !alias.scope !10, !noalias !7
  %index.next = add i64 %index, 4
  %116 = add i64 %i.0.lcssa, %index.next
  %117 = add i64 %l.0.lcssa, %index.next
  %118 = getelementptr inbounds i64, i64* %call6, i64 %117
  %119 = bitcast i64* %118 to <2 x i64>*
  %wide.load.1 = load <2 x i64>, <2 x i64>* %119, align 8, !tbaa !1, !alias.scope !7
  %120 = getelementptr i64, i64* %118, i64 2
  %121 = bitcast i64* %120 to <2 x i64>*
  %wide.load977.1 = load <2 x i64>, <2 x i64>* %121, align 8, !tbaa !1, !alias.scope !7
  %122 = getelementptr inbounds i64, i64* %items, i64 %116
  %123 = bitcast i64* %122 to <2 x i64>*
  store <2 x i64> %wide.load.1, <2 x i64>* %123, align 8, !tbaa !1, !alias.scope !10, !noalias !7
  %124 = getelementptr i64, i64* %122, i64 2
  %125 = bitcast i64* %124 to <2 x i64>*
  store <2 x i64> %wide.load977.1, <2 x i64>* %125, align 8, !tbaa !1, !alias.scope !10, !noalias !7
  %index.next.1 = add i64 %index, 8
  %126 = icmp eq i64 %index.next.1, %n.vec
  br i1 %126, label %middle.block.unr-lcssa, label %vector.body, !llvm.loop !12

middle.block.unr-lcssa:                           ; preds = %vector.body
  br label %middle.block

middle.block:                                     ; preds = %vector.body.prol.loopexit, %middle.block.unr-lcssa
  %cmp.n = icmp eq i64 %80, %n.vec
  br i1 %cmp.n, label %while.cond54.preheader, label %if.end49.preheader1021

if.end30:                                         ; preds = %if.end30.preheader, %blklab4
  %i.0192 = phi i64 [ %add42, %blklab4 ], [ 0, %if.end30.preheader ]
  %r.0191 = phi i64 [ %r.1, %blklab4 ], [ 0, %if.end30.preheader ]
  %l.0190 = phi i64 [ %l.1, %blklab4 ], [ 0, %if.end30.preheader ]
  %arrayidx = getelementptr inbounds i64, i64* %call6, i64 %l.0190
  %127 = load i64, i64* %arrayidx, align 8, !tbaa !1
  %arrayidx31 = getelementptr inbounds i64, i64* %call15, i64 %r.0191
  %128 = load i64, i64* %arrayidx31, align 8, !tbaa !1
  %cmp32 = icmp sgt i64 %127, %128
  %arrayidx40 = getelementptr inbounds i64, i64* %items, i64 %i.0192
  br i1 %cmp32, label %blklab3, label %if.end35

if.end35:                                         ; preds = %if.end30
  store i64 %127, i64* %arrayidx40, align 8, !tbaa !1
  %add38 = add nsw i64 %l.0190, 1
  br label %blklab4

blklab3:                                          ; preds = %if.end30
  store i64 %128, i64* %arrayidx40, align 8, !tbaa !1
  %add41 = add nsw i64 %r.0191, 1
  br label %blklab4

blklab4:                                          ; preds = %blklab3, %if.end35
  %l.1 = phi i64 [ %l.0190, %blklab3 ], [ %add38, %if.end35 ]
  %r.1 = phi i64 [ %add41, %blklab3 ], [ %r.0191, %if.end35 ]
  %add42 = add nuw nsw i64 %i.0192, 1
  %cmp17 = icmp slt i64 %add42, %sub16
  %cmp22 = icmp slt i64 %l.1, %sub
  %or.cond = and i1 %cmp17, %cmp22
  %cmp27 = icmp slt i64 %r.1, %sub10
  %or.cond178 = and i1 %cmp27, %or.cond
  br i1 %or.cond178, label %if.end30, label %while.cond43.preheader.loopexit

while.cond54.preheader.loopexit.unr-lcssa:        ; preds = %if.end49
  br label %while.cond54.preheader.loopexit

while.cond54.preheader.loopexit:                  ; preds = %if.end49.prol.loopexit, %while.cond54.preheader.loopexit.unr-lcssa
  br label %while.cond54.preheader

while.cond54.preheader:                           ; preds = %while.cond54.preheader.loopexit, %middle.block, %_sortV1__polly_subfn_3.exit, %_sortV1__polly_subfn_2.exit, %while.cond43.preheader
  %i.1.lcssa.ph = phi i64 [ %i.0.lcssa, %while.cond43.preheader ], [ %6, %_sortV1__polly_subfn_2.exit ], [ %6, %_sortV1__polly_subfn_3.exit ], [ %6, %middle.block ], [ %6, %while.cond54.preheader.loopexit ]
  %cmp57179 = icmp slt i64 %r.0.lcssa, %sub10
  br i1 %cmp57179, label %if.end60.preheader, label %blklab0

if.end60.preheader:                               ; preds = %while.cond54.preheader
  %129 = sub i64 %end, %r.0.lcssa
  %130 = sub i64 %129, %div
  %min.iters.check981 = icmp ult i64 %130, 4
  br i1 %min.iters.check981, label %if.end60.preheader1020, label %min.iters.checked982

if.end60.preheader1020:                           ; preds = %middle.block979, %vector.memcheck999, %min.iters.checked982, %if.end60.preheader
  %i.2181.ph = phi i64 [ %i.1.lcssa.ph, %vector.memcheck999 ], [ %i.1.lcssa.ph, %min.iters.checked982 ], [ %i.1.lcssa.ph, %if.end60.preheader ], [ %ind.end1004, %middle.block979 ]
  %r.2180.ph = phi i64 [ %r.0.lcssa, %vector.memcheck999 ], [ %r.0.lcssa, %min.iters.checked982 ], [ %r.0.lcssa, %if.end60.preheader ], [ %ind.end1006, %middle.block979 ]
  %131 = sub i64 %end, %r.2180.ph
  %132 = sub i64 %131, %div
  %133 = add i64 %end, -1
  %134 = sub i64 %133, %r.2180.ph
  %135 = sub i64 %134, %div
  %xtraiter = and i64 %132, 3
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod, label %if.end60.prol.loopexit, label %if.end60.prol.preheader

if.end60.prol.preheader:                          ; preds = %if.end60.preheader1020
  br label %if.end60.prol

if.end60.prol:                                    ; preds = %if.end60.prol, %if.end60.prol.preheader
  %i.2181.prol = phi i64 [ %add63.prol, %if.end60.prol ], [ %i.2181.ph, %if.end60.prol.preheader ]
  %r.2180.prol = phi i64 [ %add64.prol, %if.end60.prol ], [ %r.2180.ph, %if.end60.prol.preheader ]
  %prol.iter = phi i64 [ %prol.iter.sub, %if.end60.prol ], [ %xtraiter, %if.end60.prol.preheader ]
  %arrayidx61.prol = getelementptr inbounds i64, i64* %call15, i64 %r.2180.prol
  %136 = load i64, i64* %arrayidx61.prol, align 8, !tbaa !1
  %arrayidx62.prol = getelementptr inbounds i64, i64* %items, i64 %i.2181.prol
  store i64 %136, i64* %arrayidx62.prol, align 8, !tbaa !1
  %add63.prol = add nsw i64 %i.2181.prol, 1
  %add64.prol = add nsw i64 %r.2180.prol, 1
  %prol.iter.sub = add i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %if.end60.prol.loopexit.unr-lcssa, label %if.end60.prol, !llvm.loop !15

if.end60.prol.loopexit.unr-lcssa:                 ; preds = %if.end60.prol
  br label %if.end60.prol.loopexit

if.end60.prol.loopexit:                           ; preds = %if.end60.preheader1020, %if.end60.prol.loopexit.unr-lcssa
  %i.2181.unr = phi i64 [ %i.2181.ph, %if.end60.preheader1020 ], [ %add63.prol, %if.end60.prol.loopexit.unr-lcssa ]
  %r.2180.unr = phi i64 [ %r.2180.ph, %if.end60.preheader1020 ], [ %add64.prol, %if.end60.prol.loopexit.unr-lcssa ]
  %137 = icmp ult i64 %135, 3
  br i1 %137, label %blklab0.loopexit, label %if.end60.preheader1020.new

if.end60.preheader1020.new:                       ; preds = %if.end60.prol.loopexit
  br label %if.end60

min.iters.checked982:                             ; preds = %if.end60.preheader
  %n.vec984 = and i64 %130, -4
  %cmp.zero985 = icmp eq i64 %n.vec984, 0
  br i1 %cmp.zero985, label %if.end60.preheader1020, label %vector.memcheck999

vector.memcheck999:                               ; preds = %min.iters.checked982
  %scevgep987 = getelementptr i64, i64* %items, i64 %i.1.lcssa.ph
  %138 = add i64 %i.1.lcssa.ph, %end
  %139 = add i64 %r.0.lcssa, %div
  %140 = sub i64 %138, %139
  %scevgep989 = getelementptr i64, i64* %items, i64 %140
  %scevgep991 = getelementptr i64, i64* %call15, i64 %r.0.lcssa
  %scevgep993 = getelementptr i64, i64* %call15, i64 %sub10
  %bound0995 = icmp ult i64* %scevgep987, %scevgep993
  %bound1996 = icmp ult i64* %scevgep991, %scevgep989
  %memcheck.conflict998 = and i1 %bound0995, %bound1996
  %ind.end1004 = add i64 %i.1.lcssa.ph, %n.vec984
  %ind.end1006 = add i64 %r.0.lcssa, %n.vec984
  br i1 %memcheck.conflict998, label %if.end60.preheader1020, label %vector.body978.preheader

vector.body978.preheader:                         ; preds = %vector.memcheck999
  %141 = add i64 %n.vec984, -4
  %142 = lshr exact i64 %141, 2
  %143 = and i64 %142, 1
  %lcmp.mod1023 = icmp eq i64 %143, 0
  br i1 %lcmp.mod1023, label %vector.body978.prol.preheader, label %vector.body978.prol.loopexit

vector.body978.prol.preheader:                    ; preds = %vector.body978.preheader
  br label %vector.body978.prol

vector.body978.prol:                              ; preds = %vector.body978.prol.preheader
  %144 = getelementptr inbounds i64, i64* %call15, i64 %r.0.lcssa
  %145 = bitcast i64* %144 to <2 x i64>*
  %wide.load1018.prol = load <2 x i64>, <2 x i64>* %145, align 8, !tbaa !1, !alias.scope !16
  %146 = getelementptr i64, i64* %144, i64 2
  %147 = bitcast i64* %146 to <2 x i64>*
  %wide.load1019.prol = load <2 x i64>, <2 x i64>* %147, align 8, !tbaa !1, !alias.scope !16
  %148 = getelementptr inbounds i64, i64* %items, i64 %i.1.lcssa.ph
  %149 = bitcast i64* %148 to <2 x i64>*
  store <2 x i64> %wide.load1018.prol, <2 x i64>* %149, align 8, !tbaa !1, !alias.scope !19, !noalias !16
  %150 = getelementptr i64, i64* %148, i64 2
  %151 = bitcast i64* %150 to <2 x i64>*
  store <2 x i64> %wide.load1019.prol, <2 x i64>* %151, align 8, !tbaa !1, !alias.scope !19, !noalias !16
  br label %vector.body978.prol.loopexit

vector.body978.prol.loopexit:                     ; preds = %vector.body978.prol, %vector.body978.preheader
  %index1001.unr = phi i64 [ 0, %vector.body978.preheader ], [ 4, %vector.body978.prol ]
  %152 = icmp eq i64 %142, 0
  br i1 %152, label %middle.block979, label %vector.body978.preheader.new

vector.body978.preheader.new:                     ; preds = %vector.body978.prol.loopexit
  br label %vector.body978

vector.body978:                                   ; preds = %vector.body978, %vector.body978.preheader.new
  %index1001 = phi i64 [ %index1001.unr, %vector.body978.preheader.new ], [ %index.next1002.1, %vector.body978 ]
  %153 = add i64 %i.1.lcssa.ph, %index1001
  %154 = add i64 %r.0.lcssa, %index1001
  %155 = getelementptr inbounds i64, i64* %call15, i64 %154
  %156 = bitcast i64* %155 to <2 x i64>*
  %wide.load1018 = load <2 x i64>, <2 x i64>* %156, align 8, !tbaa !1, !alias.scope !16
  %157 = getelementptr i64, i64* %155, i64 2
  %158 = bitcast i64* %157 to <2 x i64>*
  %wide.load1019 = load <2 x i64>, <2 x i64>* %158, align 8, !tbaa !1, !alias.scope !16
  %159 = getelementptr inbounds i64, i64* %items, i64 %153
  %160 = bitcast i64* %159 to <2 x i64>*
  store <2 x i64> %wide.load1018, <2 x i64>* %160, align 8, !tbaa !1, !alias.scope !19, !noalias !16
  %161 = getelementptr i64, i64* %159, i64 2
  %162 = bitcast i64* %161 to <2 x i64>*
  store <2 x i64> %wide.load1019, <2 x i64>* %162, align 8, !tbaa !1, !alias.scope !19, !noalias !16
  %index.next1002 = add i64 %index1001, 4
  %163 = add i64 %i.1.lcssa.ph, %index.next1002
  %164 = add i64 %r.0.lcssa, %index.next1002
  %165 = getelementptr inbounds i64, i64* %call15, i64 %164
  %166 = bitcast i64* %165 to <2 x i64>*
  %wide.load1018.1 = load <2 x i64>, <2 x i64>* %166, align 8, !tbaa !1, !alias.scope !16
  %167 = getelementptr i64, i64* %165, i64 2
  %168 = bitcast i64* %167 to <2 x i64>*
  %wide.load1019.1 = load <2 x i64>, <2 x i64>* %168, align 8, !tbaa !1, !alias.scope !16
  %169 = getelementptr inbounds i64, i64* %items, i64 %163
  %170 = bitcast i64* %169 to <2 x i64>*
  store <2 x i64> %wide.load1018.1, <2 x i64>* %170, align 8, !tbaa !1, !alias.scope !19, !noalias !16
  %171 = getelementptr i64, i64* %169, i64 2
  %172 = bitcast i64* %171 to <2 x i64>*
  store <2 x i64> %wide.load1019.1, <2 x i64>* %172, align 8, !tbaa !1, !alias.scope !19, !noalias !16
  %index.next1002.1 = add i64 %index1001, 8
  %173 = icmp eq i64 %index.next1002.1, %n.vec984
  br i1 %173, label %middle.block979.unr-lcssa, label %vector.body978, !llvm.loop !21

middle.block979.unr-lcssa:                        ; preds = %vector.body978
  br label %middle.block979

middle.block979:                                  ; preds = %vector.body978.prol.loopexit, %middle.block979.unr-lcssa
  %cmp.n1007 = icmp eq i64 %130, %n.vec984
  br i1 %cmp.n1007, label %blklab0, label %if.end60.preheader1020

if.end49:                                         ; preds = %if.end49, %if.end49.preheader1021.new
  %i.1184 = phi i64 [ %i.1184.unr, %if.end49.preheader1021.new ], [ %add52.3, %if.end49 ]
  %l.2183 = phi i64 [ %l.2183.unr, %if.end49.preheader1021.new ], [ %add53.3, %if.end49 ]
  %arrayidx50 = getelementptr inbounds i64, i64* %call6, i64 %l.2183
  %174 = load i64, i64* %arrayidx50, align 8, !tbaa !1
  %arrayidx51 = getelementptr inbounds i64, i64* %items, i64 %i.1184
  store i64 %174, i64* %arrayidx51, align 8, !tbaa !1
  %add52 = add nsw i64 %i.1184, 1
  %add53 = add nsw i64 %l.2183, 1
  %arrayidx50.1 = getelementptr inbounds i64, i64* %call6, i64 %add53
  %175 = load i64, i64* %arrayidx50.1, align 8, !tbaa !1
  %arrayidx51.1 = getelementptr inbounds i64, i64* %items, i64 %add52
  store i64 %175, i64* %arrayidx51.1, align 8, !tbaa !1
  %add52.1 = add nsw i64 %i.1184, 2
  %add53.1 = add nsw i64 %l.2183, 2
  %arrayidx50.2 = getelementptr inbounds i64, i64* %call6, i64 %add53.1
  %176 = load i64, i64* %arrayidx50.2, align 8, !tbaa !1
  %arrayidx51.2 = getelementptr inbounds i64, i64* %items, i64 %add52.1
  store i64 %176, i64* %arrayidx51.2, align 8, !tbaa !1
  %add52.2 = add nsw i64 %i.1184, 3
  %add53.2 = add nsw i64 %l.2183, 3
  %arrayidx50.3 = getelementptr inbounds i64, i64* %call6, i64 %add53.2
  %177 = load i64, i64* %arrayidx50.3, align 8, !tbaa !1
  %arrayidx51.3 = getelementptr inbounds i64, i64* %items, i64 %add52.2
  store i64 %177, i64* %arrayidx51.3, align 8, !tbaa !1
  %add52.3 = add nsw i64 %i.1184, 4
  %add53.3 = add nsw i64 %l.2183, 4
  %exitcond196.3 = icmp eq i64 %add52.3, %6
  br i1 %exitcond196.3, label %while.cond54.preheader.loopexit.unr-lcssa, label %if.end49, !llvm.loop !22

if.end60:                                         ; preds = %if.end60, %if.end60.preheader1020.new
  %i.2181 = phi i64 [ %i.2181.unr, %if.end60.preheader1020.new ], [ %add63.3, %if.end60 ]
  %r.2180 = phi i64 [ %r.2180.unr, %if.end60.preheader1020.new ], [ %add64.3, %if.end60 ]
  %arrayidx61 = getelementptr inbounds i64, i64* %call15, i64 %r.2180
  %178 = load i64, i64* %arrayidx61, align 8, !tbaa !1
  %arrayidx62 = getelementptr inbounds i64, i64* %items, i64 %i.2181
  store i64 %178, i64* %arrayidx62, align 8, !tbaa !1
  %add63 = add nsw i64 %i.2181, 1
  %add64 = add nsw i64 %r.2180, 1
  %arrayidx61.1 = getelementptr inbounds i64, i64* %call15, i64 %add64
  %179 = load i64, i64* %arrayidx61.1, align 8, !tbaa !1
  %arrayidx62.1 = getelementptr inbounds i64, i64* %items, i64 %add63
  store i64 %179, i64* %arrayidx62.1, align 8, !tbaa !1
  %add63.1 = add nsw i64 %i.2181, 2
  %add64.1 = add nsw i64 %r.2180, 2
  %arrayidx61.2 = getelementptr inbounds i64, i64* %call15, i64 %add64.1
  %180 = load i64, i64* %arrayidx61.2, align 8, !tbaa !1
  %arrayidx62.2 = getelementptr inbounds i64, i64* %items, i64 %add63.1
  store i64 %180, i64* %arrayidx62.2, align 8, !tbaa !1
  %add63.2 = add nsw i64 %i.2181, 3
  %add64.2 = add nsw i64 %r.2180, 3
  %arrayidx61.3 = getelementptr inbounds i64, i64* %call15, i64 %add64.2
  %181 = load i64, i64* %arrayidx61.3, align 8, !tbaa !1
  %arrayidx62.3 = getelementptr inbounds i64, i64* %items, i64 %add63.2
  store i64 %181, i64* %arrayidx62.3, align 8, !tbaa !1
  %add63.3 = add nsw i64 %i.2181, 4
  %add64.3 = add nsw i64 %r.2180, 4
  %exitcond.3 = icmp eq i64 %add64.3, %sub10
  br i1 %exitcond.3, label %blklab0.loopexit.unr-lcssa, label %if.end60, !llvm.loop !23

blklab0.loopexit.unr-lcssa:                       ; preds = %if.end60
  br label %blklab0.loopexit

blklab0.loopexit:                                 ; preds = %if.end60.prol.loopexit, %blklab0.loopexit.unr-lcssa
  br label %blklab0

blklab0:                                          ; preds = %blklab0.loopexit, %middle.block979, %while.cond54.preheader, %entry
  store i64 %items_size, i64* %_size_call_by_ref, align 8, !tbaa !1
  call void @llvm.lifetime.end(i64 8, i8* nonnull %2) #8
  call void @llvm.lifetime.end(i64 8, i8* nonnull %1) #8
  ret i64* %items

polly.cond914:                                    ; preds = %if.end49.lr.ph
  %182 = sub nsw i64 %0, %l.0.lcssa
  br i1 %14, label %polly.parallel.for918, label %polly.parallel.for928

polly.parallel.for918:                            ; preds = %polly.cond914
  %183 = sub nsw i64 %182, %pexp.p_div_q864
  %184 = bitcast { i64, i64, i64, i64, i64*, i64*, i64 }* %polly.par.userContext920 to i8*
  call void @llvm.lifetime.start(i64 56, i8* nonnull %184)
  %polly.subfn.storeaddr.i.0.lcssa921 = getelementptr inbounds { i64, i64, i64, i64, i64*, i64*, i64 }, { i64, i64, i64, i64, i64*, i64*, i64 }* %polly.par.userContext920, i64 0, i32 0
  store i64 %i.0.lcssa, i64* %polly.subfn.storeaddr.i.0.lcssa921, align 8
  %polly.subfn.storeaddr.start922 = getelementptr inbounds { i64, i64, i64, i64, i64*, i64*, i64 }, { i64, i64, i64, i64, i64*, i64*, i64 }* %polly.par.userContext920, i64 0, i32 1
  store i64 %start, i64* %polly.subfn.storeaddr.start922, align 8
  %polly.subfn.storeaddr.l.0.lcssa923 = getelementptr inbounds { i64, i64, i64, i64, i64*, i64*, i64 }, { i64, i64, i64, i64, i64*, i64*, i64 }* %polly.par.userContext920, i64 0, i32 2
  store i64 %l.0.lcssa, i64* %polly.subfn.storeaddr.l.0.lcssa923, align 8
  %polly.subfn.storeaddr.end924 = getelementptr inbounds { i64, i64, i64, i64, i64*, i64*, i64 }, { i64, i64, i64, i64, i64*, i64*, i64 }* %polly.par.userContext920, i64 0, i32 3
  store i64 %end, i64* %polly.subfn.storeaddr.end924, align 8
  %polly.subfn.storeaddr.call6 = getelementptr inbounds { i64, i64, i64, i64, i64*, i64*, i64 }, { i64, i64, i64, i64, i64*, i64*, i64 }* %polly.par.userContext920, i64 0, i32 4
  store i64* %call6, i64** %polly.subfn.storeaddr.call6, align 8
  %polly.subfn.storeaddr.items925 = getelementptr inbounds { i64, i64, i64, i64, i64*, i64*, i64 }, { i64, i64, i64, i64, i64*, i64*, i64 }* %polly.par.userContext920, i64 0, i32 5
  store i64* %items, i64** %polly.subfn.storeaddr.items925, align 8
  %polly.subfn.storeaddr.div926 = getelementptr inbounds { i64, i64, i64, i64, i64*, i64*, i64 }, { i64, i64, i64, i64, i64*, i64*, i64 }* %polly.par.userContext920, i64 0, i32 6
  store i64 %div, i64* %polly.subfn.storeaddr.div926, align 8
  call void @GOMP_parallel_loop_runtime_start(void (i8*)* nonnull @_sortV1__polly_subfn_2, i8* nonnull %184, i32 0, i64 0, i64 %183, i64 1) #8
  %185 = bitcast i64* %polly.par.LBPtr.i939 to i8*
  call void @llvm.lifetime.start(i64 8, i8* nonnull %185)
  %186 = bitcast i64* %polly.par.UBPtr.i940 to i8*
  call void @llvm.lifetime.start(i64 8, i8* nonnull %186)
  %polly.subfunc.arg.i.0.lcssa.i941 = load i64, i64* %polly.subfn.storeaddr.i.0.lcssa921, align 8
  %polly.subfunc.arg.l.0.lcssa.i942 = load i64, i64* %polly.subfn.storeaddr.l.0.lcssa923, align 8
  %polly.subfunc.arg.call6.i943 = load i64*, i64** %polly.subfn.storeaddr.call6, align 8
  %polly.subfunc.arg.items.i944 = load i64*, i64** %polly.subfn.storeaddr.items925, align 8
  %187 = call i8 @GOMP_loop_runtime_next(i64* nonnull %polly.par.LBPtr.i939, i64* nonnull %polly.par.UBPtr.i940) #8
  %188 = icmp eq i8 %187, 0
  br i1 %188, label %_sortV1__polly_subfn_2.exit, label %polly.par.loadIVBounds.preheader.i947

polly.par.loadIVBounds.preheader.i947:            ; preds = %polly.parallel.for918
  %scevgep.i945 = getelementptr i64, i64* %polly.subfunc.arg.call6.i943, i64 %polly.subfunc.arg.l.0.lcssa.i942
  %scevgep3.i946 = getelementptr i64, i64* %polly.subfunc.arg.items.i944, i64 %polly.subfunc.arg.i.0.lcssa.i941
  br label %polly.par.loadIVBounds.i952

polly.par.checkNext.loopexit.i948:                ; preds = %polly.loop_header.i959
  %189 = call i8 @GOMP_loop_runtime_next(i64* nonnull %polly.par.LBPtr.i939, i64* nonnull %polly.par.UBPtr.i940) #8
  %190 = icmp eq i8 %189, 0
  br i1 %190, label %_sortV1__polly_subfn_2.exit.loopexit, label %polly.par.loadIVBounds.i952

polly.par.loadIVBounds.i952:                      ; preds = %polly.par.checkNext.loopexit.i948, %polly.par.loadIVBounds.preheader.i947
  %polly.par.UB.i949 = load i64, i64* %polly.par.UBPtr.i940, align 8
  %polly.par.LB.i950 = load i64, i64* %polly.par.LBPtr.i939, align 8
  %polly.adjust_ub.i951 = add i64 %polly.par.UB.i949, -2
  br label %polly.loop_header.i959

polly.loop_header.i959:                           ; preds = %polly.loop_header.i959, %polly.par.loadIVBounds.i952
  %polly.indvar.i953 = phi i64 [ %polly.par.LB.i950, %polly.par.loadIVBounds.i952 ], [ %polly.indvar_next.i957, %polly.loop_header.i959 ]
  %scevgep2.i954 = getelementptr i64, i64* %scevgep.i945, i64 %polly.indvar.i953
  %_p_scalar_.i955 = load i64, i64* %scevgep2.i954, align 8, !alias.scope !24, !noalias !26
  %scevgep4.i956 = getelementptr i64, i64* %scevgep3.i946, i64 %polly.indvar.i953
  store i64 %_p_scalar_.i955, i64* %scevgep4.i956, align 8, !alias.scope !27, !noalias !28
  %polly.indvar_next.i957 = add nsw i64 %polly.indvar.i953, 1
  %polly.loop_cond.i958 = icmp sgt i64 %polly.indvar.i953, %polly.adjust_ub.i951
  br i1 %polly.loop_cond.i958, label %polly.par.checkNext.loopexit.i948, label %polly.loop_header.i959

_sortV1__polly_subfn_2.exit.loopexit:             ; preds = %polly.par.checkNext.loopexit.i948
  br label %_sortV1__polly_subfn_2.exit

_sortV1__polly_subfn_2.exit:                      ; preds = %_sortV1__polly_subfn_2.exit.loopexit, %polly.parallel.for918
  call void @GOMP_loop_end_nowait() #8
  call void @llvm.lifetime.end(i64 8, i8* nonnull %185)
  call void @llvm.lifetime.end(i64 8, i8* nonnull %186)
  call void @GOMP_parallel_end() #8
  call void @llvm.lifetime.end(i64 8, i8* nonnull %184)
  br label %while.cond54.preheader

polly.parallel.for928:                            ; preds = %polly.cond914
  %191 = bitcast { i64, i64, i64, i64, i64*, i64*, i64 }* %polly.par.userContext930 to i8*
  call void @llvm.lifetime.start(i64 56, i8* nonnull %191)
  %polly.subfn.storeaddr.i.0.lcssa931 = getelementptr inbounds { i64, i64, i64, i64, i64*, i64*, i64 }, { i64, i64, i64, i64, i64*, i64*, i64 }* %polly.par.userContext930, i64 0, i32 0
  store i64 %i.0.lcssa, i64* %polly.subfn.storeaddr.i.0.lcssa931, align 8
  %polly.subfn.storeaddr.start932 = getelementptr inbounds { i64, i64, i64, i64, i64*, i64*, i64 }, { i64, i64, i64, i64, i64*, i64*, i64 }* %polly.par.userContext930, i64 0, i32 1
  store i64 %start, i64* %polly.subfn.storeaddr.start932, align 8
  %polly.subfn.storeaddr.l.0.lcssa933 = getelementptr inbounds { i64, i64, i64, i64, i64*, i64*, i64 }, { i64, i64, i64, i64, i64*, i64*, i64 }* %polly.par.userContext930, i64 0, i32 2
  store i64 %l.0.lcssa, i64* %polly.subfn.storeaddr.l.0.lcssa933, align 8
  %polly.subfn.storeaddr.end934 = getelementptr inbounds { i64, i64, i64, i64, i64*, i64*, i64 }, { i64, i64, i64, i64, i64*, i64*, i64 }* %polly.par.userContext930, i64 0, i32 3
  store i64 %end, i64* %polly.subfn.storeaddr.end934, align 8
  %polly.subfn.storeaddr.call6935 = getelementptr inbounds { i64, i64, i64, i64, i64*, i64*, i64 }, { i64, i64, i64, i64, i64*, i64*, i64 }* %polly.par.userContext930, i64 0, i32 4
  store i64* %call6, i64** %polly.subfn.storeaddr.call6935, align 8
  %polly.subfn.storeaddr.items936 = getelementptr inbounds { i64, i64, i64, i64, i64*, i64*, i64 }, { i64, i64, i64, i64, i64*, i64*, i64 }* %polly.par.userContext930, i64 0, i32 5
  store i64* %items, i64** %polly.subfn.storeaddr.items936, align 8
  %polly.subfn.storeaddr.div937 = getelementptr inbounds { i64, i64, i64, i64, i64*, i64*, i64 }, { i64, i64, i64, i64, i64*, i64*, i64 }* %polly.par.userContext930, i64 0, i32 6
  store i64 %div, i64* %polly.subfn.storeaddr.div937, align 8
  %192 = add i64 %182, %pexp.p_div_q851
  call void @GOMP_parallel_loop_runtime_start(void (i8*)* nonnull @_sortV1__polly_subfn_3, i8* nonnull %191, i32 0, i64 0, i64 %192, i64 1) #8
  %193 = bitcast i64* %polly.par.LBPtr.i to i8*
  call void @llvm.lifetime.start(i64 8, i8* nonnull %193)
  %194 = bitcast i64* %polly.par.UBPtr.i to i8*
  call void @llvm.lifetime.start(i64 8, i8* nonnull %194)
  %polly.subfunc.arg.i.0.lcssa.i = load i64, i64* %polly.subfn.storeaddr.i.0.lcssa931, align 8
  %polly.subfunc.arg.l.0.lcssa.i = load i64, i64* %polly.subfn.storeaddr.l.0.lcssa933, align 8
  %polly.subfunc.arg.call6.i = load i64*, i64** %polly.subfn.storeaddr.call6935, align 8
  %polly.subfunc.arg.items.i = load i64*, i64** %polly.subfn.storeaddr.items936, align 8
  %195 = call i8 @GOMP_loop_runtime_next(i64* nonnull %polly.par.LBPtr.i, i64* nonnull %polly.par.UBPtr.i) #8
  %196 = icmp eq i8 %195, 0
  br i1 %196, label %_sortV1__polly_subfn_3.exit, label %polly.par.loadIVBounds.preheader.i

polly.par.loadIVBounds.preheader.i:               ; preds = %polly.parallel.for928
  %scevgep.i = getelementptr i64, i64* %polly.subfunc.arg.call6.i, i64 %polly.subfunc.arg.l.0.lcssa.i
  %scevgep3.i = getelementptr i64, i64* %polly.subfunc.arg.items.i, i64 %polly.subfunc.arg.i.0.lcssa.i
  br label %polly.par.loadIVBounds.i

polly.par.checkNext.loopexit.i:                   ; preds = %polly.loop_header.i
  %197 = call i8 @GOMP_loop_runtime_next(i64* nonnull %polly.par.LBPtr.i, i64* nonnull %polly.par.UBPtr.i) #8
  %198 = icmp eq i8 %197, 0
  br i1 %198, label %_sortV1__polly_subfn_3.exit.loopexit, label %polly.par.loadIVBounds.i

polly.par.loadIVBounds.i:                         ; preds = %polly.par.checkNext.loopexit.i, %polly.par.loadIVBounds.preheader.i
  %polly.par.UB.i = load i64, i64* %polly.par.UBPtr.i, align 8
  %polly.par.LB.i = load i64, i64* %polly.par.LBPtr.i, align 8
  %polly.adjust_ub.i = add i64 %polly.par.UB.i, -2
  br label %polly.loop_header.i

polly.loop_header.i:                              ; preds = %polly.loop_header.i, %polly.par.loadIVBounds.i
  %polly.indvar.i = phi i64 [ %polly.par.LB.i, %polly.par.loadIVBounds.i ], [ %polly.indvar_next.i, %polly.loop_header.i ]
  %scevgep2.i = getelementptr i64, i64* %scevgep.i, i64 %polly.indvar.i
  %_p_scalar_.i = load i64, i64* %scevgep2.i, align 8, !alias.scope !29, !noalias !31
  %scevgep4.i = getelementptr i64, i64* %scevgep3.i, i64 %polly.indvar.i
  store i64 %_p_scalar_.i, i64* %scevgep4.i, align 8, !alias.scope !32, !noalias !33
  %polly.indvar_next.i = add nsw i64 %polly.indvar.i, 1
  %polly.loop_cond.i = icmp sgt i64 %polly.indvar.i, %polly.adjust_ub.i
  br i1 %polly.loop_cond.i, label %polly.par.checkNext.loopexit.i, label %polly.loop_header.i

_sortV1__polly_subfn_3.exit.loopexit:             ; preds = %polly.par.checkNext.loopexit.i
  br label %_sortV1__polly_subfn_3.exit

_sortV1__polly_subfn_3.exit:                      ; preds = %_sortV1__polly_subfn_3.exit.loopexit, %polly.parallel.for928
  call void @GOMP_loop_end_nowait() #8
  call void @llvm.lifetime.end(i64 8, i8* nonnull %193)
  call void @llvm.lifetime.end(i64 8, i8* nonnull %194)
  call void @GOMP_parallel_end() #8
  call void @llvm.lifetime.end(i64 8, i8* nonnull %191)
  br label %while.cond54.preheader
}

; Function Attrs: argmemonly nounwind
declare void @llvm.lifetime.start(i64, i8* nocapture) #1

declare i64* @slice(i64*, i64, i32, i32) local_unnamed_addr #2

declare i64* @copy1DArray_int64_t(i64*, i64) local_unnamed_addr #2

; Function Attrs: argmemonly nounwind
declare void @llvm.lifetime.end(i64, i8* nocapture) #1

; Function Attrs: noreturn nounwind uwtable
define i32 @main(i32 %argc, i8** %args) local_unnamed_addr #3 {
entry:
  %polly.par.LBPtr.i = alloca i64, align 8
  %polly.par.UBPtr.i = alloca i64, align 8
  %polly.par.userContext = alloca { i64, i64* }, align 8
  %_6_size = alloca i64, align 8
  %_6_size_size = alloca i64, align 8
  %_15_size = alloca i64, align 8
  %0 = bitcast i64* %_6_size to i8*
  call void @llvm.lifetime.start(i64 8, i8* nonnull %0) #8
  store i64 0, i64* %_6_size, align 8, !tbaa !1
  %1 = bitcast i64* %_6_size_size to i8*
  call void @llvm.lifetime.start(i64 8, i8* nonnull %1) #8
  store i64 0, i64* %_6_size_size, align 8, !tbaa !1
  %2 = bitcast i64* %_15_size to i8*
  call void @llvm.lifetime.start(i64 8, i8* nonnull %2) #8
  store i64 0, i64* %_15_size, align 8, !tbaa !1
  %call = call i64** @convertArgsToIntArray(i32 %argc, i8** %args, i64* nonnull %_6_size, i64* nonnull %_6_size_size) #8
  %3 = load i64*, i64** %call, align 8, !tbaa !34
  %call1 = call i64* @parseStringToInt(i64* %3) #8
  %4 = load i64, i64* %call1, align 8, !tbaa !1
  %call3 = call i64* @create1DArray_int64_t(i64 0, i64 %4) #8
  %call4 = call i64* @copy1DArray_int64_t(i64* %call3, i64 %4) #8
  %cmp584 = icmp sgt i64 %4, 0
  br i1 %cmp584, label %polly.parallel.for, label %blklab10

blklab10:                                         ; preds = %main_polly_subfn.exit, %entry
  %call10 = call i64* @copy1DArray_int64_t(i64* %call4, i64 %4) #8
  %call11 = call i64* @_sortV1_(i64* %call10, i64 %4, i64 0, i64 %4, i64* nonnull %_15_size)
  %5 = load i64, i64* %_15_size, align 8, !tbaa !1
  %call12 = call i64* @copy1DArray_int64_t(i64* %call11, i64 %5) #8
  %6 = load i64, i64* %call12, align 8, !tbaa !1
  %call14 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str, i64 0, i64 0), i64 %6)
  %sub15 = add nsw i64 %4, -1
  %arrayidx16 = getelementptr inbounds i64, i64* %call12, i64 %sub15
  %7 = load i64, i64* %arrayidx16, align 8, !tbaa !1
  %call17 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str, i64 0, i64 0), i64 %7)
  %call18 = call i64* @create1DArray_int64_t(i64 0, i64 24) #8
  %8 = bitcast i64* %call18 to <2 x i64>*
  store <2 x i64> <i64 80, i64 97>, <2 x i64>* %8, align 8, !tbaa !1
  %arrayidx21 = getelementptr inbounds i64, i64* %call18, i64 2
  %9 = bitcast i64* %arrayidx21 to <2 x i64>*
  store <2 x i64> <i64 115, i64 115>, <2 x i64>* %9, align 8, !tbaa !1
  %arrayidx23 = getelementptr inbounds i64, i64* %call18, i64 4
  %10 = bitcast i64* %arrayidx23 to <2 x i64>*
  store <2 x i64> <i64 32, i64 77>, <2 x i64>* %10, align 8, !tbaa !1
  %arrayidx25 = getelementptr inbounds i64, i64* %call18, i64 6
  %11 = bitcast i64* %arrayidx25 to <2 x i64>*
  store <2 x i64> <i64 101, i64 114>, <2 x i64>* %11, align 8, !tbaa !1
  %arrayidx27 = getelementptr inbounds i64, i64* %call18, i64 8
  %12 = bitcast i64* %arrayidx27 to <2 x i64>*
  store <2 x i64> <i64 103, i64 101>, <2 x i64>* %12, align 8, !tbaa !1
  %arrayidx29 = getelementptr inbounds i64, i64* %call18, i64 10
  %13 = bitcast i64* %arrayidx29 to <2 x i64>*
  store <2 x i64> <i64 115, i64 111>, <2 x i64>* %13, align 8, !tbaa !1
  %arrayidx31 = getelementptr inbounds i64, i64* %call18, i64 12
  %14 = bitcast i64* %arrayidx31 to <2 x i64>*
  store <2 x i64> <i64 114, i64 116>, <2 x i64>* %14, align 8, !tbaa !1
  %arrayidx33 = getelementptr inbounds i64, i64* %call18, i64 14
  %15 = bitcast i64* %arrayidx33 to <2 x i64>*
  store <2 x i64> <i64 32, i64 116>, <2 x i64>* %15, align 8, !tbaa !1
  %arrayidx35 = getelementptr inbounds i64, i64* %call18, i64 16
  %16 = bitcast i64* %arrayidx35 to <2 x i64>*
  store <2 x i64> <i64 101, i64 115>, <2 x i64>* %16, align 8, !tbaa !1
  %arrayidx37 = getelementptr inbounds i64, i64* %call18, i64 18
  %17 = bitcast i64* %arrayidx37 to <2 x i64>*
  store <2 x i64> <i64 116, i64 32>, <2 x i64>* %17, align 8, !tbaa !1
  %arrayidx39 = getelementptr inbounds i64, i64* %call18, i64 20
  %18 = bitcast i64* %arrayidx39 to <2 x i64>*
  store <2 x i64> <i64 99, i64 97>, <2 x i64>* %18, align 8, !tbaa !1
  %arrayidx41 = getelementptr inbounds i64, i64* %call18, i64 22
  %19 = bitcast i64* %arrayidx41 to <2 x i64>*
  store <2 x i64> <i64 115, i64 101>, <2 x i64>* %19, align 8, !tbaa !1
  call void @println_s(i64* %call18, i64 24) #8
  call void @exit(i32 0) #9
  unreachable

polly.parallel.for:                               ; preds = %entry
  %20 = bitcast { i64, i64* }* %polly.par.userContext to i8*
  call void @llvm.lifetime.start(i64 16, i8* nonnull %20)
  %polly.subfn.storeaddr. = getelementptr inbounds { i64, i64* }, { i64, i64* }* %polly.par.userContext, i64 0, i32 0
  store i64 %4, i64* %polly.subfn.storeaddr., align 8
  %polly.subfn.storeaddr.call4 = getelementptr inbounds { i64, i64* }, { i64, i64* }* %polly.par.userContext, i64 0, i32 1
  store i64* %call4, i64** %polly.subfn.storeaddr.call4, align 8
  call void @GOMP_parallel_loop_runtime_start(void (i8*)* nonnull @main_polly_subfn, i8* nonnull %20, i32 0, i64 0, i64 %4, i64 1) #8
  %21 = bitcast i64* %polly.par.LBPtr.i to i8*
  call void @llvm.lifetime.start(i64 8, i8* nonnull %21)
  %22 = bitcast i64* %polly.par.UBPtr.i to i8*
  call void @llvm.lifetime.start(i64 8, i8* nonnull %22)
  %polly.subfunc.arg..i = load i64, i64* %polly.subfn.storeaddr., align 8
  %polly.subfunc.arg.call4.i = load i64*, i64** %polly.subfn.storeaddr.call4, align 8
  %23 = call i8 @GOMP_loop_runtime_next(i64* nonnull %polly.par.LBPtr.i, i64* nonnull %polly.par.UBPtr.i) #8
  %24 = icmp eq i8 %23, 0
  br i1 %24, label %main_polly_subfn.exit, label %polly.par.loadIVBounds.i.preheader

polly.par.loadIVBounds.i.preheader:               ; preds = %polly.parallel.for
  br label %polly.par.loadIVBounds.i

polly.par.checkNext.loopexit.i:                   ; preds = %polly.loop_header.i
  %25 = call i8 @GOMP_loop_runtime_next(i64* nonnull %polly.par.LBPtr.i, i64* nonnull %polly.par.UBPtr.i) #8
  %26 = icmp eq i8 %25, 0
  br i1 %26, label %main_polly_subfn.exit.loopexit, label %polly.par.loadIVBounds.i

polly.par.loadIVBounds.i:                         ; preds = %polly.par.loadIVBounds.i.preheader, %polly.par.checkNext.loopexit.i
  %polly.par.UB.i = load i64, i64* %polly.par.UBPtr.i, align 8
  %polly.par.LB.i = load i64, i64* %polly.par.LBPtr.i, align 8
  %polly.adjust_ub.i = add i64 %polly.par.UB.i, -2
  br label %polly.loop_header.i

polly.loop_header.i:                              ; preds = %polly.loop_header.i, %polly.par.loadIVBounds.i
  %polly.indvar.i = phi i64 [ %polly.par.LB.i, %polly.par.loadIVBounds.i ], [ %polly.indvar_next.i, %polly.loop_header.i ]
  %scevgep.i = getelementptr i64, i64* %polly.subfunc.arg.call4.i, i64 %polly.indvar.i
  %27 = sub i64 %polly.subfunc.arg..i, %polly.indvar.i
  store i64 %27, i64* %scevgep.i, align 8, !alias.scope !36, !noalias !38
  %polly.indvar_next.i = add nsw i64 %polly.indvar.i, 1
  %polly.loop_cond.i = icmp sgt i64 %polly.indvar.i, %polly.adjust_ub.i
  br i1 %polly.loop_cond.i, label %polly.par.checkNext.loopexit.i, label %polly.loop_header.i

main_polly_subfn.exit.loopexit:                   ; preds = %polly.par.checkNext.loopexit.i
  br label %main_polly_subfn.exit

main_polly_subfn.exit:                            ; preds = %main_polly_subfn.exit.loopexit, %polly.parallel.for
  call void @GOMP_loop_end_nowait() #8
  call void @llvm.lifetime.end(i64 8, i8* nonnull %21)
  call void @llvm.lifetime.end(i64 8, i8* nonnull %22)
  call void @GOMP_parallel_end() #8
  call void @llvm.lifetime.end(i64 8, i8* nonnull %20)
  br label %blklab10
}

declare i64** @convertArgsToIntArray(i32, i8**, i64*, i64*) local_unnamed_addr #2

declare i64* @parseStringToInt(i64*) local_unnamed_addr #2

declare i64* @create1DArray_int64_t(i64, i64) local_unnamed_addr #2

; Function Attrs: nounwind
declare i32 @printf(i8* nocapture readonly, ...) local_unnamed_addr #4

declare void @println_s(i64*, i64) local_unnamed_addr #2

; Function Attrs: noreturn nounwind
declare void @exit(i32) local_unnamed_addr #5

; Function Attrs: nounwind readnone
declare { i64, i1 } @llvm.sadd.with.overflow.i64(i64, i64) #6

; Function Attrs: nounwind readnone
declare { i64, i1 } @llvm.smul.with.overflow.i64(i64, i64) #6

; Function Attrs: nounwind readnone
declare { i66, i1 } @llvm.sadd.with.overflow.i66(i66, i66) #6

; Function Attrs: nounwind readnone
declare { i64, i1 } @llvm.ssub.with.overflow.i64(i64, i64) #6

declare i8 @GOMP_loop_runtime_next(i64*, i64*) local_unnamed_addr

declare void @GOMP_loop_end_nowait() local_unnamed_addr

declare void @GOMP_parallel_loop_runtime_start(void (i8*)*, i8*, i32, i64, i64, i64) local_unnamed_addr

declare void @GOMP_parallel_end() local_unnamed_addr

define internal void @_sortV1__polly_subfn_2(i8* nocapture readonly %polly.par.userContext) #7 {
polly.par.setup:
  %polly.par.LBPtr = alloca i64, align 8
  %polly.par.UBPtr = alloca i64, align 8
  %0 = bitcast i8* %polly.par.userContext to i64*
  %polly.subfunc.arg.i.0.lcssa = load i64, i64* %0, align 8
  %1 = getelementptr inbounds i8, i8* %polly.par.userContext, i64 16
  %2 = bitcast i8* %1 to i64*
  %polly.subfunc.arg.l.0.lcssa = load i64, i64* %2, align 8
  %3 = getelementptr inbounds i8, i8* %polly.par.userContext, i64 32
  %4 = bitcast i8* %3 to i64**
  %polly.subfunc.arg.call6 = load i64*, i64** %4, align 8
  %5 = getelementptr inbounds i8, i8* %polly.par.userContext, i64 40
  %6 = bitcast i8* %5 to i64**
  %polly.subfunc.arg.items = load i64*, i64** %6, align 8
  %7 = call i8 @GOMP_loop_runtime_next(i64* nonnull %polly.par.LBPtr, i64* nonnull %polly.par.UBPtr)
  %8 = icmp eq i8 %7, 0
  br i1 %8, label %polly.par.exit, label %polly.par.loadIVBounds.preheader

polly.par.loadIVBounds.preheader:                 ; preds = %polly.par.setup
  %scevgep = getelementptr i64, i64* %polly.subfunc.arg.call6, i64 %polly.subfunc.arg.l.0.lcssa
  %scevgep3 = getelementptr i64, i64* %polly.subfunc.arg.items, i64 %polly.subfunc.arg.i.0.lcssa
  br label %polly.par.loadIVBounds

polly.par.exit.loopexit:                          ; preds = %polly.par.checkNext.loopexit
  br label %polly.par.exit

polly.par.exit:                                   ; preds = %polly.par.exit.loopexit, %polly.par.setup
  call void @GOMP_loop_end_nowait()
  ret void

polly.par.checkNext.loopexit:                     ; preds = %polly.loop_header
  %9 = call i8 @GOMP_loop_runtime_next(i64* nonnull %polly.par.LBPtr, i64* nonnull %polly.par.UBPtr)
  %10 = icmp eq i8 %9, 0
  br i1 %10, label %polly.par.exit.loopexit, label %polly.par.loadIVBounds

polly.par.loadIVBounds:                           ; preds = %polly.par.loadIVBounds.preheader, %polly.par.checkNext.loopexit
  %polly.par.UB = load i64, i64* %polly.par.UBPtr, align 8
  %polly.par.LB = load i64, i64* %polly.par.LBPtr, align 8
  %polly.adjust_ub = add i64 %polly.par.UB, -2
  br label %polly.loop_header

polly.loop_header:                                ; preds = %polly.loop_header, %polly.par.loadIVBounds
  %polly.indvar = phi i64 [ %polly.par.LB, %polly.par.loadIVBounds ], [ %polly.indvar_next, %polly.loop_header ]
  %scevgep2 = getelementptr i64, i64* %scevgep, i64 %polly.indvar
  %_p_scalar_ = load i64, i64* %scevgep2, align 8, !alias.scope !39, !noalias !41
  %scevgep4 = getelementptr i64, i64* %scevgep3, i64 %polly.indvar
  store i64 %_p_scalar_, i64* %scevgep4, align 8, !alias.scope !42, !noalias !43
  %polly.indvar_next = add nsw i64 %polly.indvar, 1
  %polly.loop_cond = icmp sgt i64 %polly.indvar, %polly.adjust_ub
  br i1 %polly.loop_cond, label %polly.par.checkNext.loopexit, label %polly.loop_header
}

define internal void @_sortV1__polly_subfn_3(i8* nocapture readonly %polly.par.userContext) #7 {
polly.par.setup:
  %polly.par.LBPtr = alloca i64, align 8
  %polly.par.UBPtr = alloca i64, align 8
  %0 = bitcast i8* %polly.par.userContext to i64*
  %polly.subfunc.arg.i.0.lcssa = load i64, i64* %0, align 8
  %1 = getelementptr inbounds i8, i8* %polly.par.userContext, i64 16
  %2 = bitcast i8* %1 to i64*
  %polly.subfunc.arg.l.0.lcssa = load i64, i64* %2, align 8
  %3 = getelementptr inbounds i8, i8* %polly.par.userContext, i64 32
  %4 = bitcast i8* %3 to i64**
  %polly.subfunc.arg.call6 = load i64*, i64** %4, align 8
  %5 = getelementptr inbounds i8, i8* %polly.par.userContext, i64 40
  %6 = bitcast i8* %5 to i64**
  %polly.subfunc.arg.items = load i64*, i64** %6, align 8
  %7 = call i8 @GOMP_loop_runtime_next(i64* nonnull %polly.par.LBPtr, i64* nonnull %polly.par.UBPtr)
  %8 = icmp eq i8 %7, 0
  br i1 %8, label %polly.par.exit, label %polly.par.loadIVBounds.preheader

polly.par.loadIVBounds.preheader:                 ; preds = %polly.par.setup
  %scevgep = getelementptr i64, i64* %polly.subfunc.arg.call6, i64 %polly.subfunc.arg.l.0.lcssa
  %scevgep3 = getelementptr i64, i64* %polly.subfunc.arg.items, i64 %polly.subfunc.arg.i.0.lcssa
  br label %polly.par.loadIVBounds

polly.par.exit.loopexit:                          ; preds = %polly.par.checkNext.loopexit
  br label %polly.par.exit

polly.par.exit:                                   ; preds = %polly.par.exit.loopexit, %polly.par.setup
  call void @GOMP_loop_end_nowait()
  ret void

polly.par.checkNext.loopexit:                     ; preds = %polly.loop_header
  %9 = call i8 @GOMP_loop_runtime_next(i64* nonnull %polly.par.LBPtr, i64* nonnull %polly.par.UBPtr)
  %10 = icmp eq i8 %9, 0
  br i1 %10, label %polly.par.exit.loopexit, label %polly.par.loadIVBounds

polly.par.loadIVBounds:                           ; preds = %polly.par.loadIVBounds.preheader, %polly.par.checkNext.loopexit
  %polly.par.UB = load i64, i64* %polly.par.UBPtr, align 8
  %polly.par.LB = load i64, i64* %polly.par.LBPtr, align 8
  %polly.adjust_ub = add i64 %polly.par.UB, -2
  br label %polly.loop_header

polly.loop_header:                                ; preds = %polly.loop_header, %polly.par.loadIVBounds
  %polly.indvar = phi i64 [ %polly.par.LB, %polly.par.loadIVBounds ], [ %polly.indvar_next, %polly.loop_header ]
  %scevgep2 = getelementptr i64, i64* %scevgep, i64 %polly.indvar
  %_p_scalar_ = load i64, i64* %scevgep2, align 8, !alias.scope !39, !noalias !41
  %scevgep4 = getelementptr i64, i64* %scevgep3, i64 %polly.indvar
  store i64 %_p_scalar_, i64* %scevgep4, align 8, !alias.scope !42, !noalias !43
  %polly.indvar_next = add nsw i64 %polly.indvar, 1
  %polly.loop_cond = icmp sgt i64 %polly.indvar, %polly.adjust_ub
  br i1 %polly.loop_cond, label %polly.par.checkNext.loopexit, label %polly.loop_header
}

define internal void @main_polly_subfn(i8* nocapture readonly %polly.par.userContext) #7 {
polly.par.setup:
  %polly.par.LBPtr = alloca i64, align 8
  %polly.par.UBPtr = alloca i64, align 8
  %0 = bitcast i8* %polly.par.userContext to i64*
  %polly.subfunc.arg. = load i64, i64* %0, align 8
  %1 = getelementptr inbounds i8, i8* %polly.par.userContext, i64 8
  %2 = bitcast i8* %1 to i64**
  %polly.subfunc.arg.call4 = load i64*, i64** %2, align 8
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
  %scevgep = getelementptr i64, i64* %polly.subfunc.arg.call4, i64 %polly.indvar
  %7 = sub i64 %polly.subfunc.arg., %polly.indvar
  store i64 %7, i64* %scevgep, align 8, !alias.scope !44, !noalias !38
  %polly.indvar_next = add nsw i64 %polly.indvar, 1
  %polly.loop_cond = icmp sgt i64 %polly.indvar, %polly.adjust_ub
  br i1 %polly.loop_cond, label %polly.par.checkNext.loopexit, label %polly.loop_header
}

attributes #0 = { nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "polly-optimized" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { argmemonly nounwind }
attributes #2 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { noreturn nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "polly-optimized" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { noreturn nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #6 = { nounwind readnone }
attributes #7 = { "polly.skip.fn" }
attributes #8 = { nounwind }
attributes #9 = { noreturn nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (http://llvm.org/git/clang.git 9b9db7fa41a1905899dbcbcc6cbdd05d2511da8e) (http://llvm.org/git/llvm.git fd456e365e09d54850dabc6a2f840a0c2eae7c27)"}
!1 = !{!2, !2, i64 0}
!2 = !{!"long", !3, i64 0}
!3 = !{!"omnipotent char", !4, i64 0}
!4 = !{!"Simple C/C++ TBAA"}
!5 = distinct !{!5, !6}
!6 = !{!"llvm.loop.unroll.disable"}
!7 = !{!8}
!8 = distinct !{!8, !9}
!9 = distinct !{!9, !"LVerDomain"}
!10 = !{!11}
!11 = distinct !{!11, !9}
!12 = distinct !{!12, !13, !14}
!13 = !{!"llvm.loop.vectorize.width", i32 1}
!14 = !{!"llvm.loop.interleave.count", i32 1}
!15 = distinct !{!15, !6}
!16 = !{!17}
!17 = distinct !{!17, !18}
!18 = distinct !{!18, !"LVerDomain"}
!19 = !{!20}
!20 = distinct !{!20, !18}
!21 = distinct !{!21, !13, !14}
!22 = distinct !{!22, !13, !14}
!23 = distinct !{!23, !13, !14}
!24 = distinct !{!24, !25, !"polly.alias.scope.call6"}
!25 = distinct !{!25, !"polly.alias.scope.domain"}
!26 = !{!27}
!27 = distinct !{!27, !25, !"polly.alias.scope.items"}
!28 = !{!24}
!29 = distinct !{!29, !30, !"polly.alias.scope.call6"}
!30 = distinct !{!30, !"polly.alias.scope.domain"}
!31 = !{!32}
!32 = distinct !{!32, !30, !"polly.alias.scope.items"}
!33 = !{!29}
!34 = !{!35, !35, i64 0}
!35 = !{!"any pointer", !3, i64 0}
!36 = distinct !{!36, !37, !"polly.alias.scope.call4"}
!37 = distinct !{!37, !"polly.alias.scope.domain"}
!38 = !{}
!39 = distinct !{!39, !40, !"polly.alias.scope.call6"}
!40 = distinct !{!40, !"polly.alias.scope.domain"}
!41 = !{!42}
!42 = distinct !{!42, !40, !"polly.alias.scope.items"}
!43 = !{!39}
!44 = distinct !{!44, !45, !"polly.alias.scope.call4"}
!45 = distinct !{!45, !"polly.alias.scope.domain"}
