; ModuleID = 'kernel.cl'
target datalayout = "e-p:32:32-p1:64:64-p2:64:64-p3:32:32-p4:64:64-p5:32:32-p24:64:64-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64"
target triple = "amdgcn--amdhsa"

; Function Attrs: nounwind
define void @matrixMul(i32 addrspace(1)* nocapture %C, i32 addrspace(1)* nocapture readonly %A, i32 addrspace(1)* nocapture readonly %B, i32 %size) #0 {
entry:
  %call = tail call i32 @get_global_id(i32 0) #2
  %call1 = tail call i32 @get_global_id(i32 1) #2
  %cmp28 = icmp sgt i32 %size, 0
  %mul = mul nsw i32 %call, %size
  br i1 %cmp28, label %for.body.preheader, label %for.cond.cleanup

for.body.preheader:                               ; preds = %entry
  %0 = sext i32 %size to i64
  %1 = sext i32 %call1 to i64
  %2 = sext i32 %mul to i64
  br label %for.body

for.cond.cleanup.loopexit:                        ; preds = %for.body
  %add9.lcssa = phi i32 [ %add9, %for.body ]
  br label %for.cond.cleanup

for.cond.cleanup:                                 ; preds = %for.cond.cleanup.loopexit, %entry
  %tmp.0.lcssa = phi i32 [ 0, %entry ], [ %add9.lcssa, %for.cond.cleanup.loopexit ]
  %add11 = add nsw i32 %mul, %call1
  %3 = sext i32 %add11 to i64
  %arrayidx12 = getelementptr inbounds i32, i32 addrspace(1)* %C, i64 %3
  store i32 %tmp.0.lcssa, i32 addrspace(1)* %arrayidx12, align 4, !tbaa !7
  ret void

for.body:                                         ; preds = %for.body, %for.body.preheader
  %indvars.iv = phi i64 [ 0, %for.body.preheader ], [ %indvars.iv.next, %for.body ]
  %tmp.030 = phi i32 [ 0, %for.body.preheader ], [ %add9, %for.body ]
  %4 = add nsw i64 %indvars.iv, %2
  %arrayidx = getelementptr inbounds i32, i32 addrspace(1)* %A, i64 %4
  %5 = load i32, i32 addrspace(1)* %arrayidx, align 4, !tbaa !7
  %6 = mul nsw i64 %indvars.iv, %0
  %7 = add nsw i64 %6, %1
  %arrayidx7 = getelementptr inbounds i32, i32 addrspace(1)* %B, i64 %7
  %8 = load i32, i32 addrspace(1)* %arrayidx7, align 4, !tbaa !7
  %mul8 = mul nsw i32 %8, %5
  %add9 = add nsw i32 %mul8, %tmp.030
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %lftr.wideiv = trunc i64 %indvars.iv.next to i32
  %exitcond = icmp eq i32 %lftr.wideiv, %size
  br i1 %exitcond, label %for.cond.cleanup.loopexit, label %for.body
}

declare i32 @get_global_id(i32) #1

attributes #0 = { nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="carrizo" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="carrizo" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind }

!opencl.kernels = !{!0}
!llvm.ident = !{!6}

!0 = !{void (i32 addrspace(1)*, i32 addrspace(1)*, i32 addrspace(1)*, i32)* @matrixMul, !1, !2, !3, !4, !5}
!1 = !{!"kernel_arg_addr_space", i32 1, i32 1, i32 1, i32 0}
!2 = !{!"kernel_arg_access_qual", !"none", !"none", !"none", !"none"}
!3 = !{!"kernel_arg_type", !"int*", !"int*", !"int*", !"int"}
!4 = !{!"kernel_arg_base_type", !"int*", !"int*", !"int*", !"int"}
!5 = !{!"kernel_arg_type_qual", !"", !"", !"", !""}
!6 = !{!"clang version 3.9.0 (http://llvm.org/git/clang.git c43284c4913e075fc10ac6dea2961788a660f09d) (http://llvm.org/git/llvm.git 7f53bedefce9ad990a1906fed303e104ff621783)"}
!7 = !{!8, !8, i64 0}
!8 = !{!"int", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C/C++ TBAA"}
