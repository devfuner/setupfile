
""""""""""""""""""""""""""""""""""""""""""""""""
"  �⺻ ����
""""""""""""""""""""""""""""""""""""""""""""""""

" ���Ե� ������ ���ڵ����� �ڵ� �������ش�.
set fencs=ucs-bom,utf-8,cp949

" �ڵ� �鿩���⸦ �����մϴ�.
set ai

" ��� �Ҹ��� ȭ�� ���������� ��ü
set visualbell

" �鿩���� ���� ���մϴ�.
set shiftwidth=4

" ���� ���� ���մϴ�.
set tabstop=4

" ���� �����̽��� ��ü�մϴ�.
set et

" ���� �����̽��� ��ü���� �ʴ´�.
" set noet
" set sts=0

" C�� ������ �°� �鿩���� �մϴ�
set cindent

" ���μ��� ǥ���� �ݴϴ�
set nu

" �� ��ȣ ǥ�� �ʺ� ����(vim7)
" set nuw=5

" �� ���Ͽ� �ش��ϴ� ����(Syntax)�� ��������ݴϴ�.
" C�� Java�� ���� �����..
syntax on

" ���� ������ undo �Ҽ� �ִ� �ִ� Ƚ�� ����
set history=100

" �Լ� �ݱ�ǥ��
set sm

" Ÿ���ν� ���콺 Ŀ�� ���߱�
set mousehide

" �ּ��� 2�� ���Ϸδ� �ڵ� ��ũ��
set scrolloff=2

" ���ǵǾ��� ������ �����ؼ� �����ݴϴ�
" colors sdh

" 76��° ĭ�� �Ѿ�� �ڵ� �ٹٲ�
" set textwidth=76

" �ڵ� �ٹٲ� ����
" set nowrap

" ������� �������� �ʵ��� ����
set nobackup

" �˻��� ���� ���̶���Ʈ
set hls

" �˻��� ���ڿ� ���̶���Ʈ �� ����
" set Search term=reverse ctermfg=0 ctermbg=3

" �˻��� ���� ������ ó������ �ǵ����� ����
set nows

" �˻��� ��ҹ��ڸ� �������� ����
" set ic

" �ȶ��� ��ҹ��� ���� ��� ���
" set scs

" �� ������ ������ �տ� �ּ� ǥ��/����
map <F3> :norm i// <CR>
map <F4> :norm 3x<CR>

" �ڵ� ����. { �� �����ؼ� } �� ������ �κ� ����
map <F7> v]}zf

" ������. ���� �κ��� Ǯ��
map <F8> zo

" ���� ����. ���� �����ؼ� ����
map <F9> zf

" ��뱸 ����
" �Ϲ������� ��ü ���ڷ� ��������� VI ���� ��ɵ��� ����� ���� �ִ�
ab IF_ #if define
ab xdate <C-R>=strftime("%Y.%m.%d")<CR>
iab xtime <C-R>=strftime("%H:%M:%S")<CR>

" ���� ���� �̵� ���۽� ���� �������� �ڵ� �̵�
" set sol

" ��ũ�� �����߿� ȭ���� �ٽ� �׸��� ����
set lz

" �� ���� ȭ������.
map <F5> :tabp<CR>

" �� ���� ȭ������.
" map <F6> :tabn<CR>
map <F6> :tabnew<CR>

colorscheme default " vim
" colorscheme desert " gvim

" ESCŰ�� ������ �ѱ� ��尡 ����
" �Է¸�忡�� ���� ��� ���� ��� ����?
inoremap <ESC> <ESC>:set imdisable<CR>
" nnoremap i :set noimd<CR>i
" nnoremap I :set noimd<CR>I
" nnoremap a :set noimd<CR>a
" nnoremap A :set noimd<CR>A
" nnoremap o :set noimd<CR>o
" nnoremap O :set noimd<CR>O


""""""""""""""""""""""""""""""""""""""""""""""""
" GUI ����
""""""""""""""""""""""""""""""""""""""""""""""""
" ��Ʈ ����. ��Ʈ�� ��Ʈ ũ�⸦ �����Ѵ�.
if has( "gui_running" )
set gfn=ProFontWindows:h12
" set gfn=gulimche:h12
" set gfn=sans-serif12
" set gfn=Lucida_Console:h12
" set gfn=����ü12
" set gfn=Terminal12

" �ʱ� VI ���۽� ũ�� ���� w * h
au GUIEnter * winsize 90 50

" �ʱ� VI ���� ��ġ ����
au GUIEnter * winpos 550 0
endif


 
function! InsertTabWrapper()
        let col = col('.') - 1
            if !col || getline('.')[col-1]!~'\k'
                    return "\<TAB>"
                        else
                            if pumvisible()
            return "\<C-N>"
                else
                        return "\<C-N>\<C-P>"
                                end
                                    endif
                                        endfunction
                                        inoremap <TAB> <C-R>=InsertTabWrapper()<CR>
                                        inoremap <EXPR> <CR> pumvisible() ? "<C-Y><CR>" : "<CR>"
