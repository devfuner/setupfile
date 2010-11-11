
""""""""""""""""""""""""""""""""""""""""""""""""
"  기본 설정
""""""""""""""""""""""""""""""""""""""""""""""""

" 열게된 문서의 인코딩으로 자동 설정해준다.
set fencs=ucs-bom,utf-8,cp949

" 자동 들여쓰기를 설정합니다.
set ai

" 경고 소리를 화면 깜빡임으로 대체
set visualbell

" 들여쓰기 폭을 정합니다.
set shiftwidth=4

" 탭의 폭을 정합니다.
set tabstop=4

" 탭을 스페이스로 대체합니다.
set et

" 탭을 스페이스로 대체하지 않는다.
" set noet
" set sts=0

" C의 구문에 맞게 들여쓰기 합니다
set cindent

" 라인수를 표시해 줍니다
set nu

" 줄 번호 표시 너비 설정(vim7)
" set nuw=5

" 각 파일에 해당하는 문법(Syntax)를 적용시켜줍니다.
" C나 Java등 사용시 색상등..
syntax on

" 파일 편집시 undo 할수 있는 최대 횟수 설정
set history=100

" 함수 닫기표시
set sm

" 타이핑시 마우스 커서 감추기
set mousehide

" 최소한 2줄 이하로는 자동 스크롤
set scrolloff=2

" 정의되어진 색상을 선택해서 보여줍니다
" colors sdh

" 76번째 칸을 넘어가면 자동 줄바꿈
" set textwidth=76

" 자동 줄바꿈 안함
" set nowrap

" 백업파일 생성되지 않도록 설정
set nobackup

" 검색된 문자 하이라이트
set hls

" 검색된 문자열 하이라이트 색 설정
" set Search term=reverse ctermfg=0 ctermbg=3

" 검색시 파일 끝에서 처음으로 되돌리기 안함
set nows

" 검색시 대소문자를 구별하지 않음
" set ic

" 똑똑한 대소문자 구별 기능 사용
" set scs

" 블럭 지정된 문단의 앞에 주석 표시/삭제
map <F3> :norm i// <CR>
map <F4> :norm 3x<CR>

" 자동 폴딩. { 로 시작해서 } 로 끝나는 부분 접기
map <F7> v]}zf

" 언폴딩. 접힌 부분을 풀기
map <F8> zo

" 수동 폴딩. 블럭을 지정해서 접기
map <F9> zf

" 상용구 설정
" 일반적으로 대체 문자로 사용하지만 VI 제공 기능들을 사용할 수도 있다
ab IF_ #if define
ab xdate <C-R>=strftime("%Y.%m.%d")<CR>
iab xtime <C-R>=strftime("%H:%M:%S")<CR>

" 여러 가지 이동 동작시 줄의 시작으로 자동 이동
" set sol

" 매크로 실행중에 화면을 다시 그리지 않음
set lz

" 탭 이전 화면으로.
map <F5> :tabp<CR>

" 탭 이전 화면으로.
" map <F6> :tabn<CR>
map <F6> :tabnew<CR>

colorscheme default " vim
" colorscheme desert " gvim

" ESC키를 누르면 한글 모드가 해제
" 입력모드에서 이전 언어 설정 모드 유지?
inoremap <ESC> <ESC>:set imdisable<CR>
" nnoremap i :set noimd<CR>i
" nnoremap I :set noimd<CR>I
" nnoremap a :set noimd<CR>a
" nnoremap A :set noimd<CR>A
" nnoremap o :set noimd<CR>o
" nnoremap O :set noimd<CR>O


""""""""""""""""""""""""""""""""""""""""""""""""
" GUI 설정
""""""""""""""""""""""""""""""""""""""""""""""""
" 폰트 설정. 폰트와 폰트 크기를 지정한다.
if has( "gui_running" )
set gfn=ProFontWindows:h12
" set gfn=gulimche:h12
" set gfn=sans-serif12
" set gfn=Lucida_Console:h12
" set gfn=돋음체12
" set gfn=Terminal12

" 초기 VI 시작시 크기 설정 w * h
au GUIEnter * winsize 90 50

" 초기 VI 시작 위치 설정
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
