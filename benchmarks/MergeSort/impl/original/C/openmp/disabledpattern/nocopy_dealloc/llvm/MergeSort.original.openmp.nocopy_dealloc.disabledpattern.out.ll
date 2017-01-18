; ModuleID = 'MergeSort_original.c'
source_filename = "MergeSort_original.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [5 x i8] c"%ld\0A\00", align 1

; Function Attrs: nounwind uwtable
define i64* @_sortV1_(i64* returned %items, i64 %items_size, i1 zeroext %items_dealloc, i64 %start, i64 %end, i64* nocapture %_size_call_by_ref) local_unnamed_addr #0 {
entry:
  %0 = sub i64 0, %start
  %polly.par.LBPtr.i1032 = alloca i64, align 8
  %polly.par.UBPtr.i1033 = alloca i64, align 8
  %polly.par.LBPtr.i = alloca i64, align 8
  %polly.par.UBPtr.i = alloca i64, align 8
  %polly.par.userContext1023 = alloca { i64, i64, i64, i64, i64*, i64*, i64 }, align 8
  %polly.par.userContext1013 = alloca { i64, i64, i64, i64, i64*, i64*, i64 }, align 8
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
  br i1 %cmp, label %if.end, label %if.end132

if.end:                                           ; preds = %entry
  %add1 = add nsw i64 %end, %start
  %div = sdiv i64 %add1, 2
  %conv = trunc i64 %start to i32
  %conv4 = trunc i64 %div to i32
  %call = tail call i64* @slice(i64* %items, i64 %items_size, i32 %conv, i32 %conv4) #8
  %sub = sub i64 %div, %start
  %call17 = call i64* @_sortV1_(i64* %call, i64 %sub, i1 zeroext undef, i64 0, i64 %div, i64* nonnull %_16_size)
  %phitmp = bitcast i64* %call17 to i8*
  %cmp19 = icmp eq i64* %call17, null
  %conv33 = trunc i64 %end to i32
  %call34 = tail call i64* @slice(i64* %items, i64 %items_size, i32 %conv4, i32 %conv33) #8
  %sub35 = sub nsw i64 %end, %div
  %call50 = call i64* @_sortV1_(i64* %call34, i64 %sub35, i1 zeroext undef, i64 0, i64 %sub35, i64* nonnull %_19_size)
  %phitmp288 = bitcast i64* %call50 to i8*
  %not.cmp53 = icmp eq i64* %call50, null
  %sub63 = sub nsw i64 %end, %start
  %cmp64277 = icmp sgt i64 %sub63, 0
  %cmp69278 = icmp sgt i64 %sub, 0
  %or.cond279 = and i1 %cmp64277, %cmp69278
  %cmp74280 = icmp sgt i64 %sub35, 0
  %or.cond270281 = and i1 %cmp74280, %or.cond279
  br i1 %or.cond270281, label %if.end77.preheader, label %while.cond90.preheader

if.end77.preheader:                               ; preds = %if.end
  br label %if.end77

while.cond90.preheader.loopexit:                  ; preds = %blklab4
  br label %while.cond90.preheader

while.cond90.preheader:                           ; preds = %while.cond90.preheader.loopexit, %if.end
  %l.0.lcssa = phi i64 [ 0, %if.end ], [ %l.1, %while.cond90.preheader.loopexit ]
  %r.0.lcssa = phi i64 [ 0, %if.end ], [ %r.1, %while.cond90.preheader.loopexit ]
  %i.0.lcssa = phi i64 [ 0, %if.end ], [ %add89, %while.cond90.preheader.loopexit ]
  %cmp93274 = icmp sgt i64 %sub, %l.0.lcssa
  br i1 %cmp93274, label %if.end96.lr.ph, label %while.cond101.preheader

if.end96.lr.ph:                                   ; preds = %while.cond90.preheader
  %3 = sub i64 %sub, %l.0.lcssa
  %4 = add i64 %3, %i.0.lcssa
  %5 = tail call { i64, i1 } @llvm.smul.with.overflow.i64(i64 %i.0.lcssa, i64 2)
  %.obit764 = extractvalue { i64, i1 } %5, 1
  %.res766 = extractvalue { i64, i1 } %5, 0
  %6 = tail call { i64, i1 } @llvm.sadd.with.overflow.i64(i64 %.res766, i64 %end)
  %.obit767 = extractvalue { i64, i1 } %6, 1
  %polly.overflow.state768 = or i1 %.obit764, %.obit767
  %.res769 = extractvalue { i64, i1 } %6, 0
  %7 = tail call { i64, i1 } @llvm.smul.with.overflow.i64(i64 %l.0.lcssa, i64 2)
  %.obit770 = extractvalue { i64, i1 } %7, 1
  %polly.overflow.state771 = or i1 %.obit770, %polly.overflow.state768
  %.res772 = extractvalue { i64, i1 } %7, 0
  %8 = tail call { i64, i1 } @llvm.sadd.with.overflow.i64(i64 %start, i64 %.res772)
  %.obit773 = extractvalue { i64, i1 } %8, 1
  %polly.overflow.state774 = or i1 %.obit773, %polly.overflow.state771
  %.res775 = extractvalue { i64, i1 } %8, 0
  %9 = tail call { i64, i1 } @llvm.sadd.with.overflow.i64(i64 %.res775, i64 -1)
  %.obit776 = extractvalue { i64, i1 } %9, 1
  %polly.overflow.state777 = or i1 %.obit776, %polly.overflow.state774
  %.res778 = extractvalue { i64, i1 } %9, 0
  %10 = icmp sge i64 %.res769, %.res778
  %11 = tail call { i64, i1 } @llvm.sadd.with.overflow.i64(i64 %start, i64 %end)
  %.obit779 = extractvalue { i64, i1 } %11, 1
  %12 = icmp slt i64 %add1, 0
  %13 = and i1 %12, %10
  %polly.overflow.state789 = or i1 %.obit779, %polly.overflow.state777
  %14 = tail call { i64, i1 } @llvm.sadd.with.overflow.i64(i64 %.res775, i64 2)
  %.obit791 = extractvalue { i64, i1 } %14, 1
  %.res793 = extractvalue { i64, i1 } %14, 0
  %15 = icmp sle i64 %.res793, %end
  %polly.overflow.state795 = or i1 %.obit791, %polly.overflow.state789
  %polly.overflow.state798 = or i1 %.obit770, %polly.overflow.state795
  %polly.overflow.state801 = or i1 %.obit773, %polly.overflow.state798
  %16 = tail call { i64, i1 } @llvm.sadd.with.overflow.i64(i64 %.res775, i64 1)
  %.obit803 = extractvalue { i64, i1 } %16, 1
  %polly.overflow.state804 = or i1 %.obit803, %polly.overflow.state801
  %17 = or i1 %15, %13
  %polly.overflow.state807 = or i1 %.obit764, %polly.overflow.state804
  %polly.overflow.state810 = or i1 %.obit767, %polly.overflow.state807
  %polly.overflow.state813 = or i1 %.obit770, %polly.overflow.state810
  %polly.overflow.state816 = or i1 %.obit773, %polly.overflow.state813
  %18 = sext i64 %.res775 to i66
  %19 = tail call { i66, i1 } @llvm.sadd.with.overflow.i66(i66 %18, i66 18446744073709551616)
  %.obit818 = extractvalue { i66, i1 } %19, 1
  %polly.overflow.state819 = or i1 %.obit818, %polly.overflow.state816
  %.res820 = extractvalue { i66, i1 } %19, 0
  %20 = sext i64 %.res769 to i66
  %21 = icmp sge i66 %20, %.res820
  %22 = icmp sgt i64 %add1, -1
  %23 = and i1 %22, %21
  %24 = or i1 %17, %23
  %25 = icmp slt i64 %i.0.lcssa, -1152921504606846976
  %polly.overflow.state828 = or i1 %.obit779, %polly.overflow.state819
  %26 = and i1 %25, %15
  %polly.overflow.state834 = or i1 %.obit791, %polly.overflow.state828
  %27 = and i1 %22, %26
  %28 = or i1 %27, %24
  %polly.overflow.state837 = or i1 %.obit770, %polly.overflow.state834
  %polly.overflow.state840 = or i1 %.obit773, %polly.overflow.state837
  %polly.overflow.state843 = or i1 %.obit803, %polly.overflow.state840
  %.res844 = extractvalue { i64, i1 } %16, 0
  %29 = icmp sle i64 %.res844, %end
  %30 = and i1 %25, %29
  %31 = and i1 %12, %30
  %32 = or i1 %31, %28
  %33 = icmp slt i64 %l.0.lcssa, -1152921504606846976
  %polly.overflow.state852 = or i1 %.obit779, %polly.overflow.state843
  %34 = and i1 %33, %15
  %polly.overflow.state858 = or i1 %.obit791, %polly.overflow.state852
  %35 = and i1 %22, %34
  %36 = or i1 %35, %32
  %polly.overflow.state861 = or i1 %.obit770, %polly.overflow.state858
  %polly.overflow.state864 = or i1 %.obit773, %polly.overflow.state861
  %polly.overflow.state867 = or i1 %.obit803, %polly.overflow.state864
  %37 = and i1 %33, %29
  %38 = and i1 %12, %37
  %39 = or i1 %38, %36
  %40 = icmp sgt i64 %l.0.lcssa, 1152921504606846975
  %polly.overflow.state876 = or i1 %.obit779, %polly.overflow.state867
  %41 = and i1 %40, %15
  %polly.overflow.state882 = or i1 %.obit791, %polly.overflow.state876
  %42 = and i1 %22, %41
  %43 = or i1 %42, %39
  %polly.overflow.state885 = or i1 %.obit770, %polly.overflow.state882
  %polly.overflow.state888 = or i1 %.obit773, %polly.overflow.state885
  %polly.overflow.state891 = or i1 %.obit803, %polly.overflow.state888
  %44 = and i1 %40, %29
  %45 = and i1 %12, %44
  %46 = or i1 %45, %43
  %47 = icmp sgt i64 %i.0.lcssa, 1152921504606846975
  %polly.overflow.state900 = or i1 %.obit779, %polly.overflow.state891
  %48 = and i1 %47, %15
  %polly.overflow.state906 = or i1 %.obit791, %polly.overflow.state900
  %49 = and i1 %22, %48
  %50 = or i1 %49, %46
  %polly.overflow.state909 = or i1 %.obit770, %polly.overflow.state906
  %polly.overflow.state912 = or i1 %.obit773, %polly.overflow.state909
  %polly.overflow.state915 = or i1 %.obit803, %polly.overflow.state912
  %51 = and i1 %47, %29
  %polly.overflow.state918 = or i1 %.obit779, %polly.overflow.state915
  %52 = and i1 %12, %51
  %53 = or i1 %52, %50
  %54 = icmp eq i64 %l.0.lcssa, -9223372036854775808
  %55 = or i1 %54, %53
  %56 = icmp eq i64 %start, -9223372036854775808
  %57 = tail call { i64, i1 } @llvm.sadd.with.overflow.i64(i64 %end, i64 9223372036854775807)
  %.obit920 = extractvalue { i64, i1 } %57, 1
  %polly.overflow.state921 = or i1 %.obit920, %polly.overflow.state918
  %.res922 = extractvalue { i64, i1 } %57, 0
  %polly.overflow.state924 = or i1 %.obit770, %polly.overflow.state921
  %58 = icmp sge i64 %.res922, %.res772
  %59 = and i1 %56, %58
  %60 = or i1 %59, %55
  %61 = xor i1 %60, true
  %polly.overflow.state930 = or i1 %.obit773, %polly.overflow.state924
  %polly.overflow.state933 = or i1 %.obit791, %polly.overflow.state930
  %polly.overflow.state936 = or i1 %.obit779, %polly.overflow.state933
  %62 = and i1 %22, %15
  %63 = tail call { i64, i1 } @llvm.ssub.with.overflow.i64(i64 0, i64 %start)
  %.obit938 = extractvalue { i64, i1 } %63, 1
  %polly.overflow.state939 = or i1 %.obit938, %polly.overflow.state936
  %pexp.p_div_q944 = lshr i64 %add1, 1
  %64 = tail call { i64, i1 } @llvm.sadd.with.overflow.i64(i64 %0, i64 %pexp.p_div_q944)
  %.obit945 = extractvalue { i64, i1 } %64, 1
  %polly.overflow.state946 = or i1 %.obit945, %polly.overflow.state939
  %.res947 = extractvalue { i64, i1 } %64, 0
  %65 = tail call { i64, i1 } @llvm.ssub.with.overflow.i64(i64 %0, i64 %end)
  %.obit954 = extractvalue { i64, i1 } %65, 1
  %polly.overflow.state955 = or i1 %.obit954, %polly.overflow.state946
  %.res956 = extractvalue { i64, i1 } %65, 0
  %pexp.p_div_q957 = lshr i64 %.res956, 1
  %66 = tail call { i64, i1 } @llvm.ssub.with.overflow.i64(i64 %0, i64 %pexp.p_div_q957)
  %.obit958 = extractvalue { i64, i1 } %66, 1
  %polly.overflow.state959 = or i1 %.obit958, %polly.overflow.state955
  %.res960 = extractvalue { i64, i1 } %66, 0
  %67 = select i1 %62, i64 %.res947, i64 %.res960
  %polly.access.call171057 = getelementptr i64, i64* %call, i64 %67
  %polly.access.items961 = getelementptr i64, i64* %items, i64 %i.0.lcssa
  %68 = icmp ule i64* %polly.access.call171057, %polly.access.items961
  %polly.overflow.state963 = or i1 %.obit770, %polly.overflow.state959
  %polly.overflow.state966 = or i1 %.obit773, %polly.overflow.state963
  %polly.overflow.state969 = or i1 %.obit791, %polly.overflow.state966
  %polly.overflow.state972 = or i1 %.obit779, %polly.overflow.state969
  %69 = tail call { i64, i1 } @llvm.ssub.with.overflow.i64(i64 %i.0.lcssa, i64 %start)
  %.obit974 = extractvalue { i64, i1 } %69, 1
  %polly.overflow.state975 = or i1 %.obit974, %polly.overflow.state972
  %.res976 = extractvalue { i64, i1 } %69, 0
  %70 = tail call { i64, i1 } @llvm.ssub.with.overflow.i64(i64 %.res976, i64 %l.0.lcssa)
  %.obit977 = extractvalue { i64, i1 } %70, 1
  %polly.overflow.state978 = or i1 %.obit977, %polly.overflow.state975
  %.res979 = extractvalue { i64, i1 } %70, 0
  %71 = tail call { i64, i1 } @llvm.sadd.with.overflow.i64(i64 %.res979, i64 %pexp.p_div_q944)
  %.obit984 = extractvalue { i64, i1 } %71, 1
  %polly.overflow.state985 = or i1 %.obit984, %polly.overflow.state978
  %.res986 = extractvalue { i64, i1 } %71, 0
  %polly.overflow.state994 = or i1 %.obit938, %polly.overflow.state985
  %polly.overflow.state997 = or i1 %.obit954, %polly.overflow.state994
  %72 = tail call { i64, i1 } @llvm.ssub.with.overflow.i64(i64 %.res979, i64 %pexp.p_div_q957)
  %.obit1000 = extractvalue { i64, i1 } %72, 1
  %polly.overflow.state1001 = or i1 %.obit1000, %polly.overflow.state997
  %.res1002 = extractvalue { i64, i1 } %72, 0
  %73 = select i1 %62, i64 %.res986, i64 %.res1002
  %polly.access.items1003 = getelementptr i64, i64* %items, i64 %73
  %polly.access.call1710041058 = getelementptr i64, i64* %call, i64 %l.0.lcssa
  %74 = icmp ule i64* %polly.access.items1003, %polly.access.call1710041058
  %75 = or i1 %68, %74
  %76 = and i1 %75, %61
  %polly.rtc.overflown1005 = xor i1 %polly.overflow.state1001, true
  %polly.rtc.result1006 = and i1 %76, %polly.rtc.overflown1005
  br i1 %polly.rtc.result1006, label %polly.cond1007, label %if.end96.preheader

if.end96.preheader:                               ; preds = %if.end96.lr.ph
  %77 = sub i64 %div, %l.0.lcssa
  %78 = sub i64 %77, %start
  %min.iters.check = icmp ult i64 %78, 4
  br i1 %min.iters.check, label %if.end96.preheader1123, label %min.iters.checked

if.end96.preheader1123:                           ; preds = %middle.block, %vector.memcheck, %min.iters.checked, %if.end96.preheader
  %i.1276.ph = phi i64 [ %i.0.lcssa, %vector.memcheck ], [ %i.0.lcssa, %min.iters.checked ], [ %i.0.lcssa, %if.end96.preheader ], [ %ind.end, %middle.block ]
  %l.2275.ph = phi i64 [ %l.0.lcssa, %vector.memcheck ], [ %l.0.lcssa, %min.iters.checked ], [ %l.0.lcssa, %if.end96.preheader ], [ %ind.end1072, %middle.block ]
  %79 = add i64 %i.0.lcssa, %div
  %80 = sub i64 %79, %i.1276.ph
  %81 = sub i64 %80, %l.0.lcssa
  %82 = sub i64 %81, %start
  %83 = add i64 %79, -1
  %84 = sub i64 %83, %i.1276.ph
  %85 = sub i64 %84, %l.0.lcssa
  %86 = sub i64 %85, %start
  %xtraiter1126 = and i64 %82, 3
  %lcmp.mod1127 = icmp eq i64 %xtraiter1126, 0
  br i1 %lcmp.mod1127, label %if.end96.prol.loopexit, label %if.end96.prol.preheader

if.end96.prol.preheader:                          ; preds = %if.end96.preheader1123
  br label %if.end96.prol

if.end96.prol:                                    ; preds = %if.end96.prol, %if.end96.prol.preheader
  %i.1276.prol = phi i64 [ %add99.prol, %if.end96.prol ], [ %i.1276.ph, %if.end96.prol.preheader ]
  %l.2275.prol = phi i64 [ %add100.prol, %if.end96.prol ], [ %l.2275.ph, %if.end96.prol.preheader ]
  %prol.iter1128 = phi i64 [ %prol.iter1128.sub, %if.end96.prol ], [ %xtraiter1126, %if.end96.prol.preheader ]
  %arrayidx971059.prol = getelementptr inbounds i64, i64* %call, i64 %l.2275.prol
  %87 = load i64, i64* %arrayidx971059.prol, align 8, !tbaa !1
  %arrayidx98.prol = getelementptr inbounds i64, i64* %items, i64 %i.1276.prol
  store i64 %87, i64* %arrayidx98.prol, align 8, !tbaa !1
  %add99.prol = add nsw i64 %i.1276.prol, 1
  %add100.prol = add nsw i64 %l.2275.prol, 1
  %prol.iter1128.sub = add i64 %prol.iter1128, -1
  %prol.iter1128.cmp = icmp eq i64 %prol.iter1128.sub, 0
  br i1 %prol.iter1128.cmp, label %if.end96.prol.loopexit.unr-lcssa, label %if.end96.prol, !llvm.loop !5

if.end96.prol.loopexit.unr-lcssa:                 ; preds = %if.end96.prol
  br label %if.end96.prol.loopexit

if.end96.prol.loopexit:                           ; preds = %if.end96.preheader1123, %if.end96.prol.loopexit.unr-lcssa
  %i.1276.unr = phi i64 [ %i.1276.ph, %if.end96.preheader1123 ], [ %add99.prol, %if.end96.prol.loopexit.unr-lcssa ]
  %l.2275.unr = phi i64 [ %l.2275.ph, %if.end96.preheader1123 ], [ %add100.prol, %if.end96.prol.loopexit.unr-lcssa ]
  %88 = icmp ult i64 %86, 3
  br i1 %88, label %while.cond101.preheader.loopexit, label %if.end96.preheader1123.new

if.end96.preheader1123.new:                       ; preds = %if.end96.prol.loopexit
  br label %if.end96

min.iters.checked:                                ; preds = %if.end96.preheader
  %n.vec = and i64 %78, -4
  %cmp.zero = icmp eq i64 %n.vec, 0
  br i1 %cmp.zero, label %if.end96.preheader1123, label %vector.memcheck

vector.memcheck:                                  ; preds = %min.iters.checked
  %scevgep = getelementptr i64, i64* %items, i64 %i.0.lcssa
  %89 = add i64 %i.0.lcssa, %div
  %90 = add i64 %l.0.lcssa, %start
  %91 = sub i64 %89, %90
  %scevgep1065 = getelementptr i64, i64* %items, i64 %91
  %scevgep1067 = getelementptr i64, i64* %call, i64 %l.0.lcssa
  %scevgep1069 = getelementptr i64, i64* %call, i64 %sub
  %bound0 = icmp ult i64* %scevgep, %scevgep1069
  %bound1 = icmp ult i64* %scevgep1067, %scevgep1065
  %memcheck.conflict = and i1 %bound0, %bound1
  %ind.end = add i64 %i.0.lcssa, %n.vec
  %ind.end1072 = add i64 %l.0.lcssa, %n.vec
  br i1 %memcheck.conflict, label %if.end96.preheader1123, label %vector.body.preheader

vector.body.preheader:                            ; preds = %vector.memcheck
  %92 = add i64 %n.vec, -4
  %93 = lshr exact i64 %92, 2
  %94 = and i64 %93, 1
  %lcmp.mod1130 = icmp eq i64 %94, 0
  br i1 %lcmp.mod1130, label %vector.body.prol.preheader, label %vector.body.prol.loopexit

vector.body.prol.preheader:                       ; preds = %vector.body.preheader
  br label %vector.body.prol

vector.body.prol:                                 ; preds = %vector.body.prol.preheader
  %95 = getelementptr inbounds i64, i64* %call, i64 %l.0.lcssa
  %96 = bitcast i64* %95 to <2 x i64>*
  %wide.load.prol = load <2 x i64>, <2 x i64>* %96, align 8, !tbaa !1, !alias.scope !7
  %97 = getelementptr i64, i64* %95, i64 2
  %98 = bitcast i64* %97 to <2 x i64>*
  %wide.load1079.prol = load <2 x i64>, <2 x i64>* %98, align 8, !tbaa !1, !alias.scope !7
  %99 = getelementptr inbounds i64, i64* %items, i64 %i.0.lcssa
  %100 = bitcast i64* %99 to <2 x i64>*
  store <2 x i64> %wide.load.prol, <2 x i64>* %100, align 8, !tbaa !1, !alias.scope !10, !noalias !7
  %101 = getelementptr i64, i64* %99, i64 2
  %102 = bitcast i64* %101 to <2 x i64>*
  store <2 x i64> %wide.load1079.prol, <2 x i64>* %102, align 8, !tbaa !1, !alias.scope !10, !noalias !7
  br label %vector.body.prol.loopexit

vector.body.prol.loopexit:                        ; preds = %vector.body.prol, %vector.body.preheader
  %index.unr = phi i64 [ 0, %vector.body.preheader ], [ 4, %vector.body.prol ]
  %103 = icmp eq i64 %93, 0
  br i1 %103, label %middle.block, label %vector.body.preheader.new

vector.body.preheader.new:                        ; preds = %vector.body.prol.loopexit
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.body.preheader.new
  %index = phi i64 [ %index.unr, %vector.body.preheader.new ], [ %index.next.1, %vector.body ]
  %104 = add i64 %i.0.lcssa, %index
  %105 = add i64 %l.0.lcssa, %index
  %106 = getelementptr inbounds i64, i64* %call, i64 %105
  %107 = bitcast i64* %106 to <2 x i64>*
  %wide.load = load <2 x i64>, <2 x i64>* %107, align 8, !tbaa !1, !alias.scope !7
  %108 = getelementptr i64, i64* %106, i64 2
  %109 = bitcast i64* %108 to <2 x i64>*
  %wide.load1079 = load <2 x i64>, <2 x i64>* %109, align 8, !tbaa !1, !alias.scope !7
  %110 = getelementptr inbounds i64, i64* %items, i64 %104
  %111 = bitcast i64* %110 to <2 x i64>*
  store <2 x i64> %wide.load, <2 x i64>* %111, align 8, !tbaa !1, !alias.scope !10, !noalias !7
  %112 = getelementptr i64, i64* %110, i64 2
  %113 = bitcast i64* %112 to <2 x i64>*
  store <2 x i64> %wide.load1079, <2 x i64>* %113, align 8, !tbaa !1, !alias.scope !10, !noalias !7
  %index.next = add i64 %index, 4
  %114 = add i64 %i.0.lcssa, %index.next
  %115 = add i64 %l.0.lcssa, %index.next
  %116 = getelementptr inbounds i64, i64* %call, i64 %115
  %117 = bitcast i64* %116 to <2 x i64>*
  %wide.load.1 = load <2 x i64>, <2 x i64>* %117, align 8, !tbaa !1, !alias.scope !7
  %118 = getelementptr i64, i64* %116, i64 2
  %119 = bitcast i64* %118 to <2 x i64>*
  %wide.load1079.1 = load <2 x i64>, <2 x i64>* %119, align 8, !tbaa !1, !alias.scope !7
  %120 = getelementptr inbounds i64, i64* %items, i64 %114
  %121 = bitcast i64* %120 to <2 x i64>*
  store <2 x i64> %wide.load.1, <2 x i64>* %121, align 8, !tbaa !1, !alias.scope !10, !noalias !7
  %122 = getelementptr i64, i64* %120, i64 2
  %123 = bitcast i64* %122 to <2 x i64>*
  store <2 x i64> %wide.load1079.1, <2 x i64>* %123, align 8, !tbaa !1, !alias.scope !10, !noalias !7
  %index.next.1 = add i64 %index, 8
  %124 = icmp eq i64 %index.next.1, %n.vec
  br i1 %124, label %middle.block.unr-lcssa, label %vector.body, !llvm.loop !12

middle.block.unr-lcssa:                           ; preds = %vector.body
  br label %middle.block

middle.block:                                     ; preds = %vector.body.prol.loopexit, %middle.block.unr-lcssa
  %cmp.n = icmp eq i64 %78, %n.vec
  br i1 %cmp.n, label %while.cond101.preheader, label %if.end96.preheader1123

if.end77:                                         ; preds = %if.end77.preheader, %blklab4
  %i.0284 = phi i64 [ %add89, %blklab4 ], [ 0, %if.end77.preheader ]
  %r.0283 = phi i64 [ %r.1, %blklab4 ], [ 0, %if.end77.preheader ]
  %l.0282 = phi i64 [ %l.1, %blklab4 ], [ 0, %if.end77.preheader ]
  %arrayidx1060 = getelementptr inbounds i64, i64* %call, i64 %l.0282
  %125 = load i64, i64* %arrayidx1060, align 8, !tbaa !1
  %arrayidx781061 = getelementptr inbounds i64, i64* %call34, i64 %r.0283
  %126 = load i64, i64* %arrayidx781061, align 8, !tbaa !1
  %cmp79 = icmp sgt i64 %125, %126
  %arrayidx87 = getelementptr inbounds i64, i64* %items, i64 %i.0284
  br i1 %cmp79, label %blklab3, label %if.end82

if.end82:                                         ; preds = %if.end77
  store i64 %125, i64* %arrayidx87, align 8, !tbaa !1
  %add85 = add nsw i64 %l.0282, 1
  br label %blklab4

blklab3:                                          ; preds = %if.end77
  store i64 %126, i64* %arrayidx87, align 8, !tbaa !1
  %add88 = add nsw i64 %r.0283, 1
  br label %blklab4

blklab4:                                          ; preds = %blklab3, %if.end82
  %l.1 = phi i64 [ %l.0282, %blklab3 ], [ %add85, %if.end82 ]
  %r.1 = phi i64 [ %add88, %blklab3 ], [ %r.0283, %if.end82 ]
  %add89 = add nuw nsw i64 %i.0284, 1
  %cmp64 = icmp slt i64 %add89, %sub63
  %cmp69 = icmp slt i64 %l.1, %sub
  %or.cond = and i1 %cmp64, %cmp69
  %cmp74 = icmp slt i64 %r.1, %sub35
  %or.cond270 = and i1 %cmp74, %or.cond
  br i1 %or.cond270, label %if.end77, label %while.cond90.preheader.loopexit

while.cond101.preheader.loopexit.unr-lcssa:       ; preds = %if.end96
  br label %while.cond101.preheader.loopexit

while.cond101.preheader.loopexit:                 ; preds = %if.end96.prol.loopexit, %while.cond101.preheader.loopexit.unr-lcssa
  br label %while.cond101.preheader

while.cond101.preheader:                          ; preds = %while.cond101.preheader.loopexit, %middle.block, %_sortV1__polly_subfn_3.exit, %_sortV1__polly_subfn_2.exit, %while.cond90.preheader
  %i.1.lcssa.ph = phi i64 [ %i.0.lcssa, %while.cond90.preheader ], [ %4, %_sortV1__polly_subfn_2.exit ], [ %4, %_sortV1__polly_subfn_3.exit ], [ %4, %middle.block ], [ %4, %while.cond101.preheader.loopexit ]
  %cmp104271 = icmp slt i64 %r.0.lcssa, %sub35
  br i1 %cmp104271, label %if.end107.preheader, label %if.end114

if.end107.preheader:                              ; preds = %while.cond101.preheader
  %127 = sub i64 %end, %r.0.lcssa
  %128 = sub i64 %127, %div
  %min.iters.check1083 = icmp ult i64 %128, 4
  br i1 %min.iters.check1083, label %if.end107.preheader1122, label %min.iters.checked1084

if.end107.preheader1122:                          ; preds = %middle.block1081, %vector.memcheck1101, %min.iters.checked1084, %if.end107.preheader
  %i.2273.ph = phi i64 [ %i.1.lcssa.ph, %vector.memcheck1101 ], [ %i.1.lcssa.ph, %min.iters.checked1084 ], [ %i.1.lcssa.ph, %if.end107.preheader ], [ %ind.end1106, %middle.block1081 ]
  %r.2272.ph = phi i64 [ %r.0.lcssa, %vector.memcheck1101 ], [ %r.0.lcssa, %min.iters.checked1084 ], [ %r.0.lcssa, %if.end107.preheader ], [ %ind.end1108, %middle.block1081 ]
  %129 = sub i64 %end, %r.2272.ph
  %130 = sub i64 %129, %div
  %131 = add i64 %end, -1
  %132 = sub i64 %131, %r.2272.ph
  %133 = sub i64 %132, %div
  %xtraiter = and i64 %130, 3
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod, label %if.end107.prol.loopexit, label %if.end107.prol.preheader

if.end107.prol.preheader:                         ; preds = %if.end107.preheader1122
  br label %if.end107.prol

if.end107.prol:                                   ; preds = %if.end107.prol, %if.end107.prol.preheader
  %i.2273.prol = phi i64 [ %add110.prol, %if.end107.prol ], [ %i.2273.ph, %if.end107.prol.preheader ]
  %r.2272.prol = phi i64 [ %add111.prol, %if.end107.prol ], [ %r.2272.ph, %if.end107.prol.preheader ]
  %prol.iter = phi i64 [ %prol.iter.sub, %if.end107.prol ], [ %xtraiter, %if.end107.prol.preheader ]
  %arrayidx1081056.prol = getelementptr inbounds i64, i64* %call34, i64 %r.2272.prol
  %134 = load i64, i64* %arrayidx1081056.prol, align 8, !tbaa !1
  %arrayidx109.prol = getelementptr inbounds i64, i64* %items, i64 %i.2273.prol
  store i64 %134, i64* %arrayidx109.prol, align 8, !tbaa !1
  %add110.prol = add nsw i64 %i.2273.prol, 1
  %add111.prol = add nsw i64 %r.2272.prol, 1
  %prol.iter.sub = add i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %if.end107.prol.loopexit.unr-lcssa, label %if.end107.prol, !llvm.loop !15

if.end107.prol.loopexit.unr-lcssa:                ; preds = %if.end107.prol
  br label %if.end107.prol.loopexit

if.end107.prol.loopexit:                          ; preds = %if.end107.preheader1122, %if.end107.prol.loopexit.unr-lcssa
  %i.2273.unr = phi i64 [ %i.2273.ph, %if.end107.preheader1122 ], [ %add110.prol, %if.end107.prol.loopexit.unr-lcssa ]
  %r.2272.unr = phi i64 [ %r.2272.ph, %if.end107.preheader1122 ], [ %add111.prol, %if.end107.prol.loopexit.unr-lcssa ]
  %135 = icmp ult i64 %133, 3
  br i1 %135, label %if.end114.loopexit, label %if.end107.preheader1122.new

if.end107.preheader1122.new:                      ; preds = %if.end107.prol.loopexit
  br label %if.end107

min.iters.checked1084:                            ; preds = %if.end107.preheader
  %n.vec1086 = and i64 %128, -4
  %cmp.zero1087 = icmp eq i64 %n.vec1086, 0
  br i1 %cmp.zero1087, label %if.end107.preheader1122, label %vector.memcheck1101

vector.memcheck1101:                              ; preds = %min.iters.checked1084
  %scevgep1089 = getelementptr i64, i64* %items, i64 %i.1.lcssa.ph
  %136 = add i64 %i.1.lcssa.ph, %end
  %137 = add i64 %r.0.lcssa, %div
  %138 = sub i64 %136, %137
  %scevgep1091 = getelementptr i64, i64* %items, i64 %138
  %scevgep1093 = getelementptr i64, i64* %call34, i64 %r.0.lcssa
  %scevgep1095 = getelementptr i64, i64* %call34, i64 %sub35
  %bound01097 = icmp ult i64* %scevgep1089, %scevgep1095
  %bound11098 = icmp ult i64* %scevgep1093, %scevgep1091
  %memcheck.conflict1100 = and i1 %bound01097, %bound11098
  %ind.end1106 = add i64 %i.1.lcssa.ph, %n.vec1086
  %ind.end1108 = add i64 %r.0.lcssa, %n.vec1086
  br i1 %memcheck.conflict1100, label %if.end107.preheader1122, label %vector.body1080.preheader

vector.body1080.preheader:                        ; preds = %vector.memcheck1101
  %139 = add i64 %n.vec1086, -4
  %140 = lshr exact i64 %139, 2
  %141 = and i64 %140, 1
  %lcmp.mod1125 = icmp eq i64 %141, 0
  br i1 %lcmp.mod1125, label %vector.body1080.prol.preheader, label %vector.body1080.prol.loopexit

vector.body1080.prol.preheader:                   ; preds = %vector.body1080.preheader
  br label %vector.body1080.prol

vector.body1080.prol:                             ; preds = %vector.body1080.prol.preheader
  %142 = getelementptr inbounds i64, i64* %call34, i64 %r.0.lcssa
  %143 = bitcast i64* %142 to <2 x i64>*
  %wide.load1120.prol = load <2 x i64>, <2 x i64>* %143, align 8, !tbaa !1, !alias.scope !16
  %144 = getelementptr i64, i64* %142, i64 2
  %145 = bitcast i64* %144 to <2 x i64>*
  %wide.load1121.prol = load <2 x i64>, <2 x i64>* %145, align 8, !tbaa !1, !alias.scope !16
  %146 = getelementptr inbounds i64, i64* %items, i64 %i.1.lcssa.ph
  %147 = bitcast i64* %146 to <2 x i64>*
  store <2 x i64> %wide.load1120.prol, <2 x i64>* %147, align 8, !tbaa !1, !alias.scope !19, !noalias !16
  %148 = getelementptr i64, i64* %146, i64 2
  %149 = bitcast i64* %148 to <2 x i64>*
  store <2 x i64> %wide.load1121.prol, <2 x i64>* %149, align 8, !tbaa !1, !alias.scope !19, !noalias !16
  br label %vector.body1080.prol.loopexit

vector.body1080.prol.loopexit:                    ; preds = %vector.body1080.prol, %vector.body1080.preheader
  %index1103.unr = phi i64 [ 0, %vector.body1080.preheader ], [ 4, %vector.body1080.prol ]
  %150 = icmp eq i64 %140, 0
  br i1 %150, label %middle.block1081, label %vector.body1080.preheader.new

vector.body1080.preheader.new:                    ; preds = %vector.body1080.prol.loopexit
  br label %vector.body1080

vector.body1080:                                  ; preds = %vector.body1080, %vector.body1080.preheader.new
  %index1103 = phi i64 [ %index1103.unr, %vector.body1080.preheader.new ], [ %index.next1104.1, %vector.body1080 ]
  %151 = add i64 %i.1.lcssa.ph, %index1103
  %152 = add i64 %r.0.lcssa, %index1103
  %153 = getelementptr inbounds i64, i64* %call34, i64 %152
  %154 = bitcast i64* %153 to <2 x i64>*
  %wide.load1120 = load <2 x i64>, <2 x i64>* %154, align 8, !tbaa !1, !alias.scope !16
  %155 = getelementptr i64, i64* %153, i64 2
  %156 = bitcast i64* %155 to <2 x i64>*
  %wide.load1121 = load <2 x i64>, <2 x i64>* %156, align 8, !tbaa !1, !alias.scope !16
  %157 = getelementptr inbounds i64, i64* %items, i64 %151
  %158 = bitcast i64* %157 to <2 x i64>*
  store <2 x i64> %wide.load1120, <2 x i64>* %158, align 8, !tbaa !1, !alias.scope !19, !noalias !16
  %159 = getelementptr i64, i64* %157, i64 2
  %160 = bitcast i64* %159 to <2 x i64>*
  store <2 x i64> %wide.load1121, <2 x i64>* %160, align 8, !tbaa !1, !alias.scope !19, !noalias !16
  %index.next1104 = add i64 %index1103, 4
  %161 = add i64 %i.1.lcssa.ph, %index.next1104
  %162 = add i64 %r.0.lcssa, %index.next1104
  %163 = getelementptr inbounds i64, i64* %call34, i64 %162
  %164 = bitcast i64* %163 to <2 x i64>*
  %wide.load1120.1 = load <2 x i64>, <2 x i64>* %164, align 8, !tbaa !1, !alias.scope !16
  %165 = getelementptr i64, i64* %163, i64 2
  %166 = bitcast i64* %165 to <2 x i64>*
  %wide.load1121.1 = load <2 x i64>, <2 x i64>* %166, align 8, !tbaa !1, !alias.scope !16
  %167 = getelementptr inbounds i64, i64* %items, i64 %161
  %168 = bitcast i64* %167 to <2 x i64>*
  store <2 x i64> %wide.load1120.1, <2 x i64>* %168, align 8, !tbaa !1, !alias.scope !19, !noalias !16
  %169 = getelementptr i64, i64* %167, i64 2
  %170 = bitcast i64* %169 to <2 x i64>*
  store <2 x i64> %wide.load1121.1, <2 x i64>* %170, align 8, !tbaa !1, !alias.scope !19, !noalias !16
  %index.next1104.1 = add i64 %index1103, 8
  %171 = icmp eq i64 %index.next1104.1, %n.vec1086
  br i1 %171, label %middle.block1081.unr-lcssa, label %vector.body1080, !llvm.loop !21

middle.block1081.unr-lcssa:                       ; preds = %vector.body1080
  br label %middle.block1081

middle.block1081:                                 ; preds = %vector.body1080.prol.loopexit, %middle.block1081.unr-lcssa
  %cmp.n1109 = icmp eq i64 %128, %n.vec1086
  br i1 %cmp.n1109, label %if.end114, label %if.end107.preheader1122

if.end96:                                         ; preds = %if.end96, %if.end96.preheader1123.new
  %i.1276 = phi i64 [ %i.1276.unr, %if.end96.preheader1123.new ], [ %add99.3, %if.end96 ]
  %l.2275 = phi i64 [ %l.2275.unr, %if.end96.preheader1123.new ], [ %add100.3, %if.end96 ]
  %arrayidx971059 = getelementptr inbounds i64, i64* %call, i64 %l.2275
  %172 = load i64, i64* %arrayidx971059, align 8, !tbaa !1
  %arrayidx98 = getelementptr inbounds i64, i64* %items, i64 %i.1276
  store i64 %172, i64* %arrayidx98, align 8, !tbaa !1
  %add99 = add nsw i64 %i.1276, 1
  %add100 = add nsw i64 %l.2275, 1
  %arrayidx971059.1 = getelementptr inbounds i64, i64* %call, i64 %add100
  %173 = load i64, i64* %arrayidx971059.1, align 8, !tbaa !1
  %arrayidx98.1 = getelementptr inbounds i64, i64* %items, i64 %add99
  store i64 %173, i64* %arrayidx98.1, align 8, !tbaa !1
  %add99.1 = add nsw i64 %i.1276, 2
  %add100.1 = add nsw i64 %l.2275, 2
  %arrayidx971059.2 = getelementptr inbounds i64, i64* %call, i64 %add100.1
  %174 = load i64, i64* %arrayidx971059.2, align 8, !tbaa !1
  %arrayidx98.2 = getelementptr inbounds i64, i64* %items, i64 %add99.1
  store i64 %174, i64* %arrayidx98.2, align 8, !tbaa !1
  %add99.2 = add nsw i64 %i.1276, 3
  %add100.2 = add nsw i64 %l.2275, 3
  %arrayidx971059.3 = getelementptr inbounds i64, i64* %call, i64 %add100.2
  %175 = load i64, i64* %arrayidx971059.3, align 8, !tbaa !1
  %arrayidx98.3 = getelementptr inbounds i64, i64* %items, i64 %add99.2
  store i64 %175, i64* %arrayidx98.3, align 8, !tbaa !1
  %add99.3 = add nsw i64 %i.1276, 4
  %add100.3 = add nsw i64 %l.2275, 4
  %exitcond289.3 = icmp eq i64 %add99.3, %4
  br i1 %exitcond289.3, label %while.cond101.preheader.loopexit.unr-lcssa, label %if.end96, !llvm.loop !22

if.end107:                                        ; preds = %if.end107, %if.end107.preheader1122.new
  %i.2273 = phi i64 [ %i.2273.unr, %if.end107.preheader1122.new ], [ %add110.3, %if.end107 ]
  %r.2272 = phi i64 [ %r.2272.unr, %if.end107.preheader1122.new ], [ %add111.3, %if.end107 ]
  %arrayidx1081056 = getelementptr inbounds i64, i64* %call34, i64 %r.2272
  %176 = load i64, i64* %arrayidx1081056, align 8, !tbaa !1
  %arrayidx109 = getelementptr inbounds i64, i64* %items, i64 %i.2273
  store i64 %176, i64* %arrayidx109, align 8, !tbaa !1
  %add110 = add nsw i64 %i.2273, 1
  %add111 = add nsw i64 %r.2272, 1
  %arrayidx1081056.1 = getelementptr inbounds i64, i64* %call34, i64 %add111
  %177 = load i64, i64* %arrayidx1081056.1, align 8, !tbaa !1
  %arrayidx109.1 = getelementptr inbounds i64, i64* %items, i64 %add110
  store i64 %177, i64* %arrayidx109.1, align 8, !tbaa !1
  %add110.1 = add nsw i64 %i.2273, 2
  %add111.1 = add nsw i64 %r.2272, 2
  %arrayidx1081056.2 = getelementptr inbounds i64, i64* %call34, i64 %add111.1
  %178 = load i64, i64* %arrayidx1081056.2, align 8, !tbaa !1
  %arrayidx109.2 = getelementptr inbounds i64, i64* %items, i64 %add110.1
  store i64 %178, i64* %arrayidx109.2, align 8, !tbaa !1
  %add110.2 = add nsw i64 %i.2273, 3
  %add111.2 = add nsw i64 %r.2272, 3
  %arrayidx1081056.3 = getelementptr inbounds i64, i64* %call34, i64 %add111.2
  %179 = load i64, i64* %arrayidx1081056.3, align 8, !tbaa !1
  %arrayidx109.3 = getelementptr inbounds i64, i64* %items, i64 %add110.2
  store i64 %179, i64* %arrayidx109.3, align 8, !tbaa !1
  %add110.3 = add nsw i64 %i.2273, 4
  %add111.3 = add nsw i64 %r.2272, 4
  %exitcond.3 = icmp eq i64 %add111.3, %sub35
  br i1 %exitcond.3, label %if.end114.loopexit.unr-lcssa, label %if.end107, !llvm.loop !23

if.end114.loopexit.unr-lcssa:                     ; preds = %if.end107
  br label %if.end114.loopexit

if.end114.loopexit:                               ; preds = %if.end107.prol.loopexit, %if.end114.loopexit.unr-lcssa
  br label %if.end114

if.end114:                                        ; preds = %if.end114.loopexit, %middle.block1081, %while.cond101.preheader
  br i1 %cmp19, label %if.end117, label %if.then116

if.then116:                                       ; preds = %if.end114
  call void @free(i8* %phitmp) #8
  br label %if.end117

if.end117:                                        ; preds = %if.end114, %if.then116
  br i1 %not.cmp53, label %if.end132, label %if.then119

if.then119:                                       ; preds = %if.end117
  call void @free(i8* %phitmp288) #8
  br label %if.end132

if.end132:                                        ; preds = %if.end117, %entry, %if.then119
  store i64 %items_size, i64* %_size_call_by_ref, align 8, !tbaa !1
  call void @llvm.lifetime.end(i64 8, i8* nonnull %2) #8
  call void @llvm.lifetime.end(i64 8, i8* nonnull %1) #8
  ret i64* %items

polly.cond1007:                                   ; preds = %if.end96.lr.ph
  %180 = sub nsw i64 %0, %l.0.lcssa
  br i1 %12, label %polly.parallel.for1011, label %polly.parallel.for1021

polly.parallel.for1011:                           ; preds = %polly.cond1007
  %181 = sub nsw i64 %180, %pexp.p_div_q957
  %182 = bitcast { i64, i64, i64, i64, i64*, i64*, i64 }* %polly.par.userContext1013 to i8*
  call void @llvm.lifetime.start(i64 56, i8* nonnull %182)
  %polly.subfn.storeaddr.i.0.lcssa1014 = getelementptr inbounds { i64, i64, i64, i64, i64*, i64*, i64 }, { i64, i64, i64, i64, i64*, i64*, i64 }* %polly.par.userContext1013, i64 0, i32 0
  store i64 %i.0.lcssa, i64* %polly.subfn.storeaddr.i.0.lcssa1014, align 8
  %polly.subfn.storeaddr.start1015 = getelementptr inbounds { i64, i64, i64, i64, i64*, i64*, i64 }, { i64, i64, i64, i64, i64*, i64*, i64 }* %polly.par.userContext1013, i64 0, i32 1
  store i64 %start, i64* %polly.subfn.storeaddr.start1015, align 8
  %polly.subfn.storeaddr.l.0.lcssa1016 = getelementptr inbounds { i64, i64, i64, i64, i64*, i64*, i64 }, { i64, i64, i64, i64, i64*, i64*, i64 }* %polly.par.userContext1013, i64 0, i32 2
  store i64 %l.0.lcssa, i64* %polly.subfn.storeaddr.l.0.lcssa1016, align 8
  %polly.subfn.storeaddr.end1017 = getelementptr inbounds { i64, i64, i64, i64, i64*, i64*, i64 }, { i64, i64, i64, i64, i64*, i64*, i64 }* %polly.par.userContext1013, i64 0, i32 3
  store i64 %end, i64* %polly.subfn.storeaddr.end1017, align 8
  %polly.subfn.storeaddr.call17 = getelementptr inbounds { i64, i64, i64, i64, i64*, i64*, i64 }, { i64, i64, i64, i64, i64*, i64*, i64 }* %polly.par.userContext1013, i64 0, i32 4
  store i64* %call17, i64** %polly.subfn.storeaddr.call17, align 8
  %polly.subfn.storeaddr.items1018 = getelementptr inbounds { i64, i64, i64, i64, i64*, i64*, i64 }, { i64, i64, i64, i64, i64*, i64*, i64 }* %polly.par.userContext1013, i64 0, i32 5
  store i64* %items, i64** %polly.subfn.storeaddr.items1018, align 8
  %polly.subfn.storeaddr.div1019 = getelementptr inbounds { i64, i64, i64, i64, i64*, i64*, i64 }, { i64, i64, i64, i64, i64*, i64*, i64 }* %polly.par.userContext1013, i64 0, i32 6
  store i64 %div, i64* %polly.subfn.storeaddr.div1019, align 8
  call void @GOMP_parallel_loop_runtime_start(void (i8*)* nonnull @_sortV1__polly_subfn_2, i8* nonnull %182, i32 0, i64 0, i64 %181, i64 1) #8
  %183 = bitcast i64* %polly.par.LBPtr.i1032 to i8*
  call void @llvm.lifetime.start(i64 8, i8* nonnull %183)
  %184 = bitcast i64* %polly.par.UBPtr.i1033 to i8*
  call void @llvm.lifetime.start(i64 8, i8* nonnull %184)
  %polly.subfunc.arg.i.0.lcssa.i1034 = load i64, i64* %polly.subfn.storeaddr.i.0.lcssa1014, align 8
  %polly.subfunc.arg.l.0.lcssa.i1035 = load i64, i64* %polly.subfn.storeaddr.l.0.lcssa1016, align 8
  %polly.subfunc.arg.call17.i1036 = load i64*, i64** %polly.subfn.storeaddr.call17, align 8
  %polly.subfunc.arg.items.i1037 = load i64*, i64** %polly.subfn.storeaddr.items1018, align 8
  %185 = call i8 @GOMP_loop_runtime_next(i64* nonnull %polly.par.LBPtr.i1032, i64* nonnull %polly.par.UBPtr.i1033) #8
  %186 = icmp eq i8 %185, 0
  br i1 %186, label %_sortV1__polly_subfn_2.exit, label %polly.par.loadIVBounds.preheader.i1040

polly.par.loadIVBounds.preheader.i1040:           ; preds = %polly.parallel.for1011
  %scevgep.i1038 = getelementptr i64, i64* %polly.subfunc.arg.call17.i1036, i64 %polly.subfunc.arg.l.0.lcssa.i1035
  %scevgep3.i1039 = getelementptr i64, i64* %polly.subfunc.arg.items.i1037, i64 %polly.subfunc.arg.i.0.lcssa.i1034
  br label %polly.par.loadIVBounds.i1045

polly.par.checkNext.loopexit.i1041:               ; preds = %polly.loop_header.i1052
  %187 = call i8 @GOMP_loop_runtime_next(i64* nonnull %polly.par.LBPtr.i1032, i64* nonnull %polly.par.UBPtr.i1033) #8
  %188 = icmp eq i8 %187, 0
  br i1 %188, label %_sortV1__polly_subfn_2.exit.loopexit, label %polly.par.loadIVBounds.i1045

polly.par.loadIVBounds.i1045:                     ; preds = %polly.par.checkNext.loopexit.i1041, %polly.par.loadIVBounds.preheader.i1040
  %polly.par.UB.i1042 = load i64, i64* %polly.par.UBPtr.i1033, align 8
  %polly.par.LB.i1043 = load i64, i64* %polly.par.LBPtr.i1032, align 8
  %polly.adjust_ub.i1044 = add i64 %polly.par.UB.i1042, -2
  br label %polly.loop_header.i1052

polly.loop_header.i1052:                          ; preds = %polly.loop_header.i1052, %polly.par.loadIVBounds.i1045
  %polly.indvar.i1046 = phi i64 [ %polly.par.LB.i1043, %polly.par.loadIVBounds.i1045 ], [ %polly.indvar_next.i1050, %polly.loop_header.i1052 ]
  %scevgep2.i1047 = getelementptr i64, i64* %scevgep.i1038, i64 %polly.indvar.i1046
  %_p_scalar_.i1048 = load i64, i64* %scevgep2.i1047, align 8, !alias.scope !24, !noalias !26
  %scevgep4.i1049 = getelementptr i64, i64* %scevgep3.i1039, i64 %polly.indvar.i1046
  store i64 %_p_scalar_.i1048, i64* %scevgep4.i1049, align 8, !alias.scope !27, !noalias !28
  %polly.indvar_next.i1050 = add nsw i64 %polly.indvar.i1046, 1
  %polly.loop_cond.i1051 = icmp sgt i64 %polly.indvar.i1046, %polly.adjust_ub.i1044
  br i1 %polly.loop_cond.i1051, label %polly.par.checkNext.loopexit.i1041, label %polly.loop_header.i1052

_sortV1__polly_subfn_2.exit.loopexit:             ; preds = %polly.par.checkNext.loopexit.i1041
  br label %_sortV1__polly_subfn_2.exit

_sortV1__polly_subfn_2.exit:                      ; preds = %_sortV1__polly_subfn_2.exit.loopexit, %polly.parallel.for1011
  call void @GOMP_loop_end_nowait() #8
  call void @llvm.lifetime.end(i64 8, i8* nonnull %183)
  call void @llvm.lifetime.end(i64 8, i8* nonnull %184)
  call void @GOMP_parallel_end() #8
  call void @llvm.lifetime.end(i64 8, i8* nonnull %182)
  br label %while.cond101.preheader

polly.parallel.for1021:                           ; preds = %polly.cond1007
  %189 = bitcast { i64, i64, i64, i64, i64*, i64*, i64 }* %polly.par.userContext1023 to i8*
  call void @llvm.lifetime.start(i64 56, i8* nonnull %189)
  %polly.subfn.storeaddr.i.0.lcssa1024 = getelementptr inbounds { i64, i64, i64, i64, i64*, i64*, i64 }, { i64, i64, i64, i64, i64*, i64*, i64 }* %polly.par.userContext1023, i64 0, i32 0
  store i64 %i.0.lcssa, i64* %polly.subfn.storeaddr.i.0.lcssa1024, align 8
  %polly.subfn.storeaddr.start1025 = getelementptr inbounds { i64, i64, i64, i64, i64*, i64*, i64 }, { i64, i64, i64, i64, i64*, i64*, i64 }* %polly.par.userContext1023, i64 0, i32 1
  store i64 %start, i64* %polly.subfn.storeaddr.start1025, align 8
  %polly.subfn.storeaddr.l.0.lcssa1026 = getelementptr inbounds { i64, i64, i64, i64, i64*, i64*, i64 }, { i64, i64, i64, i64, i64*, i64*, i64 }* %polly.par.userContext1023, i64 0, i32 2
  store i64 %l.0.lcssa, i64* %polly.subfn.storeaddr.l.0.lcssa1026, align 8
  %polly.subfn.storeaddr.end1027 = getelementptr inbounds { i64, i64, i64, i64, i64*, i64*, i64 }, { i64, i64, i64, i64, i64*, i64*, i64 }* %polly.par.userContext1023, i64 0, i32 3
  store i64 %end, i64* %polly.subfn.storeaddr.end1027, align 8
  %polly.subfn.storeaddr.call171028 = getelementptr inbounds { i64, i64, i64, i64, i64*, i64*, i64 }, { i64, i64, i64, i64, i64*, i64*, i64 }* %polly.par.userContext1023, i64 0, i32 4
  store i64* %call17, i64** %polly.subfn.storeaddr.call171028, align 8
  %polly.subfn.storeaddr.items1029 = getelementptr inbounds { i64, i64, i64, i64, i64*, i64*, i64 }, { i64, i64, i64, i64, i64*, i64*, i64 }* %polly.par.userContext1023, i64 0, i32 5
  store i64* %items, i64** %polly.subfn.storeaddr.items1029, align 8
  %polly.subfn.storeaddr.div1030 = getelementptr inbounds { i64, i64, i64, i64, i64*, i64*, i64 }, { i64, i64, i64, i64, i64*, i64*, i64 }* %polly.par.userContext1023, i64 0, i32 6
  store i64 %div, i64* %polly.subfn.storeaddr.div1030, align 8
  %190 = add i64 %180, %pexp.p_div_q944
  call void @GOMP_parallel_loop_runtime_start(void (i8*)* nonnull @_sortV1__polly_subfn_3, i8* nonnull %189, i32 0, i64 0, i64 %190, i64 1) #8
  %191 = bitcast i64* %polly.par.LBPtr.i to i8*
  call void @llvm.lifetime.start(i64 8, i8* nonnull %191)
  %192 = bitcast i64* %polly.par.UBPtr.i to i8*
  call void @llvm.lifetime.start(i64 8, i8* nonnull %192)
  %polly.subfunc.arg.i.0.lcssa.i = load i64, i64* %polly.subfn.storeaddr.i.0.lcssa1024, align 8
  %polly.subfunc.arg.l.0.lcssa.i = load i64, i64* %polly.subfn.storeaddr.l.0.lcssa1026, align 8
  %polly.subfunc.arg.call17.i = load i64*, i64** %polly.subfn.storeaddr.call171028, align 8
  %polly.subfunc.arg.items.i = load i64*, i64** %polly.subfn.storeaddr.items1029, align 8
  %193 = call i8 @GOMP_loop_runtime_next(i64* nonnull %polly.par.LBPtr.i, i64* nonnull %polly.par.UBPtr.i) #8
  %194 = icmp eq i8 %193, 0
  br i1 %194, label %_sortV1__polly_subfn_3.exit, label %polly.par.loadIVBounds.preheader.i

polly.par.loadIVBounds.preheader.i:               ; preds = %polly.parallel.for1021
  %scevgep.i = getelementptr i64, i64* %polly.subfunc.arg.call17.i, i64 %polly.subfunc.arg.l.0.lcssa.i
  %scevgep3.i = getelementptr i64, i64* %polly.subfunc.arg.items.i, i64 %polly.subfunc.arg.i.0.lcssa.i
  br label %polly.par.loadIVBounds.i

polly.par.checkNext.loopexit.i:                   ; preds = %polly.loop_header.i
  %195 = call i8 @GOMP_loop_runtime_next(i64* nonnull %polly.par.LBPtr.i, i64* nonnull %polly.par.UBPtr.i) #8
  %196 = icmp eq i8 %195, 0
  br i1 %196, label %_sortV1__polly_subfn_3.exit.loopexit, label %polly.par.loadIVBounds.i

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

_sortV1__polly_subfn_3.exit:                      ; preds = %_sortV1__polly_subfn_3.exit.loopexit, %polly.parallel.for1021
  call void @GOMP_loop_end_nowait() #8
  call void @llvm.lifetime.end(i64 8, i8* nonnull %191)
  call void @llvm.lifetime.end(i64 8, i8* nonnull %192)
  call void @GOMP_parallel_end() #8
  call void @llvm.lifetime.end(i64 8, i8* nonnull %189)
  br label %while.cond101.preheader
}

; Function Attrs: argmemonly nounwind
declare void @llvm.lifetime.start(i64, i8* nocapture) #1

; Function Attrs: nounwind
declare void @free(i8* nocapture) local_unnamed_addr #2

declare i64* @slice(i64*, i64, i32, i32) local_unnamed_addr #3

; Function Attrs: argmemonly nounwind
declare void @llvm.lifetime.end(i64, i8* nocapture) #1

; Function Attrs: noreturn nounwind uwtable
define i32 @main(i32 %argc, i8** %args) local_unnamed_addr #4 {
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
  %not.cmp = icmp eq i64** %call, null
  %3 = load i64*, i64** %call, align 8, !tbaa !34
  %call3 = call i64* @parseStringToInt(i64* %3) #8
  %not.cmp4 = icmp eq i64* %call3, null
  br i1 %not.cmp4, label %if.end91, label %if.end14

if.end14:                                         ; preds = %entry
  %4 = load i64, i64* %call3, align 8, !tbaa !1
  %call18 = call i64* @create1DArray_int64_t(i64 0, i64 %4) #8
  %cmp28176 = icmp sgt i64 %4, 0
  br i1 %cmp28176, label %polly.parallel.for, label %if.end85

if.end85:                                         ; preds = %if.end14, %main_polly_subfn.exit
  %call35 = call i64* @_sortV1_(i64* %call18, i64 %4, i1 zeroext undef, i64 0, i64 %4, i64* nonnull %_15_size)
  %not.cmp37 = icmp eq i64* %call35, null
  %5 = load i64, i64* %call35, align 8, !tbaa !1
  %call47 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str, i64 0, i64 0), i64 %5)
  %sub48 = add nsw i64 %4, -1
  %arrayidx49186 = getelementptr inbounds i64, i64* %call18, i64 %sub48
  %6 = load i64, i64* %arrayidx49186, align 8, !tbaa !1
  %call50 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str, i64 0, i64 0), i64 %6)
  %call54 = call i64* @create1DArray_int64_t(i64 0, i64 24) #8
  %7 = bitcast i64* %call54 to <2 x i64>*
  store <2 x i64> <i64 80, i64 97>, <2 x i64>* %7, align 8, !tbaa !1
  %arrayidx57 = getelementptr inbounds i64, i64* %call54, i64 2
  %8 = bitcast i64* %arrayidx57 to <2 x i64>*
  store <2 x i64> <i64 115, i64 115>, <2 x i64>* %8, align 8, !tbaa !1
  %arrayidx59 = getelementptr inbounds i64, i64* %call54, i64 4
  %9 = bitcast i64* %arrayidx59 to <2 x i64>*
  store <2 x i64> <i64 32, i64 77>, <2 x i64>* %9, align 8, !tbaa !1
  %arrayidx61 = getelementptr inbounds i64, i64* %call54, i64 6
  %10 = bitcast i64* %arrayidx61 to <2 x i64>*
  store <2 x i64> <i64 101, i64 114>, <2 x i64>* %10, align 8, !tbaa !1
  %arrayidx63 = getelementptr inbounds i64, i64* %call54, i64 8
  %11 = bitcast i64* %arrayidx63 to <2 x i64>*
  store <2 x i64> <i64 103, i64 101>, <2 x i64>* %11, align 8, !tbaa !1
  %arrayidx65 = getelementptr inbounds i64, i64* %call54, i64 10
  %12 = bitcast i64* %arrayidx65 to <2 x i64>*
  store <2 x i64> <i64 115, i64 111>, <2 x i64>* %12, align 8, !tbaa !1
  %arrayidx67 = getelementptr inbounds i64, i64* %call54, i64 12
  %13 = bitcast i64* %arrayidx67 to <2 x i64>*
  store <2 x i64> <i64 114, i64 116>, <2 x i64>* %13, align 8, !tbaa !1
  %arrayidx69 = getelementptr inbounds i64, i64* %call54, i64 14
  %14 = bitcast i64* %arrayidx69 to <2 x i64>*
  store <2 x i64> <i64 32, i64 116>, <2 x i64>* %14, align 8, !tbaa !1
  %arrayidx71 = getelementptr inbounds i64, i64* %call54, i64 16
  %15 = bitcast i64* %arrayidx71 to <2 x i64>*
  store <2 x i64> <i64 101, i64 115>, <2 x i64>* %15, align 8, !tbaa !1
  %arrayidx73 = getelementptr inbounds i64, i64* %call54, i64 18
  %16 = bitcast i64* %arrayidx73 to <2 x i64>*
  store <2 x i64> <i64 116, i64 32>, <2 x i64>* %16, align 8, !tbaa !1
  %arrayidx75 = getelementptr inbounds i64, i64* %call54, i64 20
  %17 = bitcast i64* %arrayidx75 to <2 x i64>*
  store <2 x i64> <i64 99, i64 97>, <2 x i64>* %17, align 8, !tbaa !1
  %arrayidx77 = getelementptr inbounds i64, i64* %call54, i64 22
  %18 = bitcast i64* %arrayidx77 to <2 x i64>*
  store <2 x i64> <i64 115, i64 101>, <2 x i64>* %18, align 8, !tbaa !1
  %not.cmp79 = icmp ne i64* %call54, null
  %_28_dealloc.0 = zext i1 %not.cmp79 to i8
  call void @println_s(i64* %call54, i64 24) #8
  %phitmp = bitcast i64* %call54 to i8*
  %19 = bitcast i64* %call3 to i8*
  call void @free(i8* %19) #8
  br i1 %not.cmp37, label %if.end91, label %if.then87

if.then87:                                        ; preds = %if.end85
  %phitmp174 = bitcast i64* %call35 to i8*
  call void @free(i8* %phitmp174) #8
  br label %if.end91

if.end91:                                         ; preds = %if.end85, %entry, %if.then87
  %_28.0181185 = phi i8* [ %phitmp, %if.then87 ], [ %phitmp, %if.end85 ], [ null, %entry ]
  %_28_dealloc.1182184 = phi i8 [ %_28_dealloc.0, %if.then87 ], [ %_28_dealloc.0, %if.end85 ], [ 0, %entry ]
  br i1 %not.cmp, label %if.end103, label %if.then93

if.then93:                                        ; preds = %if.end91
  %20 = load i64, i64* %_6_size, align 8, !tbaa !1
  call void @free2DArray_int64_t(i64** nonnull %call, i64 %20) #8
  br label %if.end103

if.end103:                                        ; preds = %if.end91, %if.then93
  %tobool104 = icmp eq i8 %_28_dealloc.1182184, 0
  br i1 %tobool104, label %if.end106, label %if.then105

if.then105:                                       ; preds = %if.end103
  call void @free(i8* %_28.0181185) #8
  br label %if.end106

if.end106:                                        ; preds = %if.end103, %if.then105
  call void @exit(i32 0) #9
  unreachable

polly.parallel.for:                               ; preds = %if.end14
  %21 = bitcast { i64, i64* }* %polly.par.userContext to i8*
  call void @llvm.lifetime.start(i64 16, i8* nonnull %21)
  %polly.subfn.storeaddr. = getelementptr inbounds { i64, i64* }, { i64, i64* }* %polly.par.userContext, i64 0, i32 0
  store i64 %4, i64* %polly.subfn.storeaddr., align 8
  %polly.subfn.storeaddr.call18 = getelementptr inbounds { i64, i64* }, { i64, i64* }* %polly.par.userContext, i64 0, i32 1
  store i64* %call18, i64** %polly.subfn.storeaddr.call18, align 8
  call void @GOMP_parallel_loop_runtime_start(void (i8*)* nonnull @main_polly_subfn, i8* nonnull %21, i32 0, i64 0, i64 %4, i64 1) #8
  %22 = bitcast i64* %polly.par.LBPtr.i to i8*
  call void @llvm.lifetime.start(i64 8, i8* nonnull %22)
  %23 = bitcast i64* %polly.par.UBPtr.i to i8*
  call void @llvm.lifetime.start(i64 8, i8* nonnull %23)
  %polly.subfunc.arg..i = load i64, i64* %polly.subfn.storeaddr., align 8
  %polly.subfunc.arg.call18.i = load i64*, i64** %polly.subfn.storeaddr.call18, align 8
  %24 = call i8 @GOMP_loop_runtime_next(i64* nonnull %polly.par.LBPtr.i, i64* nonnull %polly.par.UBPtr.i) #8
  %25 = icmp eq i8 %24, 0
  br i1 %25, label %main_polly_subfn.exit, label %polly.par.loadIVBounds.i.preheader

polly.par.loadIVBounds.i.preheader:               ; preds = %polly.parallel.for
  br label %polly.par.loadIVBounds.i

polly.par.checkNext.loopexit.i:                   ; preds = %polly.loop_header.i
  %26 = call i8 @GOMP_loop_runtime_next(i64* nonnull %polly.par.LBPtr.i, i64* nonnull %polly.par.UBPtr.i) #8
  %27 = icmp eq i8 %26, 0
  br i1 %27, label %main_polly_subfn.exit.loopexit, label %polly.par.loadIVBounds.i

polly.par.loadIVBounds.i:                         ; preds = %polly.par.loadIVBounds.i.preheader, %polly.par.checkNext.loopexit.i
  %polly.par.UB.i = load i64, i64* %polly.par.UBPtr.i, align 8
  %polly.par.LB.i = load i64, i64* %polly.par.LBPtr.i, align 8
  %polly.adjust_ub.i = add i64 %polly.par.UB.i, -2
  br label %polly.loop_header.i

polly.loop_header.i:                              ; preds = %polly.loop_header.i, %polly.par.loadIVBounds.i
  %polly.indvar.i = phi i64 [ %polly.par.LB.i, %polly.par.loadIVBounds.i ], [ %polly.indvar_next.i, %polly.loop_header.i ]
  %scevgep.i = getelementptr i64, i64* %polly.subfunc.arg.call18.i, i64 %polly.indvar.i
  %28 = sub i64 %polly.subfunc.arg..i, %polly.indvar.i
  store i64 %28, i64* %scevgep.i, align 8, !alias.scope !36, !noalias !38
  %polly.indvar_next.i = add nsw i64 %polly.indvar.i, 1
  %polly.loop_cond.i = icmp sgt i64 %polly.indvar.i, %polly.adjust_ub.i
  br i1 %polly.loop_cond.i, label %polly.par.checkNext.loopexit.i, label %polly.loop_header.i

main_polly_subfn.exit.loopexit:                   ; preds = %polly.par.checkNext.loopexit.i
  br label %main_polly_subfn.exit

main_polly_subfn.exit:                            ; preds = %main_polly_subfn.exit.loopexit, %polly.parallel.for
  call void @GOMP_loop_end_nowait() #8
  call void @llvm.lifetime.end(i64 8, i8* nonnull %22)
  call void @llvm.lifetime.end(i64 8, i8* nonnull %23)
  call void @GOMP_parallel_end() #8
  call void @llvm.lifetime.end(i64 8, i8* nonnull %21)
  br label %if.end85
}

declare void @free2DArray_int64_t(i64**, i64) local_unnamed_addr #3

declare i64** @convertArgsToIntArray(i32, i8**, i64*, i64*) local_unnamed_addr #3

declare i64* @parseStringToInt(i64*) local_unnamed_addr #3

declare i64* @create1DArray_int64_t(i64, i64) local_unnamed_addr #3

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
  %polly.subfunc.arg.call17 = load i64*, i64** %4, align 8
  %5 = getelementptr inbounds i8, i8* %polly.par.userContext, i64 40
  %6 = bitcast i8* %5 to i64**
  %polly.subfunc.arg.items = load i64*, i64** %6, align 8
  %7 = call i8 @GOMP_loop_runtime_next(i64* nonnull %polly.par.LBPtr, i64* nonnull %polly.par.UBPtr)
  %8 = icmp eq i8 %7, 0
  br i1 %8, label %polly.par.exit, label %polly.par.loadIVBounds.preheader

polly.par.loadIVBounds.preheader:                 ; preds = %polly.par.setup
  %scevgep = getelementptr i64, i64* %polly.subfunc.arg.call17, i64 %polly.subfunc.arg.l.0.lcssa
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
  %polly.subfunc.arg.call17 = load i64*, i64** %4, align 8
  %5 = getelementptr inbounds i8, i8* %polly.par.userContext, i64 40
  %6 = bitcast i8* %5 to i64**
  %polly.subfunc.arg.items = load i64*, i64** %6, align 8
  %7 = call i8 @GOMP_loop_runtime_next(i64* nonnull %polly.par.LBPtr, i64* nonnull %polly.par.UBPtr)
  %8 = icmp eq i8 %7, 0
  br i1 %8, label %polly.par.exit, label %polly.par.loadIVBounds.preheader

polly.par.loadIVBounds.preheader:                 ; preds = %polly.par.setup
  %scevgep = getelementptr i64, i64* %polly.subfunc.arg.call17, i64 %polly.subfunc.arg.l.0.lcssa
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
  %polly.subfunc.arg.call18 = load i64*, i64** %2, align 8
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
  %scevgep = getelementptr i64, i64* %polly.subfunc.arg.call18, i64 %polly.indvar
  %7 = sub i64 %polly.subfunc.arg., %polly.indvar
  store i64 %7, i64* %scevgep, align 8, !alias.scope !44, !noalias !38
  %polly.indvar_next = add nsw i64 %polly.indvar, 1
  %polly.loop_cond = icmp sgt i64 %polly.indvar, %polly.adjust_ub
  br i1 %polly.loop_cond, label %polly.par.checkNext.loopexit, label %polly.loop_header
}

attributes #0 = { nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "polly-optimized" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { argmemonly nounwind }
attributes #2 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { noreturn nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "polly-optimized" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
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
!24 = distinct !{!24, !25, !"polly.alias.scope.call17"}
!25 = distinct !{!25, !"polly.alias.scope.domain"}
!26 = !{!27}
!27 = distinct !{!27, !25, !"polly.alias.scope.items"}
!28 = !{!24}
!29 = distinct !{!29, !30, !"polly.alias.scope.call17"}
!30 = distinct !{!30, !"polly.alias.scope.domain"}
!31 = !{!32}
!32 = distinct !{!32, !30, !"polly.alias.scope.items"}
!33 = !{!29}
!34 = !{!35, !35, i64 0}
!35 = !{!"any pointer", !3, i64 0}
!36 = distinct !{!36, !37, !"polly.alias.scope.call18"}
!37 = distinct !{!37, !"polly.alias.scope.domain"}
!38 = !{}
!39 = distinct !{!39, !40, !"polly.alias.scope.call17"}
!40 = distinct !{!40, !"polly.alias.scope.domain"}
!41 = !{!42}
!42 = distinct !{!42, !40, !"polly.alias.scope.items"}
!43 = !{!39}
!44 = distinct !{!44, !45, !"polly.alias.scope.call18"}
!45 = distinct !{!45, !"polly.alias.scope.domain"}
