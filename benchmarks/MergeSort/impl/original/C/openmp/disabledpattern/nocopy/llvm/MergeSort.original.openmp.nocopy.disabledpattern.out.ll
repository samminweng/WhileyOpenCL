; ModuleID = 'MergeSort_original.c'
source_filename = "MergeSort_original.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [5 x i8] c"%ld\0A\00", align 1

; Function Attrs: nounwind uwtable
define i64* @_sortV1_(i64* returned %items, i64 %items_size, i64 %start, i64 %end, i64* nocapture %_size_call_by_ref) local_unnamed_addr #0 {
entry:
  %0 = sub i64 0, %start
  %polly.par.LBPtr.i927 = alloca i64, align 8
  %polly.par.UBPtr.i928 = alloca i64, align 8
  %polly.par.LBPtr.i = alloca i64, align 8
  %polly.par.UBPtr.i = alloca i64, align 8
  %polly.par.userContext918 = alloca { i64, i64, i64, i64, i64*, i64*, i64 }, align 8
  %polly.par.userContext908 = alloca { i64, i64, i64, i64, i64*, i64*, i64 }, align 8
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
  %call3 = call i64* @_sortV1_(i64* %call, i64 %sub, i64 0, i64 %div, i64* nonnull %_16_size)
  %conv5 = trunc i64 %end to i32
  %call6 = tail call i64* @slice(i64* %items, i64 %items_size, i32 %conv2, i32 %conv5) #8
  %sub7 = sub nsw i64 %end, %div
  %call9 = call i64* @_sortV1_(i64* %call6, i64 %sub7, i64 0, i64 %sub7, i64* nonnull %_19_size)
  %sub10 = sub nsw i64 %end, %start
  %cmp11173 = icmp sgt i64 %sub10, 0
  %cmp16174 = icmp sgt i64 %sub, 0
  %or.cond175 = and i1 %cmp11173, %cmp16174
  %cmp21176 = icmp sgt i64 %sub7, 0
  %or.cond166177 = and i1 %cmp21176, %or.cond175
  br i1 %or.cond166177, label %if.end24.preheader, label %while.cond37.preheader

if.end24.preheader:                               ; preds = %if.end
  br label %if.end24

while.cond37.preheader.loopexit:                  ; preds = %blklab4
  br label %while.cond37.preheader

while.cond37.preheader:                           ; preds = %while.cond37.preheader.loopexit, %if.end
  %l.0.lcssa = phi i64 [ 0, %if.end ], [ %l.1, %while.cond37.preheader.loopexit ]
  %r.0.lcssa = phi i64 [ 0, %if.end ], [ %r.1, %while.cond37.preheader.loopexit ]
  %i.0.lcssa = phi i64 [ 0, %if.end ], [ %add36, %while.cond37.preheader.loopexit ]
  %cmp40170 = icmp sgt i64 %sub, %l.0.lcssa
  br i1 %cmp40170, label %if.end43.lr.ph, label %while.cond48.preheader

if.end43.lr.ph:                                   ; preds = %while.cond37.preheader
  %3 = sub i64 %sub, %l.0.lcssa
  %4 = add i64 %3, %i.0.lcssa
  %5 = tail call { i64, i1 } @llvm.smul.with.overflow.i64(i64 %i.0.lcssa, i64 2)
  %.obit659 = extractvalue { i64, i1 } %5, 1
  %.res661 = extractvalue { i64, i1 } %5, 0
  %6 = tail call { i64, i1 } @llvm.sadd.with.overflow.i64(i64 %.res661, i64 %end)
  %.obit662 = extractvalue { i64, i1 } %6, 1
  %polly.overflow.state663 = or i1 %.obit659, %.obit662
  %.res664 = extractvalue { i64, i1 } %6, 0
  %7 = tail call { i64, i1 } @llvm.smul.with.overflow.i64(i64 %l.0.lcssa, i64 2)
  %.obit665 = extractvalue { i64, i1 } %7, 1
  %polly.overflow.state666 = or i1 %.obit665, %polly.overflow.state663
  %.res667 = extractvalue { i64, i1 } %7, 0
  %8 = tail call { i64, i1 } @llvm.sadd.with.overflow.i64(i64 %start, i64 %.res667)
  %.obit668 = extractvalue { i64, i1 } %8, 1
  %polly.overflow.state669 = or i1 %.obit668, %polly.overflow.state666
  %.res670 = extractvalue { i64, i1 } %8, 0
  %9 = tail call { i64, i1 } @llvm.sadd.with.overflow.i64(i64 %.res670, i64 -1)
  %.obit671 = extractvalue { i64, i1 } %9, 1
  %polly.overflow.state672 = or i1 %.obit671, %polly.overflow.state669
  %.res673 = extractvalue { i64, i1 } %9, 0
  %10 = icmp sge i64 %.res664, %.res673
  %11 = tail call { i64, i1 } @llvm.sadd.with.overflow.i64(i64 %start, i64 %end)
  %.obit674 = extractvalue { i64, i1 } %11, 1
  %12 = icmp slt i64 %add1, 0
  %13 = and i1 %12, %10
  %polly.overflow.state684 = or i1 %.obit674, %polly.overflow.state672
  %14 = tail call { i64, i1 } @llvm.sadd.with.overflow.i64(i64 %.res670, i64 2)
  %.obit686 = extractvalue { i64, i1 } %14, 1
  %.res688 = extractvalue { i64, i1 } %14, 0
  %15 = icmp sle i64 %.res688, %end
  %polly.overflow.state690 = or i1 %.obit686, %polly.overflow.state684
  %polly.overflow.state693 = or i1 %.obit665, %polly.overflow.state690
  %polly.overflow.state696 = or i1 %.obit668, %polly.overflow.state693
  %16 = tail call { i64, i1 } @llvm.sadd.with.overflow.i64(i64 %.res670, i64 1)
  %.obit698 = extractvalue { i64, i1 } %16, 1
  %polly.overflow.state699 = or i1 %.obit698, %polly.overflow.state696
  %17 = or i1 %15, %13
  %polly.overflow.state702 = or i1 %.obit659, %polly.overflow.state699
  %polly.overflow.state705 = or i1 %.obit662, %polly.overflow.state702
  %polly.overflow.state708 = or i1 %.obit665, %polly.overflow.state705
  %polly.overflow.state711 = or i1 %.obit668, %polly.overflow.state708
  %18 = sext i64 %.res670 to i66
  %19 = tail call { i66, i1 } @llvm.sadd.with.overflow.i66(i66 %18, i66 18446744073709551616)
  %.obit713 = extractvalue { i66, i1 } %19, 1
  %polly.overflow.state714 = or i1 %.obit713, %polly.overflow.state711
  %.res715 = extractvalue { i66, i1 } %19, 0
  %20 = sext i64 %.res664 to i66
  %21 = icmp sge i66 %20, %.res715
  %22 = icmp sgt i64 %add1, -1
  %23 = and i1 %22, %21
  %24 = or i1 %17, %23
  %25 = icmp slt i64 %i.0.lcssa, -1152921504606846976
  %polly.overflow.state723 = or i1 %.obit674, %polly.overflow.state714
  %26 = and i1 %25, %15
  %polly.overflow.state729 = or i1 %.obit686, %polly.overflow.state723
  %27 = and i1 %22, %26
  %28 = or i1 %27, %24
  %polly.overflow.state732 = or i1 %.obit665, %polly.overflow.state729
  %polly.overflow.state735 = or i1 %.obit668, %polly.overflow.state732
  %polly.overflow.state738 = or i1 %.obit698, %polly.overflow.state735
  %.res739 = extractvalue { i64, i1 } %16, 0
  %29 = icmp sle i64 %.res739, %end
  %30 = and i1 %25, %29
  %31 = and i1 %12, %30
  %32 = or i1 %31, %28
  %33 = icmp slt i64 %l.0.lcssa, -1152921504606846976
  %polly.overflow.state747 = or i1 %.obit674, %polly.overflow.state738
  %34 = and i1 %33, %15
  %polly.overflow.state753 = or i1 %.obit686, %polly.overflow.state747
  %35 = and i1 %22, %34
  %36 = or i1 %35, %32
  %polly.overflow.state756 = or i1 %.obit665, %polly.overflow.state753
  %polly.overflow.state759 = or i1 %.obit668, %polly.overflow.state756
  %polly.overflow.state762 = or i1 %.obit698, %polly.overflow.state759
  %37 = and i1 %33, %29
  %38 = and i1 %12, %37
  %39 = or i1 %38, %36
  %40 = icmp sgt i64 %l.0.lcssa, 1152921504606846975
  %polly.overflow.state771 = or i1 %.obit674, %polly.overflow.state762
  %41 = and i1 %40, %15
  %polly.overflow.state777 = or i1 %.obit686, %polly.overflow.state771
  %42 = and i1 %22, %41
  %43 = or i1 %42, %39
  %polly.overflow.state780 = or i1 %.obit665, %polly.overflow.state777
  %polly.overflow.state783 = or i1 %.obit668, %polly.overflow.state780
  %polly.overflow.state786 = or i1 %.obit698, %polly.overflow.state783
  %44 = and i1 %40, %29
  %45 = and i1 %12, %44
  %46 = or i1 %45, %43
  %47 = icmp sgt i64 %i.0.lcssa, 1152921504606846975
  %polly.overflow.state795 = or i1 %.obit674, %polly.overflow.state786
  %48 = and i1 %47, %15
  %polly.overflow.state801 = or i1 %.obit686, %polly.overflow.state795
  %49 = and i1 %22, %48
  %50 = or i1 %49, %46
  %polly.overflow.state804 = or i1 %.obit665, %polly.overflow.state801
  %polly.overflow.state807 = or i1 %.obit668, %polly.overflow.state804
  %polly.overflow.state810 = or i1 %.obit698, %polly.overflow.state807
  %51 = and i1 %47, %29
  %polly.overflow.state813 = or i1 %.obit674, %polly.overflow.state810
  %52 = and i1 %12, %51
  %53 = or i1 %52, %50
  %54 = icmp eq i64 %l.0.lcssa, -9223372036854775808
  %55 = or i1 %54, %53
  %56 = icmp eq i64 %start, -9223372036854775808
  %57 = tail call { i64, i1 } @llvm.sadd.with.overflow.i64(i64 %end, i64 9223372036854775807)
  %.obit815 = extractvalue { i64, i1 } %57, 1
  %polly.overflow.state816 = or i1 %.obit815, %polly.overflow.state813
  %.res817 = extractvalue { i64, i1 } %57, 0
  %polly.overflow.state819 = or i1 %.obit665, %polly.overflow.state816
  %58 = icmp sge i64 %.res817, %.res667
  %59 = and i1 %56, %58
  %60 = or i1 %59, %55
  %61 = xor i1 %60, true
  %polly.overflow.state825 = or i1 %.obit668, %polly.overflow.state819
  %polly.overflow.state828 = or i1 %.obit686, %polly.overflow.state825
  %polly.overflow.state831 = or i1 %.obit674, %polly.overflow.state828
  %62 = and i1 %22, %15
  %63 = tail call { i64, i1 } @llvm.ssub.with.overflow.i64(i64 0, i64 %start)
  %.obit833 = extractvalue { i64, i1 } %63, 1
  %polly.overflow.state834 = or i1 %.obit833, %polly.overflow.state831
  %pexp.p_div_q839 = lshr i64 %add1, 1
  %64 = tail call { i64, i1 } @llvm.sadd.with.overflow.i64(i64 %0, i64 %pexp.p_div_q839)
  %.obit840 = extractvalue { i64, i1 } %64, 1
  %polly.overflow.state841 = or i1 %.obit840, %polly.overflow.state834
  %.res842 = extractvalue { i64, i1 } %64, 0
  %65 = tail call { i64, i1 } @llvm.ssub.with.overflow.i64(i64 %0, i64 %end)
  %.obit849 = extractvalue { i64, i1 } %65, 1
  %polly.overflow.state850 = or i1 %.obit849, %polly.overflow.state841
  %.res851 = extractvalue { i64, i1 } %65, 0
  %pexp.p_div_q852 = lshr i64 %.res851, 1
  %66 = tail call { i64, i1 } @llvm.ssub.with.overflow.i64(i64 %0, i64 %pexp.p_div_q852)
  %.obit853 = extractvalue { i64, i1 } %66, 1
  %polly.overflow.state854 = or i1 %.obit853, %polly.overflow.state850
  %.res855 = extractvalue { i64, i1 } %66, 0
  %67 = select i1 %62, i64 %.res842, i64 %.res855
  %polly.access.call3949 = getelementptr i64, i64* %call, i64 %67
  %polly.access.items856 = getelementptr i64, i64* %items, i64 %i.0.lcssa
  %68 = icmp ule i64* %polly.access.call3949, %polly.access.items856
  %polly.overflow.state858 = or i1 %.obit665, %polly.overflow.state854
  %polly.overflow.state861 = or i1 %.obit668, %polly.overflow.state858
  %polly.overflow.state864 = or i1 %.obit686, %polly.overflow.state861
  %polly.overflow.state867 = or i1 %.obit674, %polly.overflow.state864
  %69 = tail call { i64, i1 } @llvm.ssub.with.overflow.i64(i64 %i.0.lcssa, i64 %start)
  %.obit869 = extractvalue { i64, i1 } %69, 1
  %polly.overflow.state870 = or i1 %.obit869, %polly.overflow.state867
  %.res871 = extractvalue { i64, i1 } %69, 0
  %70 = tail call { i64, i1 } @llvm.ssub.with.overflow.i64(i64 %.res871, i64 %l.0.lcssa)
  %.obit872 = extractvalue { i64, i1 } %70, 1
  %polly.overflow.state873 = or i1 %.obit872, %polly.overflow.state870
  %.res874 = extractvalue { i64, i1 } %70, 0
  %71 = tail call { i64, i1 } @llvm.sadd.with.overflow.i64(i64 %.res874, i64 %pexp.p_div_q839)
  %.obit879 = extractvalue { i64, i1 } %71, 1
  %polly.overflow.state880 = or i1 %.obit879, %polly.overflow.state873
  %.res881 = extractvalue { i64, i1 } %71, 0
  %polly.overflow.state889 = or i1 %.obit833, %polly.overflow.state880
  %polly.overflow.state892 = or i1 %.obit849, %polly.overflow.state889
  %72 = tail call { i64, i1 } @llvm.ssub.with.overflow.i64(i64 %.res874, i64 %pexp.p_div_q852)
  %.obit895 = extractvalue { i64, i1 } %72, 1
  %polly.overflow.state896 = or i1 %.obit895, %polly.overflow.state892
  %.res897 = extractvalue { i64, i1 } %72, 0
  %73 = select i1 %62, i64 %.res881, i64 %.res897
  %polly.access.items898 = getelementptr i64, i64* %items, i64 %73
  %polly.access.call3899950 = getelementptr i64, i64* %call, i64 %l.0.lcssa
  %74 = icmp ule i64* %polly.access.items898, %polly.access.call3899950
  %75 = or i1 %68, %74
  %76 = and i1 %75, %61
  %polly.rtc.overflown900 = xor i1 %polly.overflow.state896, true
  %polly.rtc.result901 = and i1 %76, %polly.rtc.overflown900
  br i1 %polly.rtc.result901, label %polly.cond902, label %if.end43.preheader

if.end43.preheader:                               ; preds = %if.end43.lr.ph
  %77 = sub i64 %div, %l.0.lcssa
  %78 = sub i64 %77, %start
  %min.iters.check = icmp ult i64 %78, 4
  br i1 %min.iters.check, label %if.end43.preheader1015, label %min.iters.checked

if.end43.preheader1015:                           ; preds = %middle.block, %vector.memcheck, %min.iters.checked, %if.end43.preheader
  %i.1172.ph = phi i64 [ %i.0.lcssa, %vector.memcheck ], [ %i.0.lcssa, %min.iters.checked ], [ %i.0.lcssa, %if.end43.preheader ], [ %ind.end, %middle.block ]
  %l.2171.ph = phi i64 [ %l.0.lcssa, %vector.memcheck ], [ %l.0.lcssa, %min.iters.checked ], [ %l.0.lcssa, %if.end43.preheader ], [ %ind.end964, %middle.block ]
  %79 = add i64 %i.0.lcssa, %div
  %80 = sub i64 %79, %i.1172.ph
  %81 = sub i64 %80, %l.0.lcssa
  %82 = sub i64 %81, %start
  %83 = add i64 %79, -1
  %84 = sub i64 %83, %i.1172.ph
  %85 = sub i64 %84, %l.0.lcssa
  %86 = sub i64 %85, %start
  %xtraiter1018 = and i64 %82, 3
  %lcmp.mod1019 = icmp eq i64 %xtraiter1018, 0
  br i1 %lcmp.mod1019, label %if.end43.prol.loopexit, label %if.end43.prol.preheader

if.end43.prol.preheader:                          ; preds = %if.end43.preheader1015
  br label %if.end43.prol

if.end43.prol:                                    ; preds = %if.end43.prol, %if.end43.prol.preheader
  %i.1172.prol = phi i64 [ %add46.prol, %if.end43.prol ], [ %i.1172.ph, %if.end43.prol.preheader ]
  %l.2171.prol = phi i64 [ %add47.prol, %if.end43.prol ], [ %l.2171.ph, %if.end43.prol.preheader ]
  %prol.iter1020 = phi i64 [ %prol.iter1020.sub, %if.end43.prol ], [ %xtraiter1018, %if.end43.prol.preheader ]
  %arrayidx44951.prol = getelementptr inbounds i64, i64* %call, i64 %l.2171.prol
  %87 = load i64, i64* %arrayidx44951.prol, align 8, !tbaa !1
  %arrayidx45.prol = getelementptr inbounds i64, i64* %items, i64 %i.1172.prol
  store i64 %87, i64* %arrayidx45.prol, align 8, !tbaa !1
  %add46.prol = add nsw i64 %i.1172.prol, 1
  %add47.prol = add nsw i64 %l.2171.prol, 1
  %prol.iter1020.sub = add i64 %prol.iter1020, -1
  %prol.iter1020.cmp = icmp eq i64 %prol.iter1020.sub, 0
  br i1 %prol.iter1020.cmp, label %if.end43.prol.loopexit.unr-lcssa, label %if.end43.prol, !llvm.loop !5

if.end43.prol.loopexit.unr-lcssa:                 ; preds = %if.end43.prol
  br label %if.end43.prol.loopexit

if.end43.prol.loopexit:                           ; preds = %if.end43.preheader1015, %if.end43.prol.loopexit.unr-lcssa
  %i.1172.unr = phi i64 [ %i.1172.ph, %if.end43.preheader1015 ], [ %add46.prol, %if.end43.prol.loopexit.unr-lcssa ]
  %l.2171.unr = phi i64 [ %l.2171.ph, %if.end43.preheader1015 ], [ %add47.prol, %if.end43.prol.loopexit.unr-lcssa ]
  %88 = icmp ult i64 %86, 3
  br i1 %88, label %while.cond48.preheader.loopexit, label %if.end43.preheader1015.new

if.end43.preheader1015.new:                       ; preds = %if.end43.prol.loopexit
  br label %if.end43

min.iters.checked:                                ; preds = %if.end43.preheader
  %n.vec = and i64 %78, -4
  %cmp.zero = icmp eq i64 %n.vec, 0
  br i1 %cmp.zero, label %if.end43.preheader1015, label %vector.memcheck

vector.memcheck:                                  ; preds = %min.iters.checked
  %scevgep = getelementptr i64, i64* %items, i64 %i.0.lcssa
  %89 = add i64 %i.0.lcssa, %div
  %90 = add i64 %l.0.lcssa, %start
  %91 = sub i64 %89, %90
  %scevgep957 = getelementptr i64, i64* %items, i64 %91
  %scevgep959 = getelementptr i64, i64* %call, i64 %l.0.lcssa
  %scevgep961 = getelementptr i64, i64* %call, i64 %sub
  %bound0 = icmp ult i64* %scevgep, %scevgep961
  %bound1 = icmp ult i64* %scevgep959, %scevgep957
  %memcheck.conflict = and i1 %bound0, %bound1
  %ind.end = add i64 %i.0.lcssa, %n.vec
  %ind.end964 = add i64 %l.0.lcssa, %n.vec
  br i1 %memcheck.conflict, label %if.end43.preheader1015, label %vector.body.preheader

vector.body.preheader:                            ; preds = %vector.memcheck
  %92 = add i64 %n.vec, -4
  %93 = lshr exact i64 %92, 2
  %94 = and i64 %93, 1
  %lcmp.mod1022 = icmp eq i64 %94, 0
  br i1 %lcmp.mod1022, label %vector.body.prol.preheader, label %vector.body.prol.loopexit

vector.body.prol.preheader:                       ; preds = %vector.body.preheader
  br label %vector.body.prol

vector.body.prol:                                 ; preds = %vector.body.prol.preheader
  %95 = getelementptr inbounds i64, i64* %call, i64 %l.0.lcssa
  %96 = bitcast i64* %95 to <2 x i64>*
  %wide.load.prol = load <2 x i64>, <2 x i64>* %96, align 8, !tbaa !1, !alias.scope !7
  %97 = getelementptr i64, i64* %95, i64 2
  %98 = bitcast i64* %97 to <2 x i64>*
  %wide.load971.prol = load <2 x i64>, <2 x i64>* %98, align 8, !tbaa !1, !alias.scope !7
  %99 = getelementptr inbounds i64, i64* %items, i64 %i.0.lcssa
  %100 = bitcast i64* %99 to <2 x i64>*
  store <2 x i64> %wide.load.prol, <2 x i64>* %100, align 8, !tbaa !1, !alias.scope !10, !noalias !7
  %101 = getelementptr i64, i64* %99, i64 2
  %102 = bitcast i64* %101 to <2 x i64>*
  store <2 x i64> %wide.load971.prol, <2 x i64>* %102, align 8, !tbaa !1, !alias.scope !10, !noalias !7
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
  %wide.load971 = load <2 x i64>, <2 x i64>* %109, align 8, !tbaa !1, !alias.scope !7
  %110 = getelementptr inbounds i64, i64* %items, i64 %104
  %111 = bitcast i64* %110 to <2 x i64>*
  store <2 x i64> %wide.load, <2 x i64>* %111, align 8, !tbaa !1, !alias.scope !10, !noalias !7
  %112 = getelementptr i64, i64* %110, i64 2
  %113 = bitcast i64* %112 to <2 x i64>*
  store <2 x i64> %wide.load971, <2 x i64>* %113, align 8, !tbaa !1, !alias.scope !10, !noalias !7
  %index.next = add i64 %index, 4
  %114 = add i64 %i.0.lcssa, %index.next
  %115 = add i64 %l.0.lcssa, %index.next
  %116 = getelementptr inbounds i64, i64* %call, i64 %115
  %117 = bitcast i64* %116 to <2 x i64>*
  %wide.load.1 = load <2 x i64>, <2 x i64>* %117, align 8, !tbaa !1, !alias.scope !7
  %118 = getelementptr i64, i64* %116, i64 2
  %119 = bitcast i64* %118 to <2 x i64>*
  %wide.load971.1 = load <2 x i64>, <2 x i64>* %119, align 8, !tbaa !1, !alias.scope !7
  %120 = getelementptr inbounds i64, i64* %items, i64 %114
  %121 = bitcast i64* %120 to <2 x i64>*
  store <2 x i64> %wide.load.1, <2 x i64>* %121, align 8, !tbaa !1, !alias.scope !10, !noalias !7
  %122 = getelementptr i64, i64* %120, i64 2
  %123 = bitcast i64* %122 to <2 x i64>*
  store <2 x i64> %wide.load971.1, <2 x i64>* %123, align 8, !tbaa !1, !alias.scope !10, !noalias !7
  %index.next.1 = add i64 %index, 8
  %124 = icmp eq i64 %index.next.1, %n.vec
  br i1 %124, label %middle.block.unr-lcssa, label %vector.body, !llvm.loop !12

middle.block.unr-lcssa:                           ; preds = %vector.body
  br label %middle.block

middle.block:                                     ; preds = %vector.body.prol.loopexit, %middle.block.unr-lcssa
  %cmp.n = icmp eq i64 %78, %n.vec
  br i1 %cmp.n, label %while.cond48.preheader, label %if.end43.preheader1015

if.end24:                                         ; preds = %if.end24.preheader, %blklab4
  %i.0180 = phi i64 [ %add36, %blklab4 ], [ 0, %if.end24.preheader ]
  %r.0179 = phi i64 [ %r.1, %blklab4 ], [ 0, %if.end24.preheader ]
  %l.0178 = phi i64 [ %l.1, %blklab4 ], [ 0, %if.end24.preheader ]
  %arrayidx952 = getelementptr inbounds i64, i64* %call, i64 %l.0178
  %125 = load i64, i64* %arrayidx952, align 8, !tbaa !1
  %arrayidx25953 = getelementptr inbounds i64, i64* %call6, i64 %r.0179
  %126 = load i64, i64* %arrayidx25953, align 8, !tbaa !1
  %cmp26 = icmp sgt i64 %125, %126
  %arrayidx34 = getelementptr inbounds i64, i64* %items, i64 %i.0180
  br i1 %cmp26, label %blklab3, label %if.end29

if.end29:                                         ; preds = %if.end24
  store i64 %125, i64* %arrayidx34, align 8, !tbaa !1
  %add32 = add nsw i64 %l.0178, 1
  br label %blklab4

blklab3:                                          ; preds = %if.end24
  store i64 %126, i64* %arrayidx34, align 8, !tbaa !1
  %add35 = add nsw i64 %r.0179, 1
  br label %blklab4

blklab4:                                          ; preds = %blklab3, %if.end29
  %l.1 = phi i64 [ %l.0178, %blklab3 ], [ %add32, %if.end29 ]
  %r.1 = phi i64 [ %add35, %blklab3 ], [ %r.0179, %if.end29 ]
  %add36 = add nuw nsw i64 %i.0180, 1
  %cmp11 = icmp slt i64 %add36, %sub10
  %cmp16 = icmp slt i64 %l.1, %sub
  %or.cond = and i1 %cmp11, %cmp16
  %cmp21 = icmp slt i64 %r.1, %sub7
  %or.cond166 = and i1 %cmp21, %or.cond
  br i1 %or.cond166, label %if.end24, label %while.cond37.preheader.loopexit

while.cond48.preheader.loopexit.unr-lcssa:        ; preds = %if.end43
  br label %while.cond48.preheader.loopexit

while.cond48.preheader.loopexit:                  ; preds = %if.end43.prol.loopexit, %while.cond48.preheader.loopexit.unr-lcssa
  br label %while.cond48.preheader

while.cond48.preheader:                           ; preds = %while.cond48.preheader.loopexit, %middle.block, %_sortV1__polly_subfn_3.exit, %_sortV1__polly_subfn_2.exit, %while.cond37.preheader
  %i.1.lcssa.ph = phi i64 [ %i.0.lcssa, %while.cond37.preheader ], [ %4, %_sortV1__polly_subfn_2.exit ], [ %4, %_sortV1__polly_subfn_3.exit ], [ %4, %middle.block ], [ %4, %while.cond48.preheader.loopexit ]
  %cmp51167 = icmp slt i64 %r.0.lcssa, %sub7
  br i1 %cmp51167, label %if.end54.preheader, label %blklab0

if.end54.preheader:                               ; preds = %while.cond48.preheader
  %127 = sub i64 %end, %r.0.lcssa
  %128 = sub i64 %127, %div
  %min.iters.check975 = icmp ult i64 %128, 4
  br i1 %min.iters.check975, label %if.end54.preheader1014, label %min.iters.checked976

if.end54.preheader1014:                           ; preds = %middle.block973, %vector.memcheck993, %min.iters.checked976, %if.end54.preheader
  %i.2169.ph = phi i64 [ %i.1.lcssa.ph, %vector.memcheck993 ], [ %i.1.lcssa.ph, %min.iters.checked976 ], [ %i.1.lcssa.ph, %if.end54.preheader ], [ %ind.end998, %middle.block973 ]
  %r.2168.ph = phi i64 [ %r.0.lcssa, %vector.memcheck993 ], [ %r.0.lcssa, %min.iters.checked976 ], [ %r.0.lcssa, %if.end54.preheader ], [ %ind.end1000, %middle.block973 ]
  %129 = sub i64 %end, %r.2168.ph
  %130 = sub i64 %129, %div
  %131 = add i64 %end, -1
  %132 = sub i64 %131, %r.2168.ph
  %133 = sub i64 %132, %div
  %xtraiter = and i64 %130, 3
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod, label %if.end54.prol.loopexit, label %if.end54.prol.preheader

if.end54.prol.preheader:                          ; preds = %if.end54.preheader1014
  br label %if.end54.prol

if.end54.prol:                                    ; preds = %if.end54.prol, %if.end54.prol.preheader
  %i.2169.prol = phi i64 [ %add57.prol, %if.end54.prol ], [ %i.2169.ph, %if.end54.prol.preheader ]
  %r.2168.prol = phi i64 [ %add58.prol, %if.end54.prol ], [ %r.2168.ph, %if.end54.prol.preheader ]
  %prol.iter = phi i64 [ %prol.iter.sub, %if.end54.prol ], [ %xtraiter, %if.end54.prol.preheader ]
  %arrayidx55948.prol = getelementptr inbounds i64, i64* %call6, i64 %r.2168.prol
  %134 = load i64, i64* %arrayidx55948.prol, align 8, !tbaa !1
  %arrayidx56.prol = getelementptr inbounds i64, i64* %items, i64 %i.2169.prol
  store i64 %134, i64* %arrayidx56.prol, align 8, !tbaa !1
  %add57.prol = add nsw i64 %i.2169.prol, 1
  %add58.prol = add nsw i64 %r.2168.prol, 1
  %prol.iter.sub = add i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %if.end54.prol.loopexit.unr-lcssa, label %if.end54.prol, !llvm.loop !15

if.end54.prol.loopexit.unr-lcssa:                 ; preds = %if.end54.prol
  br label %if.end54.prol.loopexit

if.end54.prol.loopexit:                           ; preds = %if.end54.preheader1014, %if.end54.prol.loopexit.unr-lcssa
  %i.2169.unr = phi i64 [ %i.2169.ph, %if.end54.preheader1014 ], [ %add57.prol, %if.end54.prol.loopexit.unr-lcssa ]
  %r.2168.unr = phi i64 [ %r.2168.ph, %if.end54.preheader1014 ], [ %add58.prol, %if.end54.prol.loopexit.unr-lcssa ]
  %135 = icmp ult i64 %133, 3
  br i1 %135, label %blklab0.loopexit, label %if.end54.preheader1014.new

if.end54.preheader1014.new:                       ; preds = %if.end54.prol.loopexit
  br label %if.end54

min.iters.checked976:                             ; preds = %if.end54.preheader
  %n.vec978 = and i64 %128, -4
  %cmp.zero979 = icmp eq i64 %n.vec978, 0
  br i1 %cmp.zero979, label %if.end54.preheader1014, label %vector.memcheck993

vector.memcheck993:                               ; preds = %min.iters.checked976
  %scevgep981 = getelementptr i64, i64* %items, i64 %i.1.lcssa.ph
  %136 = add i64 %i.1.lcssa.ph, %end
  %137 = add i64 %r.0.lcssa, %div
  %138 = sub i64 %136, %137
  %scevgep983 = getelementptr i64, i64* %items, i64 %138
  %scevgep985 = getelementptr i64, i64* %call6, i64 %r.0.lcssa
  %scevgep987 = getelementptr i64, i64* %call6, i64 %sub7
  %bound0989 = icmp ult i64* %scevgep981, %scevgep987
  %bound1990 = icmp ult i64* %scevgep985, %scevgep983
  %memcheck.conflict992 = and i1 %bound0989, %bound1990
  %ind.end998 = add i64 %i.1.lcssa.ph, %n.vec978
  %ind.end1000 = add i64 %r.0.lcssa, %n.vec978
  br i1 %memcheck.conflict992, label %if.end54.preheader1014, label %vector.body972.preheader

vector.body972.preheader:                         ; preds = %vector.memcheck993
  %139 = add i64 %n.vec978, -4
  %140 = lshr exact i64 %139, 2
  %141 = and i64 %140, 1
  %lcmp.mod1017 = icmp eq i64 %141, 0
  br i1 %lcmp.mod1017, label %vector.body972.prol.preheader, label %vector.body972.prol.loopexit

vector.body972.prol.preheader:                    ; preds = %vector.body972.preheader
  br label %vector.body972.prol

vector.body972.prol:                              ; preds = %vector.body972.prol.preheader
  %142 = getelementptr inbounds i64, i64* %call6, i64 %r.0.lcssa
  %143 = bitcast i64* %142 to <2 x i64>*
  %wide.load1012.prol = load <2 x i64>, <2 x i64>* %143, align 8, !tbaa !1, !alias.scope !16
  %144 = getelementptr i64, i64* %142, i64 2
  %145 = bitcast i64* %144 to <2 x i64>*
  %wide.load1013.prol = load <2 x i64>, <2 x i64>* %145, align 8, !tbaa !1, !alias.scope !16
  %146 = getelementptr inbounds i64, i64* %items, i64 %i.1.lcssa.ph
  %147 = bitcast i64* %146 to <2 x i64>*
  store <2 x i64> %wide.load1012.prol, <2 x i64>* %147, align 8, !tbaa !1, !alias.scope !19, !noalias !16
  %148 = getelementptr i64, i64* %146, i64 2
  %149 = bitcast i64* %148 to <2 x i64>*
  store <2 x i64> %wide.load1013.prol, <2 x i64>* %149, align 8, !tbaa !1, !alias.scope !19, !noalias !16
  br label %vector.body972.prol.loopexit

vector.body972.prol.loopexit:                     ; preds = %vector.body972.prol, %vector.body972.preheader
  %index995.unr = phi i64 [ 0, %vector.body972.preheader ], [ 4, %vector.body972.prol ]
  %150 = icmp eq i64 %140, 0
  br i1 %150, label %middle.block973, label %vector.body972.preheader.new

vector.body972.preheader.new:                     ; preds = %vector.body972.prol.loopexit
  br label %vector.body972

vector.body972:                                   ; preds = %vector.body972, %vector.body972.preheader.new
  %index995 = phi i64 [ %index995.unr, %vector.body972.preheader.new ], [ %index.next996.1, %vector.body972 ]
  %151 = add i64 %i.1.lcssa.ph, %index995
  %152 = add i64 %r.0.lcssa, %index995
  %153 = getelementptr inbounds i64, i64* %call6, i64 %152
  %154 = bitcast i64* %153 to <2 x i64>*
  %wide.load1012 = load <2 x i64>, <2 x i64>* %154, align 8, !tbaa !1, !alias.scope !16
  %155 = getelementptr i64, i64* %153, i64 2
  %156 = bitcast i64* %155 to <2 x i64>*
  %wide.load1013 = load <2 x i64>, <2 x i64>* %156, align 8, !tbaa !1, !alias.scope !16
  %157 = getelementptr inbounds i64, i64* %items, i64 %151
  %158 = bitcast i64* %157 to <2 x i64>*
  store <2 x i64> %wide.load1012, <2 x i64>* %158, align 8, !tbaa !1, !alias.scope !19, !noalias !16
  %159 = getelementptr i64, i64* %157, i64 2
  %160 = bitcast i64* %159 to <2 x i64>*
  store <2 x i64> %wide.load1013, <2 x i64>* %160, align 8, !tbaa !1, !alias.scope !19, !noalias !16
  %index.next996 = add i64 %index995, 4
  %161 = add i64 %i.1.lcssa.ph, %index.next996
  %162 = add i64 %r.0.lcssa, %index.next996
  %163 = getelementptr inbounds i64, i64* %call6, i64 %162
  %164 = bitcast i64* %163 to <2 x i64>*
  %wide.load1012.1 = load <2 x i64>, <2 x i64>* %164, align 8, !tbaa !1, !alias.scope !16
  %165 = getelementptr i64, i64* %163, i64 2
  %166 = bitcast i64* %165 to <2 x i64>*
  %wide.load1013.1 = load <2 x i64>, <2 x i64>* %166, align 8, !tbaa !1, !alias.scope !16
  %167 = getelementptr inbounds i64, i64* %items, i64 %161
  %168 = bitcast i64* %167 to <2 x i64>*
  store <2 x i64> %wide.load1012.1, <2 x i64>* %168, align 8, !tbaa !1, !alias.scope !19, !noalias !16
  %169 = getelementptr i64, i64* %167, i64 2
  %170 = bitcast i64* %169 to <2 x i64>*
  store <2 x i64> %wide.load1013.1, <2 x i64>* %170, align 8, !tbaa !1, !alias.scope !19, !noalias !16
  %index.next996.1 = add i64 %index995, 8
  %171 = icmp eq i64 %index.next996.1, %n.vec978
  br i1 %171, label %middle.block973.unr-lcssa, label %vector.body972, !llvm.loop !21

middle.block973.unr-lcssa:                        ; preds = %vector.body972
  br label %middle.block973

middle.block973:                                  ; preds = %vector.body972.prol.loopexit, %middle.block973.unr-lcssa
  %cmp.n1001 = icmp eq i64 %128, %n.vec978
  br i1 %cmp.n1001, label %blklab0, label %if.end54.preheader1014

if.end43:                                         ; preds = %if.end43, %if.end43.preheader1015.new
  %i.1172 = phi i64 [ %i.1172.unr, %if.end43.preheader1015.new ], [ %add46.3, %if.end43 ]
  %l.2171 = phi i64 [ %l.2171.unr, %if.end43.preheader1015.new ], [ %add47.3, %if.end43 ]
  %arrayidx44951 = getelementptr inbounds i64, i64* %call, i64 %l.2171
  %172 = load i64, i64* %arrayidx44951, align 8, !tbaa !1
  %arrayidx45 = getelementptr inbounds i64, i64* %items, i64 %i.1172
  store i64 %172, i64* %arrayidx45, align 8, !tbaa !1
  %add46 = add nsw i64 %i.1172, 1
  %add47 = add nsw i64 %l.2171, 1
  %arrayidx44951.1 = getelementptr inbounds i64, i64* %call, i64 %add47
  %173 = load i64, i64* %arrayidx44951.1, align 8, !tbaa !1
  %arrayidx45.1 = getelementptr inbounds i64, i64* %items, i64 %add46
  store i64 %173, i64* %arrayidx45.1, align 8, !tbaa !1
  %add46.1 = add nsw i64 %i.1172, 2
  %add47.1 = add nsw i64 %l.2171, 2
  %arrayidx44951.2 = getelementptr inbounds i64, i64* %call, i64 %add47.1
  %174 = load i64, i64* %arrayidx44951.2, align 8, !tbaa !1
  %arrayidx45.2 = getelementptr inbounds i64, i64* %items, i64 %add46.1
  store i64 %174, i64* %arrayidx45.2, align 8, !tbaa !1
  %add46.2 = add nsw i64 %i.1172, 3
  %add47.2 = add nsw i64 %l.2171, 3
  %arrayidx44951.3 = getelementptr inbounds i64, i64* %call, i64 %add47.2
  %175 = load i64, i64* %arrayidx44951.3, align 8, !tbaa !1
  %arrayidx45.3 = getelementptr inbounds i64, i64* %items, i64 %add46.2
  store i64 %175, i64* %arrayidx45.3, align 8, !tbaa !1
  %add46.3 = add nsw i64 %i.1172, 4
  %add47.3 = add nsw i64 %l.2171, 4
  %exitcond184.3 = icmp eq i64 %add46.3, %4
  br i1 %exitcond184.3, label %while.cond48.preheader.loopexit.unr-lcssa, label %if.end43, !llvm.loop !22

if.end54:                                         ; preds = %if.end54, %if.end54.preheader1014.new
  %i.2169 = phi i64 [ %i.2169.unr, %if.end54.preheader1014.new ], [ %add57.3, %if.end54 ]
  %r.2168 = phi i64 [ %r.2168.unr, %if.end54.preheader1014.new ], [ %add58.3, %if.end54 ]
  %arrayidx55948 = getelementptr inbounds i64, i64* %call6, i64 %r.2168
  %176 = load i64, i64* %arrayidx55948, align 8, !tbaa !1
  %arrayidx56 = getelementptr inbounds i64, i64* %items, i64 %i.2169
  store i64 %176, i64* %arrayidx56, align 8, !tbaa !1
  %add57 = add nsw i64 %i.2169, 1
  %add58 = add nsw i64 %r.2168, 1
  %arrayidx55948.1 = getelementptr inbounds i64, i64* %call6, i64 %add58
  %177 = load i64, i64* %arrayidx55948.1, align 8, !tbaa !1
  %arrayidx56.1 = getelementptr inbounds i64, i64* %items, i64 %add57
  store i64 %177, i64* %arrayidx56.1, align 8, !tbaa !1
  %add57.1 = add nsw i64 %i.2169, 2
  %add58.1 = add nsw i64 %r.2168, 2
  %arrayidx55948.2 = getelementptr inbounds i64, i64* %call6, i64 %add58.1
  %178 = load i64, i64* %arrayidx55948.2, align 8, !tbaa !1
  %arrayidx56.2 = getelementptr inbounds i64, i64* %items, i64 %add57.1
  store i64 %178, i64* %arrayidx56.2, align 8, !tbaa !1
  %add57.2 = add nsw i64 %i.2169, 3
  %add58.2 = add nsw i64 %r.2168, 3
  %arrayidx55948.3 = getelementptr inbounds i64, i64* %call6, i64 %add58.2
  %179 = load i64, i64* %arrayidx55948.3, align 8, !tbaa !1
  %arrayidx56.3 = getelementptr inbounds i64, i64* %items, i64 %add57.2
  store i64 %179, i64* %arrayidx56.3, align 8, !tbaa !1
  %add57.3 = add nsw i64 %i.2169, 4
  %add58.3 = add nsw i64 %r.2168, 4
  %exitcond.3 = icmp eq i64 %add58.3, %sub7
  br i1 %exitcond.3, label %blklab0.loopexit.unr-lcssa, label %if.end54, !llvm.loop !23

blklab0.loopexit.unr-lcssa:                       ; preds = %if.end54
  br label %blklab0.loopexit

blklab0.loopexit:                                 ; preds = %if.end54.prol.loopexit, %blklab0.loopexit.unr-lcssa
  br label %blklab0

blklab0:                                          ; preds = %blklab0.loopexit, %middle.block973, %while.cond48.preheader, %entry
  store i64 %items_size, i64* %_size_call_by_ref, align 8, !tbaa !1
  call void @llvm.lifetime.end(i64 8, i8* nonnull %2) #8
  call void @llvm.lifetime.end(i64 8, i8* nonnull %1) #8
  ret i64* %items

polly.cond902:                                    ; preds = %if.end43.lr.ph
  %180 = sub nsw i64 %0, %l.0.lcssa
  br i1 %12, label %polly.parallel.for906, label %polly.parallel.for916

polly.parallel.for906:                            ; preds = %polly.cond902
  %181 = sub nsw i64 %180, %pexp.p_div_q852
  %182 = bitcast { i64, i64, i64, i64, i64*, i64*, i64 }* %polly.par.userContext908 to i8*
  call void @llvm.lifetime.start(i64 56, i8* nonnull %182)
  %polly.subfn.storeaddr.i.0.lcssa909 = getelementptr inbounds { i64, i64, i64, i64, i64*, i64*, i64 }, { i64, i64, i64, i64, i64*, i64*, i64 }* %polly.par.userContext908, i64 0, i32 0
  store i64 %i.0.lcssa, i64* %polly.subfn.storeaddr.i.0.lcssa909, align 8
  %polly.subfn.storeaddr.start910 = getelementptr inbounds { i64, i64, i64, i64, i64*, i64*, i64 }, { i64, i64, i64, i64, i64*, i64*, i64 }* %polly.par.userContext908, i64 0, i32 1
  store i64 %start, i64* %polly.subfn.storeaddr.start910, align 8
  %polly.subfn.storeaddr.l.0.lcssa911 = getelementptr inbounds { i64, i64, i64, i64, i64*, i64*, i64 }, { i64, i64, i64, i64, i64*, i64*, i64 }* %polly.par.userContext908, i64 0, i32 2
  store i64 %l.0.lcssa, i64* %polly.subfn.storeaddr.l.0.lcssa911, align 8
  %polly.subfn.storeaddr.end912 = getelementptr inbounds { i64, i64, i64, i64, i64*, i64*, i64 }, { i64, i64, i64, i64, i64*, i64*, i64 }* %polly.par.userContext908, i64 0, i32 3
  store i64 %end, i64* %polly.subfn.storeaddr.end912, align 8
  %polly.subfn.storeaddr.call3 = getelementptr inbounds { i64, i64, i64, i64, i64*, i64*, i64 }, { i64, i64, i64, i64, i64*, i64*, i64 }* %polly.par.userContext908, i64 0, i32 4
  store i64* %call3, i64** %polly.subfn.storeaddr.call3, align 8
  %polly.subfn.storeaddr.items913 = getelementptr inbounds { i64, i64, i64, i64, i64*, i64*, i64 }, { i64, i64, i64, i64, i64*, i64*, i64 }* %polly.par.userContext908, i64 0, i32 5
  store i64* %items, i64** %polly.subfn.storeaddr.items913, align 8
  %polly.subfn.storeaddr.div914 = getelementptr inbounds { i64, i64, i64, i64, i64*, i64*, i64 }, { i64, i64, i64, i64, i64*, i64*, i64 }* %polly.par.userContext908, i64 0, i32 6
  store i64 %div, i64* %polly.subfn.storeaddr.div914, align 8
  call void @GOMP_parallel_loop_runtime_start(void (i8*)* nonnull @_sortV1__polly_subfn_2, i8* nonnull %182, i32 0, i64 0, i64 %181, i64 1) #8
  %183 = bitcast i64* %polly.par.LBPtr.i927 to i8*
  call void @llvm.lifetime.start(i64 8, i8* nonnull %183)
  %184 = bitcast i64* %polly.par.UBPtr.i928 to i8*
  call void @llvm.lifetime.start(i64 8, i8* nonnull %184)
  %polly.subfunc.arg.i.0.lcssa.i929 = load i64, i64* %polly.subfn.storeaddr.i.0.lcssa909, align 8
  %polly.subfunc.arg.l.0.lcssa.i930 = load i64, i64* %polly.subfn.storeaddr.l.0.lcssa911, align 8
  %polly.subfunc.arg.call3.i931 = load i64*, i64** %polly.subfn.storeaddr.call3, align 8
  %polly.subfunc.arg.items.i932 = load i64*, i64** %polly.subfn.storeaddr.items913, align 8
  %185 = call i8 @GOMP_loop_runtime_next(i64* nonnull %polly.par.LBPtr.i927, i64* nonnull %polly.par.UBPtr.i928) #8
  %186 = icmp eq i8 %185, 0
  br i1 %186, label %_sortV1__polly_subfn_2.exit, label %polly.par.loadIVBounds.preheader.i935

polly.par.loadIVBounds.preheader.i935:            ; preds = %polly.parallel.for906
  %scevgep.i933 = getelementptr i64, i64* %polly.subfunc.arg.call3.i931, i64 %polly.subfunc.arg.l.0.lcssa.i930
  %scevgep3.i934 = getelementptr i64, i64* %polly.subfunc.arg.items.i932, i64 %polly.subfunc.arg.i.0.lcssa.i929
  br label %polly.par.loadIVBounds.i940

polly.par.checkNext.loopexit.i936:                ; preds = %polly.loop_header.i947
  %187 = call i8 @GOMP_loop_runtime_next(i64* nonnull %polly.par.LBPtr.i927, i64* nonnull %polly.par.UBPtr.i928) #8
  %188 = icmp eq i8 %187, 0
  br i1 %188, label %_sortV1__polly_subfn_2.exit.loopexit, label %polly.par.loadIVBounds.i940

polly.par.loadIVBounds.i940:                      ; preds = %polly.par.checkNext.loopexit.i936, %polly.par.loadIVBounds.preheader.i935
  %polly.par.UB.i937 = load i64, i64* %polly.par.UBPtr.i928, align 8
  %polly.par.LB.i938 = load i64, i64* %polly.par.LBPtr.i927, align 8
  %polly.adjust_ub.i939 = add i64 %polly.par.UB.i937, -2
  br label %polly.loop_header.i947

polly.loop_header.i947:                           ; preds = %polly.loop_header.i947, %polly.par.loadIVBounds.i940
  %polly.indvar.i941 = phi i64 [ %polly.par.LB.i938, %polly.par.loadIVBounds.i940 ], [ %polly.indvar_next.i945, %polly.loop_header.i947 ]
  %scevgep2.i942 = getelementptr i64, i64* %scevgep.i933, i64 %polly.indvar.i941
  %_p_scalar_.i943 = load i64, i64* %scevgep2.i942, align 8, !alias.scope !24, !noalias !26
  %scevgep4.i944 = getelementptr i64, i64* %scevgep3.i934, i64 %polly.indvar.i941
  store i64 %_p_scalar_.i943, i64* %scevgep4.i944, align 8, !alias.scope !27, !noalias !28
  %polly.indvar_next.i945 = add nsw i64 %polly.indvar.i941, 1
  %polly.loop_cond.i946 = icmp sgt i64 %polly.indvar.i941, %polly.adjust_ub.i939
  br i1 %polly.loop_cond.i946, label %polly.par.checkNext.loopexit.i936, label %polly.loop_header.i947

_sortV1__polly_subfn_2.exit.loopexit:             ; preds = %polly.par.checkNext.loopexit.i936
  br label %_sortV1__polly_subfn_2.exit

_sortV1__polly_subfn_2.exit:                      ; preds = %_sortV1__polly_subfn_2.exit.loopexit, %polly.parallel.for906
  call void @GOMP_loop_end_nowait() #8
  call void @llvm.lifetime.end(i64 8, i8* nonnull %183)
  call void @llvm.lifetime.end(i64 8, i8* nonnull %184)
  call void @GOMP_parallel_end() #8
  call void @llvm.lifetime.end(i64 8, i8* nonnull %182)
  br label %while.cond48.preheader

polly.parallel.for916:                            ; preds = %polly.cond902
  %189 = bitcast { i64, i64, i64, i64, i64*, i64*, i64 }* %polly.par.userContext918 to i8*
  call void @llvm.lifetime.start(i64 56, i8* nonnull %189)
  %polly.subfn.storeaddr.i.0.lcssa919 = getelementptr inbounds { i64, i64, i64, i64, i64*, i64*, i64 }, { i64, i64, i64, i64, i64*, i64*, i64 }* %polly.par.userContext918, i64 0, i32 0
  store i64 %i.0.lcssa, i64* %polly.subfn.storeaddr.i.0.lcssa919, align 8
  %polly.subfn.storeaddr.start920 = getelementptr inbounds { i64, i64, i64, i64, i64*, i64*, i64 }, { i64, i64, i64, i64, i64*, i64*, i64 }* %polly.par.userContext918, i64 0, i32 1
  store i64 %start, i64* %polly.subfn.storeaddr.start920, align 8
  %polly.subfn.storeaddr.l.0.lcssa921 = getelementptr inbounds { i64, i64, i64, i64, i64*, i64*, i64 }, { i64, i64, i64, i64, i64*, i64*, i64 }* %polly.par.userContext918, i64 0, i32 2
  store i64 %l.0.lcssa, i64* %polly.subfn.storeaddr.l.0.lcssa921, align 8
  %polly.subfn.storeaddr.end922 = getelementptr inbounds { i64, i64, i64, i64, i64*, i64*, i64 }, { i64, i64, i64, i64, i64*, i64*, i64 }* %polly.par.userContext918, i64 0, i32 3
  store i64 %end, i64* %polly.subfn.storeaddr.end922, align 8
  %polly.subfn.storeaddr.call3923 = getelementptr inbounds { i64, i64, i64, i64, i64*, i64*, i64 }, { i64, i64, i64, i64, i64*, i64*, i64 }* %polly.par.userContext918, i64 0, i32 4
  store i64* %call3, i64** %polly.subfn.storeaddr.call3923, align 8
  %polly.subfn.storeaddr.items924 = getelementptr inbounds { i64, i64, i64, i64, i64*, i64*, i64 }, { i64, i64, i64, i64, i64*, i64*, i64 }* %polly.par.userContext918, i64 0, i32 5
  store i64* %items, i64** %polly.subfn.storeaddr.items924, align 8
  %polly.subfn.storeaddr.div925 = getelementptr inbounds { i64, i64, i64, i64, i64*, i64*, i64 }, { i64, i64, i64, i64, i64*, i64*, i64 }* %polly.par.userContext918, i64 0, i32 6
  store i64 %div, i64* %polly.subfn.storeaddr.div925, align 8
  %190 = add i64 %180, %pexp.p_div_q839
  call void @GOMP_parallel_loop_runtime_start(void (i8*)* nonnull @_sortV1__polly_subfn_3, i8* nonnull %189, i32 0, i64 0, i64 %190, i64 1) #8
  %191 = bitcast i64* %polly.par.LBPtr.i to i8*
  call void @llvm.lifetime.start(i64 8, i8* nonnull %191)
  %192 = bitcast i64* %polly.par.UBPtr.i to i8*
  call void @llvm.lifetime.start(i64 8, i8* nonnull %192)
  %polly.subfunc.arg.i.0.lcssa.i = load i64, i64* %polly.subfn.storeaddr.i.0.lcssa919, align 8
  %polly.subfunc.arg.l.0.lcssa.i = load i64, i64* %polly.subfn.storeaddr.l.0.lcssa921, align 8
  %polly.subfunc.arg.call3.i = load i64*, i64** %polly.subfn.storeaddr.call3923, align 8
  %polly.subfunc.arg.items.i = load i64*, i64** %polly.subfn.storeaddr.items924, align 8
  %193 = call i8 @GOMP_loop_runtime_next(i64* nonnull %polly.par.LBPtr.i, i64* nonnull %polly.par.UBPtr.i) #8
  %194 = icmp eq i8 %193, 0
  br i1 %194, label %_sortV1__polly_subfn_3.exit, label %polly.par.loadIVBounds.preheader.i

polly.par.loadIVBounds.preheader.i:               ; preds = %polly.parallel.for916
  %scevgep.i = getelementptr i64, i64* %polly.subfunc.arg.call3.i, i64 %polly.subfunc.arg.l.0.lcssa.i
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

_sortV1__polly_subfn_3.exit:                      ; preds = %_sortV1__polly_subfn_3.exit.loopexit, %polly.parallel.for916
  call void @GOMP_loop_end_nowait() #8
  call void @llvm.lifetime.end(i64 8, i8* nonnull %191)
  call void @llvm.lifetime.end(i64 8, i8* nonnull %192)
  call void @GOMP_parallel_end() #8
  call void @llvm.lifetime.end(i64 8, i8* nonnull %189)
  br label %while.cond48.preheader
}

; Function Attrs: argmemonly nounwind
declare void @llvm.lifetime.start(i64, i8* nocapture) #1

declare i64* @slice(i64*, i64, i32, i32) local_unnamed_addr #2

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
  %cmp = icmp eq i64* %call1, null
  br i1 %cmp, label %blklab9, label %if.end

if.end:                                           ; preds = %entry
  %4 = load i64, i64* %call1, align 8, !tbaa !1
  %call2 = call i64* @create1DArray_int64_t(i64 0, i64 %4) #8
  %cmp375 = icmp sgt i64 %4, 0
  br i1 %cmp375, label %polly.parallel.for, label %blklab10

blklab10:                                         ; preds = %main_polly_subfn.exit, %if.end
  %call7 = call i64* @_sortV1_(i64* %call2, i64 %4, i64 0, i64 %4, i64* nonnull %_15_size)
  %5 = load i64, i64* %call7, align 8, !tbaa !1
  %call9 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str, i64 0, i64 0), i64 %5)
  %sub10 = add nsw i64 %4, -1
  %arrayidx1178 = getelementptr inbounds i64, i64* %call2, i64 %sub10
  %6 = load i64, i64* %arrayidx1178, align 8, !tbaa !1
  %call12 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str, i64 0, i64 0), i64 %6)
  %call13 = call i64* @create1DArray_int64_t(i64 0, i64 24) #8
  %7 = bitcast i64* %call13 to <2 x i64>*
  store <2 x i64> <i64 80, i64 97>, <2 x i64>* %7, align 8, !tbaa !1
  %arrayidx16 = getelementptr inbounds i64, i64* %call13, i64 2
  %8 = bitcast i64* %arrayidx16 to <2 x i64>*
  store <2 x i64> <i64 115, i64 115>, <2 x i64>* %8, align 8, !tbaa !1
  %arrayidx18 = getelementptr inbounds i64, i64* %call13, i64 4
  %9 = bitcast i64* %arrayidx18 to <2 x i64>*
  store <2 x i64> <i64 32, i64 77>, <2 x i64>* %9, align 8, !tbaa !1
  %arrayidx20 = getelementptr inbounds i64, i64* %call13, i64 6
  %10 = bitcast i64* %arrayidx20 to <2 x i64>*
  store <2 x i64> <i64 101, i64 114>, <2 x i64>* %10, align 8, !tbaa !1
  %arrayidx22 = getelementptr inbounds i64, i64* %call13, i64 8
  %11 = bitcast i64* %arrayidx22 to <2 x i64>*
  store <2 x i64> <i64 103, i64 101>, <2 x i64>* %11, align 8, !tbaa !1
  %arrayidx24 = getelementptr inbounds i64, i64* %call13, i64 10
  %12 = bitcast i64* %arrayidx24 to <2 x i64>*
  store <2 x i64> <i64 115, i64 111>, <2 x i64>* %12, align 8, !tbaa !1
  %arrayidx26 = getelementptr inbounds i64, i64* %call13, i64 12
  %13 = bitcast i64* %arrayidx26 to <2 x i64>*
  store <2 x i64> <i64 114, i64 116>, <2 x i64>* %13, align 8, !tbaa !1
  %arrayidx28 = getelementptr inbounds i64, i64* %call13, i64 14
  %14 = bitcast i64* %arrayidx28 to <2 x i64>*
  store <2 x i64> <i64 32, i64 116>, <2 x i64>* %14, align 8, !tbaa !1
  %arrayidx30 = getelementptr inbounds i64, i64* %call13, i64 16
  %15 = bitcast i64* %arrayidx30 to <2 x i64>*
  store <2 x i64> <i64 101, i64 115>, <2 x i64>* %15, align 8, !tbaa !1
  %arrayidx32 = getelementptr inbounds i64, i64* %call13, i64 18
  %16 = bitcast i64* %arrayidx32 to <2 x i64>*
  store <2 x i64> <i64 116, i64 32>, <2 x i64>* %16, align 8, !tbaa !1
  %arrayidx34 = getelementptr inbounds i64, i64* %call13, i64 20
  %17 = bitcast i64* %arrayidx34 to <2 x i64>*
  store <2 x i64> <i64 99, i64 97>, <2 x i64>* %17, align 8, !tbaa !1
  %arrayidx36 = getelementptr inbounds i64, i64* %call13, i64 22
  %18 = bitcast i64* %arrayidx36 to <2 x i64>*
  store <2 x i64> <i64 115, i64 101>, <2 x i64>* %18, align 8, !tbaa !1
  call void @println_s(i64* %call13, i64 24) #8
  br label %blklab9

blklab9:                                          ; preds = %entry, %blklab10
  call void @exit(i32 0) #9
  unreachable

polly.parallel.for:                               ; preds = %if.end
  %19 = bitcast { i64, i64* }* %polly.par.userContext to i8*
  call void @llvm.lifetime.start(i64 16, i8* nonnull %19)
  %polly.subfn.storeaddr. = getelementptr inbounds { i64, i64* }, { i64, i64* }* %polly.par.userContext, i64 0, i32 0
  store i64 %4, i64* %polly.subfn.storeaddr., align 8
  %polly.subfn.storeaddr.call2 = getelementptr inbounds { i64, i64* }, { i64, i64* }* %polly.par.userContext, i64 0, i32 1
  store i64* %call2, i64** %polly.subfn.storeaddr.call2, align 8
  call void @GOMP_parallel_loop_runtime_start(void (i8*)* nonnull @main_polly_subfn, i8* nonnull %19, i32 0, i64 0, i64 %4, i64 1) #8
  %20 = bitcast i64* %polly.par.LBPtr.i to i8*
  call void @llvm.lifetime.start(i64 8, i8* nonnull %20)
  %21 = bitcast i64* %polly.par.UBPtr.i to i8*
  call void @llvm.lifetime.start(i64 8, i8* nonnull %21)
  %polly.subfunc.arg..i = load i64, i64* %polly.subfn.storeaddr., align 8
  %polly.subfunc.arg.call2.i = load i64*, i64** %polly.subfn.storeaddr.call2, align 8
  %22 = call i8 @GOMP_loop_runtime_next(i64* nonnull %polly.par.LBPtr.i, i64* nonnull %polly.par.UBPtr.i) #8
  %23 = icmp eq i8 %22, 0
  br i1 %23, label %main_polly_subfn.exit, label %polly.par.loadIVBounds.i.preheader

polly.par.loadIVBounds.i.preheader:               ; preds = %polly.parallel.for
  br label %polly.par.loadIVBounds.i

polly.par.checkNext.loopexit.i:                   ; preds = %polly.loop_header.i
  %24 = call i8 @GOMP_loop_runtime_next(i64* nonnull %polly.par.LBPtr.i, i64* nonnull %polly.par.UBPtr.i) #8
  %25 = icmp eq i8 %24, 0
  br i1 %25, label %main_polly_subfn.exit.loopexit, label %polly.par.loadIVBounds.i

polly.par.loadIVBounds.i:                         ; preds = %polly.par.loadIVBounds.i.preheader, %polly.par.checkNext.loopexit.i
  %polly.par.UB.i = load i64, i64* %polly.par.UBPtr.i, align 8
  %polly.par.LB.i = load i64, i64* %polly.par.LBPtr.i, align 8
  %polly.adjust_ub.i = add i64 %polly.par.UB.i, -2
  br label %polly.loop_header.i

polly.loop_header.i:                              ; preds = %polly.loop_header.i, %polly.par.loadIVBounds.i
  %polly.indvar.i = phi i64 [ %polly.par.LB.i, %polly.par.loadIVBounds.i ], [ %polly.indvar_next.i, %polly.loop_header.i ]
  %scevgep.i = getelementptr i64, i64* %polly.subfunc.arg.call2.i, i64 %polly.indvar.i
  %26 = sub i64 %polly.subfunc.arg..i, %polly.indvar.i
  store i64 %26, i64* %scevgep.i, align 8, !alias.scope !36, !noalias !38
  %polly.indvar_next.i = add nsw i64 %polly.indvar.i, 1
  %polly.loop_cond.i = icmp sgt i64 %polly.indvar.i, %polly.adjust_ub.i
  br i1 %polly.loop_cond.i, label %polly.par.checkNext.loopexit.i, label %polly.loop_header.i

main_polly_subfn.exit.loopexit:                   ; preds = %polly.par.checkNext.loopexit.i
  br label %main_polly_subfn.exit

main_polly_subfn.exit:                            ; preds = %main_polly_subfn.exit.loopexit, %polly.parallel.for
  call void @GOMP_loop_end_nowait() #8
  call void @llvm.lifetime.end(i64 8, i8* nonnull %20)
  call void @llvm.lifetime.end(i64 8, i8* nonnull %21)
  call void @GOMP_parallel_end() #8
  call void @llvm.lifetime.end(i64 8, i8* nonnull %19)
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
  %polly.subfunc.arg.call3 = load i64*, i64** %4, align 8
  %5 = getelementptr inbounds i8, i8* %polly.par.userContext, i64 40
  %6 = bitcast i8* %5 to i64**
  %polly.subfunc.arg.items = load i64*, i64** %6, align 8
  %7 = call i8 @GOMP_loop_runtime_next(i64* nonnull %polly.par.LBPtr, i64* nonnull %polly.par.UBPtr)
  %8 = icmp eq i8 %7, 0
  br i1 %8, label %polly.par.exit, label %polly.par.loadIVBounds.preheader

polly.par.loadIVBounds.preheader:                 ; preds = %polly.par.setup
  %scevgep = getelementptr i64, i64* %polly.subfunc.arg.call3, i64 %polly.subfunc.arg.l.0.lcssa
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
  %polly.subfunc.arg.call3 = load i64*, i64** %4, align 8
  %5 = getelementptr inbounds i8, i8* %polly.par.userContext, i64 40
  %6 = bitcast i8* %5 to i64**
  %polly.subfunc.arg.items = load i64*, i64** %6, align 8
  %7 = call i8 @GOMP_loop_runtime_next(i64* nonnull %polly.par.LBPtr, i64* nonnull %polly.par.UBPtr)
  %8 = icmp eq i8 %7, 0
  br i1 %8, label %polly.par.exit, label %polly.par.loadIVBounds.preheader

polly.par.loadIVBounds.preheader:                 ; preds = %polly.par.setup
  %scevgep = getelementptr i64, i64* %polly.subfunc.arg.call3, i64 %polly.subfunc.arg.l.0.lcssa
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
  %polly.subfunc.arg.call2 = load i64*, i64** %2, align 8
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
  %scevgep = getelementptr i64, i64* %polly.subfunc.arg.call2, i64 %polly.indvar
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
!24 = distinct !{!24, !25, !"polly.alias.scope.call3"}
!25 = distinct !{!25, !"polly.alias.scope.domain"}
!26 = !{!27}
!27 = distinct !{!27, !25, !"polly.alias.scope.items"}
!28 = !{!24}
!29 = distinct !{!29, !30, !"polly.alias.scope.call3"}
!30 = distinct !{!30, !"polly.alias.scope.domain"}
!31 = !{!32}
!32 = distinct !{!32, !30, !"polly.alias.scope.items"}
!33 = !{!29}
!34 = !{!35, !35, i64 0}
!35 = !{!"any pointer", !3, i64 0}
!36 = distinct !{!36, !37, !"polly.alias.scope.call2"}
!37 = distinct !{!37, !"polly.alias.scope.domain"}
!38 = !{}
!39 = distinct !{!39, !40, !"polly.alias.scope.call3"}
!40 = distinct !{!40, !"polly.alias.scope.domain"}
!41 = !{!42}
!42 = distinct !{!42, !40, !"polly.alias.scope.items"}
!43 = !{!39}
!44 = distinct !{!44, !45, !"polly.alias.scope.call2"}
!45 = distinct !{!45, !"polly.alias.scope.domain"}
