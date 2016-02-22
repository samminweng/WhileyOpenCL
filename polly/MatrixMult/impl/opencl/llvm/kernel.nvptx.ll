; ModuleID = 'kernel.cl'
target datalayout = "e-i64:64-v16:16-v32:32-n16:32:64"
target triple = "nvptx64-nvidia-nvcl"

; Function Attrs: noinline nounwind
define void @matrixMul(i32 addrspace(1)* nocapture %C, i32 addrspace(1)* nocapture readonly %A, i32 addrspace(1)* nocapture readonly %B, i32 %size) #0 {
entry:
  %call = tail call i64 @get_global_id(i32 0) #2
  %conv = trunc i64 %call to i32
  %call1 = tail call i64 @get_global_id(i32 1) #2
  %conv2 = trunc i64 %call1 to i32
  %cmp32 = icmp sgt i32 %size, 0
  %mul = mul nsw i32 %conv, %size
  br i1 %cmp32, label %for.body.preheader, label %for.cond.cleanup

for.body.preheader:                               ; preds = %entry
  %xtraiter = and i32 %size, 1
  %lcmp.mod = icmp eq i32 %xtraiter, 0
  br i1 %lcmp.mod, label %for.body.preheader.split, label %for.body.prol

for.body.prol:                                    ; preds = %for.body.preheader
  %idxprom.prol = sext i32 %mul to i64
  %arrayidx.prol = getelementptr inbounds i32, i32 addrspace(1)* %A, i64 %idxprom.prol
  %0 = load i32, i32 addrspace(1)* %arrayidx.prol, align 4, !tbaa !8
  %sext = shl i64 %call1, 32
  %idxprom9.prol = ashr exact i64 %sext, 32
  %arrayidx10.prol = getelementptr inbounds i32, i32 addrspace(1)* %B, i64 %idxprom9.prol
  %1 = load i32, i32 addrspace(1)* %arrayidx10.prol, align 4, !tbaa !8
  %mul11.prol = mul nsw i32 %1, %0
  br label %for.body.preheader.split

for.body.preheader.split:                         ; preds = %for.body.preheader, %for.body.prol
  %add12.lcssa.unr = phi i32 [ undef, %for.body.preheader ], [ %mul11.prol, %for.body.prol ]
  %tmp.034.unr = phi i32 [ 0, %for.body.preheader ], [ %mul11.prol, %for.body.prol ]
  %k.033.unr = phi i32 [ 0, %for.body.preheader ], [ 1, %for.body.prol ]
  %2 = icmp eq i32 %size, 1
  br i1 %2, label %for.cond.cleanup.loopexit, label %for.body.preheader.split.split

for.body.preheader.split.split:                   ; preds = %for.body.preheader.split
  br label %for.body

for.cond.cleanup.loopexit.unr-lcssa:              ; preds = %for.body
  %add12.1.lcssa = phi i32 [ %add12.1, %for.body ]
  br label %for.cond.cleanup.loopexit

for.cond.cleanup.loopexit:                        ; preds = %for.body.preheader.split, %for.cond.cleanup.loopexit.unr-lcssa
  %add12.lcssa = phi i32 [ %add12.lcssa.unr, %for.body.preheader.split ], [ %add12.1.lcssa, %for.cond.cleanup.loopexit.unr-lcssa ]
  br label %for.cond.cleanup

for.cond.cleanup:                                 ; preds = %for.cond.cleanup.loopexit, %entry
  %tmp.0.lcssa = phi i32 [ 0, %entry ], [ %add12.lcssa, %for.cond.cleanup.loopexit ]
  %add14 = add nsw i32 %mul, %conv2
  %idxprom15 = sext i32 %add14 to i64
  %arrayidx16 = getelementptr inbounds i32, i32 addrspace(1)* %C, i64 %idxprom15
  store i32 %tmp.0.lcssa, i32 addrspace(1)* %arrayidx16, align 4, !tbaa !8
  ret void

for.body:                                         ; preds = %for.body, %for.body.preheader.split.split
  %tmp.034 = phi i32 [ %tmp.034.unr, %for.body.preheader.split.split ], [ %add12.1, %for.body ]
  %k.033 = phi i32 [ %k.033.unr, %for.body.preheader.split.split ], [ %inc.1, %for.body ]
  %add = add nsw i32 %k.033, %mul
  %idxprom = sext i32 %add to i64
  %arrayidx = getelementptr inbounds i32, i32 addrspace(1)* %A, i64 %idxprom
  %3 = load i32, i32 addrspace(1)* %arrayidx, align 4, !tbaa !8
  %mul7 = mul nsw i32 %k.033, %size
  %add8 = add nsw i32 %mul7, %conv2
  %idxprom9 = sext i32 %add8 to i64
  %arrayidx10 = getelementptr inbounds i32, i32 addrspace(1)* %B, i64 %idxprom9
  %4 = load i32, i32 addrspace(1)* %arrayidx10, align 4, !tbaa !8
  %mul11 = mul nsw i32 %4, %3
  %add12 = add nsw i32 %mul11, %tmp.034
  %inc = add nuw nsw i32 %k.033, 1
  %add.1 = add nsw i32 %inc, %mul
  %idxprom.1 = sext i32 %add.1 to i64
  %arrayidx.1 = getelementptr inbounds i32, i32 addrspace(1)* %A, i64 %idxprom.1
  %5 = load i32, i32 addrspace(1)* %arrayidx.1, align 4, !tbaa !8
  %mul7.1 = mul nsw i32 %inc, %size
  %add8.1 = add nsw i32 %mul7.1, %conv2
  %idxprom9.1 = sext i32 %add8.1 to i64
  %arrayidx10.1 = getelementptr inbounds i32, i32 addrspace(1)* %B, i64 %idxprom9.1
  %6 = load i32, i32 addrspace(1)* %arrayidx10.1, align 4, !tbaa !8
  %mul11.1 = mul nsw i32 %6, %5
  %add12.1 = add nsw i32 %mul11.1, %add12
  %inc.1 = add nsw i32 %k.033, 2
  %exitcond.1 = icmp eq i32 %inc.1, %size
  br i1 %exitcond.1, label %for.cond.cleanup.loopexit.unr-lcssa, label %for.body
}

declare i64 @get_global_id(i32) #1

attributes #0 = { noinline nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind }

!opencl.kernels = !{!0}
!nvvm.annotations = !{!6}
!llvm.ident = !{!7}

!0 = !{void (i32 addrspace(1)*, i32 addrspace(1)*, i32 addrspace(1)*, i32)* @matrixMul, !1, !2, !3, !4, !5}
!1 = !{!"kernel_arg_addr_space", i32 1, i32 1, i32 1, i32 0}
!2 = !{!"kernel_arg_access_qual", !"none", !"none", !"none", !"none"}
!3 = !{!"kernel_arg_type", !"int*", !"int*", !"int*", !"int"}
!4 = !{!"kernel_arg_base_type", !"int*", !"int*", !"int*", !"int"}
!5 = !{!"kernel_arg_type_qual", !"", !"", !"", !""}
!6 = !{void (i32 addrspace(1)*, i32 addrspace(1)*, i32 addrspace(1)*, i32)* @matrixMul, !"kernel", i32 1}
!7 = !{!"clang version 3.9.0 (http://llvm.org/git/clang.git c43284c4913e075fc10ac6dea2961788a660f09d) (http://llvm.org/git/llvm.git 7f53bedefce9ad990a1906fed303e104ff621783)"}
!8 = !{!9, !9, i64 0}
!9 = !{!"int", !10, i64 0}
!10 = !{!"omnipotent char", !11, i64 0}
!11 = !{!"Simple C/C++ TBAA"}
