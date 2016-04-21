"au BufRead,BufNewFile /etc/nginx/*,/usr/local/nginx/conf/* if &ft == '' | setfiletype nginx | endi
"au BufNewFile, BufRead *.conf set filetype=nginx
au BufRead, BufNewFile /etc/nginx*, /usr/local/nginx/conf/* if &ft == '' | set filetype nginx | endif
