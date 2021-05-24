let g:root = "~/dotfile/vim"

function! SourceLocal(relativePath)

	let fullPath = g:root . '/'. a:relativePath
	exec 'source ' . fullPath

endfunction


" Plugin
call SourceLocal("plugin.vim")

" Theme ( & Airline )
call SourceLocal("theme.vim")

" Coc.nvim
call SourceLocal("coc.vim")

" NerdTree
call SourceLocal("nerdtree.vim")

" Startift

call SourceLocal("startify.vim")

" system copy
call SourceLocal("sys_copy.vim")

" Others
set autoindent
set noexpandtab
set tabstop=2
set shiftwidth=2

nnoremap <silent> <C-q> :CocList<CR>



