% muselabunsrt.bst 28-Oct-10 by Hiroshi Nakashima (ver 3.00)
% 修正版: 全角記号およびUTF-8文字対応

ENTRY
  { address
    author
    booktitle
    chapter
    doi
    edition
    editor
    howpublished
    institution
    journal
    key
    month
    note
    number
    organization
    pages
    publisher
    refdate
    school
    series
    title
    type
    url
    volume
    year
    yomi
  }
  {}
  { label }

INTEGERS { output.state before.all mid.sentence after.sentence after.block }

FUNCTION {init.state.consts}
{
  #0 'before.all :=
  #1 'mid.sentence :=
  #2 'after.sentence :=
  #3 'after.block :=
}

% 条件付き修正: `_yoko.tex` の場合にのみ全角記号処理を適用
FUNCTION {is-yoko-file}
{
  % citeキーが `_yoko` を含む場合に true を返す
  cite$ "yoko" substring$ = 
}

% 修正用関数: 全角記号をエスケープ
FUNCTION {fix-fullwidth-symbols}
{
  { 
    "：" "\string:" swap$ text.prefix$ 
    "〜" "\textasciitilde{}" swap$ text.prefix$ 
  } while$
}

% タイトル処理の修正
FUNCTION {format.title}
{
  title empty$
    { "" }
    { 
      is-yoko-file 
        { fix-fullwidth-symbols title }
        { title }
      if$
    }
}

% 著者処理の修正
FUNCTION {format.author}
{
  author empty$
    { "" }
    { 
      is-yoko-file 
        { fix-fullwidth-symbols author }
        { author }
      if$
    }
}

% 参考文献のフォーマット
FUNCTION {output.bibitem}
{
  newline$
  "\bibitem{" write$
  cite$ write$
  "}" write$
  newline$
  format.author write$
  format.title write$
  % 他のフィールド処理...
}

% 他の既存関数はそのまま保持
