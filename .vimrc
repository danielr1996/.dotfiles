set hlsearch
set nu
syntax on
set tabstop=4 softtabstop=0 noexpandtab shiftwidth=4
au BufRead,BufNewFile /etc/nginx/*,/usr/local/nginx/conf/* if &ft == '' | setfiletype nginx | endi
