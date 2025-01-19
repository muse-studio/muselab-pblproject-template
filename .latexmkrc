#!/usr/bin/env perl
$latex                       = 'xeLaTeX -synctex=1 -halt-on-error -interaction=nonstopmode -file-line-error';
$latex_silent                = 'xeLaTeX -synctex=1 -halt-on-error -interaction=nonstopmode -file-line-error';
$bibtex                      = 'upbibtex -kanji=utf8 -synctex=1';
$dvipdf                      = 'dvipdfmx %O -o %D %S';
$max_repeat                  = 6;
$pdf_mode                    = 3;
$pvc_view_file_via_temporary = 0;

