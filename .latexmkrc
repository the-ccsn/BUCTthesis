$pdf_mode = 5;
$xelatex = "xelatex -shell-escape -file-line-error -halt-on-error -interaction=nonstopmode -no-pdf -synctex=1 %O %S";
$xdvipdfmx = "xdvipdfmx -q -E -o %D %O %S";
$bibtex_use = 1.5;
$clean_ext = 'aux bbl blg fls lodf log out synctex.gz xdv fdb_latexmk hd ilg glo';