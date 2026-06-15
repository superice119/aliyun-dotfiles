#!/bin/bash

# ==========================================
# 打印漂亮的欢迎界面
# ==========================================
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo " 🚀 开始自动化配置服务器环境 (Bash & Vim) "
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"

# ==========================================
# 1. 写入个性化 Vim 配置文件 (~/.vimrc)
# ==========================================
echo "-> 正在配置 Vim..."

cat << 'EOF' > ~/.vimrc
set nocompatible        " 不兼容 vi，启用 vim 特性
syntax on               " 开启语法高亮
set number              " 显示行号
set relativenumber      " 相对行号，方便跳转
set cursorline          " 高亮当前行
set showcmd             " 显示输入的命令
set showmode            " 显示当前模式
set ruler               " 显示光标位置
set laststatus=2        " 总是显示状态栏

" =========================
" 缩进与格式化
" =========================
set tabstop=4           " Tab 显示为 4 空格
set shiftwidth=4        " 自动缩进宽度 4
set expandtab           " Tab 转换为空格
set autoindent          " 自动缩进
set smartindent         " 智能缩进

" =========================
" 搜索
" =========================
set ignorecase          " 搜索忽略大小写
set smartcase           " 如果有大写字母则区分大小写
set hlsearch            " 高亮搜索结果
set incsearch           " 输入时动态匹配

" =========================
" 文件与编码
" =========================
set encoding=utf-8
set fileencodings=utf-8,ucs-bom,gbk,cp936,latin1
set fileformat=unix
set fileformats=unix,dos,mac

" =========================
" 界面优化
" =========================
set background=dark     " 适合深色终端
set termguicolors       " 支持 24bit 真彩色
set wrap                " 自动折行
set linebreak           " 按单词换行

" =========================
" 快捷键（简单好用）
" ==========================
nnoremap <C-s> :w<CR>   " Ctrl+s 保存
inoremap <C-s> <Esc>:w<CR>a
nnoremap <C-q> :q<CR>   " Ctrl+q 退出
nnoremap <C-a> ggVG     " Ctrl+a 全选
EOF

# ==========================================
# 2. 写入自定义 Shell 配置文件 (~/.bash_aliases)
# ==========================================
echo "-> 正在配置 Bash 提示符与快捷别名..."

cat << 'EOF' > ~/.bash_aliases
# 优雅的极简彩色提示符 (隐藏主机名，只显末级目录)
PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u:\[\033[01;34m\]\W\[\033[00m\]\$ '

# 效率提升快照
alias ..='cd ..'
alias ...='cd ../..'
alias c='clear'
alias path='echo -e ${PATH//:/\\n}'

# 安全防护（覆盖前提示）
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
EOF

# ==========================================
# 3. 安全锁：确保 ~/.bashrc 会加载 ~/.bash_aliases
# ==========================================
if ! grep -q "bash_aliases" ~/.bashrc; then
    echo -e "\n# 自动加载自定义的别名与 PS1" >> ~/.bashrc
    echo "if [ -f ~/.bash_aliases ]; then . ~/.bash_aliases; fi" >> ~/.bashrc
fi

# ==========================================
# 4. 生效配置
# ==========================================
source ~/.bashrc

echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo " ✅ 配置完成！优雅的 PS1 和高级 Vim 已就绪。"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"

