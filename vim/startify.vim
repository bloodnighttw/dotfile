let s:header = [
      \ '',
      \ '       _    _ _   ____  _                 _       _       _     _   _',
      \ '      | |  | (_) |  _ \| |               | |     (_)     | |   | | | |',
      \ '      | |__| |_  | |_) | | ___   ___   __| |_ __  _  __ _| |__ | |_| |___      __',
      \ '      |  __  | | |  _ <| |/ _ \ / _ \ / _` |  _ \| |/ _` |  _ \| __| __\ \ /\ / /',
      \ '      | |  | | | | |_) | | (_) | (_) | (_| | | | | | (_| | | | | |_| |_ \ V  V /',
      \ '      |_|  |_|_| |____/|_|\___/ \___/ \__,_|_| |_|_|\__, |_| |_|\__|\__| \_/\_/__  __',
      \ '                   /\     | |  | |               | | __/ |                    |  \/  |',
      \ '       ______     /  \    | |__| | __ _ _ __   __| ||___/___  _ __ ___   ___  | \  / | __ _ _ __',
			\ '      |______|   / /\ \   |  __  |/ _` |  _ \ / _` / __|/ _ \|  _ ` _ \ / _ \ | |\/| |/ _` |  _ \',
			\ '                / ____ \  | |  | | (_| | | | | (_| \__ \ (_) | | | | | |  __/ | |  | | (_| | | | |',
			\ '               /_/    \_\ |_|  |_|\__,_|_| |_|\__,_|___/\___/|_| |_| |_|\___| |_|  |_|\__,_|_| |_|',
			\ '',
			\ '',
			\ '',
      \ ]

let g:startify_custom_header = s:header

let g:startify_custom_footer = [
												\ '',
												\ '',
												\ '',
												\ '    HBVIM (HandsomeBoyVIM) Made by bloodnighttw.',
												\ '    Github:    https://github.com/bloodnighttw',
												\ '    FACEBOOK:  https://facebook.com/bloodnigttw.main',
												\ '    Twitter:   https://twitter.com/bloodnighttw',
												\]

function! s:gitModified()
    let files = systemlist('git ls-files -m 2>/dev/null')
    return map(files, "{'line': v:val, 'path': v:val}")
endfunction

" same as above, but show untracked files, honouring .gitignore
function! s:gitUntracked()
    let files = systemlist('git ls-files -o --exclude-standard 2>/dev/null')
    return map(files, "{'line': v:val, 'path': v:val}")
endfunction

let g:startify_lists = [
        \ { 'type': 'files',     'header': ['   MRU']            },
        \ { 'type': 'dir',       'header': ['   MRU '. getcwd()] },
        \ { 'type': 'sessions',  'header': ['   Sessions']       },
        \ { 'type': 'bookmarks', 'header': ['   Bookmarks']      },
        \ { 'type': function('s:gitModified'),  'header': ['   git modified']},
        \ { 'type': function('s:gitUntracked'), 'header': ['   git untracked']},
        \ { 'type': 'commands',  'header': ['   Commands']       },
        \ ]