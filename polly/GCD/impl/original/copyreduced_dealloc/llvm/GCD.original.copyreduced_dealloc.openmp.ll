; ModuleID = 'GCD_original.c'
source_filename = "GCD_original.c"
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

; Function Attrs: noreturn nounwind uwtable
define i32 @main(i32 %argc, i8** %args) local_unnamed_addr #2 {
entry:
  %call = tail call i64** @convertArgsToIntArray(i32 %argc, i8** %args) #5
  %sub = add nsw i32 %argc, -1
  %conv = sext i32 %sub to i64
  %0 = load i64*, i64** %call, align 8, !tbaa !1
  %call1 = tail call i64* @parseStringToInt(i64* %0) #5
  %cmp = icmp eq i64* %call1, null
  br i1 %cmp, label %if.then74, label %if.end8

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
  %cmp19165 = icmp sgt i64 %1, 0
  br i1 %cmp19165, label %while.cond23.preheader.us.preheader, label %if.end34

while.cond23.preheader.us.preheader:              ; preds = %if.end8
  %4 = add i64 %1, -1
  %5 = zext i64 %4 to i65
  %6 = add i64 %1, -2
  %7 = zext i64 %6 to i65
  %8 = mul i65 %5, %7
  %9 = lshr i65 %8, 1
  %10 = trunc i65 %9 to i64
  %11 = add i64 %1, %10
  %12 = add i64 %11, -1
  br label %while.cond23.preheader.us

while.cond23.preheader.us:                        ; preds = %while.cond23.preheader.us.preheader, %blklab10.loopexit.us
  %sum.0168.us = phi i64 [ %add.lcssa.us, %blklab10.loopexit.us ], [ 0, %while.cond23.preheader.us.preheader ]
  %i.0166.us = phi i64 [ %add31.us, %blklab10.loopexit.us ], [ 0, %while.cond23.preheader.us.preheader ]
  %cmp.i.us = icmp eq i64 %i.0166.us, 0
  br i1 %cmp.i.us, label %if.end28.us.us.us.preheader, label %if.end28.us177.preheader

if.end28.us177.preheader:                         ; preds = %while.cond23.preheader.us
  br label %if.end28.us177

if.end28.us.us.us.preheader:                      ; preds = %while.cond23.preheader.us
  %13 = add i64 %12, %sum.0168.us
  br label %blklab10.loopexit.us

if.end28.us177:                                   ; preds = %if.end28.us177.preheader, %gcd.exit.loopexit.us201
  %sum.1164.us178 = phi i64 [ %add.us193, %gcd.exit.loopexit.us201 ], [ %sum.0168.us, %if.end28.us177.preheader ]
  %j.0163.us179 = phi i64 [ %add30.us194, %gcd.exit.loopexit.us201 ], [ 0, %if.end28.us177.preheader ]
  %cmp4.i174.us200 = icmp eq i64 %j.0163.us179, 0
  br i1 %cmp4.i174.us200, label %gcd.exit.loopexit.us201, label %blklab4.i.preheader.us196.preheader

blklab4.i.preheader.us196.preheader:              ; preds = %if.end28.us177
  br label %blklab4.i.preheader.us196

blklab4.i.us181:                                  ; preds = %blklab4.i.preheader.us196, %if.end9.i.us188
  %a.addr.033.i.us182 = phi i64 [ %sub.i.us189, %if.end9.i.us188 ], [ %a.addr.0.ph36.i175.us198, %blklab4.i.preheader.us196 ]
  %cmp7.i.us183 = icmp sgt i64 %a.addr.033.i.us182, %b.addr.0.ph35.i176.us197
  br i1 %cmp7.i.us183, label %if.end9.i.us188, label %blklab5.i.us184

blklab5.i.us184:                                  ; preds = %blklab4.i.us181
  %sub10.i.us186 = sub nsw i64 %b.addr.0.ph35.i176.us197, %a.addr.033.i.us182
  %cmp4.i.us187 = icmp eq i64 %sub10.i.us186, 0
  br i1 %cmp4.i.us187, label %gcd.exit.loopexit.us201.loopexit, label %blklab4.i.preheader.us196

if.end9.i.us188:                                  ; preds = %blklab4.i.us181
  %sub.i.us189 = sub nsw i64 %a.addr.033.i.us182, %b.addr.0.ph35.i176.us197
  %cmp1.i.us190 = icmp sgt i64 %sub.i.us189, -1
  br i1 %cmp1.i.us190, label %blklab4.i.us181, label %if.end3.i

blklab4.i.preheader.us196:                        ; preds = %blklab4.i.preheader.us196.preheader, %blklab5.i.us184
  %b.addr.0.ph35.i176.us197 = phi i64 [ %sub10.i.us186, %blklab5.i.us184 ], [ %j.0163.us179, %blklab4.i.preheader.us196.preheader ]
  %a.addr.0.ph36.i175.us198 = phi i64 [ %a.addr.033.i.us182, %blklab5.i.us184 ], [ %i.0166.us, %blklab4.i.preheader.us196.preheader ]
  br label %blklab4.i.us181

gcd.exit.loopexit.us201.loopexit:                 ; preds = %blklab5.i.us184
  br label %gcd.exit.loopexit.us201

gcd.exit.loopexit.us201:                          ; preds = %gcd.exit.loopexit.us201.loopexit, %if.end28.us177
  %a.addr.0.ph36.i.lcssa.us202 = phi i64 [ %i.0166.us, %if.end28.us177 ], [ %a.addr.033.i.us182, %gcd.exit.loopexit.us201.loopexit ]
  %add.us193 = add nsw i64 %a.addr.0.ph36.i.lcssa.us202, %sum.1164.us178
  %add30.us194 = add nuw nsw i64 %j.0163.us179, 1
  %exitcond.us195 = icmp eq i64 %add30.us194, %1
  br i1 %exitcond.us195, label %blklab10.loopexit.us.loopexit, label %if.end28.us177

blklab10.loopexit.us.loopexit:                    ; preds = %gcd.exit.loopexit.us201
  br label %blklab10.loopexit.us

blklab10.loopexit.us:                             ; preds = %blklab10.loopexit.us.loopexit, %if.end28.us.us.us.preheader
  %add.lcssa.us = phi i64 [ %13, %if.end28.us.us.us.preheader ], [ %add.us193, %blklab10.loopexit.us.loopexit ]
  %add31.us = add nuw nsw i64 %i.0166.us, 1
  %exitcond170.us = icmp eq i64 %add31.us, %1
  br i1 %exitcond170.us, label %if.end34.loopexit, label %while.cond23.preheader.us

if.end3.i:                                        ; preds = %if.end9.i.us188
  %14 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !1
  %15 = tail call i64 @fwrite(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str, i64 0, i64 0), i64 4, i64 1, %struct._IO_FILE* %14) #8
  tail call void @exit(i32 -1) #7
  unreachable

if.end34.loopexit:                                ; preds = %blklab10.loopexit.us
  br label %if.end34

if.end34:                                         ; preds = %if.end34.loopexit, %if.end8
  %sum.0.lcssa = phi i64 [ 0, %if.end8 ], [ %add.lcssa.us, %if.end34.loopexit ]
  %call36 = tail call i64* @create1DArray(i32 0, i32 5) #5
  %16 = bitcast i64* %call36 to <2 x i64>*
  store <2 x i64> <i64 83, i64 117>, <2 x i64>* %16, align 8, !tbaa !5
  %arrayidx39 = getelementptr inbounds i64, i64* %call36, i64 2
  %17 = bitcast i64* %arrayidx39 to <2 x i64>*
  store <2 x i64> <i64 109, i64 58>, <2 x i64>* %17, align 8, !tbaa !5
  %arrayidx41 = getelementptr inbounds i64, i64* %call36, i64 4
  store i64 32, i64* %arrayidx41, align 8, !tbaa !5
  tail call void @printf_s(i64* %call36, i64 5) #5
  %call42 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.1, i64 0, i64 0), i64 %sum.0.lcssa)
  %call47 = tail call i64* @create1DArray(i32 0, i32 25) #5
  %18 = bitcast i64* %call47 to <2 x i64>*
  store <2 x i64> <i64 80, i64 97>, <2 x i64>* %18, align 8, !tbaa !5
  %arrayidx50 = getelementptr inbounds i64, i64* %call47, i64 2
  %19 = bitcast i64* %arrayidx50 to <2 x i64>*
  store <2 x i64> <i64 115, i64 115>, <2 x i64>* %19, align 8, !tbaa !5
  %arrayidx52 = getelementptr inbounds i64, i64* %call47, i64 4
  %20 = bitcast i64* %arrayidx52 to <2 x i64>*
  store <2 x i64> <i64 32, i64 69>, <2 x i64>* %20, align 8, !tbaa !5
  %arrayidx54 = getelementptr inbounds i64, i64* %call47, i64 6
  %21 = bitcast i64* %arrayidx54 to <2 x i64>*
  store <2 x i64> <i64 117, i64 99>, <2 x i64>* %21, align 8, !tbaa !5
  %arrayidx56 = getelementptr inbounds i64, i64* %call47, i64 8
  %22 = bitcast i64* %arrayidx56 to <2 x i64>*
  store <2 x i64> <i64 108, i64 105>, <2 x i64>* %22, align 8, !tbaa !5
  %arrayidx58 = getelementptr inbounds i64, i64* %call47, i64 10
  %23 = bitcast i64* %arrayidx58 to <2 x i64>*
  store <2 x i64> <i64 100, i64 32>, <2 x i64>* %23, align 8, !tbaa !5
  %arrayidx60 = getelementptr inbounds i64, i64* %call47, i64 12
  %24 = bitcast i64* %arrayidx60 to <2 x i64>*
  store <2 x i64> <i64 71, i64 67>, <2 x i64>* %24, align 8, !tbaa !5
  %arrayidx62 = getelementptr inbounds i64, i64* %call47, i64 14
  %25 = bitcast i64* %arrayidx62 to <2 x i64>*
  store <2 x i64> <i64 68, i64 32>, <2 x i64>* %25, align 8, !tbaa !5
  %arrayidx64 = getelementptr inbounds i64, i64* %call47, i64 16
  %26 = bitcast i64* %arrayidx64 to <2 x i64>*
  store <2 x i64> <i64 116, i64 101>, <2 x i64>* %26, align 8, !tbaa !5
  %arrayidx66 = getelementptr inbounds i64, i64* %call47, i64 18
  %27 = bitcast i64* %arrayidx66 to <2 x i64>*
  store <2 x i64> <i64 115, i64 116>, <2 x i64>* %27, align 8, !tbaa !5
  %arrayidx68 = getelementptr inbounds i64, i64* %call47, i64 20
  %28 = bitcast i64* %arrayidx68 to <2 x i64>*
  store <2 x i64> <i64 32, i64 99>, <2 x i64>* %28, align 8, !tbaa !5
  %arrayidx70 = getelementptr inbounds i64, i64* %call47, i64 22
  %29 = bitcast i64* %arrayidx70 to <2 x i64>*
  store <2 x i64> <i64 97, i64 115>, <2 x i64>* %29, align 8, !tbaa !5
  %arrayidx72 = getelementptr inbounds i64, i64* %call47, i64 24
  store i64 101, i64* %arrayidx72, align 8, !tbaa !5
  tail call void @println_s(i64* %call47, i64 25) #5
  %phitmp = bitcast i64* %call47 to i8*
  %phitmp159 = bitcast i64* %call36 to i8*
  %phitmp160 = bitcast i64* %call13 to i8*
  br label %if.then74

if.then74:                                        ; preds = %if.end34, %entry
  %_12.0 = phi i8* [ null, %entry ], [ %phitmp160, %if.end34 ]
  %_12_dealloc.0 = phi i1 [ false, %entry ], [ true, %if.end34 ]
  %_26.0 = phi i8* [ null, %entry ], [ %phitmp159, %if.end34 ]
  %_31.0 = phi i8* [ null, %entry ], [ %phitmp, %if.end34 ]
  %30 = bitcast i64* %call1 to i8*
  tail call void @free(i8* %30) #5
  tail call void @free2DArray(i64** %call, i64 %conv) #5
  br i1 %_12_dealloc.0, label %if.then86, label %if.end93

if.then86:                                        ; preds = %if.then74
  tail call void @free(i8* %_12.0) #5
  tail call void @free(i8* %_26.0) #5
  tail call void @free(i8* %_31.0) #5
  br label %if.end93

if.end93:                                         ; preds = %if.then74, %if.then86
  tail call void @exit(i32 0) #7
  unreachable
}

declare void @free2DArray(i64**, i64) local_unnamed_addr #3

declare i64** @convertArgsToIntArray(i32, i8**) local_unnamed_addr #3

declare i64* @parseStringToInt(i64*) local_unnamed_addr #3

; Function Attrs: nounwind
declare void @free(i8* nocapture) local_unnamed_addr #4

declare i64* @create1DArray(i32, i32) local_unnamed_addr #3

declare void @printf_s(i64*, i64) local_unnamed_addr #3

; Function Attrs: nounwind
declare i32 @printf(i8* nocapture readonly, ...) local_unnamed_addr #4

declare void @println_s(i64*, i64) local_unnamed_addr #3

; Function Attrs: nounwind
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) local_unnamed_addr #5

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { noreturn nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noreturn nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { nounwind }
attributes #6 = { cold }
attributes #7 = { noreturn nounwind }
attributes #8 = { cold nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 3.9.0 (http://llvm.org/git/clang.git f82fb5beb88e841f7a00cfb2a2ceabe46bcb2a9b) (http://llvm.org/git/llvm.git bafbf2b643f118fd2ea402ed6cd204281c7e9e94)"}
!1 = !{!2, !2, i64 0}
!2 = !{!"any pointer", !3, i64 0}
!3 = !{!"omnipotent char", !4, i64 0}
!4 = !{!"Simple C/C++ TBAA"}
!5 = !{!6, !6, i64 0}
!6 = !{!"long long", !3, i64 0}
