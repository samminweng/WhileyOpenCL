; ModuleID = 'MergeSort_original.c'
source_filename = "MergeSort_original.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [6 x i8] c"%lld\0A\00", align 1

; Function Attrs: nounwind uwtable
define i64* @sortV1(i64* %items, i64 %items_size, i1 zeroext %items_dealloc, i64 %start, i64 %end) local_unnamed_addr #0 {
entry:
  %0 = sub i64 0, %start
  %polly.par.LBPtr.i1012 = alloca i64, align 8
  %polly.par.UBPtr.i1013 = alloca i64, align 8
  %polly.par.LBPtr.i = alloca i64, align 8
  %polly.par.UBPtr.i = alloca i64, align 8
  %polly.par.userContext1003 = alloca { i64, i64, i64, i64, i64*, i64*, i64 }, align 8
  %polly.par.userContext993 = alloca { i64, i64, i64, i64, i64*, i64*, i64 }, align 8
  %add = add nsw i64 %start, 1
  %cmp = icmp slt i64 %add, %end
  br i1 %cmp, label %if.end, label %if.end107

if.end:                                           ; preds = %entry
  %add1 = add nsw i64 %end, %start
  %div = sdiv i64 %add1, 2
  %call = tail call i64* @slice(i64* %items, i64 %items_size, i64 %start, i64 %div) #8
  %sub = sub i64 %div, %start
  %call13 = tail call i64* @sortV1(i64* %call, i64 %sub, i1 zeroext undef, i64 0, i64 %div)
  %phitmp = bitcast i64* %call13 to i8*
  %call24 = tail call i64* @slice(i64* %items, i64 %items_size, i64 %div, i64 %end) #8
  %sub25 = sub nsw i64 %end, %div
  %call36 = tail call i64* @sortV1(i64* %call24, i64 %sub25, i1 zeroext undef, i64 0, i64 %sub25)
  %phitmp268 = bitcast i64* %call36 to i8*
  %sub44 = sub nsw i64 %end, %start
  %cmp45257 = icmp sgt i64 %sub44, 0
  %cmp49258 = icmp sgt i64 %sub, 0
  %or.cond259 = and i1 %cmp45257, %cmp49258
  %cmp53260 = icmp sgt i64 %sub25, 0
  %or.cond250261 = and i1 %cmp53260, %or.cond259
  br i1 %or.cond250261, label %if.end55.preheader, label %while.cond67.preheader

if.end55.preheader:                               ; preds = %if.end
  br label %if.end55

while.cond67.preheader.loopexit:                  ; preds = %blklab4
  br label %while.cond67.preheader

while.cond67.preheader:                           ; preds = %while.cond67.preheader.loopexit, %if.end
  %i.0.lcssa = phi i64 [ 0, %if.end ], [ %add66, %while.cond67.preheader.loopexit ]
  %r.0.lcssa = phi i64 [ 0, %if.end ], [ %r.1, %while.cond67.preheader.loopexit ]
  %l.0.lcssa = phi i64 [ 0, %if.end ], [ %l.1, %while.cond67.preheader.loopexit ]
  %cmp70254 = icmp slt i64 %l.0.lcssa, %sub
  br i1 %cmp70254, label %if.end72.lr.ph, label %while.cond77.preheader

if.end72.lr.ph:                                   ; preds = %while.cond67.preheader
  %1 = add i64 %sub, %i.0.lcssa
  %2 = sub i64 %1, %l.0.lcssa
  %3 = tail call { i64, i1 } @llvm.smul.with.overflow.i64(i64 %i.0.lcssa, i64 2)
  %.obit744 = extractvalue { i64, i1 } %3, 1
  %.res746 = extractvalue { i64, i1 } %3, 0
  %4 = tail call { i64, i1 } @llvm.sadd.with.overflow.i64(i64 %.res746, i64 %end)
  %.obit747 = extractvalue { i64, i1 } %4, 1
  %polly.overflow.state748 = or i1 %.obit744, %.obit747
  %.res749 = extractvalue { i64, i1 } %4, 0
  %5 = tail call { i64, i1 } @llvm.smul.with.overflow.i64(i64 %l.0.lcssa, i64 2)
  %.obit750 = extractvalue { i64, i1 } %5, 1
  %polly.overflow.state751 = or i1 %.obit750, %polly.overflow.state748
  %.res752 = extractvalue { i64, i1 } %5, 0
  %6 = tail call { i64, i1 } @llvm.sadd.with.overflow.i64(i64 %start, i64 %.res752)
  %.obit753 = extractvalue { i64, i1 } %6, 1
  %polly.overflow.state754 = or i1 %polly.overflow.state751, %.obit753
  %.res755 = extractvalue { i64, i1 } %6, 0
  %7 = tail call { i64, i1 } @llvm.sadd.with.overflow.i64(i64 %.res755, i64 -1)
  %.obit756 = extractvalue { i64, i1 } %7, 1
  %polly.overflow.state757 = or i1 %polly.overflow.state754, %.obit756
  %.res758 = extractvalue { i64, i1 } %7, 0
  %8 = icmp sge i64 %.res749, %.res758
  %9 = tail call { i64, i1 } @llvm.sadd.with.overflow.i64(i64 %start, i64 %end)
  %.obit759 = extractvalue { i64, i1 } %9, 1
  %10 = icmp slt i64 %add1, 0
  %11 = and i1 %10, %8
  %polly.overflow.state769 = or i1 %.obit759, %polly.overflow.state757
  %12 = tail call { i64, i1 } @llvm.sadd.with.overflow.i64(i64 %.res755, i64 2)
  %.obit771 = extractvalue { i64, i1 } %12, 1
  %.res773 = extractvalue { i64, i1 } %12, 0
  %13 = icmp sle i64 %.res773, %end
  %polly.overflow.state775 = or i1 %.obit771, %polly.overflow.state769
  %polly.overflow.state778 = or i1 %.obit750, %polly.overflow.state775
  %polly.overflow.state781 = or i1 %.obit753, %polly.overflow.state778
  %14 = tail call { i64, i1 } @llvm.sadd.with.overflow.i64(i64 %.res755, i64 1)
  %.obit783 = extractvalue { i64, i1 } %14, 1
  %polly.overflow.state784 = or i1 %.obit783, %polly.overflow.state781
  %15 = or i1 %13, %11
  %polly.overflow.state787 = or i1 %.obit744, %polly.overflow.state784
  %polly.overflow.state790 = or i1 %.obit747, %polly.overflow.state787
  %polly.overflow.state793 = or i1 %.obit750, %polly.overflow.state790
  %polly.overflow.state796 = or i1 %.obit753, %polly.overflow.state793
  %16 = sext i64 %.res755 to i66
  %17 = tail call { i66, i1 } @llvm.sadd.with.overflow.i66(i66 %16, i66 18446744073709551616)
  %.obit798 = extractvalue { i66, i1 } %17, 1
  %polly.overflow.state799 = or i1 %.obit798, %polly.overflow.state796
  %.res800 = extractvalue { i66, i1 } %17, 0
  %18 = sext i64 %.res749 to i66
  %19 = icmp sge i66 %18, %.res800
  %20 = icmp sgt i64 %add1, -1
  %21 = and i1 %20, %19
  %22 = or i1 %15, %21
  %23 = icmp slt i64 %i.0.lcssa, -1152921504606846976
  %polly.overflow.state808 = or i1 %.obit759, %polly.overflow.state799
  %24 = and i1 %23, %13
  %polly.overflow.state814 = or i1 %.obit771, %polly.overflow.state808
  %25 = and i1 %20, %24
  %26 = or i1 %25, %22
  %polly.overflow.state817 = or i1 %.obit750, %polly.overflow.state814
  %polly.overflow.state820 = or i1 %.obit753, %polly.overflow.state817
  %polly.overflow.state823 = or i1 %.obit783, %polly.overflow.state820
  %.res824 = extractvalue { i64, i1 } %14, 0
  %27 = icmp sle i64 %.res824, %end
  %28 = and i1 %23, %27
  %29 = and i1 %10, %28
  %30 = or i1 %29, %26
  %31 = icmp slt i64 %l.0.lcssa, -1152921504606846976
  %polly.overflow.state832 = or i1 %.obit759, %polly.overflow.state823
  %32 = and i1 %31, %13
  %polly.overflow.state838 = or i1 %.obit771, %polly.overflow.state832
  %33 = and i1 %20, %32
  %34 = or i1 %33, %30
  %polly.overflow.state841 = or i1 %.obit750, %polly.overflow.state838
  %polly.overflow.state844 = or i1 %.obit753, %polly.overflow.state841
  %polly.overflow.state847 = or i1 %.obit783, %polly.overflow.state844
  %35 = and i1 %31, %27
  %36 = and i1 %10, %35
  %37 = or i1 %36, %34
  %38 = icmp sgt i64 %l.0.lcssa, 1152921504606846975
  %polly.overflow.state856 = or i1 %.obit759, %polly.overflow.state847
  %39 = and i1 %38, %13
  %polly.overflow.state862 = or i1 %.obit771, %polly.overflow.state856
  %40 = and i1 %20, %39
  %41 = or i1 %40, %37
  %polly.overflow.state865 = or i1 %.obit750, %polly.overflow.state862
  %polly.overflow.state868 = or i1 %.obit753, %polly.overflow.state865
  %polly.overflow.state871 = or i1 %.obit783, %polly.overflow.state868
  %42 = and i1 %38, %27
  %43 = and i1 %10, %42
  %44 = or i1 %43, %41
  %45 = icmp sgt i64 %i.0.lcssa, 1152921504606846975
  %polly.overflow.state880 = or i1 %.obit759, %polly.overflow.state871
  %46 = and i1 %45, %13
  %polly.overflow.state886 = or i1 %.obit771, %polly.overflow.state880
  %47 = and i1 %20, %46
  %48 = or i1 %47, %44
  %polly.overflow.state889 = or i1 %.obit750, %polly.overflow.state886
  %polly.overflow.state892 = or i1 %.obit753, %polly.overflow.state889
  %polly.overflow.state895 = or i1 %.obit783, %polly.overflow.state892
  %49 = and i1 %45, %27
  %polly.overflow.state898 = or i1 %.obit759, %polly.overflow.state895
  %50 = and i1 %10, %49
  %51 = or i1 %50, %48
  %52 = icmp eq i64 %l.0.lcssa, -9223372036854775808
  %53 = or i1 %52, %51
  %54 = icmp eq i64 %start, -9223372036854775808
  %55 = tail call { i64, i1 } @llvm.sadd.with.overflow.i64(i64 %end, i64 9223372036854775807)
  %.obit900 = extractvalue { i64, i1 } %55, 1
  %polly.overflow.state901 = or i1 %.obit900, %polly.overflow.state898
  %.res902 = extractvalue { i64, i1 } %55, 0
  %polly.overflow.state904 = or i1 %.obit750, %polly.overflow.state901
  %56 = icmp sge i64 %.res902, %.res752
  %57 = and i1 %54, %56
  %58 = or i1 %57, %53
  %59 = xor i1 %58, true
  %polly.overflow.state910 = or i1 %.obit753, %polly.overflow.state904
  %polly.overflow.state913 = or i1 %.obit771, %polly.overflow.state910
  %polly.overflow.state916 = or i1 %.obit759, %polly.overflow.state913
  %60 = and i1 %20, %13
  %61 = tail call { i64, i1 } @llvm.ssub.with.overflow.i64(i64 0, i64 %start)
  %.obit918 = extractvalue { i64, i1 } %61, 1
  %polly.overflow.state919 = or i1 %.obit918, %polly.overflow.state916
  %pexp.p_div_q924 = lshr i64 %add1, 1
  %62 = tail call { i64, i1 } @llvm.sadd.with.overflow.i64(i64 %0, i64 %pexp.p_div_q924)
  %.obit925 = extractvalue { i64, i1 } %62, 1
  %polly.overflow.state926 = or i1 %.obit925, %polly.overflow.state919
  %.res927 = extractvalue { i64, i1 } %62, 0
  %63 = tail call { i64, i1 } @llvm.ssub.with.overflow.i64(i64 %0, i64 %end)
  %.obit934 = extractvalue { i64, i1 } %63, 1
  %polly.overflow.state935 = or i1 %.obit934, %polly.overflow.state926
  %.res936 = extractvalue { i64, i1 } %63, 0
  %pexp.p_div_q937 = lshr i64 %.res936, 1
  %64 = tail call { i64, i1 } @llvm.ssub.with.overflow.i64(i64 %0, i64 %pexp.p_div_q937)
  %.obit938 = extractvalue { i64, i1 } %64, 1
  %polly.overflow.state939 = or i1 %.obit938, %polly.overflow.state935
  %.res940 = extractvalue { i64, i1 } %64, 0
  %65 = select i1 %60, i64 %.res927, i64 %.res940
  %polly.access.call13 = getelementptr i64, i64* %call13, i64 %65
  %polly.access.items941 = getelementptr i64, i64* %items, i64 %i.0.lcssa
  %66 = icmp ule i64* %polly.access.call13, %polly.access.items941
  %polly.overflow.state943 = or i1 %.obit750, %polly.overflow.state939
  %polly.overflow.state946 = or i1 %.obit753, %polly.overflow.state943
  %polly.overflow.state949 = or i1 %.obit771, %polly.overflow.state946
  %polly.overflow.state952 = or i1 %.obit759, %polly.overflow.state949
  %67 = tail call { i64, i1 } @llvm.ssub.with.overflow.i64(i64 %i.0.lcssa, i64 %start)
  %.obit954 = extractvalue { i64, i1 } %67, 1
  %polly.overflow.state955 = or i1 %.obit954, %polly.overflow.state952
  %.res956 = extractvalue { i64, i1 } %67, 0
  %68 = tail call { i64, i1 } @llvm.ssub.with.overflow.i64(i64 %.res956, i64 %l.0.lcssa)
  %.obit957 = extractvalue { i64, i1 } %68, 1
  %polly.overflow.state958 = or i1 %.obit957, %polly.overflow.state955
  %.res959 = extractvalue { i64, i1 } %68, 0
  %69 = tail call { i64, i1 } @llvm.sadd.with.overflow.i64(i64 %.res959, i64 %pexp.p_div_q924)
  %.obit964 = extractvalue { i64, i1 } %69, 1
  %polly.overflow.state965 = or i1 %.obit964, %polly.overflow.state958
  %.res966 = extractvalue { i64, i1 } %69, 0
  %polly.overflow.state974 = or i1 %.obit918, %polly.overflow.state965
  %polly.overflow.state977 = or i1 %.obit934, %polly.overflow.state974
  %70 = tail call { i64, i1 } @llvm.ssub.with.overflow.i64(i64 %.res959, i64 %pexp.p_div_q937)
  %.obit980 = extractvalue { i64, i1 } %70, 1
  %polly.overflow.state981 = or i1 %.obit980, %polly.overflow.state977
  %.res982 = extractvalue { i64, i1 } %70, 0
  %71 = select i1 %60, i64 %.res966, i64 %.res982
  %polly.access.items983 = getelementptr i64, i64* %items, i64 %71
  %polly.access.call13984 = getelementptr i64, i64* %call13, i64 %l.0.lcssa
  %72 = icmp ule i64* %polly.access.items983, %polly.access.call13984
  %73 = or i1 %66, %72
  %74 = and i1 %73, %59
  %polly.rtc.overflown985 = xor i1 %polly.overflow.state981, true
  %polly.rtc.result986 = and i1 %74, %polly.rtc.overflown985
  br i1 %polly.rtc.result986, label %polly.cond987, label %if.end72.preheader

if.end72.preheader:                               ; preds = %if.end72.lr.ph
  %75 = sub i64 %div, %l.0.lcssa
  %76 = sub i64 %75, %start
  %min.iters.check = icmp ult i64 %76, 4
  br i1 %min.iters.check, label %if.end72.preheader1085, label %min.iters.checked

if.end72.preheader1085:                           ; preds = %middle.block, %vector.memcheck, %min.iters.checked, %if.end72.preheader
  %i.1256.ph = phi i64 [ %i.0.lcssa, %vector.memcheck ], [ %i.0.lcssa, %min.iters.checked ], [ %i.0.lcssa, %if.end72.preheader ], [ %ind.end, %middle.block ]
  %l.2255.ph = phi i64 [ %l.0.lcssa, %vector.memcheck ], [ %l.0.lcssa, %min.iters.checked ], [ %l.0.lcssa, %if.end72.preheader ], [ %ind.end1045, %middle.block ]
  %77 = add i64 %i.0.lcssa, %div
  %78 = sub i64 %77, %i.1256.ph
  %79 = sub i64 %78, %l.0.lcssa
  %80 = sub i64 %79, %start
  %81 = add i64 %77, -1
  %82 = sub i64 %81, %i.1256.ph
  %83 = sub i64 %82, %l.0.lcssa
  %84 = sub i64 %83, %start
  %xtraiter1090 = and i64 %80, 3
  %85 = icmp ult i64 %84, 3
  br i1 %85, label %while.cond77.preheader.loopexit.unr-lcssa, label %if.end72.preheader1085.new

if.end72.preheader1085.new:                       ; preds = %if.end72.preheader1085
  %unroll_iter1093 = sub i64 %80, %xtraiter1090
  br label %if.end72

min.iters.checked:                                ; preds = %if.end72.preheader
  %n.vec = and i64 %76, -4
  %cmp.zero = icmp eq i64 %n.vec, 0
  br i1 %cmp.zero, label %if.end72.preheader1085, label %vector.memcheck

vector.memcheck:                                  ; preds = %min.iters.checked
  %scevgep = getelementptr i64, i64* %items, i64 %i.0.lcssa
  %86 = add i64 %i.0.lcssa, %div
  %87 = add i64 %86, -1
  %88 = add i64 %l.0.lcssa, %start
  %89 = sub i64 %87, %88
  %scevgep1038 = getelementptr i64, i64* %items, i64 %89
  %scevgep1040 = getelementptr i64, i64* %call13, i64 %l.0.lcssa
  %90 = add nsw i64 %div, -1
  %91 = sub i64 %90, %start
  %scevgep1042 = getelementptr i64, i64* %call13, i64 %91
  %bound0 = icmp ule i64* %scevgep, %scevgep1042
  %bound1 = icmp ule i64* %scevgep1040, %scevgep1038
  %memcheck.conflict = and i1 %bound0, %bound1
  %ind.end = add i64 %i.0.lcssa, %n.vec
  %ind.end1045 = add i64 %l.0.lcssa, %n.vec
  br i1 %memcheck.conflict, label %if.end72.preheader1085, label %vector.body.preheader

vector.body.preheader:                            ; preds = %vector.memcheck
  %92 = add i64 %n.vec, -4
  %93 = lshr exact i64 %92, 2
  %94 = add nuw nsw i64 %93, 1
  %xtraiter1095 = and i64 %94, 1
  %95 = icmp eq i64 %93, 0
  br i1 %95, label %middle.block.unr-lcssa, label %vector.body.preheader.new

vector.body.preheader.new:                        ; preds = %vector.body.preheader
  %unroll_iter1097 = sub nsw i64 %94, %xtraiter1095
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.body.preheader.new
  %index = phi i64 [ 0, %vector.body.preheader.new ], [ %index.next.1, %vector.body ]
  %niter1098 = phi i64 [ %unroll_iter1097, %vector.body.preheader.new ], [ %niter1098.nsub.1, %vector.body ]
  %96 = add i64 %i.0.lcssa, %index
  %97 = add i64 %l.0.lcssa, %index
  %98 = getelementptr inbounds i64, i64* %call13, i64 %97
  %99 = bitcast i64* %98 to <2 x i64>*
  %wide.load = load <2 x i64>, <2 x i64>* %99, align 8, !tbaa !1, !alias.scope !5
  %100 = getelementptr i64, i64* %98, i64 2
  %101 = bitcast i64* %100 to <2 x i64>*
  %wide.load1047 = load <2 x i64>, <2 x i64>* %101, align 8, !tbaa !1, !alias.scope !5
  %102 = getelementptr inbounds i64, i64* %items, i64 %96
  %103 = bitcast i64* %102 to <2 x i64>*
  store <2 x i64> %wide.load, <2 x i64>* %103, align 8, !tbaa !1, !alias.scope !8, !noalias !5
  %104 = getelementptr i64, i64* %102, i64 2
  %105 = bitcast i64* %104 to <2 x i64>*
  store <2 x i64> %wide.load1047, <2 x i64>* %105, align 8, !tbaa !1, !alias.scope !8, !noalias !5
  %index.next = or i64 %index, 4
  %106 = add i64 %i.0.lcssa, %index.next
  %107 = add i64 %l.0.lcssa, %index.next
  %108 = getelementptr inbounds i64, i64* %call13, i64 %107
  %109 = bitcast i64* %108 to <2 x i64>*
  %wide.load.1 = load <2 x i64>, <2 x i64>* %109, align 8, !tbaa !1, !alias.scope !5
  %110 = getelementptr i64, i64* %108, i64 2
  %111 = bitcast i64* %110 to <2 x i64>*
  %wide.load1047.1 = load <2 x i64>, <2 x i64>* %111, align 8, !tbaa !1, !alias.scope !5
  %112 = getelementptr inbounds i64, i64* %items, i64 %106
  %113 = bitcast i64* %112 to <2 x i64>*
  store <2 x i64> %wide.load.1, <2 x i64>* %113, align 8, !tbaa !1, !alias.scope !8, !noalias !5
  %114 = getelementptr i64, i64* %112, i64 2
  %115 = bitcast i64* %114 to <2 x i64>*
  store <2 x i64> %wide.load1047.1, <2 x i64>* %115, align 8, !tbaa !1, !alias.scope !8, !noalias !5
  %index.next.1 = add i64 %index, 8
  %niter1098.nsub.1 = add i64 %niter1098, -2
  %niter1098.ncmp.1 = icmp eq i64 %niter1098.nsub.1, 0
  br i1 %niter1098.ncmp.1, label %middle.block.unr-lcssa.loopexit, label %vector.body, !llvm.loop !10

middle.block.unr-lcssa.loopexit:                  ; preds = %vector.body
  br label %middle.block.unr-lcssa

middle.block.unr-lcssa:                           ; preds = %middle.block.unr-lcssa.loopexit, %vector.body.preheader
  %index.unr = phi i64 [ 0, %vector.body.preheader ], [ %index.next.1, %middle.block.unr-lcssa.loopexit ]
  %lcmp.mod1096 = icmp eq i64 %xtraiter1095, 0
  br i1 %lcmp.mod1096, label %middle.block, label %vector.body.epil.preheader

vector.body.epil.preheader:                       ; preds = %middle.block.unr-lcssa
  br label %vector.body.epil

vector.body.epil:                                 ; preds = %vector.body.epil.preheader
  %116 = add i64 %i.0.lcssa, %index.unr
  %117 = add i64 %l.0.lcssa, %index.unr
  %118 = getelementptr inbounds i64, i64* %call13, i64 %117
  %119 = bitcast i64* %118 to <2 x i64>*
  %wide.load.epil = load <2 x i64>, <2 x i64>* %119, align 8, !tbaa !1, !alias.scope !5
  %120 = getelementptr i64, i64* %118, i64 2
  %121 = bitcast i64* %120 to <2 x i64>*
  %wide.load1047.epil = load <2 x i64>, <2 x i64>* %121, align 8, !tbaa !1, !alias.scope !5
  %122 = getelementptr inbounds i64, i64* %items, i64 %116
  %123 = bitcast i64* %122 to <2 x i64>*
  store <2 x i64> %wide.load.epil, <2 x i64>* %123, align 8, !tbaa !1, !alias.scope !8, !noalias !5
  %124 = getelementptr i64, i64* %122, i64 2
  %125 = bitcast i64* %124 to <2 x i64>*
  store <2 x i64> %wide.load1047.epil, <2 x i64>* %125, align 8, !tbaa !1, !alias.scope !8, !noalias !5
  br label %middle.block.epilog-lcssa

middle.block.epilog-lcssa:                        ; preds = %vector.body.epil
  br label %middle.block

middle.block:                                     ; preds = %middle.block.unr-lcssa, %middle.block.epilog-lcssa
  %cmp.n = icmp eq i64 %76, %n.vec
  br i1 %cmp.n, label %while.cond77.preheader, label %if.end72.preheader1085

if.end55:                                         ; preds = %if.end55.preheader, %blklab4
  %i.0264 = phi i64 [ %add66, %blklab4 ], [ 0, %if.end55.preheader ]
  %r.0263 = phi i64 [ %r.1, %blklab4 ], [ 0, %if.end55.preheader ]
  %l.0262 = phi i64 [ %l.1, %blklab4 ], [ 0, %if.end55.preheader ]
  %arrayidx = getelementptr inbounds i64, i64* %call13, i64 %l.0262
  %126 = load i64, i64* %arrayidx, align 8, !tbaa !1
  %arrayidx56 = getelementptr inbounds i64, i64* %call36, i64 %r.0263
  %127 = load i64, i64* %arrayidx56, align 8, !tbaa !1
  %cmp57 = icmp sgt i64 %126, %127
  %arrayidx64 = getelementptr inbounds i64, i64* %items, i64 %i.0264
  br i1 %cmp57, label %blklab3, label %if.end59

if.end59:                                         ; preds = %if.end55
  store i64 %126, i64* %arrayidx64, align 8, !tbaa !1
  %add62 = add nsw i64 %l.0262, 1
  br label %blklab4

blklab3:                                          ; preds = %if.end55
  store i64 %127, i64* %arrayidx64, align 8, !tbaa !1
  %add65 = add nsw i64 %r.0263, 1
  br label %blklab4

blklab4:                                          ; preds = %blklab3, %if.end59
  %l.1 = phi i64 [ %l.0262, %blklab3 ], [ %add62, %if.end59 ]
  %r.1 = phi i64 [ %add65, %blklab3 ], [ %r.0263, %if.end59 ]
  %add66 = add nuw nsw i64 %i.0264, 1
  %cmp45 = icmp slt i64 %add66, %sub44
  %cmp49 = icmp slt i64 %l.1, %sub
  %or.cond = and i1 %cmp45, %cmp49
  %cmp53 = icmp slt i64 %r.1, %sub25
  %or.cond250 = and i1 %cmp53, %or.cond
  br i1 %or.cond250, label %if.end55, label %while.cond67.preheader.loopexit

while.cond77.preheader.loopexit.unr-lcssa.loopexit: ; preds = %if.end72
  br label %while.cond77.preheader.loopexit.unr-lcssa

while.cond77.preheader.loopexit.unr-lcssa:        ; preds = %while.cond77.preheader.loopexit.unr-lcssa.loopexit, %if.end72.preheader1085
  %i.1256.unr = phi i64 [ %i.1256.ph, %if.end72.preheader1085 ], [ %add75.3, %while.cond77.preheader.loopexit.unr-lcssa.loopexit ]
  %l.2255.unr = phi i64 [ %l.2255.ph, %if.end72.preheader1085 ], [ %add76.3, %while.cond77.preheader.loopexit.unr-lcssa.loopexit ]
  %lcmp.mod1092 = icmp eq i64 %xtraiter1090, 0
  br i1 %lcmp.mod1092, label %while.cond77.preheader.loopexit, label %if.end72.epil.preheader

if.end72.epil.preheader:                          ; preds = %while.cond77.preheader.loopexit.unr-lcssa
  br label %if.end72.epil

if.end72.epil:                                    ; preds = %if.end72.epil, %if.end72.epil.preheader
  %i.1256.epil = phi i64 [ %add75.epil, %if.end72.epil ], [ %i.1256.unr, %if.end72.epil.preheader ]
  %l.2255.epil = phi i64 [ %add76.epil, %if.end72.epil ], [ %l.2255.unr, %if.end72.epil.preheader ]
  %epil.iter1091 = phi i64 [ %epil.iter1091.sub, %if.end72.epil ], [ %xtraiter1090, %if.end72.epil.preheader ]
  %arrayidx73.epil = getelementptr inbounds i64, i64* %call13, i64 %l.2255.epil
  %128 = load i64, i64* %arrayidx73.epil, align 8, !tbaa !1
  %arrayidx74.epil = getelementptr inbounds i64, i64* %items, i64 %i.1256.epil
  store i64 %128, i64* %arrayidx74.epil, align 8, !tbaa !1
  %add75.epil = add nsw i64 %i.1256.epil, 1
  %add76.epil = add nsw i64 %l.2255.epil, 1
  %epil.iter1091.sub = add i64 %epil.iter1091, -1
  %epil.iter1091.cmp = icmp eq i64 %epil.iter1091.sub, 0
  br i1 %epil.iter1091.cmp, label %while.cond77.preheader.loopexit.epilog-lcssa, label %if.end72.epil, !llvm.loop !13

while.cond77.preheader.loopexit.epilog-lcssa:     ; preds = %if.end72.epil
  br label %while.cond77.preheader.loopexit

while.cond77.preheader.loopexit:                  ; preds = %while.cond77.preheader.loopexit.unr-lcssa, %while.cond77.preheader.loopexit.epilog-lcssa
  br label %while.cond77.preheader

while.cond77.preheader:                           ; preds = %while.cond77.preheader.loopexit, %middle.block, %sortV1_polly_subfn_3.exit, %sortV1_polly_subfn_2.exit, %while.cond67.preheader
  %i.1.lcssa.ph = phi i64 [ %i.0.lcssa, %while.cond67.preheader ], [ %2, %sortV1_polly_subfn_2.exit ], [ %2, %sortV1_polly_subfn_3.exit ], [ %2, %middle.block ], [ %2, %while.cond77.preheader.loopexit ]
  %cmp80251 = icmp slt i64 %r.0.lcssa, %sub25
  br i1 %cmp80251, label %if.end82.preheader, label %if.then91

if.end82.preheader:                               ; preds = %while.cond77.preheader
  %129 = sub i64 %end, %r.0.lcssa
  %130 = sub i64 %129, %div
  %min.iters.check1051 = icmp ult i64 %130, 4
  br i1 %min.iters.check1051, label %if.end82.preheader1084, label %min.iters.checked1052

if.end82.preheader1084:                           ; preds = %middle.block1049, %vector.memcheck1069, %min.iters.checked1052, %if.end82.preheader
  %i.2253.ph = phi i64 [ %i.1.lcssa.ph, %vector.memcheck1069 ], [ %i.1.lcssa.ph, %min.iters.checked1052 ], [ %i.1.lcssa.ph, %if.end82.preheader ], [ %ind.end1074, %middle.block1049 ]
  %r.2252.ph = phi i64 [ %r.0.lcssa, %vector.memcheck1069 ], [ %r.0.lcssa, %min.iters.checked1052 ], [ %r.0.lcssa, %if.end82.preheader ], [ %ind.end1076, %middle.block1049 ]
  %131 = sub i64 %end, %r.2252.ph
  %132 = sub i64 %131, %div
  %133 = add i64 %end, -1
  %134 = sub i64 %133, %r.2252.ph
  %135 = sub i64 %134, %div
  %xtraiter = and i64 %132, 3
  %136 = icmp ult i64 %135, 3
  br i1 %136, label %if.then91.loopexit.unr-lcssa, label %if.end82.preheader1084.new

if.end82.preheader1084.new:                       ; preds = %if.end82.preheader1084
  %unroll_iter = sub i64 %132, %xtraiter
  br label %if.end82

min.iters.checked1052:                            ; preds = %if.end82.preheader
  %n.vec1054 = and i64 %130, -4
  %cmp.zero1055 = icmp eq i64 %n.vec1054, 0
  br i1 %cmp.zero1055, label %if.end82.preheader1084, label %vector.memcheck1069

vector.memcheck1069:                              ; preds = %min.iters.checked1052
  %scevgep1057 = getelementptr i64, i64* %items, i64 %i.1.lcssa.ph
  %137 = add i64 %i.1.lcssa.ph, %end
  %138 = add i64 %137, -1
  %139 = add i64 %r.0.lcssa, %div
  %140 = sub i64 %138, %139
  %scevgep1059 = getelementptr i64, i64* %items, i64 %140
  %scevgep1061 = getelementptr i64, i64* %call36, i64 %r.0.lcssa
  %141 = add i64 %end, -1
  %142 = sub i64 %141, %div
  %scevgep1063 = getelementptr i64, i64* %call36, i64 %142
  %bound01065 = icmp ule i64* %scevgep1057, %scevgep1063
  %bound11066 = icmp ule i64* %scevgep1061, %scevgep1059
  %memcheck.conflict1068 = and i1 %bound01065, %bound11066
  %ind.end1074 = add i64 %i.1.lcssa.ph, %n.vec1054
  %ind.end1076 = add i64 %r.0.lcssa, %n.vec1054
  br i1 %memcheck.conflict1068, label %if.end82.preheader1084, label %vector.body1048.preheader

vector.body1048.preheader:                        ; preds = %vector.memcheck1069
  %143 = add i64 %n.vec1054, -4
  %144 = lshr exact i64 %143, 2
  %145 = add nuw nsw i64 %144, 1
  %xtraiter1086 = and i64 %145, 1
  %146 = icmp eq i64 %144, 0
  br i1 %146, label %middle.block1049.unr-lcssa, label %vector.body1048.preheader.new

vector.body1048.preheader.new:                    ; preds = %vector.body1048.preheader
  %unroll_iter1088 = sub nsw i64 %145, %xtraiter1086
  br label %vector.body1048

vector.body1048:                                  ; preds = %vector.body1048, %vector.body1048.preheader.new
  %index1071 = phi i64 [ 0, %vector.body1048.preheader.new ], [ %index.next1072.1, %vector.body1048 ]
  %niter1089 = phi i64 [ %unroll_iter1088, %vector.body1048.preheader.new ], [ %niter1089.nsub.1, %vector.body1048 ]
  %147 = add i64 %i.1.lcssa.ph, %index1071
  %148 = add i64 %r.0.lcssa, %index1071
  %149 = getelementptr inbounds i64, i64* %call36, i64 %148
  %150 = bitcast i64* %149 to <2 x i64>*
  %wide.load1080 = load <2 x i64>, <2 x i64>* %150, align 8, !tbaa !1, !alias.scope !15
  %151 = getelementptr i64, i64* %149, i64 2
  %152 = bitcast i64* %151 to <2 x i64>*
  %wide.load1081 = load <2 x i64>, <2 x i64>* %152, align 8, !tbaa !1, !alias.scope !15
  %153 = getelementptr inbounds i64, i64* %items, i64 %147
  %154 = bitcast i64* %153 to <2 x i64>*
  store <2 x i64> %wide.load1080, <2 x i64>* %154, align 8, !tbaa !1, !alias.scope !18, !noalias !15
  %155 = getelementptr i64, i64* %153, i64 2
  %156 = bitcast i64* %155 to <2 x i64>*
  store <2 x i64> %wide.load1081, <2 x i64>* %156, align 8, !tbaa !1, !alias.scope !18, !noalias !15
  %index.next1072 = or i64 %index1071, 4
  %157 = add i64 %i.1.lcssa.ph, %index.next1072
  %158 = add i64 %r.0.lcssa, %index.next1072
  %159 = getelementptr inbounds i64, i64* %call36, i64 %158
  %160 = bitcast i64* %159 to <2 x i64>*
  %wide.load1080.1 = load <2 x i64>, <2 x i64>* %160, align 8, !tbaa !1, !alias.scope !15
  %161 = getelementptr i64, i64* %159, i64 2
  %162 = bitcast i64* %161 to <2 x i64>*
  %wide.load1081.1 = load <2 x i64>, <2 x i64>* %162, align 8, !tbaa !1, !alias.scope !15
  %163 = getelementptr inbounds i64, i64* %items, i64 %157
  %164 = bitcast i64* %163 to <2 x i64>*
  store <2 x i64> %wide.load1080.1, <2 x i64>* %164, align 8, !tbaa !1, !alias.scope !18, !noalias !15
  %165 = getelementptr i64, i64* %163, i64 2
  %166 = bitcast i64* %165 to <2 x i64>*
  store <2 x i64> %wide.load1081.1, <2 x i64>* %166, align 8, !tbaa !1, !alias.scope !18, !noalias !15
  %index.next1072.1 = add i64 %index1071, 8
  %niter1089.nsub.1 = add i64 %niter1089, -2
  %niter1089.ncmp.1 = icmp eq i64 %niter1089.nsub.1, 0
  br i1 %niter1089.ncmp.1, label %middle.block1049.unr-lcssa.loopexit, label %vector.body1048, !llvm.loop !20

middle.block1049.unr-lcssa.loopexit:              ; preds = %vector.body1048
  br label %middle.block1049.unr-lcssa

middle.block1049.unr-lcssa:                       ; preds = %middle.block1049.unr-lcssa.loopexit, %vector.body1048.preheader
  %index1071.unr = phi i64 [ 0, %vector.body1048.preheader ], [ %index.next1072.1, %middle.block1049.unr-lcssa.loopexit ]
  %lcmp.mod1087 = icmp eq i64 %xtraiter1086, 0
  br i1 %lcmp.mod1087, label %middle.block1049, label %vector.body1048.epil.preheader

vector.body1048.epil.preheader:                   ; preds = %middle.block1049.unr-lcssa
  br label %vector.body1048.epil

vector.body1048.epil:                             ; preds = %vector.body1048.epil.preheader
  %167 = add i64 %i.1.lcssa.ph, %index1071.unr
  %168 = add i64 %r.0.lcssa, %index1071.unr
  %169 = getelementptr inbounds i64, i64* %call36, i64 %168
  %170 = bitcast i64* %169 to <2 x i64>*
  %wide.load1080.epil = load <2 x i64>, <2 x i64>* %170, align 8, !tbaa !1, !alias.scope !15
  %171 = getelementptr i64, i64* %169, i64 2
  %172 = bitcast i64* %171 to <2 x i64>*
  %wide.load1081.epil = load <2 x i64>, <2 x i64>* %172, align 8, !tbaa !1, !alias.scope !15
  %173 = getelementptr inbounds i64, i64* %items, i64 %167
  %174 = bitcast i64* %173 to <2 x i64>*
  store <2 x i64> %wide.load1080.epil, <2 x i64>* %174, align 8, !tbaa !1, !alias.scope !18, !noalias !15
  %175 = getelementptr i64, i64* %173, i64 2
  %176 = bitcast i64* %175 to <2 x i64>*
  store <2 x i64> %wide.load1081.epil, <2 x i64>* %176, align 8, !tbaa !1, !alias.scope !18, !noalias !15
  br label %middle.block1049.epilog-lcssa

middle.block1049.epilog-lcssa:                    ; preds = %vector.body1048.epil
  br label %middle.block1049

middle.block1049:                                 ; preds = %middle.block1049.unr-lcssa, %middle.block1049.epilog-lcssa
  %cmp.n1077 = icmp eq i64 %130, %n.vec1054
  br i1 %cmp.n1077, label %if.then91, label %if.end82.preheader1084

if.end72:                                         ; preds = %if.end72, %if.end72.preheader1085.new
  %i.1256 = phi i64 [ %i.1256.ph, %if.end72.preheader1085.new ], [ %add75.3, %if.end72 ]
  %l.2255 = phi i64 [ %l.2255.ph, %if.end72.preheader1085.new ], [ %add76.3, %if.end72 ]
  %niter1094 = phi i64 [ %unroll_iter1093, %if.end72.preheader1085.new ], [ %niter1094.nsub.3, %if.end72 ]
  %arrayidx73 = getelementptr inbounds i64, i64* %call13, i64 %l.2255
  %177 = load i64, i64* %arrayidx73, align 8, !tbaa !1
  %arrayidx74 = getelementptr inbounds i64, i64* %items, i64 %i.1256
  store i64 %177, i64* %arrayidx74, align 8, !tbaa !1
  %add75 = add nsw i64 %i.1256, 1
  %add76 = add nsw i64 %l.2255, 1
  %arrayidx73.1 = getelementptr inbounds i64, i64* %call13, i64 %add76
  %178 = load i64, i64* %arrayidx73.1, align 8, !tbaa !1
  %arrayidx74.1 = getelementptr inbounds i64, i64* %items, i64 %add75
  store i64 %178, i64* %arrayidx74.1, align 8, !tbaa !1
  %add75.1 = add nsw i64 %i.1256, 2
  %add76.1 = add nsw i64 %l.2255, 2
  %arrayidx73.2 = getelementptr inbounds i64, i64* %call13, i64 %add76.1
  %179 = load i64, i64* %arrayidx73.2, align 8, !tbaa !1
  %arrayidx74.2 = getelementptr inbounds i64, i64* %items, i64 %add75.1
  store i64 %179, i64* %arrayidx74.2, align 8, !tbaa !1
  %add75.2 = add nsw i64 %i.1256, 3
  %add76.2 = add nsw i64 %l.2255, 3
  %arrayidx73.3 = getelementptr inbounds i64, i64* %call13, i64 %add76.2
  %180 = load i64, i64* %arrayidx73.3, align 8, !tbaa !1
  %arrayidx74.3 = getelementptr inbounds i64, i64* %items, i64 %add75.2
  store i64 %180, i64* %arrayidx74.3, align 8, !tbaa !1
  %add75.3 = add nsw i64 %i.1256, 4
  %add76.3 = add nsw i64 %l.2255, 4
  %niter1094.nsub.3 = add i64 %niter1094, -4
  %niter1094.ncmp.3 = icmp eq i64 %niter1094.nsub.3, 0
  br i1 %niter1094.ncmp.3, label %while.cond77.preheader.loopexit.unr-lcssa.loopexit, label %if.end72, !llvm.loop !21

if.end82:                                         ; preds = %if.end82, %if.end82.preheader1084.new
  %i.2253 = phi i64 [ %i.2253.ph, %if.end82.preheader1084.new ], [ %add85.3, %if.end82 ]
  %r.2252 = phi i64 [ %r.2252.ph, %if.end82.preheader1084.new ], [ %add86.3, %if.end82 ]
  %niter = phi i64 [ %unroll_iter, %if.end82.preheader1084.new ], [ %niter.nsub.3, %if.end82 ]
  %arrayidx83 = getelementptr inbounds i64, i64* %call36, i64 %r.2252
  %181 = load i64, i64* %arrayidx83, align 8, !tbaa !1
  %arrayidx84 = getelementptr inbounds i64, i64* %items, i64 %i.2253
  store i64 %181, i64* %arrayidx84, align 8, !tbaa !1
  %add85 = add nsw i64 %i.2253, 1
  %add86 = add nsw i64 %r.2252, 1
  %arrayidx83.1 = getelementptr inbounds i64, i64* %call36, i64 %add86
  %182 = load i64, i64* %arrayidx83.1, align 8, !tbaa !1
  %arrayidx84.1 = getelementptr inbounds i64, i64* %items, i64 %add85
  store i64 %182, i64* %arrayidx84.1, align 8, !tbaa !1
  %add85.1 = add nsw i64 %i.2253, 2
  %add86.1 = add nsw i64 %r.2252, 2
  %arrayidx83.2 = getelementptr inbounds i64, i64* %call36, i64 %add86.1
  %183 = load i64, i64* %arrayidx83.2, align 8, !tbaa !1
  %arrayidx84.2 = getelementptr inbounds i64, i64* %items, i64 %add85.1
  store i64 %183, i64* %arrayidx84.2, align 8, !tbaa !1
  %add85.2 = add nsw i64 %i.2253, 3
  %add86.2 = add nsw i64 %r.2252, 3
  %arrayidx83.3 = getelementptr inbounds i64, i64* %call36, i64 %add86.2
  %184 = load i64, i64* %arrayidx83.3, align 8, !tbaa !1
  %arrayidx84.3 = getelementptr inbounds i64, i64* %items, i64 %add85.2
  store i64 %184, i64* %arrayidx84.3, align 8, !tbaa !1
  %add85.3 = add nsw i64 %i.2253, 4
  %add86.3 = add nsw i64 %r.2252, 4
  %niter.nsub.3 = add i64 %niter, -4
  %niter.ncmp.3 = icmp eq i64 %niter.nsub.3, 0
  br i1 %niter.ncmp.3, label %if.then91.loopexit.unr-lcssa.loopexit, label %if.end82, !llvm.loop !22

if.then91.loopexit.unr-lcssa.loopexit:            ; preds = %if.end82
  br label %if.then91.loopexit.unr-lcssa

if.then91.loopexit.unr-lcssa:                     ; preds = %if.then91.loopexit.unr-lcssa.loopexit, %if.end82.preheader1084
  %i.2253.unr = phi i64 [ %i.2253.ph, %if.end82.preheader1084 ], [ %add85.3, %if.then91.loopexit.unr-lcssa.loopexit ]
  %r.2252.unr = phi i64 [ %r.2252.ph, %if.end82.preheader1084 ], [ %add86.3, %if.then91.loopexit.unr-lcssa.loopexit ]
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod, label %if.then91.loopexit, label %if.end82.epil.preheader

if.end82.epil.preheader:                          ; preds = %if.then91.loopexit.unr-lcssa
  br label %if.end82.epil

if.end82.epil:                                    ; preds = %if.end82.epil, %if.end82.epil.preheader
  %i.2253.epil = phi i64 [ %add85.epil, %if.end82.epil ], [ %i.2253.unr, %if.end82.epil.preheader ]
  %r.2252.epil = phi i64 [ %add86.epil, %if.end82.epil ], [ %r.2252.unr, %if.end82.epil.preheader ]
  %epil.iter = phi i64 [ %epil.iter.sub, %if.end82.epil ], [ %xtraiter, %if.end82.epil.preheader ]
  %arrayidx83.epil = getelementptr inbounds i64, i64* %call36, i64 %r.2252.epil
  %185 = load i64, i64* %arrayidx83.epil, align 8, !tbaa !1
  %arrayidx84.epil = getelementptr inbounds i64, i64* %items, i64 %i.2253.epil
  store i64 %185, i64* %arrayidx84.epil, align 8, !tbaa !1
  %add85.epil = add nsw i64 %i.2253.epil, 1
  %add86.epil = add nsw i64 %r.2252.epil, 1
  %epil.iter.sub = add i64 %epil.iter, -1
  %epil.iter.cmp = icmp eq i64 %epil.iter.sub, 0
  br i1 %epil.iter.cmp, label %if.then91.loopexit.epilog-lcssa, label %if.end82.epil, !llvm.loop !23

if.then91.loopexit.epilog-lcssa:                  ; preds = %if.end82.epil
  br label %if.then91.loopexit

if.then91.loopexit:                               ; preds = %if.then91.loopexit.unr-lcssa, %if.then91.loopexit.epilog-lcssa
  br label %if.then91

if.then91:                                        ; preds = %if.then91.loopexit, %middle.block1049, %while.cond77.preheader
  tail call void @free(i8* %phitmp) #8
  tail call void @free(i8* %phitmp268) #8
  br label %if.end107

if.end107:                                        ; preds = %entry, %if.then91
  ret i64* %items

polly.cond987:                                    ; preds = %if.end72.lr.ph
  %186 = sub nsw i64 %0, %l.0.lcssa
  br i1 %10, label %polly.parallel.for991, label %polly.parallel.for1001

polly.parallel.for991:                            ; preds = %polly.cond987
  %187 = sub nsw i64 %186, %pexp.p_div_q937
  %188 = bitcast { i64, i64, i64, i64, i64*, i64*, i64 }* %polly.par.userContext993 to i8*
  call void @llvm.lifetime.start(i64 56, i8* %188)
  %polly.subfn.storeaddr.i.0.lcssa994 = getelementptr inbounds { i64, i64, i64, i64, i64*, i64*, i64 }, { i64, i64, i64, i64, i64*, i64*, i64 }* %polly.par.userContext993, i64 0, i32 0
  store i64 %i.0.lcssa, i64* %polly.subfn.storeaddr.i.0.lcssa994, align 8
  %polly.subfn.storeaddr.start995 = getelementptr inbounds { i64, i64, i64, i64, i64*, i64*, i64 }, { i64, i64, i64, i64, i64*, i64*, i64 }* %polly.par.userContext993, i64 0, i32 1
  store i64 %start, i64* %polly.subfn.storeaddr.start995, align 8
  %polly.subfn.storeaddr.l.0.lcssa996 = getelementptr inbounds { i64, i64, i64, i64, i64*, i64*, i64 }, { i64, i64, i64, i64, i64*, i64*, i64 }* %polly.par.userContext993, i64 0, i32 2
  store i64 %l.0.lcssa, i64* %polly.subfn.storeaddr.l.0.lcssa996, align 8
  %polly.subfn.storeaddr.end997 = getelementptr inbounds { i64, i64, i64, i64, i64*, i64*, i64 }, { i64, i64, i64, i64, i64*, i64*, i64 }* %polly.par.userContext993, i64 0, i32 3
  store i64 %end, i64* %polly.subfn.storeaddr.end997, align 8
  %polly.subfn.storeaddr.call13 = getelementptr inbounds { i64, i64, i64, i64, i64*, i64*, i64 }, { i64, i64, i64, i64, i64*, i64*, i64 }* %polly.par.userContext993, i64 0, i32 4
  store i64* %call13, i64** %polly.subfn.storeaddr.call13, align 8
  %polly.subfn.storeaddr.items998 = getelementptr inbounds { i64, i64, i64, i64, i64*, i64*, i64 }, { i64, i64, i64, i64, i64*, i64*, i64 }* %polly.par.userContext993, i64 0, i32 5
  store i64* %items, i64** %polly.subfn.storeaddr.items998, align 8
  %polly.subfn.storeaddr.div999 = getelementptr inbounds { i64, i64, i64, i64, i64*, i64*, i64 }, { i64, i64, i64, i64, i64*, i64*, i64 }* %polly.par.userContext993, i64 0, i32 6
  store i64 %div, i64* %polly.subfn.storeaddr.div999, align 8
  call void @GOMP_parallel_loop_runtime_start(void (i8*)* nonnull @sortV1_polly_subfn_2, i8* %188, i32 0, i64 0, i64 %187, i64 1) #8
  %189 = bitcast i64* %polly.par.LBPtr.i1012 to i8*
  call void @llvm.lifetime.start(i64 8, i8* %189)
  %190 = bitcast i64* %polly.par.UBPtr.i1013 to i8*
  call void @llvm.lifetime.start(i64 8, i8* %190)
  %polly.subfunc.arg.i.0.lcssa.i1014 = load i64, i64* %polly.subfn.storeaddr.i.0.lcssa994, align 8
  %polly.subfunc.arg.l.0.lcssa.i1015 = load i64, i64* %polly.subfn.storeaddr.l.0.lcssa996, align 8
  %polly.subfunc.arg.call13.i1016 = load i64*, i64** %polly.subfn.storeaddr.call13, align 8
  %polly.subfunc.arg.items.i1017 = load i64*, i64** %polly.subfn.storeaddr.items998, align 8
  %191 = call i8 @GOMP_loop_runtime_next(i64* nonnull %polly.par.LBPtr.i1012, i64* nonnull %polly.par.UBPtr.i1013) #8
  %192 = icmp eq i8 %191, 0
  br i1 %192, label %sortV1_polly_subfn_2.exit, label %polly.par.loadIVBounds.preheader.i1020

polly.par.loadIVBounds.preheader.i1020:           ; preds = %polly.parallel.for991
  %scevgep.i1018 = getelementptr i64, i64* %polly.subfunc.arg.call13.i1016, i64 %polly.subfunc.arg.l.0.lcssa.i1015
  %scevgep3.i1019 = getelementptr i64, i64* %polly.subfunc.arg.items.i1017, i64 %polly.subfunc.arg.i.0.lcssa.i1014
  br label %polly.par.loadIVBounds.i1025

polly.par.checkNext.loopexit.i1021:               ; preds = %polly.loop_header.i1032
  %193 = call i8 @GOMP_loop_runtime_next(i64* nonnull %polly.par.LBPtr.i1012, i64* nonnull %polly.par.UBPtr.i1013) #8
  %194 = icmp eq i8 %193, 0
  br i1 %194, label %sortV1_polly_subfn_2.exit.loopexit, label %polly.par.loadIVBounds.i1025

polly.par.loadIVBounds.i1025:                     ; preds = %polly.par.checkNext.loopexit.i1021, %polly.par.loadIVBounds.preheader.i1020
  %polly.par.UB.i1022 = load i64, i64* %polly.par.UBPtr.i1013, align 8
  %polly.par.LB.i1023 = load i64, i64* %polly.par.LBPtr.i1012, align 8
  %polly.adjust_ub.i1024 = add i64 %polly.par.UB.i1022, -2
  br label %polly.loop_header.i1032

polly.loop_header.i1032:                          ; preds = %polly.loop_header.i1032, %polly.par.loadIVBounds.i1025
  %polly.indvar.i1026 = phi i64 [ %polly.par.LB.i1023, %polly.par.loadIVBounds.i1025 ], [ %polly.indvar_next.i1030, %polly.loop_header.i1032 ]
  %scevgep2.i1027 = getelementptr i64, i64* %scevgep.i1018, i64 %polly.indvar.i1026
  %_p_scalar_.i1028 = load i64, i64* %scevgep2.i1027, align 8, !alias.scope !24, !noalias !26
  %scevgep4.i1029 = getelementptr i64, i64* %scevgep3.i1019, i64 %polly.indvar.i1026
  store i64 %_p_scalar_.i1028, i64* %scevgep4.i1029, align 8, !alias.scope !27, !noalias !28
  %polly.indvar_next.i1030 = add nsw i64 %polly.indvar.i1026, 1
  %polly.loop_cond.i1031 = icmp sgt i64 %polly.indvar.i1026, %polly.adjust_ub.i1024
  br i1 %polly.loop_cond.i1031, label %polly.par.checkNext.loopexit.i1021, label %polly.loop_header.i1032

sortV1_polly_subfn_2.exit.loopexit:               ; preds = %polly.par.checkNext.loopexit.i1021
  br label %sortV1_polly_subfn_2.exit

sortV1_polly_subfn_2.exit:                        ; preds = %sortV1_polly_subfn_2.exit.loopexit, %polly.parallel.for991
  call void @GOMP_loop_end_nowait() #8
  call void @llvm.lifetime.end(i64 8, i8* %189)
  call void @llvm.lifetime.end(i64 8, i8* %190)
  call void @GOMP_parallel_end() #8
  call void @llvm.lifetime.end(i64 8, i8* %188)
  br label %while.cond77.preheader

polly.parallel.for1001:                           ; preds = %polly.cond987
  %195 = bitcast { i64, i64, i64, i64, i64*, i64*, i64 }* %polly.par.userContext1003 to i8*
  call void @llvm.lifetime.start(i64 56, i8* %195)
  %polly.subfn.storeaddr.i.0.lcssa1004 = getelementptr inbounds { i64, i64, i64, i64, i64*, i64*, i64 }, { i64, i64, i64, i64, i64*, i64*, i64 }* %polly.par.userContext1003, i64 0, i32 0
  store i64 %i.0.lcssa, i64* %polly.subfn.storeaddr.i.0.lcssa1004, align 8
  %polly.subfn.storeaddr.start1005 = getelementptr inbounds { i64, i64, i64, i64, i64*, i64*, i64 }, { i64, i64, i64, i64, i64*, i64*, i64 }* %polly.par.userContext1003, i64 0, i32 1
  store i64 %start, i64* %polly.subfn.storeaddr.start1005, align 8
  %polly.subfn.storeaddr.l.0.lcssa1006 = getelementptr inbounds { i64, i64, i64, i64, i64*, i64*, i64 }, { i64, i64, i64, i64, i64*, i64*, i64 }* %polly.par.userContext1003, i64 0, i32 2
  store i64 %l.0.lcssa, i64* %polly.subfn.storeaddr.l.0.lcssa1006, align 8
  %polly.subfn.storeaddr.end1007 = getelementptr inbounds { i64, i64, i64, i64, i64*, i64*, i64 }, { i64, i64, i64, i64, i64*, i64*, i64 }* %polly.par.userContext1003, i64 0, i32 3
  store i64 %end, i64* %polly.subfn.storeaddr.end1007, align 8
  %polly.subfn.storeaddr.call131008 = getelementptr inbounds { i64, i64, i64, i64, i64*, i64*, i64 }, { i64, i64, i64, i64, i64*, i64*, i64 }* %polly.par.userContext1003, i64 0, i32 4
  store i64* %call13, i64** %polly.subfn.storeaddr.call131008, align 8
  %polly.subfn.storeaddr.items1009 = getelementptr inbounds { i64, i64, i64, i64, i64*, i64*, i64 }, { i64, i64, i64, i64, i64*, i64*, i64 }* %polly.par.userContext1003, i64 0, i32 5
  store i64* %items, i64** %polly.subfn.storeaddr.items1009, align 8
  %polly.subfn.storeaddr.div1010 = getelementptr inbounds { i64, i64, i64, i64, i64*, i64*, i64 }, { i64, i64, i64, i64, i64*, i64*, i64 }* %polly.par.userContext1003, i64 0, i32 6
  store i64 %div, i64* %polly.subfn.storeaddr.div1010, align 8
  %196 = add i64 %186, %pexp.p_div_q924
  call void @GOMP_parallel_loop_runtime_start(void (i8*)* nonnull @sortV1_polly_subfn_3, i8* %195, i32 0, i64 0, i64 %196, i64 1) #8
  %197 = bitcast i64* %polly.par.LBPtr.i to i8*
  call void @llvm.lifetime.start(i64 8, i8* %197)
  %198 = bitcast i64* %polly.par.UBPtr.i to i8*
  call void @llvm.lifetime.start(i64 8, i8* %198)
  %polly.subfunc.arg.i.0.lcssa.i = load i64, i64* %polly.subfn.storeaddr.i.0.lcssa1004, align 8
  %polly.subfunc.arg.l.0.lcssa.i = load i64, i64* %polly.subfn.storeaddr.l.0.lcssa1006, align 8
  %polly.subfunc.arg.call13.i = load i64*, i64** %polly.subfn.storeaddr.call131008, align 8
  %polly.subfunc.arg.items.i = load i64*, i64** %polly.subfn.storeaddr.items1009, align 8
  %199 = call i8 @GOMP_loop_runtime_next(i64* nonnull %polly.par.LBPtr.i, i64* nonnull %polly.par.UBPtr.i) #8
  %200 = icmp eq i8 %199, 0
  br i1 %200, label %sortV1_polly_subfn_3.exit, label %polly.par.loadIVBounds.preheader.i

polly.par.loadIVBounds.preheader.i:               ; preds = %polly.parallel.for1001
  %scevgep.i = getelementptr i64, i64* %polly.subfunc.arg.call13.i, i64 %polly.subfunc.arg.l.0.lcssa.i
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

sortV1_polly_subfn_3.exit:                        ; preds = %sortV1_polly_subfn_3.exit.loopexit, %polly.parallel.for1001
  call void @GOMP_loop_end_nowait() #8
  call void @llvm.lifetime.end(i64 8, i8* %197)
  call void @llvm.lifetime.end(i64 8, i8* %198)
  call void @GOMP_parallel_end() #8
  call void @llvm.lifetime.end(i64 8, i8* %195)
  br label %while.cond77.preheader
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
  br i1 %cmp, label %if.end95.critedge, label %if.end8

if.end8:                                          ; preds = %entry
  %1 = load i64, i64* %call1, align 8, !tbaa !1
  %conv13 = trunc i64 %1 to i32
  %call14 = tail call i64* @create1DArray(i32 0, i32 %conv13) #8
  %cmp20164 = icmp sgt i64 %1, 0
  br i1 %cmp20164, label %polly.parallel.for, label %if.then76

if.then76:                                        ; preds = %if.end8, %main_polly_subfn.exit
  %call30 = tail call i64* @sortV1(i64* %call14, i64 %1, i1 zeroext undef, i64 0, i64 %1)
  %2 = load i64, i64* %call30, align 8, !tbaa !1
  %call39 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str, i64 0, i64 0), i64 %2)
  %sub40 = add nsw i64 %1, -1
  %arrayidx41 = getelementptr inbounds i64, i64* %call30, i64 %sub40
  %3 = load i64, i64* %arrayidx41, align 8, !tbaa !1
  %call42 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str, i64 0, i64 0), i64 %3)
  %call47 = tail call i64* @create1DArray(i32 0, i32 24) #8
  %4 = bitcast i64* %call47 to <2 x i64>*
  store <2 x i64> <i64 80, i64 97>, <2 x i64>* %4, align 8, !tbaa !1
  %arrayidx50 = getelementptr inbounds i64, i64* %call47, i64 2
  %5 = bitcast i64* %arrayidx50 to <2 x i64>*
  store <2 x i64> <i64 115, i64 115>, <2 x i64>* %5, align 8, !tbaa !1
  %arrayidx52 = getelementptr inbounds i64, i64* %call47, i64 4
  %6 = bitcast i64* %arrayidx52 to <2 x i64>*
  store <2 x i64> <i64 32, i64 77>, <2 x i64>* %6, align 8, !tbaa !1
  %arrayidx54 = getelementptr inbounds i64, i64* %call47, i64 6
  %7 = bitcast i64* %arrayidx54 to <2 x i64>*
  store <2 x i64> <i64 101, i64 114>, <2 x i64>* %7, align 8, !tbaa !1
  %arrayidx56 = getelementptr inbounds i64, i64* %call47, i64 8
  %8 = bitcast i64* %arrayidx56 to <2 x i64>*
  store <2 x i64> <i64 103, i64 101>, <2 x i64>* %8, align 8, !tbaa !1
  %arrayidx58 = getelementptr inbounds i64, i64* %call47, i64 10
  %9 = bitcast i64* %arrayidx58 to <2 x i64>*
  store <2 x i64> <i64 115, i64 111>, <2 x i64>* %9, align 8, !tbaa !1
  %arrayidx60 = getelementptr inbounds i64, i64* %call47, i64 12
  %10 = bitcast i64* %arrayidx60 to <2 x i64>*
  store <2 x i64> <i64 114, i64 116>, <2 x i64>* %10, align 8, !tbaa !1
  %arrayidx62 = getelementptr inbounds i64, i64* %call47, i64 14
  %11 = bitcast i64* %arrayidx62 to <2 x i64>*
  store <2 x i64> <i64 32, i64 116>, <2 x i64>* %11, align 8, !tbaa !1
  %arrayidx64 = getelementptr inbounds i64, i64* %call47, i64 16
  %12 = bitcast i64* %arrayidx64 to <2 x i64>*
  store <2 x i64> <i64 101, i64 115>, <2 x i64>* %12, align 8, !tbaa !1
  %arrayidx66 = getelementptr inbounds i64, i64* %call47, i64 18
  %13 = bitcast i64* %arrayidx66 to <2 x i64>*
  store <2 x i64> <i64 116, i64 32>, <2 x i64>* %13, align 8, !tbaa !1
  %arrayidx68 = getelementptr inbounds i64, i64* %call47, i64 20
  %14 = bitcast i64* %arrayidx68 to <2 x i64>*
  store <2 x i64> <i64 99, i64 97>, <2 x i64>* %14, align 8, !tbaa !1
  %arrayidx70 = getelementptr inbounds i64, i64* %call47, i64 22
  %15 = bitcast i64* %arrayidx70 to <2 x i64>*
  store <2 x i64> <i64 115, i64 101>, <2 x i64>* %15, align 8, !tbaa !1
  tail call void @println_s(i64* %call47, i64 24) #8
  %phitmp = bitcast i64* %call47 to i8*
  %phitmp163 = bitcast i64* %call30 to i8*
  %16 = bitcast i64* %call1 to i8*
  tail call void @free(i8* %16) #8
  tail call void @free(i8* %phitmp163) #8
  tail call void @free2DArray(i64** %call, i64 %conv) #8
  tail call void @free(i8* %phitmp) #8
  br label %if.end95

if.end95.critedge:                                ; preds = %entry
  tail call void @free2DArray(i64** %call, i64 %conv) #8
  br label %if.end95

if.end95:                                         ; preds = %if.end95.critedge, %if.then76
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
  br label %if.then76
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
  %polly.subfunc.arg.call13 = load i64*, i64** %4, align 8
  %5 = getelementptr inbounds i8, i8* %polly.par.userContext, i64 40
  %6 = bitcast i8* %5 to i64**
  %polly.subfunc.arg.items = load i64*, i64** %6, align 8
  %7 = call i8 @GOMP_loop_runtime_next(i64* nonnull %polly.par.LBPtr, i64* nonnull %polly.par.UBPtr)
  %8 = icmp eq i8 %7, 0
  br i1 %8, label %polly.par.exit, label %polly.par.loadIVBounds.preheader

polly.par.loadIVBounds.preheader:                 ; preds = %polly.par.setup
  %scevgep = getelementptr i64, i64* %polly.subfunc.arg.call13, i64 %polly.subfunc.arg.l.0.lcssa
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
  %polly.subfunc.arg.call13 = load i64*, i64** %4, align 8
  %5 = getelementptr inbounds i8, i8* %polly.par.userContext, i64 40
  %6 = bitcast i8* %5 to i64**
  %polly.subfunc.arg.items = load i64*, i64** %6, align 8
  %7 = call i8 @GOMP_loop_runtime_next(i64* nonnull %polly.par.LBPtr, i64* nonnull %polly.par.UBPtr)
  %8 = icmp eq i8 %7, 0
  br i1 %8, label %polly.par.exit, label %polly.par.loadIVBounds.preheader

polly.par.loadIVBounds.preheader:                 ; preds = %polly.par.setup
  %scevgep = getelementptr i64, i64* %polly.subfunc.arg.call13, i64 %polly.subfunc.arg.l.0.lcssa
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
!24 = distinct !{!24, !25, !"polly.alias.scope.call13"}
!25 = distinct !{!25, !"polly.alias.scope.domain"}
!26 = !{!27}
!27 = distinct !{!27, !25, !"polly.alias.scope.items"}
!28 = !{!24}
!29 = distinct !{!29, !30, !"polly.alias.scope.call13"}
!30 = distinct !{!30, !"polly.alias.scope.domain"}
!31 = !{!32}
!32 = distinct !{!32, !30, !"polly.alias.scope.items"}
!33 = !{!29}
!34 = !{!35, !35, i64 0}
!35 = !{!"any pointer", !3, i64 0}
!36 = distinct !{!36, !37, !"polly.alias.scope.call14"}
!37 = distinct !{!37, !"polly.alias.scope.domain"}
!38 = !{}
!39 = distinct !{!39, !40, !"polly.alias.scope.call13"}
!40 = distinct !{!40, !"polly.alias.scope.domain"}
!41 = !{!42}
!42 = distinct !{!42, !40, !"polly.alias.scope.items"}
!43 = !{!39}
!44 = distinct !{!44, !45, !"polly.alias.scope.call14"}
!45 = distinct !{!45, !"polly.alias.scope.domain"}
