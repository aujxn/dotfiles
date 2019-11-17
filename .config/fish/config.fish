abbr -a p 'sudo pacman'
abbr -a up 'sudo pacman -Syu'
abbr -a e 'nvim'
abbr -a hw 'cp $HOME/Documents/school/latex-homework-template/homework.tex .'
abbr -a config '/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'


if command -v exa > /dev/null
   abbr -a l 'exa'
   abbr -a ls 'exa'
   abbr -a ll 'exa -l'
   abbr -a lll 'exa -la'
else
   abbr -a l 'ls'
   abbr -a ll 'ls -l'
   abbr -a lll 'ls -la'
end


set -x RUST_BACKTRACE 1
   

