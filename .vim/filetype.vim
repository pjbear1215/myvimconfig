" my filetype file
if exists("did_load_filetypes")
	finish
endif
augroup filetypedetect
	au! BufRead,BufNewFile *.i            setfiletype cpp
	au! BufRead,BufNewFile *.ic           setfiletype cpp
	au! BufRead,BufNewFile *.proto        setfiletype proto
	au! BufRead,BufNewFile *.md           setfiletype markdown
	au! BufRead,BufNewFile *.markdown     setfiletype markdown
augroup END
