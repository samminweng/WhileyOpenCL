; ModuleID = 'MergeSort_original.c'
source_filename = "MergeSort_original.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [5 x i8] c"%ld\0A\00", align 1

; Function Attrs: nounwind uwtable
define i64* @_sortV1_(i64* returned %items, i64 %items_size, i1 zeroext %items_dealloc, i64 %start, i64 %end, i64* nocapture %_size_call_by_ref) local_unnamed_addr #0 {
entry:
  %0 = sub i64 0, %start
  %polly.par.LBPtr.i1082 = alloca i64, align 8
  %polly.par.UBPtr.i1083 = alloca i64, align 8
  %polly.par.LBPtr.i = alloca i64, align 8
  %polly.par.UBPtr.i = alloca i64, align 8
  %polly.par.userContext1065 = alloca { i64, i64, i64, i64, i64*, i64*, i64 }, align 8
  %polly.par.userContext1055 = alloca { i64, i64, i64, i64, i64*, i64*, i64 }, align 8
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
  br i1 %cmp, label %polly.split_new_and_old1078, label %if.end155

polly.split_new_and_old1078:                      ; preds = %entry
  %add1 = add nsw i64 %end, %start
  %div = sdiv i64 %add1, 2
  %conv = trunc i64 %start to i32
  %conv4 = trunc i64 %div to i32
  %call = tail call i64* @slice(i64* %items, i64 %items_size, i32 %conv, i32 %conv4) #8
  %phitmp327 = bitcast i64* %call to i8*
  %sub = sub i64 %div, %start
  %not.cmp5 = icmp eq i64* %call, null
  %call12 = tail call i64* @copy1DArray_int64_t(i64* %call, i64 %sub) #8
  %call21 = tail call i64* @copy1DArray_int64_t(i64* %call12, i64 %sub) #8
  %call22 = call i64* @_sortV1_(i64* %call21, i64 %sub, i1 zeroext undef, i64 0, i64 %div, i64* nonnull %_16_size)
  %phitmp328 = bitcast i64* %call22 to i8*
  %3 = icmp eq i64* %call12, null
  %p_not.cmp27 = icmp eq i64* %call22, null
  br i1 %3, label %polly.split_new_and_old1074, label %if.end26

if.end26:                                         ; preds = %polly.split_new_and_old1078
  %4 = bitcast i64* %call12 to i8*
  tail call void @free(i8* %4) #8
  br label %polly.split_new_and_old1074

polly.split_new_and_old1074:                      ; preds = %if.end26, %polly.split_new_and_old1078
  %5 = load i64, i64* %_16_size, align 8, !tbaa !1
  %call35 = tail call i64* @copy1DArray_int64_t(i64* %call22, i64 %5) #8
  %phitmp = bitcast i64* %call35 to i8*
  %cmp36 = icmp eq i64* %call35, null
  %conv45 = trunc i64 %end to i32
  %call46 = tail call i64* @slice(i64* %items, i64 %items_size, i32 %conv4, i32 %conv45) #8
  %phitmp329 = bitcast i64* %call46 to i8*
  %sub47 = sub nsw i64 %end, %div
  %not.cmp48 = icmp eq i64* %call46, null
  %call56 = tail call i64* @copy1DArray_int64_t(i64* %call46, i64 %sub47) #8
  %call66 = tail call i64* @copy1DArray_int64_t(i64* %call56, i64 %sub47) #8
  %call67 = call i64* @_sortV1_(i64* %call66, i64 %sub47, i1 zeroext undef, i64 0, i64 %sub47, i64* nonnull %_19_size)
  %phitmp330 = bitcast i64* %call67 to i8*
  %6 = icmp eq i64* %call56, null
  %p_not.cmp72 = icmp eq i64* %call67, null
  br i1 %6, label %if.end79, label %if.end71

if.end71:                                         ; preds = %polly.split_new_and_old1074
  %7 = bitcast i64* %call56 to i8*
  tail call void @free(i8* %7) #8
  br label %if.end79

if.end79:                                         ; preds = %polly.split_new_and_old1074, %if.end71
  %8 = load i64, i64* %_19_size, align 8, !tbaa !1
  %call80 = tail call i64* @copy1DArray_int64_t(i64* %call67, i64 %8) #8
  %phitmp326 = bitcast i64* %call80 to i8*
  %not.cmp81 = icmp eq i64* %call80, null
  %sub86 = sub nsw i64 %end, %start
  %cmp87315 = icmp sgt i64 %sub86, 0
  %cmp92316 = icmp sgt i64 %sub, 0
  %or.cond317 = and i1 %cmp87315, %cmp92316
  %cmp97318 = icmp sgt i64 %sub47, 0
  %or.cond308319 = and i1 %cmp97318, %or.cond317
  br i1 %or.cond308319, label %if.end100.preheader, label %while.cond113.preheader

if.end100.preheader:                              ; preds = %if.end79
  br label %if.end100

while.cond113.preheader.loopexit:                 ; preds = %blklab4
  br label %while.cond113.preheader

while.cond113.preheader:                          ; preds = %while.cond113.preheader.loopexit, %if.end79
  %l.0.lcssa = phi i64 [ 0, %if.end79 ], [ %l.1, %while.cond113.preheader.loopexit ]
  %r.0.lcssa = phi i64 [ 0, %if.end79 ], [ %r.1, %while.cond113.preheader.loopexit ]
  %i.0.lcssa = phi i64 [ 0, %if.end79 ], [ %add112, %while.cond113.preheader.loopexit ]
  %cmp116312 = icmp sgt i64 %sub, %l.0.lcssa
  br i1 %cmp116312, label %if.end119.lr.ph, label %while.cond124.preheader

if.end119.lr.ph:                                  ; preds = %while.cond113.preheader
  %9 = sub i64 %sub, %l.0.lcssa
  %10 = add i64 %9, %i.0.lcssa
  %11 = tail call { i64, i1 } @llvm.smul.with.overflow.i64(i64 %i.0.lcssa, i64 2)
  %.obit806 = extractvalue { i64, i1 } %11, 1
  %.res808 = extractvalue { i64, i1 } %11, 0
  %12 = tail call { i64, i1 } @llvm.sadd.with.overflow.i64(i64 %.res808, i64 %end)
  %.obit809 = extractvalue { i64, i1 } %12, 1
  %polly.overflow.state810 = or i1 %.obit806, %.obit809
  %.res811 = extractvalue { i64, i1 } %12, 0
  %13 = tail call { i64, i1 } @llvm.smul.with.overflow.i64(i64 %l.0.lcssa, i64 2)
  %.obit812 = extractvalue { i64, i1 } %13, 1
  %polly.overflow.state813 = or i1 %.obit812, %polly.overflow.state810
  %.res814 = extractvalue { i64, i1 } %13, 0
  %14 = tail call { i64, i1 } @llvm.sadd.with.overflow.i64(i64 %start, i64 %.res814)
  %.obit815 = extractvalue { i64, i1 } %14, 1
  %polly.overflow.state816 = or i1 %.obit815, %polly.overflow.state813
  %.res817 = extractvalue { i64, i1 } %14, 0
  %15 = tail call { i64, i1 } @llvm.sadd.with.overflow.i64(i64 %.res817, i64 -1)
  %.obit818 = extractvalue { i64, i1 } %15, 1
  %polly.overflow.state819 = or i1 %.obit818, %polly.overflow.state816
  %.res820 = extractvalue { i64, i1 } %15, 0
  %16 = icmp sge i64 %.res811, %.res820
  %17 = tail call { i64, i1 } @llvm.sadd.with.overflow.i64(i64 %start, i64 %end)
  %.obit821 = extractvalue { i64, i1 } %17, 1
  %18 = icmp slt i64 %add1, 0
  %19 = and i1 %18, %16
  %polly.overflow.state831 = or i1 %.obit821, %polly.overflow.state819
  %20 = tail call { i64, i1 } @llvm.sadd.with.overflow.i64(i64 %.res817, i64 2)
  %.obit833 = extractvalue { i64, i1 } %20, 1
  %.res835 = extractvalue { i64, i1 } %20, 0
  %21 = icmp sle i64 %.res835, %end
  %polly.overflow.state837 = or i1 %.obit833, %polly.overflow.state831
  %polly.overflow.state840 = or i1 %.obit812, %polly.overflow.state837
  %polly.overflow.state843 = or i1 %.obit815, %polly.overflow.state840
  %22 = tail call { i64, i1 } @llvm.sadd.with.overflow.i64(i64 %.res817, i64 1)
  %.obit845 = extractvalue { i64, i1 } %22, 1
  %polly.overflow.state846 = or i1 %.obit845, %polly.overflow.state843
  %23 = or i1 %21, %19
  %polly.overflow.state849 = or i1 %.obit806, %polly.overflow.state846
  %polly.overflow.state852 = or i1 %.obit809, %polly.overflow.state849
  %polly.overflow.state855 = or i1 %.obit812, %polly.overflow.state852
  %polly.overflow.state858 = or i1 %.obit815, %polly.overflow.state855
  %24 = sext i64 %.res817 to i66
  %25 = tail call { i66, i1 } @llvm.sadd.with.overflow.i66(i66 %24, i66 18446744073709551616)
  %.obit860 = extractvalue { i66, i1 } %25, 1
  %polly.overflow.state861 = or i1 %.obit860, %polly.overflow.state858
  %.res862 = extractvalue { i66, i1 } %25, 0
  %26 = sext i64 %.res811 to i66
  %27 = icmp sge i66 %26, %.res862
  %28 = icmp sgt i64 %add1, -1
  %29 = and i1 %28, %27
  %30 = or i1 %23, %29
  %31 = icmp slt i64 %i.0.lcssa, -1152921504606846976
  %polly.overflow.state870 = or i1 %.obit821, %polly.overflow.state861
  %32 = and i1 %31, %21
  %polly.overflow.state876 = or i1 %.obit833, %polly.overflow.state870
  %33 = and i1 %28, %32
  %34 = or i1 %33, %30
  %polly.overflow.state879 = or i1 %.obit812, %polly.overflow.state876
  %polly.overflow.state882 = or i1 %.obit815, %polly.overflow.state879
  %polly.overflow.state885 = or i1 %.obit845, %polly.overflow.state882
  %.res886 = extractvalue { i64, i1 } %22, 0
  %35 = icmp sle i64 %.res886, %end
  %36 = and i1 %31, %35
  %37 = and i1 %18, %36
  %38 = or i1 %37, %34
  %39 = icmp slt i64 %l.0.lcssa, -1152921504606846976
  %polly.overflow.state894 = or i1 %.obit821, %polly.overflow.state885
  %40 = and i1 %39, %21
  %polly.overflow.state900 = or i1 %.obit833, %polly.overflow.state894
  %41 = and i1 %28, %40
  %42 = or i1 %41, %38
  %polly.overflow.state903 = or i1 %.obit812, %polly.overflow.state900
  %polly.overflow.state906 = or i1 %.obit815, %polly.overflow.state903
  %polly.overflow.state909 = or i1 %.obit845, %polly.overflow.state906
  %43 = and i1 %39, %35
  %44 = and i1 %18, %43
  %45 = or i1 %44, %42
  %46 = icmp sgt i64 %l.0.lcssa, 1152921504606846975
  %polly.overflow.state918 = or i1 %.obit821, %polly.overflow.state909
  %47 = and i1 %46, %21
  %polly.overflow.state924 = or i1 %.obit833, %polly.overflow.state918
  %48 = and i1 %28, %47
  %49 = or i1 %48, %45
  %polly.overflow.state927 = or i1 %.obit812, %polly.overflow.state924
  %polly.overflow.state930 = or i1 %.obit815, %polly.overflow.state927
  %polly.overflow.state933 = or i1 %.obit845, %polly.overflow.state930
  %50 = and i1 %46, %35
  %51 = and i1 %18, %50
  %52 = or i1 %51, %49
  %53 = icmp sgt i64 %i.0.lcssa, 1152921504606846975
  %polly.overflow.state942 = or i1 %.obit821, %polly.overflow.state933
  %54 = and i1 %53, %21
  %polly.overflow.state948 = or i1 %.obit833, %polly.overflow.state942
  %55 = and i1 %28, %54
  %56 = or i1 %55, %52
  %polly.overflow.state951 = or i1 %.obit812, %polly.overflow.state948
  %polly.overflow.state954 = or i1 %.obit815, %polly.overflow.state951
  %polly.overflow.state957 = or i1 %.obit845, %polly.overflow.state954
  %57 = and i1 %53, %35
  %polly.overflow.state960 = or i1 %.obit821, %polly.overflow.state957
  %58 = and i1 %18, %57
  %59 = or i1 %58, %56
  %60 = icmp eq i64 %l.0.lcssa, -9223372036854775808
  %61 = or i1 %60, %59
  %62 = icmp eq i64 %start, -9223372036854775808
  %63 = tail call { i64, i1 } @llvm.sadd.with.overflow.i64(i64 %end, i64 9223372036854775807)
  %.obit962 = extractvalue { i64, i1 } %63, 1
  %polly.overflow.state963 = or i1 %.obit962, %polly.overflow.state960
  %.res964 = extractvalue { i64, i1 } %63, 0
  %polly.overflow.state966 = or i1 %.obit812, %polly.overflow.state963
  %64 = icmp sge i64 %.res964, %.res814
  %65 = and i1 %62, %64
  %66 = or i1 %65, %61
  %67 = xor i1 %66, true
  %polly.overflow.state972 = or i1 %.obit815, %polly.overflow.state966
  %polly.overflow.state975 = or i1 %.obit833, %polly.overflow.state972
  %polly.overflow.state978 = or i1 %.obit821, %polly.overflow.state975
  %68 = and i1 %28, %21
  %69 = tail call { i64, i1 } @llvm.ssub.with.overflow.i64(i64 0, i64 %start)
  %.obit980 = extractvalue { i64, i1 } %69, 1
  %polly.overflow.state981 = or i1 %.obit980, %polly.overflow.state978
  %pexp.p_div_q986 = lshr i64 %add1, 1
  %70 = tail call { i64, i1 } @llvm.sadd.with.overflow.i64(i64 %0, i64 %pexp.p_div_q986)
  %.obit987 = extractvalue { i64, i1 } %70, 1
  %polly.overflow.state988 = or i1 %.obit987, %polly.overflow.state981
  %.res989 = extractvalue { i64, i1 } %70, 0
  %71 = tail call { i64, i1 } @llvm.ssub.with.overflow.i64(i64 %0, i64 %end)
  %.obit996 = extractvalue { i64, i1 } %71, 1
  %polly.overflow.state997 = or i1 %.obit996, %polly.overflow.state988
  %.res998 = extractvalue { i64, i1 } %71, 0
  %pexp.p_div_q999 = lshr i64 %.res998, 1
  %72 = tail call { i64, i1 } @llvm.ssub.with.overflow.i64(i64 %0, i64 %pexp.p_div_q999)
  %.obit1000 = extractvalue { i64, i1 } %72, 1
  %polly.overflow.state1001 = or i1 %.obit1000, %polly.overflow.state997
  %.res1002 = extractvalue { i64, i1 } %72, 0
  %73 = select i1 %68, i64 %.res989, i64 %.res1002
  %polly.access.call35 = getelementptr i64, i64* %call35, i64 %73
  %polly.access.items1003 = getelementptr i64, i64* %items, i64 %i.0.lcssa
  %74 = icmp ule i64* %polly.access.call35, %polly.access.items1003
  %polly.overflow.state1005 = or i1 %.obit812, %polly.overflow.state1001
  %polly.overflow.state1008 = or i1 %.obit815, %polly.overflow.state1005
  %polly.overflow.state1011 = or i1 %.obit833, %polly.overflow.state1008
  %polly.overflow.state1014 = or i1 %.obit821, %polly.overflow.state1011
  %75 = tail call { i64, i1 } @llvm.ssub.with.overflow.i64(i64 %i.0.lcssa, i64 %start)
  %.obit1016 = extractvalue { i64, i1 } %75, 1
  %polly.overflow.state1017 = or i1 %.obit1016, %polly.overflow.state1014
  %.res1018 = extractvalue { i64, i1 } %75, 0
  %76 = tail call { i64, i1 } @llvm.ssub.with.overflow.i64(i64 %.res1018, i64 %l.0.lcssa)
  %.obit1019 = extractvalue { i64, i1 } %76, 1
  %polly.overflow.state1020 = or i1 %.obit1019, %polly.overflow.state1017
  %.res1021 = extractvalue { i64, i1 } %76, 0
  %77 = tail call { i64, i1 } @llvm.sadd.with.overflow.i64(i64 %.res1021, i64 %pexp.p_div_q986)
  %.obit1026 = extractvalue { i64, i1 } %77, 1
  %polly.overflow.state1027 = or i1 %.obit1026, %polly.overflow.state1020
  %.res1028 = extractvalue { i64, i1 } %77, 0
  %polly.overflow.state1036 = or i1 %.obit980, %polly.overflow.state1027
  %polly.overflow.state1039 = or i1 %.obit996, %polly.overflow.state1036
  %78 = tail call { i64, i1 } @llvm.ssub.with.overflow.i64(i64 %.res1021, i64 %pexp.p_div_q999)
  %.obit1042 = extractvalue { i64, i1 } %78, 1
  %polly.overflow.state1043 = or i1 %.obit1042, %polly.overflow.state1039
  %.res1044 = extractvalue { i64, i1 } %78, 0
  %79 = select i1 %68, i64 %.res1028, i64 %.res1044
  %polly.access.items1045 = getelementptr i64, i64* %items, i64 %79
  %polly.access.call351046 = getelementptr i64, i64* %call35, i64 %l.0.lcssa
  %80 = icmp ule i64* %polly.access.items1045, %polly.access.call351046
  %81 = or i1 %74, %80
  %82 = and i1 %81, %67
  %polly.rtc.overflown1047 = xor i1 %polly.overflow.state1043, true
  %polly.rtc.result1048 = and i1 %82, %polly.rtc.overflown1047
  br i1 %polly.rtc.result1048, label %polly.cond1049, label %if.end119.preheader

if.end119.preheader:                              ; preds = %if.end119.lr.ph
  %83 = sub i64 %div, %l.0.lcssa
  %84 = sub i64 %83, %start
  %min.iters.check = icmp ult i64 %84, 4
  br i1 %min.iters.check, label %if.end119.preheader1199, label %min.iters.checked

if.end119.preheader1199:                          ; preds = %middle.block, %vector.memcheck, %min.iters.checked, %if.end119.preheader
  %i.1314.ph = phi i64 [ %i.0.lcssa, %vector.memcheck ], [ %i.0.lcssa, %min.iters.checked ], [ %i.0.lcssa, %if.end119.preheader ], [ %ind.end, %middle.block ]
  %l.2313.ph = phi i64 [ %l.0.lcssa, %vector.memcheck ], [ %l.0.lcssa, %min.iters.checked ], [ %l.0.lcssa, %if.end119.preheader ], [ %ind.end1148, %middle.block ]
  %85 = add i64 %i.0.lcssa, %div
  %86 = sub i64 %85, %i.1314.ph
  %87 = sub i64 %86, %l.0.lcssa
  %88 = sub i64 %87, %start
  %89 = add i64 %85, -1
  %90 = sub i64 %89, %i.1314.ph
  %91 = sub i64 %90, %l.0.lcssa
  %92 = sub i64 %91, %start
  %xtraiter1202 = and i64 %88, 3
  %lcmp.mod1203 = icmp eq i64 %xtraiter1202, 0
  br i1 %lcmp.mod1203, label %if.end119.prol.loopexit, label %if.end119.prol.preheader

if.end119.prol.preheader:                         ; preds = %if.end119.preheader1199
  br label %if.end119.prol

if.end119.prol:                                   ; preds = %if.end119.prol, %if.end119.prol.preheader
  %i.1314.prol = phi i64 [ %add122.prol, %if.end119.prol ], [ %i.1314.ph, %if.end119.prol.preheader ]
  %l.2313.prol = phi i64 [ %add123.prol, %if.end119.prol ], [ %l.2313.ph, %if.end119.prol.preheader ]
  %prol.iter1204 = phi i64 [ %prol.iter1204.sub, %if.end119.prol ], [ %xtraiter1202, %if.end119.prol.preheader ]
  %arrayidx120.prol = getelementptr inbounds i64, i64* %call35, i64 %l.2313.prol
  %93 = load i64, i64* %arrayidx120.prol, align 8, !tbaa !1
  %arrayidx121.prol = getelementptr inbounds i64, i64* %items, i64 %i.1314.prol
  store i64 %93, i64* %arrayidx121.prol, align 8, !tbaa !1
  %add122.prol = add nsw i64 %i.1314.prol, 1
  %add123.prol = add nsw i64 %l.2313.prol, 1
  %prol.iter1204.sub = add i64 %prol.iter1204, -1
  %prol.iter1204.cmp = icmp eq i64 %prol.iter1204.sub, 0
  br i1 %prol.iter1204.cmp, label %if.end119.prol.loopexit.unr-lcssa, label %if.end119.prol, !llvm.loop !5

if.end119.prol.loopexit.unr-lcssa:                ; preds = %if.end119.prol
  br label %if.end119.prol.loopexit

if.end119.prol.loopexit:                          ; preds = %if.end119.preheader1199, %if.end119.prol.loopexit.unr-lcssa
  %i.1314.unr = phi i64 [ %i.1314.ph, %if.end119.preheader1199 ], [ %add122.prol, %if.end119.prol.loopexit.unr-lcssa ]
  %l.2313.unr = phi i64 [ %l.2313.ph, %if.end119.preheader1199 ], [ %add123.prol, %if.end119.prol.loopexit.unr-lcssa ]
  %94 = icmp ult i64 %92, 3
  br i1 %94, label %while.cond124.preheader.loopexit, label %if.end119.preheader1199.new

if.end119.preheader1199.new:                      ; preds = %if.end119.prol.loopexit
  br label %if.end119

min.iters.checked:                                ; preds = %if.end119.preheader
  %n.vec = and i64 %84, -4
  %cmp.zero = icmp eq i64 %n.vec, 0
  br i1 %cmp.zero, label %if.end119.preheader1199, label %vector.memcheck

vector.memcheck:                                  ; preds = %min.iters.checked
  %scevgep = getelementptr i64, i64* %items, i64 %i.0.lcssa
  %95 = add i64 %i.0.lcssa, %div
  %96 = add i64 %l.0.lcssa, %start
  %97 = sub i64 %95, %96
  %scevgep1141 = getelementptr i64, i64* %items, i64 %97
  %scevgep1143 = getelementptr i64, i64* %call35, i64 %l.0.lcssa
  %scevgep1145 = getelementptr i64, i64* %call35, i64 %sub
  %bound0 = icmp ult i64* %scevgep, %scevgep1145
  %bound1 = icmp ult i64* %scevgep1143, %scevgep1141
  %memcheck.conflict = and i1 %bound0, %bound1
  %ind.end = add i64 %i.0.lcssa, %n.vec
  %ind.end1148 = add i64 %l.0.lcssa, %n.vec
  br i1 %memcheck.conflict, label %if.end119.preheader1199, label %vector.body.preheader

vector.body.preheader:                            ; preds = %vector.memcheck
  %98 = add i64 %n.vec, -4
  %99 = lshr exact i64 %98, 2
  %100 = and i64 %99, 1
  %lcmp.mod1206 = icmp eq i64 %100, 0
  br i1 %lcmp.mod1206, label %vector.body.prol.preheader, label %vector.body.prol.loopexit

vector.body.prol.preheader:                       ; preds = %vector.body.preheader
  br label %vector.body.prol

vector.body.prol:                                 ; preds = %vector.body.prol.preheader
  %101 = getelementptr inbounds i64, i64* %call35, i64 %l.0.lcssa
  %102 = bitcast i64* %101 to <2 x i64>*
  %wide.load.prol = load <2 x i64>, <2 x i64>* %102, align 8, !tbaa !1, !alias.scope !7
  %103 = getelementptr i64, i64* %101, i64 2
  %104 = bitcast i64* %103 to <2 x i64>*
  %wide.load1155.prol = load <2 x i64>, <2 x i64>* %104, align 8, !tbaa !1, !alias.scope !7
  %105 = getelementptr inbounds i64, i64* %items, i64 %i.0.lcssa
  %106 = bitcast i64* %105 to <2 x i64>*
  store <2 x i64> %wide.load.prol, <2 x i64>* %106, align 8, !tbaa !1, !alias.scope !10, !noalias !7
  %107 = getelementptr i64, i64* %105, i64 2
  %108 = bitcast i64* %107 to <2 x i64>*
  store <2 x i64> %wide.load1155.prol, <2 x i64>* %108, align 8, !tbaa !1, !alias.scope !10, !noalias !7
  br label %vector.body.prol.loopexit

vector.body.prol.loopexit:                        ; preds = %vector.body.prol, %vector.body.preheader
  %index.unr = phi i64 [ 0, %vector.body.preheader ], [ 4, %vector.body.prol ]
  %109 = icmp eq i64 %99, 0
  br i1 %109, label %middle.block, label %vector.body.preheader.new

vector.body.preheader.new:                        ; preds = %vector.body.prol.loopexit
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.body.preheader.new
  %index = phi i64 [ %index.unr, %vector.body.preheader.new ], [ %index.next.1, %vector.body ]
  %110 = add i64 %i.0.lcssa, %index
  %111 = add i64 %l.0.lcssa, %index
  %112 = getelementptr inbounds i64, i64* %call35, i64 %111
  %113 = bitcast i64* %112 to <2 x i64>*
  %wide.load = load <2 x i64>, <2 x i64>* %113, align 8, !tbaa !1, !alias.scope !7
  %114 = getelementptr i64, i64* %112, i64 2
  %115 = bitcast i64* %114 to <2 x i64>*
  %wide.load1155 = load <2 x i64>, <2 x i64>* %115, align 8, !tbaa !1, !alias.scope !7
  %116 = getelementptr inbounds i64, i64* %items, i64 %110
  %117 = bitcast i64* %116 to <2 x i64>*
  store <2 x i64> %wide.load, <2 x i64>* %117, align 8, !tbaa !1, !alias.scope !10, !noalias !7
  %118 = getelementptr i64, i64* %116, i64 2
  %119 = bitcast i64* %118 to <2 x i64>*
  store <2 x i64> %wide.load1155, <2 x i64>* %119, align 8, !tbaa !1, !alias.scope !10, !noalias !7
  %index.next = add i64 %index, 4
  %120 = add i64 %i.0.lcssa, %index.next
  %121 = add i64 %l.0.lcssa, %index.next
  %122 = getelementptr inbounds i64, i64* %call35, i64 %121
  %123 = bitcast i64* %122 to <2 x i64>*
  %wide.load.1 = load <2 x i64>, <2 x i64>* %123, align 8, !tbaa !1, !alias.scope !7
  %124 = getelementptr i64, i64* %122, i64 2
  %125 = bitcast i64* %124 to <2 x i64>*
  %wide.load1155.1 = load <2 x i64>, <2 x i64>* %125, align 8, !tbaa !1, !alias.scope !7
  %126 = getelementptr inbounds i64, i64* %items, i64 %120
  %127 = bitcast i64* %126 to <2 x i64>*
  store <2 x i64> %wide.load.1, <2 x i64>* %127, align 8, !tbaa !1, !alias.scope !10, !noalias !7
  %128 = getelementptr i64, i64* %126, i64 2
  %129 = bitcast i64* %128 to <2 x i64>*
  store <2 x i64> %wide.load1155.1, <2 x i64>* %129, align 8, !tbaa !1, !alias.scope !10, !noalias !7
  %index.next.1 = add i64 %index, 8
  %130 = icmp eq i64 %index.next.1, %n.vec
  br i1 %130, label %middle.block.unr-lcssa, label %vector.body, !llvm.loop !12

middle.block.unr-lcssa:                           ; preds = %vector.body
  br label %middle.block

middle.block:                                     ; preds = %vector.body.prol.loopexit, %middle.block.unr-lcssa
  %cmp.n = icmp eq i64 %84, %n.vec
  br i1 %cmp.n, label %while.cond124.preheader, label %if.end119.preheader1199

if.end100:                                        ; preds = %if.end100.preheader, %blklab4
  %i.0322 = phi i64 [ %add112, %blklab4 ], [ 0, %if.end100.preheader ]
  %r.0321 = phi i64 [ %r.1, %blklab4 ], [ 0, %if.end100.preheader ]
  %l.0320 = phi i64 [ %l.1, %blklab4 ], [ 0, %if.end100.preheader ]
  %arrayidx = getelementptr inbounds i64, i64* %call35, i64 %l.0320
  %131 = load i64, i64* %arrayidx, align 8, !tbaa !1
  %arrayidx101 = getelementptr inbounds i64, i64* %call80, i64 %r.0321
  %132 = load i64, i64* %arrayidx101, align 8, !tbaa !1
  %cmp102 = icmp sgt i64 %131, %132
  %arrayidx110 = getelementptr inbounds i64, i64* %items, i64 %i.0322
  br i1 %cmp102, label %blklab3, label %if.end105

if.end105:                                        ; preds = %if.end100
  store i64 %131, i64* %arrayidx110, align 8, !tbaa !1
  %add108 = add nsw i64 %l.0320, 1
  br label %blklab4

blklab3:                                          ; preds = %if.end100
  store i64 %132, i64* %arrayidx110, align 8, !tbaa !1
  %add111 = add nsw i64 %r.0321, 1
  br label %blklab4

blklab4:                                          ; preds = %blklab3, %if.end105
  %l.1 = phi i64 [ %l.0320, %blklab3 ], [ %add108, %if.end105 ]
  %r.1 = phi i64 [ %add111, %blklab3 ], [ %r.0321, %if.end105 ]
  %add112 = add nuw nsw i64 %i.0322, 1
  %cmp87 = icmp slt i64 %add112, %sub86
  %cmp92 = icmp slt i64 %l.1, %sub
  %or.cond = and i1 %cmp87, %cmp92
  %cmp97 = icmp slt i64 %r.1, %sub47
  %or.cond308 = and i1 %cmp97, %or.cond
  br i1 %or.cond308, label %if.end100, label %while.cond113.preheader.loopexit

while.cond124.preheader.loopexit.unr-lcssa:       ; preds = %if.end119
  br label %while.cond124.preheader.loopexit

while.cond124.preheader.loopexit:                 ; preds = %if.end119.prol.loopexit, %while.cond124.preheader.loopexit.unr-lcssa
  br label %while.cond124.preheader

while.cond124.preheader:                          ; preds = %while.cond124.preheader.loopexit, %middle.block, %_sortV1__polly_subfn_3.exit, %_sortV1__polly_subfn_2.exit, %while.cond113.preheader
  %i.1.lcssa.ph = phi i64 [ %i.0.lcssa, %while.cond113.preheader ], [ %10, %_sortV1__polly_subfn_2.exit ], [ %10, %_sortV1__polly_subfn_3.exit ], [ %10, %middle.block ], [ %10, %while.cond124.preheader.loopexit ]
  %cmp127309 = icmp slt i64 %r.0.lcssa, %sub47
  br i1 %cmp127309, label %if.end130.preheader, label %if.end137

if.end130.preheader:                              ; preds = %while.cond124.preheader
  %133 = sub i64 %end, %r.0.lcssa
  %134 = sub i64 %133, %div
  %min.iters.check1159 = icmp ult i64 %134, 4
  br i1 %min.iters.check1159, label %if.end130.preheader1198, label %min.iters.checked1160

if.end130.preheader1198:                          ; preds = %middle.block1157, %vector.memcheck1177, %min.iters.checked1160, %if.end130.preheader
  %i.2311.ph = phi i64 [ %i.1.lcssa.ph, %vector.memcheck1177 ], [ %i.1.lcssa.ph, %min.iters.checked1160 ], [ %i.1.lcssa.ph, %if.end130.preheader ], [ %ind.end1182, %middle.block1157 ]
  %r.2310.ph = phi i64 [ %r.0.lcssa, %vector.memcheck1177 ], [ %r.0.lcssa, %min.iters.checked1160 ], [ %r.0.lcssa, %if.end130.preheader ], [ %ind.end1184, %middle.block1157 ]
  %135 = sub i64 %end, %r.2310.ph
  %136 = sub i64 %135, %div
  %137 = add i64 %end, -1
  %138 = sub i64 %137, %r.2310.ph
  %139 = sub i64 %138, %div
  %xtraiter = and i64 %136, 3
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod, label %if.end130.prol.loopexit, label %if.end130.prol.preheader

if.end130.prol.preheader:                         ; preds = %if.end130.preheader1198
  br label %if.end130.prol

if.end130.prol:                                   ; preds = %if.end130.prol, %if.end130.prol.preheader
  %i.2311.prol = phi i64 [ %add133.prol, %if.end130.prol ], [ %i.2311.ph, %if.end130.prol.preheader ]
  %r.2310.prol = phi i64 [ %add134.prol, %if.end130.prol ], [ %r.2310.ph, %if.end130.prol.preheader ]
  %prol.iter = phi i64 [ %prol.iter.sub, %if.end130.prol ], [ %xtraiter, %if.end130.prol.preheader ]
  %arrayidx131.prol = getelementptr inbounds i64, i64* %call80, i64 %r.2310.prol
  %140 = load i64, i64* %arrayidx131.prol, align 8, !tbaa !1
  %arrayidx132.prol = getelementptr inbounds i64, i64* %items, i64 %i.2311.prol
  store i64 %140, i64* %arrayidx132.prol, align 8, !tbaa !1
  %add133.prol = add nsw i64 %i.2311.prol, 1
  %add134.prol = add nsw i64 %r.2310.prol, 1
  %prol.iter.sub = add i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %if.end130.prol.loopexit.unr-lcssa, label %if.end130.prol, !llvm.loop !15

if.end130.prol.loopexit.unr-lcssa:                ; preds = %if.end130.prol
  br label %if.end130.prol.loopexit

if.end130.prol.loopexit:                          ; preds = %if.end130.preheader1198, %if.end130.prol.loopexit.unr-lcssa
  %i.2311.unr = phi i64 [ %i.2311.ph, %if.end130.preheader1198 ], [ %add133.prol, %if.end130.prol.loopexit.unr-lcssa ]
  %r.2310.unr = phi i64 [ %r.2310.ph, %if.end130.preheader1198 ], [ %add134.prol, %if.end130.prol.loopexit.unr-lcssa ]
  %141 = icmp ult i64 %139, 3
  br i1 %141, label %if.end137.loopexit, label %if.end130.preheader1198.new

if.end130.preheader1198.new:                      ; preds = %if.end130.prol.loopexit
  br label %if.end130

min.iters.checked1160:                            ; preds = %if.end130.preheader
  %n.vec1162 = and i64 %134, -4
  %cmp.zero1163 = icmp eq i64 %n.vec1162, 0
  br i1 %cmp.zero1163, label %if.end130.preheader1198, label %vector.memcheck1177

vector.memcheck1177:                              ; preds = %min.iters.checked1160
  %scevgep1165 = getelementptr i64, i64* %items, i64 %i.1.lcssa.ph
  %142 = add i64 %i.1.lcssa.ph, %end
  %143 = add i64 %r.0.lcssa, %div
  %144 = sub i64 %142, %143
  %scevgep1167 = getelementptr i64, i64* %items, i64 %144
  %scevgep1169 = getelementptr i64, i64* %call80, i64 %r.0.lcssa
  %scevgep1171 = getelementptr i64, i64* %call80, i64 %sub47
  %bound01173 = icmp ult i64* %scevgep1165, %scevgep1171
  %bound11174 = icmp ult i64* %scevgep1169, %scevgep1167
  %memcheck.conflict1176 = and i1 %bound01173, %bound11174
  %ind.end1182 = add i64 %i.1.lcssa.ph, %n.vec1162
  %ind.end1184 = add i64 %r.0.lcssa, %n.vec1162
  br i1 %memcheck.conflict1176, label %if.end130.preheader1198, label %vector.body1156.preheader

vector.body1156.preheader:                        ; preds = %vector.memcheck1177
  %145 = add i64 %n.vec1162, -4
  %146 = lshr exact i64 %145, 2
  %147 = and i64 %146, 1
  %lcmp.mod1201 = icmp eq i64 %147, 0
  br i1 %lcmp.mod1201, label %vector.body1156.prol.preheader, label %vector.body1156.prol.loopexit

vector.body1156.prol.preheader:                   ; preds = %vector.body1156.preheader
  br label %vector.body1156.prol

vector.body1156.prol:                             ; preds = %vector.body1156.prol.preheader
  %148 = getelementptr inbounds i64, i64* %call80, i64 %r.0.lcssa
  %149 = bitcast i64* %148 to <2 x i64>*
  %wide.load1196.prol = load <2 x i64>, <2 x i64>* %149, align 8, !tbaa !1, !alias.scope !16
  %150 = getelementptr i64, i64* %148, i64 2
  %151 = bitcast i64* %150 to <2 x i64>*
  %wide.load1197.prol = load <2 x i64>, <2 x i64>* %151, align 8, !tbaa !1, !alias.scope !16
  %152 = getelementptr inbounds i64, i64* %items, i64 %i.1.lcssa.ph
  %153 = bitcast i64* %152 to <2 x i64>*
  store <2 x i64> %wide.load1196.prol, <2 x i64>* %153, align 8, !tbaa !1, !alias.scope !19, !noalias !16
  %154 = getelementptr i64, i64* %152, i64 2
  %155 = bitcast i64* %154 to <2 x i64>*
  store <2 x i64> %wide.load1197.prol, <2 x i64>* %155, align 8, !tbaa !1, !alias.scope !19, !noalias !16
  br label %vector.body1156.prol.loopexit

vector.body1156.prol.loopexit:                    ; preds = %vector.body1156.prol, %vector.body1156.preheader
  %index1179.unr = phi i64 [ 0, %vector.body1156.preheader ], [ 4, %vector.body1156.prol ]
  %156 = icmp eq i64 %146, 0
  br i1 %156, label %middle.block1157, label %vector.body1156.preheader.new

vector.body1156.preheader.new:                    ; preds = %vector.body1156.prol.loopexit
  br label %vector.body1156

vector.body1156:                                  ; preds = %vector.body1156, %vector.body1156.preheader.new
  %index1179 = phi i64 [ %index1179.unr, %vector.body1156.preheader.new ], [ %index.next1180.1, %vector.body1156 ]
  %157 = add i64 %i.1.lcssa.ph, %index1179
  %158 = add i64 %r.0.lcssa, %index1179
  %159 = getelementptr inbounds i64, i64* %call80, i64 %158
  %160 = bitcast i64* %159 to <2 x i64>*
  %wide.load1196 = load <2 x i64>, <2 x i64>* %160, align 8, !tbaa !1, !alias.scope !16
  %161 = getelementptr i64, i64* %159, i64 2
  %162 = bitcast i64* %161 to <2 x i64>*
  %wide.load1197 = load <2 x i64>, <2 x i64>* %162, align 8, !tbaa !1, !alias.scope !16
  %163 = getelementptr inbounds i64, i64* %items, i64 %157
  %164 = bitcast i64* %163 to <2 x i64>*
  store <2 x i64> %wide.load1196, <2 x i64>* %164, align 8, !tbaa !1, !alias.scope !19, !noalias !16
  %165 = getelementptr i64, i64* %163, i64 2
  %166 = bitcast i64* %165 to <2 x i64>*
  store <2 x i64> %wide.load1197, <2 x i64>* %166, align 8, !tbaa !1, !alias.scope !19, !noalias !16
  %index.next1180 = add i64 %index1179, 4
  %167 = add i64 %i.1.lcssa.ph, %index.next1180
  %168 = add i64 %r.0.lcssa, %index.next1180
  %169 = getelementptr inbounds i64, i64* %call80, i64 %168
  %170 = bitcast i64* %169 to <2 x i64>*
  %wide.load1196.1 = load <2 x i64>, <2 x i64>* %170, align 8, !tbaa !1, !alias.scope !16
  %171 = getelementptr i64, i64* %169, i64 2
  %172 = bitcast i64* %171 to <2 x i64>*
  %wide.load1197.1 = load <2 x i64>, <2 x i64>* %172, align 8, !tbaa !1, !alias.scope !16
  %173 = getelementptr inbounds i64, i64* %items, i64 %167
  %174 = bitcast i64* %173 to <2 x i64>*
  store <2 x i64> %wide.load1196.1, <2 x i64>* %174, align 8, !tbaa !1, !alias.scope !19, !noalias !16
  %175 = getelementptr i64, i64* %173, i64 2
  %176 = bitcast i64* %175 to <2 x i64>*
  store <2 x i64> %wide.load1197.1, <2 x i64>* %176, align 8, !tbaa !1, !alias.scope !19, !noalias !16
  %index.next1180.1 = add i64 %index1179, 8
  %177 = icmp eq i64 %index.next1180.1, %n.vec1162
  br i1 %177, label %middle.block1157.unr-lcssa, label %vector.body1156, !llvm.loop !21

middle.block1157.unr-lcssa:                       ; preds = %vector.body1156
  br label %middle.block1157

middle.block1157:                                 ; preds = %vector.body1156.prol.loopexit, %middle.block1157.unr-lcssa
  %cmp.n1185 = icmp eq i64 %134, %n.vec1162
  br i1 %cmp.n1185, label %if.end137, label %if.end130.preheader1198

if.end119:                                        ; preds = %if.end119, %if.end119.preheader1199.new
  %i.1314 = phi i64 [ %i.1314.unr, %if.end119.preheader1199.new ], [ %add122.3, %if.end119 ]
  %l.2313 = phi i64 [ %l.2313.unr, %if.end119.preheader1199.new ], [ %add123.3, %if.end119 ]
  %arrayidx120 = getelementptr inbounds i64, i64* %call35, i64 %l.2313
  %178 = load i64, i64* %arrayidx120, align 8, !tbaa !1
  %arrayidx121 = getelementptr inbounds i64, i64* %items, i64 %i.1314
  store i64 %178, i64* %arrayidx121, align 8, !tbaa !1
  %add122 = add nsw i64 %i.1314, 1
  %add123 = add nsw i64 %l.2313, 1
  %arrayidx120.1 = getelementptr inbounds i64, i64* %call35, i64 %add123
  %179 = load i64, i64* %arrayidx120.1, align 8, !tbaa !1
  %arrayidx121.1 = getelementptr inbounds i64, i64* %items, i64 %add122
  store i64 %179, i64* %arrayidx121.1, align 8, !tbaa !1
  %add122.1 = add nsw i64 %i.1314, 2
  %add123.1 = add nsw i64 %l.2313, 2
  %arrayidx120.2 = getelementptr inbounds i64, i64* %call35, i64 %add123.1
  %180 = load i64, i64* %arrayidx120.2, align 8, !tbaa !1
  %arrayidx121.2 = getelementptr inbounds i64, i64* %items, i64 %add122.1
  store i64 %180, i64* %arrayidx121.2, align 8, !tbaa !1
  %add122.2 = add nsw i64 %i.1314, 3
  %add123.2 = add nsw i64 %l.2313, 3
  %arrayidx120.3 = getelementptr inbounds i64, i64* %call35, i64 %add123.2
  %181 = load i64, i64* %arrayidx120.3, align 8, !tbaa !1
  %arrayidx121.3 = getelementptr inbounds i64, i64* %items, i64 %add122.2
  store i64 %181, i64* %arrayidx121.3, align 8, !tbaa !1
  %add122.3 = add nsw i64 %i.1314, 4
  %add123.3 = add nsw i64 %l.2313, 4
  %exitcond331.3 = icmp eq i64 %add122.3, %10
  br i1 %exitcond331.3, label %while.cond124.preheader.loopexit.unr-lcssa, label %if.end119, !llvm.loop !22

if.end130:                                        ; preds = %if.end130, %if.end130.preheader1198.new
  %i.2311 = phi i64 [ %i.2311.unr, %if.end130.preheader1198.new ], [ %add133.3, %if.end130 ]
  %r.2310 = phi i64 [ %r.2310.unr, %if.end130.preheader1198.new ], [ %add134.3, %if.end130 ]
  %arrayidx131 = getelementptr inbounds i64, i64* %call80, i64 %r.2310
  %182 = load i64, i64* %arrayidx131, align 8, !tbaa !1
  %arrayidx132 = getelementptr inbounds i64, i64* %items, i64 %i.2311
  store i64 %182, i64* %arrayidx132, align 8, !tbaa !1
  %add133 = add nsw i64 %i.2311, 1
  %add134 = add nsw i64 %r.2310, 1
  %arrayidx131.1 = getelementptr inbounds i64, i64* %call80, i64 %add134
  %183 = load i64, i64* %arrayidx131.1, align 8, !tbaa !1
  %arrayidx132.1 = getelementptr inbounds i64, i64* %items, i64 %add133
  store i64 %183, i64* %arrayidx132.1, align 8, !tbaa !1
  %add133.1 = add nsw i64 %i.2311, 2
  %add134.1 = add nsw i64 %r.2310, 2
  %arrayidx131.2 = getelementptr inbounds i64, i64* %call80, i64 %add134.1
  %184 = load i64, i64* %arrayidx131.2, align 8, !tbaa !1
  %arrayidx132.2 = getelementptr inbounds i64, i64* %items, i64 %add133.1
  store i64 %184, i64* %arrayidx132.2, align 8, !tbaa !1
  %add133.2 = add nsw i64 %i.2311, 3
  %add134.2 = add nsw i64 %r.2310, 3
  %arrayidx131.3 = getelementptr inbounds i64, i64* %call80, i64 %add134.2
  %185 = load i64, i64* %arrayidx131.3, align 8, !tbaa !1
  %arrayidx132.3 = getelementptr inbounds i64, i64* %items, i64 %add133.2
  store i64 %185, i64* %arrayidx132.3, align 8, !tbaa !1
  %add133.3 = add nsw i64 %i.2311, 4
  %add134.3 = add nsw i64 %r.2310, 4
  %exitcond.3 = icmp eq i64 %add134.3, %sub47
  br i1 %exitcond.3, label %if.end137.loopexit.unr-lcssa, label %if.end130, !llvm.loop !23

if.end137.loopexit.unr-lcssa:                     ; preds = %if.end130
  br label %if.end137.loopexit

if.end137.loopexit:                               ; preds = %if.end130.prol.loopexit, %if.end137.loopexit.unr-lcssa
  br label %if.end137

if.end137:                                        ; preds = %if.end137.loopexit, %middle.block1157, %while.cond124.preheader
  br i1 %cmp36, label %if.end140, label %if.then139

if.then139:                                       ; preds = %if.end137
  call void @free(i8* %phitmp) #8
  br label %if.end140

if.end140:                                        ; preds = %if.end137, %if.then139
  br i1 %not.cmp81, label %if.end143, label %if.then142

if.then142:                                       ; preds = %if.end140
  call void @free(i8* %phitmp326) #8
  br label %if.end143

if.end143:                                        ; preds = %if.end140, %if.then142
  br i1 %not.cmp5, label %if.end146, label %if.then145

if.then145:                                       ; preds = %if.end143
  call void @free(i8* %phitmp327) #8
  br label %if.end146

if.end146:                                        ; preds = %if.end143, %if.then145
  br i1 %p_not.cmp27, label %if.end149, label %if.then148

if.then148:                                       ; preds = %if.end146
  call void @free(i8* %phitmp328) #8
  br label %if.end149

if.end149:                                        ; preds = %if.end146, %if.then148
  br i1 %not.cmp48, label %if.end152, label %if.then151

if.then151:                                       ; preds = %if.end149
  call void @free(i8* %phitmp329) #8
  br label %if.end152

if.end152:                                        ; preds = %if.end149, %if.then151
  br i1 %p_not.cmp72, label %if.end155, label %if.then154

if.then154:                                       ; preds = %if.end152
  call void @free(i8* %phitmp330) #8
  br label %if.end155

if.end155:                                        ; preds = %if.end152, %entry, %if.then154
  store i64 %items_size, i64* %_size_call_by_ref, align 8, !tbaa !1
  call void @llvm.lifetime.end(i64 8, i8* nonnull %2) #8
  call void @llvm.lifetime.end(i64 8, i8* nonnull %1) #8
  ret i64* %items

polly.cond1049:                                   ; preds = %if.end119.lr.ph
  %186 = sub nsw i64 %0, %l.0.lcssa
  br i1 %18, label %polly.parallel.for1053, label %polly.parallel.for1063

polly.parallel.for1053:                           ; preds = %polly.cond1049
  %187 = sub nsw i64 %186, %pexp.p_div_q999
  %188 = bitcast { i64, i64, i64, i64, i64*, i64*, i64 }* %polly.par.userContext1055 to i8*
  call void @llvm.lifetime.start(i64 56, i8* nonnull %188)
  %polly.subfn.storeaddr.i.0.lcssa1056 = getelementptr inbounds { i64, i64, i64, i64, i64*, i64*, i64 }, { i64, i64, i64, i64, i64*, i64*, i64 }* %polly.par.userContext1055, i64 0, i32 0
  store i64 %i.0.lcssa, i64* %polly.subfn.storeaddr.i.0.lcssa1056, align 8
  %polly.subfn.storeaddr.start1057 = getelementptr inbounds { i64, i64, i64, i64, i64*, i64*, i64 }, { i64, i64, i64, i64, i64*, i64*, i64 }* %polly.par.userContext1055, i64 0, i32 1
  store i64 %start, i64* %polly.subfn.storeaddr.start1057, align 8
  %polly.subfn.storeaddr.l.0.lcssa1058 = getelementptr inbounds { i64, i64, i64, i64, i64*, i64*, i64 }, { i64, i64, i64, i64, i64*, i64*, i64 }* %polly.par.userContext1055, i64 0, i32 2
  store i64 %l.0.lcssa, i64* %polly.subfn.storeaddr.l.0.lcssa1058, align 8
  %polly.subfn.storeaddr.end1059 = getelementptr inbounds { i64, i64, i64, i64, i64*, i64*, i64 }, { i64, i64, i64, i64, i64*, i64*, i64 }* %polly.par.userContext1055, i64 0, i32 3
  store i64 %end, i64* %polly.subfn.storeaddr.end1059, align 8
  %polly.subfn.storeaddr.call35 = getelementptr inbounds { i64, i64, i64, i64, i64*, i64*, i64 }, { i64, i64, i64, i64, i64*, i64*, i64 }* %polly.par.userContext1055, i64 0, i32 4
  store i64* %call35, i64** %polly.subfn.storeaddr.call35, align 8
  %polly.subfn.storeaddr.items1060 = getelementptr inbounds { i64, i64, i64, i64, i64*, i64*, i64 }, { i64, i64, i64, i64, i64*, i64*, i64 }* %polly.par.userContext1055, i64 0, i32 5
  store i64* %items, i64** %polly.subfn.storeaddr.items1060, align 8
  %polly.subfn.storeaddr.div1061 = getelementptr inbounds { i64, i64, i64, i64, i64*, i64*, i64 }, { i64, i64, i64, i64, i64*, i64*, i64 }* %polly.par.userContext1055, i64 0, i32 6
  store i64 %div, i64* %polly.subfn.storeaddr.div1061, align 8
  call void @GOMP_parallel_loop_runtime_start(void (i8*)* nonnull @_sortV1__polly_subfn_2, i8* nonnull %188, i32 0, i64 0, i64 %187, i64 1) #8
  %189 = bitcast i64* %polly.par.LBPtr.i1082 to i8*
  call void @llvm.lifetime.start(i64 8, i8* nonnull %189)
  %190 = bitcast i64* %polly.par.UBPtr.i1083 to i8*
  call void @llvm.lifetime.start(i64 8, i8* nonnull %190)
  %polly.subfunc.arg.i.0.lcssa.i1084 = load i64, i64* %polly.subfn.storeaddr.i.0.lcssa1056, align 8
  %polly.subfunc.arg.l.0.lcssa.i1085 = load i64, i64* %polly.subfn.storeaddr.l.0.lcssa1058, align 8
  %polly.subfunc.arg.call35.i1086 = load i64*, i64** %polly.subfn.storeaddr.call35, align 8
  %polly.subfunc.arg.items.i1087 = load i64*, i64** %polly.subfn.storeaddr.items1060, align 8
  %191 = call i8 @GOMP_loop_runtime_next(i64* nonnull %polly.par.LBPtr.i1082, i64* nonnull %polly.par.UBPtr.i1083) #8
  %192 = icmp eq i8 %191, 0
  br i1 %192, label %_sortV1__polly_subfn_2.exit, label %polly.par.loadIVBounds.preheader.i1090

polly.par.loadIVBounds.preheader.i1090:           ; preds = %polly.parallel.for1053
  %scevgep.i1088 = getelementptr i64, i64* %polly.subfunc.arg.call35.i1086, i64 %polly.subfunc.arg.l.0.lcssa.i1085
  %scevgep3.i1089 = getelementptr i64, i64* %polly.subfunc.arg.items.i1087, i64 %polly.subfunc.arg.i.0.lcssa.i1084
  br label %polly.par.loadIVBounds.i1095

polly.par.checkNext.loopexit.i1091:               ; preds = %polly.loop_header.i1102
  %193 = call i8 @GOMP_loop_runtime_next(i64* nonnull %polly.par.LBPtr.i1082, i64* nonnull %polly.par.UBPtr.i1083) #8
  %194 = icmp eq i8 %193, 0
  br i1 %194, label %_sortV1__polly_subfn_2.exit.loopexit, label %polly.par.loadIVBounds.i1095

polly.par.loadIVBounds.i1095:                     ; preds = %polly.par.checkNext.loopexit.i1091, %polly.par.loadIVBounds.preheader.i1090
  %polly.par.UB.i1092 = load i64, i64* %polly.par.UBPtr.i1083, align 8
  %polly.par.LB.i1093 = load i64, i64* %polly.par.LBPtr.i1082, align 8
  %polly.adjust_ub.i1094 = add i64 %polly.par.UB.i1092, -2
  br label %polly.loop_header.i1102

polly.loop_header.i1102:                          ; preds = %polly.loop_header.i1102, %polly.par.loadIVBounds.i1095
  %polly.indvar.i1096 = phi i64 [ %polly.par.LB.i1093, %polly.par.loadIVBounds.i1095 ], [ %polly.indvar_next.i1100, %polly.loop_header.i1102 ]
  %scevgep2.i1097 = getelementptr i64, i64* %scevgep.i1088, i64 %polly.indvar.i1096
  %_p_scalar_.i1098 = load i64, i64* %scevgep2.i1097, align 8, !alias.scope !24, !noalias !26
  %scevgep4.i1099 = getelementptr i64, i64* %scevgep3.i1089, i64 %polly.indvar.i1096
  store i64 %_p_scalar_.i1098, i64* %scevgep4.i1099, align 8, !alias.scope !27, !noalias !28
  %polly.indvar_next.i1100 = add nsw i64 %polly.indvar.i1096, 1
  %polly.loop_cond.i1101 = icmp sgt i64 %polly.indvar.i1096, %polly.adjust_ub.i1094
  br i1 %polly.loop_cond.i1101, label %polly.par.checkNext.loopexit.i1091, label %polly.loop_header.i1102

_sortV1__polly_subfn_2.exit.loopexit:             ; preds = %polly.par.checkNext.loopexit.i1091
  br label %_sortV1__polly_subfn_2.exit

_sortV1__polly_subfn_2.exit:                      ; preds = %_sortV1__polly_subfn_2.exit.loopexit, %polly.parallel.for1053
  call void @GOMP_loop_end_nowait() #8
  call void @llvm.lifetime.end(i64 8, i8* nonnull %189)
  call void @llvm.lifetime.end(i64 8, i8* nonnull %190)
  call void @GOMP_parallel_end() #8
  call void @llvm.lifetime.end(i64 8, i8* nonnull %188)
  br label %while.cond124.preheader

polly.parallel.for1063:                           ; preds = %polly.cond1049
  %195 = bitcast { i64, i64, i64, i64, i64*, i64*, i64 }* %polly.par.userContext1065 to i8*
  call void @llvm.lifetime.start(i64 56, i8* nonnull %195)
  %polly.subfn.storeaddr.i.0.lcssa1066 = getelementptr inbounds { i64, i64, i64, i64, i64*, i64*, i64 }, { i64, i64, i64, i64, i64*, i64*, i64 }* %polly.par.userContext1065, i64 0, i32 0
  store i64 %i.0.lcssa, i64* %polly.subfn.storeaddr.i.0.lcssa1066, align 8
  %polly.subfn.storeaddr.start1067 = getelementptr inbounds { i64, i64, i64, i64, i64*, i64*, i64 }, { i64, i64, i64, i64, i64*, i64*, i64 }* %polly.par.userContext1065, i64 0, i32 1
  store i64 %start, i64* %polly.subfn.storeaddr.start1067, align 8
  %polly.subfn.storeaddr.l.0.lcssa1068 = getelementptr inbounds { i64, i64, i64, i64, i64*, i64*, i64 }, { i64, i64, i64, i64, i64*, i64*, i64 }* %polly.par.userContext1065, i64 0, i32 2
  store i64 %l.0.lcssa, i64* %polly.subfn.storeaddr.l.0.lcssa1068, align 8
  %polly.subfn.storeaddr.end1069 = getelementptr inbounds { i64, i64, i64, i64, i64*, i64*, i64 }, { i64, i64, i64, i64, i64*, i64*, i64 }* %polly.par.userContext1065, i64 0, i32 3
  store i64 %end, i64* %polly.subfn.storeaddr.end1069, align 8
  %polly.subfn.storeaddr.call351070 = getelementptr inbounds { i64, i64, i64, i64, i64*, i64*, i64 }, { i64, i64, i64, i64, i64*, i64*, i64 }* %polly.par.userContext1065, i64 0, i32 4
  store i64* %call35, i64** %polly.subfn.storeaddr.call351070, align 8
  %polly.subfn.storeaddr.items1071 = getelementptr inbounds { i64, i64, i64, i64, i64*, i64*, i64 }, { i64, i64, i64, i64, i64*, i64*, i64 }* %polly.par.userContext1065, i64 0, i32 5
  store i64* %items, i64** %polly.subfn.storeaddr.items1071, align 8
  %polly.subfn.storeaddr.div1072 = getelementptr inbounds { i64, i64, i64, i64, i64*, i64*, i64 }, { i64, i64, i64, i64, i64*, i64*, i64 }* %polly.par.userContext1065, i64 0, i32 6
  store i64 %div, i64* %polly.subfn.storeaddr.div1072, align 8
  %196 = add i64 %186, %pexp.p_div_q986
  call void @GOMP_parallel_loop_runtime_start(void (i8*)* nonnull @_sortV1__polly_subfn_3, i8* nonnull %195, i32 0, i64 0, i64 %196, i64 1) #8
  %197 = bitcast i64* %polly.par.LBPtr.i to i8*
  call void @llvm.lifetime.start(i64 8, i8* nonnull %197)
  %198 = bitcast i64* %polly.par.UBPtr.i to i8*
  call void @llvm.lifetime.start(i64 8, i8* nonnull %198)
  %polly.subfunc.arg.i.0.lcssa.i = load i64, i64* %polly.subfn.storeaddr.i.0.lcssa1066, align 8
  %polly.subfunc.arg.l.0.lcssa.i = load i64, i64* %polly.subfn.storeaddr.l.0.lcssa1068, align 8
  %polly.subfunc.arg.call35.i = load i64*, i64** %polly.subfn.storeaddr.call351070, align 8
  %polly.subfunc.arg.items.i = load i64*, i64** %polly.subfn.storeaddr.items1071, align 8
  %199 = call i8 @GOMP_loop_runtime_next(i64* nonnull %polly.par.LBPtr.i, i64* nonnull %polly.par.UBPtr.i) #8
  %200 = icmp eq i8 %199, 0
  br i1 %200, label %_sortV1__polly_subfn_3.exit, label %polly.par.loadIVBounds.preheader.i

polly.par.loadIVBounds.preheader.i:               ; preds = %polly.parallel.for1063
  %scevgep.i = getelementptr i64, i64* %polly.subfunc.arg.call35.i, i64 %polly.subfunc.arg.l.0.lcssa.i
  %scevgep3.i = getelementptr i64, i64* %polly.subfunc.arg.items.i, i64 %polly.subfunc.arg.i.0.lcssa.i
  br label %polly.par.loadIVBounds.i

polly.par.checkNext.loopexit.i:                   ; preds = %polly.loop_header.i
  %201 = call i8 @GOMP_loop_runtime_next(i64* nonnull %polly.par.LBPtr.i, i64* nonnull %polly.par.UBPtr.i) #8
  %202 = icmp eq i8 %201, 0
  br i1 %202, label %_sortV1__polly_subfn_3.exit.loopexit, label %polly.par.loadIVBounds.i

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

_sortV1__polly_subfn_3.exit:                      ; preds = %_sortV1__polly_subfn_3.exit.loopexit, %polly.parallel.for1063
  call void @GOMP_loop_end_nowait() #8
  call void @llvm.lifetime.end(i64 8, i8* nonnull %197)
  call void @llvm.lifetime.end(i64 8, i8* nonnull %198)
  call void @GOMP_parallel_end() #8
  call void @llvm.lifetime.end(i64 8, i8* nonnull %195)
  br label %while.cond124.preheader
}

; Function Attrs: argmemonly nounwind
declare void @llvm.lifetime.start(i64, i8* nocapture) #1

; Function Attrs: nounwind
declare void @free(i8* nocapture) local_unnamed_addr #2

declare i64* @slice(i64*, i64, i32, i32) local_unnamed_addr #3

declare i64* @copy1DArray_int64_t(i64*, i64) local_unnamed_addr #3

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
  %4 = load i64, i64* %call3, align 8, !tbaa !1
  %call22 = call i64* @create1DArray_int64_t(i64 0, i64 %4) #8
  %not.cmp23 = icmp eq i64* %call22, null
  %call30 = call i64* @copy1DArray_int64_t(i64* %call22, i64 %4) #8
  %cmp35200 = icmp sgt i64 %4, 0
  br i1 %cmp35200, label %polly.parallel.for, label %polly.split_new_and_old

polly.split_new_and_old:                          ; preds = %entry, %main_polly_subfn.exit
  %call43 = call i64* @copy1DArray_int64_t(i64* %call30, i64 %4) #8
  %call44 = call i64* @_sortV1_(i64* %call43, i64 %4, i1 zeroext undef, i64 0, i64 %4, i64* nonnull %_15_size)
  %5 = icmp eq i64* %call30, null
  %p_not.cmp48 = icmp eq i64* %call44, null
  br i1 %5, label %blklab9, label %if.end47

if.end47:                                         ; preds = %polly.split_new_and_old
  %6 = bitcast i64* %call30 to i8*
  call void @free(i8* %6) #8
  br label %blklab9

blklab9:                                          ; preds = %if.end47, %polly.split_new_and_old
  %7 = load i64, i64* %_15_size, align 8, !tbaa !1
  %call55 = call i64* @copy1DArray_int64_t(i64* %call44, i64 %7) #8
  %not.cmp56 = icmp eq i64* %call55, null
  %8 = load i64, i64* %call55, align 8, !tbaa !1
  %call61 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str, i64 0, i64 0), i64 %8)
  %sub62 = add nsw i64 %4, -1
  %arrayidx63 = getelementptr inbounds i64, i64* %call55, i64 %sub62
  %9 = load i64, i64* %arrayidx63, align 8, !tbaa !1
  %call64 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str, i64 0, i64 0), i64 %9)
  %call68 = call i64* @create1DArray_int64_t(i64 0, i64 24) #8
  %10 = bitcast i64* %call68 to <2 x i64>*
  store <2 x i64> <i64 80, i64 97>, <2 x i64>* %10, align 8, !tbaa !1
  %arrayidx71 = getelementptr inbounds i64, i64* %call68, i64 2
  %11 = bitcast i64* %arrayidx71 to <2 x i64>*
  store <2 x i64> <i64 115, i64 115>, <2 x i64>* %11, align 8, !tbaa !1
  %arrayidx73 = getelementptr inbounds i64, i64* %call68, i64 4
  %12 = bitcast i64* %arrayidx73 to <2 x i64>*
  store <2 x i64> <i64 32, i64 77>, <2 x i64>* %12, align 8, !tbaa !1
  %arrayidx75 = getelementptr inbounds i64, i64* %call68, i64 6
  %13 = bitcast i64* %arrayidx75 to <2 x i64>*
  store <2 x i64> <i64 101, i64 114>, <2 x i64>* %13, align 8, !tbaa !1
  %arrayidx77 = getelementptr inbounds i64, i64* %call68, i64 8
  %14 = bitcast i64* %arrayidx77 to <2 x i64>*
  store <2 x i64> <i64 103, i64 101>, <2 x i64>* %14, align 8, !tbaa !1
  %arrayidx79 = getelementptr inbounds i64, i64* %call68, i64 10
  %15 = bitcast i64* %arrayidx79 to <2 x i64>*
  store <2 x i64> <i64 115, i64 111>, <2 x i64>* %15, align 8, !tbaa !1
  %arrayidx81 = getelementptr inbounds i64, i64* %call68, i64 12
  %16 = bitcast i64* %arrayidx81 to <2 x i64>*
  store <2 x i64> <i64 114, i64 116>, <2 x i64>* %16, align 8, !tbaa !1
  %arrayidx83 = getelementptr inbounds i64, i64* %call68, i64 14
  %17 = bitcast i64* %arrayidx83 to <2 x i64>*
  store <2 x i64> <i64 32, i64 116>, <2 x i64>* %17, align 8, !tbaa !1
  %arrayidx85 = getelementptr inbounds i64, i64* %call68, i64 16
  %18 = bitcast i64* %arrayidx85 to <2 x i64>*
  store <2 x i64> <i64 101, i64 115>, <2 x i64>* %18, align 8, !tbaa !1
  %arrayidx87 = getelementptr inbounds i64, i64* %call68, i64 18
  %19 = bitcast i64* %arrayidx87 to <2 x i64>*
  store <2 x i64> <i64 116, i64 32>, <2 x i64>* %19, align 8, !tbaa !1
  %arrayidx89 = getelementptr inbounds i64, i64* %call68, i64 20
  %20 = bitcast i64* %arrayidx89 to <2 x i64>*
  store <2 x i64> <i64 99, i64 97>, <2 x i64>* %20, align 8, !tbaa !1
  %arrayidx91 = getelementptr inbounds i64, i64* %call68, i64 22
  %21 = bitcast i64* %arrayidx91 to <2 x i64>*
  store <2 x i64> <i64 115, i64 101>, <2 x i64>* %21, align 8, !tbaa !1
  %not.cmp93 = icmp eq i64* %call68, null
  call void @println_s(i64* %call68, i64 24) #8
  %phitmp = bitcast i64* %call68 to i8*
  %phitmp194 = bitcast i64* %call44 to i8*
  %phitmp195 = bitcast i64* %call22 to i8*
  br i1 %not.cmp56, label %if.end102, label %if.then101

if.then101:                                       ; preds = %blklab9
  %phitmp196 = bitcast i64* %call55 to i8*
  call void @free(i8* %phitmp196) #8
  br label %if.end102

if.end102:                                        ; preds = %blklab9, %if.then101
  br i1 %not.cmp4, label %if.end105, label %if.then104

if.then104:                                       ; preds = %if.end102
  %22 = bitcast i64* %call3 to i8*
  call void @free(i8* %22) #8
  br label %if.end105

if.end105:                                        ; preds = %if.end102, %if.then104
  br i1 %not.cmp, label %if.end111, label %if.then107

if.then107:                                       ; preds = %if.end105
  %23 = load i64, i64* %_6_size, align 8, !tbaa !1
  call void @free2DArray_int64_t(i64** nonnull %call, i64 %23) #8
  br label %if.end111

if.end111:                                        ; preds = %if.end105, %if.then107
  br i1 %not.cmp23, label %if.end114, label %if.then113

if.then113:                                       ; preds = %if.end111
  call void @free(i8* %phitmp195) #8
  br label %if.end114

if.end114:                                        ; preds = %if.end111, %if.then113
  br i1 %p_not.cmp48, label %if.end117, label %if.then116

if.then116:                                       ; preds = %if.end114
  call void @free(i8* %phitmp194) #8
  br label %if.end117

if.end117:                                        ; preds = %if.end114, %if.then116
  br i1 %not.cmp93, label %if.end120, label %if.then119

if.then119:                                       ; preds = %if.end117
  call void @free(i8* %phitmp) #8
  br label %if.end120

if.end120:                                        ; preds = %if.end117, %if.then119
  call void @exit(i32 0) #9
  unreachable

polly.parallel.for:                               ; preds = %entry
  %24 = bitcast { i64, i64* }* %polly.par.userContext to i8*
  call void @llvm.lifetime.start(i64 16, i8* nonnull %24)
  %polly.subfn.storeaddr. = getelementptr inbounds { i64, i64* }, { i64, i64* }* %polly.par.userContext, i64 0, i32 0
  store i64 %4, i64* %polly.subfn.storeaddr., align 8
  %polly.subfn.storeaddr.call30 = getelementptr inbounds { i64, i64* }, { i64, i64* }* %polly.par.userContext, i64 0, i32 1
  store i64* %call30, i64** %polly.subfn.storeaddr.call30, align 8
  call void @GOMP_parallel_loop_runtime_start(void (i8*)* nonnull @main_polly_subfn, i8* nonnull %24, i32 0, i64 0, i64 %4, i64 1) #8
  %25 = bitcast i64* %polly.par.LBPtr.i to i8*
  call void @llvm.lifetime.start(i64 8, i8* nonnull %25)
  %26 = bitcast i64* %polly.par.UBPtr.i to i8*
  call void @llvm.lifetime.start(i64 8, i8* nonnull %26)
  %polly.subfunc.arg..i = load i64, i64* %polly.subfn.storeaddr., align 8
  %polly.subfunc.arg.call30.i = load i64*, i64** %polly.subfn.storeaddr.call30, align 8
  %27 = call i8 @GOMP_loop_runtime_next(i64* nonnull %polly.par.LBPtr.i, i64* nonnull %polly.par.UBPtr.i) #8
  %28 = icmp eq i8 %27, 0
  br i1 %28, label %main_polly_subfn.exit, label %polly.par.loadIVBounds.i.preheader

polly.par.loadIVBounds.i.preheader:               ; preds = %polly.parallel.for
  br label %polly.par.loadIVBounds.i

polly.par.checkNext.loopexit.i:                   ; preds = %polly.loop_header.i
  %29 = call i8 @GOMP_loop_runtime_next(i64* nonnull %polly.par.LBPtr.i, i64* nonnull %polly.par.UBPtr.i) #8
  %30 = icmp eq i8 %29, 0
  br i1 %30, label %main_polly_subfn.exit.loopexit, label %polly.par.loadIVBounds.i

polly.par.loadIVBounds.i:                         ; preds = %polly.par.loadIVBounds.i.preheader, %polly.par.checkNext.loopexit.i
  %polly.par.UB.i = load i64, i64* %polly.par.UBPtr.i, align 8
  %polly.par.LB.i = load i64, i64* %polly.par.LBPtr.i, align 8
  %polly.adjust_ub.i = add i64 %polly.par.UB.i, -2
  br label %polly.loop_header.i

polly.loop_header.i:                              ; preds = %polly.loop_header.i, %polly.par.loadIVBounds.i
  %polly.indvar.i = phi i64 [ %polly.par.LB.i, %polly.par.loadIVBounds.i ], [ %polly.indvar_next.i, %polly.loop_header.i ]
  %scevgep.i = getelementptr i64, i64* %polly.subfunc.arg.call30.i, i64 %polly.indvar.i
  %31 = sub i64 %polly.subfunc.arg..i, %polly.indvar.i
  store i64 %31, i64* %scevgep.i, align 8, !alias.scope !36, !noalias !38
  %polly.indvar_next.i = add nsw i64 %polly.indvar.i, 1
  %polly.loop_cond.i = icmp sgt i64 %polly.indvar.i, %polly.adjust_ub.i
  br i1 %polly.loop_cond.i, label %polly.par.checkNext.loopexit.i, label %polly.loop_header.i

main_polly_subfn.exit.loopexit:                   ; preds = %polly.par.checkNext.loopexit.i
  br label %main_polly_subfn.exit

main_polly_subfn.exit:                            ; preds = %main_polly_subfn.exit.loopexit, %polly.parallel.for
  call void @GOMP_loop_end_nowait() #8
  call void @llvm.lifetime.end(i64 8, i8* nonnull %25)
  call void @llvm.lifetime.end(i64 8, i8* nonnull %26)
  call void @GOMP_parallel_end() #8
  call void @llvm.lifetime.end(i64 8, i8* nonnull %24)
  br label %polly.split_new_and_old
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
  %polly.subfunc.arg.call35 = load i64*, i64** %4, align 8
  %5 = getelementptr inbounds i8, i8* %polly.par.userContext, i64 40
  %6 = bitcast i8* %5 to i64**
  %polly.subfunc.arg.items = load i64*, i64** %6, align 8
  %7 = call i8 @GOMP_loop_runtime_next(i64* nonnull %polly.par.LBPtr, i64* nonnull %polly.par.UBPtr)
  %8 = icmp eq i8 %7, 0
  br i1 %8, label %polly.par.exit, label %polly.par.loadIVBounds.preheader

polly.par.loadIVBounds.preheader:                 ; preds = %polly.par.setup
  %scevgep = getelementptr i64, i64* %polly.subfunc.arg.call35, i64 %polly.subfunc.arg.l.0.lcssa
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
  %polly.subfunc.arg.call35 = load i64*, i64** %4, align 8
  %5 = getelementptr inbounds i8, i8* %polly.par.userContext, i64 40
  %6 = bitcast i8* %5 to i64**
  %polly.subfunc.arg.items = load i64*, i64** %6, align 8
  %7 = call i8 @GOMP_loop_runtime_next(i64* nonnull %polly.par.LBPtr, i64* nonnull %polly.par.UBPtr)
  %8 = icmp eq i8 %7, 0
  br i1 %8, label %polly.par.exit, label %polly.par.loadIVBounds.preheader

polly.par.loadIVBounds.preheader:                 ; preds = %polly.par.setup
  %scevgep = getelementptr i64, i64* %polly.subfunc.arg.call35, i64 %polly.subfunc.arg.l.0.lcssa
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
  %polly.subfunc.arg.call30 = load i64*, i64** %2, align 8
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
  %scevgep = getelementptr i64, i64* %polly.subfunc.arg.call30, i64 %polly.indvar
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
!24 = distinct !{!24, !25, !"polly.alias.scope.call35"}
!25 = distinct !{!25, !"polly.alias.scope.domain"}
!26 = !{!27}
!27 = distinct !{!27, !25, !"polly.alias.scope.items"}
!28 = !{!24}
!29 = distinct !{!29, !30, !"polly.alias.scope.call35"}
!30 = distinct !{!30, !"polly.alias.scope.domain"}
!31 = !{!32}
!32 = distinct !{!32, !30, !"polly.alias.scope.items"}
!33 = !{!29}
!34 = !{!35, !35, i64 0}
!35 = !{!"any pointer", !3, i64 0}
!36 = distinct !{!36, !37, !"polly.alias.scope.call30"}
!37 = distinct !{!37, !"polly.alias.scope.domain"}
!38 = !{}
!39 = distinct !{!39, !40, !"polly.alias.scope.call35"}
!40 = distinct !{!40, !"polly.alias.scope.domain"}
!41 = !{!42}
!42 = distinct !{!42, !40, !"polly.alias.scope.items"}
!43 = !{!39}
!44 = distinct !{!44, !45, !"polly.alias.scope.call30"}
!45 = distinct !{!45, !"polly.alias.scope.domain"}
