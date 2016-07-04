; ModuleID = 'llvm/original.preopt.ll.tmp'
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
  br label %entry.split

entry.split:                                      ; preds = %entry
  %cmp = icmp eq i64 %a, 0
  br i1 %cmp, label %cleanup, label %while.cond.preheader

while.cond.preheader:                             ; preds = %entry.split
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
  %1 = tail call i64 @fwrite(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str, i64 0, i64 0), i64 4, i64 1, %struct._IO_FILE* %0) #6
  tail call void @exit(i32 -1) #7
  unreachable

blklab4:                                          ; preds = %if.end9, %blklab4.preheader
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

cleanup:                                          ; preds = %cleanup.loopexit, %blklab4.lr.ph.preheader, %entry.split
  %retval.0 = phi i64 [ %b, %entry.split ], [ %a, %blklab4.lr.ph.preheader ], [ %a.addr.033.lcssa.lcssa, %cleanup.loopexit ]
  ret i64 %retval.0
}

; Function Attrs: noreturn nounwind
declare void @exit(i32) local_unnamed_addr #1

; Function Attrs: noreturn nounwind uwtable
define i32 @main(i32 %argc, i8** %args) local_unnamed_addr #2 {
entry:
  br label %entry.split

entry.split:                                      ; preds = %entry
  %call = tail call i64** @convertArgsToIntArray(i32 %argc, i8** %args) #5
  %0 = load i64*, i64** %call, align 8, !tbaa !1
  %call1 = tail call i64* @parseStringToInt(i64* %0) #5
  %cmp = icmp eq i64* %call1, null
  br i1 %cmp, label %if.end90, label %if.end5

if.end5:                                          ; preds = %entry.split
  %1 = load i64, i64* %call1, align 8, !tbaa !5
  %call10 = tail call i64* @create1DArray(i32 0, i32 4) #5
  %2 = bitcast i64* %call10 to <2 x i64>*
  store <2 x i64> <i64 78, i64 32>, <2 x i64>* %2, align 8, !tbaa !5
  %arrayidx13 = getelementptr inbounds i64, i64* %call10, i64 2
  %3 = bitcast i64* %arrayidx13 to <2 x i64>*
  store <2 x i64> <i64 61, i64 32>, <2 x i64>* %3, align 8, !tbaa !5
  tail call void @printf_s(i64* %call10, i64 4) #5
  %call15 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.1, i64 0, i64 0), i64 %1)
  %cmp16159 = icmp sgt i64 %1, 0
  br i1 %cmp16159, label %while.cond20.preheader.us.preheader, label %if.then83

while.cond20.preheader.us.preheader:              ; preds = %if.end5
  %4 = add i64 %1, -1
  %5 = zext i64 %4 to i65
  %6 = add i64 %1, -2
  %7 = zext i64 %6 to i65
  %8 = mul i65 %5, %7
  %9 = lshr i65 %8, 1
  %10 = trunc i65 %9 to i64
  %11 = add i64 %10, %4
  br label %while.cond20.preheader.us

while.cond20.preheader.us:                        ; preds = %blklab10.loopexit.us, %while.cond20.preheader.us.preheader
  %sum.0162.us = phi i64 [ %add.lcssa.us, %blklab10.loopexit.us ], [ 0, %while.cond20.preheader.us.preheader ]
  %i.0160.us = phi i64 [ %add28.us, %blklab10.loopexit.us ], [ 0, %while.cond20.preheader.us.preheader ]
  %cmp.i.us = icmp eq i64 %i.0160.us, 0
  br i1 %cmp.i.us, label %if.end25.us.us.us.preheader, label %if.end25.us174.preheader

if.end25.us174.preheader:                         ; preds = %while.cond20.preheader.us
  br label %if.end25.us174

if.end25.us.us.us.preheader:                      ; preds = %while.cond20.preheader.us
  %12 = add i64 %11, %sum.0162.us
  br label %blklab10.loopexit.us

if.end25.us174:                                   ; preds = %if.end25.us174.preheader, %gcd.exit.loopexit.us198
  %sum.1158.us175 = phi i64 [ %add.us190, %gcd.exit.loopexit.us198 ], [ %sum.0162.us, %if.end25.us174.preheader ]
  %j.0157.us176 = phi i64 [ %add27.us191, %gcd.exit.loopexit.us198 ], [ 0, %if.end25.us174.preheader ]
  %cmp4.i171.us197 = icmp eq i64 %j.0157.us176, 0
  br i1 %cmp4.i171.us197, label %gcd.exit.loopexit.us198, label %blklab4.i.preheader.us193.preheader

blklab4.i.preheader.us193.preheader:              ; preds = %if.end25.us174
  br label %blklab4.i.preheader.us193

blklab4.i.us178:                                  ; preds = %blklab4.i.preheader.us193, %if.end9.i.us185
  %a.addr.033.i.us179 = phi i64 [ %sub.i.us186, %if.end9.i.us185 ], [ %a.addr.0.ph36.i172.us195, %blklab4.i.preheader.us193 ]
  %cmp7.i.us180 = icmp sgt i64 %a.addr.033.i.us179, %b.addr.0.ph35.i173.us194
  br i1 %cmp7.i.us180, label %if.end9.i.us185, label %blklab5.i.us181

blklab5.i.us181:                                  ; preds = %blklab4.i.us178
  %a.addr.033.i.us179.lcssa = phi i64 [ %a.addr.033.i.us179, %blklab4.i.us178 ]
  %sub10.i.us183 = sub nsw i64 %b.addr.0.ph35.i173.us194, %a.addr.033.i.us179.lcssa
  %cmp4.i.us184 = icmp eq i64 %sub10.i.us183, 0
  br i1 %cmp4.i.us184, label %gcd.exit.loopexit.us198.loopexit, label %blklab4.i.preheader.us193

if.end9.i.us185:                                  ; preds = %blklab4.i.us178
  %sub.i.us186 = sub nsw i64 %a.addr.033.i.us179, %b.addr.0.ph35.i173.us194
  %cmp1.i.us187 = icmp sgt i64 %sub.i.us186, -1
  br i1 %cmp1.i.us187, label %blklab4.i.us178, label %if.end3.i

blklab4.i.preheader.us193:                        ; preds = %blklab4.i.preheader.us193.preheader, %blklab5.i.us181
  %b.addr.0.ph35.i173.us194 = phi i64 [ %sub10.i.us183, %blklab5.i.us181 ], [ %j.0157.us176, %blklab4.i.preheader.us193.preheader ]
  %a.addr.0.ph36.i172.us195 = phi i64 [ %a.addr.033.i.us179.lcssa, %blklab5.i.us181 ], [ %i.0160.us, %blklab4.i.preheader.us193.preheader ]
  br label %blklab4.i.us178

gcd.exit.loopexit.us198.loopexit:                 ; preds = %blklab5.i.us181
  %a.addr.033.i.us179.lcssa.lcssa = phi i64 [ %a.addr.033.i.us179.lcssa, %blklab5.i.us181 ]
  br label %gcd.exit.loopexit.us198

gcd.exit.loopexit.us198:                          ; preds = %gcd.exit.loopexit.us198.loopexit, %if.end25.us174
  %a.addr.0.ph36.i.lcssa.us199 = phi i64 [ %i.0160.us, %if.end25.us174 ], [ %a.addr.033.i.us179.lcssa.lcssa, %gcd.exit.loopexit.us198.loopexit ]
  %add.us190 = add nsw i64 %a.addr.0.ph36.i.lcssa.us199, %sum.1158.us175
  %add27.us191 = add nuw nsw i64 %j.0157.us176, 1
  %exitcond.us192 = icmp eq i64 %add27.us191, %1
  br i1 %exitcond.us192, label %blklab10.loopexit.us.loopexit, label %if.end25.us174

blklab10.loopexit.us.loopexit:                    ; preds = %gcd.exit.loopexit.us198
  %add.us190.lcssa = phi i64 [ %add.us190, %gcd.exit.loopexit.us198 ]
  br label %blklab10.loopexit.us

blklab10.loopexit.us:                             ; preds = %blklab10.loopexit.us.loopexit, %if.end25.us.us.us.preheader
  %add.lcssa.us = phi i64 [ %12, %if.end25.us.us.us.preheader ], [ %add.us190.lcssa, %blklab10.loopexit.us.loopexit ]
  %add28.us = add nuw nsw i64 %i.0160.us, 1
  %exitcond164.us = icmp eq i64 %add28.us, %1
  br i1 %exitcond164.us, label %if.then83.loopexit, label %while.cond20.preheader.us

if.end3.i:                                        ; preds = %if.end9.i.us185
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !1
  %14 = tail call i64 @fwrite(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str, i64 0, i64 0), i64 4, i64 1, %struct._IO_FILE* %13) #8
  tail call void @exit(i32 -1) #7
  unreachable

if.then83.loopexit:                               ; preds = %blklab10.loopexit.us
  %add.lcssa.us.lcssa = phi i64 [ %add.lcssa.us, %blklab10.loopexit.us ]
  br label %if.then83

if.then83:                                        ; preds = %if.then83.loopexit, %if.end5
  %sum.0.lcssa = phi i64 [ 0, %if.end5 ], [ %add.lcssa.us.lcssa, %if.then83.loopexit ]
  %call33 = tail call i64* @create1DArray(i32 0, i32 5) #5
  %15 = bitcast i64* %call33 to <2 x i64>*
  store <2 x i64> <i64 83, i64 117>, <2 x i64>* %15, align 8, !tbaa !5
  %arrayidx36 = getelementptr inbounds i64, i64* %call33, i64 2
  %16 = bitcast i64* %arrayidx36 to <2 x i64>*
  store <2 x i64> <i64 109, i64 58>, <2 x i64>* %16, align 8, !tbaa !5
  %arrayidx38 = getelementptr inbounds i64, i64* %call33, i64 4
  store i64 32, i64* %arrayidx38, align 8, !tbaa !5
  tail call void @printf_s(i64* %call33, i64 5) #5
  %call39 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.1, i64 0, i64 0), i64 %sum.0.lcssa)
  %call44 = tail call i64* @create1DArray(i32 0, i32 25) #5
  %17 = bitcast i64* %call44 to <2 x i64>*
  store <2 x i64> <i64 80, i64 97>, <2 x i64>* %17, align 8, !tbaa !5
  %arrayidx47 = getelementptr inbounds i64, i64* %call44, i64 2
  %18 = bitcast i64* %arrayidx47 to <2 x i64>*
  store <2 x i64> <i64 115, i64 115>, <2 x i64>* %18, align 8, !tbaa !5
  %arrayidx49 = getelementptr inbounds i64, i64* %call44, i64 4
  %19 = bitcast i64* %arrayidx49 to <2 x i64>*
  store <2 x i64> <i64 32, i64 69>, <2 x i64>* %19, align 8, !tbaa !5
  %arrayidx51 = getelementptr inbounds i64, i64* %call44, i64 6
  %20 = bitcast i64* %arrayidx51 to <2 x i64>*
  store <2 x i64> <i64 117, i64 99>, <2 x i64>* %20, align 8, !tbaa !5
  %arrayidx53 = getelementptr inbounds i64, i64* %call44, i64 8
  %21 = bitcast i64* %arrayidx53 to <2 x i64>*
  store <2 x i64> <i64 108, i64 105>, <2 x i64>* %21, align 8, !tbaa !5
  %arrayidx55 = getelementptr inbounds i64, i64* %call44, i64 10
  %22 = bitcast i64* %arrayidx55 to <2 x i64>*
  store <2 x i64> <i64 100, i64 32>, <2 x i64>* %22, align 8, !tbaa !5
  %arrayidx57 = getelementptr inbounds i64, i64* %call44, i64 12
  %23 = bitcast i64* %arrayidx57 to <2 x i64>*
  store <2 x i64> <i64 71, i64 67>, <2 x i64>* %23, align 8, !tbaa !5
  %arrayidx59 = getelementptr inbounds i64, i64* %call44, i64 14
  %24 = bitcast i64* %arrayidx59 to <2 x i64>*
  store <2 x i64> <i64 68, i64 32>, <2 x i64>* %24, align 8, !tbaa !5
  %arrayidx61 = getelementptr inbounds i64, i64* %call44, i64 16
  %25 = bitcast i64* %arrayidx61 to <2 x i64>*
  store <2 x i64> <i64 116, i64 101>, <2 x i64>* %25, align 8, !tbaa !5
  %arrayidx63 = getelementptr inbounds i64, i64* %call44, i64 18
  %26 = bitcast i64* %arrayidx63 to <2 x i64>*
  store <2 x i64> <i64 115, i64 116>, <2 x i64>* %26, align 8, !tbaa !5
  %arrayidx65 = getelementptr inbounds i64, i64* %call44, i64 20
  %27 = bitcast i64* %arrayidx65 to <2 x i64>*
  store <2 x i64> <i64 32, i64 99>, <2 x i64>* %27, align 8, !tbaa !5
  %arrayidx67 = getelementptr inbounds i64, i64* %call44, i64 22
  %28 = bitcast i64* %arrayidx67 to <2 x i64>*
  store <2 x i64> <i64 97, i64 115>, <2 x i64>* %28, align 8, !tbaa !5
  %arrayidx69 = getelementptr inbounds i64, i64* %call44, i64 24
  store i64 101, i64* %arrayidx69, align 8, !tbaa !5
  tail call void @println_s(i64* %call44, i64 25) #5
  %phitmp = bitcast i64* %call44 to i8*
  %phitmp153 = bitcast i64* %call33 to i8*
  %phitmp154 = bitcast i64* %call10 to i8*
  %29 = bitcast i64* %call1 to i8*
  tail call void @free(i8* %29) #5
  tail call void @free(i8* %phitmp154) #5
  tail call void @free(i8* %phitmp153) #5
  tail call void @free(i8* %phitmp) #5
  br label %if.end90

if.end90:                                         ; preds = %if.then83, %entry.split
  tail call void @exit(i32 0) #7
  unreachable
}

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
