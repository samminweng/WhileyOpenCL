; ModuleID = 'MergeSort_original.c'
source_filename = "MergeSort_original.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [6 x i8] c"%lld\0A\00", align 1

; Function Attrs: nounwind uwtable
define i64* @sortV1(i64* %items, i64 %items_size, i1 zeroext %items_dealloc, i64 %start, i64 %end) local_unnamed_addr #0 {
entry:
  %0 = sub i64 0, %start
  %polly.par.LBPtr.i1002 = alloca i64, align 8
  %polly.par.UBPtr.i1003 = alloca i64, align 8
  %polly.par.LBPtr.i = alloca i64, align 8
  %polly.par.UBPtr.i = alloca i64, align 8
  %polly.par.userContext993 = alloca { i64, i64, i64, i64, i64*, i64*, i64 }, align 8
  %polly.par.userContext983 = alloca { i64, i64, i64, i64, i64*, i64*, i64 }, align 8
  %add = add nsw i64 %start, 1
  %cmp = icmp slt i64 %add, %end
  br i1 %cmp, label %if.end, label %if.end101

if.end:                                           ; preds = %entry
  %add1 = add nsw i64 %end, %start
  %div = sdiv i64 %add1, 2
  %call = tail call i64* @slice(i64* %items, i64 %items_size, i64 %start, i64 %div) #8
  %sub = sub i64 %div, %start
  %call12 = tail call i64* @sortV1(i64* %call, i64 %sub, i1 zeroext undef, i64 0, i64 %div)
  %phitmp = bitcast i64* %call12 to i8*
  %call21 = tail call i64* @slice(i64* %items, i64 %items_size, i64 %div, i64 %end) #8
  %sub22 = sub nsw i64 %end, %div
  %call32 = tail call i64* @sortV1(i64* %call21, i64 %sub22, i1 zeroext undef, i64 0, i64 %sub22)
  %phitmp258 = bitcast i64* %call32 to i8*
  %sub38 = sub nsw i64 %end, %start
  %cmp39247 = icmp sgt i64 %sub38, 0
  %cmp43248 = icmp sgt i64 %sub, 0
  %or.cond249 = and i1 %cmp39247, %cmp43248
  %cmp47250 = icmp sgt i64 %sub22, 0
  %or.cond240251 = and i1 %cmp47250, %or.cond249
  br i1 %or.cond240251, label %if.end49.preheader, label %while.cond61.preheader

if.end49.preheader:                               ; preds = %if.end
  br label %if.end49

while.cond61.preheader.loopexit:                  ; preds = %blklab4
  br label %while.cond61.preheader

while.cond61.preheader:                           ; preds = %while.cond61.preheader.loopexit, %if.end
  %i.0.lcssa = phi i64 [ 0, %if.end ], [ %add60, %while.cond61.preheader.loopexit ]
  %r.0.lcssa = phi i64 [ 0, %if.end ], [ %r.1, %while.cond61.preheader.loopexit ]
  %l.0.lcssa = phi i64 [ 0, %if.end ], [ %l.1, %while.cond61.preheader.loopexit ]
  %cmp64244 = icmp slt i64 %l.0.lcssa, %sub
  br i1 %cmp64244, label %if.end66.lr.ph, label %while.cond71.preheader

if.end66.lr.ph:                                   ; preds = %while.cond61.preheader
  %1 = add i64 %sub, %i.0.lcssa
  %2 = sub i64 %1, %l.0.lcssa
  %3 = tail call { i64, i1 } @llvm.smul.with.overflow.i64(i64 %i.0.lcssa, i64 2)
  %.obit734 = extractvalue { i64, i1 } %3, 1
  %.res736 = extractvalue { i64, i1 } %3, 0
  %4 = tail call { i64, i1 } @llvm.sadd.with.overflow.i64(i64 %.res736, i64 %end)
  %.obit737 = extractvalue { i64, i1 } %4, 1
  %polly.overflow.state738 = or i1 %.obit734, %.obit737
  %.res739 = extractvalue { i64, i1 } %4, 0
  %5 = tail call { i64, i1 } @llvm.smul.with.overflow.i64(i64 %l.0.lcssa, i64 2)
  %.obit740 = extractvalue { i64, i1 } %5, 1
  %polly.overflow.state741 = or i1 %.obit740, %polly.overflow.state738
  %.res742 = extractvalue { i64, i1 } %5, 0
  %6 = tail call { i64, i1 } @llvm.sadd.with.overflow.i64(i64 %start, i64 %.res742)
  %.obit743 = extractvalue { i64, i1 } %6, 1
  %polly.overflow.state744 = or i1 %polly.overflow.state741, %.obit743
  %.res745 = extractvalue { i64, i1 } %6, 0
  %7 = tail call { i64, i1 } @llvm.sadd.with.overflow.i64(i64 %.res745, i64 -1)
  %.obit746 = extractvalue { i64, i1 } %7, 1
  %polly.overflow.state747 = or i1 %polly.overflow.state744, %.obit746
  %.res748 = extractvalue { i64, i1 } %7, 0
  %8 = icmp sge i64 %.res739, %.res748
  %9 = tail call { i64, i1 } @llvm.sadd.with.overflow.i64(i64 %start, i64 %end)
  %.obit749 = extractvalue { i64, i1 } %9, 1
  %10 = icmp slt i64 %add1, 0
  %11 = and i1 %10, %8
  %polly.overflow.state759 = or i1 %.obit749, %polly.overflow.state747
  %12 = tail call { i64, i1 } @llvm.sadd.with.overflow.i64(i64 %.res745, i64 2)
  %.obit761 = extractvalue { i64, i1 } %12, 1
  %.res763 = extractvalue { i64, i1 } %12, 0
  %13 = icmp sle i64 %.res763, %end
  %polly.overflow.state765 = or i1 %.obit761, %polly.overflow.state759
  %polly.overflow.state768 = or i1 %.obit740, %polly.overflow.state765
  %polly.overflow.state771 = or i1 %.obit743, %polly.overflow.state768
  %14 = tail call { i64, i1 } @llvm.sadd.with.overflow.i64(i64 %.res745, i64 1)
  %.obit773 = extractvalue { i64, i1 } %14, 1
  %polly.overflow.state774 = or i1 %.obit773, %polly.overflow.state771
  %15 = or i1 %13, %11
  %polly.overflow.state777 = or i1 %.obit734, %polly.overflow.state774
  %polly.overflow.state780 = or i1 %.obit737, %polly.overflow.state777
  %polly.overflow.state783 = or i1 %.obit740, %polly.overflow.state780
  %polly.overflow.state786 = or i1 %.obit743, %polly.overflow.state783
  %16 = sext i64 %.res745 to i66
  %17 = tail call { i66, i1 } @llvm.sadd.with.overflow.i66(i66 %16, i66 18446744073709551616)
  %.obit788 = extractvalue { i66, i1 } %17, 1
  %polly.overflow.state789 = or i1 %.obit788, %polly.overflow.state786
  %.res790 = extractvalue { i66, i1 } %17, 0
  %18 = sext i64 %.res739 to i66
  %19 = icmp sge i66 %18, %.res790
  %20 = icmp sgt i64 %add1, -1
  %21 = and i1 %20, %19
  %22 = or i1 %15, %21
  %23 = icmp slt i64 %i.0.lcssa, -1152921504606846976
  %polly.overflow.state798 = or i1 %.obit749, %polly.overflow.state789
  %24 = and i1 %23, %13
  %polly.overflow.state804 = or i1 %.obit761, %polly.overflow.state798
  %25 = and i1 %20, %24
  %26 = or i1 %25, %22
  %polly.overflow.state807 = or i1 %.obit740, %polly.overflow.state804
  %polly.overflow.state810 = or i1 %.obit743, %polly.overflow.state807
  %polly.overflow.state813 = or i1 %.obit773, %polly.overflow.state810
  %.res814 = extractvalue { i64, i1 } %14, 0
  %27 = icmp sle i64 %.res814, %end
  %28 = and i1 %23, %27
  %29 = and i1 %10, %28
  %30 = or i1 %29, %26
  %31 = icmp slt i64 %l.0.lcssa, -1152921504606846976
  %polly.overflow.state822 = or i1 %.obit749, %polly.overflow.state813
  %32 = and i1 %31, %13
  %polly.overflow.state828 = or i1 %.obit761, %polly.overflow.state822
  %33 = and i1 %20, %32
  %34 = or i1 %33, %30
  %polly.overflow.state831 = or i1 %.obit740, %polly.overflow.state828
  %polly.overflow.state834 = or i1 %.obit743, %polly.overflow.state831
  %polly.overflow.state837 = or i1 %.obit773, %polly.overflow.state834
  %35 = and i1 %31, %27
  %36 = and i1 %10, %35
  %37 = or i1 %36, %34
  %38 = icmp sgt i64 %l.0.lcssa, 1152921504606846975
  %polly.overflow.state846 = or i1 %.obit749, %polly.overflow.state837
  %39 = and i1 %38, %13
  %polly.overflow.state852 = or i1 %.obit761, %polly.overflow.state846
  %40 = and i1 %20, %39
  %41 = or i1 %40, %37
  %polly.overflow.state855 = or i1 %.obit740, %polly.overflow.state852
  %polly.overflow.state858 = or i1 %.obit743, %polly.overflow.state855
  %polly.overflow.state861 = or i1 %.obit773, %polly.overflow.state858
  %42 = and i1 %38, %27
  %43 = and i1 %10, %42
  %44 = or i1 %43, %41
  %45 = icmp sgt i64 %i.0.lcssa, 1152921504606846975
  %polly.overflow.state870 = or i1 %.obit749, %polly.overflow.state861
  %46 = and i1 %45, %13
  %polly.overflow.state876 = or i1 %.obit761, %polly.overflow.state870
  %47 = and i1 %20, %46
  %48 = or i1 %47, %44
  %polly.overflow.state879 = or i1 %.obit740, %polly.overflow.state876
  %polly.overflow.state882 = or i1 %.obit743, %polly.overflow.state879
  %polly.overflow.state885 = or i1 %.obit773, %polly.overflow.state882
  %49 = and i1 %45, %27
  %polly.overflow.state888 = or i1 %.obit749, %polly.overflow.state885
  %50 = and i1 %10, %49
  %51 = or i1 %50, %48
  %52 = icmp eq i64 %l.0.lcssa, -9223372036854775808
  %53 = or i1 %52, %51
  %54 = icmp eq i64 %start, -9223372036854775808
  %55 = tail call { i64, i1 } @llvm.sadd.with.overflow.i64(i64 %end, i64 9223372036854775807)
  %.obit890 = extractvalue { i64, i1 } %55, 1
  %polly.overflow.state891 = or i1 %.obit890, %polly.overflow.state888
  %.res892 = extractvalue { i64, i1 } %55, 0
  %polly.overflow.state894 = or i1 %.obit740, %polly.overflow.state891
  %56 = icmp sge i64 %.res892, %.res742
  %57 = and i1 %54, %56
  %58 = or i1 %57, %53
  %59 = xor i1 %58, true
  %polly.overflow.state900 = or i1 %.obit743, %polly.overflow.state894
  %polly.overflow.state903 = or i1 %.obit761, %polly.overflow.state900
  %polly.overflow.state906 = or i1 %.obit749, %polly.overflow.state903
  %60 = and i1 %20, %13
  %61 = tail call { i64, i1 } @llvm.ssub.with.overflow.i64(i64 0, i64 %start)
  %.obit908 = extractvalue { i64, i1 } %61, 1
  %polly.overflow.state909 = or i1 %.obit908, %polly.overflow.state906
  %pexp.p_div_q914 = lshr i64 %add1, 1
  %62 = tail call { i64, i1 } @llvm.sadd.with.overflow.i64(i64 %0, i64 %pexp.p_div_q914)
  %.obit915 = extractvalue { i64, i1 } %62, 1
  %polly.overflow.state916 = or i1 %.obit915, %polly.overflow.state909
  %.res917 = extractvalue { i64, i1 } %62, 0
  %63 = tail call { i64, i1 } @llvm.ssub.with.overflow.i64(i64 %0, i64 %end)
  %.obit924 = extractvalue { i64, i1 } %63, 1
  %polly.overflow.state925 = or i1 %.obit924, %polly.overflow.state916
  %.res926 = extractvalue { i64, i1 } %63, 0
  %pexp.p_div_q927 = lshr i64 %.res926, 1
  %64 = tail call { i64, i1 } @llvm.ssub.with.overflow.i64(i64 %0, i64 %pexp.p_div_q927)
  %.obit928 = extractvalue { i64, i1 } %64, 1
  %polly.overflow.state929 = or i1 %.obit928, %polly.overflow.state925
  %.res930 = extractvalue { i64, i1 } %64, 0
  %65 = select i1 %60, i64 %.res917, i64 %.res930
  %polly.access.call12 = getelementptr i64, i64* %call12, i64 %65
  %polly.access.items931 = getelementptr i64, i64* %items, i64 %i.0.lcssa
  %66 = icmp ule i64* %polly.access.call12, %polly.access.items931
  %polly.overflow.state933 = or i1 %.obit740, %polly.overflow.state929
  %polly.overflow.state936 = or i1 %.obit743, %polly.overflow.state933
  %polly.overflow.state939 = or i1 %.obit761, %polly.overflow.state936
  %polly.overflow.state942 = or i1 %.obit749, %polly.overflow.state939
  %67 = tail call { i64, i1 } @llvm.ssub.with.overflow.i64(i64 %i.0.lcssa, i64 %start)
  %.obit944 = extractvalue { i64, i1 } %67, 1
  %polly.overflow.state945 = or i1 %.obit944, %polly.overflow.state942
  %.res946 = extractvalue { i64, i1 } %67, 0
  %68 = tail call { i64, i1 } @llvm.ssub.with.overflow.i64(i64 %.res946, i64 %l.0.lcssa)
  %.obit947 = extractvalue { i64, i1 } %68, 1
  %polly.overflow.state948 = or i1 %.obit947, %polly.overflow.state945
  %.res949 = extractvalue { i64, i1 } %68, 0
  %69 = tail call { i64, i1 } @llvm.sadd.with.overflow.i64(i64 %.res949, i64 %pexp.p_div_q914)
  %.obit954 = extractvalue { i64, i1 } %69, 1
  %polly.overflow.state955 = or i1 %.obit954, %polly.overflow.state948
  %.res956 = extractvalue { i64, i1 } %69, 0
  %polly.overflow.state964 = or i1 %.obit908, %polly.overflow.state955
  %polly.overflow.state967 = or i1 %.obit924, %polly.overflow.state964
  %70 = tail call { i64, i1 } @llvm.ssub.with.overflow.i64(i64 %.res949, i64 %pexp.p_div_q927)
  %.obit970 = extractvalue { i64, i1 } %70, 1
  %polly.overflow.state971 = or i1 %.obit970, %polly.overflow.state967
  %.res972 = extractvalue { i64, i1 } %70, 0
  %71 = select i1 %60, i64 %.res956, i64 %.res972
  %polly.access.items973 = getelementptr i64, i64* %items, i64 %71
  %polly.access.call12974 = getelementptr i64, i64* %call12, i64 %l.0.lcssa
  %72 = icmp ule i64* %polly.access.items973, %polly.access.call12974
  %73 = or i1 %66, %72
  %74 = and i1 %73, %59
  %polly.rtc.overflown975 = xor i1 %polly.overflow.state971, true
  %polly.rtc.result976 = and i1 %74, %polly.rtc.overflown975
  br i1 %polly.rtc.result976, label %polly.cond977, label %if.end66.preheader

if.end66.preheader:                               ; preds = %if.end66.lr.ph
  %75 = sub i64 %div, %l.0.lcssa
  %76 = sub i64 %75, %start
  %min.iters.check = icmp ult i64 %76, 4
  br i1 %min.iters.check, label %if.end66.preheader1075, label %min.iters.checked

if.end66.preheader1075:                           ; preds = %middle.block, %vector.memcheck, %min.iters.checked, %if.end66.preheader
  %i.1246.ph = phi i64 [ %i.0.lcssa, %vector.memcheck ], [ %i.0.lcssa, %min.iters.checked ], [ %i.0.lcssa, %if.end66.preheader ], [ %ind.end, %middle.block ]
  %l.2245.ph = phi i64 [ %l.0.lcssa, %vector.memcheck ], [ %l.0.lcssa, %min.iters.checked ], [ %l.0.lcssa, %if.end66.preheader ], [ %ind.end1035, %middle.block ]
  %77 = add i64 %i.0.lcssa, %div
  %78 = sub i64 %77, %i.1246.ph
  %79 = sub i64 %78, %l.0.lcssa
  %80 = sub i64 %79, %start
  %81 = add i64 %77, -1
  %82 = sub i64 %81, %i.1246.ph
  %83 = sub i64 %82, %l.0.lcssa
  %84 = sub i64 %83, %start
  %xtraiter1080 = and i64 %80, 3
  %85 = icmp ult i64 %84, 3
  br i1 %85, label %while.cond71.preheader.loopexit.unr-lcssa, label %if.end66.preheader1075.new

if.end66.preheader1075.new:                       ; preds = %if.end66.preheader1075
  %unroll_iter1083 = sub i64 %80, %xtraiter1080
  br label %if.end66

min.iters.checked:                                ; preds = %if.end66.preheader
  %n.vec = and i64 %76, -4
  %cmp.zero = icmp eq i64 %n.vec, 0
  br i1 %cmp.zero, label %if.end66.preheader1075, label %vector.memcheck

vector.memcheck:                                  ; preds = %min.iters.checked
  %scevgep = getelementptr i64, i64* %items, i64 %i.0.lcssa
  %86 = add i64 %i.0.lcssa, %div
  %87 = add i64 %86, -1
  %88 = add i64 %l.0.lcssa, %start
  %89 = sub i64 %87, %88
  %scevgep1028 = getelementptr i64, i64* %items, i64 %89
  %scevgep1030 = getelementptr i64, i64* %call12, i64 %l.0.lcssa
  %90 = add nsw i64 %div, -1
  %91 = sub i64 %90, %start
  %scevgep1032 = getelementptr i64, i64* %call12, i64 %91
  %bound0 = icmp ule i64* %scevgep, %scevgep1032
  %bound1 = icmp ule i64* %scevgep1030, %scevgep1028
  %memcheck.conflict = and i1 %bound0, %bound1
  %ind.end = add i64 %i.0.lcssa, %n.vec
  %ind.end1035 = add i64 %l.0.lcssa, %n.vec
  br i1 %memcheck.conflict, label %if.end66.preheader1075, label %vector.body.preheader

vector.body.preheader:                            ; preds = %vector.memcheck
  %92 = add i64 %n.vec, -4
  %93 = lshr exact i64 %92, 2
  %94 = add nuw nsw i64 %93, 1
  %xtraiter1085 = and i64 %94, 1
  %95 = icmp eq i64 %93, 0
  br i1 %95, label %middle.block.unr-lcssa, label %vector.body.preheader.new

vector.body.preheader.new:                        ; preds = %vector.body.preheader
  %unroll_iter1087 = sub nsw i64 %94, %xtraiter1085
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.body.preheader.new
  %index = phi i64 [ 0, %vector.body.preheader.new ], [ %index.next.1, %vector.body ]
  %niter1088 = phi i64 [ %unroll_iter1087, %vector.body.preheader.new ], [ %niter1088.nsub.1, %vector.body ]
  %96 = add i64 %i.0.lcssa, %index
  %97 = add i64 %l.0.lcssa, %index
  %98 = getelementptr inbounds i64, i64* %call12, i64 %97
  %99 = bitcast i64* %98 to <2 x i64>*
  %wide.load = load <2 x i64>, <2 x i64>* %99, align 8, !tbaa !1, !alias.scope !5
  %100 = getelementptr i64, i64* %98, i64 2
  %101 = bitcast i64* %100 to <2 x i64>*
  %wide.load1037 = load <2 x i64>, <2 x i64>* %101, align 8, !tbaa !1, !alias.scope !5
  %102 = getelementptr inbounds i64, i64* %items, i64 %96
  %103 = bitcast i64* %102 to <2 x i64>*
  store <2 x i64> %wide.load, <2 x i64>* %103, align 8, !tbaa !1, !alias.scope !8, !noalias !5
  %104 = getelementptr i64, i64* %102, i64 2
  %105 = bitcast i64* %104 to <2 x i64>*
  store <2 x i64> %wide.load1037, <2 x i64>* %105, align 8, !tbaa !1, !alias.scope !8, !noalias !5
  %index.next = or i64 %index, 4
  %106 = add i64 %i.0.lcssa, %index.next
  %107 = add i64 %l.0.lcssa, %index.next
  %108 = getelementptr inbounds i64, i64* %call12, i64 %107
  %109 = bitcast i64* %108 to <2 x i64>*
  %wide.load.1 = load <2 x i64>, <2 x i64>* %109, align 8, !tbaa !1, !alias.scope !5
  %110 = getelementptr i64, i64* %108, i64 2
  %111 = bitcast i64* %110 to <2 x i64>*
  %wide.load1037.1 = load <2 x i64>, <2 x i64>* %111, align 8, !tbaa !1, !alias.scope !5
  %112 = getelementptr inbounds i64, i64* %items, i64 %106
  %113 = bitcast i64* %112 to <2 x i64>*
  store <2 x i64> %wide.load.1, <2 x i64>* %113, align 8, !tbaa !1, !alias.scope !8, !noalias !5
  %114 = getelementptr i64, i64* %112, i64 2
  %115 = bitcast i64* %114 to <2 x i64>*
  store <2 x i64> %wide.load1037.1, <2 x i64>* %115, align 8, !tbaa !1, !alias.scope !8, !noalias !5
  %index.next.1 = add i64 %index, 8
  %niter1088.nsub.1 = add i64 %niter1088, -2
  %niter1088.ncmp.1 = icmp eq i64 %niter1088.nsub.1, 0
  br i1 %niter1088.ncmp.1, label %middle.block.unr-lcssa.loopexit, label %vector.body, !llvm.loop !10

middle.block.unr-lcssa.loopexit:                  ; preds = %vector.body
  br label %middle.block.unr-lcssa

middle.block.unr-lcssa:                           ; preds = %middle.block.unr-lcssa.loopexit, %vector.body.preheader
  %index.unr = phi i64 [ 0, %vector.body.preheader ], [ %index.next.1, %middle.block.unr-lcssa.loopexit ]
  %lcmp.mod1086 = icmp eq i64 %xtraiter1085, 0
  br i1 %lcmp.mod1086, label %middle.block, label %vector.body.epil.preheader

vector.body.epil.preheader:                       ; preds = %middle.block.unr-lcssa
  br label %vector.body.epil

vector.body.epil:                                 ; preds = %vector.body.epil.preheader
  %116 = add i64 %i.0.lcssa, %index.unr
  %117 = add i64 %l.0.lcssa, %index.unr
  %118 = getelementptr inbounds i64, i64* %call12, i64 %117
  %119 = bitcast i64* %118 to <2 x i64>*
  %wide.load.epil = load <2 x i64>, <2 x i64>* %119, align 8, !tbaa !1, !alias.scope !5
  %120 = getelementptr i64, i64* %118, i64 2
  %121 = bitcast i64* %120 to <2 x i64>*
  %wide.load1037.epil = load <2 x i64>, <2 x i64>* %121, align 8, !tbaa !1, !alias.scope !5
  %122 = getelementptr inbounds i64, i64* %items, i64 %116
  %123 = bitcast i64* %122 to <2 x i64>*
  store <2 x i64> %wide.load.epil, <2 x i64>* %123, align 8, !tbaa !1, !alias.scope !8, !noalias !5
  %124 = getelementptr i64, i64* %122, i64 2
  %125 = bitcast i64* %124 to <2 x i64>*
  store <2 x i64> %wide.load1037.epil, <2 x i64>* %125, align 8, !tbaa !1, !alias.scope !8, !noalias !5
  br label %middle.block.epilog-lcssa

middle.block.epilog-lcssa:                        ; preds = %vector.body.epil
  br label %middle.block

middle.block:                                     ; preds = %middle.block.unr-lcssa, %middle.block.epilog-lcssa
  %cmp.n = icmp eq i64 %76, %n.vec
  br i1 %cmp.n, label %while.cond71.preheader, label %if.end66.preheader1075

if.end49:                                         ; preds = %if.end49.preheader, %blklab4
  %i.0254 = phi i64 [ %add60, %blklab4 ], [ 0, %if.end49.preheader ]
  %r.0253 = phi i64 [ %r.1, %blklab4 ], [ 0, %if.end49.preheader ]
  %l.0252 = phi i64 [ %l.1, %blklab4 ], [ 0, %if.end49.preheader ]
  %arrayidx = getelementptr inbounds i64, i64* %call12, i64 %l.0252
  %126 = load i64, i64* %arrayidx, align 8, !tbaa !1
  %arrayidx50 = getelementptr inbounds i64, i64* %call32, i64 %r.0253
  %127 = load i64, i64* %arrayidx50, align 8, !tbaa !1
  %cmp51 = icmp sgt i64 %126, %127
  %arrayidx58 = getelementptr inbounds i64, i64* %items, i64 %i.0254
  br i1 %cmp51, label %blklab3, label %if.end53

if.end53:                                         ; preds = %if.end49
  store i64 %126, i64* %arrayidx58, align 8, !tbaa !1
  %add56 = add nsw i64 %l.0252, 1
  br label %blklab4

blklab3:                                          ; preds = %if.end49
  store i64 %127, i64* %arrayidx58, align 8, !tbaa !1
  %add59 = add nsw i64 %r.0253, 1
  br label %blklab4

blklab4:                                          ; preds = %blklab3, %if.end53
  %l.1 = phi i64 [ %l.0252, %blklab3 ], [ %add56, %if.end53 ]
  %r.1 = phi i64 [ %add59, %blklab3 ], [ %r.0253, %if.end53 ]
  %add60 = add nuw nsw i64 %i.0254, 1
  %cmp39 = icmp slt i64 %add60, %sub38
  %cmp43 = icmp slt i64 %l.1, %sub
  %or.cond = and i1 %cmp39, %cmp43
  %cmp47 = icmp slt i64 %r.1, %sub22
  %or.cond240 = and i1 %cmp47, %or.cond
  br i1 %or.cond240, label %if.end49, label %while.cond61.preheader.loopexit

while.cond71.preheader.loopexit.unr-lcssa.loopexit: ; preds = %if.end66
  br label %while.cond71.preheader.loopexit.unr-lcssa

while.cond71.preheader.loopexit.unr-lcssa:        ; preds = %while.cond71.preheader.loopexit.unr-lcssa.loopexit, %if.end66.preheader1075
  %i.1246.unr = phi i64 [ %i.1246.ph, %if.end66.preheader1075 ], [ %add69.3, %while.cond71.preheader.loopexit.unr-lcssa.loopexit ]
  %l.2245.unr = phi i64 [ %l.2245.ph, %if.end66.preheader1075 ], [ %add70.3, %while.cond71.preheader.loopexit.unr-lcssa.loopexit ]
  %lcmp.mod1082 = icmp eq i64 %xtraiter1080, 0
  br i1 %lcmp.mod1082, label %while.cond71.preheader.loopexit, label %if.end66.epil.preheader

if.end66.epil.preheader:                          ; preds = %while.cond71.preheader.loopexit.unr-lcssa
  br label %if.end66.epil

if.end66.epil:                                    ; preds = %if.end66.epil, %if.end66.epil.preheader
  %i.1246.epil = phi i64 [ %add69.epil, %if.end66.epil ], [ %i.1246.unr, %if.end66.epil.preheader ]
  %l.2245.epil = phi i64 [ %add70.epil, %if.end66.epil ], [ %l.2245.unr, %if.end66.epil.preheader ]
  %epil.iter1081 = phi i64 [ %epil.iter1081.sub, %if.end66.epil ], [ %xtraiter1080, %if.end66.epil.preheader ]
  %arrayidx67.epil = getelementptr inbounds i64, i64* %call12, i64 %l.2245.epil
  %128 = load i64, i64* %arrayidx67.epil, align 8, !tbaa !1
  %arrayidx68.epil = getelementptr inbounds i64, i64* %items, i64 %i.1246.epil
  store i64 %128, i64* %arrayidx68.epil, align 8, !tbaa !1
  %add69.epil = add nsw i64 %i.1246.epil, 1
  %add70.epil = add nsw i64 %l.2245.epil, 1
  %epil.iter1081.sub = add i64 %epil.iter1081, -1
  %epil.iter1081.cmp = icmp eq i64 %epil.iter1081.sub, 0
  br i1 %epil.iter1081.cmp, label %while.cond71.preheader.loopexit.epilog-lcssa, label %if.end66.epil, !llvm.loop !13

while.cond71.preheader.loopexit.epilog-lcssa:     ; preds = %if.end66.epil
  br label %while.cond71.preheader.loopexit

while.cond71.preheader.loopexit:                  ; preds = %while.cond71.preheader.loopexit.unr-lcssa, %while.cond71.preheader.loopexit.epilog-lcssa
  br label %while.cond71.preheader

while.cond71.preheader:                           ; preds = %while.cond71.preheader.loopexit, %middle.block, %sortV1_polly_subfn_3.exit, %sortV1_polly_subfn_2.exit, %while.cond61.preheader
  %i.1.lcssa.ph = phi i64 [ %i.0.lcssa, %while.cond61.preheader ], [ %2, %sortV1_polly_subfn_2.exit ], [ %2, %sortV1_polly_subfn_3.exit ], [ %2, %middle.block ], [ %2, %while.cond71.preheader.loopexit ]
  %cmp74241 = icmp slt i64 %r.0.lcssa, %sub22
  br i1 %cmp74241, label %if.end76.preheader, label %if.then85

if.end76.preheader:                               ; preds = %while.cond71.preheader
  %129 = sub i64 %end, %r.0.lcssa
  %130 = sub i64 %129, %div
  %min.iters.check1041 = icmp ult i64 %130, 4
  br i1 %min.iters.check1041, label %if.end76.preheader1074, label %min.iters.checked1042

if.end76.preheader1074:                           ; preds = %middle.block1039, %vector.memcheck1059, %min.iters.checked1042, %if.end76.preheader
  %i.2243.ph = phi i64 [ %i.1.lcssa.ph, %vector.memcheck1059 ], [ %i.1.lcssa.ph, %min.iters.checked1042 ], [ %i.1.lcssa.ph, %if.end76.preheader ], [ %ind.end1064, %middle.block1039 ]
  %r.2242.ph = phi i64 [ %r.0.lcssa, %vector.memcheck1059 ], [ %r.0.lcssa, %min.iters.checked1042 ], [ %r.0.lcssa, %if.end76.preheader ], [ %ind.end1066, %middle.block1039 ]
  %131 = sub i64 %end, %r.2242.ph
  %132 = sub i64 %131, %div
  %133 = add i64 %end, -1
  %134 = sub i64 %133, %r.2242.ph
  %135 = sub i64 %134, %div
  %xtraiter = and i64 %132, 3
  %136 = icmp ult i64 %135, 3
  br i1 %136, label %if.then85.loopexit.unr-lcssa, label %if.end76.preheader1074.new

if.end76.preheader1074.new:                       ; preds = %if.end76.preheader1074
  %unroll_iter = sub i64 %132, %xtraiter
  br label %if.end76

min.iters.checked1042:                            ; preds = %if.end76.preheader
  %n.vec1044 = and i64 %130, -4
  %cmp.zero1045 = icmp eq i64 %n.vec1044, 0
  br i1 %cmp.zero1045, label %if.end76.preheader1074, label %vector.memcheck1059

vector.memcheck1059:                              ; preds = %min.iters.checked1042
  %scevgep1047 = getelementptr i64, i64* %items, i64 %i.1.lcssa.ph
  %137 = add i64 %i.1.lcssa.ph, %end
  %138 = add i64 %137, -1
  %139 = add i64 %r.0.lcssa, %div
  %140 = sub i64 %138, %139
  %scevgep1049 = getelementptr i64, i64* %items, i64 %140
  %scevgep1051 = getelementptr i64, i64* %call32, i64 %r.0.lcssa
  %141 = add i64 %end, -1
  %142 = sub i64 %141, %div
  %scevgep1053 = getelementptr i64, i64* %call32, i64 %142
  %bound01055 = icmp ule i64* %scevgep1047, %scevgep1053
  %bound11056 = icmp ule i64* %scevgep1051, %scevgep1049
  %memcheck.conflict1058 = and i1 %bound01055, %bound11056
  %ind.end1064 = add i64 %i.1.lcssa.ph, %n.vec1044
  %ind.end1066 = add i64 %r.0.lcssa, %n.vec1044
  br i1 %memcheck.conflict1058, label %if.end76.preheader1074, label %vector.body1038.preheader

vector.body1038.preheader:                        ; preds = %vector.memcheck1059
  %143 = add i64 %n.vec1044, -4
  %144 = lshr exact i64 %143, 2
  %145 = add nuw nsw i64 %144, 1
  %xtraiter1076 = and i64 %145, 1
  %146 = icmp eq i64 %144, 0
  br i1 %146, label %middle.block1039.unr-lcssa, label %vector.body1038.preheader.new

vector.body1038.preheader.new:                    ; preds = %vector.body1038.preheader
  %unroll_iter1078 = sub nsw i64 %145, %xtraiter1076
  br label %vector.body1038

vector.body1038:                                  ; preds = %vector.body1038, %vector.body1038.preheader.new
  %index1061 = phi i64 [ 0, %vector.body1038.preheader.new ], [ %index.next1062.1, %vector.body1038 ]
  %niter1079 = phi i64 [ %unroll_iter1078, %vector.body1038.preheader.new ], [ %niter1079.nsub.1, %vector.body1038 ]
  %147 = add i64 %i.1.lcssa.ph, %index1061
  %148 = add i64 %r.0.lcssa, %index1061
  %149 = getelementptr inbounds i64, i64* %call32, i64 %148
  %150 = bitcast i64* %149 to <2 x i64>*
  %wide.load1070 = load <2 x i64>, <2 x i64>* %150, align 8, !tbaa !1, !alias.scope !15
  %151 = getelementptr i64, i64* %149, i64 2
  %152 = bitcast i64* %151 to <2 x i64>*
  %wide.load1071 = load <2 x i64>, <2 x i64>* %152, align 8, !tbaa !1, !alias.scope !15
  %153 = getelementptr inbounds i64, i64* %items, i64 %147
  %154 = bitcast i64* %153 to <2 x i64>*
  store <2 x i64> %wide.load1070, <2 x i64>* %154, align 8, !tbaa !1, !alias.scope !18, !noalias !15
  %155 = getelementptr i64, i64* %153, i64 2
  %156 = bitcast i64* %155 to <2 x i64>*
  store <2 x i64> %wide.load1071, <2 x i64>* %156, align 8, !tbaa !1, !alias.scope !18, !noalias !15
  %index.next1062 = or i64 %index1061, 4
  %157 = add i64 %i.1.lcssa.ph, %index.next1062
  %158 = add i64 %r.0.lcssa, %index.next1062
  %159 = getelementptr inbounds i64, i64* %call32, i64 %158
  %160 = bitcast i64* %159 to <2 x i64>*
  %wide.load1070.1 = load <2 x i64>, <2 x i64>* %160, align 8, !tbaa !1, !alias.scope !15
  %161 = getelementptr i64, i64* %159, i64 2
  %162 = bitcast i64* %161 to <2 x i64>*
  %wide.load1071.1 = load <2 x i64>, <2 x i64>* %162, align 8, !tbaa !1, !alias.scope !15
  %163 = getelementptr inbounds i64, i64* %items, i64 %157
  %164 = bitcast i64* %163 to <2 x i64>*
  store <2 x i64> %wide.load1070.1, <2 x i64>* %164, align 8, !tbaa !1, !alias.scope !18, !noalias !15
  %165 = getelementptr i64, i64* %163, i64 2
  %166 = bitcast i64* %165 to <2 x i64>*
  store <2 x i64> %wide.load1071.1, <2 x i64>* %166, align 8, !tbaa !1, !alias.scope !18, !noalias !15
  %index.next1062.1 = add i64 %index1061, 8
  %niter1079.nsub.1 = add i64 %niter1079, -2
  %niter1079.ncmp.1 = icmp eq i64 %niter1079.nsub.1, 0
  br i1 %niter1079.ncmp.1, label %middle.block1039.unr-lcssa.loopexit, label %vector.body1038, !llvm.loop !20

middle.block1039.unr-lcssa.loopexit:              ; preds = %vector.body1038
  br label %middle.block1039.unr-lcssa

middle.block1039.unr-lcssa:                       ; preds = %middle.block1039.unr-lcssa.loopexit, %vector.body1038.preheader
  %index1061.unr = phi i64 [ 0, %vector.body1038.preheader ], [ %index.next1062.1, %middle.block1039.unr-lcssa.loopexit ]
  %lcmp.mod1077 = icmp eq i64 %xtraiter1076, 0
  br i1 %lcmp.mod1077, label %middle.block1039, label %vector.body1038.epil.preheader

vector.body1038.epil.preheader:                   ; preds = %middle.block1039.unr-lcssa
  br label %vector.body1038.epil

vector.body1038.epil:                             ; preds = %vector.body1038.epil.preheader
  %167 = add i64 %i.1.lcssa.ph, %index1061.unr
  %168 = add i64 %r.0.lcssa, %index1061.unr
  %169 = getelementptr inbounds i64, i64* %call32, i64 %168
  %170 = bitcast i64* %169 to <2 x i64>*
  %wide.load1070.epil = load <2 x i64>, <2 x i64>* %170, align 8, !tbaa !1, !alias.scope !15
  %171 = getelementptr i64, i64* %169, i64 2
  %172 = bitcast i64* %171 to <2 x i64>*
  %wide.load1071.epil = load <2 x i64>, <2 x i64>* %172, align 8, !tbaa !1, !alias.scope !15
  %173 = getelementptr inbounds i64, i64* %items, i64 %167
  %174 = bitcast i64* %173 to <2 x i64>*
  store <2 x i64> %wide.load1070.epil, <2 x i64>* %174, align 8, !tbaa !1, !alias.scope !18, !noalias !15
  %175 = getelementptr i64, i64* %173, i64 2
  %176 = bitcast i64* %175 to <2 x i64>*
  store <2 x i64> %wide.load1071.epil, <2 x i64>* %176, align 8, !tbaa !1, !alias.scope !18, !noalias !15
  br label %middle.block1039.epilog-lcssa

middle.block1039.epilog-lcssa:                    ; preds = %vector.body1038.epil
  br label %middle.block1039

middle.block1039:                                 ; preds = %middle.block1039.unr-lcssa, %middle.block1039.epilog-lcssa
  %cmp.n1067 = icmp eq i64 %130, %n.vec1044
  br i1 %cmp.n1067, label %if.then85, label %if.end76.preheader1074

if.end66:                                         ; preds = %if.end66, %if.end66.preheader1075.new
  %i.1246 = phi i64 [ %i.1246.ph, %if.end66.preheader1075.new ], [ %add69.3, %if.end66 ]
  %l.2245 = phi i64 [ %l.2245.ph, %if.end66.preheader1075.new ], [ %add70.3, %if.end66 ]
  %niter1084 = phi i64 [ %unroll_iter1083, %if.end66.preheader1075.new ], [ %niter1084.nsub.3, %if.end66 ]
  %arrayidx67 = getelementptr inbounds i64, i64* %call12, i64 %l.2245
  %177 = load i64, i64* %arrayidx67, align 8, !tbaa !1
  %arrayidx68 = getelementptr inbounds i64, i64* %items, i64 %i.1246
  store i64 %177, i64* %arrayidx68, align 8, !tbaa !1
  %add69 = add nsw i64 %i.1246, 1
  %add70 = add nsw i64 %l.2245, 1
  %arrayidx67.1 = getelementptr inbounds i64, i64* %call12, i64 %add70
  %178 = load i64, i64* %arrayidx67.1, align 8, !tbaa !1
  %arrayidx68.1 = getelementptr inbounds i64, i64* %items, i64 %add69
  store i64 %178, i64* %arrayidx68.1, align 8, !tbaa !1
  %add69.1 = add nsw i64 %i.1246, 2
  %add70.1 = add nsw i64 %l.2245, 2
  %arrayidx67.2 = getelementptr inbounds i64, i64* %call12, i64 %add70.1
  %179 = load i64, i64* %arrayidx67.2, align 8, !tbaa !1
  %arrayidx68.2 = getelementptr inbounds i64, i64* %items, i64 %add69.1
  store i64 %179, i64* %arrayidx68.2, align 8, !tbaa !1
  %add69.2 = add nsw i64 %i.1246, 3
  %add70.2 = add nsw i64 %l.2245, 3
  %arrayidx67.3 = getelementptr inbounds i64, i64* %call12, i64 %add70.2
  %180 = load i64, i64* %arrayidx67.3, align 8, !tbaa !1
  %arrayidx68.3 = getelementptr inbounds i64, i64* %items, i64 %add69.2
  store i64 %180, i64* %arrayidx68.3, align 8, !tbaa !1
  %add69.3 = add nsw i64 %i.1246, 4
  %add70.3 = add nsw i64 %l.2245, 4
  %niter1084.nsub.3 = add i64 %niter1084, -4
  %niter1084.ncmp.3 = icmp eq i64 %niter1084.nsub.3, 0
  br i1 %niter1084.ncmp.3, label %while.cond71.preheader.loopexit.unr-lcssa.loopexit, label %if.end66, !llvm.loop !21

if.end76:                                         ; preds = %if.end76, %if.end76.preheader1074.new
  %i.2243 = phi i64 [ %i.2243.ph, %if.end76.preheader1074.new ], [ %add79.3, %if.end76 ]
  %r.2242 = phi i64 [ %r.2242.ph, %if.end76.preheader1074.new ], [ %add80.3, %if.end76 ]
  %niter = phi i64 [ %unroll_iter, %if.end76.preheader1074.new ], [ %niter.nsub.3, %if.end76 ]
  %arrayidx77 = getelementptr inbounds i64, i64* %call32, i64 %r.2242
  %181 = load i64, i64* %arrayidx77, align 8, !tbaa !1
  %arrayidx78 = getelementptr inbounds i64, i64* %items, i64 %i.2243
  store i64 %181, i64* %arrayidx78, align 8, !tbaa !1
  %add79 = add nsw i64 %i.2243, 1
  %add80 = add nsw i64 %r.2242, 1
  %arrayidx77.1 = getelementptr inbounds i64, i64* %call32, i64 %add80
  %182 = load i64, i64* %arrayidx77.1, align 8, !tbaa !1
  %arrayidx78.1 = getelementptr inbounds i64, i64* %items, i64 %add79
  store i64 %182, i64* %arrayidx78.1, align 8, !tbaa !1
  %add79.1 = add nsw i64 %i.2243, 2
  %add80.1 = add nsw i64 %r.2242, 2
  %arrayidx77.2 = getelementptr inbounds i64, i64* %call32, i64 %add80.1
  %183 = load i64, i64* %arrayidx77.2, align 8, !tbaa !1
  %arrayidx78.2 = getelementptr inbounds i64, i64* %items, i64 %add79.1
  store i64 %183, i64* %arrayidx78.2, align 8, !tbaa !1
  %add79.2 = add nsw i64 %i.2243, 3
  %add80.2 = add nsw i64 %r.2242, 3
  %arrayidx77.3 = getelementptr inbounds i64, i64* %call32, i64 %add80.2
  %184 = load i64, i64* %arrayidx77.3, align 8, !tbaa !1
  %arrayidx78.3 = getelementptr inbounds i64, i64* %items, i64 %add79.2
  store i64 %184, i64* %arrayidx78.3, align 8, !tbaa !1
  %add79.3 = add nsw i64 %i.2243, 4
  %add80.3 = add nsw i64 %r.2242, 4
  %niter.nsub.3 = add i64 %niter, -4
  %niter.ncmp.3 = icmp eq i64 %niter.nsub.3, 0
  br i1 %niter.ncmp.3, label %if.then85.loopexit.unr-lcssa.loopexit, label %if.end76, !llvm.loop !22

if.then85.loopexit.unr-lcssa.loopexit:            ; preds = %if.end76
  br label %if.then85.loopexit.unr-lcssa

if.then85.loopexit.unr-lcssa:                     ; preds = %if.then85.loopexit.unr-lcssa.loopexit, %if.end76.preheader1074
  %i.2243.unr = phi i64 [ %i.2243.ph, %if.end76.preheader1074 ], [ %add79.3, %if.then85.loopexit.unr-lcssa.loopexit ]
  %r.2242.unr = phi i64 [ %r.2242.ph, %if.end76.preheader1074 ], [ %add80.3, %if.then85.loopexit.unr-lcssa.loopexit ]
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod, label %if.then85.loopexit, label %if.end76.epil.preheader

if.end76.epil.preheader:                          ; preds = %if.then85.loopexit.unr-lcssa
  br label %if.end76.epil

if.end76.epil:                                    ; preds = %if.end76.epil, %if.end76.epil.preheader
  %i.2243.epil = phi i64 [ %add79.epil, %if.end76.epil ], [ %i.2243.unr, %if.end76.epil.preheader ]
  %r.2242.epil = phi i64 [ %add80.epil, %if.end76.epil ], [ %r.2242.unr, %if.end76.epil.preheader ]
  %epil.iter = phi i64 [ %epil.iter.sub, %if.end76.epil ], [ %xtraiter, %if.end76.epil.preheader ]
  %arrayidx77.epil = getelementptr inbounds i64, i64* %call32, i64 %r.2242.epil
  %185 = load i64, i64* %arrayidx77.epil, align 8, !tbaa !1
  %arrayidx78.epil = getelementptr inbounds i64, i64* %items, i64 %i.2243.epil
  store i64 %185, i64* %arrayidx78.epil, align 8, !tbaa !1
  %add79.epil = add nsw i64 %i.2243.epil, 1
  %add80.epil = add nsw i64 %r.2242.epil, 1
  %epil.iter.sub = add i64 %epil.iter, -1
  %epil.iter.cmp = icmp eq i64 %epil.iter.sub, 0
  br i1 %epil.iter.cmp, label %if.then85.loopexit.epilog-lcssa, label %if.end76.epil, !llvm.loop !23

if.then85.loopexit.epilog-lcssa:                  ; preds = %if.end76.epil
  br label %if.then85.loopexit

if.then85.loopexit:                               ; preds = %if.then85.loopexit.unr-lcssa, %if.then85.loopexit.epilog-lcssa
  br label %if.then85

if.then85:                                        ; preds = %if.then85.loopexit, %middle.block1039, %while.cond71.preheader
  tail call void @free(i8* %phitmp) #8
  tail call void @free(i8* %phitmp258) #8
  br label %if.end101

if.end101:                                        ; preds = %entry, %if.then85
  ret i64* %items

polly.cond977:                                    ; preds = %if.end66.lr.ph
  %186 = sub nsw i64 %0, %l.0.lcssa
  br i1 %10, label %polly.parallel.for981, label %polly.parallel.for991

polly.parallel.for981:                            ; preds = %polly.cond977
  %187 = sub nsw i64 %186, %pexp.p_div_q927
  %188 = bitcast { i64, i64, i64, i64, i64*, i64*, i64 }* %polly.par.userContext983 to i8*
  call void @llvm.lifetime.start(i64 56, i8* %188)
  %polly.subfn.storeaddr.i.0.lcssa984 = getelementptr inbounds { i64, i64, i64, i64, i64*, i64*, i64 }, { i64, i64, i64, i64, i64*, i64*, i64 }* %polly.par.userContext983, i64 0, i32 0
  store i64 %i.0.lcssa, i64* %polly.subfn.storeaddr.i.0.lcssa984, align 8
  %polly.subfn.storeaddr.start985 = getelementptr inbounds { i64, i64, i64, i64, i64*, i64*, i64 }, { i64, i64, i64, i64, i64*, i64*, i64 }* %polly.par.userContext983, i64 0, i32 1
  store i64 %start, i64* %polly.subfn.storeaddr.start985, align 8
  %polly.subfn.storeaddr.l.0.lcssa986 = getelementptr inbounds { i64, i64, i64, i64, i64*, i64*, i64 }, { i64, i64, i64, i64, i64*, i64*, i64 }* %polly.par.userContext983, i64 0, i32 2
  store i64 %l.0.lcssa, i64* %polly.subfn.storeaddr.l.0.lcssa986, align 8
  %polly.subfn.storeaddr.end987 = getelementptr inbounds { i64, i64, i64, i64, i64*, i64*, i64 }, { i64, i64, i64, i64, i64*, i64*, i64 }* %polly.par.userContext983, i64 0, i32 3
  store i64 %end, i64* %polly.subfn.storeaddr.end987, align 8
  %polly.subfn.storeaddr.call12 = getelementptr inbounds { i64, i64, i64, i64, i64*, i64*, i64 }, { i64, i64, i64, i64, i64*, i64*, i64 }* %polly.par.userContext983, i64 0, i32 4
  store i64* %call12, i64** %polly.subfn.storeaddr.call12, align 8
  %polly.subfn.storeaddr.items988 = getelementptr inbounds { i64, i64, i64, i64, i64*, i64*, i64 }, { i64, i64, i64, i64, i64*, i64*, i64 }* %polly.par.userContext983, i64 0, i32 5
  store i64* %items, i64** %polly.subfn.storeaddr.items988, align 8
  %polly.subfn.storeaddr.div989 = getelementptr inbounds { i64, i64, i64, i64, i64*, i64*, i64 }, { i64, i64, i64, i64, i64*, i64*, i64 }* %polly.par.userContext983, i64 0, i32 6
  store i64 %div, i64* %polly.subfn.storeaddr.div989, align 8
  call void @GOMP_parallel_loop_runtime_start(void (i8*)* nonnull @sortV1_polly_subfn_2, i8* %188, i32 0, i64 0, i64 %187, i64 1) #8
  %189 = bitcast i64* %polly.par.LBPtr.i1002 to i8*
  call void @llvm.lifetime.start(i64 8, i8* %189)
  %190 = bitcast i64* %polly.par.UBPtr.i1003 to i8*
  call void @llvm.lifetime.start(i64 8, i8* %190)
  %polly.subfunc.arg.i.0.lcssa.i1004 = load i64, i64* %polly.subfn.storeaddr.i.0.lcssa984, align 8
  %polly.subfunc.arg.l.0.lcssa.i1005 = load i64, i64* %polly.subfn.storeaddr.l.0.lcssa986, align 8
  %polly.subfunc.arg.call12.i1006 = load i64*, i64** %polly.subfn.storeaddr.call12, align 8
  %polly.subfunc.arg.items.i1007 = load i64*, i64** %polly.subfn.storeaddr.items988, align 8
  %191 = call i8 @GOMP_loop_runtime_next(i64* nonnull %polly.par.LBPtr.i1002, i64* nonnull %polly.par.UBPtr.i1003) #8
  %192 = icmp eq i8 %191, 0
  br i1 %192, label %sortV1_polly_subfn_2.exit, label %polly.par.loadIVBounds.preheader.i1010

polly.par.loadIVBounds.preheader.i1010:           ; preds = %polly.parallel.for981
  %scevgep.i1008 = getelementptr i64, i64* %polly.subfunc.arg.call12.i1006, i64 %polly.subfunc.arg.l.0.lcssa.i1005
  %scevgep3.i1009 = getelementptr i64, i64* %polly.subfunc.arg.items.i1007, i64 %polly.subfunc.arg.i.0.lcssa.i1004
  br label %polly.par.loadIVBounds.i1015

polly.par.checkNext.loopexit.i1011:               ; preds = %polly.loop_header.i1022
  %193 = call i8 @GOMP_loop_runtime_next(i64* nonnull %polly.par.LBPtr.i1002, i64* nonnull %polly.par.UBPtr.i1003) #8
  %194 = icmp eq i8 %193, 0
  br i1 %194, label %sortV1_polly_subfn_2.exit.loopexit, label %polly.par.loadIVBounds.i1015

polly.par.loadIVBounds.i1015:                     ; preds = %polly.par.checkNext.loopexit.i1011, %polly.par.loadIVBounds.preheader.i1010
  %polly.par.UB.i1012 = load i64, i64* %polly.par.UBPtr.i1003, align 8
  %polly.par.LB.i1013 = load i64, i64* %polly.par.LBPtr.i1002, align 8
  %polly.adjust_ub.i1014 = add i64 %polly.par.UB.i1012, -2
  br label %polly.loop_header.i1022

polly.loop_header.i1022:                          ; preds = %polly.loop_header.i1022, %polly.par.loadIVBounds.i1015
  %polly.indvar.i1016 = phi i64 [ %polly.par.LB.i1013, %polly.par.loadIVBounds.i1015 ], [ %polly.indvar_next.i1020, %polly.loop_header.i1022 ]
  %scevgep2.i1017 = getelementptr i64, i64* %scevgep.i1008, i64 %polly.indvar.i1016
  %_p_scalar_.i1018 = load i64, i64* %scevgep2.i1017, align 8, !alias.scope !24, !noalias !26
  %scevgep4.i1019 = getelementptr i64, i64* %scevgep3.i1009, i64 %polly.indvar.i1016
  store i64 %_p_scalar_.i1018, i64* %scevgep4.i1019, align 8, !alias.scope !27, !noalias !28
  %polly.indvar_next.i1020 = add nsw i64 %polly.indvar.i1016, 1
  %polly.loop_cond.i1021 = icmp sgt i64 %polly.indvar.i1016, %polly.adjust_ub.i1014
  br i1 %polly.loop_cond.i1021, label %polly.par.checkNext.loopexit.i1011, label %polly.loop_header.i1022

sortV1_polly_subfn_2.exit.loopexit:               ; preds = %polly.par.checkNext.loopexit.i1011
  br label %sortV1_polly_subfn_2.exit

sortV1_polly_subfn_2.exit:                        ; preds = %sortV1_polly_subfn_2.exit.loopexit, %polly.parallel.for981
  call void @GOMP_loop_end_nowait() #8
  call void @llvm.lifetime.end(i64 8, i8* %189)
  call void @llvm.lifetime.end(i64 8, i8* %190)
  call void @GOMP_parallel_end() #8
  call void @llvm.lifetime.end(i64 8, i8* %188)
  br label %while.cond71.preheader

polly.parallel.for991:                            ; preds = %polly.cond977
  %195 = bitcast { i64, i64, i64, i64, i64*, i64*, i64 }* %polly.par.userContext993 to i8*
  call void @llvm.lifetime.start(i64 56, i8* %195)
  %polly.subfn.storeaddr.i.0.lcssa994 = getelementptr inbounds { i64, i64, i64, i64, i64*, i64*, i64 }, { i64, i64, i64, i64, i64*, i64*, i64 }* %polly.par.userContext993, i64 0, i32 0
  store i64 %i.0.lcssa, i64* %polly.subfn.storeaddr.i.0.lcssa994, align 8
  %polly.subfn.storeaddr.start995 = getelementptr inbounds { i64, i64, i64, i64, i64*, i64*, i64 }, { i64, i64, i64, i64, i64*, i64*, i64 }* %polly.par.userContext993, i64 0, i32 1
  store i64 %start, i64* %polly.subfn.storeaddr.start995, align 8
  %polly.subfn.storeaddr.l.0.lcssa996 = getelementptr inbounds { i64, i64, i64, i64, i64*, i64*, i64 }, { i64, i64, i64, i64, i64*, i64*, i64 }* %polly.par.userContext993, i64 0, i32 2
  store i64 %l.0.lcssa, i64* %polly.subfn.storeaddr.l.0.lcssa996, align 8
  %polly.subfn.storeaddr.end997 = getelementptr inbounds { i64, i64, i64, i64, i64*, i64*, i64 }, { i64, i64, i64, i64, i64*, i64*, i64 }* %polly.par.userContext993, i64 0, i32 3
  store i64 %end, i64* %polly.subfn.storeaddr.end997, align 8
  %polly.subfn.storeaddr.call12998 = getelementptr inbounds { i64, i64, i64, i64, i64*, i64*, i64 }, { i64, i64, i64, i64, i64*, i64*, i64 }* %polly.par.userContext993, i64 0, i32 4
  store i64* %call12, i64** %polly.subfn.storeaddr.call12998, align 8
  %polly.subfn.storeaddr.items999 = getelementptr inbounds { i64, i64, i64, i64, i64*, i64*, i64 }, { i64, i64, i64, i64, i64*, i64*, i64 }* %polly.par.userContext993, i64 0, i32 5
  store i64* %items, i64** %polly.subfn.storeaddr.items999, align 8
  %polly.subfn.storeaddr.div1000 = getelementptr inbounds { i64, i64, i64, i64, i64*, i64*, i64 }, { i64, i64, i64, i64, i64*, i64*, i64 }* %polly.par.userContext993, i64 0, i32 6
  store i64 %div, i64* %polly.subfn.storeaddr.div1000, align 8
  %196 = add i64 %186, %pexp.p_div_q914
  call void @GOMP_parallel_loop_runtime_start(void (i8*)* nonnull @sortV1_polly_subfn_3, i8* %195, i32 0, i64 0, i64 %196, i64 1) #8
  %197 = bitcast i64* %polly.par.LBPtr.i to i8*
  call void @llvm.lifetime.start(i64 8, i8* %197)
  %198 = bitcast i64* %polly.par.UBPtr.i to i8*
  call void @llvm.lifetime.start(i64 8, i8* %198)
  %polly.subfunc.arg.i.0.lcssa.i = load i64, i64* %polly.subfn.storeaddr.i.0.lcssa994, align 8
  %polly.subfunc.arg.l.0.lcssa.i = load i64, i64* %polly.subfn.storeaddr.l.0.lcssa996, align 8
  %polly.subfunc.arg.call12.i = load i64*, i64** %polly.subfn.storeaddr.call12998, align 8
  %polly.subfunc.arg.items.i = load i64*, i64** %polly.subfn.storeaddr.items999, align 8
  %199 = call i8 @GOMP_loop_runtime_next(i64* nonnull %polly.par.LBPtr.i, i64* nonnull %polly.par.UBPtr.i) #8
  %200 = icmp eq i8 %199, 0
  br i1 %200, label %sortV1_polly_subfn_3.exit, label %polly.par.loadIVBounds.preheader.i

polly.par.loadIVBounds.preheader.i:               ; preds = %polly.parallel.for991
  %scevgep.i = getelementptr i64, i64* %polly.subfunc.arg.call12.i, i64 %polly.subfunc.arg.l.0.lcssa.i
  %scevgep3.i = getelementptr i64, i64* %polly.subfunc.arg.items.i, i64 %polly.subfunc.arg.i.0.lcssa.i
  br label %polly.par.loadIVBounds.i

polly.par.checkNext.loopexit.i:                   ; preds = %polly.loop_header.i
  %201 = call i8 @GOMP_loop_runtime_next(i64* nonnull %polly.par.LBPtr.i, i64* nonnull %polly.par.UBPtr.i) #8
  %202 = icmp eq i8 %201, 0
  br i1 %202, label %sortV1_polly_subfn_3.exit.loopexit, label %polly.par.loadIVBounds.i

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

sortV1_polly_subfn_3.exit.loopexit:               ; preds = %polly.par.checkNext.loopexit.i
  br label %sortV1_polly_subfn_3.exit

sortV1_polly_subfn_3.exit:                        ; preds = %sortV1_polly_subfn_3.exit.loopexit, %polly.parallel.for991
  call void @GOMP_loop_end_nowait() #8
  call void @llvm.lifetime.end(i64 8, i8* %197)
  call void @llvm.lifetime.end(i64 8, i8* %198)
  call void @GOMP_parallel_end() #8
  call void @llvm.lifetime.end(i64 8, i8* %195)
  br label %while.cond71.preheader
}

; Function Attrs: argmemonly nounwind
declare void @llvm.lifetime.start(i64, i8* nocapture) #1

; Function Attrs: nounwind
declare void @free(i8* nocapture) local_unnamed_addr #2

declare i64* @slice(i64*, i64, i64, i64) local_unnamed_addr #3

; Function Attrs: argmemonly nounwind
declare void @llvm.lifetime.end(i64, i8* nocapture) #1

; Function Attrs: noreturn nounwind uwtable
define i32 @main(i32 %argc, i8** %args) local_unnamed_addr #4 {
entry:
  %polly.par.LBPtr.i = alloca i64, align 8
  %polly.par.UBPtr.i = alloca i64, align 8
  %polly.par.userContext = alloca { i64, i64* }, align 8
  %call = tail call i64** @convertArgsToIntArray(i32 %argc, i8** %args) #8
  %sub = add nsw i32 %argc, -1
  %conv = sext i32 %sub to i64
  %0 = load i64*, i64** %call, align 8, !tbaa !34
  %call1 = tail call i64* @parseStringToInt(i64* %0) #8
  %cmp = icmp eq i64* %call1, null
  br i1 %cmp, label %if.end92.critedge, label %if.end8

if.end8:                                          ; preds = %entry
  %1 = load i64, i64* %call1, align 8, !tbaa !1
  %conv13 = trunc i64 %1 to i32
  %call14 = tail call i64* @create1DArray(i32 0, i32 %conv13) #8
  %cmp20159 = icmp sgt i64 %1, 0
  br i1 %cmp20159, label %polly.parallel.for, label %if.then73

if.then73:                                        ; preds = %if.end8, %main_polly_subfn.exit
  %call29 = tail call i64* @sortV1(i64* %call14, i64 %1, i1 zeroext undef, i64 0, i64 %1)
  %2 = load i64, i64* %call29, align 8, !tbaa !1
  %call36 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str, i64 0, i64 0), i64 %2)
  %sub37 = add nsw i64 %1, -1
  %arrayidx38 = getelementptr inbounds i64, i64* %call29, i64 %sub37
  %3 = load i64, i64* %arrayidx38, align 8, !tbaa !1
  %call39 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str, i64 0, i64 0), i64 %3)
  %call44 = tail call i64* @create1DArray(i32 0, i32 24) #8
  %4 = bitcast i64* %call44 to <2 x i64>*
  store <2 x i64> <i64 80, i64 97>, <2 x i64>* %4, align 8, !tbaa !1
  %arrayidx47 = getelementptr inbounds i64, i64* %call44, i64 2
  %5 = bitcast i64* %arrayidx47 to <2 x i64>*
  store <2 x i64> <i64 115, i64 115>, <2 x i64>* %5, align 8, !tbaa !1
  %arrayidx49 = getelementptr inbounds i64, i64* %call44, i64 4
  %6 = bitcast i64* %arrayidx49 to <2 x i64>*
  store <2 x i64> <i64 32, i64 77>, <2 x i64>* %6, align 8, !tbaa !1
  %arrayidx51 = getelementptr inbounds i64, i64* %call44, i64 6
  %7 = bitcast i64* %arrayidx51 to <2 x i64>*
  store <2 x i64> <i64 101, i64 114>, <2 x i64>* %7, align 8, !tbaa !1
  %arrayidx53 = getelementptr inbounds i64, i64* %call44, i64 8
  %8 = bitcast i64* %arrayidx53 to <2 x i64>*
  store <2 x i64> <i64 103, i64 101>, <2 x i64>* %8, align 8, !tbaa !1
  %arrayidx55 = getelementptr inbounds i64, i64* %call44, i64 10
  %9 = bitcast i64* %arrayidx55 to <2 x i64>*
  store <2 x i64> <i64 115, i64 111>, <2 x i64>* %9, align 8, !tbaa !1
  %arrayidx57 = getelementptr inbounds i64, i64* %call44, i64 12
  %10 = bitcast i64* %arrayidx57 to <2 x i64>*
  store <2 x i64> <i64 114, i64 116>, <2 x i64>* %10, align 8, !tbaa !1
  %arrayidx59 = getelementptr inbounds i64, i64* %call44, i64 14
  %11 = bitcast i64* %arrayidx59 to <2 x i64>*
  store <2 x i64> <i64 32, i64 116>, <2 x i64>* %11, align 8, !tbaa !1
  %arrayidx61 = getelementptr inbounds i64, i64* %call44, i64 16
  %12 = bitcast i64* %arrayidx61 to <2 x i64>*
  store <2 x i64> <i64 101, i64 115>, <2 x i64>* %12, align 8, !tbaa !1
  %arrayidx63 = getelementptr inbounds i64, i64* %call44, i64 18
  %13 = bitcast i64* %arrayidx63 to <2 x i64>*
  store <2 x i64> <i64 116, i64 32>, <2 x i64>* %13, align 8, !tbaa !1
  %arrayidx65 = getelementptr inbounds i64, i64* %call44, i64 20
  %14 = bitcast i64* %arrayidx65 to <2 x i64>*
  store <2 x i64> <i64 99, i64 97>, <2 x i64>* %14, align 8, !tbaa !1
  %arrayidx67 = getelementptr inbounds i64, i64* %call44, i64 22
  %15 = bitcast i64* %arrayidx67 to <2 x i64>*
  store <2 x i64> <i64 115, i64 101>, <2 x i64>* %15, align 8, !tbaa !1
  tail call void @println_s(i64* %call44, i64 24) #8
  %phitmp = bitcast i64* %call44 to i8*
  %phitmp158 = bitcast i64* %call29 to i8*
  %16 = bitcast i64* %call1 to i8*
  tail call void @free(i8* %16) #8
  tail call void @free(i8* %phitmp158) #8
  tail call void @free2DArray(i64** %call, i64 %conv) #8
  tail call void @free(i8* %phitmp) #8
  br label %if.end92

if.end92.critedge:                                ; preds = %entry
  tail call void @free2DArray(i64** %call, i64 %conv) #8
  br label %if.end92

if.end92:                                         ; preds = %if.end92.critedge, %if.then73
  tail call void @exit(i32 0) #9
  unreachable

polly.parallel.for:                               ; preds = %if.end8
  %17 = bitcast { i64, i64* }* %polly.par.userContext to i8*
  call void @llvm.lifetime.start(i64 16, i8* %17)
  %polly.subfn.storeaddr. = getelementptr inbounds { i64, i64* }, { i64, i64* }* %polly.par.userContext, i64 0, i32 0
  store i64 %1, i64* %polly.subfn.storeaddr., align 8
  %polly.subfn.storeaddr.call14 = getelementptr inbounds { i64, i64* }, { i64, i64* }* %polly.par.userContext, i64 0, i32 1
  store i64* %call14, i64** %polly.subfn.storeaddr.call14, align 8
  call void @GOMP_parallel_loop_runtime_start(void (i8*)* nonnull @main_polly_subfn, i8* %17, i32 0, i64 0, i64 %1, i64 1) #8
  %18 = bitcast i64* %polly.par.LBPtr.i to i8*
  call void @llvm.lifetime.start(i64 8, i8* %18)
  %19 = bitcast i64* %polly.par.UBPtr.i to i8*
  call void @llvm.lifetime.start(i64 8, i8* %19)
  %polly.subfunc.arg..i = load i64, i64* %polly.subfn.storeaddr., align 8
  %polly.subfunc.arg.call14.i = load i64*, i64** %polly.subfn.storeaddr.call14, align 8
  %20 = call i8 @GOMP_loop_runtime_next(i64* nonnull %polly.par.LBPtr.i, i64* nonnull %polly.par.UBPtr.i) #8
  %21 = icmp eq i8 %20, 0
  br i1 %21, label %main_polly_subfn.exit, label %polly.par.loadIVBounds.i.preheader

polly.par.loadIVBounds.i.preheader:               ; preds = %polly.parallel.for
  br label %polly.par.loadIVBounds.i

polly.par.checkNext.loopexit.i:                   ; preds = %polly.loop_header.i
  %22 = call i8 @GOMP_loop_runtime_next(i64* nonnull %polly.par.LBPtr.i, i64* nonnull %polly.par.UBPtr.i) #8
  %23 = icmp eq i8 %22, 0
  br i1 %23, label %main_polly_subfn.exit.loopexit, label %polly.par.loadIVBounds.i

polly.par.loadIVBounds.i:                         ; preds = %polly.par.loadIVBounds.i.preheader, %polly.par.checkNext.loopexit.i
  %polly.par.UB.i = load i64, i64* %polly.par.UBPtr.i, align 8
  %polly.par.LB.i = load i64, i64* %polly.par.LBPtr.i, align 8
  %polly.adjust_ub.i = add i64 %polly.par.UB.i, -2
  br label %polly.loop_header.i

polly.loop_header.i:                              ; preds = %polly.loop_header.i, %polly.par.loadIVBounds.i
  %polly.indvar.i = phi i64 [ %polly.par.LB.i, %polly.par.loadIVBounds.i ], [ %polly.indvar_next.i, %polly.loop_header.i ]
  %scevgep.i = getelementptr i64, i64* %polly.subfunc.arg.call14.i, i64 %polly.indvar.i
  %24 = sub i64 %polly.subfunc.arg..i, %polly.indvar.i
  store i64 %24, i64* %scevgep.i, align 8, !alias.scope !36, !noalias !38
  %polly.indvar_next.i = add nsw i64 %polly.indvar.i, 1
  %polly.loop_cond.i = icmp sgt i64 %polly.indvar.i, %polly.adjust_ub.i
  br i1 %polly.loop_cond.i, label %polly.par.checkNext.loopexit.i, label %polly.loop_header.i

main_polly_subfn.exit.loopexit:                   ; preds = %polly.par.checkNext.loopexit.i
  br label %main_polly_subfn.exit

main_polly_subfn.exit:                            ; preds = %main_polly_subfn.exit.loopexit, %polly.parallel.for
  call void @GOMP_loop_end_nowait() #8
  call void @llvm.lifetime.end(i64 8, i8* %18)
  call void @llvm.lifetime.end(i64 8, i8* %19)
  call void @GOMP_parallel_end() #8
  call void @llvm.lifetime.end(i64 8, i8* %17)
  br label %if.then73
}

declare void @free2DArray(i64**, i64) local_unnamed_addr #3

declare i64** @convertArgsToIntArray(i32, i8**) local_unnamed_addr #3

declare i64* @parseStringToInt(i64*) local_unnamed_addr #3

declare i64* @create1DArray(i32, i32) local_unnamed_addr #3

; Function Attrs: nounwind
declare i32 @printf(i8* nocapture readonly, ...) local_unnamed_addr #2

declare void @println_s(i64*, i64) local_unnamed_addr #3

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

define internal void @sortV1_polly_subfn_2(i8* nocapture readonly %polly.par.userContext) #7 {
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
  %polly.subfunc.arg.call12 = load i64*, i64** %4, align 8
  %5 = getelementptr inbounds i8, i8* %polly.par.userContext, i64 40
  %6 = bitcast i8* %5 to i64**
  %polly.subfunc.arg.items = load i64*, i64** %6, align 8
  %7 = call i8 @GOMP_loop_runtime_next(i64* nonnull %polly.par.LBPtr, i64* nonnull %polly.par.UBPtr)
  %8 = icmp eq i8 %7, 0
  br i1 %8, label %polly.par.exit, label %polly.par.loadIVBounds.preheader

polly.par.loadIVBounds.preheader:                 ; preds = %polly.par.setup
  %scevgep = getelementptr i64, i64* %polly.subfunc.arg.call12, i64 %polly.subfunc.arg.l.0.lcssa
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

define internal void @sortV1_polly_subfn_3(i8* nocapture readonly %polly.par.userContext) #7 {
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
  %polly.subfunc.arg.call12 = load i64*, i64** %4, align 8
  %5 = getelementptr inbounds i8, i8* %polly.par.userContext, i64 40
  %6 = bitcast i8* %5 to i64**
  %polly.subfunc.arg.items = load i64*, i64** %6, align 8
  %7 = call i8 @GOMP_loop_runtime_next(i64* nonnull %polly.par.LBPtr, i64* nonnull %polly.par.UBPtr)
  %8 = icmp eq i8 %7, 0
  br i1 %8, label %polly.par.exit, label %polly.par.loadIVBounds.preheader

polly.par.loadIVBounds.preheader:                 ; preds = %polly.par.setup
  %scevgep = getelementptr i64, i64* %polly.subfunc.arg.call12, i64 %polly.subfunc.arg.l.0.lcssa
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
  store i64 %7, i64* %scevgep, align 8, !alias.scope !44, !noalias !38
  %polly.indvar_next = add nsw i64 %polly.indvar, 1
  %polly.loop_cond = icmp sgt i64 %polly.indvar, %polly.adjust_ub
  br i1 %polly.loop_cond, label %polly.par.checkNext.loopexit, label %polly.loop_header
}

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "polly-optimized" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { argmemonly nounwind }
attributes #2 = { nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { noreturn nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "polly-optimized" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { noreturn nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #6 = { nounwind readnone }
attributes #7 = { "polly.skip.fn" }
attributes #8 = { nounwind }
attributes #9 = { noreturn nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 3.9.0 (http://llvm.org/git/clang.git aec29e5973c27bcbc3c1cf54295e3778050a73cd) (http://llvm.org/git/llvm.git 4c6356e8c64e246972f760a1f05bc0f365b090ad)"}
!1 = !{!2, !2, i64 0}
!2 = !{!"long long", !3, i64 0}
!3 = !{!"omnipotent char", !4, i64 0}
!4 = !{!"Simple C/C++ TBAA"}
!5 = !{!6}
!6 = distinct !{!6, !7}
!7 = distinct !{!7, !"LVerDomain"}
!8 = !{!9}
!9 = distinct !{!9, !7}
!10 = distinct !{!10, !11, !12}
!11 = !{!"llvm.loop.vectorize.width", i32 1}
!12 = !{!"llvm.loop.interleave.count", i32 1}
!13 = distinct !{!13, !14}
!14 = !{!"llvm.loop.unroll.disable"}
!15 = !{!16}
!16 = distinct !{!16, !17}
!17 = distinct !{!17, !"LVerDomain"}
!18 = !{!19}
!19 = distinct !{!19, !17}
!20 = distinct !{!20, !11, !12}
!21 = distinct !{!21, !11, !12}
!22 = distinct !{!22, !11, !12}
!23 = distinct !{!23, !14}
!24 = distinct !{!24, !25, !"polly.alias.scope.call12"}
!25 = distinct !{!25, !"polly.alias.scope.domain"}
!26 = !{!27}
!27 = distinct !{!27, !25, !"polly.alias.scope.items"}
!28 = !{!24}
!29 = distinct !{!29, !30, !"polly.alias.scope.call12"}
!30 = distinct !{!30, !"polly.alias.scope.domain"}
!31 = !{!32}
!32 = distinct !{!32, !30, !"polly.alias.scope.items"}
!33 = !{!29}
!34 = !{!35, !35, i64 0}
!35 = !{!"any pointer", !3, i64 0}
!36 = distinct !{!36, !37, !"polly.alias.scope.call14"}
!37 = distinct !{!37, !"polly.alias.scope.domain"}
!38 = !{}
!39 = distinct !{!39, !40, !"polly.alias.scope.call12"}
!40 = distinct !{!40, !"polly.alias.scope.domain"}
!41 = !{!42}
!42 = distinct !{!42, !40, !"polly.alias.scope.items"}
!43 = !{!39}
!44 = distinct !{!44, !45, !"polly.alias.scope.call14"}
!45 = distinct !{!45, !"polly.alias.scope.domain"}
