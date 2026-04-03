#!/usr/bin/env perl

# 1. コンパイルエンジンの指定 (LuaLaTeX)
$pdf_mode = 1; # 4はLuaLaTeXによる直接PDF生成を意味します
$lualatex = 'lualatex -synctex=1 -halt-on-error -file-line-error %O %S';
$max_repeat = 5;

# 2. 参考文献処理 (Unicode対応ツールへ変更)
$bibtex = 'upbibtex %O %S';
$biber = 'biber --bblencoding=utf8 -u -U --output_safechars %O %S';

# 3. 索引作成 (Unicode対応ツールへ変更)
$makeindex = 'upmendex %O -o %D %S';

# 4. プレビューアの設定 (PDFのみに簡略化)
$pvc_view_file_via_temporary = 0;
if ($^O eq 'linux') {
    $pdf_previewer = "xdg-open %S";
} elsif ($^O eq 'darwin') {
    $pdf_previewer = "open %S";
} else {
    $pdf_previewer = "start %S";
}

# 5. クリーンアップ対象
$clean_full_ext = "%R.synctex.gz";