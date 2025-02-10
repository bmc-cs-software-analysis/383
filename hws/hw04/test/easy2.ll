; ModuleID = 'easy2.c'
source_filename = "easy2.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, %struct._IO_codecvt*, %struct._IO_wide_data*, %struct._IO_FILE*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type opaque
%struct._IO_codecvt = type opaque
%struct._IO_wide_data = type opaque

@stdin = external global %struct._IO_FILE*, align 8

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 !dbg !10 {
entry:
  %retval = alloca i32, align 4
  %input = alloca [65536 x i8], align 16
  %x = alloca i32, align 4
  %z = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  call void @llvm.dbg.declare(metadata [65536 x i8]* %input, metadata !15, metadata !DIExpression()), !dbg !20
  %arraydecay = getelementptr inbounds [65536 x i8], [65536 x i8]* %input, i64 0, i64 0, !dbg !21
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stdin, align 8, !dbg !22
  %call = call i8* @fgets(i8* noundef %arraydecay, i32 noundef 65536, %struct._IO_FILE* noundef %0), !dbg !23
  call void @llvm.dbg.declare(metadata i32* %x, metadata !24, metadata !DIExpression()), !dbg !25
  store i32 13, i32* %x, align 4, !dbg !25
  call void @llvm.dbg.declare(metadata i32* %z, metadata !26, metadata !DIExpression()), !dbg !27
  store i32 21, i32* %z, align 4, !dbg !27
  %arraydecay1 = getelementptr inbounds [65536 x i8], [65536 x i8]* %input, i64 0, i64 0, !dbg !28
  %call2 = call i64 @strlen(i8* noundef %arraydecay1) #4, !dbg !30
  %rem = urem i64 %call2, 13, !dbg !31
  %cmp = icmp eq i64 %rem, 0, !dbg !32
  br i1 %cmp, label %if.then, label %if.end, !dbg !33

if.then:                                          ; preds = %entry
  %1 = load i32, i32* %x, align 4, !dbg !34
  %div = sdiv i32 %1, 0, !dbg !36
  store i32 %div, i32* %z, align 4, !dbg !37
  br label %if.end, !dbg !38

if.end:                                           ; preds = %if.then, %entry
  %arraydecay3 = getelementptr inbounds [65536 x i8], [65536 x i8]* %input, i64 0, i64 0, !dbg !39
  %call4 = call i64 @strlen(i8* noundef %arraydecay3) #4, !dbg !41
  %cmp5 = icmp ugt i64 %call4, 100, !dbg !42
  br i1 %cmp5, label %land.lhs.true, label %if.end10, !dbg !43

land.lhs.true:                                    ; preds = %if.end
  %arrayidx = getelementptr inbounds [65536 x i8], [65536 x i8]* %input, i64 0, i64 25, !dbg !44
  %2 = load i8, i8* %arrayidx, align 1, !dbg !44
  %conv = sext i8 %2 to i32, !dbg !44
  %cmp6 = icmp eq i32 %conv, 97, !dbg !45
  br i1 %cmp6, label %if.then8, label %if.end10, !dbg !46

if.then8:                                         ; preds = %land.lhs.true
  %3 = load i32, i32* %x, align 4, !dbg !47
  %div9 = sdiv i32 %3, 0, !dbg !49
  store i32 %div9, i32* %z, align 4, !dbg !50
  br label %if.end10, !dbg !51

if.end10:                                         ; preds = %if.then8, %land.lhs.true, %if.end
  ret i32 0, !dbg !52
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare i8* @fgets(i8* noundef, i32 noundef, %struct._IO_FILE* noundef) #2

; Function Attrs: nounwind readonly willreturn
declare i64 @strlen(i8* noundef) #3

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind readonly willreturn }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!2, !3, !4, !5, !6, !7, !8}
!llvm.ident = !{!9}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Ubuntu clang version 14.0.0-1ubuntu1.1", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "easy2.c", directory: "/home/edinella/Documents/BMC-CS-383-SA.github.io/hws/hw02/test", checksumkind: CSK_MD5, checksum: "15202289042b47c2b07bd36e8e586475")
!2 = !{i32 7, !"Dwarf Version", i32 5}
!3 = !{i32 2, !"Debug Info Version", i32 3}
!4 = !{i32 1, !"wchar_size", i32 4}
!5 = !{i32 7, !"PIC Level", i32 2}
!6 = !{i32 7, !"PIE Level", i32 2}
!7 = !{i32 7, !"uwtable", i32 1}
!8 = !{i32 7, !"frame-pointer", i32 2}
!9 = !{!"Ubuntu clang version 14.0.0-1ubuntu1.1"}
!10 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 4, type: !11, scopeLine: 4, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !14)
!11 = !DISubroutineType(types: !12)
!12 = !{!13}
!13 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!14 = !{}
!15 = !DILocalVariable(name: "input", scope: !10, file: !1, line: 5, type: !16)
!16 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 524288, elements: !18)
!17 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!18 = !{!19}
!19 = !DISubrange(count: 65536)
!20 = !DILocation(line: 5, column: 8, scope: !10)
!21 = !DILocation(line: 6, column: 9, scope: !10)
!22 = !DILocation(line: 6, column: 31, scope: !10)
!23 = !DILocation(line: 6, column: 3, scope: !10)
!24 = !DILocalVariable(name: "x", scope: !10, file: !1, line: 7, type: !13)
!25 = !DILocation(line: 7, column: 7, scope: !10)
!26 = !DILocalVariable(name: "z", scope: !10, file: !1, line: 8, type: !13)
!27 = !DILocation(line: 8, column: 7, scope: !10)
!28 = !DILocation(line: 10, column: 14, scope: !29)
!29 = distinct !DILexicalBlock(scope: !10, file: !1, line: 10, column: 7)
!30 = !DILocation(line: 10, column: 7, scope: !29)
!31 = !DILocation(line: 10, column: 21, scope: !29)
!32 = !DILocation(line: 10, column: 26, scope: !29)
!33 = !DILocation(line: 10, column: 7, scope: !10)
!34 = !DILocation(line: 11, column: 9, scope: !35)
!35 = distinct !DILexicalBlock(scope: !29, file: !1, line: 10, column: 32)
!36 = !DILocation(line: 11, column: 11, scope: !35)
!37 = !DILocation(line: 11, column: 7, scope: !35)
!38 = !DILocation(line: 12, column: 3, scope: !35)
!39 = !DILocation(line: 14, column: 14, scope: !40)
!40 = distinct !DILexicalBlock(scope: !10, file: !1, line: 14, column: 7)
!41 = !DILocation(line: 14, column: 7, scope: !40)
!42 = !DILocation(line: 14, column: 21, scope: !40)
!43 = !DILocation(line: 14, column: 27, scope: !40)
!44 = !DILocation(line: 14, column: 30, scope: !40)
!45 = !DILocation(line: 14, column: 40, scope: !40)
!46 = !DILocation(line: 14, column: 7, scope: !10)
!47 = !DILocation(line: 15, column: 9, scope: !48)
!48 = distinct !DILexicalBlock(scope: !40, file: !1, line: 14, column: 48)
!49 = !DILocation(line: 15, column: 11, scope: !48)
!50 = !DILocation(line: 15, column: 7, scope: !48)
!51 = !DILocation(line: 16, column: 3, scope: !48)
!52 = !DILocation(line: 18, column: 3, scope: !10)
